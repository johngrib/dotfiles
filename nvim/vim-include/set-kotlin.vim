" Kotlin

if exists("g:loaded_kotlin_setting") || &cp
  finish
endif
let g:loaded_kotlin_setting = 1

" https://github.com/fwcd/kotlin-language-server/blob/main/EDITORS.md#vim
let g:LanguageClient_serverCommands = {
    \ 'kotlin': ["kotlin-language-server"],
    \ }

augroup vim_kotlin_coc
    autocmd FileType kotlin nmap <silent> <C-]> <Plug>(coc-definition)
    autocmd FileType kotlin nmap <silent> gy <Plug>(coc-type-definition)
    autocmd FileType kotlin nmap <silent> gr <Plug>(coc-references)
    " autocmd VimLeavePre clojure TagbarClose
augroup END
