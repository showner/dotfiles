#!/bin/sh

source ./functions_tool.sh

DOTFILE_FOLDER=$HOME/.config/dotfiles
ZSHDIR=$DOTFILE_FOLDER/zsh

fancy_echo "==> Setup Zsh"

if [ -d $ZSHDIR ]; then
  # Check .zshrc presence
  if [ -e $ZSHDIR/zshrc ]; then
    # Check if .zshrc FILE exists
    if [ -f $HOME/.zshrc ]; then
      fancy_echo "Backing old zshrc file ..."
      mv $HOME/.zshrc $HOME/.zshrc.bak
    fi

    # Check if .zshrc SYMLINK exists
    if [ -L $HOME/.zshrc ]; then
      fancy_echo "Removing old zshrc symlink ..."
      mv $HOME/.zshrc $HOME/.zshrc.bak
    fi

    fancy_echo "Symlinking to zshrc ..."
    ln -s $ZSHDIR/zshrc $HOME/.zshrc
    fancy_echo "\e[1;37mDon't forget to :\e[0m\nsource ~/.zshrc\n"
  fi
else
  fancy_echo "no $DOTFILE_FOLDER/zsh detected! "
fi



