#!/bin/bash
############################
#  http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# dotfiles directory
dir=~/dotfiles       
# list of files/folders to symlink in homedir
symlink_files="aliases functions git-prompt profile"    

##########

echo "Changing to the $dir directory"
cd $dir

echo "Then create symlinks"  
for file in $symlink_files; do
    echo "Remove .$file"
    rm ~/.$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done


echo "...done"
