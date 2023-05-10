"* Tagbar 설정

nnoremap \t :TagbarToggle<CR>:e<CR>
nnoremap \\t :TagbarOpen f<CR>

let g:tagbar_sort = 0
let g:tagbar_compact = 1
" let g:tagbar_show_data_type = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_autopreview = 0
let g:tagbar_previewwin_pos = "bottomleft"

let g:tagbar_position = "leftabove vertical"
" let g:tagbar_position = "rightbelow vertical"
" let g:tagbar_position = "botright vertical"
let g:tagbar_map_showproto = ""
let g:tagbar_map_previewwin = "<Space>"
" let g:tagbar_width = 30

augroup tagbar_custom_config
    autocmd FileType tagbar syntax match tagbar_ignore_char /·/
    autocmd FileType tagbar highlight tagbar_ignore_char ctermfg=DarkGrey guifg=DarkGrey

    autocmd FileType tagbar syntax match tagbar_bdd_describe /·*describe .*/
    autocmd FileType tagbar highlight tagbar_bdd_describe ctermfg=LightGreen guifg=LightGreen

    autocmd FileType tagbar syntax match tagbar_bdd_context /·*context .*/
    autocmd FileType tagbar highlight tagbar_bdd_context ctermfg=LightBlue guifg=LightBlue

    autocmd FileType tagbar syntax match tagbar_bdd_it /·*it .*/
    autocmd FileType tagbar highlight tagbar_bdd_it ctermfg=LightRed guifg=LightRed

    autocmd FileType tagbar nmap <c-j> jP
    autocmd FileType tagbar nmap <c-k> kP
    autocmd FileType tagbar nmap \\t> :let g:tagbar_position = "rightbelow vertical"<CR>:TagbarClose<CR>:TagbarOpen<CR>
    autocmd FileType tagbar nmap \\t< :let g:tagbar_position = "leftabove vertical"<CR>:TagbarClose<CR>:TagbarOpen<CR>
augroup END

"* 잡다한 Language별 설정
"** asciidoc
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
