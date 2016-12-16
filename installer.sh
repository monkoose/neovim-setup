#!/usr/bin/env bash

# Helper functions
error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

variable_set() {
    if [ -z "$1" ]; then
        error "You must have your HOME environmental variable set to continue."
    fi
}

copy() {
    if [ -e "$1" ]; then
        cp -avr "$1" "$2"
    fi
}

# Setup
INSTALL_DIR="$HOME/.local/share/nvim"
DEIN_DIR="$INSTALL_DIR/site/dein/repos/github.com/Shougo/dein.vim"
echo "Checking..."
variable_set "$HOME"
program_must_exist "git"
echo ""
echo "Creating directories..."
mkdir -p "$INSTALL_DIR/site/dein"
mkdir -p "$INSTALL_DIR/session"
mkdir -p "$INSTALL_DIR/undo-files"
mkdir -p "$INSTALL_DIR/view"
echo ""
echo "Copying files..."
copy "/nvim" "$HOME/.config"
copy "/autoload" "$INSTALL_DIR/site"
copy "/ftplugin" "$INSTALL_DIR/site"
copy "/mysnippets" "$INSTALL_DIR/site"
echo ""
echo "Begin fetching dein..."
git clone https://github.com/Shougo/dein.vim "$DEIN_DIR"
echo "Done."
echo ""
echo "Launch nvim and run the command :call dein#update()"
