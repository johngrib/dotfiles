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

map  s  <Plug>(easymotion-prefix)
vmap ss <Plug>(easymotion-s)
nmap ss <Plug>(easymotion-s)
imap <c-s> <c-o><Plug>(easymotion-s)
nmap <c-s> <Plug>(easymotion-s)
nmap S <Plug>(easymotion-overwin-f2)
nmap sl <Plug>(easymotion-lineforward)
vmap sl <Plug>(easymotion-lineforward)
" nmap sj <Plug>(easymotion-j)
" vmap sj <Plug>(easymotion-j)
" nmap sk <Plug>(easymotion-k)
" vmap sk <Plug>(easymotion-k)
nmap sh <Plug>(easymotion-linebackward)
vmap sh <Plug>(easymotion-linebackward)
nmap sa <Plug>(easymotion-jumptoanywhere)
vmap sa <Plug>(easymotion-jumptoanywhere)

nmap sw <Plug>(easymotion-w)
vmap sw <Plug>(easymotion-w)
nmap sW <Plug>(easymotion-W)
vmap sW <Plug>(easymotion-W)
nmap sb <Plug>(easymotion-b)
vmap sB <Plug>(easymotion-B)



 " type `l` and match `l`&`L`
let g:EasyMotion_use_upper = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
