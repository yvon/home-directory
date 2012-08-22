export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"

export PS1="\[\e[1;32m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]"
export TERM="rxvt-256color"
export CDPATH="$HOME/work"
export EDITOR="vim"

eval "$(rbenv init -)"

alias be='bundle exec'
alias emacs='emacs -nw'
alias ls='ls --color=auto'
alias keyboard_yvon="setxkbmap us -variant altgr-intl; xmodmap ~/.Xmodmap"
alias keyboard_alex="setxkbmap fr; xmodmap ~/.Xmodmap"
alias grep="grep --color=always"
alias less="less -RS"

source ~/.git-completion.sh
stty -ixon
