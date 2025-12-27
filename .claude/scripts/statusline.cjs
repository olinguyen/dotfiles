const { readFileSync } = require('node:fs');
const { basename } = require('node:path');
const { execSync } = require('node:child_process');
const { getGitInfo } = require('./statusline-git.cjs');
const CONFIG = require('./statusline-config.cjs');

function sanitizePath(path) {
  if (!path || path.includes('..') || path.length > 1000) return null;
  if (!/^[a-zA-Z0-9/_. -]+$/.test(path)) return null;
  return path;
}

function validateStatusInput(input) {
  if (!input || typeof input !== 'object') return {};
  const obj = input;
  const result = {};

  if (typeof obj.session_id === 'string' && obj.session_id.length < 100) {
    result.session_id = obj.session_id;
  }
  if (typeof obj.cwd === 'string') {
    const sanitized = sanitizePath(obj.cwd);
    if (sanitized) result.cwd = sanitized;
  }
  if (typeof obj.version === 'string' && obj.version.length < 50) {
    result.version = obj.version;
  }

  if (obj.model && typeof obj.model === 'object' && obj.model !== null) {
    const model = obj.model;
    const modelResult = {};
    if (typeof model.display_name === 'string' && model.display_name.length < 100) {
      modelResult.display_name = model.display_name;
    }
    if (typeof model.id === 'string' && model.id.length < 100) {
      modelResult.id = model.id;
    }
    if (Object.keys(modelResult).length > 0) result.model = modelResult;
  }

  if (obj.workspace && typeof obj.workspace === 'object' && obj.workspace !== null) {
    const workspace = obj.workspace;
    const workspaceResult = {};
    if (typeof workspace.current_dir === 'string') {
      const sanitized = sanitizePath(workspace.current_dir);
      if (sanitized) workspaceResult.current_dir = sanitized;
    }
    if (typeof workspace.project_dir === 'string') {
      const sanitized = sanitizePath(workspace.project_dir);
      if (sanitized) workspaceResult.project_dir = sanitized;
    }
    if (Object.keys(workspaceResult).length > 0) result.workspace = workspaceResult;
  }

  return result;
}

let gitCache = null;

function getCachedGitInfo(cwd) {
  const now = Date.now();
  if (gitCache && gitCache.cwd === cwd && (now - gitCache.timestamp) < CONFIG.GIT_CACHE_TTL) {
    return gitCache.result;
  }

  const result = getGitInfo(cwd, CONFIG);
  gitCache = { cwd, result, timestamp: now };
  return result;
}

// Truncate path to last N components, with ~ for home
function formatPath(path, maxComponents = 3) {
  const home = process.env.HOME;
  let display = path;

  if (home && path.startsWith(home)) {
    display = '~' + path.slice(home.length);
  }

  const parts = display.split('/').filter(Boolean);
  if (parts.length > maxComponents) {
    return parts.slice(-maxComponents).join('/');
  }
  return display;
}

function buildProjectSection(currentDir, git) {
  const { COLORS, ICONS, FEATURES } = CONFIG;
  let section = '';

  if (FEATURES.SHOW_PROJECT) {
    const dirDisplay = formatPath(currentDir);
    section = `${COLORS.PROJECT}${ICONS.PROJECT} ${dirDisplay}${COLORS.RESET}`;
  }

  if (FEATURES.SHOW_GIT_BRANCH && git) {
    section += ` on ${COLORS.BRANCH}${ICONS.BRANCH} ${git.branch}${COLORS.RESET}`;
  }

  return section;
}

function buildGitStatusSection(git) {
  const { FEATURES } = CONFIG;
  if (!git) return null;

  // Starship-style: [+!✘?] inline status indicators
  const parts = [];
  if (FEATURES.SHOW_GIT_STAGED && git.staged) parts.push(git.staged);
  if (FEATURES.SHOW_GIT_MODIFIED && git.modified) parts.push(git.modified);
  if (FEATURES.SHOW_GIT_DELETED && git.deleted) parts.push(git.deleted);
  if (FEATURES.SHOW_GIT_UNTRACKED && git.untracked) parts.push(git.untracked);

  if (parts.length === 0) return null;
  return `[${parts.join('')}]`;
}

function buildGitSyncSection(git) {
  const { FEATURES } = CONFIG;
  if (!git) return null;

  const parts = [];
  if (FEATURES.SHOW_GIT_AHEAD && git.ahead) parts.push(git.ahead);
  if (FEATURES.SHOW_GIT_BEHIND && git.behind) parts.push(git.behind);
  return parts.length > 0 ? parts.join('') : null;
}

function buildModelSection(modelName) {
  const { COLORS, ICONS } = CONFIG;
  return `${COLORS.MODEL}${ICONS.MODEL} ${modelName}${COLORS.RESET}`;
}

function buildContextSection(rawInput) {
  const { FEATURES } = CONFIG;
  if (!FEATURES.SHOW_CONTEXT || !rawInput) {
    return null;
  }

  try {
    const result = execSync('bunx ccstatusline', {
      input: rawInput,
      encoding: 'utf-8',
      timeout: 5000,
      stdio: ['pipe', 'pipe', 'ignore']
    }).trim();

    if (result) {
      return result;
    }
  } catch {
    return null;
  }

  return null;
}

function buildCharSection() {
  const { COLORS, ICONS } = CONFIG;
  return `${COLORS.CHAR}${ICONS.CHAR}${COLORS.RESET}`;
}

function separator() {
  const { COLORS } = CONFIG;
  return `${COLORS.DIM}|${COLORS.RESET}`;
}

function buildNoWorkspaceStatus(modelName) {
  const { COLORS, ICONS } = CONFIG;
  return `${COLORS.PROJECT}${ICONS.PROJECT} No workspace${COLORS.RESET} ${separator()} ${buildModelSection(modelName)}`;
}

function buildStatus(input, rawInput) {
  const { FEATURES } = CONFIG;
  const modelName = input.model?.display_name || 'Claude';
  const currentDir = input.workspace?.current_dir;

  if (!currentDir) return buildNoWorkspaceStatus(modelName);

  const needsGitInfo = FEATURES.SHOW_GIT_BRANCH || FEATURES.SHOW_GIT_AHEAD || FEATURES.SHOW_GIT_BEHIND || FEATURES.SHOW_GIT_STAGED || FEATURES.SHOW_GIT_MODIFIED || FEATURES.SHOW_GIT_DELETED || FEATURES.SHOW_GIT_UNTRACKED;
  const git = needsGitInfo ? getCachedGitInfo(currentDir) : null;

  // Build Starship-style output: dir on  branch [+!?] ↑1↓2 │ model │ context ✦
  const sections = [];

  // Section 1: Project + git branch + status
  let projectPart = buildProjectSection(currentDir, git);
  const statusSection = buildGitStatusSection(git);
  if (statusSection) projectPart += ` ${statusSection}`;
  const syncSection = buildGitSyncSection(git);
  if (syncSection) projectPart += ` ${syncSection}`;
  sections.push(projectPart);

  // Section 2: Model
  if (FEATURES.SHOW_MODEL) {
    sections.push(buildModelSection(modelName));
  }

  // Section 3: Context
  const contextSection = buildContextSection(rawInput);
  if (contextSection) sections.push(contextSection);

  // Join with separator
  return sections.join(` ${separator()} `);
}

function getDefaultInput() {
  return { model: { display_name: 'Claude' } };
}

function readStdin() {
  try {
    const input = readFileSync(process.stdin.fd, 'utf-8');
    if (input.length > 10000) return { validated: getDefaultInput(), raw: null };
    const parsed = JSON.parse(input);
    return { validated: validateStatusInput(parsed), raw: input };
  } catch (error) {
    if (error.code === 'EAGAIN' || error.code === 'ENOTTY' || error.code === 'EINVAL') {
      return { validated: getDefaultInput(), raw: null };
    }
    return { validated: getDefaultInput(), raw: null };
  }
}

function formatOutput(output) {
  const { COLORS } = CONFIG;
  return `${COLORS.DIM}[${COLORS.RESET} ${output} ${COLORS.DIM}]${COLORS.RESET}`;
}

function getErrorOutput() {
  const { COLORS } = CONFIG;
  return formatOutput(`${COLORS.PROJECT}Status error${COLORS.RESET}`);
}

async function main() {
  try {
    const { validated, raw } = readStdin();
    const output = buildStatus(validated, raw);
    console.log(formatOutput(output));
    process.exit(0);
  } catch {
    console.log(getErrorOutput());
    process.exit(0);
  }
}

main();
