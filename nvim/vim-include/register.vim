
" https://johngrib.github.io/wiki/vim/numbered-register-shift/
augroup numbered_resister_shift_autocmd

    autocmd TextYankPost * :call s:numbered_register_shift()
    nnoremap <F9><F9> :registers<CR>
    nnoremap <F9>t :call <SID>toggle()<CR>

    function! s:toggle()
        let g:numbered_register_shift_enable = ! g:numbered_register_shift_enable
        echom "숫자 레지스터 쉬프트 활성화 상태: " . g:numbered_register_shift_enable
    endfunction

    " 초기화
    let s:global_yank_cache_0 = @0
    let s:global_yank_cache_1 = @1
    let g:numbered_register_shift_enable = 1

    function! s:save_cache()
        let s:global_yank_cache_0 = @0
        let s:global_yank_cache_1 = @1
    endfunction

    function! s:enqueue()
        let @9 = @8
        let @8 = @7
        let @7 = @6
        let @6 = @5
        let @5 = @4
        let @4 = @3
        let @3 = @2
        let @2 = @1
    endfunction

    function! s:numbered_register_shift()
        if ! v:true == g:numbered_register_shift_enable
            return
        endif

        if @- ==# @" && len(@-) > 1
            " inline 삭제 이벤트가 발생하면
            call s:enqueue()
            let @1 = @-
            call s:save_cache()
            return
        endif

        if s:global_yank_cache_1 !=# @1
            " line 단위 삭제 이벤트가 발생하면 cache 를 갱신한다
            call s:save_cache()
            return
        endif

        if s:global_yank_cache_0 !=# @0
            " 복사 이벤트가 발생하면 @1 에 cache_0 을 넣고 돌려준다.
            call s:enqueue()
            let @1 = s:global_yank_cache_0
            call s:save_cache()
            return
        endif
    endfunction
augroup END

