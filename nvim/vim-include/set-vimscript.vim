"* vimscript 설정

augroup vimscript_syntax_color_jg
    " autocmd FileType vim exe 'syntax match VimScriptCustomTitleText /"\* (.*)$/'
    autocmd FileType vim syntax match VimScriptCustomTitleText /\v^ *"\*+ .*$/
    autocmd FileType vim highlight VimScriptCustomTitleText ctermfg=Green guifg=#e0c9b7 gui=bold
augroup END

