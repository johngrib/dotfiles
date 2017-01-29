local obj = {}

function obj:init(key)

    local app_mode = hs.hotkey.modal.new()

    app_mode:bind({}, 'tab', function () focusScreen(hs.window.focusedWindow():screen():previous()) end)
    app_mode:bind({'shift'}, 'tab', function () focusScreen(hs.window.focusedWindow():screen():next()) end)

    -- app_mode:bind({}, 'h', function() hs.window.focusedWindow():focusWindowWest() end)
    -- app_mode:bind({}, 'j', function() hs.window.focusedWindow():focusWindowSouth() end)
    -- app_mode:bind({}, 'k', function() hs.window.focusedWindow():focusWindowNorth() end)
    -- app_mode:bind({}, 'l', function() hs.window.focusedWindow():focusWindowEast() end)

    app_mode:bind({}, 'c', function() hs.application.launchOrFocus('Google Chrome') end)
    app_mode:bind({}, 'i', function() hs.application.launchOrFocus('IntelliJ IDEA') end)
    app_mode:bind({}, 's', function() hs.application.launchOrFocus('Slack') end)
    app_mode:bind({}, 'l', function() hs.application.launchOrFocus('Line') end)
    app_mode:bind({}, 'q', function() hs.application.launchOrFocus('Sequel Pro') end)

    local move_win = function(xx, yy, ww, hh)
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local max = win:screen():frame()
        f.x = max.x + (max.w/2) * xx
        f.y = max.y + (max.h/2) * yy
        f.w = max.w / ww
        f.h = max.h / hh
        win:setFrame(f)
    end

    app_mode:bind({}, '1', function() move_win(0, 1, 2, 2) end)
    app_mode:bind({}, '2', function() move_win(0, 1, 1, 2) end)
    app_mode:bind({}, '3', function() move_win(1, 1, 2, 2) end)
    app_mode:bind({}, '4', function() move_win(0, 0, 2, 1) end)
    app_mode:bind({}, '5', function() move_win(0, 0, 1, 1) end)
    app_mode:bind({}, '6', function() move_win(1, 0, 2, 1) end)
    app_mode:bind({}, '7', function() move_win(0, 0, 2, 2) end)
    app_mode:bind({}, '8', function() move_win(0, 0, 1, 2) end)
    app_mode:bind({}, '9', function() move_win(1, 0, 2, 2) end)

    function send_window_prev_monitor()
        local win = hs.window.focusedWindow()
        local nextScreen = win:screen():previous()
        win:moveToScreen(nextScreen)
    end

    function send_window_next_monitor()
        local win = hs.window.focusedWindow()
        local nextScreen = win:screen():next()
        win:moveToScreen(nextScreen)
    end

    app_mode:bind({}, 'b', send_window_prev_monitor)
    app_mode:bind({}, 'n', send_window_next_monitor)

    local on_app_mode = function() app_mode:enter() end
    local off_app_mode = function() app_mode:exit() end

    hs.hotkey.bind({}, key, on_app_mode, off_app_mode)
end

function focusScreen(screen)
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()

  -- Move mouse to center of screen
  local pt = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.setAbsolutePosition(pt)
end

return obj
