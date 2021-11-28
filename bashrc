[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh --group-directories-first --color=always'

PS1='goide-${COMMIT:-local}:\w\$ '
