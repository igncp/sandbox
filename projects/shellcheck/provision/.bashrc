cd ~/repository
export PATH=$PATH:~/.local/bin
bind '"\C-f":vi-fWord'
bind '"\C-b":vi-bWord'
PS1='${debian_chroot:+($debian_chroot)}\n\u@\h: \W$(__git_ps1) · '

alias rm="rm -rf"
alias ll="ls -lah"
alias ls="ls -lah"