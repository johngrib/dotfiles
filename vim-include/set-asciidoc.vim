augroup asciidoc_set
    autocmd FileType asciidoc nnoremap <CR> :call OpenAsciidocFile()<CR>
augroup END

function! OpenAsciidocFile()
    let l:line = getline('.')
    let l:regex = '^include::{snippets}\(.*\.adoc\)\[\]\s*$'
    if l:line =~? l:regex
        let l:prefix = "build/generated-snippets"
        let l:path = substitute(l:line, "^include::{snippets}", l:prefix, "")
        let l:path = substitute(l:path, "\[\]\s*$", "", "")
        execute "edit " . l:path
    endif
endfunction
