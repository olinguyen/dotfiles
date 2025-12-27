module.exports = {
  GIT_CACHE_TTL: 1000,

  FEATURES: {
    SHOW_PROJECT: true,
    SHOW_GIT_BRANCH: true,
    SHOW_GIT_AHEAD: true,
    SHOW_GIT_BEHIND: true,
    SHOW_GIT_STAGED: true,
    SHOW_GIT_MODIFIED: true,
    SHOW_GIT_DELETED: true,
    SHOW_GIT_UNTRACKED: true,
    SHOW_MODEL: true,
    SHOW_CONTEXT: true,
  },

  // Starship-inspired colors
  COLORS: {
    PROJECT: '\x1b[1;34m',      // Bold blue (directory)
    BRANCH: '\x1b[1;35m',       // Bold purple (git branch)
    GIT_AHEAD: '\x1b[32m',      // Green
    GIT_BEHIND: '\x1b[31m',     // Red
    GIT_STAGED: '\x1b[32m',     // Green
    GIT_MODIFIED: '\x1b[33m',   // Yellow
    GIT_DELETED: '\x1b[31m',    // Red
    GIT_UNTRACKED: '\x1b[31m',  // Red
    MODEL: '\x1b[36m',          // Cyan
    CHAR: '\x1b[1;32m',         // Bold green (character symbol)
    DIM: '\x1b[2m',             // Dim
    RESET: '\x1b[0m'
  },

  // Starship-inspired icons
  ICONS: {
    PROJECT: '◈',
    BRANCH: '⎇',
    GIT_AHEAD: '↑',
    GIT_BEHIND: '↓',
    GIT_STAGED: '+',
    GIT_MODIFIED: '~',
    GIT_DELETED: '✘',
    GIT_UNTRACKED: '?',
    MODEL: '⌘',
    CHAR: '✦'
  },
};
