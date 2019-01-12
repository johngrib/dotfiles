if !exists('g:include_set_php_loaded')
    let g:include_set_php_loaded = 1

    " See: https://phpactor.github.io/phpactor/vim-plugin.html
    augroup vimphp
        autocmd FileType php setlocal omnifunc=phpactor#Complete
        autocmd FileType php nnoremap <Tab><Tab> :call phpactor#ContextMenu()<CR>
        autocmd FileType php nnoremap <Tab>u :call phpactor#UseAdd()<CR>
        autocmd FileType php nnoremap <Tab>i :call phpactor#Hover()<CR>
        autocmd FileType php nnoremap <Tab>n :call phpactor#Navigate()<CR>
        autocmd FileType php nnoremap <Tab>c :call phpactor#ClassNew()<CR>
    augroup END

    " nmap <Leader>tt :call phpactor#Transform()<CR>
    " nmap <Leader>cc :call phpactor#ClassNew()<CR>

endif
