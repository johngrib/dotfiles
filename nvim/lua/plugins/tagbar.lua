return {
  'majutsushi/tagbar',
  config = function()
    -- Load the existing vimscript configuration for Tagbar.
    -- This is a safe way to migrate complex configurations without rewriting everything at once.
    local config_root = vim.fn.stdpath('config')
    local tagbar_config_path = config_root .. '/config/set-tagbar.vim'
    vim.cmd('source ' .. tagbar_config_path)
  end,
}
