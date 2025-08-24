return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
  config = function()
    vim.telescope = require('telescope.builtin')
  end,
}
