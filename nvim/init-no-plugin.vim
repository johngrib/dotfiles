
syntax enable
filetype plugin indent on

    set path+=**
    set nofixeol
    set conceallevel=0
    set nocompatible                  " vi 기능을 사용하지 않고, vim 만의 기능을 사용.
    set list listchars=tab:·\ ,trail:·,extends:>,precedes:<
    set omnifunc=syntaxcomplete#Complete
    set mouse=a
    set hidden  " Buffer should still exist if window is closed
    set nopaste
    set smartcase hlsearch incsearch
    set ignorecase
    set number           " 라인 넘버 출력
    set ruler            " 현재 커서 위치 (row, col) 좌표 출력
    set noerrorbells     " 에러 알림음 끄기
    set laststatus=2     " 상태바를 언제나 표시할 것
    set showmatch        " 일치하는 괄호 하이라이팅
    set cursorline       " highlight current line
    set lazyredraw       " redraw only when we need to.
    set showcmd          " airline 플러그인과 충돌 가능성 있음.
    set wildmenu wildignorecase
    set wildmode=full
    set noswapfile
    set nobackup
    set noerrorbells visualbell t_vb= " 사운드 벨, 비주얼 벨 비활성화

    set bs=indent,eol,start  " backspace 키 사용 가능
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
    set cindent autoindent smartindent
    set history=200 undolevels=2000
    set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz
    set splitbelow
    set splitright
    set virtualedit=block   " visual block mode를 쓸 때 문자가 없는 곳도 선택 가능하다
    set autoread
    set cursorcolumn
    set cmdheight=2
    set updatetime=300
    setglobal timeoutlen=1200
    setglobal ttimeoutlen=50
    set shortmess+=c

    if has('persistent_undo')
        let s:vimDir = '$HOME/.vim'
        let &runtimepath.=','.s:vimDir
        let s:undoDir = expand(s:vimDir . '/undodir')

        call system('mkdir ' . s:vimDir)
        call system('mkdir ' . s:undoDir)

        let &undodir = s:undoDir
        set undofile
    endif

" map ----------------------------------------------------------------------
    let mapleader = "\<Space>"
    let maplocalleader = "\\"
    nnoremap k gk
    nnoremap gk k
    nnoremap j gj
    nnoremap gj j

    nnoremap & :&&<CR>
    xnoremap & :&&<CR>
    nnoremap K i<CR><Esc>

    " copy , paste , select 기능 보완
    nnoremap Y y$
    nnoremap <Space>y "+y
    nnoremap <Space>Y "+yg_
    vnoremap <Space>y "+y
    nnoremap <Space>d "+d
    nnoremap <Space>D "+yD
    vnoremap <Space>d "+d
    nnoremap <Space>p "+p
    nnoremap <Space>P "+P

    nnoremap <silent> <PageUp>   :bnext!<CR>
    nnoremap <silent> <PageDown> :bprevious!<CR>

    inoremap <C-e> <C-O>$
    inoremap <C-l> <right>

    " visual 모드에서 선택한 문자열로 검색한다.
    " https://vim.fandom.com/wiki/Search_for_visually_selected_text
    vnoremap <Space>* y/\V<C-R>=escape(@",'/\')<CR><CR>

    set statusline+=%*

    nnoremap <Space>w :w<CR>
    nnoremap <silent>s <nop>
    nnoremap <silent>S <nop>
    vnoremap <silent>s <nop>

    nnoremap <Space>f <Esc>:let @z=@/<CR>/\v[)"}]<CR>:let @/=@z<CR>
    nnoremap <Space>b <Esc>:let @z=@/<CR>?\v[("{]<CR>:let @/=@z<CR>

set fileencodings=utf-8,euc-kr

"* iabbr 설정
iabbr __email johngrib82@gmail.com
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __date strftime("%Y-%m-%d")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')
iabbr <expr> __pwd expand('%:p:h')
iabbr <expr> __branch system("git rev-parse --abbrev-ref HEAD")
iabbr <expr> __uuid system("uuidgen")

