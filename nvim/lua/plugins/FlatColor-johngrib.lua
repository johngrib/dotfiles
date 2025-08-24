return {
  'johngrib/FlatColor-johngrib',
  config = function()
    vim.cmd('colorscheme flatcolor-johngrib')

    -- 선택 메뉴 색깔
    -- vim.api.nvim_set_hl(0, 'Pmenu', { ctermfg = 254, ctermbg = 237, cterm = 'NONE' })
    -- vim.api.nvim_set_hl(0, 'PmenuSel', { ctermfg = 10, ctermbg = 239, cterm = 'NONE' })
    vim.api.nvim_set_hl(0, 'Pmenu', { ctermfg = 254, ctermbg = 237 })
    vim.api.nvim_set_hl(0, 'PmenuSel', { ctermfg = 10, ctermbg = 239 })

    -- For Neovim 0.1.3 and 0.1.4 (Environment variable)
    vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

    -- termguicolors 설정
    if vim.fn.has('termguicolors') == 1 and vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
      vim.opt.termguicolors = true
    end

    -- MacVim 특정 설정
    if vim.fn.has('gui_macvim') == 1 then
      vim.opt.macmeta = true
      vim.opt.guifont = 'Meslo LG S DZ Regular Nerd Font Complete:h14'
      vim.opt.noimd = true -- macVim 에서 esc 로 영문변환, imi 는 1 또는 2 로 설정해준다
      vim.opt.imi = 1
    else
      -- tmux에서 배경색이 이상하게 나오는 문제를 해결한다.
      -- link : http://stackoverflow.com/a/15095377
      -- vim.opt.t_ut = ''
    end
  end,
}
