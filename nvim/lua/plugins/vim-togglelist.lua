return {
  'milkypostman/vim-togglelist',
  config = function()
    -- Load the existing vimscript configuration for quickfix management.
    -- This is a safe way to migrate complex configurations without rewriting everything at once.
    local config_root = vim.fn.stdpath('config')
    local quickfix_config_path = config_root .. '/config/set-quickfix.vim'
    vim.cmd('source ' .. quickfix_config_path)
  end,
}
