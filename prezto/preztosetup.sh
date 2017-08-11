#prezto
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
rm ~/.zshrc
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do 
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" 
done

git clone  git://github.com/zsh-users/zsh-autosuggestions "${ZDOTDIR:-$HOME}/.zprezto/plugins/zsh-autosuggestions"
echo source "${ZDOTDIR:-$HOME}/.zprezto/plugins/zsh-autosuggestions"/zsh-autosuggestions.zsh >> .zpreztorc
ls -lia | grep -E "^[0-9]+ l"
#zprezto-update
