nnoremap \t :TagbarToggle<CR>:e<CR>

nnoremap \\tl :let g:tagbar_position = "leftabove vertical"<CR>
nnoremap \\tr :let g:tagbar_position = "rightbelow vertical"<CR>

let g:tagbar_sort = 0
let g:tagbar_compact = 1
" let g:tagbar_show_data_type = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_autopreview = 0
let g:tagbar_previewwin_pos = "bottomleft"

let g:tagbar_position = "leftabove vertical"
" let g:tagbar_position = "rightbelow vertical"
let g:tagbar_map_showproto = ""
let g:tagbar_map_previewwin = "<Space>"

augroup tagbar_custom_config
    autocmd FileType tagbar syntax match tagbar_ignore_char /·/
    autocmd FileType tagbar hi def link tagbar_ignore_char Comment
    autocmd FileType tagbar nmap <c-j> jP
    autocmd FileType tagbar nmap <c-k> kP
augroup END

let g:tagbar_type_asciidoc = {
    \ 'ctagstype' : 'asciidoc',
    \ 'sort': 0,
    \ 'kinds' : [
        \ 'h:Heading'
    \ ]
\ }

augroup tagbar_global_config
    autocmd VimLeavePre * TagbarClose
augroup END
