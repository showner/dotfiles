#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift
  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

zshrc_append() {
  local text="$1"
  local zshrc="$HOME/.zshrc"
  local skip_new_line="${2:-0}"

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\\n" "$text" >> "$zshrc"
    else
      printf "\\n%s\\n" "$text" >> "$zshrc"
    fi
  fi
}
