#!/usr/bin/env bash

INSTALL_DIR="$HOME/.local/share/nvim"
mkdir -pv "nvim"
mkdir -pv "autoload"
cp -av "$HOME/.config/nvim/dein.vim" "nvim/"
cp -av "$HOME/.config/nvim/init.vim" "nvim/"
cp -av "$HOME/.config/nvim/lightline.vim" "nvim/"
cp -av "$HOME/.config/nvim/maps.vim" "nvim/"
cp -av "$HOME/.config/nvim/options.vim" "nvim/"
cp -av "$HOME/.config/nvim/plugins.vim" "nvim/"
cp -avr "$INSTALL_DIR/site/autoload/lightline/" "autoload/"
cp -avr "$INSTALL_DIR/site/ftplugin/" .
cp -avr "$INSTALL_DIR/site/mysnippets/" .
cp -avr "$INSTALL_DIR/site/ftdetect/" .
cp -avr "$INSTALL_DIR/site/syntax/" .
echo "Done."
