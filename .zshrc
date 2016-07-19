export TERM=xterm-256color
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PATH="$HOME/.config/composer/vendor/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'
# alias vim="TERM=xterm-256color vim"
alias fig="docker-compose"
export GOPATH=$HOME/go
