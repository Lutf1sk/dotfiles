alias ls="ls --color=always"

alias mkd="mkdir"
alias mkf="touch"
alias mk="make"

alias pac="sudo pacman -S"
alias pacs="pacman -Ss"
alias pacu="sudo pacman -Syu"
alias pacy="sudo pacman -Syy"
alias pacr="sudo pacman -Rs"

alias yays="yay -Ss"
alias yayu="yay -Syu"
alias yayy="yay -Syy"
alias yayr="yay -Rs"

alias gadd="git add"
alias gmv="git mv"
alias grm="git rm"
alias gcom="git commit"
alias gdiff="git diff"
alias gpush="git push origin"
alias gpull="git pull origin"
alias gstat="git status"
alias gclone="git clone --recursive"
alias glog="git log"
alias gamnd="git commit --amend"
alias grst="git reset"

alias cls="clear"
alias zip="zip -r"

function fish_greeting
	echo ""
	neofetch
end
