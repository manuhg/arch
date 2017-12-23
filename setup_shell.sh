#!/bin/zsh
#archdir="/home/gk1000/arch/config_files"
dir="config_files/$HOST"
cnfdir="config_files"
c1="\033[0;32m"
c2="\033[0;34m"
nc="\033[0m"
bold="\033[1m"
fdirs=("$HOME" "$HOME/.oh-my-zsh/themes" "$HOME/.local/share/konsole" "$HOME/.local/share/konsole" "$HOME/.config" "$HOME" "$HOME"\
    "$HOME" "$HOME/.config/nitrogen" "$HOME/.config/i3" "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-3.0"\
"$HOME/.config")
edirs=("$HOME/.local/share")
edf=("gnome-shell")
files=(".zshrc" "gk1000.zsh-theme" "gk1000.profile" "Solarized.colorscheme" "konsolerc" ".tmux.conf" ".Xresources" ".gitconfig"\
"bg-saved.cfg" "config" "bookmarks" "settings.ini" "numix-folders"  )
k=0
if [  $# -eq 0 ]; then
    echo "Please enter an argument. backup or restore"

elif [ $1 = "backup" ] ; then
    [[ ! -d $dir ]] && mkdir -pv $dir
    echo $c1"Dir:$c2 $dir $nc"
    echo $c1"Backing up $c2 vscode $nc extensions to$c1 file vscode_extensions$nc"
    code --list-extensions > vscode_extensions
    for ((i=1;i<=${#files};i++)) do
        [[ -f $fdirs[$i]/$files[$i] ]] && cp -v $fdirs[$i]/$files[$i] $dir/$files[$i] && ((k=k+1))
    done
    for ((i=1;i<=${#edirs};i++)) do
        [[ -d $edirs[$i]/$edf[i] ]] && cp -rap $edirs[$i]/$edf[i] $dir/ && ((k=k+1)) && \
        echo "$c1'$edirs[$i]/$edf[i]'$nc -> $c2'$dir/$edf[i]'$nc"
    done
    [ -d ~/.config/xfce4 ] && cp -rapv ~/.config/xfce4 $dir/
    dconf dump /org/gnome/ > $cnfdir/dconfgnome
    dconf dump /org/gnome/ > $dir/dconfgnome
    ((k=k+1))
    echo $c1"dconf dump /org/gnome/$nc >$c2 $cnfdir/dconfgnome$nc"
    echo $c1"dconf dump /org/gnome/$nc >$c2 $dir/dconfgnome$nc"
    
    echo "$c1$bold$k "$c2"Config files backed up $nc"


elif [ $1 = "restore" ] ; then
    echo $c1"Installing vscode extensions"$nc
    cat vscode_extensions| xargs -L 1 code --install-extension
    [ -d ~/.config/xfce4 ] && cp -rapv $dir/xfce4 ~/.config/
    for ((i=1;i<=${#files};i++)) do
        [[ -d  $fdirs[$i] && -f $dir/$files[$i] ]] && cp -v $dir/$files[$i] $fdirs[$i]/$files[$i] && ((k=k+1))
    done
    for ((i=1;i<=${#edirs};i++)) do
        [[ -d $dir/$edf[i] ]] && cp -rap $dir/$edf[i] $edirs[i]/ && ((k=k+1)) && \
        echo $c1"'$dir/$edf[i]'$nc -> $c2'$edirs[i]/'$nc"
    done
    [[  -f $dir/dconfgnome ]] && dconf load /org/gnome/ < $dir/dconfgnome || \
    dconf load /org/gnome/ < $cnfdir/dconfgnome  && ((k=k+1))
    echo $c1"Restoring gnome settings"$nc
    echo "$c1$bold$k "$c2"Config files restored $nc"


elif [ $1 = "install" ] ; then
    cp *.jpg ~/Pictures/
    yaourt -Syu obsidian-icon-theme numix-folders-git numix-circle-icon-theme-git  \
    numix-icon-theme-git gtk-theme-numix-solarized
    
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
    
    git clone https://github.com/numixproject/numix-folders.git && \
    cp numix-folders.sh numix-folders/numix-folders && \
    chmod +x numix-folders/numix-folders && cd numix-folders && \
    sudo ./numix-folders -t 6 blue && cd .. && \
    rm -rf numix-folders
    echo $c1"Installing vscode extensions$nc"
    #go get -u mvdan.cc/sh/cmd/shfmt
    cat vscode_extensions| xargs -L 1 code --install-extension
    [ -d ~/.config/xfce4 ] && cp -rapv ~/.config/xfce4 $dir/
    for ((i=1;i<=${#edirs};i++)) do
        [[ -d $dir/$edf[i] ]] && cp -rap $dir/$edf[i] $edirs[i]/ && ((k=k+1)) && \
        echo $c1"'$dir/$edf[i]'$nc -> $c2'$edirs[i]/'"$nc
    done
    for ((i=1;i<=${#files};i++)) do
        [ -d $fdirs[$i] ] && cp -v $dir/$files[$i] $fdirs[$i]/$files[$i] && ((k=k+1))
    done
    [[  -f $dir/dconfgnome ]] && dconf load /org/gnome/ < $dir/dconfgnome || dconf load /org/gnome/ < $cnfdir/dconfgnome
    ((k=k+1))
    echo $c1"Restoring gnome settings "$nc
    echo "$c1$bold$k "$c2"Config files copied $nc"
    echo "Setting git global configs"
    git config --global user.name "$HOST-$USER"
    git config --global user.email "manu@gk1000.me"
    echo 'git config --global user.name "$HOST-$USER"'
    echo 'git config --global user.email "manu@gk1000.me"'
    
fi
