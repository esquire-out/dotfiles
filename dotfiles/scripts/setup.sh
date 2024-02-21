#!/bin/bash

# Moves all files within folder to the main location.
mkdir -p ~/.config/dotfiles/
cp -a ./. ~/.config/dotfiles/

# i3wm config, i3wm expects the configuration files at
# ~/.config/dotfiles/configs.
cp -a ./configs/config ~/.config/i3/
