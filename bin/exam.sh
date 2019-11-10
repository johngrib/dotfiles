function exam {
    wiki=`stat -f "%N" ~/Dropbox/johngrib.github.io/_wiki`

    if [ "$1" = "-l" ]; then
        egrep 'tag\s*:.*command( |$)' $wiki/* -l 2> /dev/null \
            | xargs grep 'summary' \
            | sed "s,"$wiki"/,,; s,\.md:summary,," \
            | column -ts':' | sort
                    return 0
    fi

    file=`egrep 'tag\s*:.*command( |$)' $wiki/* -l 2> /dev/null \
        | egrep "/$1.md$"`

    if [ "$file" = "" ]; then
        echo $wiki/$1.md : No such file.
        return 0
    fi

    starts=`grep ':toc' $file -n | cut -d':' -f1`

    cat $file | tail -n +$((starts+1)) \
        | sed -E 's/^\$/ /' \
        | pygmentize -l sh \
        | less -XRF
    }
