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
    command -v "$1" &>/dev/null || error "You must have '$1' installed to continue."
}

variable_set() {
    [[ -n "$1" ]] || error "You must have your HOME environmental variable set to continue."
}

# Setup
msg "Checking..."
variable_set "$HOME"
program_exists "curl"
program_exists "git"
program_exists "nvim"
install_dir="$HOME/.local/share/nvim"
config_dir="$HOME/.config/nvim"
nvim_repo="https://github.com/monkoose/neovim-setup"
vimplug_repo="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo ""
msg "Creating directories..."
mkdir -pv "$install_dir/undo-files"
mkdir -pv "$config_dir"
echo ""
msg "Cloning repo..."
git clone --depth=1 "$nvim_repo" "$config_dir"
echo ""
msg "Begin fetching vim-plug..."
curl -fLo "$install_dir/site/autoload/plug.vim" --create-dirs "$vimplug_repo"
echo ""
nvim +PlugInstall
echo "Done."
