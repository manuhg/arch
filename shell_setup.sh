#!/bin/zsh

if [  $# -eq 0 ]; then
    echo "Please enter an argument. backup or restore"
elif [ $1 = "backup" ] ; then
    cp ~/.zshrc /home/gk1000/arch/ohmyzsh/zshrc
    cp ~/.oh-my-zsh/themes/gk1000.zsh-theme /home/gk1000/arch/ohmyzsh/
    cp ~/.local/share/konsole/gk1000.profile /home/gk1000/arch/konsole/
elif [ $1 = "restore" ] ; then
    cp /home/gk1000/arch/ohmyzsh/zshrc ~/.zshrc
    cp /home/gk1000/arch/ohmyzsh/gk1000.zsh-theme ~/.oh-my-zsh/themes/gk1000.zsh-theme
    cp /home/gk1000/arch/konsole/gk1000.profile ~/.local/share/konsole/gk1000.profile
elif [ $1 = "install" ] ; then
    bash
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    cp /home/gk1000/arch/ohmyzsh/zshrc ~/.zshrc
    cp /home/gk1000/arch/ohmyzsh/gk1000.zsh-theme ~/.oh-my-zsh/themes/gk1000.zsh-theme
    cp /home/gk1000/arch/konsole/gk1000.profile ~/.local/share/konsole/gk1000.profile
fi
#./preztosetup.sh

#DWM, i3, openbox, bspwm
#pip install matplotlib numpy
#https://github.com/clvv/fasd.git
#cd fasd
#sudo make install

#backup
# cp ~/.zshrc /home/gk1000/arch/ohmyzsh/zshrc
# cp ~/.oh-my-zsh/themes/gk1000.zsh-theme /home/gk1000/arch/ohmyzsh/
# cp ~/.local/share/konsole/gk1000.profile /home/gk1000/arch/konsole/
#restore
# cp /home/gk1000/arch/ohmyzsh/zshrc ~/.zshrc 
# cp /home/gk1000/arch/ohmyzsh/gk1000.zsh-theme ~/.oh-my-zsh/themes/gk1000.zsh-theme
# cp /home/gk1000/arch/konsole/gk1000.profile ~/.local/share/konsole/gk1000.profile 
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#echo "export HISTIGNORE='history*:ls:[ \t]*'" >>~/.bashrc
#echo "export HISTORY_IGNORE=(history*|ls|[ \t]*)" >>~/.zshrc

#echo "alias pbcopy='xsel --clipboard --input'" >>~/.zshrc
#echo "alias pbpaste='xsel --clipboard --output'">>~/.zshrc