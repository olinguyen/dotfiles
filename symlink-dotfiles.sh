#!/bin/bash
set -e

# Resolve the dotfiles dir from this script's own location (works anywhere).
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$HOME/.config"

# link SRC (relative to DOTFILES_DIR) -> DEST, backing up any existing real file/dir.
link() {
  local src="$DOTFILES_DIR/$1" dest="$2"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
    echo "backed up $dest -> $BACKUP_DIR/"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

link fish          "$HOME/.config/fish"
link nvim          "$HOME/.config/nvim"
link starship.toml "$HOME/.config/starship.toml"
link ghostty       "$HOME/.config/ghostty"
link atuin         "$HOME/.config/atuin"
link opencode      "$HOME/.config/opencode"
link .tmux.conf    "$HOME/.tmux.conf"
link .bash_aliases "$HOME/.bash_aliases"

# NOTE: .gitconfig is intentionally NOT symlinked. Git identity is machine-specific
# (work vs personal). Set up ~/.gitconfig per machine and pull shared settings with:
#   [include]
#       path = <path-to-this-repo>/.gitconfig

echo "Dotfiles linked successfully!"
