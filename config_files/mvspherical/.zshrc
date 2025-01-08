export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export LANG=en_US.UTF-8
export PATH=$PATH:/opt/homebrew/bin
export ZSH="/Users/manu/.zsh/.oh-my-zsh"
# Set the path for zsh history file
HISTFILE=~/.zsh/.zsh_history

# Set the path for zcompdump file
typeset -gx ZSH_COMPDUMP="${HOME}/.zsh/.zcompdump-${HOST}-${ZSH_VERSION}"
export ZSH_SESSION_FILE_DIR=~/.zsh/sessions

#export DYLD_LIBRARY_PATH=/opt//homebrew/anaconda3/envs/cuspa/lib:/opt//homebrew/anaconda3/lib/

ZSH_THEME="gk1000"

plugins=(git zsh-autosuggestions colorize history sudo fasd command-not-found)
setopt hist_save_no_dups hist_ignore_all_dups hist_ignore_space
source $ZSH/oh-my-zsh.sh


##
## dev tools setup ##
##

if [ -f '/Users/manu/dev/.dev_env/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/manu/dev/.dev_env/google-cloud-sdk/path.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"



 osh() {
    last_command=$(fc -ln -1)
    last_command=$(echo "$last_command" | sed 's/^[[:space:]]*//')
    last_output=$(eval "$last_command")
    retVal=$?
    if [ $retVal -ne 0 ]; then
        osh_py "$last_command" "$last_output" "$retVal"
    else
        echo "Your last command ran successfully. Please summon me only when something goes wrong."
    fi
}

source ~/.cargo/env

## 
## Paths and addn configs
##

export PATH=~/dev/cuda/cuda-gdb-darwin-11.7.50-31170419/bin:$PATH
export PATH=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home/bin:$PATH

export PATH=/Users/manu/dev/farmTV-service/google-cloud-sdk/bin:$PATH
# The next line enables shell command completion for gcloud.
if [ -f '/Users/manu/dev/farmTV-service/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/manu/dev/farmTV-service/google-cloud-sdk/completion.zsh.inc'; fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


##
## Aliases and variables 
##
alias cprj='cd  ~/dev/UW/cap_prj'
alias llms='cd /Volumes/OVERFLOW/0.UW-Capstone/LLM-weights'
alias mvsc='~/misc/move_screenshots.sh'
alias b64d='base64 -d <<<'
alias gs='git status'
alias ga='git add -A'
alias gi='git ls-files . --ignored --exclude-standard --others'
alias notes='cd ~/notes'
alias ocnotes='cd ~/Library/CloudStorage/OneDrive-Personal/notes/e-medulu'
alias icnotes='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/notes/e-medulu/'
alias icloud='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/'
alias gfo='git fetch origin'
alias gpom='git push origin main'
alias gpoma='git push origin master'
alias gph='git push origin head'
alias dev='~/dev/'
##
## UW
##

export CAM_ENV=local
alias afml='cd ~/dev/UW/CAM/afm_lambda'
alias afmr='cd ~/dev/UW/CAM/afm-react-frontend'
alias tbd='cd /Volumes/OVERFLOW/telegram-dekstop-build'
alias assn='cd ~/dev/UW/assignments'
alias cam='cd ~/dev/UW/CAM'
alias gcpd='git checkout play-default'
alias gppd='git push origin play-default'
