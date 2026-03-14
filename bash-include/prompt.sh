#!/usr/bin/env bash

# colors
GREEN='\e[0;32m'
B_GREEN='\e[1;32m'
MAGENTA='\e[0;35m'
B_MAGENTA='\e[1;35m'
YELLOW='\e[0;33m'
B_YELLOW='\e[1;33m'
RED='\e[0;31m'
BLUE='\e[0;34m'
B_BLUE='\e[1;34m'
CYAN='\e[0;36m'
B_RED='\e[1;31m'
B_CYAN='\e[1;36m'
B_GREEN_LIGHT='\e[0;92m'
COLOR_END='\e[0m'

# PS1="\h:\W \u\$ "  # default promopt
function gbr {
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        branch="$(git branch --show-current)"
        branch_str="${B_RED}$branch${COLOR_END}"

        stat=$(git status --short 2> /dev/null \
            | cut -c 1-3 \
            | sort | uniq -c \
            | tr -d ' ' \
            | xargs)

        hash_str="${CYAN}$(git rev-parse --short HEAD 2>/dev/null)${COLOR_END}"
        stash_size=$(git stash list 2> /dev/null | wc -l | sed 's/ //g')
        stash_icon=" ${B_GREEN_LIGHT}≡${COLOR_END}"
        printf "[$hash_str][$branch_str] $stat$stash_icon$stash_size"
        return 0
    fi
}

export PS1="${MAGENTA}\$(date '+%Y-%m-%d-%a %VW') \
${B_YELLOW}\$(date +%T) \
${GREEN}\u \
${B_MAGENTA}\h \
${B_BLUE}\w \
${COLOR_END}\
\$(gbr)\n\$ "
