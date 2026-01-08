#!/bin/bash
set -e

# Install script for Amazon Linux 2023
# Kernel: 6.1.x (AL2023 uses dnf, yum is an alias)

echo "=== Installing packages for Amazon Linux 2023 ==="

# Helper function to check if command exists
has() {
  command -v "$1" &>/dev/null
}

# Update system
sudo dnf update -y

# --- Core packages from dnf repos ---
echo "Installing core packages..."
sudo dnf install -y \
  git \
  vim \
  tmux \
  jq \
  tar \
  gzip \
  unzip \
  curl \
  wget \
  gcc \
  make

# --- Fish shell ---
if has fish; then
  echo "fish already installed, skipping..."
else
  echo "Installing fish shell..."
  sudo dnf install -y fish
fi

# --- Neovim ---
if has nvim; then
  echo "neovim already installed, skipping..."
else
  echo "Installing neovim..."
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo tar -C /usr/local -xzf nvim-linux-x86_64.tar.gz
  sudo ln -sf /usr/local/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  rm nvim-linux-x86_64.tar.gz
fi

# --- Starship prompt ---
if has starship; then
  echo "starship already installed, skipping..."
else
  echo "Installing starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# --- Zoxide (directory jumping) ---
if has zoxide; then
  echo "zoxide already installed, skipping..."
else
  echo "Installing zoxide..."
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# --- fzf (fuzzy finder) ---
if has fzf; then
  echo "fzf already installed, skipping..."
else
  echo "Installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all --no-bash --no-zsh
fi

# --- eza (modern ls, successor to exa) ---
if has eza || has exa; then
  echo "eza/exa already installed, skipping..."
else
  echo "Installing eza..."
  sudo dnf install -y eza 2>/dev/null || {
    EZA_VERSION=$(curl -s https://api.github.com/repos/eza-community/eza/releases/latest | jq -r .tag_name)
    curl -LO "https://github.com/eza-community/eza/releases/download/${EZA_VERSION}/eza_x86_64-unknown-linux-gnu.tar.gz"
    tar -xzf eza_x86_64-unknown-linux-gnu.tar.gz
    sudo mv eza /usr/local/bin/
    rm eza_x86_64-unknown-linux-gnu.tar.gz
    sudo ln -sf /usr/local/bin/eza /usr/local/bin/exa
  }
fi

# --- bat (cat replacement) ---
if has bat; then
  echo "bat already installed, skipping..."
else
  echo "Installing bat..."
  sudo dnf install -y bat 2>/dev/null || {
    BAT_VERSION=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r .tag_name)
    curl -LO "https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}/bat-${BAT_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
    tar -xzf "bat-${BAT_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
    sudo mv "bat-${BAT_VERSION}-x86_64-unknown-linux-gnu/bat" /usr/local/bin/
    rm -rf "bat-${BAT_VERSION}-x86_64-unknown-linux-gnu"*
  }
fi

# --- ripgrep ---
if has rg; then
  echo "ripgrep already installed, skipping..."
else
  echo "Installing ripgrep..."
  sudo dnf install -y ripgrep 2>/dev/null || {
    RG_VERSION=$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | jq -r .tag_name)
    curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
    tar -xzf "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
    sudo mv "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl/rg" /usr/local/bin/
    rm -rf "ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl"*
  }
fi

# --- fd (find replacement) ---
if has fd; then
  echo "fd already installed, skipping..."
else
  echo "Installing fd..."
  sudo dnf install -y fd-find 2>/dev/null || {
    FD_VERSION=$(curl -s https://api.github.com/repos/sharkdp/fd/releases/latest | jq -r .tag_name)
    curl -LO "https://github.com/sharkdp/fd/releases/download/${FD_VERSION}/fd-${FD_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
    tar -xzf "fd-${FD_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
    sudo mv "fd-${FD_VERSION}-x86_64-unknown-linux-gnu/fd" /usr/local/bin/
    rm -rf "fd-${FD_VERSION}-x86_64-unknown-linux-gnu"*
  }
fi

# --- sd (sed replacement) ---
if has sd; then
  echo "sd already installed, skipping..."
else
  echo "Installing sd..."
  SD_VERSION=$(curl -s https://api.github.com/repos/chmln/sd/releases/latest | jq -r .tag_name)
  curl -LO "https://github.com/chmln/sd/releases/download/${SD_VERSION}/sd-${SD_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
  tar -xzf "sd-${SD_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
  sudo mv "sd-${SD_VERSION}-x86_64-unknown-linux-gnu/sd" /usr/local/bin/
  rm -rf "sd-${SD_VERSION}-x86_64-unknown-linux-gnu"*
fi

# --- mise (runtime version manager) ---
if has mise; then
  echo "mise already installed, skipping..."
else
  echo "Installing mise..."
  curl https://mise.run | sh
fi

# --- TPM (Tmux Plugin Manager) ---
if [[ -d ~/.tmux/plugins/tpm ]]; then
  echo "TPM already installed, skipping..."
else
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# --- Optional: extraction tools ---
echo "Installing extraction tools..."
sudo dnf install -y p7zip p7zip-plugins 2>/dev/null || true

echo ""
echo "=== Installation complete! ==="
echo ""
echo "Next steps:"
echo "1. Copy your dotfiles to appropriate locations:"
echo "   - ~/.config/fish/config.fish"
echo "   - ~/.config/nvim/"
echo "   - ~/.config/starship.toml"
echo "   - ~/.tmux.conf"
echo "   - ~/.vimrc"
echo "   - ~/.bashrc"
echo "   - ~/.bash_aliases"
echo "   - ~/.gitconfig"
echo ""
echo "2. Change default shell to fish:"
echo "   chsh -s \$(which fish)"
echo ""
echo "3. Start tmux and press 'prefix + I' to install plugins"
echo ""
echo "4. Update .bash_aliases: change 'exa' to 'eza' (or keep exa symlink)"
