nmap <silent> <space><space> <Plug>(Fzm)
vmap <silent> <space><space> <Plug>(FzmVisual)

" 참고: https://github.com/laher/fuzzymenu.vim/blob/master/plugin/fuzzymenu.vim
call fuzzymenu#AddAll({
            \ 'git add %': {'exec': 'Git add %'},
            \ 'git restore %': {'exec': 'Git restore %'},
            \ 'git stash': {'exec': 'Git stash'},
            \ 'git commit': {'exec': 'Git commit'},
            \ }, {'tags': ['git']})

