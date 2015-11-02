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


function sublime {
    echo "sublime preferences"
    rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
	ln -s ~/dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
}




########## Variables

# dotfiles directory
dir=~/dotfiles       
# list of files/folders to symlink in homedir
symlink_files="aliases bower functions git-prompt gitprompt git-imgdiff oracle oracle_11_2 oronjo ck ow xc droid www textmate macports heroku_toolbelt homebrew ruby rbenv apportable_toolkit jshintrc awsenv meteorenv nvmenv"  

########## Start

echo "Changing to the $dir directory"
cd $dir


echo "Then create symlinks"  
for file in $symlink_files; do
	
	symlink $file $file
	
done

host=`hostname`
echo "Create the correct profile for ${host:0:16} or ${host:0:14}"  
if [ ${host:0:16} == "Ro-MacBookie-Pro" ]
then
	echo "--> profile for Ro-Mac-BookiePro"
	symlink "profile" "profile_ro_macbookie_pro"

	sublime
	
elif [ ${host:0:14} == "Ro-MacBook-Pro.local" ]
then
	echo "--> profile for Ro-MacBook-Pro"
	symlink "profile" "profile_ro_macbook_pro"

else
	echo "--> profile not created..."
fi


echo "...done"
