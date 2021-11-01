[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh --group-directories-first --color=always'

eval "$(starship init bash)"
