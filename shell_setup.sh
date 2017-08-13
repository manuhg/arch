#!/bin/bash
archdir="/home/gk1000/arch"
if [  $# -eq 0 ]; then
    echo "Please enter an argument. backup or restore"
elif [ $1 = "backup" ] ; then
    [ -f "~/.zshrc" ] && cp ~/.zshrc $archdir/ohmyzsh/zshrc
    [ -f "~/.oh-my-zsh/themes/gk1000.zsh-theme" ] && cp ~/.oh-my-zsh/themes/gk1000.zsh-theme $archdir/ohmyzsh/
    [ -f "~/.local/share/konsole/gk1000.profile" ] && cp ~/.local/share/konsole/gk1000.profile $archdir/konsole/
    [ -f "~/.config/konsolerc" ] && cp ~/.config/konsolerc $archdir/konsole/
    [ -f "~/.tmux.conf" ] && cp ~/.tmux.conf ./tmux.conf
    [ -f "~/.Xresources" ] && cp ~/.Xresources ./Xresources.conf
elif [ $1 = "restore" ] ; then
    cp $archdir/ohmyzsh/zshrc ~/.zshrc
    cp $archdir/ohmyzsh/gk1000.zsh-theme ~/.oh-my-zsh/themes/gk1000.zsh-theme
    [ -d "~/.local/share/konsole" ] && cp $archdir/konsole/gk1000.profile  ~/.local/share/konsole/gk1000.profile 
    cp $archdir/konsole/ ~/.config/konsolerc
elif [ $1 = "install" ] ; then
    #pacman -S --noconfirm zsh
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
    cp $archdir/ohmyzsh/zshrc ~/.zshrc
    cp $archdir/ohmyzsh/gk1000.zsh-theme ~/.oh-my-zsh/themes/gk1000.zsh-theme
    [ -d "~/.local/share/konsole" ] && cp ~/.local/share/konsole/gk1000.profile $archdir/konsole/
    [ -f "~/.config/konsolerc" ] && cp ~/.config/konsolerc $archdir/konsole/
    chsh -s /bin/zsh
fi

#https://github.com/clvv/fasd.git
#cd fasd
#sudo make install
#echo "export HISTIGNORE='history*:ls:[ \t]*'" >>~/.bashrc
#echo "export HISTORY_IGNORE=(history*|ls|[ \t]*)" >>~/.zshrc
#echo "alias pbcopy='xsel --clipboard --input'" >>~/.zshrc
#echo "alias pbpaste='xsel --clipboard --output'">>~/.zshrc