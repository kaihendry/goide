[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh --group-directories-first --color=always'

. /usr/share/autojump/autojump.bash

eval "$(starship init bash)"
