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

alias ll='ls -alF'
alias models="cd ~/git/eigen-models"
alias gits="cd ~/git"
alias check-fs="du -sh *(D) | grep G"
alias clip="xclip -sel c < "
alias pic="flameshot gui -d 4000"

export PYTHONPATH="$PYTHONPATH:~/git/eigen-models"

export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export PATH=/usr/lib/postgresql/10/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export PYTHONPATH="$PYTHONPATH:/home/jacob/git/eigen-models"
fpath=($fpath "/home/jacob/.zfunctions")
