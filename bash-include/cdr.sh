#!/usr/bin/env bash

function cdr() {
    pre=""
    to=`
        for loc in $(echo $PWD | sed 's,/,\'$'\n/,g'); do
            pre="$pre$loc"
            echo $pre
        # done | sort -r | fzf --preview "tree -L 1 -d {}" --ansi
        done | sort -r | fzf --ansi --preview "ls -alhG {}"
    `
    cd $to
}
