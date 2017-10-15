#!/bin/zsh
#archdir="/home/gk1000/arch/config_files"
dir="config_files"
fdirs=("$HOME" "$HOME/.oh-my-zsh/themes" "$HOME/.local/share/konsole" "$HOME/.config" "$HOME" "$HOME"\
 "$HOME" "$HOME/.config/nitrogen" "$HOME/.config/i3" "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-3.0"\
 "$HOME/.config" "$HOME/.local/share/gnome-shell"
 )

files=(".zshrc" "gk1000.zsh-theme" "gk1000.profile" "konsolerc" ".tmux.conf" ".Xresources" ".gitconfig"\
 "bg-saved.cfg" "config" "bookmarks" "settings.ini" "numix-folders" "application_state" )
k=0
if [  $# -eq 0 ]; then
    echo "Please enter an argument. backup or restore"
elif [ $1 = "backup" ] ; then
    for ((i=1;i<=${#files};i++)) do
    [[ -f $fdirs[$i]/$files[$i] ]] && cp -v $fdirs[$i]/$files[$i] $dir/$files[$i] && ((k=k+1))
    done
    dconf dump /org/gnome/ > dconfgnome
    echo "Config Files backed up : $k"
elif [ $1 = "restore" ] ; then
    for ((i=1;i<=${#files};i++)) do
        [[ -d  $fdirs[$i] && -f $dir/$files[$i] ]] && cp -v $dir/$files[$i] $fdirs[$i]/$files[$i] && ((k=k+1))
    done
    dconf load /org/gnome/ < dconfgnome
    echo "Config Files restored : $k"
elif [ $1 = "install" ] ; then
    yaourt -Syu obsidian-icon-theme numix-folders-git numix-circle-icon-theme-git  \
      numix-icon-theme-git gtk-theme-numix-solarized
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
    for ((i=1;i<=${#files};i++)) do
        [ -d $fdirs[$i] ] && cp -v $dir/$files[$i] $fdirs[$i]/$files[$i] && ((k=k+1))
    done
        echo "Config Files copied : $k"
    dconf load /org/gnome/ < dconfgnome
fi
