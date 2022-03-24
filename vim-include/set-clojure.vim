" Clojure

if exists("g:loaded_clojure_setting") || &cp
  finish
endif
let g:loaded_clojure_setting = 1

" https://liquidz.github.io/vim-iced/#cheatsheet
" REPL 띄우고 vim에서 접속하려면
" $ iced repl -A:dev

let g:clojure_vim_iced_loaded = v:true
let g:clojure_conjure_loaded = v:false

let g:clj_fmt_config = '{:indentation? true, :remove-surrounding-whitespace? true, :remove-trailing-whitespace? true, :remove-consecutive-blank-lines? false, :insert-missing-whitespace? true, :align-associative? false, :indents {#"^\w" [[:inner 0]], #".*" [[:inner 0]]}}'

augroup vim_clojure_coc
    " autocmd FileType clojure nmap <silent> <C-]> <Plug>(coc-definition)
    autocmd FileType clojure nmap <silent> <C-]> :IcedDefJump<CR>
    autocmd FileType clojure nmap <silent> gy <Plug>(coc-type-definition)
    autocmd FileType clojure nmap <silent> gi <Plug>(coc-implementation)
    autocmd FileType clojure nmap <silent> gr <Plug>(coc-references)
augroup END

augroup vim_iced
    " let g:iced_formatter = 'cljstyle'

    " coc-clojure 사용은i :call CocAction 을 사용하고, 파라미터는 다음 파일의 "commands"를 참고할 것.
    " https://github.com/NoahTheDuke/coc-clojure/blob/main/package.json

    autocmd FileType clojure nmap sss :IcedCommandPalette<CR>

    " REPL: - "sr"
    autocmd FileType clojure nmap srr <Plug>(iced_stdout_buffer_toggle)
    autocmd FileType clojure nmap srd <Plug>(iced_stdout_buffer_clear)
    autocmd FileType clojure nmap src <Plug>(iced_connect)
    autocmd FileType clojure nmap sri <Plug>(iced_interrupt)
    " Eval Code: - "se"
    "  (defn greet [] (println "hello world"))
    "                           <--inner-->
    "                 <-----outer_list------>
    "  <-----------outer_top_list------------>
    autocmd FileType clojure vmap se <Plug>(iced_eval_visual)

    autocmd FileType clojure nmap s? :vs ~/dotfiles/vim-include/set-clojure.vim<CR>
    autocmd FileType clojure nmap see <Plug>(iced_eval_and_print)<Plug>(sexp_outer_list)``
    autocmd FileType clojure nmap sew <Plug>(iced_eval_and_print)<Plug>(sexp_inner_element)``
    autocmd FileType clojure nmap ser <Plug>(iced_eval_and_print)<Plug>(sexp_outer_top_list)``
    autocmd FileType clojure nmap sef :IcedRequire<CR>:echom "file loaded:" expand("%")<CR>
    autocmd FileType clojure nmap seF :IcedRequireAll<CR>:echom "Require and reload current file."<CR>
    autocmd FileType clojure nmap sea :IcedRefresh<CR>:echom "Reload all changed files on the classpath."<CR>
    autocmd FileType clojure nmap seA :IcedRefreshAll<CR>:echom "Reload all files on the classpath."<CR>
    autocmd FileType clojure nmap seu <Plug>(iced_undef_all_in_ns)
    autocmd FileType clojure nmap se' <Plug>(iced_eval_at_mark)
    autocmd FileType clojure nmap sem <Plug>(iced_eval_at_mark)
    autocmd FileType clojure nmap sec <Plug>(iced_eval_and_comment)


    " Code Analyse: - "sa"
    autocmd FileType clojure nmap sar :IcedBrowseReferences<CR>
    autocmd FileType clojure nmap sad :IcedBrowseDependencies<CR>
    autocmd FileType clojure nmap sau :IcedUseCaseOpen<CR>:echom "list use case: gF to open file"<CR>
    autocmd FileType clojure nmap sa/ <Plug>(iced_grep)
    autocmd FileType clojure nmap sam <Plug>(iced_macroexpand_1_outer_list)
    autocmd FileType clojure nmap saM <Plug>(iced_macroexpand_outer_list)
    autocmd FileType clojure nmap K <Plug>(iced_document_popup_open)
    autocmd FileType clojure nmap sak <Plug>(iced_document_open)
    autocmd FileType clojure nmap sas :IcedSourcePopupShow<CR>
    autocmd FileType clojure nmap saS :IcedSourceShow<CR>

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
    autocmd FileType clojure nmap sns :call Sort_clojure_namspace_require()<CR>
    function! Sort_clojure_namspace_require()
        if input("namespace require list를 정렬하시겠습니까? (y/n)") =~ "y"
            execute "normal! gg/:require ea/))iggvip}10</[vip:sortkkJJ}kJJvip="
        endif
    endfunction

    autocmd FileType clojure nmap snc :IcedCleanNs<CR>
    " 왜 안되는지 모르겠음.. 그리고 어떻게 쓰는지 모르겠음
    " autocmd FileType clojure nmap <silent> snA :call CocAction('runCommand', 'lsp-clojure-add-require-suggestion')<CR>

    " Code Typing: - "sc"
    autocmd FileType clojure nmap scr :IcedRenameSymbol<CR>
    autocmd FileType clojure nmap scR <Plug>(coc-rename)
    " 잘되지만 lsp-clojure-change-coll 이 좀 더 편함
    " autocmd FileType clojure nmap <silent> scc :call CocAction('runCommand', 'lsp-clojure-cycle-coll')<CR>
    autocmd FileType clojure nmap <silent> scc :call CocAction('runCommand', 'lsp-clojure-change-coll')<CR>
    autocmd FileType clojure nmap <silent> scf :call CocAction('runCommand', 'lsp-clojure-create-function')<CR>
    " autocmd FileType clojure nmap <silent> scp :call CocAction('runCommand', 'lsp-clojure-cycle-privacy')<CR>

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

    autocmd FileType clojure nmap <silent> <Tab><Tab>r <Plug>(coc-references)

    autocmd FileType clojure nmap <Tab>c <Plug>(iced_command_palette)
    " :IcedClojureDocsOpen
    autocmd FileType clojure nmap <Tab>d <Plug>(iced_clojuredocs_open)

    autocmd FileType clojure nmap == <Plug>(iced_format)
    " https://github.com/junegunn/vim-easy-align/issues/115#issuecomment-325899234
    autocmd FileType clojure nnoremap =[ vi[<c-v>$:EasyAlign\ g/^\S/<cr>gv=
    autocmd FileType clojure nnoremap ={ vi{<c-v>$:EasyAlign\ g/^\S/<cr>gv=
augroup END

let g:iced_default_key_mapping_leader = '<Leader>'
let g:iced_enable_default_key_mappings = v:true
let g:iced_enable_clj_kondo_analysis = v:true
let g:iced#nrepl#enable_sideloader = v:true

let g:iced#buffer#stdout#mods = 'vertical'
let g:iced#buffer#stdout#size = v:null

" augroup vim_sexp_setting
"     " https://github.com/tpope/vim-sexp-mappings-for-regular-people/blob/master/plugin/sexp_mappings_for_regular_people.vim
"     autocmd FileType clojure nmap B   <Plug>(sexp_move_to_prev_element_head)
"     autocmd FileType clojure nmap W   <Plug>(sexp_move_to_next_element_head)
"     autocmd FileType clojure nmap gE  <Plug>(sexp_move_to_prev_element_tail)
"     autocmd FileType clojure nmap E   <Plug>(sexp_move_to_next_element_tail)
"     autocmd FileType clojure xmap B   <Plug>(sexp_move_to_prev_element_head)
"     autocmd FileType clojure xmap W   <Plug>(sexp_move_to_next_element_head)
"     autocmd FileType clojure xmap gE  <Plug>(sexp_move_to_prev_element_tail)
"     autocmd FileType clojure xmap E   <Plug>(sexp_move_to_next_element_tail)
"     autocmd FileType clojure omap B   <Plug>(sexp_move_to_prev_element_head)
"     autocmd FileType clojure omap W   <Plug>(sexp_move_to_next_element_head)
"     autocmd FileType clojure omap gE  <Plug>(sexp_move_to_prev_element_tail)
"     autocmd FileType clojure omap E   <Plug>(sexp_move_to_next_element_tail)
"     autocmd FileType clojure nmap <i  <Plug>(sexp_insert_at_list_head)
"     autocmd FileType clojure nmap >a  <Plug>(sexp_insert_at_list_tail)
"     autocmd FileType clojure nmap <f  <Plug>(sexp_swap_list_backward)
"     autocmd FileType clojure nmap >f  <Plug>(sexp_swap_list_forward)
"     autocmd FileType clojure nmap <e  <Plug>(sexp_swap_element_backward)
"     autocmd FileType clojure nmap >e  <Plug>(sexp_swap_element_forward)
"     autocmd FileType clojure nmap >(  <Plug>(sexp_emit_head_element)
"     autocmd FileType clojure nmap <)  <Plug>(sexp_emit_tail_element)
"     autocmd FileType clojure nmap <(  <Plug>(sexp_capture_prev_element)
"     autocmd FileType clojure nmap >)  <Plug>(sexp_capture_next_element)
" augroup END

" https://github.com/Olical/conjure/issues/244

if exists('g:clojure_conjure_loaded')
    let g:conjure#mapping#doc_word = ["\<Tab>d"]
    let g:conjure#mapping#prefix = "<leader>"

    autocmd FileType clojure set sessionoptions=blank,curdir,folds,help,tabpages,winsize
    autocmd VimEnter * call system("~/.config/nvim/vim-include/fix-conjure-session.sh")
endif


