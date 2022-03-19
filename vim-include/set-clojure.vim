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

augroup vim_clojure_coc
    " autocmd FileType clojure nmap <silent> <C-]> <Plug>(coc-definition)
    autocmd FileType clojure nmap <silent> <C-]> :IcedDefJump<CR>
    autocmd FileType clojure nmap <silent> gy <Plug>(coc-type-definition)
    autocmd FileType clojure nmap <silent> gi <Plug>(coc-implementation)
    autocmd FileType clojure nmap <silent> gr <Plug>(coc-references)
augroup END

augroup vim_iced
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
    autocmd FileType clojure nmap seu <Plug>(iced_undef_all_in_ns)
    autocmd FileType clojure nmap se' <Plug>(iced_eval_at_mark)
    autocmd FileType clojure nmap sem <Plug>(iced_eval_at_mark)
    " Code Analyse: - "sa"
    autocmd FileType clojure nmap sar :IcedBrowseReferences<CR>
    autocmd FileType clojure nmap sad :IcedBrowseDependencies<CR>
    autocmd FileType clojure nmap sau :IcedUseCaseOpen<CR>:echom "list use case: gF to open file"<CR>
    autocmd FileType clojure nmap sa/ <Plug>(iced_grep)
    autocmd FileType clojure nmap sam <Plug>(iced_macroexpand_1_outer_list)
    autocmd FileType clojure nmap saM <Plug>(iced_macroexpand_outer_list)
    autocmd FileType clojure nmap K <Plug>(iced_document_popup_open)
    autocmd FileType clojure nmap sak <Plug>(iced_document_open)

    " autocmd FileType clojure nmap sal :make<CR>:copen<CR>
    autocmd FileType clojure nmap sal :Dispatch<CR>
    autocmd FileType clojure setlocal makeprg=clj-kondo\ --lint\ %
    autocmd FileType clojure setlocal errorformat=%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m

    autocmd FileType clojure nmap sns :IcedAddNs<CR>

    autocmd FileType clojure nmap <silent> <Tab><Tab>r <Plug>(coc-references)

    autocmd FileType clojure nmap <Tab>s <Plug>(iced_source_popup_show)
    autocmd FileType clojure nmap <Tab>c <Plug>(iced_command_palette)
    " :IcedClojureDocsOpen
    autocmd FileType clojure nmap <Tab>d <Plug>(iced_clojuredocs_open)
    autocmd FileType clojure nmap == <Plug>(iced_format)
    autocmd FileType clojure nmap <Tab>== <Plug>(iced_format_all)
    autocmd FileType clojure nmap <Tab>t <Plug>(iced_cycle_src_and_test)
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


