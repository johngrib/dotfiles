

"** tmux
let g:tagbar_type_tmux = {
    \ 'ctagstype' : 'tmux',
    \ 'sort': 0,
    \ 'kinds' : [
        \ 't:목차'
    \ ]
\ }

augroup tmux_config
    autocmd FileType tmux syntax match ClojureRefNs /\v^##+/
    autocmd FileType tmux highlight ClojureRefNs ctermfg=Green guifg=#e0c9b7
augroup END
