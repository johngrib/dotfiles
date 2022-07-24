# bash_profile

export BASH_SILENCE_DEPRECATION_WARNING=1
export SDKROOT=$(xcrun --show-sdk-path)

if which pyenv > /dev/null; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init - bash)"

# export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:~/.local/bin"

if [[ ! "$PATH" == *~/.cargo/bin* ]]; then
    # rust
    PATH="$PATH:~/.cargo/bin"
fi

if [ -z "`echo $PATH | grep -o /dotfiles-home/bin/`" -a "`hostname -s`" == "JohnGribAtHome" ]; then
    PATH="$PATH:~/Dropbox/dotfiles-home/bin/"
elif [ -z "`echo $PATH | grep -o /dotfiles-com/bin/`" -a "`hostname -s`" == "UseruiMBookPro2" ]; then
    PATH="$PATH:~/Dropbox/dotfiles-com/bin/"
fi

# export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

export PATH="$PATH:~/.vim/plugged/vim-iced/bin"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# git-flow-completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion#homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

