"* vimscript 설정

augroup vimscript_syntax_color_jg
    " autocmd FileType vim exe 'syntax match VimScriptCustomTitleText /"\* (.*)$/'
    autocmd FileType vim syntax match VimScriptCustomTitleText /\v^ *"\*+ .*$/
    autocmd FileType vim highlight VimScriptCustomTitleText ctermfg=Green guifg=#e0c9b7 gui=bold
augroup END

let g:tagbar_type_vim = {
    \ 'ctagstype' : 'vim',
    \ 'sort': 0,
    \ 'kinds' : [
        \ 'v:variables:1:0',
        \ 'f:functions:1:0',
        \ 'a:autocommand groups:1:0',
        \ 'c:commands:1:0',
        \ 't:titles',
        \ ],
    \}
        " \ 'm:maps:1:0',
