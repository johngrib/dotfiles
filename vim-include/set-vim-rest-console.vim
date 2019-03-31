if !exists('g:include_set_vim_rest_console_loaded')
    let g:include_set_vim_rest_console_loaded = 1

    let s:vrc_auto_format_response_patterns = {
                \   'json': 'jq',
                \}

    let g:vrc_response_default_content_type = 'application/json'
    let g:vrc_show_command = 1

    let g:vrc_debug = 0
    let g:vrc_curl_opts = {
                \ '-s': '',
                \}
endif
