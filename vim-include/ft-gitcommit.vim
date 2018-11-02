if !exists('g:include_ft_gitcommit_loaded')
    let g:include_ft_gitcommit_loaded = 1

    augroup git_commit_helper
        autocmd FileType gitcommit setlocal textwidth=50
        autocmd FileType gitcommit setlocal colorcolumn=+1,+31
        autocmd FileType gitcommit highlight ColorColumn ctermbg=235 guibg=#2c2d27
    augroup END
endif
