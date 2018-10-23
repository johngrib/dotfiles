augroup git_commit_helper
    autocmd FileType gitcommit setlocal textwidth=50
    autocmd FileType gitcommit setlocal colorcolumn=+1,+31
    autocmd FileType gitcommit highlight ColorColumn ctermbg=235 guibg=#2c2d27
    autocmd FileType gitcommit call s:printRecentGitLog()
	autocmd FileType gitcommit inoremap <C-l> <C-r>=LastCommitMsg()<CR>
augroup END

let s:executed = 0
let s:startLine = 0
let s:commitMessages = []

function! s:printRecentGitLog()
    if s:executed > 0
        return
    endif
    normal! Go
    let s:startLine = line('$')
    silent execute 'r! git log --pretty=oneline | head -50 | sed "s/^/\#\# /"'
    normal! gg
    let s:commitMessages = getline(s:startLine, '$')

    let l:i = 0
    for l:msg in s:commitMessages
        let s:commitMessages[l:i] = substitute(l:msg, '^## \S*\s', '', '')
        let l:i += 1
    endfor

    let s:executed = 1
endfunction

function! LastCommitMsg()
    call complete(col('.'), s:commitMessages)
    return ''
endfunc
