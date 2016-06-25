set smartcase	" 대문자가 검색어 문자열에 포함될 때에는 noignorecase
set ignorecase 	" 검색시 대소문자 무시
set hlsearch	" 검색시 하이라이트(색상 강조)
set incsearch	" 검색 키워드 입력시 한 글자 입력할 때마다 점진 검색

set nu 		" 라인 넘버 출력
set ruler	" 현재 커서 위치 (row, col) 좌표 출력
set noerrorbells	" 에러 알림음 끄기

set bs=indent,eol,start	" backspace 키 사용 가능
set background=dark  " 검정배경을 사용할 때, (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)

set wmnu	" tab 자동완성시 가능한 목록을 보여줌
set shiftwidth=4	" shift를 4칸으로 ( >, >>, <, << 등의 명령어)
set tabstop=4		" tab을 4칸으로

set noimd		" no imdisable 한글 입력기 관련

set autoindent	" 자동 들여쓰기
set smartindent " 자동 들여쓰기 "
set cindent		" C언어 자동 들여쓰기
set laststatus=2	" 상태바를 언제나 표시할 것
set showmatch " 일치하는 괄호 하이라이팅
set sm	" 매치되는 괄호 표시
set history=1000 "  vi 편집기록 기억갯수 .viminfo에 기록

set ai  " autoindent 자동 들여쓰기 

" 사운드 벨, 비주얼 벨 비활성화
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"F11, w 로 set list 를 toggle 한다.
nnoremap <F11>w :set list!<ENTER>

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif


"syntax on
colorscheme desert
if has("syntax")
 syntax on
endif

" ESC 대용
imap jk <Esc>
imap kj <Esc>

" 명령행 한글 입력 오류 처리
ca ㅈ w

" ctrl-j 로 라인을 분리.
nnoremap <NL> i<CR><ESC>

" copy , paste , select 기능 보완 -------------------------------
noremap <Space>y	"+y
nnoremap <Space>p	"+p
nnoremap <Space>a	gg<S-v>G

" navigation 기능 보완 ---------------------------------
nnoremap <Space>h ^
nnoremap <Space>l $
noremap <Space>j 8j
noremap <Space>k 8k

set encoding=utf-8
set guifont=ubuntu\ mono:h14:cANSI
set guifontwide=GulimChe:h13:cDEFAULT

" 메뉴 표시 언어 : 영어
lang mes en_US

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" for coding on c language
imap ,fi for(i = 0; i < ; ++i){<ENTER>}
imap ,fj for(j = 0; j < ; ++j){<ENTER>}
imap ,if if(){<ENTER>}<ESC>kf(a
imap ,wh while(){<ENTER>}<ESC>kf(a
imap ,/ /* */<ESC>2F*a<SPACE>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
Plugin 'The-NERD-tree'
nnoremap <F12>n :NERDTreeToggle<ENTER>

Plugin 'jelera/vim-javascript-syntax'