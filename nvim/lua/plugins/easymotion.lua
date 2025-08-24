return {
  'easymotion/vim-easymotion',
  config = function()
    -- Global variables
    vim.g.EasyMotion_do_mapping = 0
    vim.g.EasyMotion_startofline = 0
    vim.g.EasyMotion_smartcase = 1
    vim.g.EasyMotion_keys = ' ASDFQWERZXCV1234GHNTU[]567890-=,/.;IOPMLJK'
    vim.g.EasyMotion_use_upper = 1
    vim.g.EasyMotion_use_smartsign_us = 1

    -- Keymaps
    local map = vim.keymap.set

    -- Specific EasyMotion mappings
    map('n', '<c-s><c-s>', '<Plug>(easymotion-overwin-line)', { noremap = false })
    map('i', '<c-s>', '<c-o><Plug>(easymotion-lineanywhere)', { noremap = false })

    map('n', '<c-s>2', '<Plug>(easymotion-overwin-f2)', { noremap = false })

    -- easymotion + hjkl
    map('n', '<c-s>l', '<Plug>(easymotion-lineforward)', { noremap = false })
    map('v', '<c-s>l', '<Plug>(easymotion-lineforward)', { noremap = false })
    map('n', '<c-s>j', '<Plug>(easymotion-j)', { noremap = false })
    map('v', '<c-s>j', '<Plug>(easymotion-j)', { noremap = false })
    map('n', '<c-s>k', '<Plug>(easymotion-k)', { noremap = false })
    map('v', '<c-s>k', '<Plug>(easymotion-k)', { noremap = false })
    map('n', '<c-s>h', '<Plug>(easymotion-linebackward)', { noremap = false })
    map('v', '<c-s>h', '<Plug>(easymotion-linebackward)', { noremap = false })

    map('n', '<c-s>a', '<Plug>(easymotion-jumptoanywhere)', { noremap = false })
    map('v', '<c-s>a', '<Plug>(easymotion-jumptoanywhere)', { noremap = false })
    map('n', '<c-s>w', '<Plug>(easymotion-overwin-w)', { noremap = false })
    map('n', '<c-s>f', '<Plug>(easymotion-overwin-f)', { noremap = false })
    map('n', '<c-s>/', '<Plug>(easymotion-sn)', { noremap = false })

    -- Note: vim-choosewin settings were already migrated to lua/plugins/vim-choosewin.lua
  end,
}
