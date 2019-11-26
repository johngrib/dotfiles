#!/usr/bin/env bash

function droller() {
    tmp_file="/tmp/droller-temp-file"
    wiki=`stat -f "%N" ~/Dropbox/git/localwiki/_wiki`
    index="$wiki/links.md"
    cmd="$1"
    uri="$2"

    # status, s : 상태를 확인한다
    if [ "$cmd" == "status" -o "$cmd" == "s" ]; then
        head -1 $tmp_file | cut -c 42-
        return 0;
    fi

    # open, o : 현재 지정된 문서를 열어준다
    if [ "$cmd" == "open" -o "$cmd" == "o" ]; then
        head -1 $tmp_file | cut -d' ' -f4 | xargs open
        return 0;
    fi

    # top, t : 인덱스의 가장 위에 있는 문서를 선택한다
    if [ "$cmd" == "top" -o "$cmd" == "t" ]; then
        head -1 $index > $tmp_file
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
