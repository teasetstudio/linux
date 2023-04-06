#Base
alias ..='cd ..'
alias c='clear'
alias nanoal='nano ~/.bash_aliases'
alias catal='cat ~/.bash_aliases'
alias rmn='sudo rm -rf node_modules/'
alias h=history

alias sshgen='ssh-keygen -t ed25519 -C "teasetx@gmail.com";cat ~/.ssh/id_ed25519.pub;'

alias killport="fuser -k -n tcp"
alias setal='cp .bash_aliases ~/.bash_aliases'

# Git
alias gs='git status'
alias gco='git checkout'
alias gb='git branch'
alias gdel='git branch -D'
alias gnew='git log HEAD@{1}..HEAD@{0}'
alias gres='git reset HEAD~1'

gp() {
   echo "git add -A"
   git add -A;
   echo "git commit -m\"$1\""
   git commit -m"$1";
   echo "git push origin $(git symbolic-ref --short HEAD)"
   git push origin $(git symbolic-ref --short HEAD);
}

gpf() {
   echo "git add -A"
   git add -A;
   echo "git commit -m\"$1\""
   git commit -m"$1";
   echo "git push origin $(git symbolic-ref --short HEAD)"
   git push -f origin $(git symbolic-ref --short HEAD);
}
