#!/usr/bin/env bash

export BASH_SILENCE_DEPRECATION_WARNING=1
export SDKROOT=$(xcrun --show-sdk-path)

if [[ $(uname -p) == 'arm' ]]; then
    # 프로세서가 arm 즉 Apple Silicon 이라면
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/sbin:$PATH"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    export PATH="/usr/local/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    eval "$(/usr/local/bin/brew shellenv)"
    export PATH="/usr/local/opt/node@16/bin:$PATH"
fi


eval "$(rbenv init - bash)"

# export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:~/.local/bin"

if [[ ! "$PATH" == *~/.cargo/bin* ]]; then
    # rust
    PATH="$PATH:~/.cargo/bin"
fi

PATH="$PATH:~/dotfiles/bin/"

# export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

export PATH="$PATH:~/.vim/plugged/vim-iced/bin"

# gvm: go version manager
test -s "$HOME/.gvm/scripts/gvm" && source "$HOME/.gvm/scripts/gvm"

# my bashrc
test -e ~/.bashrc && source ~/.bashrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
