if !exists('g:include_set_autoformat_loaded')
    let g:include_set_autoformat_loaded = 1

    augroup autoformat
        autocmd BufWritePre *.js :Autoformat
        autocmd BufWritePre *.py :Autoformat
    augroup END

endif
