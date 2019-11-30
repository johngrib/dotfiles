#!/usr/bin/env bash

awk '/^#+ +[0-9]+% [0-9]+ \// { \
        point = int(100 * $3 / $5); \
        sub(/^(#+ +)[0-9]+/, $1 " " point); \
    }1' $1 > $1.replaced
cat $1.replaced > $1
\rm $1.replaced
