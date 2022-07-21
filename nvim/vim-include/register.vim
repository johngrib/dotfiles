
function! _numbered_register_shift_comment()
    / 복사할 때:
    /   "" 과 "0 레지스터가 갱신된다.
    /   그리고 1 ~ 9 숫자 레지스터는 변경되지 않는다.

    / 삭제할 때:
    /   "" 과 "1 레지스터가 갱신된다. 그리고 2 ~ 9 레지스터가 하나씩 밀려난다.
    /   그러나 "0 레지스터는 변경되지 않는다.

    / 따라서 다음 방법으로 복사를 했는지 삭제를 했는지 판별할 수 있다.

    /   Vim을 초기화 할 때 "0 을 cache_0 에 저장하고, "1 을 cache_1 에 저장한다.
    /   TextYankPost 이벤트가 발생하면
    /       cache_0 과 "0 을 비교한다. 둘이 다르다면 복사를 한 것이다.
    /           2 ~ 8 레지스터를 하나씩 쉬프트하고, 1 레지스터에 cache_0 을 저장한다.
    /           cache_0 에 "0 을 저장하고, cache_1 에 "1 을 저장한다.

    /       cache_1 과 "1 을 비교한다. 둘이 다르다면 삭제를 한 것이다.
    /           삭제를 했다면 숫자 레지스터가 알아서 쉬프트되므로 신경쓰지 않아도 된다.
    /           cache_0 에 "0 을 저장하고, cache_1 에 "1 을 저장한다.

endfunction

augroup numbered_resister_shift_autocmd
    let g:global_yank_cache_0 = @0
    let g:global_yank_cache_1 = @1

    " abcdefghijklmnopqrstuvwyz

    autocmd TextYankPost * :call s:numbered_register_shift()

    function! s:save_cache()
        let g:global_yank_cache_0 = @0
        let g:global_yank_cache_1 = @1
    endfunction

    function! s:numbered_register_shift()
        if @- ==# @"
            " inline 삭제 이벤트가 발생하면 @- 를 @1 넣고 돌려준다
            let @9 = @8
            let @8 = @7
            let @7 = @6
            let @6 = @5
            let @5 = @4
            let @4 = @3
            let @3 = @2
            let @2 = @1
            let @1 = @-
            call s:save_cache()
            return
        endif

        if g:global_yank_cache_1 !=# @1
            " line 단위 삭제 이벤트가 발생하면 cache 를 갱신한다
            call s:save_cache()
            return
        endif

        if g:global_yank_cache_0 !=# @0
            " 복사 이벤트가 발생하면 @1 에 cache_0 을 넣고 돌려준다.
            let @9 = @8
            let @8 = @7
            let @7 = @6
            let @6 = @5
            let @5 = @4
            let @4 = @3
            let @3 = @2
            let @2 = @1
            let @1 = g:global_yank_cache_0

            call s:save_cache()
            return
        endif
    endfunction
augroup END

