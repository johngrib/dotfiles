" init.vim : .nvimrc
" location of init.vim : ~/.config/nvim/

" for deoplete plugin
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

" Vim-Plug 설정 ------------------------------------------------------------------
" 아래와 같이 설정한 다음 :PlugInstall<CR> 해주면 된다.
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-fugitive'          " git wrapper
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'scrooloose/syntastic'        " 파일을 저장할 때 자동으로 문법 검사
  Plug 'tpope/vim-surround'
  Plug 'yggdroot/indentline'         " 인덴트 라인을 보여준다. 속도 저하 문제가 있다. 적당히 토글해서 쓰자.
  Plug 'bling/vim-airline'           " TAB navigator, status line 을 제공한다.
  Plug 'luochen1990/rainbow'         " 괄호를 level 별로 다르게 색칠한다. html 태그에도 적용.
  Plug 'kshenoy/vim-signature'       " m mark 위치를 표시해준다.
  Plug 'airblade/vim-gitgutter'      " git diff 를 라인 넘버 옆에 표시.
  Plug 'easymotion/vim-easymotion'
  Plug 'johngrib/FlatColor-johngrib' " color theme
  Plug 'godlygeek/tabular'           " 텍스트 세로 정렬 도구
  Plug 'ap/vim-css-color'           " #rrggbb 형식의 문자열에 색깔을 입혀준다.
  Plug 'tomtom/tcomment_vim'         " comment 플러그인. 비주얼 모드에서 gc, gc{motion} gcc 등으로 사용 가능하다.
  Plug 'raimondi/delimitmate'        " 따옴표, 괄호 등을 입력하면 닫는 따옴표,괄호를 추가해준다.
  "Plug 'valloric/youcompleteme'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
  Plug 'junegunn/vim-peekaboo'
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()
filetype plugin indent on " Put your non-Plugin stuff after this line

" set 설정 ----------------------------------------------------------------------

  "set noimd  " normal 모드에서 한국어 입력시에도 영문으로 입력한 것처럼 동작 -> 제대로 작동하지 않는다.
  if has("nvim")
    set termguicolors
    set clipboard+=unnamedplus
  endif

  set nocompatible " vi 기능을 사용하지 않고, vim 만의 기능을 사용.
  if has('mac')
    "set macmeta " osx 에서 Meta 키 조합을 사용할 수 있게 한다.
    "set guifont=Ubuntu\ Mono:h13
    "set guifont=monaco:h12
    "set guifont=inconsolata:h13
    "set guifont=DejaVu\ Sans\ Mono:h12
    "set guifont=Fira\ Mono:h13
    "set guifont=Meslo\ LG\ L\ DZ:h11
    set guifont=Meslo\ LG\ M\ DZ:h11
  endif

  "Bubble single lines (kicks butt) http://vimcasts.org/episodes/bubbling-text/
  if has('mac')
    nnoremap ˚ ddkP
    nnoremap ∆ ddp
  else
    nnoremap <A-k> ddkP
    nnoremap <A-j> ddp
  endif

  filetype plugin on
  set omnifunc=syntaxcomplete#Complete

  " 검색
  set smartcase   " 대문자가 검색어 문자열에 포함될 때에는 noignorecase
  set ignorecase  " 검색시 대소문자 무시
  set hlsearch    " 검색시 하이라이트(색상 강조)
  set incsearch   " 검색 키워드 입력시 한 글자 입력할 때마다 점진 검색
  "set tildeop    "~ 를 다른 오퍼레이터와 함께 사용한다.
  set wildmenu    " command line 에서 tab 으로 자동완성이 가능. :e 로 파일 이름을 찾을 때 편함.
  set wmnu        " tab 자동완성시 가능한 목록을 보여줌

  " 화면 표시
  set list
  set nu               " 라인 넘버 출력
  set ruler            " 현재 커서 위치 (row, col) 좌표 출력
  set noerrorbells     " 에러 알림음 끄기
  set background=dark  " 검정배경을 사용 (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)
  set laststatus=2     " 상태바를 언제나 표시할 것
  set showmatch        " 일치하는 괄호 하이라이팅
  set cursorline       " highlight current line
  set lazyredraw       " redraw only when we need to.
  "set showcmd         " airline 플러그인과 충돌하기 때문에 주석처리
  "nnoremap gv `[v`]    " highlight last inserted text

  " 사운드 벨, 비주얼 벨 비활성화
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=

  "사용
  set bs=indent,eol,start  " backspace 키 사용 가능
  set shiftwidth=4         " shift를 4칸으로 ( >, >>, <, << )
  set tabstop=4            " tab을 4칸으로
  set expandtab 
  "set noimd               " no imdisable 한글 입력기 관련.. 인데 osx 에서는 안 통하는듯
  set cindent              " C언어 자동 들여쓰기
  set autoindent           " 자동 들여쓰기
  set smartindent
  set history=2000         " vi 편집기록 history .viminfo에 기록

" initialize 설정 ---------------------------------------------------------------

" 마지막으로 수정된 곳에 커서를 위치함
  au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "norm g`\"" |
  \ endif

  colorscheme flatcolor-johngrib

  syntax on
  "if has("syntax")
   "syntax on
  "endif

" map 설정 ----------------------------------------------------------------------
  "nnoremap <F10>r :source ~/.vimrc<CR>
  nnoremap <F10>r :source ~/.config/nvim/init.vim<CR>

  " ctrl-j 로 라인을 분리. " http://goo.gl/qxOlY
  nnoremap <NL> i<CR><ESC>

  " copy , paste , select 기능 보완
  nnoremap Y y$
  nnoremap <Space>y "+y
  nnoremap <Space>Y "+yg_
  nnoremap <Space>p "+p
  nnoremap <Space>P "+P
  nnoremap <Space>a gg<S-v>G

  nnoremap gn       :call ToggleNumber()<cr>
  nnoremap <F3>     :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Plugin 설정 -------------------------------------------------------------------

  " NERDTree 관련
  let NERDTreeShowHidden = 1 "Show hidden files in NerdTree
  nnoremap <F12>n :NERDTreeToggle<CR>
  nnoremap <F12>m :NERDTreeMirrorToggle<CR>
  nnoremap <F12>s :NERDTreeTabsFind<CR>

  " rainbow
  nnoremap <F12>r :RainbowToggle<CR>

  " Easy motion
  "let g:EasyMotion_do_mapping  = 0 " Disable default mappings
  let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
  let g:EasyMotion_smartcase = 1
  map  <Space>  <Plug>(easymotion-prefix)
  vmap s        <Plug>(easymotion-bd-f)
  nmap s        <Plug>(easymotion-overwin-f2)
  nmap <Space>l <Plug>(easymotion-lineforward)
  nmap <Space>j <Plug>(easymotion-j)
  nmap <Space>k <Plug>(easymotion-k)
  nmap <Space>h <Plug>(easymotion-linebackward)

  " indentline 설정
  nnoremap <F12>i :IndentLinesToggle<CR>

  " Syntastic 설정
  " https://thechefprogrammer.blogspot.kr/2014/05/syntax-check-for-php-and-javascript.html
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_php_checkers = ['php']
  "let g:syntastic_check_on_wq = 0
  "let g:syntastic_mode_map = { 'mode': 'passive' }
  "nnoremap <silent> <F6> :SyntasticCheck<CR>

  " vim-airline 버퍼 관련
  " @link http://bakyeono.net/post/2015-08-13-vim-tab-madness-translate.html
  let g:airline#extensions#tabline#enabled = 1     " vim-airline 버퍼 목록 켜기
  let g:airline#extensions#tabline#fnamemod = ':t' " vim-airline 버퍼 목록 파일명만 출력
  nnoremap <C-T> :enew<CR>       " 새로운 버퍼를 연다
  nnoremap gt :bnext!<CR>        " 다음 버퍼로 이동
  nnoremap gr :bprevious!<CR>    " 이전 버퍼로 이동
  nnoremap gq :bp <BAR> bd #<CR> " 현재 버퍼를 닫고 이전 버퍼로 이동

  " rainbow
  let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

  " tabular
  vnoremap <TAB> :Tabularize /

  " peekaboo 관련
  let g:peekaboo_window = 'vertical botright 30new'
  let g:peekaboo_delay = 0
  let g:peekaboo_compact = 0

  " Use deoplete.
  let g:deoplete#enable_at_startup = 1

" functions -------------------------------------------------------------------

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc


