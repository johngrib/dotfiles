nmap \s :Startify<CR>
nmap \\s :SSave<CR>

" let g:startify_custom_header = ['']
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1
let g:startify_session_persistence = 1
" let g:startify_files_number = 5
let g:startify_fortune_use_unicode = 1
let g:startify_commands = [
            \ ':help startify',
            \ "!curl 'https://haksa.knou.ac.kr/haksa/abc/abcp/retrieveAtndLesnPlc.data?yosa=2021&seme=1&lcuvCd=032&shgr=3&deptMajrCd=34' | jq '.rows'",
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
            \ map(split(system('fortune ~/my-fortune'), '\n'), '"   ". v:val')

augroup vimstartify
    autocmd User Startified setlocal cursorline
augroup END
