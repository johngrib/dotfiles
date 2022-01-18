
augroup vim_conjure
    " Goto the definition
    autocmd FileType clojure nmap <silent> <C-]> <localleader>gd
    " autocmd FileType clojure let g:conjure#mapping#doc_word = ["\<Tab>d"]
    let g:conjure#mapping#prefix = "<leader>"

    autocmd FileType clojure set sessionoptions=blank,curdir,folds,help,tabpages,winsize
    autocmd VimEnter * call system("~/.config/nvim/vim-include/fix-conjure-session.sh")
augroup END

" https://github.com/Olical/conjure/issues/244
