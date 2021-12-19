# bash_profile

export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# git-flow-completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion#homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export GOPATH=$(go env GOPATH)

if [[ ! "$PATH" == *$GOPATH/bin* ]]; then
    export PATH=$PATH:$GOPATH/bin
fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

