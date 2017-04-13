-- mouse mode

local obj = {}

local flag = {
    move  = false,
    dist  = 5,
    left  = 0,
    right = 0,
    up    = 0,
    down  = 0
}

local getX = function()
    return flag.dist * (flag.right - flag.left)
end

local getY = function()
    return flag.dist * (flag.down - flag.up)
end

function obj:init(key)

    local mouse_mode = hs.hotkey.modal.new()

    local mm = function(func)
        return function()
            func()
            mouse_mode.triggered = true
        end
    end

    local mouse_move_up = function(dist)
        return function()
            flag.up = dist
        end
    end
    local mouse_move_down = function(dist)
        return function()
            flag.down = dist
        end
    end
    local mouse_move_left = function(dist)
        return function()
            flag.left = dist
        end
    end
    local mouse_move_right = function(dist)
        return function()
            flag.right = dist
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

    local mouse_w = mm(mouse_move_up(1))
    local mouse_a = mm(mouse_move_left(1))
    local mouse_s = mm(mouse_move_down(1))
    local mouse_d = mm(mouse_move_right(1))

    local mouse_w_off = mm(mouse_move_up(0))
    local mouse_a_off = mm(mouse_move_left(0))
    local mouse_s_off = mm(mouse_move_down(0))
    local mouse_d_off = mm(mouse_move_right(0))

    mouse_mode:bind({}, 'W', mouse_w, mouse_w_off, nil)
    mouse_mode:bind({}, 'A', mouse_a, mouse_a_off, nil)
    mouse_mode:bind({}, 'S', mouse_s, mouse_s_off, nil)
    mouse_mode:bind({}, 'D', mouse_d, mouse_d_off, nil)

    mouse_mode:bind({}, ',', function() flag.dist = 3 end, function() flag.dist = 10 end, nil)
    mouse_mode:bind({}, '.', function() flag.dist = 2 end, function() flag.dist = 10 end, nil)
    mouse_mode:bind({}, '/', function() flag.dist = 1 end, function() flag.dist = 10 end, nil)

    local mouse_cmd_w = mm(mouse_move_up(9))
    local mouse_cmd_a = mm(mouse_move_left(9))
    local mouse_cmd_s = mm(mouse_move_down(9))
    local mouse_cmd_d = mm(mouse_move_right(9))

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
                point.x = point.x + getX()
                point.y = point.y + getY()

                hs.mouse.setRelativePosition(point)
            end,
            0.005
        )
    end

    local off_mouse_mode = function()
        flag.move = false
        mouse_mode:exit()
        if not mouse_mode.triggered then
            -- hs.eventtap.keyStroke({'shift'}, 'F16')
        end
    end


    hs.hotkey.bind({}, key, on_mouse_mode, off_mouse_mode)

end

return obj
