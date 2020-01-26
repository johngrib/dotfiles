function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

augroup vimtypescript
    autocmd FileType javascript nmap <Tab>r <Plug>(coc-rename)
    autocmd FileType javascript setlocal colorcolumn=81
    autocmd FileType javascript nnoremap <silent><Tab>k :call <SID>show_documentation()<CR>
    autocmd FileType javascript nmap <silent> <Tab>d <Plug>(coc-definition)
augroup END

