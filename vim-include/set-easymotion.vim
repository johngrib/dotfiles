" Easy motion
"let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" map  <Leader>  <Plug>(easymotion-prefix)
" vmap <Leader>s <Plug>(easymotion-bd-f)
" nmap S <Plug>(easymotion-overwin-f2)
" nmap <Leader>l <Plug>(easymotion-lineforward)
" vmap <Leader>l <Plug>(easymotion-lineforward)
" nmap <Leader>j <Plug>(easymotion-j)
" vmap <Leader>j <Plug>(easymotion-j)
" nmap <Leader>k <Plug>(easymotion-k)
" vmap <Leader>k <Plug>(easymotion-k)
" nmap <Leader>h <Plug>(easymotion-linebackward)
" vmap <Leader>h <Plug>(easymotion-linebackward)
" nmap <Leader>a <Plug>(easymotion-jumptoanywhere)
" vmap <Leader>a <Plug>(easymotion-jumptoanywhere)

map  <c-s> <Plug>(easymotion-prefix)
vmap <c-s> <Plug>(easymotion-s)
nmap <c-s> <Plug>(easymotion-s)
imap <c-s> <c-o><Plug>(easymotion-s)
nmap <c-s> <Plug>(easymotion-s)
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

nmap <c-s>w <Plug>(easymotion-w)
vmap <c-s>w <Plug>(easymotion-w)
nmap <c-s>W <Plug>(easymotion-W)
vmap <c-s>W <Plug>(easymotion-W)
nmap <c-s>b <Plug>(easymotion-b)
vmap <c-s>B <Plug>(easymotion-B)

 " type `l` and match `l`&`L`
let g:EasyMotion_use_upper = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
