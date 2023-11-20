#!/bin/bash

### Install tmux
sudo apt update
sudo apt install tmux

### Config Interface monitor
sed -i "s/<NET-INTERFACE>/$(ip -o link | head -n 2 | tail -n 1 | cut -d ':' -f 2 | cut -d ' ' -f 2)/g" ./.tmux.conf

cp ./.tmux.conf ~/.tmux.conf
source ~/.zshrc