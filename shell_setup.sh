 
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#echo "export HISTIGNORE='history*:ls:[ \t]*'" >>~/.bashrc
#echo "export HISTORY_IGNORE=(history*|ls|[ \t]*)" >>~/.zshrc

#echo "alias pbcopy='xsel --clipboard --input'" >>~/.zshrc
#echo "alias pbpaste='xsel --clipboard --output'">>~/.zshrc
bash
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

#./preztosetup.sh

#DWM, i3, openbox, bspwm
cp konsole/gk1000.profile  ~/.local/share/konsole/gk1000.profile 
#pip install matplotlib numpy
https://github.com/clvv/fasd.git
cd fasd
sudo make install

yaourt -S --noconfirm urxvt-fullscreen urxvt-resize-font-git urxvt-tabbedex rxvt-unicode-terminfo
