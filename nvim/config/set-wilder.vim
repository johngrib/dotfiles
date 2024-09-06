" https://github.com/gelguy/wilder.nvim

" Key bindings can be changed, see below
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<c-n>',
      \ 'previous_key': '<c-p>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ })))
