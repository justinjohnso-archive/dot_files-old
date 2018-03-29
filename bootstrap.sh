#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dot_files
# If symlinks already exists, they are skipped, otherwise destiny files are moved to dotfiles 
# folder and respective symlinks created.
# Note: A backup folder is created with all .dotfiles (not symlinks) desired
############################

########## Variables
TIME=$(date "+%Y-%m-%d_%H-%M-%S")
DIR=~/dot_files # dotfiles directory
OLDDIR=~/dot_files_old_"$TIME" # old dotfiles backup directory
FILES=(.vimrc .zimrc) # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p "$OLDDIR"
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

# copy any existing dotfiles (follow symlinks) in homedir to dotfiles_old_$time directory
for FILE in "${FILES[@]}"; do
echo "Backup dotfile $FILE from ~ to $OLDDIR"
cp -LR ~/$FILE "$OLDDIR"
done

# move any existing dotfiles (not symlinks) in homedir to dotfiles directory and create respective symlinks
for FILE in "${FILES[@]}"; do
echo "Moving and creating symlink to $FILE from ~ to $DIR."
ln -sfn $DIR/$FILE ~/$FILE
done

# set up vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim plugins
vim +PluginInstall +qall

# clone and install zim (UNDER CONSTRUCTION)
if [ ! -d $DIR/.zim ]; then
  git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim
fi

echo "Follow steps 2 and 4 here: https://github.com/zimfw/zimfw"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)
