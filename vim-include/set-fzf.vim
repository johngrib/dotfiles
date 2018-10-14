
" fzf
let g:fzf_launcher = "In_a_new_term_function %s"
imap <C-x><C-l> <plug>(fzf-complete-line)

" nnoremap <f1>f :call FzfOmniFiles()<CR>
nnoremap <f1> <nop>
nnoremap <f1><f1> :Files<CR>
nnoremap <f1>a :Ag<CR>
nnoremap <f1>l :Lines<CR>
nnoremap <f1>m :Marks<CR>
" nnoremap <f1>o :Locate getcwd()
nnoremap <f1>h :History<CR>
nnoremap <f1>c :History:<CR>
nnoremap <f1>/ :History/<CR>
nnoremap <f1>t :Tags ^<CR>
nnoremap <f1><f2> :Buffers<CR>
nnoremap <f3> :execute ":Tags " . expand('<cword>')<CR>
" gem install coderay
" let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -' .&lines.'"'
command! -bang -nargs=* History call fzf#vim#history(fzf#vim#with_preview())
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GitFiles
    endif
endfunc

