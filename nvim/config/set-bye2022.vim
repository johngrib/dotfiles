"** bye2022

" 참고: https://github.com/nvim-lua/popup.nvim/blob/master/lua/tests/basic_popup_spec.lua
function! Bye2022()
    Startify
    let l:msg = [
                \ "            Bye2022",
                \ "             🌟" ,
                \ "             ***",
                \ "            *****",
                \ "           *******",
                \ "          *********",
                \ "         ***********",
                \ "        *************",
                \ "       ***************",
                \ "      *****************",
                \ "     *******************",
                \ "    *********************",
                \ "   ***********************",
                \ "            NeoVim         ",
                \ "             Lua            ",
                \ "             Vim             "
                \ ]
    lua require('plenary.reload').reload_module('popup')
    lua vim.popup = require('popup')

    lua function _G.popup_2022(text)
                \ vim.popup.create(text, {
                \     line = 3,
                \     col = 30,
                \     minwidth = 20,
                \     highlight = 'PopupColor1',
                \     border = {},
                \     time = 2500,
                \ })
                \ end
    call v:lua.popup_2022(l:msg)
endfunction

