[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh --group-directories-first --color=always'

[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

eval "$(starship init bash)"
