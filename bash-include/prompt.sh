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
COLOR_END='\e[0m'

# PS1="\h:\W \u\$ "  # default promopt
function gbr {
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        branch="$(git branch --show-current)"
        branch_str="\033[1;031m$branch\033[0m"

        stat=$(git status --short \
            | cut -c 1-3 \
            | sort | uniq -c \
            | tr -d ' ' \
            | xargs)

        stash_size=$(git stash list | wc -l | sed 's/ //g')
        stash_icon=" \e[0;92m≡\033[0m"
        printf "[$branch_str] $stat$stash_icon$stash_size"
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


