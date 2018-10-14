let g:vimwiki_list = [
            \{
            \   'path': '~/Dropbox/johngrib.github.io/_wiki',
            \   'ext' : '.md',
            \   'diary_rel_path': '.',
            \},
            \{
            \   'path': '~/Dropbox/wiki',
            \   'ext' : '.md',
            \   'diary_rel_path': '.',
            \}
            \]

let g:vimwiki_conceallevel = 0

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
nmap <LocalLeader>wt :VimwikiTable<CR>


" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
    if g:md_modify_disabled
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
        if expand('%:p:h') == expand(wiki.path)
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

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tags    : ')
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
augroup vimwikiauto
    " autocmd FileType vimwiki nnoremap <F3> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>
    " autocmd FileType vimwiki nnoremap <F3> :VWS /
    " autocmd FileType vimwiki nnoremap <S-F3> :execute "VWB" <Bar> :lopen<CR>
    autocmd BufWritePre *wiki/*.md keepjumps call LastModified()
    autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
augroup END

let g:md_modify_disabled = 0

