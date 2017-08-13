#!/bin/zsh
archdir="/home/gk1000/arch/config_files"
dirs=("$HOME" "$HOME/.oh-my-zsh/themes" "$HOME/.local/share/konsole" "$HOME/.config" "$HOME" "$HOME" "$HOME" )
files=(".zshrc" "gk1000.zsh-theme" "gk1000.profile" "konsolerc" ".tmux.conf" ".Xresources" ".gitconfig" )
if [  $# -eq 0 ]; then
    echo "Please enter an argument. backup or restore"
elif [ $1 = "backup" ] ; then
    for ((i=1;i<=${#files};i++)) do
     cp -v $dirs[$i]/$files[$i] $archdir/$files[$i]
    done
elif [ $1 = "restore" ] ; then
    for ((i=1;i<=${#files};i++)) do
        [ -d $dirs[$i] ] && cp -v $archdir/$files[$i] $dirs[$i]/$files[$i]
    done
elif [ $1 = "install" ] ; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
    for ((i=1;i<=${#files};i++)) do
        [ -d $dirs[$i] ] && cp -v $archdir/$files[$i] $dirs[$i]/$files[$i]
    done
fi