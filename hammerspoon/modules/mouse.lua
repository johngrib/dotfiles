-- mouse mode

local obj = {}

function obj:init(key)

    local mouse_mode = hs.hotkey.modal.new()

    local mm = function(func)
        return function()
            func()
            mouse_mode.triggered = true
        end
    end

    local mouse_move = function(dir, dist)
        return function()
            point = hs.mouse.getRelativePosition()
            point[dir] = point[dir] + dist
            hs.mouse.setRelativePosition(point)
        end
    end

    local mouse_w = mm(mouse_move('y', -10))
    local mouse_a = mm(mouse_move('x', -10))
    local mouse_s = mm(mouse_move('y', 10))
    local mouse_d = mm(mouse_move('x', 10))

    mouse_mode:bind({}, 'W', mouse_w, nil, mouse_w)
    mouse_mode:bind({}, 'A', mouse_a, nil, mouse_a)
    mouse_mode:bind({}, 'S', mouse_s, nil, mouse_s)
    mouse_mode:bind({}, 'D', mouse_d, nil, mouse_d)

    local mouse_cmd_w = mm(mouse_move('y', -90))
    local mouse_cmd_a = mm(mouse_move('x', -90))
    local mouse_cmd_s = mm(mouse_move('y', 90))
    local mouse_cmd_d = mm(mouse_move('x', 90))

    mouse_mode:bind({'cmd'}, 'W', mouse_cmd_w, nil, mouse_cmd_w)
    mouse_mode:bind({'cmd'}, 'A', mouse_cmd_a, nil, mouse_cmd_a)
    mouse_mode:bind({'cmd'}, 'S', mouse_cmd_s, nil, mouse_cmd_s)
    mouse_mode:bind({'cmd'}, 'D', mouse_cmd_d, nil, mouse_cmd_d)

    local mouse_q = mm(function() hs.eventtap.leftClick(hs.mouse.getAbsolutePosition()) end)
    local mouse_e = mm(function() hs.eventtap.rightClick(hs.mouse.getAbsolutePosition()) end)
    local mouse_r = mm(function() hs.eventtap.scrollWheel({0,1}, {}, 'line') end)
    local mouse_f = mm(function() hs.eventtap.scrollWheel({0,-1}, {}, 'line') end)

    local mouse_s_r = mm(function() hs.eventtap.scrollWheel({0,1}, {}, 'pixel') end)
    local mouse_s_f = mm(function() hs.eventtap.scrollWheel({0,-1}, {}, 'pixel') end)

    local mouse_z = mm(function()
        local screen = hs.window.focusedWindow():frame()
        local pt = hs.geometry.rectMidPoint(screen)
        hs.mouse.setAbsolutePosition(pt)
    end)

    local mouse_s_z = mm(function()
        local screen = hs.window.focusedWindow():screen()
        local pt = hs.geometry.rectMidPoint(screen:fullFrame())
        hs.mouse.setAbsolutePosition(pt)
    end)

    mouse_mode:bind({}, 'Q', mouse_q, nil, mouse_q)
    mouse_mode:bind({}, 'E', mouse_e, nil, mouse_e)
    mouse_mode:bind({}, 'R', mouse_r, nil, mouse_r)
    mouse_mode:bind({}, 'F', mouse_f, nil, mouse_f)

    mouse_mode:bind({'shift'}, 'R', mouse_s_r, nil, mouse_s_r)
    mouse_mode:bind({'shift'}, 'F', mouse_s_f, nil, mouse_s_f)
    mouse_mode:bind({}, 'Z', mouse_z)
    mouse_mode:bind({'shift'}, 'Z', mouse_s_z)

    local on_mouse_mode = function()
        mouse_mode.triggered = false
        mouse_mode:enter()
    end

    local off_mouse_mode = function()
        mouse_mode:exit()
        if not mouse_mode.triggered then
            hs.eventtap.keyStroke({'shift'}, 'F16')
        end
    end


    hs.hotkey.bind({}, key, on_mouse_mode, off_mouse_mode)

end

return obj
