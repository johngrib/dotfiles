" quickfix 관리

nmap <script> <silent> <Tab>ql :call ToggleLocationList()<CR>
nmap <script> <silent> <Tab>qq :call ToggleQuickfixList()<CR>
" quickfix 다음/이전 이동
nnoremap <Tab>qn :cnext<CR>
nnoremap <Tab>qN :cprevious<CR>

