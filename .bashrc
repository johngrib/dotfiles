if [[ ! "$PATH" == *~/.local/bin* ]]; then
    PATH="$PATH:~/.local/bin"
fi
if [[ ! "$PATH" == *~/.cargo/bin* ]]; then
    PATH="$PATH:~/.cargo/bin"
fi

if [ -z "`echo $PATH | grep -o /dotfiles-home/bin/`" -a "`hostname -s`" == "JohnGribAtHome" ]; then
    PATH="$PATH:~/Dropbox/dotfiles-home/bin/"
elif [ -z "`echo $PATH | grep -o /dotfiles-arti/bin/`" -a "`hostname -s`" == "JohnGribAtArti" ]; then
    PATH="$PATH:~/Dropbox/dotfiles-arti/bin/"
fi

export JAVA_HOME=$(/usr/libexec/java_home)
export TERM=xterm-256color

# history setting
export HISTCONTROL=ignoreboth
export HISTSIZE=1000000
export HISTFILESIZE=1000000000
export HISTTIMEFORMAT="%F %T "
shopt -s histappend     # 히스토리 파일 뒤에 추가한다
shopt -s cmdhist        # 여러 줄에 걸쳐 작성된 멍령을 세미콜론으로 연결된 하나의 문장으로 저장

# fzf
export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"
export FZF_DEFAULT_OPTS="--bind=ctrl-space:print-query --cycle"

# less color
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'

# vim, tmux
export EDITOR=$(which vim)
# export MANPAGER=vimpager

# aliases
if ls --version > /dev/null 2>&1; then
    alias ls='ls --color=auto'; #gnu
    alias l.='ls -d .* --color=auto'
else
    alias ls='ls -G'; #osx
    alias l.='ls -dG .*'
fi
alias ll='ls -alh'
alias vi='mvim -v'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias cd..='cd ..'
alias eclimd='~/Applications/Eclipse_neon.app/Contents/Eclipse/eclimd'
alias ctags='`brew --prefix`/bin/ctags'
alias tmux="TERM=screen-256color tmux"
alias tm="tmux attach || tmux new"
#alias vimr='open -a VimR.app "$@"'
alias ag='ag --path-to-ignore ~/.agignore'
alias agl='ag --pager="less -XFR"'
alias ncd='ncdu --color dark -rr -x'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias bc='bc -l ~/.bcrc -q'

# colors
GREEN='\e[0;32m\]'
B_GREEN='\e[1;32m\]'
MAGENTA='\e[0;35m\]'
B_MAGENTA='\e[1;35m\]'
YELLOW='\e[0;33m\]'
B_YELLOW='\e[1;33m\]'
RED='\e[0;31m'
BLUE='\e[0;34m'
B_BLUE='\e[1;34m'
CYAN='\e[0;36m\]'
COLOR_END='\[\033[0m\]'

# PROMPT ----------------------------------------------------------------------
# PS1="\h:\W \u\$ "  # default promopt
export PS1="${MAGENTA}\$(date +%Y-%m-%d-%a) ${B_YELLOW}\$(date +%T) ${GREEN}\u ${B_MAGENTA}\h ${B_BLUE}\w ${COLOR_END}\$(/usr/local/bin/githud bash)\n\$ "


# PROMPT_COMMAND="share_history; $PROMPT_COMMAND"

[ -f ~/.local/bin/git-completion.bash ] && source ~/.local/bin/git-completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -e ~/.phpbrew/bashrc ] && source ~/.phpbrew/bashrc
[ -f ~/.local/bin/fav-dir.sh ] && source ~/.local/bin/fav-dir.sh
bind '"\ev": "fav\C-m"'

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

function exam {
    wiki=`stat -f "%N" ~/Dropbox/johngrib.github.io/_wiki`

    if [ "$1" = "-l" ]; then
        egrep 'tags\s*:.*command( |$)' $wiki/* -l 2> /dev/null \
            | xargs grep 'summary' \
            | sed "s,"$wiki"/,,; s,\.md:summary,," \
            | column -ts':' | sort
        return 0
    fi

    file=`egrep 'tags\s*:.*command( |$)' $wiki/* -l 2> /dev/null \
        | egrep "/$1.md$"`

    if [ "$file" = "" ]; then
        echo $wiki/$1.md : No such file.
        return 0
    fi

    starts=`grep ':toc' $file -n | cut -d':' -f1`

    cat $file | tail -n +$((starts+1)) \
        | egrep -v "^\`\`\`" \
        | sed -E 's/^\$/ /' \
        | pygmentize -l sh \
        | less -XRF
    }

function todo {
    file1=`stat -f "%N" ~/Dropbox/git/localwiki/_wiki/todo.md`
    file2=`stat -f "%N" ~/Dropbox/git/localwiki/_wiki/times.md`

    if [ "$1" = "edit" ]; then
        vim $file1 $file2
        return 0
    fi

    start=2
    last=`egrep -n '^# In Progress$' $file1 | cut -d: -f1`
    last=$(($last - 1))
    esc=$(printf '\033')

    head -$last $file1 \
        | egrep -v '^\s*$' \
        | egrep -v '^\s*\*\s*\[X\]' \
        | tail -n +$start \
        | sed -E "s,^\*,${esc}[32m&${esc}[0m," \
        | sed -E "s,([0-9]+-){2}[0-9]+,${esc}[33m&${esc}[0m,"
}

function google() {
    open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1";
}


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
