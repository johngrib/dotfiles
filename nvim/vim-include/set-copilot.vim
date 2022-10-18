
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" inoremap <silent><script><expr> <Tab> pumvisible() ? "\<C-y>" : copilot#Accept("\<CR>")
