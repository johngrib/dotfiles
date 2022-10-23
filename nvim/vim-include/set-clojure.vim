"* Clojure 설정파일

" https://liquidz.github.io/vim-iced/#cheatsheet
" REPL 띄우고 vim에서 접속하려면
" $ iced repl -A:dev
" $ iced repl -A:dev:test:itest
" $ iced repl -A:migration

if exists("g:loaded_clojure_setting") || &cp
  finish
endif
let g:loaded_clojure_setting = 1

"* tagbar 설정
let g:tagbar_type_clojure = {
    \ 'ctagstype' : 'Clojure',
    \ 'sort': 0,
    \ 'kinds' : ['n:ns', 'e:form'],
    \}

"* vim-iced 설정
" jack in(vim 내에서 repl을 띄워 붙기)을 쓰려면 이걸 설정해 둬야 함.
let g:iced#nrepl#connect#iced_command = $HOME . '/.config/nvim/plugged/vim-iced/bin/iced'
let iced#nrepl#connect#jack_in_command = g:iced#nrepl#connect#iced_command . ' repl -A:dev:test:itest'
" let g:iced#debug#debugger = 'fern'
let g:iced#debug#debugger = 'default'

let g:iced_enable_default_key_mappings = v:false
let g:iced#buffer#stdout#file = $HOME . '/iced-stdout.log'
let g:iced#buffer#stdout#file_buffer_size = 20000


" let g:iced_default_key_mapping_leader = '<Leader>'
" let g:iced_enable_default_key_mappings = v:true
let g:iced_enable_clj_kondo_analysis = v:true
let g:iced#nrepl#enable_sideloader = v:true

" REPL을 오른쪽에 열어준다
let g:iced#buffer#stdout#mods = 'vertical'
" REPL 버퍼 사이즈(vertical이면 너비)
let g:iced#buffer#stdout#size = v:null
" let g:iced#buffer#stdout#size = 100

"** REPL 연결 hook 설정
let g:iced#hook = {
    \ 'connect_prepared': {
        \ 'type': 'function',
        \ 'exec': {params -> Noti_pipe(params, 'REPL 연결을 시도합니다.')}},
    \ 'connecting': {
        \ 'type': 'function',
        \ 'exec': {params -> Noti_pipe(params, 'REPL에 연결중입니다.')}},
    \ 'connected': {
        \ 'type': 'function',
        \ 'exec': {params -> Noti_pipe(params, 'REPL에 연결되었습니다.')}},
    \}

"* clj-kondo 설정
let g:clj_fmt_config = '{:indentation? true, :remove-surrounding-whitespace? true, :remove-trailing-whitespace? true, :remove-consecutive-blank-lines? false, :insert-missing-whitespace? true, :align-associative? false, :indents {#"^\w" [[:inner 0]], #".*" [[:inner 0]]}}'

"* 화면 설정
augroup clojure_custom_screen_view
    autocmd FileType clojure set list listchars=tab:⇥\ ,trail:·,extends:>,precedes:<,space:·,multispace:\ ·

    " jdbc/with-transaction 같은 문자열의 jdbc/ 부분을 색칠한다.
    autocmd FileType clojure syntax match ClojureRefNs /\v[\-a-zA-Z]+\//
    autocmd FileType clojure highlight ClojureRefNs ctermfg=Green guifg=#e0c9b7
    autocmd FileType clojure set wrap

    " https://vim.fandom.com/wiki/Regex_lookahead_and_lookbehind
    " autocmd FileType clojure exe 'syntax match ClojureMiddleSymbolHeadChar /\([a-z] \)\@<=[a-zA-Z]/'

    " let s:chars = '[a-zA-Z][a-zA-Z/\-]* '
    " let s:lookbehind = '/\([(\[{]' .. s:chars .. '\)\@<='
    " let s:lookahead = ' \@='
    " autocmd FileType clojure exe 'syntax match ClojureMiddleSymbol2 '
    "             \ .. s:lookbehind .. '[a-zA-Z\-][a-zA-Z\-]*'
    "             \ .. s:lookahead
    "             \ .. '/'
    " autocmd FileType clojure highlight ClojureMiddleSymbol2 guifg=#cbe3e7 ctermfg=253 gui=bold
augroup END

"* coc 설정
augroup vim_clojure_coc
    autocmd FileType clojure nmap <silent> s<C-]> <Plug>(coc-definition)
    autocmd FileType clojure nmap <silent> <C-]> :IcedDefJump<CR>
    autocmd FileType clojure nmap <silent> gy <Plug>(coc-type-definition)
    " autocmd VimLeavePre clojure TagbarClose
augroup END

"* iced 키 조합 설정
augroup vim_iced
    if g:iced_enable_default_key_mappings == v:true
        echoerr "[경고] g:iced_enable_default_key_mappings 가 true 입니다."
        " lua vim.notify("[경고] g:iced_enable_default_key_mappings 가 true 입니다.")
    endif

    " coc-clojure 사용은i :call CocAction 을 사용하고, 파라미터는 다음 파일의 "commands"를 참고할 것.
    " https://github.com/NoahTheDuke/coc-clojure/blob/main/package.json

    autocmd FileType clojure nmap s <nop>
    autocmd FileType clojure nmap sss :IcedCommandPalette<CR>

    " REPL: - "sr"
    autocmd FileType clojure nmap sr <nop>
    autocmd FileType clojure nmap srr <Plug>(iced_stdout_buffer_toggle)
    autocmd FileType clojure nmap srb <C-w>J10<C-w>-
    autocmd FileType clojure nmap srd <Plug>(iced_stdout_buffer_clear)
    autocmd FileType clojure nmap src <Plug>(iced_connect)
    autocmd FileType clojure nmap sri <Plug>(iced_interrupt)
    autocmd FileType clojure nmap srp <Plug>(iced_print_last)
    autocmd FileType clojure nmap srl :call CocAction('runCommand', 'lsp-clojure-server-info')<CR>
    autocmd FileType clojure nmap srj :call <SID>jack_in()<CR>

    " Jack In을 수행한다
    function! s:jack_in()
        let l:options = input('options: ', '-A:dev:test:itest')
        let g:iced#nrepl#connect#jack_in_command = g:iced#nrepl#connect#iced_command . ' repl ' . l:options
        IcedJackIn
    endfunction
    " iced#nrepl#is_connected() 함수를 호출해 REPL에 연결되어 있는지 확인할 수 있음.

    " Eval Code: - "se"
    "  (defn greet [] (println "hello world"))
    "                           <--inner-->
    "                 <-----outer_list------>
    "  <-----------outer_top_list------------>
    autocmd FileType clojure nmap se <nop>
    autocmd FileType clojure vmap se <Plug>(iced_eval_visual)

    autocmd FileType clojure nmap s? :vs ~/dotfiles/nvim/vim-include/set-clojure.vim<CR>
    autocmd FileType clojure nmap see <Plug>(iced_eval_and_print)<Plug>(sexp_outer_list)``
    autocmd FileType clojure nmap sew <Plug>(iced_eval_and_print)<Plug>(sexp_inner_element)``
    autocmd FileType clojure nmap ser <Plug>(iced_eval_and_print)<Plug>(sexp_outer_top_list)``
    autocmd FileType clojure nmap sef :IcedRequire<CR>:echom "file loaded:" expand("%")<CR>
    autocmd FileType clojure nmap seF :IcedRequireAll<CR>:echom "Require and reload current file."<CR>
    " autocmd FileType clojure nmap sea :IcedRefresh<CR>:echom "Reload all changed files on the classpath."<CR>
    autocmd FileType clojure nmap <silent> sea :IcedRefresh<CR>:lua vim.notify("Reload all changed files on the classpath.")<CR>
    autocmd FileType clojure nmap seA :IcedRefreshAll<CR>:echom "Reload all files on the classpath."<CR>
    autocmd FileType clojure nmap seu <Plug>(iced_undef_all_in_ns)
    autocmd FileType clojure nmap se' <Plug>(iced_eval_at_mark)
    autocmd FileType clojure nmap sem <Plug>(iced_eval_at_mark)
    autocmd FileType clojure nmap sec <Plug>(iced_eval_and_comment)

    autocmd FileType clojure nmap se; A ;; =><C-r>1<Esc>``
    autocmd FileType clojure nmap secc <Plug>(iced_eval_and_comment)<Plug>(sexp_outer_top_list)``
    autocmd FileType clojure nmap secw <Plug>(iced_eval_and_comment)<Plug>(sexp_inner_element)``
    autocmd FileType clojure nmap sece <Plug>(iced_eval_and_comment)<Plug>(sexp_outer_list)``
    autocmd FileType clojure nmap secr <Plug>(iced_eval_and_comment)<Plug>(sexp_outer_top_list)``

    " Code Analyse: - "sa"
    autocmd FileType clojure nmap sa <nop>
    autocmd FileType clojure nmap sar :IcedBrowseReferences<CR>
    autocmd FileType clojure nmap saR <Plug>(coc-references)
    autocmd FileType clojure nmap sad :IcedBrowseDependencies<CR>
    autocmd FileType clojure nmap sau :IcedUseCaseOpen<CR>:echom "list use case: gF to open file"<CR>
    autocmd FileType clojure nmap sa/ <Plug>(iced_grep)
    autocmd FileType clojure nmap sam <Plug>(iced_macroexpand_1_outer_list)
    autocmd FileType clojure nmap saM <Plug>(iced_macroexpand_outer_list)
    autocmd FileType clojure nmap sap <Plug>(iced_document_popup_open)
    autocmd FileType clojure nmap sak <Plug>(iced_document_open)
    autocmd FileType clojure nmap saK <Plug>(iced_clojuredocs_open)
    autocmd FileType clojure nmap sas :IcedSourcePopupShow<CR>
    autocmd FileType clojure nmap saS :IcedSourceShow<CR>
    autocmd FileType clojure nmap <silent> sai <Plug>(coc-implementation)

    " autocmd FileType clojure nmap sal :make<CR>:copen<CR>
    autocmd FileType clojure nmap sal :Dispatch<CR>
    autocmd FileType clojure setlocal makeprg=clj-kondo\ --lint\ %
    autocmd FileType clojure setlocal errorformat=%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m

    " Clj Kondo: - "sk"
    " clj kondo를 파일에 대해 실행하고, 경고 목록을 보여줌.
    autocmd FileType clojure nmap skl :Dispatch<CR>
    " .clj-kondo/config.edn 에 매크로를 등록해서 인식하게 해준다.
    autocmd FileType clojure nmap skm :call CocAction('runCommand', 'lsp-clojure-resolve-macro-as')<CR>
    " .clj-kondo/ignore 를 추가해서 경고를 끈다.
    autocmd FileType clojure nmap sks i#_:clj-kondo/ignore<ESC>
    " ↓ 작동안함. 이유를 모르겠음.
    " autocmd FileType clojure nmap sks :call CocAction('runCommand', 'lsp-clojure-suppress-diagnostic')<CR>

    " Name Space: - "sn"
    autocmd FileType clojure nmap sna :IcedAddNs<CR>
    autocmd FileType clojure nmap sns :call <SID>sort_clojure_namspace_require()<CR>
    function! s:sort_clojure_namspace_require()
        if input("namespace require list를 정렬하시겠습니까? (y/n)") =~ "y"
            execute "normal! gg/:require ea/))iggvip}10</[vip:sortkkJJ}kJJvip="
        endif
    endfunction
    autocmd FileType clojure nmap snS :call system("clojure-lsp clean-ns --settings '{:clean {:ns-inner-blocks-indentation :same-line :sort {:ns true :require true :import true :refer {:max-line-length 80}}}}' --filenames " . expand("%"))<CR>:e<CR>

    autocmd FileType clojure nmap snc :IcedCleanNs<CR>
    " 왜 안되는지 모르겠음.. 그리고 어떻게 쓰는지 모르겠음
    " autocmd FileType clojure nmap <silent> snA :call CocAction('runCommand', 'lsp-clojure-add-require-suggestion')<CR>

    " Code Typing: - "sc"
    autocmd FileType clojure nmap sc <nop>
    autocmd FileType clojure nmap scR :IcedRenameSymbol<CR>
    autocmd FileType clojure nmap scr <Plug>(coc-rename)
    " 잘되지만 lsp-clojure-change-coll 이 좀 더 편함
    autocmd FileType clojure nmap <silent> scc :call CocActionAsync('runCommand', 'lsp-clojure-cycle-coll')<CR>
    autocmd FileType clojure nmap <silent> scC :call CocActionAsync('runCommand', 'lsp-clojure-change-coll')<CR>
    autocmd FileType clojure nmap <silent> scf :call CocAction('runCommand', 'lsp-clojure-create-function')<CR>
    " 커서가 위치한 단어를 복사해서 아랫줄에 _ (println 단어)를 만들어 준다. let 구문에서 사용할 것.
    autocmd FileType clojure nmap scp yiwo_<Space>(println "<C-r>":" <C-r>")<Esc>
    autocmd FileType clojure nmap sc# <Plug>(sexp_move_to_prev_bracket)i#_<Esc>``
    autocmd FileType clojure nmap sc3 <Plug>(sexp_move_to_prev_element_head)i#_<Esc>l
    autocmd FileType clojure nmap scl :IcedMoveToLet<CR>
    autocmd FileType clojure nmap scL :call CocAction('runCommand', 'lsp-clojure-move-to-let')<CR>
    autocmd FileType clojure nmap sc> :IcedThread
    " autocmd FileType clojure nmap sctl :call CocActionAsync('runCommand', 'lsp-clojure-thread-last-all')<CR>

    " 오버로딩 함수 작성
    autocmd FileType clojure nmap sca <Plug>(iced_add_arity)
    autocmd FileType clojure nmap scm :call CocAction('codeAction', 'cursor')<CR>

    " Testing: - "st"
    autocmd FileType clojure nmap <silent> stc :call CocAction('runCommand', 'lsp-clojure-create-test')<CR>
    autocmd FileType clojure nmap st' <Plug>(iced_cycle_src_and_test)
    autocmd FileType clojure nmap stt :IcedTestUnderCursor<CR>
    " Run tests in current namespace.
    autocmd FileType clojure nmap stn :IcedTestNs<CR>
    " Run all tests in current project.
    autocmd FileType clojure nmap sta :IcedTestAll<CR>
    " Re run failed tests.
    autocmd FileType clojure nmap str :IcedTestRedo<CR>
    " Run last test again.
    autocmd FileType clojure nmap st. :IcedTestRerunLast<CR>
    " 아직 필요를 못 느낌
    " :IcedTestSpecCheck

    " Debug: - "sd"
    autocmd FileType clojure nmap sd <nop>
    autocmd FileType clojure nmap sdd :IcedToggleTraceVar<CR>
    autocmd FileType clojure nmap sdv :IcedToggleTraceVar<Space>
    autocmd FileType clojure nmap sdn :IcedToggleTraceNs<Space>
    autocmd FileType clojure nmap sdb :IcedBrowseTapped<CR>

    autocmd FileType clojure nmap <silent> <Tab><Tab>r <Plug>(coc-references)

    autocmd FileType clojure nmap == <Plug>(iced_format)
    " https://github.com/junegunn/vim-easy-align/issues/115#issuecomment-325899234
    autocmd FileType clojure nnoremap =[ vi[<c-v>$:EasyAlign\ g/^\S/<cr>gv=
    autocmd FileType clojure nnoremap ={ vi{<c-v>$:EasyAlign\ g/^\S/<cr>gv=

    " autocmd FileType clojure let &iskeyword = '@,48-57,_,192-255,?,-,*,!,+,=,<,>,.,:,$,#,%,&,39'
    " autocmd FileType clojure nnoremap * :let &iskeyword = '@,48-57,_,192-255,?,-,*,!,+,=,<,>,.,:,$,#,%,&,39'<CR>*
    " autocmd FileType clojure nnoremap s* :let &iskeyword = '@,48-57,_,192-255,?,-,*,!,+,/,=,<,>,.,:,$,#,%,&,39'<CR>*
    " autocmd FileType clojure nnoremap # :let &iskeyword = '@,48-57,_,192-255,?,-,*,!,+,=,<,>,.,:,$,#,%,&,39'<CR>#
    " autocmd FileType clojure nnoremap s# :let &iskeyword = '@,48-57,_,192-255,?,-,*,!,+,/,=,<,>,.,:,$,#,%,&,39'<CR>#

    " Insert Mode:
    autocmd FileType clojure imap <C-f> <Esc><Plug>(sexp_move_to_next_bracket)a
    autocmd FileType clojure imap <C-b> <Esc><Plug>(sexp_move_to_prev_bracket)i
augroup END

"* SEXP 설정
" 편집한 값들은 한 단계 인덴트를 오른쪽으로 당겼음
let g:sexp_mappings = {
            \ 'sexp_outer_list':                'af',
            \ 'sexp_inner_list':                'if',
            \ 'sexp_outer_top_list':            'aF',
            \ 'sexp_inner_top_list':            'iF',
                \ 'sexp_outer_string':              '',
                \ 'sexp_inner_string':              '',
            \ 'sexp_outer_element':             'ae',
            \ 'sexp_inner_element':             'ie',
            \ 'sexp_move_to_prev_bracket':      '(',
            \ 'sexp_move_to_next_bracket':      ')',
                \ 'sexp_move_to_prev_element_head': 'B',
                \ 'sexp_move_to_next_element_head': 'W',
                \ 'sexp_move_to_prev_element_tail': 'gE',
                \ 'sexp_move_to_next_element_tail': 'E',
                \ 'sexp_flow_to_prev_close':        '',
                \ 'sexp_flow_to_next_open':         '',
                \ 'sexp_flow_to_prev_open':         '',
                \ 'sexp_flow_to_next_close':        '',
                \ 'sexp_flow_to_prev_leaf_head':    '',
                \ 'sexp_flow_to_next_leaf_head':    '',
                \ 'sexp_flow_to_prev_leaf_tail':    '',
                \ 'sexp_flow_to_next_leaf_tail':    '',
            \ 'sexp_move_to_prev_top_element':  '[[',
            \ 'sexp_move_to_next_top_element':  ']]',
                \ 'sexp_select_prev_element':       '[v',
                \ 'sexp_select_next_element':       ']v',
            \ 'sexp_indent':                    '==',
            \ 'sexp_indent_top':                '=-',
                \ 'sexp_round_head_wrap_list':      'sw(',
                \ 'sexp_round_tail_wrap_list':      'sw)',
                \ 'sexp_square_head_wrap_list':     'sw[',
                \ 'sexp_square_tail_wrap_list':     'sw]',
                \ 'sexp_curly_head_wrap_list':      'sw{',
                \ 'sexp_curly_tail_wrap_list':      'sw}',
                \ 'sexp_round_head_wrap_element':   'swe(',
                \ 'sexp_round_tail_wrap_element':   'swe)',
                \ 'sexp_square_head_wrap_element':  'swe[',
                \ 'sexp_square_tail_wrap_element':  'swe]',
                \ 'sexp_curly_head_wrap_element':   'swe{',
                \ 'sexp_curly_tail_wrap_element':   'swe}',
            \ }

" ds( 랑 똑같아서 필요없다.
let g:sexp_mappings.sexp_splice_list = ''

" convolute - https://stackoverflow.com/a/18192105
"                             v
" from: (let [foo bar] (if a b c)) 
" to  : (if a b (let [foo bar] c))
let g:sexp_mappings.sexp_convolute = 'swc'
" 부모 form 삭제
"                            v
" from: (let [foo bar] (if a b c)) 
" to  : (if a b c) 
let g:sexp_mappings.sexp_raise_list = 'sdp'
" 형제 element 모두 삭제하고 혼자 남게 됨
"                            v
" from: (let [foo bar] (if a b c)) 
" to  : (let [foo bar] b) 
let g:sexp_mappings.sexp_raise_element = 'sdo'

"* Conjure 설정 (deprecated)
" Conjure
" https://github.com/Olical/conjure/issues/244

" if exists('g:clojure_conjure_loaded')
"     let g:conjure#mapping#doc_word = ["\<Tab>d"]
"     let g:conjure#mapping#prefix = "<leader>"

"     autocmd FileType clojure set sessionoptions=blank,curdir,folds,help,tabpages,winsize
"     autocmd VimEnter * call system("~/.config/nvim/vim-include/fix-conjure-session.sh")
" endif


