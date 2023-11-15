clear

echo "\033[1;31m            _               "
echo "\033[1;33m           | |              "
echo "\033[1;32m    _______| |__  _ __ ___  "
echo "\033[1;36m   |_  / __| '_ \| '__/ __| "
echo "\033[1;34m  _ / /\__ \ | | | | | (__  "
echo "\033[1;35m (_)___|___/_| |_|_|  \___| "
echo "\033[1;0m"

echo "Welcome. TTY loading..."
echo "Setting Oh My Zsh variables..."

export ZSH="/Users/james.wright/.oh-my-zsh"
ZSH_THEME="xiong-chiamiov"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(zsh-syntax-highlighting zsh-autosuggestions)

zstyle ':omz:update' mode auto

echo "Now loading Oh My Zsh..."
source $ZSH/oh-my-zsh.sh

echo "Setting alias'..."
alias vimdiff='nvim -d'
alias vim="nvim"
alias vi="nvim"
alias cat="bat"
# macOS specific
# alias update="brew upgrade;set-last-update-time;tput bel"

echo "Exporting custom variables..."
export EDITOR=nvim

echo "Sourcing scripts..."
source ~/.scripts

# macOS specific
# echo "Checking if updates are needed..."
# UPDATE_NEEDED=$(check-if-update-needed)
# UPDATE_NEEDED=$((UPDATE_NEEDED))
# 
# if [[ UPDATE_NEEDED -eq 1 ]]
# then
#     clear
#     echo "Brew hasn't been updated in over 30 days - update is needed."
#     if read -q "choice?Press Y to continue, or anything else to dismiss... "
#     then
#         clear
#         update
#         echo "Up to date"
#     fi
# fi

echo "\n"

clear
