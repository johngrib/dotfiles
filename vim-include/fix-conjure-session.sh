#!/usr/bin/env bash

# say "fix conjure session"
__CONJURE_SESSIONS=`ag "conjure-log-\d+.cljc" -l ~/.local/share/nvim/session`
# ag "conjure-log-\d+.cljc" -l ~/.local/share/nvim/session \
#     | xargs perl -i -pe 'BEGIN{undef $/;} s,\senew\sfile .*?conjure-log-[0-9]*?.cljc\s.*?tabnext 1,,smg'
# say "$__CONJURE_SESSIONS"
echo "$__CONJURE_SESSIONS"
[ "$__CONJURE_SESSIONS" ] && perl -i -pe 'BEGIN{undef $/;} s,\senew\sfile .*?conjure-log-[0-9]*?.cljc\s.*?tabnext 1,,smg' $__CONJURE_SESSIONS
[ "$__CONJURE_SESSIONS" ] && perl -i -pe 'BEGIN{} s,^exe .*?2resize .*?$,,s' $__CONJURE_SESSIONS
