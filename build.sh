#!/bin/bash

echo "Updating package list and installing Zsh..."
sudo apt update && sudo apt install -y zsh

if ! [ -x "$(command -v zsh)" ]; then
    echo 'Error: Zsh is not installed.' >&2
    exit 1
fi

echo "Setting Zsh as the default shell..."
chsh -s $(which zsh)

echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Zsh Autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Enabling Zsh Autosuggestions in .zshrc..."
sed -i '/^plugins=(/ s/)/ zsh-autosuggestions)/' ~/.zshrc

echo "Reloading .zshrc..."
source ~/.zshrc

echo "Installation complete! Please restart your terminal to use Zsh and Oh-My-Zsh."
