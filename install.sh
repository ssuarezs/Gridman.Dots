#!/bin/bash

# Exit script on error
set -e

echo "Starting Homebrew installations..."

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# List of packages to install
packages=(
  git
  wget
  neovim
  python
  ripgrep
  fnm
  jandedobbeleer/oh-my-posh/oh-my-posh
)

# Install packages
for pkg in "${packages[@]}"; do
    echo "Installing $pkg..."
    brew install "$pkg"
done

echo "✅ All packages installed!"

