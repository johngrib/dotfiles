-- hammerspoon config

-- vim mode
local vim_mode = hs.hotkey.modal.new()

local vim = function(func)
    return function()
        func()
        vim_mode.triggered = true
    end
end

local vim_h = vim(function() hs.eventtap.keyStroke({}, 'LEFT') end)
local vim_j = vim(function() hs.eventtap.keyStroke({}, 'DOWN') end)
local vim_k = vim(function() hs.eventtap.keyStroke({}, 'UP') end)
local vim_l = vim(function() hs.eventtap.keyStroke({}, 'RIGHT') end)

vim_mode:bind({}, 'h', vim_h, nil, vim_h)
vim_mode:bind({}, 'j', vim_j, nil, vim_j)
vim_mode:bind({}, 'k', vim_k, nil, vim_k)
vim_mode:bind({}, 'l', vim_l, nil, vim_l)

local vim_s_h = vim(function() hs.eventtap.keyStroke({'shift'}, 'LEFT') end)
local vim_s_j = vim(function() hs.eventtap.keyStroke({'shift'}, 'DOWN') end)
local vim_s_k = vim(function() hs.eventtap.keyStroke({'shift'}, 'UP') end)
local vim_s_l = vim(function() hs.eventtap.keyStroke({'shift'}, 'RIGHT') end)

vim_mode:bind({'shift'}, 'h', vim_s_h, nil, vim_s_h)
vim_mode:bind({'shift'}, 'j', vim_s_j, nil, vim_s_j)
vim_mode:bind({'shift'}, 'k', vim_s_k, nil, vim_s_k)
vim_mode:bind({'shift'}, 'l', vim_s_l, nil, vim_s_l)

local vim_w = vim(function() hs.eventtap.keyStroke({'alt'}, 'RIGHT') end)
local vim_b = vim(function() hs.eventtap.keyStroke({'alt'}, 'LEFT') end)

vim_mode:bind({}, 'w', vim_w, nil, vim_w)
vim_mode:bind({}, 'b', vim_b, nil, vim_b)

local vim_0 = vim(function() hs.eventtap.keyStroke({'cmd'}, 'LEFT') end)
local vim_4 = vim(function() hs.eventtap.keyStroke({'cmd'}, 'RIGHT') end)
local vim_p = vim(function() hs.eventtap.keyStroke({'cmd'}, 'V') end)
local vim_y = vim(function() hs.eventtap.keyStroke({'cmd'}, 'C') end)
local vim_d = vim(function() hs.eventtap.keyStroke({'cmd'}, 'D') end)

vim_mode:bind({}, '0', vim_0, nil, vim_0)
vim_mode:bind({}, '4', vim_4, nil, vim_4)
vim_mode:bind({}, 'p', vim_p, nil, vim_p)
vim_mode:bind({}, 'y', vim_y, nil, vim_y)
vim_mode:bind({}, 'd', vim_d, nil, vim_d)

local vim_tab_left = vim(function() hs.eventtap.keyStroke({'ctrl'}, 'PAGEUP') end)
local vim_tab_right = vim(function() hs.eventtap.keyStroke({'ctrl'}, 'PAGEDOWN') end)

vim_mode:bind({}, ',', vim_tab_left, nil, vim_tab_left)
vim_mode:bind({}, '.', vim_tab_right, nil, vim_tab_right)

local vim_enter = vim(function() hs.eventtap.keyStroke({}, 'RETURN') end)
vim_mode:bind({}, 'SPACE', vim_enter, nil, vim_enter)

local on_vim_mode = function()
    vim_mode.triggered = false
    vim_mode:enter()
end

local off_vim_mode = function()
    vim_mode:exit()
    if not vim_mode.triggered then
        hs.eventtap.keyStroke({}, 'ESCAPE')
    end
end

hs.hotkey.bind({}, 'F15', on_vim_mode, off_vim_mode)

-- app mode

local app_mode = hs.hotkey.modal.new()

local app_a = function() hs.eventtap.keyStroke({'ctrl'}, 'LEFT') end
local app_d = function() hs.eventtap.keyStroke({'ctrl'}, 'RIGHT') end
local app_w = function() hs.eventtap.keyStroke({'ctrl'}, 'UP') end
local app_s = function() hs.eventtap.keyStroke({'ctrl'}, 'DOWN') end

app_mode:bind({}, 'a', app_a, nil, app_a)
app_mode:bind({}, 'd', app_d, nil, app_d)
app_mode:bind({}, 'w', app_w, nil, app_w)
app_mode:bind({}, 's', app_s, nil, app_s)

local on_app_mode = function()
    app_mode:enter()
end

local off_app_mode = function() app_mode:exit() end

hs.hotkey.bind({}, 'F18', on_app_mode, off_app_mode)

-- mouse mode

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

local mouse_q = mm(function() hs.eventtap.leftClick(hs.mouse.getAbsolutePosition()) end)
local mouse_e = mm(function() hs.eventtap.rightClick(hs.mouse.getAbsolutePosition()) end)
local mouse_r = mm(function() hs.eventtap.scrollWheel({0,1}, {}, 'line') end)
local mouse_f = mm(function() hs.eventtap.scrollWheel({0,-1}, {}, 'line') end)
local mouse_s_r = mm(function() hs.eventtap.scrollWheel({0,1}, {}, 'pixel') end)
local mouse_s_f = mm(function() hs.eventtap.scrollWheel({0,-1}, {}, 'pixel') end)

mouse_mode:bind({}, 'Q', mouse_q, nil, mouse_q)
mouse_mode:bind({}, 'E', mouse_e, nil, mouse_e)
mouse_mode:bind({}, 'R', mouse_r, nil, mouse_r)
mouse_mode:bind({}, 'F', mouse_f, nil, mouse_f)
mouse_mode:bind({'shift'}, 'R', mouse_s_r, nil, mouse_s_r)
mouse_mode:bind({'shift'}, 'F', mouse_s_f, nil, mouse_s_f)

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


hs.hotkey.bind({}, 'F16', on_mouse_mode, off_mouse_mode)


test = function()
    point = hs.mouse.getRelativePosition()
    aaa = point.x

        point.x = point.x + 10
        point.y = point.y + 10

    hs.alert.show(aaa .. '   ' .. point.x)
    hs.mouse.setRelativePosition(point)
end
-- hs.hotkey.bind({'ctrl'}, 'R', test, nil, test)
