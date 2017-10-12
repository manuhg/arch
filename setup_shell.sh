#!/bin/zsh
#archdir="/home/gk1000/arch/config_files"
dir="config_files"
dirs=("$HOME" "$HOME/.oh-my-zsh/themes" "$HOME/.local/share/konsole" "$HOME/.config" "$HOME" "$HOME" "$HOME" "$HOME/.config/nitrogen" "$HOME/.config/i3" "$HOME/.config/gtk-3.0" )
files=(".zshrc" "gk1000.zsh-theme" "gk1000.profile" "konsolerc" ".tmux.conf" ".Xresources" ".gitconfig" "bg-saved.cfg" "config" "settings.ini" )
k=0
if [  $# -eq 0 ]; then
    echo "Please enter an argument. backup or restore"
elif [ $1 = "backup" ] ; then
    for ((i=1;i<=${#files};i++)) do
    [[ -f $dirs[$i]/$files[$i] ]] && cp -v $dirs[$i]/$files[$i] $dir/$files[$i] && ((k=k+1))
    done
    echo "Config Files backed up : $k"
elif [ $1 = "restore" ] ; then
    for ((i=1;i<=${#files};i++)) do
        [[ -d  $dirs[$i] && -f $dir/$files[$i] ]] && cp -v $dir/$files[$i] $dirs[$i]/$files[$i] && ((k=k+1))
    done
    echo "Config Files restored : $k"
elif [ $1 = "install" ] ; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
    for ((i=1;i<=${#files};i++)) do
        [ -d $dirs[$i] ] && cp -v $dir/$files[$i] $dirs[$i]/$files[$i] && ((k=k+1))
    done
        echo "Config Files copied : $k"
fi
