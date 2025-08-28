-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'MesloLGMDZ Nerd Font Mono'

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 23

-- SECTION: COLOR
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

-- SECTION: KEYS
local act = wezterm.action
config.keys = {
    { key = 'm', mods = 'CMD', action = wezterm.action.ShowTabNavigator },
    { key = 'h', mods = 'CMD', action = act.ActivateCommandPalette, },
    { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'w', mods = 'CMD', action = act.CloseCurrentPane { confirm = true } },
    { key = 'e', mods = 'CMD', action = act.ScrollByLine(-1) },
    { key = 'y', mods = 'CMD', action = act.ScrollByLine(1) },
}

-- SECTION: HYPERLINK
-- config.hyperlink_rules = {
--     { regex = "JIRA-(\\d+)", format = "https://jira.example.com/browse/JIRA-$1" },
--     { regex = "ISSUE-(\\d+)", format = "https://github.com/yourorg/yourrepo/issues/$1" },
-- }

-- SECTION: TAB BAR
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.window_frame = {
    -- tab bar 폰트
    font_size = 20.0,
    font = wezterm.font { family = 'MelsoLGSDZ Nerd Font Mono', weight = 'Bold' },
}

-- Link: https://github.com/sapegin/dotfiles/blob/359cd798a0a30a2cdb1aabfff8ae9b265001e164/tilde/.wezterm.lua#L215
local function get_current_working_dir(tab)
    local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = '' }
    local HOME_DIR = string.format('file://%s', os.getenv('HOME'))

    return current_dir == HOME_DIR and '.'
    or string.gsub(current_dir.file_path, '(.*[/\\])(.*)', '%2')
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local index = tonumber(tab.tab_index) + 1
    local title = get_current_working_dir(tab)
    return string.format('%s:%s', index, title)
end)

config.window_padding = { left = 2, right = 2, top = 0, bottom = 0 }

-- SECTION: MOUSE
config.mouse_bindings = {
    -- 마우스 드래그로 선택하면 클립보드로 복사
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'NONE',
        action = wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'),
    },
    -- command + click 으로 link 열기
    {
        event = { Up = { streak = 1, button = 'Left' } },
        mods = 'CMD',
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
}

-- Command Palette
-- config.command_palette_rows = 40
config.command_palette_font_size = 15
config.command_palette_bg_color = "#44382D"
config.command_palette_fg_color = "#c4a389"

return config
