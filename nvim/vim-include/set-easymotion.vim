" Easy motion
let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" 화면에 힌트키가 대문자로 표시되게 한다.
let g:EasyMotion_keys = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890;'
let g:EasyMotion_use_upper = 1

nmap <c-s><c-s> <Plug>(easymotion-overwin-line)

" INSERT 모드에서 입력하면 해당 라인 내에서 좌우로 이동 가능
imap <c-s> <c-o><Plug>(easymotion-lineanywhere)

nmap <c-s>2 <Plug>(easymotion-overwin-f2)

nmap <c-s>l <Plug>(easymotion-lineforward)
vmap <c-s>l <Plug>(easymotion-lineforward)
nmap <c-s>j <Plug>(easymotion-j)
vmap <c-s>j <Plug>(easymotion-j)
nmap <c-s>k <Plug>(easymotion-k)
vmap <c-s>k <Plug>(easymotion-k)
nmap <c-s>h <Plug>(easymotion-linebackward)
vmap <c-s>h <Plug>(easymotion-linebackward)

nmap <c-s>a <Plug>(easymotion-jumptoanywhere)
vmap <c-s>a <Plug>(easymotion-jumptoanywhere)

nmap <c-s>w <Plug>(easymotion-overwin-w)
nmap <c-s>f <Plug>(easymotion-overwin-f)

nmap <c-s>/ <Plug>(easymotion-sn)

" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
