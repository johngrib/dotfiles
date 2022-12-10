" Rust

if exists("g:loaded_rust_setting") || &cp
    finish
endif

augroup vimrust
    " Common
    autocmd FileType rust nmap <silent> <c-]> <Plug>(coc-definition)

    " Code Typing: - "sc"
    autocmd FileType rust nmap sc <nop>
    autocmd FileType rust nmap scr <Plug>(coc-rename)

    " Code Analyse: - "sa"
    autocmd FileType rust nmap sa <nop>
    autocmd FileType rust nmap sar <Plug>(coc-references)

    autocmd FileType rust nmap <silent> <Tab>i <Plug>(coc-implementation)
    autocmd FileType rust nmap <silent> <Tab>[ <Plug>(coc-diagnostic-prev)
    autocmd FileType rust nmap <silent> <Tab>] <Plug>(coc-diagnostic-next)

    " Excute Code: - "se"
    autocmd FileType rust nmap se <nop>
    autocmd FileType rust nmap see :!cargo build<CR>
    autocmd FileType rust nmap ser :!cargo run<CR>
    autocmd FileType rust nmap seR :!cargo run --release<CR>
    autocmd FileType rust nmap seq :!cargo run -q --release<CR>

    " Insert Mode:
    autocmd FileType rust inoremap <C-f> <Esc>:let @z=@/<CR>/\v[)"}\]]<CR>:let @/=@z<CR>a
    autocmd FileType rust inoremap <C-b> <Esc>:let @z=@/<CR>?\v[("{\[]<CR>:let @/=@z<CR>i
augroup END

