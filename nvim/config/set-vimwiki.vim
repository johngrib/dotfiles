let g:vim_wiki_set_path = expand('<sfile>:p:h')
let g:vimwiki_list = [
            \{
            \   'path': '~/johngrib.github.io/_wiki',
            \   'ext' : '.md',
            \   'diary_rel_path': '.',
            \},
            \{
            \   'path': '~/au-vimenter.github.io/_posts',
            \   'ext' : '.md',
            \   'diary_rel_path': '.',
            \},
            \{
            \   'path': '~/Dropbox/localwiki/_wiki',
            \   'ext' : '.md',
            \   'diary_rel_path': '.',
            \}
            \]
let g:vimwiki_conceallevel = 0
let g:vimwiki_table_mappings = 0

command! WikiIndex :VimwikiIndex
nmap <LocalLeader>ww <Plug>VimwikiIndex
" nmap <LocalLeader>wt <Plug>VimwikiTabIndex
nmap <LocalLeader>ws <Plug>VimwikiUISelect
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>w<LocalLeader>t <Plug>VimwikiTabMakeDiaryNote
nmap <LocalLeader>w<LocalLeader>y <Plug>VimwikiMakeYesterdayDiaryNote
nmap <LocalLeader>wh <Plug>Vimwiki2HTML
nmap <LocalLeader>whh <Plug>Vimwiki2HTMLBrowse

nmap <Tab>d 0f]lli__date<Space><esc>

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
    if g:md_modify_disabled
        return
    endif

    if (&filetype != "vimwiki")
        return
    endif

    if &modified
        " echo('markdown updated time modified')
        let save_cursor = getpos(".")
        let n = min([10, line("$")])

        exe 'keepjumps 1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
                    \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
function! NewTemplate()

    let l:wiki_directory = v:false

    for wiki in g:vimwiki_list
        if expand('%:p:h') =~ expand(wiki.path)
            let l:wiki_directory = v:true
            break
        endif
    endfor

    if !l:wiki_directory
        return
    endif

    if line("$") > 1
        return
    endif

    let l:uuid = substitute(system("uuidgen"), '\n', '', '')
    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tag     : ')
    call add(l:template, 'resource: ' . substitute(l:uuid, '^\(..\)', '\1/', ''))
    call add(l:template, 'toc     : true')
    call add(l:template, 'public  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction

function! BufOpenEvent()
    call NewTemplate()

endfunction

augroup vimwikiauto
    autocmd BufWritePre *.md keepjumps call LastModified()
    autocmd BufRead,BufNewFile *.md call BufOpenEvent()
    autocmd FileType vimwiki inoremap <S-Right> <C-r>=vimwiki#tbl#kbd_tab()<CR>
    autocmd FileType vimwiki inoremap <S-Left> <Left><C-r>=vimwiki#tbl#kbd_shift_tab()<CR>


    autocmd FileType vimwiki let &iskeyword = "@,48-57,_,192-255,-,/"

    " g:md_modify_disabled 을 토글한다
    autocmd FileType vimwiki nnoremap <silent> s,d :let g:md_modify_disabled = !g:md_modify_disabled<CR>
    autocmd FileType vimwiki nmap <C-]> <Plug>(coc-definition)

    " Insert Mode:
    autocmd FileType vimwiki inoremap <C-f> <Esc>:let @z=@/<CR>/\v[)"}\]\.]<CR>:let @/=@z<CR>a
    autocmd FileType vimwiki inoremap <C-b> <Esc>:let @z=@/<CR>?\v[("{\[\.]<CR>:let @/=@z<CR>i

    autocmd FileType vimwiki nmap s <nop>
    autocmd FileType vimwiki vmap s <nop>
    autocmd FileType vimwiki nmap s? :execute "vs " . globpath(&rtp, 'config/set-vimwiki.vim')<CR>

    " Create: - sc
    autocmd FileType vimwiki nmap sc <nop>
    autocmd FileType vimwiki nmap scr <Plug>(coc-rename)
    " markdown 테이블 생성
    autocmd FileType vimwiki nnoremap sct :VimwikiTable<CR>
    " 현재 문단을 두 번째 위 문단에 붙입니다. 번역할 때 유용합니다.
    autocmd FileType vimwiki nnoremap scj vipd{P
    " 선택한 텍스트에 [ ] 를 씌워줍니다.
    autocmd FileType vimwiki vmap sc] S]f]a
    " 선택한 텍스트에 <sup> 태그를 씌웁니다.
    autocmd FileType vimwiki vmap scu Stsup<CR>2f>
    " 선택한 텍스트에 <sub> 태그를 씌웁니다.
    autocmd FileType vimwiki vmap scb Stsub<CR>2f>

    " Extract: - se
    autocmd FileType vimwiki nmap se <nop>
    " 커서가 위치하고 있는 괄호 속 링크를 분리해서 문단 아래쪽에 정리해 줍니다.
    autocmd FileType vimwiki nnoremap sel vf)"zymz}oz0f(r:a $x`zf(df)hviW"zyPE:delm z

    " SurroundSupport: - ss
    autocmd FileType vimwiki nmap ss <nop>
    autocmd FileType vimwiki vmap ss* S*gvS*
augroup END

let g:tagbar_type_vimwiki = {
    \ 'ctagstype' : 'vimwiki',
    \ 'sort': 0,
    \ 'kinds' : [
        \ 't:목차'
    \ ]
\ }

" augroup vimwiki_tagbar
    " autocmd BufRead,BufNewFile *wiki/*.md TagbarOpen
    " autocmd VimLeavePre *.md TagbarClose
" augroup END

function! RefreshTagbar()
     let l:is_tagbar_open = bufwinnr('__Tagbar__') != -1
     if l:is_tagbar_open
         TagbarClose
         TagbarOpen
     endif
endfunction

function! UpdateBookProgress()
    let l:cmd = g:vim_wiki_set_path . "/bookProgressUpdate.sh " . expand('%:p')
    call system(l:cmd)
    edit
endfunction

augroup todoauto
    autocmd BufWritePost *wiki/book.md call UpdateBookProgress()
augroup END

let g:md_modify_disabled = 0

