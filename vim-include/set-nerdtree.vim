" let NERDTreeShowHidden = 1 "Show hidden files in NerdTree

nmap <F1><F8> :NERDTreeFind<CR>
nmap <F1>e :NERDTreeToggle<CR>
nnoremap <LocalLeader>m :NERDTreeMirrorToggle<CR>

let g:NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:NERDTreeWinSize=40
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:webdevicons_enable_nerdtree = 0

" nmap <LocalLeader>e :CocCommand explorer<CR>
augroup nerdtree_auto_quit
    autocmd VimLeavePre * NERDTreeClose
augroup END
