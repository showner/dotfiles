#!/bin/sh

source ./functions_tool.sh

DOTFILE_FOLDER=$HOME/.config/dotfiles
BREWDIR=$DOTFILE_FOLDER/homebrew

fancy_echo "==> Setup Homebrew"

if [ -d $BREWDIR ]; then
  # MacOS conf
  if [ $(uname) = "Darwin" ]; then
    # Find Brewfile
    if [ -e $BREWDIR/macos/Brewfile ]; then
      (
        cd $BREWDIR/macos;
        brew bundle;
      )
    else 
      fancy_echo "no Brewfile for $(uname) found! "
    fi
  fi

  # Linux conf
  if [ $(uname) = "Linux" ]; then
    # Find Brewfile
    if [ -e $BREWDIR/linux/Brewfile ]; then
      (
        cd $BREWDIR/linux;
        brew bundle;
      )
    else 
      fancy_echo "no Brewfile for $(uname) found! "
    fi
  fi
else
  fancy_echo "no $DOTFILE_FOLDER/homebrew detected! "
fi




