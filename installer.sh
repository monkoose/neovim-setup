#!/usr/bin/env bash

# Helper functions
msg() {
    printf "\033[1m%b\033[0m\n" "$1" >&2
}

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

copy_dir() {
    if [ ! -e "$1" ]; then
        error "'$1' is missing."
    fi
    cp -avrn "$1" "$2"
}

# Setup
INSTALL_DIR="$HOME/.local/share/nvim"
DEIN_DIR="$INSTALL_DIR/site/dein/repos/github.com/Shougo/dein.vim"
msg "Checking..."
variable_set "$HOME"
program_must_exist "git"
echo ""
msg "Creating directories..."
mkdir -pv "$INSTALL_DIR/site/dein"
mkdir -pv "$INSTALL_DIR/session"
mkdir -pv "$INSTALL_DIR/undo-files"
mkdir -pv "$INSTALL_DIR/view"
echo ""
msg "Copying files..."
copy_dir "nvim/" "$HOME/.config/"
copy_dir "autoload/" "$INSTALL_DIR/site/"
copy_dir "after/" "$INSTALL_DIR/site/"
copy_dir "mysnippets/" "$INSTALL_DIR/site/"
echo ""
msg "Begin fetching dein..."
git clone https://github.com/Shougo/dein.vim "$DEIN_DIR"
echo ""
msg "Done. Launch nvim and run the command :call dein#install()"
echo ""
