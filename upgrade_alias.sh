#!/bin/bash

export DOTFILE_FOLDER=$HOME/.config/dotfiles
export ZSHDIR=$DOTFILE_FOLDER/zsh
export TMUXDIR=$DOTFILE_FOLDER/tmux

# Check zshrc presence
if [ -e $ZSHDIR/zshrc ]; then
  if [ -e $HOME/.zshrc ]; then
    echo "Deleting old zshrc file ..."
    rm $HOME/.zshrc
  fi
  if [ -e $ZSHDIR/zshrc ]; then
    mv $ZSHDIR/conf/aliases.local $ZSHDIR/conf/conf.local
  fi
  echo "Creating symlink to zshrc ..."
  ln -s $ZSHDIR/zshrc $HOME/.zshrc

  printf "\e[1;37mDon't forget to :\e[0m\nsource ~/.zshrc\n"
fi

