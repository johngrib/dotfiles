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
