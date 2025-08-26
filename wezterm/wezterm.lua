-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}

config.font = wezterm.font 'MesloLGMDZ Nerd Font Mono'
config.tab_bar_at_bottom = true

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 23

-- color: https://wezterm.org/config/appearance.html
config.colors = {
    foreground = 'f3f2f9',
    background = '1b1a39',
    ansi = {
        '#000000',  -- normal black
        '#d9513f',  -- normal red
        '#7fc54f',  -- normal green
        '#cf6630',  -- normal yellow
        '#5b6fec',  -- normal blue
        '#8075ab',  -- normal magenta
        '#6c9486',  -- normal cyan
        '#eed7b4',  -- normal white
    },
    brights = {
        '#080808',  -- bright black
        '#e88174',  -- bright red
        '#aafc73',  -- bright green
        '#f4cf52',  -- bright yellow
        '#66b0e0',  -- bright blue
        '#b67f76',  -- bright magenta
        '#c9f8ef',  -- bright cyan
        '#f3f2f9',  -- bright white
    },
}

local act = wezterm.action
config.keys = {
    { key = 'm', mods = 'CMD', action = act.ActivateCommandPalette, },
    { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'w', mods = 'CMD', action = act.CloseCurrentPane { confirm = true } },
    { key = 'e', mods = 'CMD', action = act.ScrollByLine(-1) },
    { key = 'y', mods = 'CMD', action = act.ScrollByLine(1) },
}

return config
