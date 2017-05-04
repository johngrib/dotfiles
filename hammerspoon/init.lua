-- hammerspoon config

require('modules.caffein')
require('modules.mouse')
local caffein = require('modules.caffein'):init({'shift'}, 'f15')
local vim_mode = require('modules.vim'):init('f16', nil)
local app_manager = require('modules.appman'):init('f18')
local mouse = require('modules.mouse'):init('f17')

hs.alert.show('loaded')
hs.hotkey.bind({'cmd'}, 'F17', hs.hints.windowHints)
hs.hints.hintChars = {'F', 'U', 'I', 'O', 'P', 'H', 'J', 'K', 'L', 'B', 'N', 'M', 'Q', 'W', 'E', 'R', 'Z', 'X', 'C', 'V' }

