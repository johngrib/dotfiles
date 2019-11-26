#!/usr/bin/env bash

function droller() {
    tmp_file="/tmp/droller-temp-file"
    wiki=`stat -f "%N" ~/Dropbox/git/localwiki/_wiki`
    index="$wiki/links.md"
    cmd="$1"
    uri="$2"

    if [ "$cmd" == "open" ]; then
        head -1 $index | cut -d' ' -f4 | xargs open
        return 0;
    fi

    if [ "$cmd" == "" ]; then
        sort -R $index | head -1 | awk "{ print $1 }" > $tmp_file
        cat $tmp_file
        return 0;
    fi

    if [ "$cmd" == "edit" ]; then
        vim $tmp_file
        if [ "$?" == "0" ]; then
            hash=`head -1 $tmp_file | cut -d ' ' -f1`
            grep -v $hash $index > test.txt
            cat $tmp_file >> test.txt
        fi
        return 0;
    fi


    if [ "$cmd" == "hash" ]; then
        openssl sha1 <<< $uri
        return 0

    elif [ "$cmd" == "add" ]; then
        hash=`openssl sha1 <<< $uri`

        grep $hash $index
        if [ "$?" == "0" ]; then
            echo "이미 존재하는 링크입니다."
            return 0;
        else
            printf "%s 0 [](%s )\n" $hash $uri >> $index
            echo $hash > $tmp_file
            echo "링크를 추가하였습니다."
            return 0;
        fi

    fi

    egrep '^https?:' <<< $1 > /dev/null
    if [ "$?" == "0" ]; then
        uri="$1"
        droller add $uri
        return 0
    fi
}
