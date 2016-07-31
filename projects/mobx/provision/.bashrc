cd ~/repository
bind '"\C-f":vi-fWord'
bind '"\C-b":vi-bWord'
PS1='${debian_chroot:+($debian_chroot)}\n\u@\h: \W$(__git_ps1) · '

alias rm="rm -rf"
alias ll="ls -lah"
alias ls="ls -lah"

alias GitCreatePatchOfRepo="git add -A . && git diff HEAD"

export PATH=$PATH:/home/$USER/.nodenv/bin
export PATH=$PATH:/home/$USER/.nodenv/versions/6.3.0/bin/

eval "$(nodenv init -)"
source <(npm completion)

