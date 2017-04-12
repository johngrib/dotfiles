-- mouse mode

local obj = {}

local flag = {
    move = false,
    x = 0,
    y = 0
}

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
            flag[dir] = dist
        end
    end

    local mouse_off = function(dir, dist)
        return function()
            flag[dir] = 0
        end
    end

    local mouse_w = mm(mouse_move('y', -1))
    local mouse_a = mm(mouse_move('x', -1))
    local mouse_s = mm(mouse_move('y', 1))
    local mouse_d = mm(mouse_move('x', 1))
    local mouse_w_off = mm(mouse_move('y', 0))
    local mouse_a_off = mm(mouse_move('x', 0))
    local mouse_s_off = mm(mouse_move('y', 0))
    local mouse_d_off = mm(mouse_move('x', 0))

    mouse_mode:bind({}, 'W', mouse_w, mouse_w_off, nil)
    mouse_mode:bind({}, 'A', mouse_a, mouse_a_off, nil)
    mouse_mode:bind({}, 'S', mouse_s, mouse_s_off, nil)
    mouse_mode:bind({}, 'D', mouse_d, mouse_d_off, nil)

    local mouse_cmd_w = mm(mouse_move('y', -9))
    local mouse_cmd_a = mm(mouse_move('x', -9))
    local mouse_cmd_s = mm(mouse_move('y', 9))
    local mouse_cmd_d = mm(mouse_move('x', 9))

    mouse_mode:bind({'cmd'}, 'W', mouse_cmd_w, mouse_w_off, mouse_cmd_w)
    mouse_mode:bind({'cmd'}, 'A', mouse_cmd_a, mouse_a_off, mouse_cmd_a)
    mouse_mode:bind({'cmd'}, 'S', mouse_cmd_s, mouse_s_off, mouse_cmd_s)
    mouse_mode:bind({'cmd'}, 'D', mouse_cmd_d, mouse_d_off, mouse_cmd_d)

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

        flag.move = true

        hs.timer.doWhile(
            function() return flag.move end,
            function()
                point = hs.mouse.getRelativePosition()
                point.x = point.x + flag.x
                point.y = point.y + flag.y
                hs.mouse.setRelativePosition(point)
            end,
            0.005
        )
    end

    local off_mouse_mode = function()
        flag['x'] = 0
        flag['y'] = 0
        flag.move = false
        mouse_mode:exit()
        if not mouse_mode.triggered then
            hs.eventtap.keyStroke({'shift'}, 'F16')
        end
    end


    hs.hotkey.bind({}, key, on_mouse_mode, off_mouse_mode)

end

return obj
