if !exists('g:include_set_vim_go_loaded')
    let g:include_set_vim_go_loaded = 1

    let g:go_addtags_transform = "camelcase"
    let g:go_fmt_command = "goimports"
    let g:go_autodetect_gopath = 1
    let g:go_list_type = "quickfix"
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_operators = 1
    let g:go_auto_type_info = 1
    let g:go_auto_sameids = 1
    let g:go_doc_keywordprg_enabled = 0

    let g:go_info_mode='guru'

    nnoremap <C-n> :cnext<CR>
    nnoremap <C-p> :cprevious<CR>

    nnoremap <LocalLeader>q :call ToggleQuickfixList()<CR>
    let g:toggle_list_no_mappings = 1

    augroup vimgo
        let g:go_def_mapping_enabled = 0
        autocmd FileType go nmap <silent> <C-]> <Plug>(coc-definition)

        autocmd FileType go nnoremap <Tab>b :GoBuild<CR>
        " autocmd FileType go nnoremap <Tab>r :GoRename<CR>
        autocmd FileType go nmap <silent> <Tab>r <Plug>(coc-rename)
        autocmd FileType go nnoremap <Tab>e :GoRun<CR>
        autocmd FileType go nnoremap <Tab><Tab>e :GoRun %<CR>
        autocmd FileType go nnoremap <Tab><Tab>t :GoTestFunc<CR>
        autocmd FileType go nnoremap <Tab>t :GoTest<CR>
        autocmd FileType go nnoremap <Tab>c :GoCoverageToggle<CR>
        autocmd FileType go nnoremap <Tab>i :GoImport<Space>
        autocmd FileType go nnoremap <Tab>d :GoDoc
        autocmd FileType go setlocal nolist
        autocmd FileType go setlocal colorcolumn=81
    augroup END
    " autocmd FileType go nnoremap <Tab>i :GoInfo<CR>
    set updatetime=100

    let $GINKGO_EDITOR_INTEGRATION = "true"

endif
