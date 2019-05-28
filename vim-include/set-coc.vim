if !exists('g:include_set_coc_loaded')
    let g:include_set_coc_loaded = 1

    " :CocInstall coc-phpls
    inoremap <silent><expr> <c-space> coc#refresh()
endif
