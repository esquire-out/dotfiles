#!/bin/bash

# Moves all files within folder to ~/.config.
mkdir -p ~/.config/dotfiles/
if [ cp -a ./. ~/.config/dotfiles/ ]; then
    echo "[@] Copied files to .config"
fi

CONFIGS_DIR=~/.config/dotfiles/configs

# Neovim config, neovim expects the configuration files at: ~/.config/nvim/
mkdir -p ~/.config/nvim/
if [ cp -a $CONFIGS_DIR/nvim/. ~/.config/nvim/ ]; then
    echo "[@] Copied files to .config/nvim/"
fi

# Note; i3 config references, $CONFIGS_DIR/alacritty/... && $CONFIGS_DIR/picom/...
# So edit the files at those directories in order to change the alacritty and picom configurations.

# i3wm config, i3wm expects the configuration files at: ~/.config/i3/
if [ cp -a $CONFIGS_DIR/i3/config ~/.config/i3/ ]; then
    echo "[@] Copied files to .config/i3/"
fi
