#!/bin/bash

### Install startship
curl -sS https://starship.rs/install.sh | sh -s -- -y

mkdir -p ~/.config
cp ./starship.toml ~/.config/starship.toml

