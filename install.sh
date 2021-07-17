#!/bin/bash

export DOTFILE_FOLDER=$HOME/.config/dotfiles
export ZSHDIR=$DOTFILE_FOLDER/zsh
export TMUXDIR=$DOTFILE_FOLDER/tmux

# Check zshrc presence
if [ -e $ZSHDIR/zshrc ]; then
  if [ -e $HOME/.zshrc ]; then
    echo "Deleting old zshrc symlink ..."
    rm $HOME/.zshrc
  fi
  echo "Creating symlink to zshrc ..."
  ln -s $ZSHDIR/zshrc $HOME/.zshrc
fi

# Check tmux presence
if [ -e $TMUXDIR/tmux.conf ]; then
  if [ -e $HOME/.tmux.conf ]; then
    echo "Deleting old .tmux.conf symlink ..."
    rm $HOME/.tmux.conf
  fi
  echo "Creating symlink to tmux.conf ..."
  ln -s $TMUXDIR/tmux.conf $HOME/.tmux.conf
fi
