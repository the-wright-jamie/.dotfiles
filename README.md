# .dotfiles

Here be .dotfiles and provisioning scripts...

# Example System .zshrc

```zsh
# For MacOS
export ZSH="/Users/[username]/.oh-my-zsh"
source ~/.zshrc-common

echo "Local, non-sync setup..."

# System-wide
export JAVA_HOME=""
export LDFLAGS="-L/opt/homebrew/opt/node@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@16/include"
export REQUESTS_CA_BUNDLE=""
export PATH="$PATH:[whatever]"

# Project specific
alias project='cd ~/GitHub/[project]'
export API_KEY=""

source ~/.zshrc-macos
```
