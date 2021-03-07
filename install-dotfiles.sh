#!/bin/sh

# Install script for dotfiles
# Credits to Pajlada for this this script!
# https://github.com/pajlada/

# TODO
# 1. Let script install dev essentials, also for Yocto.
# 2. Let script install zsh and oh-my-zsh including plugins
# 3. Let script install fzf and vimplug (junegunn)
# 4. Let script install custom zshrc, add aliases
# 5. Let script install neovim, build from source and install latest stable
# 6. Let script install light-weight term emulator.
#
# Goal is to have this script to run on a new dev machine...
# 

set -e

# Function for creating home symlinks.
# Usage: make_home_symlink path_to_file filname_of_file_in_home_to_symlink_to
make_home_symlink() {
	if [ -z "$1" ]; then
		>&2 echo "make_home_symlink: missing first argument: path to file"
		exit 1
	fi

	THIS_DOTFILE_PATH="$PWD/$1"
	if [ -z "$2" ]; then
		HOME_DOTFILE_PATH="$HOME/$1"
	else
		HOME_DOTFILE_PATH="$HOME/$2"
	fi

	printf "Installing %s into %s" "$1" "$HOME_DOTFILE_PATH"

	if [ -L "$HOME_DOTFILE_PATH" ]; then
		echo " skipping, target is already a symlink"
		return
	fi

	if [ -f "$HOME_DOTFILE_PATH" ] && [ ! -L "$HOME_DOTFILE_PATH" ]; then
		printf " You already have a regular file at %s. Do you want to remove it? (y/n) " "$HOME_DOTFILE_PATH"
		read -r response
		if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
			rm "$HOME_DOTFILE_PATH"
		else
			return
		fi
	fi

	ln -s "$THIS_DOTFILE_PATH" "$HOME_DOTFILE_PATH" 
	echo " done!"
}


echo "Creating symlinks..."

# Create vim config dir
mkdir -p "$HOME/.vim"
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

# User should pass nvim or vim when executing script
if [ "$1" = "nvim" ]; then
	echo "Installing nvim configuration..."
	mkdir -p $HOME/.config/nvim
	make_home_symlink "init.vim" ".config/nvim/init.vim"

	dotfiles=""
	for dotfile in $dotfiles; do
		make_home_symlink "$dotfile"
	done

elif [ "$1" = "vim" ] ; then
	echo "Installing vim configuration..."
	# Symlink this repos .vimrc into ~/.vim/.vimrc
	make_home_symlink ".vimrc" ".vim/vimrc"

	dotfiles=".vimrc"
	for dotfile in $dotfiles; do
		make_home_symlink "$dotfile"
	done

else
	>&2 echo "User should pass vim or nvim as input arg..."
	exit 1
fi





