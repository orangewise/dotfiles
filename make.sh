#!/bin/bash
############################
#  http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Functions

function symlink {
    echo "Remove symlink .$1"
    rm ~/.$1
    echo "Creating symlink ~/.$1 to $2"
    ln -s $dir/$2 ~/.$1
}


########## Variables

# dotfiles directory
dir=~/dotfiles       
# list of files/folders to symlink in homedir
symlink_files="aliases functions git-prompt gitprompt oracle ow macports heroku_toolbelt homebrew ruby rbenv"  

########## Start

echo "Changing to the $dir directory"
cd $dir


echo "Then create symlinks"  
for file in $symlink_files; do
	
	symlink $file $file
	
done

echo "Create the correct profile"  
if [ `hostname` == "Ro-MacBookie-Pro.local" ]
then
	echo "--> profile for Ro-Mac-BookiePro"
	symlink "profile" "profile_ro_macbookie_pro"
	
elif [ `hostname` == "Ro-MacBook-Pro.local" ]
then
	echo "--> profile for Ro-MacBook-Pro"
	symlink "profile" "profile_ro_macbook_pro"

else
	echo "--> profile not created..."
fi


echo "...done"
