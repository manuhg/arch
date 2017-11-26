#!/bin/zsh
#archdir="/home/gk1000/arch/config_files"
dir="config_files/gen"

fdirs=("$HOME" "$HOME/.oh-my-zsh/themes" "$HOME/.local/share/konsole" "$HOME/.local/share/konsole" "$HOME/.config" "$HOME" "$HOME"\
 "$HOME" "$HOME/.config/nitrogen" "$HOME/.config/i3" "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-3.0"\
 "$HOME/.config" "$HOME/.local/share/gnome-shell" 
 )

files=(".zshrc" "gk1000.zsh-theme" "gk1000.profile" "Solarized.colorscheme" "konsolerc" ".tmux.conf" ".Xresources" ".gitconfig"\
 "bg-saved.cfg" "config" "bookmarks" "settings.ini" "numix-folders" "application_state" )
k=0


    
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
    
    git clone https://github.com/numixproject/numix-folders.git
    cp numix-folders.sh numix-folders/numix-folders
    chmod +x numix-folders/numix-folders
    ./numix-folders/numix-folders -t 6 green
    rm -rf numix-folders
    
    for ((i=1;i<=${#files};i++)) do
        [ -d $fdirs[$i] ] && cp -v $dir/$files[$i] $fdirs[$i]/$files[$i] && ((k=k+1))
    done
    [[  -f $dir/dconfgnome ]] && dconf load /org/gnome/ < $dir/dconfgnome
    ((k=k+1))
    echo "[[  -f $dir/dconfgnome ]] && dconf load /org/gnome/ < $dir/dconfgnome"
    echo "Config Files copied : $k"


