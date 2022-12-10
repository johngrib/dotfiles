" vim-gutentags
let g:gutentags_ctags_exclude=["node_modules"]
let g:gutentags_resolve_symlinks = 1
let g:gutentags_project_root = ['.git', 'deps.edn']
let g:gutentags_ctags_exclude = [
            \ '.clj-kondo',
            \ '.lsp',
            \ 'karabiner/automatic_backups/*.json',
            \ 'karabiner/assets/complex_modifications/*.json',
            \ '*.iterm2.plist',
            \ ]

