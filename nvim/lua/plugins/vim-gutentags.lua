return {
  'ludovicchabant/vim-gutentags',
  config = function()
    vim.g.gutentags_ctags_exclude = {
      '.clj-kondo',
      '.lsp',
      'karabiner/automatic_backups/*.json',
      'karabiner/assets/complex_modifications/*.json',
      '*.iterm2.plist',
    }
    vim.g.gutentags_resolve_symlinks = 1
    vim.g.gutentags_project_root = {'.git', 'deps.edn'}
  end,
}
