# Fish Shell Configuration

My fish shell configuration with abbreviations, functions, and keybindings.

## Structure

```
fish/
├── config.fish              # Main config (env vars, PATH, tool init)
├── conf.d/
│   ├── 00_path.fish         # Homebrew PATH setup
│   ├── abbreviations.fish   # Command abbreviations
│   └── fzf_key_bindings.fish # fzf integration
└── functions/
    ├── compress.fish        # Archive compression
    ├── dotfile.fish         # Quick edit dotfiles
    ├── extract.fish         # Archive extraction
    ├── gacp.fish            # Git add, commit, push
    ├── gwa.fish             # Git worktree add
    ├── gwcd.fish            # Git worktree cd
    ├── gwd.fish             # Git worktree delete
    ├── gwl.fish             # Git worktree list
    ├── mkcd.fish            # mkdir + cd
    ├── pbc.fish             # Copy file to clipboard
    ├── please.fish          # Rerun last command with sudo
    └── t.fish               # tmux session manager
```

## Installation

```fish
# Symlink or copy to ~/.config/fish/
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish
ln -sf $(pwd)/fish/conf.d/* ~/.config/fish/conf.d/
ln -sf $(pwd)/fish/functions/* ~/.config/fish/functions/

# Or copy everything
cp -r fish/* ~/.config/fish/
```

## Dependencies

- [fish](https://fishshell.com/) >= 3.0
- [starship](https://starship.rs/) - prompt
- [zoxide](https://github.com/ajeetdsouza/zoxide) - directory jumping
- [atuin](https://github.com/atuinsh/atuin) - shell history
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [mise](https://mise.jdx.dev/) - runtime manager
- [eza](https://github.com/eza-community/eza) - ls replacement
- [bat](https://github.com/sharkdp/bat) - cat replacement

## Abbreviations

### Git
| Abbr | Command |
|------|---------|
| `gs` | `git status` |
| `gc` | `git commit -m` |
| `ga` | `git add` |
| `gau` | `git add -u` |
| `gd` | `git diff` |
| `gds` | `git diff --staged` |
| `gb` | `git branch` |
| `gl` | `git log` |
| `glo` | `git log --oneline` |
| `gla` | `git log --oneline --all --graph` |
| `gco` | `git checkout` |
| `gcb` | `git checkout -b` |
| `gp` | `git push` |
| `gpu` | `git push -u origin HEAD` |
| `gf` | `git fetch origin` |
| `gr` | `git rebase` |
| `gri` | `git rebase --interactive` |
| `grom` | `git rebase origin/mainline` |
| `gst` | `git stash` |
| `gstp` | `git stash pop` |
| `gundo` | `git reset HEAD~1` |
| `gdis` | `git checkout .` |
| `grh` | `git reset --hard` |
| `gwip` | `git add -u && git commit -m "wip"` |
| `gg` | `git grep` |
| `grm` | `git rm` |

### Tools
| Abbr | Command |
|------|---------|
| `hr` | `hatch run` |
| `hf` | `hatch fmt` |
| `ht` | `hatch run typing` |
| `hp` | `hatch run python` |
| `ur` | `uv run` |
| `ut` | `uv run ty check` |
| `crr` | `cargo run` |
| `crp` | `cargo run -p` |
| `reload` | `source ~/.config/fish/config.fish` |
| `treload` | `tmux source ~/.tmux.conf` |

## Functions

### `t [session]`
Attach to or create a tmux session. Defaults to current directory name.
```fish
t           # Create/attach session named after current dir
t myproject # Create/attach session named "myproject"
```

### `mkcd <dir>`
Create a directory and cd into it.
```fish
mkcd new-project
```

### `pbc <file>`
Copy file contents to clipboard.
```fish
pbc README.md
```

### `dotfile <name>`
Quick edit common config files.
```fish
dotfile fish    # or f  - edit fish config
dotfile abbr    # or a  - edit abbreviations
dotfile git     # or g  - edit gitconfig
dotfile tmux    # or t  - edit tmux.conf
dotfile claude  # or c  - edit CLAUDE.md
dotfile ghostty # or gh - edit ghostty config
dotfile atuin   # or at - edit atuin config
dotfile starship # or s - edit starship.toml
```

### `extract <file>`
Extract common archive formats (tar, gz, zip, 7z, rar, etc).
```fish
extract archive.tar.gz
```

### `compress <dir> <output>`
Compress a directory.

### `please`
Rerun the last command with sudo.
```fish
rm /etc/hosts    # permission denied
please           # runs: sudo rm /etc/hosts
```

### `gacp <message>`
Git add, commit, and push in one command.
```fish
gacp "fix: resolve login bug"
```

### Git Worktree Functions
Manage git worktrees with a `base--branch` naming convention.

```fish
gwa feature-x   # Create worktree ../repo--feature-x and cd into it
gwl             # List all worktrees
gwcd feature-x  # cd to worktree for branch feature-x
gwcd            # cd back to base repo
gwd             # Delete current worktree and its branch
```

## Private Config

For work-specific config (AWS profiles, internal tools), create:
```
~/.config/fish.private/
├── conf.d/
│   └── work.fish
└── functions/
    └── ...
```

These are automatically sourced if present (see end of `config.fish`).
