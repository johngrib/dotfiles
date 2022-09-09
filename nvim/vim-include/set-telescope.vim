
nmap <F1> [telescope-p]

" nnoremap <nowait> [telescope-p]<F1> <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <nowait> [telescope-p]<F2> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <nowait> [telescope-p]<F3> <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <nowait> [telescope-p]`    <cmd>lua require('telescope.builtin').marks()<cr>

nnoremap <nowait> [telescope-p]<F6> <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <nowait> [telescope-p]q    <cmd>lua require('telescope.builtin').quickfix()<cr>

nnoremap <nowait> [telescope-p]/ <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <nowait> [telescope-p]c <cmd>lua require('telescope.builtin').pickers()<cr>

nnoremap <nowait> [telescope-p]: <cmd>lua require('telescope.builtin').command_history()<cr>
nnoremap <nowait> [telescope-p]j <cmd>lua require('telescope.builtin').jumplist()<cr>

" register
nnoremap <nowait> <F9> <cmd>lua require('telescope.builtin').registers()<cr>
inoremap <nowait> <F9> <cmd>lua require('telescope.builtin').registers()<cr>

