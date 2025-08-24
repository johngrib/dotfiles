return {
  'vim-airline/vim-airline',
  init = function()
    vim.g['airline#extensions#tabline#enabled'] = 1
    vim.g['airline#extensions#tabline#fnamemod'] = ':t'
    vim.g['airline#extensions#tabline#buffer_nr_show'] = 1
    vim.g['airline#extensions#tabline#buffer_nr_format'] = '%s:'
    vim.g.airline_powerline_fonts = 1
  end,
}
