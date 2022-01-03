
" https://github.com/kana/vim-textobj-user
" :help textobj-user

call textobj#user#plugin('entire', {
\   '-': {
\     'select-a-function': 'CurrentFileI',
\     'select-a': 'aE',
\     'select-i-function': 'CurrentFileI',
\     'select-i': 'iE',
\   },
\ })

function! CurrentFileI()
  normal! gg0
  let head_pos = getpos('.')
  normal! G$
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

