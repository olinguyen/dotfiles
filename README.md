# Dotfiles

Personal configuration files for a modern terminal development environment.

## What's Included

| Config | Description |
|--------|-------------|
| [fish](fish/) | Fish shell with abbreviations, functions, and keybindings |
| [nvim](nvim/) | Neovim config built on LazyVim |
| [tmux](.tmux.conf) | Tmux with Catppuccin theme and plugins |
| [starship](starship.toml) | Cross-shell prompt |
| [git](.gitconfig) | Git config with delta for diffs |
| [ghostty](ghostty/) | Ghostty terminal config |
| [atuin](atuin/) | Shell history sync |

## Quick Start

### Amazon Linux 2023

```bash
# Clone the repo
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles

# Run the installer
./install-al2023.sh

# Copy configs
cp -r fish/* ~/.config/fish/
cp -r nvim ~/.config/
cp starship.toml ~/.config/
cp .tmux.conf ~/
cp .gitconfig ~/
cp .bash_aliases ~/

# Change shell to fish
chsh -s $(which fish)

# Install tmux plugins (start tmux, then press prefix + I)
tmux
```

### macOS (Manual)

```bash
# Install dependencies with Homebrew
brew install fish neovim tmux starship zoxide fzf eza bat ripgrep fd sd mise

# Copy configs (same as above)
# ...
```

## Tools

### Shell & Navigation
- **fish** - Primary shell
- **starship** - Prompt
- **zoxide** - Smart `cd` replacement (`z`)
- **fzf** - Fuzzy finder
- **atuin** - Shell history

### Modern CLI Replacements
| Classic | Modern | Description |
|---------|--------|-------------|
| `ls` | `eza` | File listing with icons |
| `cat` | `bat` | Syntax-highlighted file viewer |
| `grep` | `rg` | Fast recursive search |
| `find` | `fd` | Fast file finder |
| `sed` | `sd` | Intuitive find & replace |
| `diff` | `delta` | Git diff viewer |

### Development
- **neovim** - Editor
- **tmux** - Terminal multiplexer
- **mise** - Runtime version manager (replaces nvm, pyenv, etc.)

## Key Features

### Fish Shell
- Git abbreviations (`gs`, `gc`, `gd`, `gp`, etc.)
- Worktree helpers (`gwa`, `gwl`, `gwcd`, `gwd`)
- Quick dotfile editing (`dotfile fish`, `dotfile tmux`)
- Tmux session manager (`t [session]`)

See [fish/README.md](fish/README.md) for full documentation.

### Neovim
- LazyVim base with custom plugins
- Diffview for git diffs
- Zen mode for focused editing
- Obsidian integration

See [nvim/README.md](nvim/README.md) for keymaps and plugins.

### Tmux
- Prefix: `Ctrl-Space`
- Catppuccin theme
- Plugins: session persistence, clipboard, fzf, URL opening

### Git
- Delta for side-by-side diffs with syntax highlighting
- zdiff3 merge conflict style

## Structure

```
dotfiles/
├── fish/               # Fish shell config
│   ├── config.fish
│   ├── conf.d/         # Modular config files
│   └── functions/      # Custom functions
├── nvim/               # Neovim config
│   ├── init.lua
│   └── lua/
├── ghostty/            # Ghostty terminal
├── atuin/              # Shell history
├── .tmux.conf          # Tmux config
├── .gitconfig          # Git config
├── .bash_aliases       # Bash aliases (fallback)
├── starship.toml       # Starship prompt
└── install-al2023.sh   # Amazon Linux installer
```

## Private Config

For machine-specific or work config, create:
```
~/.config/fish.private/
├── conf.d/
│   └── work.fish
└── functions/
```

These are automatically sourced by fish if present.
