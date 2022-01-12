
augroup vim_conjure
    " Goto the definition
    autocmd FileType clojure nmap <silent> <C-]> <localleader>gd
    " autocmd FileType clojure let g:conjure#mapping#doc_word = ["\<Tab>d"]
    let g:conjure#mapping#prefix = "<leader>"
augroup END
