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
    command -v "$1" >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exists "$1"

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

# Setup
msg "Checking..."
variable_set "$HOME"
program_must_exist "curl"
program_must_exist "git"
program_must_exist "nvim"
INSTALL_DIR="$HOME/.local/share/nvim"
CONFIG_DIR="$HOME/.config/nvim"
NVIM_REPO="https://github.com/monkoose/neovim-setup"
echo ""
msg "Creating directories..."
mkdir -pv "$INSTALL_DIR/session"
mkdir -pv "$INSTALL_DIR/undo-files"
mkdir -pv "$INSTALL_DIR/view"
mkdir -pv "$CONFIG_DIR"
echo ""
msg "Cloning repo..."
git clone --depth=1 "$NVIM_REPO" "$CONFIG_DIR"
echo ""
msg "Begin fetching vim-plug..."
curl -fLo "$INSTALL_DIR"/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ""
nvim +PlugInstall +"CocInstall coc-sh coc-snippets coc-yank coc-css coc-html coc-json coc-python coc-svelte coc-tsserver coc-vimlsp coc-yaml"
msg "Then install all CoC plugins with :CocInstall <coc-plugin>"
echo ""
