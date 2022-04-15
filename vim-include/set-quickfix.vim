" quickfix 관리

" quickfix 다음/이전 이동
nnoremap <Tab>qn :cnext<CR>
nnoremap <Tab>qN :cprevious<CR>

" quickfix 열기/닫기 토글
nmap <script> <silent> <Tab>ql :call ToggleLocationList()<CR>
nmap <script> <silent> <Tab>qq :call ToggleQuickfixList()<CR>

nnoremap <Tab>qm :call AddQuickfixBookmarkFile()<CR>
nnoremap <Tab>qe :call EditQuickfixBookmarkFile()<CR>
nnoremap <Tab>q' :call OpenQuickfixBookmarkFile()<CR>
nnoremap <Tab>q` :call OpenQuickfixBookmarkFile()<CR>

" 현재 커서가 있는 라인을 북마크 파일에 저장합니다.
function! AddQuickfixBookmarkFile()
    let l:pwd = getcwd()
    let l:file = l:pwd . '/.quickfix-bookmark'
    let l:bookmark = expand("%:p").":".line(".").": ".expand("<cword>")
    echom l:bookmark
    call system("echo '" . l:bookmark . "' >> " . l:file)
endfunction

" 북마크 파일을 편집합니다. 메모를 추가하는 등의 용도로 사용하세요.
" 편집 화면에서도 gf, gF 를 사용해 해당 파일의 해당 라인으로 점프할 수 있습니다.
function! EditQuickfixBookmarkFile()
    let l:pwd = getcwd()
    let l:file = l:pwd . '/.quickfix-bookmark'
    execute "vs " . l:file
endfunction

" 북마크 파일을 퀵픽스 창에 열어줍니다.
" 퀵픽스 기능을 사용해 다음 파일, 이전 파일로 이동할 수 있습니다.
function! OpenQuickfixBookmarkFile()
    let l:pwd = getcwd()
    let l:file = l:pwd . '/.quickfix-bookmark'
    execute "cfile " . l:file
    copen
endfunction
