"** notify 설정

lua vim.notify = require("notify")
lua function _G.noti_custom_text(text)
            \ vim.notify(text, vim.log.levels.INFO, {
            \ stages = 'slide',
            \ render = 'minimal',
            \ })
            \ end

function! Noti_pipe(param, text)
    call v:lua.noti_custom_text(a:text)
    return a:param
endfunction
