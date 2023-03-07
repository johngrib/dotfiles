"* JavaScript 설정파일

if exists("g:loaded_javascript_setting") || &cp
  finish
endif
let g:loaded_javascript_setting = 1

augroup jg_javascript_set
    autocmd FileType javascript nnoremap =[ vi[:EasyAlign :<CR>
    autocmd FileType javascript nnoremap ={ vi{:EasyAlign :<CR>
augroup END
