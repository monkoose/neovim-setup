#!/usr/bin/env bash

INSTALL_DIR="$HOME/.local/share/nvim"
mkdir -pv "nvim"
mkdir -pv "autoload"
cp -av "$HOME/.config/nvim/init.vim" "nvim/"
cp -avr "$INSTALL_DIR/site/autoload/lightline/" "autoload/"
cp -avr "$INSTALL_DIR/site/after/" .
cp -avr "$INSTALL_DIR/site/mysnippets/" .
echo "Done."
