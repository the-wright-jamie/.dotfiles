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
plugins=(zsh-syntax-highlighting)

zstyle ':omz:update' mode auto

echo "Now loading Oh My Zsh..."
source $ZSH/oh-my-zsh.sh

echo "Exporting custom variables..."
export EDITOR=nvim

echo "Sourcing scripts..."
source ~/.scripts
echo "\n"

clear