
colorscheme flatcolor-johngrib

" 선택 메뉴 색깔
highlight Pmenu ctermfg=254 ctermbg=237 cterm=NONE
highlight PmenuSel ctermfg=10 ctermbg=239 cterm=NONE

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has('termguicolors') && ($TERM_PROGRAM !~ "Apple_Terminal")
    set termguicolors
endif

if has("gui_macvim")
    set macmeta
    set guifont=Meslo\ LG\ S\ DZ\ Regular\ Nerd\ Font\ Complete:h14

    " macVim 에서 esc 로 영문변환, imi 는 1 또는 2 로 설정해준다
    set noimd
    set imi=1
else
    " tmux에서 배경색이 이상하게 나오는 문제를 해결한다.
    " link : http://stackoverflow.com/a/15095377
    set t_ut=
endif
