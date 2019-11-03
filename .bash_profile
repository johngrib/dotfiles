# bash_profile

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
export SDKMAN_DIR="/Users/johngrib/.sdkman"
[[ -s "/Users/johngrib/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/johngrib/.sdkman/bin/sdkman-init.sh"
