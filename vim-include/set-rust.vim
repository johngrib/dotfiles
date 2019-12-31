if !exists('g:include_set_rust_loaded')
    let g:include_set_rust_loaded = 1

    augroup vimrust
        autocmd FileType rust nmap <silent> <c-]> <Plug>(coc-definition)
        autocmd FileType rust nmap <silent> <Tab>r <Plug>(coc-rename)
        autocmd FileType rust nmap <silent> <Tab>u <Plug>(coc-references)
        autocmd FileType rust nmap <silent> <Tab>i <Plug>(coc-implementation)
        autocmd FileType rust nmap <silent> <Tab>[ <Plug>(coc-diagnostic-prev)
        autocmd FileType rust nmap <silent> <Tab>] <Plug>(coc-diagnostic-next)
        autocmd FileType rust nmap <silent> <Tab>b :!cargo build<CR>

        autocmd FileType rust nmap <silent> <Tab>e :!cargo run<CR>

    augroup END
endif
