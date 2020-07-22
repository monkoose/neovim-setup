undo_dir="$HOME/.local/share/nvim/undo-files"
view_dir="$HOME/.local/share/nvim/view"

clean() {
  if [[ -d "$1" ]]; then
    find "$1" -type f -mtime +"$2" | xargs -r rm
  fi
}

clean "$undo_dir" 30
clean "$view_dir" 15
