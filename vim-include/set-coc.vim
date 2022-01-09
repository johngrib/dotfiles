inoremap <silent><expr> <c-space> coc#refresh()

" inoremap <expr> <C-j> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><script><expr> <Tab> pumvisible() ? "\<C-y>" : copilot#Accept("\<CR>")

