#if [ -f ~/.bash_etc ]; then
#    . ~/.bash_etc
#fi

PATH=".:/usr/local/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000
export TERM=xterm-256color
export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
export MANPAGER=vimpager
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export EDITOR=$(which vim)

# aliases ---------------------------------------------------------------------

if ls --version > /dev/null 2>&1; then
  alias ls='ls --color=auto'; #gnu
else
  alias ls='ls -G'; #osx
fi

alias l.='ls -d .* --color=auto'
alias ll='ls -alh'
alias vi='mvim -v'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias cd..='cd ..'
alias eclimd='~/Applications/Eclipse_neon.app/Contents/Eclipse/eclimd'
#alias vimr='open -a VimR.app "$@"'
alias ctags='`brew --prefix`/bin/ctags'

alias tmux="TERM=screen-256color tmux"
alias tm="tmux attach || tmux new"

# alias composer='/usr/bin/php target/composer'
alias ag='ag --path-to-ignore ~/.agignore'
alias ncd='ncdu --color dark -rr -x'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias bc='bc -l ~/.bcrc -q'

# colors ----------------------------------------------------------------------
GREEN='\e[0;32m\]'
B_MAGENTA='\e[1;35m\]'
YELLOW='\e[0;33m\]'
RED='\e[0;31m'
COLOR_END='\[\033[0m\]'

# PROMPT ----------------------------------------------------------------------
# PS1="\h:\W \u\$ "  # default promopt
TIMESTAMP='\D{%F %a %T}'
GIT_BRANCH=''
if [ $(which vcprompt 2> /dev/null) ]; then
  GIT_BRANCH="\$(vcprompt -f '[%b %r] ${RED}%u %m${COLOR_END}')"
fi
export PS1="${YELLOW}${TIMESTAMP} ${GREEN}\u ${B_MAGENTA}\h ${YELLOW}\w ${COLOR_END} \$(/usr/local/bin/githud bash)\n\$ "

function google() {
    open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1";
}

[ -f ~/.local/bin/git-completion.bash ] && source ~/.local/bin/git-completion.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND="share_history; $PROMPT_COMMAND"
shopt -u histappend

[ -f ~/.local/bin/fav-dir.sh ] && source ~/.local/bin/fav-dir.sh

eval $(thefuck --alias)

function bgcolors {
    for((i=16; i<256; i++)); do
        printf "\e[48;5;${i}m%03d" $i;
        printf '\e[0m';
        [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
    done

    for((i=30; i<112; i++)); do
        printf "\e[0;${i}m\]%03d" $i;
        printf '${i}' $i;
        [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
    done
}
