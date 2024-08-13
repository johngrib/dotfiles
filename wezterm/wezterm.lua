local wezterm = require 'wezterm'


-- https://wezfurlong.org/wezterm/config/files.html
local config = {
    -- font = wezterm.font 'JetBrains Mono',
    font = wezterm.font 'MesloLGMDZ Nerd Font Mono',
    font_size = 18,
    visual_bell = {
        fade_in_function = 'EaseIn',
        fade_in_duration_ms = 100,
        fade_out_function = 'EaseOut',
        fade_out_duration_ms = 100,
    },
    colors = {
        visual_bell = '#202020',
        foreground = '#f4f2fa',
        background = '#13122a',
        cursor_bg = '#cc5151',
        cursor_fg = '#ffffff',
        cursor_border = '#52ad70',
        selection_fg = '#4d50ec',
        selection_bg = '#c8d3e0',
        scrollbar_thumb = '#222222',
        -- The color of the split lines between panes
        split = '#444444',
        ansi = {
            '#000000', -- black
            '#ec4434', -- red
            '#67c837', -- green
            '#df5f19', -- yellow
            '#5670f5', -- blue
            '#8375b0', -- magenta
            '#609686', -- cyan
            '#f3d6b0', -- white
        },
        brights = {
            '#080808', -- bright black
            '#f97a70', -- bright red
            '#8fff5b', -- bright green
            '#fcce2e', -- bright yellow
            '#48b3e5', -- bright blue
            '#c07c74', -- bright magenta
            '#bdfaf0', -- bright cyan
            '#f4f2fa', -- bright white
        },
        tab_bar = {
            active_tab = {
                fg_color = '#ffd700',  -- gold color
                bg_color = '#000000',
            },
        },
    },
    audible_bell = "Disabled",
    window_frame = {
        -- The font used in the tab bar.
        -- Roboto Bold is the default; this font is bundled
        -- with wezterm.
        -- Whatever font is selected here, it will have the
        -- main font setting appended to it to pick up any
        -- fallback fonts you may have used there.
        font = wezterm.font { family = 'MesloLGSDZ Nerd Font Mono', weight = 'Bold' },

        -- The size of the font in the tab bar.
        -- Default to 10. on Windows but 12.0 on other systems
        font_size = 13.0,

        -- The overall background color of the tab bar when
        -- the window is focused
        active_titlebar_bg = '#13122a',

        -- The overall background color of the tab bar when
        -- the window is not focused
        -- inactive_titlebar_bg = '#333333',
    },
    send_composed_key_when_left_alt_is_pressed = false,
    use_dead_keys = false,
    use_ime = true,
    enable_scroll_bar = true,
}

config.keys = {
    -- command + m 을 끈다.
    { key = 'm', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment, },
}

-- https://wezfurlong.org/wezterm/config/lua/config/window_padding.html
config.window_padding = {
    left = '3px',
    right = '3px',
    top = '0px',
    bottom = '5px',
}

config.use_fancy_tab_bar = false

return config
