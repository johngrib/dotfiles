inoremap <silent><expr> <c-space> coc#refresh()

" inoremap <expr> <C-j> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <silent><script><expr> <Tab> pumvisible() ? "\<C-y>" : copilot#Accept("\<CR>")

function! Check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 팝업 메뉴가 보인다면 coc 자동완성
" 커서 왼쪽에 공백 문자가 있다면 그냥 탭 키 입력
" 그 외의 경우에는 UltiSnips 자동완성
" inoremap <silent><script><expr> <Tab>
"             \ pumvisible() ? "\<C-y>"
"             \ : Check_back_space() ? "\<Tab>"
"             \ : "\<C-R>=UltiSnips#ExpandSnippet()<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> sK :call <SID>show_documentation()<CR>

let g:coc_global_extensions = [
      \ 'coc-clojure',
      \ 'coc-go',
      \ 'coc-pyright',
      \ 'coc-ultisnips',
      \]

" https://github.com/iamcco/coc-vimlsp
call add(g:coc_global_extensions, 'coc-vimlsp')

" Explorer
" :CocInstall coc-explorer
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\   'file': {
\     'open-action-strategy': 'sourceWindow',
\   },
\ }

nmap <F1><F8> :CocCommand explorer --preset floatingLeftside<CR>
nmap <F1>e <Cmd>CocCommand explorer --preset file<CR>

" https://www.ditig.com/256-colors-cheat-sheet
" coc 자동완성메뉴에서 현재 선택된 아이템
highlight CocMenuSel ctermbg=88 guibg=#870000

" coc 자동완성메뉴에서 매치된 글자
highlight CocSearch ctermfg=10 guifg=#00ff00

" coc 자동완성메뉴에서 선택되지 않은 아이템들
highlight CocFloating ctermbg=237 guibg=#3a3a3a

