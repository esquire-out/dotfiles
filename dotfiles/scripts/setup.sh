#!/bin/bash

# Moves all files within folder to ~/.config.
mkdir -p ~/.config/dotfiles/
if [ cp -a ./. ~/.config/dotfiles/ ]; then
    echo "[@] Copied files to .config"
fi

CONFIGS_DIR=~/.config/dotfiles/configs

# Neovim config, neovim expects the configuration files at:
# ~/.config/nvim/
mkdir -p ~/.config/nvim/
if [ cp -a $CONFIGS_DIR/nvim/. ~/.config/nvim/ ]; then
    echo "[@] Copied files to .config/nvim/"
fi

# i3wm config, i3wm expects the configuration files at:
# ~/.config/i3/
if [ cp -a $CONFIGS_DIR/config ~/.config/i3/ ]; then
    echo "[@] Copied files to .config/i3/"
fi
