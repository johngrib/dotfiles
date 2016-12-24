-- hammerspoon config

require('modules.caffein')
require('modules.mouse')
local vim_mode = require('modules.vim'):init('f15', 'f18')
local app_manager = require('modules.appman'):init('f19')

hs.alert.show('loaded')
-- hs.hotkey.bind({'shift'}, 'F3', hs.grid.show)
