if exists("g:loaded_vim_gx_on_regex") || &cp
    finish
endif
let g:loaded_vim_gx_on_regex = 1

function! MatchedString(regex_string) abort
    let l:cursor_x = col('.') - 1
    let l:current_line = getline('.')
    let l:target_index = -1

    let l:matched_head = match(l:current_line, a:regex_string, 0)

    if l:matched_head < 0
        return v:null
    endif

    while l:matched_head <= l:cursor_x
        if l:matched_head < 0
            return v:null
        endif

        let l:matched_tail = matchend(l:current_line, a:regex_string, l:matched_head)

        if (l:cursor_x < l:matched_head) || (l:matched_tail <= l:cursor_x)
            " 커서가 찾아낸 문자열의 범위 밖에 있으면, matched_tail 이후부터 다시 찾는다
            let l:matched_head = match(l:current_line, a:regex_string, l:matched_tail)
            continue
        endif

        " 커서가 찾아낸 문자열의 범위 안에 있으면
        let l:target_index = match(l:current_line, a:regex_string, l:matched_head)
        let l:size = l:matched_tail - l:target_index

        if l:target_index >= 0
            return strpart(l:current_line, l:target_index, l:size)
        endif

        return v:null
    endwhile

    return v:null
endfunction

function! s:plug_simple_match(text)
    let l:address = 'https://github.com/' . substitute(a:text, "\\v^Plug +'([^ ']+)'$", '\1', '')
    call system('open ' .l:address)
endfunction

function! s:plug_file_match(text)
    let l:address = g:config_dir . substitute(a:text, "\\v^PlugFile +'([^ ']+)'$", '\1', '')
    execute 'edit ' . l:address
endfunction

let s:match_config = []
call add(s:match_config, {'regex': "\\vPlugFile +'([^ ]+)'", 'exec': {p -> s:plug_file_match(p)} })
call add(s:match_config, {'regex': "\\vPlug +'([^ /]+/[^ /]+)'", 'exec': {p -> s:plug_simple_match(p)} })

function! s:openWhatever()
    " s:match_config 를 순회하면서 regex_string 에 매칭되는 문자열을 찾는다
    for l:config in s:match_config
        let l:matched_string = MatchedString(l:config.regex)

        if l:matched_string == v:null
            continue
        endif

        " 매칭되는 문자열이 있으면, 해당 문자열을 command 에 넣어서 실행한다
        try
            call l:config.exec(l:matched_string)
            return
        catch
            echom 'error'
        endtry
    endfor
    echom "netrw"
    " 참고: https://github.com/neovim/neovim/blob/1a9d2a4040f3ba3fe272488a7e85db6cdb453d39/runtime/plugin/netrwPlugin.vim#L84
    call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
endfunction

let g:netrw_nogx = v:true
nnoremap gx <cmd>call <SID>openWhatever()<CR>
