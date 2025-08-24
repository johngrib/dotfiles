return {
  'SirVer/ultisnips',
  config = function()
    vim.g.UltiSnipsExpandTrigger = '<C-k>'
    vim.g.UltiSnipsJumpForwardTrigger = '<Right>'
    vim.g.UltiSnipsJumpBackwardTrigger = '<Left>'
    vim.g.UltiSnipsEditSplit = 'vertical'
    vim.g.UltiSnipsSnippetDirectories = {'~/dotfiles/UltiSnips'}
  end,
}
