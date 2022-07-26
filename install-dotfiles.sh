#!/bin/bash

# dotfile installation script

DOTFILES="alacritty i3 zsh neovim tmux x11 zsh"
FONTS="iosevka-nerd-font"

source ./zsh/zshenv
source ./colors.sh

echo -e ""
echo -e "${yellow}!!! ${red}WARNING${yellow} !!!"
echo -e "${light_red}This script will overwrite the following configs/dotfiles"

for dotfile in $DOTFILES; do
    echo -e "${light_green}$dotfile"
done

echo -e ""
echo -e "${light_red}This script will also install the following fonts"

for font in $FONTS; do
    echo -e "${light_green}$font"
done

echo -e ""

if [ $# -ne 1 ] || [ "$1" != "-y" ];
then
    echo -e "${yellow}Press a key to continue...\n"
    read key;
    echo "${key}"
else
    echo -e "no...\n"
fi




