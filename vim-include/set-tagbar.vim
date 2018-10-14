" tagbar
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
