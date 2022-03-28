
" function! UltiSnipsToggle()
"     let l:buffers = map(copy(getbufinfo()), 'v:val.name')
"     let l:count = 0
"     for buf_name in l:buffers
"         if buf_name =~ "snippet"
"             execute "bwipeout! " . buf_name
"             let l:count += 1
"         end
"     endfor
"     if l:count == 0
"         UltiSnipsEdit
"     endif
" endfunction

nnoremap \? :vs ~/dotfiles/vim-include/set-backslash.vim<CR>
nnoremap \<BS> :vs ~/Dropbox/localwiki/_wiki/todo.md<CR>
nnoremap \u :UltiSnipsEdit<CR>
" nnoremap \u :call UltiSnipsToggle()<CR>
nnoremap \h :UltiSnipsEdit help<CR>
nnoremap \z :MundoToggle<CR>
nnoremap \r :RainbowToggle<CR>
nnoremap \d :MacDictWord<CR>
nnoremap \\d :MacDictQuery<CR>
nnoremap \m :Files ~/dotfiles/vim-memo<CR>
nnoremap \\m :e ~/dotfiles/vim-memo/

nnoremap \c :Copilot disable
nnoremap \\c :Copilot enable

