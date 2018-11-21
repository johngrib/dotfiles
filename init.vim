" init.vim : .nvimrc
" location of init.vim : ~/.config/nvim/

" for deoplete plugin
    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction

" Vim-Plug 설정 ------------------------------------------------------------------
" 아래와 같이 설정한 다음 :PlugInstall<CR> 해주면 된다.
call plug#begin('~/.vim/plugged')

    " VIM POWER
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'tpope/vim-repeat'

    " tags
    Plug 'vim-scripts/taglist.vim'
    Plug 'ludovicchabant/vim-gutentags' " 자동으로 tags 파일을 갱신해 준다.
    Plug 'majutsushi/tagbar'
    Plug 'jszakmeister/markdown2ctags', {'do' : 'cp ./markdown2ctags.py ~/.local/bin/markdown2ctags.py'}

    " version control
    Plug 'tpope/vim-fugitive'           " git 명령어 wrapper
    Plug 'simnalamburt/vim-mundo'

    " file browser
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
        " Plug 'jistr/vim-nerdtree-tabs'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

    " editing
    Plug 'tpope/vim-surround'
    Plug 'bling/vim-airline'           " BUFFER navigator, status line 을 제공한다.
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-entire'
        Plug 'kana/vim-textobj-indent'
        Plug 'thinca/vim-textobj-between'
    Plug 'wellle/targets.vim'           " text object utils
    Plug 'jiangmiao/auto-pairs'
    Plug 'godlygeek/tabular'           " 텍스트 세로 정렬 도구
    " Plug 'junegunn/vim-easy-align'

    " searching
    Plug 'vim-scripts/matchit.zip'
    " Plug 'othree/eregex.vim'
    " Plug 'haya14busa/incsearch.vim'

    " language support
    " Plug 'scrooloose/syntastic'        " 파일을 저장할 때 자동으로 문법 검사(ale과 중복되는 기능)
    Plug 'w0rp/ale'                      " 실시간으로 문법 검사 (syntastic 과 중복되는 기능)
    " Plug 'junegunn/vim-xmark', { 'do': 'make' }

    Plug 'valloric/youcompleteme', { 'do': 'python3 ./install.py --clang-completer --go-completer --rust-completer --js-completer'}

    " Plug 'wesleyche/srcexpl'
    " Plug 'honza/vim-snippets'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


    " screen view
    Plug 'luochen1990/rainbow'          " 괄호를 level 별로 다르게 색칠한다. html 태그에도 적용.
    Plug 'kshenoy/vim-signature'        " m mark 위치를 표시해준다.
    Plug 'airblade/vim-gitgutter'       " git diff 를 라인 넘버 옆에 표시.
    " Plug 'ap/vim-css-color'             " #rrggbb 형식의 문자열에 색깔을 입혀준다.
    Plug 'mhinz/vim-startify'           " 시작 화면을 꾸며준다. MRU가 있어 편리하다.

    " Plug 'koron/nyancat-vim'
    Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

    Plug 'diepm/vim-rest-console'
    Plug 'johngrib/vim-f-hangul'
    Plug 'johngrib/FlatColor-johngrib'

    Plug 'SirVer/ultisnips'
    " Plug 'leafgarland/typescript-vim'
    Plug 'milkypostman/vim-togglelist'
    Plug 'jszakmeister/vim-togglecursor'
    Plug 'johngrib/vim-git-msg-wheel'

    " Plug 'tpope/vim-db'
    " Plug 'bartmalanczuk/vim-trex-runner'
    " Plug 'johngrib/vim-game-code-break'
    Plug 'johngrib/vim-mac-dictionary'
call plug#end()

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
    " set termguicolors
endif

" Theme
syntax enable
colorscheme flatcolor-johngrib
filetype plugin indent on " Put your non-Plugin stuff after this line

" set ----------------------------------------------------------------------

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

    if has("nvim")
        " set termguicolors
        " set clipboard^=unnamedplus
    else
        " set clipboard^=unnamed,unnamedplus
        " set clipboard^=unnamedplus
    endif

    if has("gui_macvim")
        set macmeta
        set guifont=Meslo\ LG\ S\ DZ\ Regular\ Nerd\ Font\ Complete:h13

        " macVim 에서 esc 로 영문변환, imi 는 1 또는 2 로 설정해준다
        set noimd
        set imi=1
    else
        " tmux에서 배경색이 이상하게 나오는 문제를 해결한다.
        " link : http://stackoverflow.com/a/15095377
        set t_ut=
    endif

    set nocompatible                  " vi 기능을 사용하지 않고, vim 만의 기능을 사용.
    " set linebreak                     " break at word boundary
    " set showbreak=++
    set list listchars=tab:·\ ,trail:·,extends:>,precedes:<
    set omnifunc=syntaxcomplete#Complete
    set mouse=a

    set hidden  " Buffer should still exist if window is closed
    set nopaste

    set smartcase ignorecase hlsearch incsearch
    "set tildeop    "~ 를 다른 오퍼레이터와 함께 사용한다.
    set wmnu        " tab 자동완성시 가능한 목록을 보여줌

    " 화면 표시
    set nu               " 라인 넘버 출력
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

    nnoremap <C-j> :
    nnoremap k gk
    nnoremap gk k
    nnoremap j gj
    nnoremap gj j

    nnoremap & :&&<CR>
    xnoremap & :&&<CR>

    nnoremap <F10>r :source ~/.vimrc<CR>
    "nnoremap gv `[v`]    " highlight last inserted text
    nnoremap K i<CR><Esc>

    " copy , paste , select 기능 보완
    nnoremap Y y$
    nnoremap <Leader>y "+y
    nnoremap <Leader>Y "+yg_
    vnoremap <Leader>y "+y
    nnoremap <Leader>d "+d
    nnoremap <Leader>D "+yD
    vnoremap <Leader>d "+d
    nnoremap <Leader>p "+p
    nnoremap <Leader>P "+P
    " nnoremap <F3>     :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

    " 버퍼 관리
    " nnoremap <M-T> :enew<CR>       " 새로운 버퍼를 연다
    nnoremap gt :bnext!<CR>
    nnoremap gr :bprevious!<CR>
    nnoremap <M-Q> :bp <BAR> bd #<CR> " 현재 버퍼를 닫고 이전 버퍼로 이동

    inoremap <C-e> <C-O>$
    inoremap <C-l> <right>


    "Bubble lines
    " nnoremap <M-K> ddkP
    " nnoremap <M-J> ddp
    " nnoremap gV `[v`]

    " nnoremap <leader>ev :vsplit $MYVIMRC<cr>

    " 윈도우 관리
    nnoremap <M-+> <C-w>+
    nnoremap <M-_> <C-w>-
    nnoremap <M-<> <C-w><
    nnoremap <M->> <C-w>>
    nnoremap <nowait> <Esc>+ <C-w>+
    nnoremap <nowait> <Esc>_ <C-w>-
    nnoremap <nowait> <Esc>< <C-w><
    nnoremap <nowait> <Esc>> <C-w>>
    nnoremap <M-h> <C-w>h
    nnoremap <M-j> <C-w>j
    nnoremap <M-k> <C-w>k
    nnoremap <M-l> <C-w>l

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

    " " incsearch
    " let g:incsearch#auto_nohlsearch = 0
    " map /  <Plug>(incsearch-forward)
    " map ?  <Plug>(incsearch-backward)
    " map g/ <Plug>(incsearch-stay)
    " map n  <Plug>(incsearch-nohl-n)
    " map N  <Plug>(incsearch-nohl-N)
    " map *  <Plug>(incsearch-nohl-*)
    " map #  <Plug>(incsearch-nohl-#)
    " map g* <Plug>(incsearch-nohl-g*)
    " map g# <Plug>(incsearch-nohl-g#)

    " Mundo
    nnoremap <LocalLeader>u :MundoToggle<cr>

    " rainbow
    nnoremap <LocalLeader>r :RainbowToggle<CR>


    " Syntastic 설정
    " https://thechefprogrammer.blogspot.kr/2014/05/syntax-check-for-php-and-javascript.html
    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_php_checkers = ['php']
    let g:syntastic_check_on_wq = 0
    let g:syntastic_mode_map = { 'mode': 'passive' }
    let g:syntastic_auto_loc_list = 0
    " nnoremap <silent> <F2> :SyntasticCheck<CR>

    " let g:ale_fixers = { 'javascript': ['eslint'] }
    " let g:ale_javascript_eslint_use_global = 1
    let g:ale_lint_on_save = 0
    let g:ale_lint_on_text_changed = 0

    " rainbow
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

    " tabular
    vnoremap <C-t> :Tabularize /

    "eclim
    " let g:EclimCompletionMethod = 'omnifunc'

    " eregex
    nnoremap <leader>/ :call eregex#toggle()<CR>
    let g:eregex_default_enable = 0
    let g:eregex_forward_delim = '/'
    let g:eregex_backward_delim = '?'
    let g:eregex_force_case = 0

    " nmap ga <Plug>(EasyAlign)
    " xmap ga <Plug>(EasyAlign)

    nnoremap <Space>w :w<CR>
    nnoremap <silent>s <S-">
    vnoremap <silent>s <S-">

    nnoremap n nzz
    nnoremap N Nzz
    nnoremap } }zz
    nnoremap { {zz

    nnoremap <LocalLeader>d :MacDictWord<CR>
    nnoremap <LocalLeader><LocalLeader>d :MacDictQuery<CR>

    " srcexpl
    " nmap <LocalLeader>e :SrcExplToggle<CR>
    " let g:SrcExpl_winHeight = 8
    " let g:SrcExpl_refreshTime = 300
    " let g:SrcExpl_jumpKey = "<f2>"
    " let g:SrcExpl_gobackKey = "<SPACE>"

    " " // In order to avoid conflicts, the Source Explorer should know what plugins
    " " // except itself are using buffers. And you need add their buffer names into
    " " // below listaccording to the command ":buffers!"
    " let g:SrcExpl_pluginList = [
    "         \ "__Tag_List__",
    "         \ "_NERD_tree_"
    "     \ ]
    " let g:SrcExpl_searchLocalDef = 1
    " let g:SrcExpl_isUpdateTags = 0
    " let g:SrcExpl_prevDefKey = "<PAGEUP>"
    " let g:SrcExpl_nextDefKey = "<PAGEDOWN>"

    " multiple_cursors
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
    " nnoremap <C-c> :call multiple_cursors#quit()<CR>

    let g:vim_game_code_break_item_limit = 8

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

" Change cursor shape between insert and normal mode in iTerm2.app + tmux + vim
" https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

runtime! vim-include/*.vim

let @q=":%s\/\\v\\s+/\\r/ggg$yjGA - $pggddGddvip:!bc:%s/-//vip:sort nG$yjGA - $pggddGddvip:!bc:%g/^1$/dG:.s/^$/is jolly jumper!/"

iabbr <expr> TS strftime("%c")

