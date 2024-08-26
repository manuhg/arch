#!/bin/zsh
#archdir="/home/gk1000/arch/config_files"
dir="config_files/$HOST"
cnfdir="config_files"
c1="\033[0;32m"
c2="\033[0;34m"
rc="\033[0;31m"
nc="\033[0m"
bold="\033[1m"

edirs=("$HOME/.local/share"  ) #"$HOME"
edf=("gnome-shell")
#".emacs.d")
dconfs=("gnome")
# "pantheon/"
fdirs=("$HOME" "$HOME/.oh-my-zsh/themes" "$HOME/.local/share/konsole" "$HOME/.local/share/konsole" \
       "$HOME/.config" "$HOME" "$HOME" "$HOME" \
       "$HOME/.config/nitrogen" "$HOME/.config/i3" "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-3.0" \
       "$HOME/.config" "/etc/clamav-unofficial-sigs" "$HOME" "$HOME/.emacs.d" "$HOME/.emacs.d" "$HOME/.emacs.d/personal"\
       "$HOME/.emacs.d/personal" "$HOME/.emacs.d/core" "$HOME/.config/hotkeys" "$HOME/.config/Code/User" )

files=(".zshrc" "gk1000.zsh-theme" "gk1000.profile" "Solarized.colorscheme" \
       "konsolerc" ".tmux.conf" ".Xresources" ".gitconfig"  \
       "bg-saved.cfg" "config" "bookmarks" "settings.ini" \
       "numix-folders" "user.conf" ".emacs" ".emacs.desktop" "prelude-modules.el" \
       "custom.el" "emacs_config.el" "prelude-global-keybindings.el" "synapse.hotkeys" "settings.json")
if [  $# -eq 0 ]; then
    echo "Please enter an argument. backup or restore"

elif [ $1 = "backup" ] ; then
    [[ ! -d $dir ]] && mkdir -pv $dir
    echo $c1"Dir:$c2 $dir $nc"
    echo $c1"Backing up $c2 vscode $nc extensions to$c1 file vscode_extensions$nc"
    code --list-extensions > $cnfdir/vscode_extensions
    echo $c2"No of files to backup: "${#files}$nc
    for ((i=1;i<=${#files};i++)) do
        if [[ -f $fdirs[$i]/$files[$i] ]];then
         cp -v $fdirs[$i]/$files[$i] $dir/$files[$i] && ((k=k+1))
        else
         echo $rc"$fdirs[$i]/$files[$i] does not exist"$nc
        fi
    done

    echo $c2"No of directories to backup: "${#edirs}$nc
    for ((i=1;i<=${#edirs};i++)) do
        if [[ -d $edirs[$i]/$edf[$i] ]] ;then
            mkdir -pv $dir/$edf[$i]
         cp -rap $edirs[$i]/$edf[$i] $dir && ((ds=ds+1)) && echo "$c1'$edirs[$i]/$edf[$i]'$nc -> $c2'$dir/$edf[$i]'$nc"
        else
            echo $rc"$edirs[$i]/$edf[$i] does not exist"$nc
        fi

    done

    # dconf dump /org/gnome/ > $cnfdir/dconfgnome
    # dconf dump /org/gnome/ > $dir/dconfgnome
    # ((k=k+1))
    # echo $c1"dconf dump /org/gnome/$nc >$c2 $cnfdir/dconfgnome$nc"
    # echo $c1"dconf dump /org/gnome/$nc >$c2 $dir/dconfgnome$nc"

    echo $c2"Config items backed up $nc"
    echo "$c2$bold$k$c2 Files$nc"
    echo "$c2$bold$ds$c2 Directories$nc"


elif [ $1 = "restore" ] ; then
    echo $c1"Installing vscode extensions"$nc
    cat $cnfdir/vscode_extensions| xargs -L 1 code --install-extension

    for ((i=1;i<=${#files};i++)) do
        if [[ -d  $fdirs[$i] && -f $dir/$files[$i] ]] ;then
          cp -v $dir/$files[$i] $fdirs[$i]/$files[$i] && ((k=k+1))
        else
         echo $rc"$files[$i] not copied since $fdirs[$i] does not exist"$nc
        fi
    done
    for ((i=1;i<=${#edirs};i++)) do
        [[ -d $dir/$edf[$i] ]] && cp -rap $dir/$edf[$i] $edirs[$i]/ && ((k=k+1)) && \
        echo $c1"'$dir/$edf[$i]'$nc -> $c2'$edirs[$i]/'$nc"
    done
    # [[  -f $dir/dconfgnome ]] && dconf load /org/gnome/ < $dir/dconfgnome || \
    # dconf load /org/gnome/ < $cnfdir/dconfgnome  && ((k=k+1))
    echo $c1"Restoring gnome settings"$nc
    echo "$c2$bold$k "$c2"Config items restored $nc"


elif [ $1 = "install" ] ; then

    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
    
    echo $c1"Installing vscode extensions$nc"
    #go get -u mvdan.cc/sh/cmd/shfmt
    cp $cnfdir/.histfile ~/
    echo $c1"$cnfdir/.histfile -> ~/"$nc
    cat $cnfdir/vscode_extensions| xargs -L 1 code --install-extension
    
    for ((i=1;i<=${#edirs};i++)) do
        [[ -d $dir/$edf[$i] ]] && cp -rap $dir/$edf[$i] $edirs[$i]/ && ((k=k+1)) && \
        echo $c1"'$dir/$edf[$i]'$nc -> $c2'$edirs[$i]/'"$nc
    done
    for ((i=1;i<=${#files};i++)) do
        if [[ -d  $fdirs[$i] && -f $dir/$files[$i] ]] ;then
          cp -v $dir/$files[$i] $fdirs[$i]/$files[$i] && ((k=k+1))
        else
         echo $rc"$files[$i] not copied since $fdirs[$i] does not exist"$nc
        fi
    done
    
    ((k=k+1))
    echo $c1"Restoring gnome settings "$nc
    echo "$c2$bold$k "$c2"Config items copied $nc"
    echo "Setting git global configs"
    git config --global user.name "$HOST-$USER"
    git config --global user.email "manuhegdev@gmail.com"
    echo 'git config --global user.name "$HOST-$USER"'
    echo 'git config --global user.email "manuhegdev@gmail.com"'
    cp _git/config .git/
    git config  --global alias.pushall '!git remote | xargs -L1 git push'

fi
