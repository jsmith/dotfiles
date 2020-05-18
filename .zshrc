# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionfpath=($fpath "/home/jacob/.zfunctions")

# Set Spaceship ZSH as a prompt
fpath=($fpath "/home/jacob/.zfunctions")
autoload -U promptinit; promptinit
prompt spaceship

alias vi="vim"
alias vim="nvim"
alias ll='ls -alF'
alias check-fs="du -sh *(D) | grep G"
alias dl="youtube-dl --extract-audio -k --audio-format mp3 -o \"~/Downloads/SoundCloud/%(title)s.%(ext)s\""

export ANDROID_HOME="/usr/local/Caskroom/android-sdk/4333796"
export EDITOR="code"
export PATH="/Users/jacob/bin:$PATH"

export PATH="/Users/jacob/Library/Python/3.7/bin:$PATH"
fpath=($fpath "/home/jacob/.zfunctions")
