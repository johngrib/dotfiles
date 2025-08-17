return {
  'johngrib/vimwiki',
  branch = 'johngrib',
  config = function()
    -- Load the existing vimscript configuration for vimwiki.
    -- This is a safe way to migrate complex configurations without rewriting everything at once.
    -- We dynamically find the config path to support symlinked configurations.
    local config_root = vim.fn.stdpath('config')
    local vimwiki_config_path = config_root .. '/config/set-vimwiki.vim'
    vim.cmd('source ' .. vimwiki_config_path)
  end,
}
