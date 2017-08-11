setopt EXTENDED_GLOB
rm ~/.zshrc
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do 
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" 
done

echo source "${ZDOTDIR:-$HOME}/.zprezto/plugins/zsh-autosuggestions"/zsh-autosuggestions.zsh >> .zpreztorc
ls -lia | grep -E "^[0-9]+ l"

