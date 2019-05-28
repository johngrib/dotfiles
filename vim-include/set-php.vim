if !exists('g:include_set_php_loaded')
    let g:include_set_php_loaded = 1

    " let g:coc_phpls_installed = system("awk '/coc-phpls/{print 1}' ~/.config/coc/extensions/package.json")
    " CocInstall coc-phpls

    " See: https://phpactor.github.io/phpactor/vim-plugin.html
    augroup vimphp
        " youcompleteme & phpactor
        " autocmd FileType php setlocal omnifunc=phpactor#Complete
        " autocmd FileType php nnoremap <Tab><Tab> :call phpactor#ContextMenu()<CR>
        " autocmd FileType php nnoremap <Tab>s :call phpactor#Status()<CR>
        " autocmd FileType php nnoremap <Tab>u :call phpactor#UseAdd()<CR>
        " autocmd FileType php nnoremap <Tab>i :call phpactor#Hover()<CR>
        " autocmd FileType php nnoremap <Tab>n :call phpactor#Navigate()<CR>
        " autocmd FileType php nnoremap <Tab>c :call phpactor#ClassNew()<CR>
        " autocmd FileType php nnoremap <Tab>d :call phpactor#FindReferences()<CR>
        " autocmd FileType php nnoremap <C-]> :call phpactor#GotoDefinition()<CR>
        " autocmd FileType php nnoremap g<C-]> <C-]>
        " autocmd FileType php vnoremap <Tab>m :call phpactor#ExtractMethod()<CR>
        " let g:phpactorOmniAutoClassImport = v:true
        autocmd FileType php setlocal colorcolumn=81

        " coc
        autocmd FileType php nmap <silent> <c-]> <Plug>(coc-definition)
        autocmd FileType php nmap <silent> <Tab>r <Plug>(coc-rename)
        autocmd FileType php nmap <silent> <Tab>u <Plug>(coc-references)
        autocmd FileType php nmap <silent> <Tab>i <Plug>(coc-implementation)
        autocmd FileType php nmap <silent> <Tab>[ <Plug>(coc-diagnostic-prev)
        autocmd FileType php nmap <silent> <Tab>] <Plug>(coc-diagnostic-next)

    augroup END

    " nmap <Leader>tt :call phpactor#Transform()<CR>

endif
