# Neovim Configuration

Personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## Structure

```
nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua  # Auto commands
│   │   ├── keymaps.lua   # Custom key mappings
│   │   ├── lazy.lua      # Plugin manager setup
│   │   └── options.lua   # Vim options
│   └── plugins/          # Plugin configurations
└── lazyvim.json          # LazyVim extras config
```

## LazyVim Extras

- `coding.mini-surround` - Surround text objects
- `lang.markdown` - Markdown support
- `lang.python` - Python development
- `lang.sql` - SQL support

## Custom Keymaps

| Key | Action |
|-----|--------|
| `;` | Enter command mode (`:`) |
| `<C-y>` | Scroll up 3 lines |
| `<C-e>` | Scroll down 3 lines |
| `<leader>m` | Maximize/restore window |
| `<leader>z` | Toggle Zen Mode |

### Git (Diffview)

| Key | Action |
|-----|--------|
| `<leader>gd` | Diff index vs working tree |
| `<leader>gw` | Diff tracked files only |
| `<leader>gD` | Diff origin..HEAD |
| `<leader>gh` | Current file history |
| `<leader>gH` | Repository history |
| `<leader>gT` | Toggle files panel |
| `<leader>gF` | Focus files panel |

## Plugins

| Plugin | Purpose |
|--------|---------|
| [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) | Obsidian vault integration |
| [vim-maximizer](https://github.com/szw/vim-maximizer) | Window maximize toggle |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer |
| [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) | Distraction-free editing |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/linter installer |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Async linting |

## Treesitter Languages

Python, Lua, Bash, JSON, YAML, Vim, Markdown

## Mason Tools

- `stylua` - Lua formatter
- `shellcheck` - Shell script linter
- `shfmt` - Shell script formatter
- `flake8` - Python linter

## Installation

1. Back up existing config:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this config:
   ```bash
   git clone <repo-url> ~/.config/nvim
   ```

3. Start Neovim - plugins will install automatically.
