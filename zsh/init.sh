#!/bin/bash

### Install zsh
sudo apt update
sudo GNUTLS_CPUID_OVERRIDE=0x1 apt install build-essential gcc cmake zsh bat fzf -y

echo 'export SHELL=`which zsh`' >> ~/.profile
echo '[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l' >> ~/.profile


### Install exa via rust cargo
# - Install rust and exa
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env && cargo build --release && cargo install exa


### Install enhancd
source ~/enhancd/init.sh


cp ./.zshrc ~/.zshrc

