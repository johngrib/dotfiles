"* F1 ~ F20 설정

"** F1: 탐색
nnoremap <f1> <nop>

" nnoremap <nowait> <f1><CR> :Marks<CR>
" nnoremap <nowait> <f1><f1> :call FzfOmniFiles()<CR>
" nnoremap <nowait> <f1><f3> :History<CR>
" nnoremap <nowait> <f1>d :call fzf#vim#tags('^', {'options': '--exact --select-1 --exit-0 +i'})<CR>
" nnoremap <nowait> <f1>u :Snippets<CR>
" nnoremap <nowait> <f1>u call fzf#vim#ag('', {'options': '--select-2'})

nnoremap <nowait> <f1>/ :History/<CR>
nnoremap <nowait> <f1>1 :Files<CR>
nnoremap <nowait> <f1>: :History:<CR>
nnoremap <nowait> <f1><f1> :GitFiles<CR>
nnoremap <nowait> <f1><f2> :Buffers<CR>
nnoremap <nowait> <f1><f3> <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <nowait> <f1><f7> :execute ":Tags " . expand('<cword>')<CR>
nnoremap <nowait> <f1>` <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <nowait> <f1>a :Ag<CR>
nnoremap <nowait> <f1>j <cmd>lua require('telescope.builtin').jumplist()<cr>
nnoremap <nowait> <f1>l :Lines<CR>
nnoremap <nowait> <f1>t :Tags ^<CR>


" nnoremap <f3> :execute ":Tags " . expand('<cword>')<CR>

"** F2: 버퍼 관리
nnoremap <silent> <F2><F2> :Buffers<CR>
nnoremap <silent> <F2>2 :buffers<CR>:buffer<Space>
" nnoremap <silent> <F2><F2>   :b#<CR>
nnoremap <silent> <F2><F3> :bnext!<CR>
nnoremap <silent> <F2><F1> :bprevious!<CR>
" only: 현재 버퍼만 남기고 모두 닫기
nnoremap <silent> <F2>o      :%bd <BAR> e # <BAR> bd #<CR>
" 현재 버퍼를 닫고 이전 버퍼로 이동
nnoremap <silent> <F2><F6> :bp <BAR> bd #<CR>
nnoremap <silent> <F2>q    :bd<CR>
nnoremap <silent> <F2>d   :BuffersDelete<CR>

" https://www.reddit.com/r/neovim/comments/mlqyca/fzf_buffer_delete/
function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bd! ' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BuffersDelete call fzf#run(fzf#wrap({
            \ 'source': s:list_buffers(),
            \ 'sink*': { lines -> s:delete_buffers(lines) },
            \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept' }))


"** F9: register 목록
nnoremap <nowait> <F9> <cmd>lua require('telescope.builtin').registers()<cr>
inoremap <nowait> <F9> <cmd>lua require('telescope.builtin').registers()<cr>
