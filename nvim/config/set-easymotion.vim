" Easy motion
let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" 화면에 힌트키가 대문자로 표시되게 한다.
" (YB 는 삭제해뒀음)
let g:EasyMotion_keys = ' ASDFQWERZXCV1234GHNTU[]567890-=,/.;IOPMLJK'
let g:EasyMotion_use_upper = 1

nmap <c-s> [easymotion-p]
vmap <c-s> [easymotion-p]

nmap [easymotion-p]<c-s> <Plug>(easymotion-overwin-line)

" INSERT 모드에서 입력하면 해당 라인 내에서 좌우로 이동 가능
imap <c-s> <c-o><Plug>(easymotion-lineanywhere)

nmap [easymotion-p]2 <Plug>(easymotion-overwin-f2)

" easymotion + hjkl
nmap [easymotion-p]l <Plug>(easymotion-lineforward)
vmap [easymotion-p]l <Plug>(easymotion-lineforward)
nmap [easymotion-p]j <Plug>(easymotion-j)
vmap [easymotion-p]j <Plug>(easymotion-j)
nmap [easymotion-p]k <Plug>(easymotion-k)
vmap [easymotion-p]k <Plug>(easymotion-k)
nmap [easymotion-p]h <Plug>(easymotion-linebackward)
vmap [easymotion-p]h <Plug>(easymotion-linebackward)

nmap [easymotion-p]a <Plug>(easymotion-jumptoanywhere)
vmap [easymotion-p]a <Plug>(easymotion-jumptoanywhere)
nmap [easymotion-p]w <Plug>(easymotion-overwin-w)
nmap [easymotion-p]f <Plug>(easymotion-overwin-f)
nmap [easymotion-p]/ <Plug>(easymotion-sn)

" Smartsign (`3`을 입력하면 `3`과 `#`에 매치됨)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" vim-choosewin 설정

nmap [easymotion-p]<Space> <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_label = 'JKLIOPM'

