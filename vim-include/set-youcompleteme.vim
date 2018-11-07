if !exists('g:include_set_youcompleteme_loaded')
    let g:include_set_youcompleteme_loaded = 1

    let g:ycm_key_list_select_completion = ['<C-n>']    " 본래 <Tab> 이지만 ultisnip 과 충돌을 막기 위해 변경
    let g:ycm_key_list_previous_completion=['<C-p>']
    let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
    let g:ycm_complete_in_comments = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_min_num_of_chars_for_completion = 1
    " let g:ycm_add_preview_to_completeopt = 1
    " let g:ycm_autoclose_preview_window_after_insertion = 1
    " let g:ycm_autoclose_preview_window_after_completion = 1
    " let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_filetype_blacklist = {}
endif
