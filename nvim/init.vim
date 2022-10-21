"* Vim-Plug 목록
" 아래와 같이 설정한 다음 :PlugInstall<CR> 해주면 된다.
call plug#begin('~/.config/nvim/plugged')

    Plug 'Shougo/vimproc.vim', {'do' : 'make'}

    "* Vim 기본 기능 확장
        "* session
        Plug 'mhinz/vim-startify'           " 시작 화면을 꾸며준다. MRU가 있어 편리하다.

        "* HUD(Head Up Display)
        Plug 'bling/vim-airline'        " BUFFER navigator, status line 을 제공한다.
        Plug 'luochen1990/rainbow'      " 괄호를 level 별로 다르게 색칠한다. html 태그에도 적용.
        Plug 'kshenoy/vim-signature'    " m mark 위치를 표시해준다.
        " Plug 'ap/vim-css-color'             " #rrggbb 형식의 문자열에 색깔을 입혀준다.
        Plug 'wfxr/minimap.vim'

        "* text object
        Plug 'kana/vim-textobj-user'
            Plug 'kana/vim-textobj-indent'
            Plug 'thinca/vim-textobj-between'
        Plug 'wellle/targets.vim'

        "* 편집 기능 확장
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-commentary'
        Plug 'godlygeek/tabular'           " 텍스트 세로 정렬 도구
        Plug 'jiangmiao/auto-pairs', {'for': ['go', 'javascript', 'rust']}
        Plug 'junegunn/vim-easy-align'
        Plug 'AndrewRadev/splitjoin.vim'
        Plug 'tommcdo/vim-exchange'

        "* 커서 점프
        Plug 'easymotion/vim-easymotion'
        Plug 't9md/vim-choosewin'
        Plug 'vim-scripts/matchit.zip'
        Plug 'johngrib/vim-f-hangul'

        "* 검색
        Plug 'google/vim-searchindex'
        " Plug 'othree/eregex.vim'
        " Plug 'haya14busa/incsearch.vim'

        "* Color Theme
        Plug 'johngrib/FlatColor-johngrib'
        Plug 'tomasr/molokai'
        Plug 'johngrib/hosu'
        Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

        "* Quickfix
        Plug 'milkypostman/vim-togglelist'

    "* 자동완성
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'SirVer/ultisnips'
    Plug 'github/copilot.vim'
    Plug 'tenfyzhong/axring.vim'
    Plug 'tpope/vim-speeddating'

    "* 외부 기능 지원
        "* ctags
        Plug 'vim-scripts/taglist.vim'
        Plug 'ludovicchabant/vim-gutentags' " 자동으로 tags 파일을 갱신해 준다.
        Plug 'majutsushi/tagbar'

        "* git
        Plug 'tpope/vim-fugitive'       " git 명령어 wrapper
        Plug 'airblade/vim-gitgutter'   " git diff 를 라인 넘버 옆에 표시.
        Plug 'johngrib/vim-git-msg-wheel'

        "* ETC
        Plug 'diepm/vim-rest-console'
        Plug 'johngrib/vim-mac-dictionary'
        Plug 'tridactyl/vim-tridactyl'

    "* File 탐색, 브라우징
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'
        Plug 'ryanoasis/vim-devicons'
    " Plug 'wesleyche/srcexpl'
    Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'

    "* language 확장
    " Plug 'dense-analysis/ale', { 'do': 'brew install php-cs-fixer' }
    " https://github.com/dense-analysis/ale
    " Plug 'valloric/youcompleteme', { 'do': 'python3 ./install.py --clang-completer --go-completer --rust-completer --js-completer --tern-completer'}
    " Plug 'jszakmeister/vim-togglecursor'

        "* JavaScript
        Plug 'neoclide/coc-tsserver', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
        Plug 'ternjs/tern_for_vim', {'for': 'javascript'}

        "* Clojure
        Plug 'guns/vim-sexp',    {'for': 'clojure'}
        Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
        Plug 'tpope/vim-dispatch'
        Plug 'liquidz/vim-iced', {'for': 'clojure'}
        Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
        " Plug 'lambdalisue/fern.vim'
        " Plug 'liquidz/vim-iced-fern-debugger', {'for': 'clojure'}

        "* Golang
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

        "* Kotlin
        " Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
        " Plug 'weirongxu/coc-kotlin', {'for': 'kotlin', 'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

        "* Rust
        Plug 'rust-lang/rust.vim', {'for': 'rust'}

        "* yaml
        Plug 'stephpy/vim-yaml'

    "* Vim 기반 애플리케이션
    Plug 'johngrib/vim-game-code-break'
    Plug 'johngrib/vim-game-snake'
    " Plug 'tpope/vim-db'
    Plug 'johngrib/vimwiki', { 'branch': 'dev' }
    Plug 'johngrib/grib-wiki'

    "* 미분류
call plug#end()

"* COC plugin 목록
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#install-extensions
" :CocUpdate
let g:coc_global_extensions = [
            \ 'coc-ultisnips',
            \ 'coc-vimlsp',
            \ 'coc-go',
            \ 'coc-lists',
            \ 'coc-explorer',
            \ 'coc-clojure',
            \ 'coc-rust-analyzer',
            \]

syntax enable
filetype plugin indent on

"* vim set 설정

    set path+=**
    set nofixeol
    set conceallevel=0
    " set regexpengine=1

    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor\ --column
        set grepformat=%f:%l:%c%m
    elseif executable('ack')
        set grepprg=ack\ --nogroup\ --column\ $*
        set grepformat=%f:%l:%c:%m
    endif



    set nocompatible                  " vi 기능을 사용하지 않고, vim 만의 기능을 사용.
    " set linebreak                     " break at word boundary
    " set showbreak=++
    set list listchars=tab:·\ ,trail:·,extends:>,precedes:<
    set omnifunc=syntaxcomplete#Complete
    set mouse=a

    set hidden  " Buffer should still exist if window is closed
    set nopaste

    set smartcase hlsearch incsearch

    " command line에서 소문자 입력 후 탭을 누르면 대소문자 구분 없이 자동완성
    set ignorecase
    "set tildeop    "~ 를 다른 오퍼레이터와 함께 사용한다.

    " 화면 표시
    set number           " 라인 넘버 출력
    " set relativenumber
    set ruler            " 현재 커서 위치 (row, col) 좌표 출력
    set noerrorbells     " 에러 알림음 끄기
    " set background=dark  " 검정배경을 사용 (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)
    set laststatus=2     " 상태바를 언제나 표시할 것
    set showmatch        " 일치하는 괄호 하이라이팅
    set cursorline       " highlight current line
    set lazyredraw       " redraw only when we need to.
    set showcmd          " airline 플러그인과 충돌 가능성 있음.
    "set nowrap
    " set sidescroll=2 sidescrolloff=10
    set wildmenu wildignorecase
    set wildmode=full

    " 짜증나는 swp, backup 파일 안 만들기
    set noswapfile
    set nobackup

    set noerrorbells visualbell t_vb= " 사운드 벨, 비주얼 벨 비활성화

    augroup setgroup
        autocmd!
        autocmd GUIEnter * set visualbell t_vb=
    augroup END

    "사용
    set bs=indent,eol,start  " backspace 키 사용 가능
    set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
    "set noimd               " no imdisable 한글 입력기 관련인데 mac 에서는 안 통하는듯
    set cindent autoindent smartindent
    set history=200 undolevels=2000
    " set cursorcolumn
    set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz
    set splitbelow
    set splitright
    set virtualedit=block   " visual block mode를 쓸 때 문자가 없는 곳도 선택 가능하다
    set autoread

    set cmdheight=2
    set updatetime=300
    setglobal timeoutlen=1200
    setglobal ttimeoutlen=50
    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " This enables us to undo files even if you exit Vim.
    if has('persistent_undo')
        let s:vimDir = '$HOME/.vim'
        let &runtimepath.=','.s:vimDir
        let s:undoDir = expand(s:vimDir . '/undodir')

        call system('mkdir ' . s:vimDir)
        call system('mkdir ' . s:undoDir)

        let &undodir = s:undoDir
        set undofile
    endif

" initialize 설정 ---------------------------------------------------------------

" 마지막으로 수정된 곳에 커서를 위치함
    au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "norm g`\"" |
    \ endif

" map ----------------------------------------------------------------------
    let mapleader = "\<Space>"
    let maplocalleader = "\\"
    " nnoremap <Leader>e :browse oldfiles<CR>

    " nnoremap / /\v
    nnoremap k gk
    nnoremap gk k
    nnoremap j gj
    nnoremap gj j

    nnoremap & :&&<CR>
    xnoremap & :&&<CR>

    " nnoremap <F10>r :source ~/.vimrc<CR>
    "nnoremap gv `[v`]    " highlight last inserted text
    " nnoremap <Space>k i<CR><Esc>
    nnoremap K i<CR><Esc>

    nnoremap <M-/> :echom "[1]Explorer [2]Tagbar [3]Startify"<CR>
        nmap <A-1> :CocCommand explorer<CR>
        nmap <A-2> :TagbarToggle<CR>:e<CR>
        nmap <A-3> :Startify<CR>

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
    " nnoremap <F3>     :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

    " 참고 - ./vim-include/set-f1-f20.vim
    nnoremap <silent> <PageUp>   :bnext!<CR>
    nnoremap <silent> <PageDown> :bprevious!<CR>

    inoremap <C-e> <C-O>$
    inoremap <C-l> <right>

    " visual 모드에서 선택한 문자열로 검색한다.
    " https://vim.fandom.com/wiki/Search_for_visually_selected_text
    vnoremap <Space>* y/\V<C-R>=escape(@",'/\')<CR><CR>

    "Bubble lines
    " nnoremap <M-K> ddkP
    " nnoremap <M-J> ddp
    " nnoremap gV `[v`]

    " nnoremap <leader>ev :vsplit $MYVIMRC<cr>

    " 윈도우 관리
    " nnoremap <C-M-+> <C-w>+
    " nnoremap <C-M-_> <C-w>-
    " nnoremap <C-M-<> <C-w><
    " nnoremap <C-M->> <C-w>>
    nnoremap <nowait> <Esc>+ <C-w>+
    nnoremap <nowait> <Esc>_ <C-w>-
    nnoremap <nowait> <Esc>< <C-w><
    nnoremap <nowait> <Esc>> <C-w>>

    " reselect visual block after indent/outdent
    " link: http://tilvim.com/2013/04/24/reindenting.html
    " vnoremap < <gv
    " vnoremap > >gv

    " completion
    " <c-x><c-l>  whole lines :h i^x^l
    " <c-x><c-l>  keywords from current file  :h i^x^n
    " <c-x><c-k>  keywords from 'dictionary' option   :h i^x^k
    " <c-x><c-t>  keywords from 'thesaurus' option    :h i^x^t
    " <c-x><c-i>  keywords from current and included files    :h i^x^i
    " <c-x><c-]>  tags    :h i^x^]
    " <c-x><c-f>  file names  :h i^x^f
    " <c-x><c-d>  definitions or macros   :h i^x^d
    " <c-x><c-v>  Vim commands    :h i^x^v
    " <c-x><c-u>  user defined (as specified in 'completefunc')   :h i^x^u
    " <c-x><c-o>  omni completion (as specified in 'omnifunc')    :h i^x^o
    " <c-x>s  spelling suggestions

" Plugin 설정 -------------------------------------------------------------------

    " Autopair
    let g:AutoPairsFlyMode = 0
    let g:AutoPairsShortcutToggle = ''
    let g:AutoPairsShortcutFastWrap = ''
    let g:AutoPairsShortcutJump = ''
    let g:AutoPairsShortcutBackInsert = ''

    set statusline+=%*

    " let g:ale_fixers = { 'javascript': ['eslint'] }
    " let g:ale_javascript_eslint_use_global = 1
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 0
    let g:ale_linters = {'clojure': ['clj-kondo']}
    let g:ale_open_list = 1
    let g:ale_keep_list_window_open = 1
    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 1

    " rainbow
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

    " tabular
    vnoremap <C-t> :Tabularize /

    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)

    nnoremap <Space>w :w<CR>
    nnoremap <silent>s <nop>
    nnoremap <silent>S <nop>
    vnoremap <silent>s <nop>

    nnoremap <Space>f <Esc>:let @z=@/<CR>/\v[)"}]<CR>:let @/=@z<CR>
    nnoremap <Space>b <Esc>:let @z=@/<CR>?\v[("{]<CR>:let @/=@z<CR>

    " multiple_cursors
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    " nnoremap <C-c> :call multiple_cursors#quit()<CR>

    let g:vim_game_code_break_item_limit = 8

    " let g:ale_fixers = {'php': ['php_cs_fixer']}
    let g:ale_fixers = {}
    let g:ale_fix_on_save = 1

" functions -------------------------------------------------------------------
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" autocmd BufEnter *.png,*.jpg,*gif exec "! imgcat ".expand("%") | :bw

command! ToHtml :so $VIMRUNTIME/syntax/2html.vim

" http://vim.wikia.com/wiki/Copy_filename_to_clipboard
if has('win32')
    command! GetFileName :let @*=substitute(expand("%"), "/", "\\", "g")
    command! GetFileAddress :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
else
    command! GetFileName :let @*=expand('%')
    command! GetFileAddress :let @*=expand('%:p')
endif

" 현재 편집중인 파일 경로로 pwd 를 변경한다
command! Ncd :cd %:p:h

" command! Time :put =strftime('%Y-%m-%d %H:%M:%S +0900')

let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_range = 1
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1

augroup minimap_auto_close
    autocmd VimLeavePre * MinimapClose
augroup END


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

iabbr ㅇ. 있다.
iabbr ㅇ.. 입니다.
iabbr ㄱ.. 그리고

"* 화면 구성/색깔/커서
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has('termguicolors') && ($TERM_PROGRAM !~ "Apple_Terminal")
    set termguicolors
endif

colorscheme flatcolor-johngrib

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

" 커서가 지시하는 괄호의 짝 괄호 색 지정
highlight MatchParen ctermbg=red guibg=#ff0000

" Change cursor shape between insert and normal mode in iTerm2.app + tmux + vim
" https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  " insert 모드: | 모양 커서
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " normal 모드: █ 모양 커서
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  " replace 모드: _ 모양 커서
  let &t_SR = "\<esc>]50;CursorShape=2\x7"
endif


"* 설정 파일 include
for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor

