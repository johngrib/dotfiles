if !exists('g:include_set_tagbar_loaded')
    let g:include_set_tagbar_loaded = 1

    nnoremap <LocalLeader>t :TagbarToggle<CR>
    let g:tagbar_type_markdown = {
                \ 'ctagstype': 'markdown',
                \ 'ctagsbin' : '~/.local/bin/markdown2ctags.py',
                \ 'ctagsargs' : '-f - --sort=yes --sro=»',
                \ 'kinds' : [
                \ 's:sections',
                \ 'i:images'
                \ ],
                \ 'sro' : '»',
                \ 'kind2scope' : {
                \ 's' : 'section',
                \ },
                \ 'sort': 0,
                \ }

endif
