#!/bin/bash

### Install zsh
sudo apt update
sudo apt install zsh

### Install exa via rust cargo
# - Uninstall the APT package if present
sudo apt remove exa

# - Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# - Install exa
cargo install exa

### Install enhancd
git clone https://github.com/b4b4r07/enhancd ~/. && source ~/enhancd/init.sh


cp ./.zshrc ~/.zshrc
source ~/.zshrc