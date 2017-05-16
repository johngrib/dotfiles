local obj = {}

function obj:init(key)

    local app_mode = hs.hotkey.modal.new()

    app_mode:bind({}, 'tab', function () focusScreen(hs.window.focusedWindow():screen():previous()) end)
    app_mode:bind({'shift'}, 'tab', function () focusScreen(hs.window.focusedWindow():screen():next()) end)

    app_mode:bind({}, ';', function() hs.window.focusedWindow():focusWindowWest() end)
    app_mode:bind({}, '/', function() hs.window.focusedWindow():focusWindowSouth() end)
    app_mode:bind({}, '[', function() hs.window.focusedWindow():focusWindowNorth() end)
    app_mode:bind({}, '\'', function() hs.window.focusedWindow():focusWindowEast() end)

    function app_focus(name)
        return function()
            hs.application.launchOrFocus(name)
            local screen = hs.window.focusedWindow():frame()
            local pt = hs.geometry.rectMidPoint(screen)
            hs.mouse.setAbsolutePosition(pt)
            app_mode.triggered = true
        end
    end

    app_mode:bind({}, 'c', app_focus('Google Chrome'))
    app_mode:bind({}, 'f', app_focus('Safari'))
    app_mode:bind({}, 'i', app_focus('IntelliJ IDEA'))
    app_mode:bind({}, 'l', app_focus('Line'))
    app_mode:bind({}, 'q', app_focus('Sequel Pro'))
    app_mode:bind({}, 'v', app_focus('MacVim'))
    app_mode:bind({}, 'm', app_focus('Notes'))
    app_mode:bind({}, 'r', app_focus('Reminders'))
    app_mode:bind({}, 'e', app_focus('Emacs'))
    app_mode:bind({'shift'}, 's', app_focus('Slack'))
    app_mode:bind({}, 's', function()
        app_focus('Slack')()
        hs.timer.usleep(100)
        hs.eventtap.keyStroke({'cmd'}, 'k')
        app_mode.triggered = true
    end)

    local move_win = function(xx, yy, ww, hh)
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

    app_mode:bind({}, 'n', send_window_prev_monitor)
    app_mode:bind({}, 'b', send_window_next_monitor)

    local on_app_mode = function() app_mode:enter() end
    local on_app_mode = function()
        app_mode.triggered = false
        app_mode:enter()
    end

    local off_app_mode = function()
        app_mode:exit()
        if not app_mode.triggered then
            hs.eventtap.keyStroke({'shift'}, 'F14')
        end
    end

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
