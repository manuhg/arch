if [ $1 -eq 1 ]
#backup
cp ~/.zshrc /home/gk1000/arch/ohmyzsh/zshrc
cp ~/.oh-my-zsh/themes/gk1000.zsh-theme /home/gk1000/arch/ohmyzsh/
cp ~/.local/share/konsole/gk1000.profile /home/gk1000/arch/konsole/
#restore
cp /home/gk1000/arch/ohmyzsh/zshrc ~/.zshrc 
cp /home/gk1000/arch/ohmyzsh/gk1000.zsh-theme ~/.oh-my-zsh/themes/gk1000.zsh-theme
cp /home/gk1000/arch/konsole/gk1000.profile ~/.local/share/konsole/gk1000.profile