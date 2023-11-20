#!/bin/bash

### Install startship
curl -sS https://starship.rs/install.sh | sh

cp ./starship.toml ~/.config/starship.toml
source ~/.zshrc