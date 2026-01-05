# Global Claude Code Instructions

## Installed CLI Tools

Use: `fd` (find), `sd` (sed), `rg` (ripgrep), `jq` (JSON)

## Bash Tool Exceptions

Always prefer built-in tools (Glob, Grep, Read, Edit). Use Bash only for:

| Scenario | Tool | Example |
|----------|------|---------|
| Filter files by time | `fd` | `fd . --changed-within 1d` |
| Filter files by size | `fd` | `fd . --size +10m` |
| Execute on found files | `fd` | `fd -e pyc -x rm` |
| Bulk find/replace | `sd` | `fd -e py \| xargs sd 'old' 'new'` |
| Search results in pipeline | `rg` | `rg -l 'pattern' \| xargs sd 'old' 'new'` |
| JSON processing in pipeline | `jq` | `rg -l 'config' \| xargs cat \| jq '.key'` |
