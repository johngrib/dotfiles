
nnoremap \? :vs ~/dotfiles/vim-include/set-backslash.vim<CR>
" nnoremap \<BS> :vs ~/Dropbox/localwiki/_wiki/todo.md<CR>
nnoremap \u :UltiSnipsEdit<CR>
" nnoremap \u :call UltiSnipsToggle()<CR>
nnoremap \h :UltiSnipsEdit help<CR>
" nnoremap \z :MundoToggle<CR>
nnoremap \r :RainbowToggle<CR>
" nnoremap \d :MacDictWord<CR>
" nnoremap \\d :MacDictQuery<CR>

nnoremap \n :Files ~/dotfiles/vim-memo<CR>
nnoremap \\n :e ~/dotfiles/vim-memo/

nnoremap \m :MinimapRefresh<CR>:MinimapToggle<CR>

nnoremap \c :Copilot disable
nnoremap \\c :Copilot enable

" vimgrep 예제
" :vimgrep /pattern/ **
" :vimgrep pattern **   하위의 모든 경로에서 찾기
" :vimgrep pattern %    현재 파일 내에서만 찾기
" :vimgrep pattern **/*.txt   하위의 모든 txt 파일에 찾기
nnoremap \/ :vimgrep //j **<left><left><left><left>
nnoremap \\/ :vimgrep //j **<left><left><left><left>
