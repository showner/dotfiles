#!/bin/sh

source ./functions_tool.sh

add_or_update_asdf_plugin() {
  local name="$1"
  local url="$2"

  if ! asdf plugin list | grep -Fq "$name"; then
    asdf plugin add "$name" "$url"
  else
    asdf plugin update "$name"
  fi
}

install_asdf_language() {
  local language="$1"
  local version="$2"

  if ! asdf list "$language" | grep -Fq "$version"; then
    asdf install "$language" "$version"
    asdf global "$language" "$version"
  fi
}

fancy_echo "==> Setup asdf"

zshrc_append "source $HOME/.asdf/asdf.sh" 1

source "$HOME/.asdf/asdf.sh"
add_or_update_asdf_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
add_or_update_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"

fancy_echo "Install a Ruby version? (Yn) "
read answer
if [[ "$answer" == "Y" ]]; then
  read ruby_version
  fancy_echo "Try installing Ruby version..."
  install_asdf_language "ruby" $ruby_version
  gem update --system
fi

fancy_echo "Install a Nodejs version? (Yn) "
read answer
if [[ "$answer" == "Y" ]]; then
  read nodejs_version
  fancy_echo "Try installing Node version..."
  install_asdf_language "ruby" $nodejs_version
fi
