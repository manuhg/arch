# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh
  export www=/run/media/gk1000/1010/Webroot
  export NODE_ENV=development


ZSH_THEME="gk1000"
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
bindkey -e

DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions colorize history sudo fasd command-not-found)
setopt hist_save_no_dups hist_ignore_all_dups hist_ignore_space
source $ZSH/oh-my-zsh.sh


alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias gs='git status'
alias ga='git add -A'
alias gc='git commit'
alias gpom='git push origin master'
alias gpl='git pull origin master'
alias gpu='git pushall'
alias gco='git checkout'
alias grs='git reset'
alias ghist="git log --pretty=format:'%H %ad | %s%d [%an]' --graph --date=short"
alias git-secret='/usr/local/bin/git-secret'
alias lsl='ls -lia --group-directories-first'
alias dush="~/scripts/dush.sh"
alias ed='emacs --daemon'
alias et='emacsclient -t'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias nano='et'
alias pfm='prettier --single-quote --write "src/**/*.{js,jsx,json,css}"'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#tmux

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="/usr/local/sbin:$PATH:/opt/homebrew/bin:$JAVA_HOME/bin:/usr/local/opt/ruby/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/Software/ruby/bin"


export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/lib/pkgconfig"
export GEM_HOME=$HOME/Software/ruby


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/manu/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/manu/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/manu/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/manu/dev/google-cloud-sdk/completion.zsh.inc'; fi
