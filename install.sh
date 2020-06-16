#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="zshrc vimrc tmux.conf vim ctags gitignore_global" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    echo "\n"
    echo "Moving .$file"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo '\n'

echo "Moving bin to $olddir"
mv ~/bin $olddir/
echo "Creating symlink to bin in home directory."
ln -s $dir/bin ~/bin

echo '\n'

echo "Moving Spectacle Settings to $olddir"
mv ~/Library/Application\ Support/Spectacle $olddir/
echo "Creating symlink to Spectacle in Application Support directory."
ln -s $dir/Spectacle ~/Library/Application\ Support/Spectacle
