let g:fzf_launcher = "In_a_new_term_function %s"
imap <C-x><C-l> <plug>(fzf-complete-line)

nnoremap <f1> <nop>
" nnoremap <nowait> <f1><f1> :call FzfOmniFiles()<CR>
" nnoremap <nowait> <f1><f1> :Files<CR>
" nnoremap <nowait> <f1><f2> :Buffers<CR>
" nnoremap <nowait> <f1><f3> :History<CR>
nnoremap <nowait> <f1><F7> :execute ":Tags " . expand('<cword>')<CR>
nnoremap <nowait> <F1><F12> :Snippets<CR>
" nnoremap <nowait> <f1><CR> :Marks<CR>
nnoremap <f1>a :Ag<CR>
nnoremap <f1>l :Lines<CR>
nnoremap <f1>; :History:<CR>
" nnoremap <f1>/ :History/<CR>
nnoremap <f1>t :Tags ^<CR>
" nnoremap <f3> :execute ":Tags " . expand('<cword>')<CR>
nnoremap <f1><PageDown> :UltiSnipsEdit<CR>

" nnoremap <f1>d :call fzf#vim#tags('^', {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <f1>u call fzf#vim#ag('', {'options': '--select-2'})

" gem install coderay
" let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -' .&lines.'"'
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

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
endfunction

let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-q': function('s:build_quickfix_list'),
            \ }

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
