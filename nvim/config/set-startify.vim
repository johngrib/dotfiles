nmap \s :Startify<CR>
nmap \\s :SSave<CR>

" let g:startify_custom_header = ['']
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
let g:startify_commands = [
            \ ':help startify',
            \ "!ls -alh"
            \ ]

let g:startify_list_order = [
            \ ['    Sessions'],
            \'sessions',
            \ ['    Most Recently Used files'],
            \'files',
            \'bookmarks',
            \ ['    Commands'],
            \'commands'
            \]
let g:startify_custom_header =
            \ map(split(system('fortune ~/Dropbox/my-fortune'), '\n'), '"   ". v:val')
" let g:startify_custom_header =
"             \ startify#pad(split(system('fortune | cowsay'), '\n'))

let g:startify_fortune_use_unicode = 1
augroup vimstartify
    autocmd User Startified setlocal cursorline
augroup END
