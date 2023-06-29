#!/bin/bash

# dotfile/configuration installation script

DOTFILES="i3 x11"
FONTS="iosevka-nerd-font"

#for dotfile in $DOTFILES; do
#done

# Bash
echo -e "Installing configuration for bash (remember to install blesh)"
echo -e "Creating symlink $HOME/.bash_config -> $PWD/bash/bash_config"
ln -s $PWD/bash/.bash_config $HOME/.bash_config
echo "source $HOME/.bash_config" >> $HOME/.bashrc
echo -e ""

# i3
echo -e "Installing configuration for i3"
echo -e "Creating directory $HOME/.config/i3"
mkdir -p $HOME/.config/i3
echo -e "Creating symlink $HOME/.config/i3/config -> $PWD/i3/config"
ln -s $PWD/i3/config $HOME/.config/i3/config
echo -e ""

# x11
echo -e "Installing configuration for x11"
echo -e "Creating symlink $HOME/.xinitrc -> $PWD/X11/.xinitrc"
ln -s $PWD/X11/.xinitrc $HOME/.xinitrc
echo -e ""

# Alacritty
echo -e "Installing configuration for alacritty"
echo -e "Creating directory $HOME/.config/alacritty"
mkdir -p $HOME/.config/alacritty
echo -e "Creating symlink $HOME/.config/alacritty/alacitty.toml -> $PWD/alacritty/alacritty.toml"
ln -s $PWD/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
echo -e ""

# Neovim
echo -e "Installing configuration for Neovim"
echo -e "Creating directory $HOME/.config/nvim"
mkdir -p $HOME/.config/nvim
echo -e "Creating symlink $HOME/.config/nvim/init.lua -> $PWD/nvim/init.lua"
ln -s $PWD/nvim/init.lua $HOME/.config/nvim/init.lua
echo -e ""

# Fish
echo -e "Installing configuration for fish shell"
echo -e "Creating directory $HOME/.config/fish"
mkdir -p $HOME/.config/fish
echo -e "Creating symlink $HOME/.config/fish/config.fish -> $PWD/fish/config.fish"
ln -s $PWD/fish/config.fish $HOME/.config/fish/config.fish
echo -e ""
