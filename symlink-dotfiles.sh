#!/bin/bash
set -e

DOTFILES_DIR="$HOME/workspace/dotfiles"

mkdir -p ~/.config/starship

ln -sf "$DOTFILES_DIR/fish" ~/.config/fish
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/.bash_aliases" ~/.bash_aliases
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig

echo "Dotfiles linked successfully!"
