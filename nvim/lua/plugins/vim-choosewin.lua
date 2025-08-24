return {
  't9md/vim-choosewin',
  config = function()
    -- vim-choosewin 설정
    vim.keymap.set('n', '<C-s><Space>', '<Plug>(choosewin)', { noremap = true })
    vim.g.choosewin_overlay_enable = 1
    vim.g.choosewin_label = 'JKLIOPM'
  end,
}