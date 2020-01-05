if !exists('g:include_set_nerdtree_loaded')
    let g:include_set_nerdtree_loaded = 1

    let NERDTreeShowHidden = 1 "Show hidden files in NerdTree
    nnoremap <LocalLeader>e :NERDTreeToggle<CR>
    nnoremap <LocalLeader><LocalLeader>e :NERDTreeFind<CR>
    nnoremap <LocalLeader>m :NERDTreeMirrorToggle<CR>
    let g:NERDTreeQuitOnOpen = 0
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let g:netrw_banner = 0
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4
    let g:NERDTreeWinSize=25

endif
