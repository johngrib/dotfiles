#!/usr/bin/env bash

function exam {
    wiki=`stat -f "%N" ~/Dropbox/johngrib.github.io/_wiki`

    if [ "$wiki" = "" ]; then
        echo "invalid wiki location."
        return 0
    fi

    name=`egrep 'tag\s*:.*command( |$)' $wiki/* -l 2> /dev/null \
        | xargs egrep 'summary|title' \
        | awk -F':' 'NR%2==1 { name=$1; title=$3 } NR%2==0 { print name, ":", title, ":", $3 }' \
        | sed "s,"$wiki"/,," \
        | column -ts':' \
        | sort \
        | fzf --preview "tail -n +16 $wiki/{1} | bat -l md --color=always" --query="$1" \
        | cut -d' ' -f1 \
    `

    if [ "$name" = "" ]; then
        return 0
    fi

    bat $wiki/$name

    return 0
}
