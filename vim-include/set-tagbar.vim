nnoremap \t :TagbarToggle<CR>:e<CR>

let g:tagbar_sort = 0
let g:tagbar_compact = 1
" let g:tagbar_show_data_type = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = "bottomleft"

augroup tagbar_custom_color
    autocmd FileType tagbar syntax match tagbar_ignore_char /·/
    autocmd FileType tagbar hi def link tagbar_ignore_char Comment
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
