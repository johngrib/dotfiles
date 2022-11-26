
" Change cursor shape between insert and normal mode in iTerm2.app + tmux + vim
" https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  " insert 모드: | 모양 커서
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " normal 모드: █ 모양 커서
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  " replace 모드: _ 모양 커서
  let &t_SR = "\<esc>]50;CursorShape=2\x7"
endif

" 커서 위치 수직 하이라이트
highlight CursorColumn ctermbg=237 guibg=#3a3a3a

" multiple_cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" nnoremap <C-c> :call multiple_cursors#quit()<CR>

augroup johngrib_cursor
    " 마지막으로 수정된 곳에 커서를 위치함
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "norm g`\"" |
                \ endif
augroup END
