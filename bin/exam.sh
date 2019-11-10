function exam {
    wiki=`stat -f "%N" ~/Dropbox/johngrib.github.io/_wiki`

    if [ "$wiki" = "" ]; then
        echo "invalid wiki location."
        return 0
    fi

    name=`egrep 'tag\s*:.*command( |$)' $wiki/* -l 2> /dev/null \
        | xargs grep 'summary' \
        | sed "s,"$wiki"/,,; s,\.md:summary,," \
        | column -ts':' \
        | sort \
        | fzf --preview "pygmentize ~/Dropbox/johngrib.github.io/_wiki/{1}.md" \
        | awk '{print $1}' \
        `

    if [ "$name" = "" ]; then
        return 0
    fi

    bat ~/Dropbox/johngrib.github.io/_wiki/$name.md

    return 0

}
