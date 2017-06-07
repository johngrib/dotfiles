local obj = {}
local app_mode = hs.hotkey.modal.new()

local function app_focus(name)
    return function()
        hs.application.launchOrFocus(name)
        local screen = hs.window.focusedWindow():frame()
        local pt = hs.geometry.rectMidPoint(screen)
        hs.mouse.setAbsolutePosition(pt)
        app_mode.triggered = true
    end
end

local function move_win(xx, yy, ww, hh)
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()
    f.x = max.x + (max.w/2) * xx
    f.y = max.y + (max.h/2) * yy
    f.w = max.w / ww
    f.h = max.h / hh
    win:setFrame(f)
    app_mode.triggered = true
end

local function send_window_prev_monitor()
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():previous()
    win:moveToScreen(nextScreen)
end

local function send_window_next_monitor()
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():next()
    win:moveToScreen(nextScreen)
end

local function on_app_mode()
    app_mode:enter()
end

local function on_app_mode()
    app_mode.triggered = false
    app_mode:enter()
end

local function off_app_mode()
    app_mode:exit()
end

local function focusScreen(screen)
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()

  -- Move mouse to center of screen
  local pt = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.setAbsolutePosition(pt)
end

function obj:init(key)

    app_mode:bind({}, 'tab', function () focusScreen(hs.window.focusedWindow():screen():previous()) end)
    app_mode:bind({'shift'}, 'tab', function () focusScreen(hs.window.focusedWindow():screen():next()) end)

    app_mode:bind({}, ';', function() hs.window.focusedWindow():focusWindowWest() end)
    app_mode:bind({}, '/', function() hs.window.focusedWindow():focusWindowSouth() end)
    app_mode:bind({}, '[', function() hs.window.focusedWindow():focusWindowNorth() end)
    app_mode:bind({}, '\'', function() hs.window.focusedWindow():focusWindowEast() end)

    app_mode:bind({}, '1', function() move_win(0, 1, 2, 2) end)
    app_mode:bind({}, '2', function() move_win(0, 1, 1, 2) end)
    app_mode:bind({}, '3', function() move_win(1, 1, 2, 2) end)
    app_mode:bind({}, '4', function() move_win(0, 0, 2, 1) end)
    app_mode:bind({}, '5', function() move_win(0, 0, 1, 1) end)
    app_mode:bind({}, '6', function() move_win(1, 0, 2, 1) end)
    app_mode:bind({}, '7', function() move_win(0, 0, 2, 2) end)
    app_mode:bind({}, '8', function() move_win(0, 0, 1, 2) end)
    app_mode:bind({}, '9', function() move_win(1, 0, 2, 2) end)

    hs.hotkey.bind({}, key, on_app_mode, off_app_mode)

    return self
end

function obj:addFocus(v)
    app_mode:bind(v.mod, v.key, app_focus(v.appName))
end

function obj:setSendNext(v)
    app_mode:bind(v.mod, v.key, send_window_next_monitor);
end

function obj:setSendPrev(v)
    app_mode:bind(v.mod, v.key, send_window_prev_monitor);
end

return obj
