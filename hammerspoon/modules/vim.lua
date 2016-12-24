local obj = {}

local vim_icon = hs.menubar.new()
local caps_mode = hs.hotkey.modal.new()

local boxes = {}
local triggered = false
local on_mode = false

function obj:init(key1, key2)

    print('vim module loaded')

    function setVimDisplay(state)
        if state then
            vim_icon:setTitle("𝑽")
        else
            vim_icon:setTitle("")
        end
    end

    function vimClicked()
        setVimDisplay()
    end

    vim_icon:setClickCallback(vimClicked)

    -- vim mode
    on_mode = false

    local vim = function(func)
        return function()
            func()
            triggered = true
        end
    end

    local function keyCode(modifiers, key)
        modifiers = modifiers or {}
        return function()
            hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
            hs.timer.usleep(100)
            hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
        end
    end

    local vim_end = function() triggered = true end

    caps_mode:bind({}, 'F10', function() hs.reload() end, vim_end)

    hs.fnutils.each({
        { key='h', mod={}, func=keyCode({}, 'left') },
        { key='j', mod={}, func=keyCode({}, 'down') },
        { key='k', mod={}, func=keyCode({}, 'up') },
        { key='l', mod={}, func=keyCode({}, 'right') },

        { key='h', mod={'shift'}, func=keyCode({'shift'}, 'left') },
        { key='j', mod={'shift'}, func=keyCode({'shift'}, 'down') },
        { key='k', mod={'shift'}, func=keyCode({'shift'}, 'up') },
        { key='l', mod={'shift'}, func=keyCode({'shift'}, 'right') },

        { key='h', mod={'ctrl'}, func=keyCode({'ctrl'}, 'left') },
        { key='j', mod={'ctrl'}, func=keyCode({'ctrl'}, 'down') },
        { key='k', mod={'ctrl'}, func=keyCode({'ctrl'}, 'up') },
        { key='l', mod={'ctrl'}, func=keyCode({'ctrl'}, 'right') },

        { key='w', mod={}, func=keyCode({'alt'}, 'right') },
        { key='b', mod={}, func=keyCode({'alt'}, 'left') },

        { key='w', mod={'shift'}, func=keyCode({'shift', 'alt'}, 'right') },
        { key='b', mod={'shift'}, func=keyCode({'shift', 'alt'}, 'left') },
    }, function(v)
        caps_mode:bind(v.mod, v.key, v.func, vim_end, v.func)
    end
    )

    local vim_0 = vim(function() hs.eventtap.keyStroke({'cmd'}, 'LEFT') end)
    local vim_4 = vim(function() hs.eventtap.keyStroke({'cmd'}, 'RIGHT') end)
    local vim_p = vim(function() hs.eventtap.keyStroke({'cmd'}, 'V') end)
    local vim_y = vim(function() hs.eventtap.keyStroke({'cmd'}, 'C') end)
    local vim_d = vim(function() hs.eventtap.keyStroke({'cmd'}, 'X') end)

    caps_mode:bind({}, '0', vim_0, nil, vim_0)
    caps_mode:bind({}, '4', vim_4, nil, vim_4)
    caps_mode:bind({}, 'p', vim_p, nil, vim_p)
    caps_mode:bind({}, 'y', vim_y, nil, vim_y)
    caps_mode:bind({}, 'd', vim_d, nil, vim_d)

    local vim_x = vim(function() hs.eventtap.keyStroke({}, 'forwarddelete') end)
    local vim_s_x = vim(function() hs.eventtap.keyStroke({}, 'DELETE') end)
    caps_mode:bind({}, 'x', vim_x)
    caps_mode:bind({'shift'}, 'x', vim_s_x)

    local vim_tab_left = vim(function() hs.eventtap.keyStroke({'ctrl'}, 'PAGEUP') end)
    local vim_tab_right = vim(function() hs.eventtap.keyStroke({'ctrl'}, 'PAGEDOWN') end)

    caps_mode:bind({}, ',', vim_tab_left, nil, vim_tab_left)
    caps_mode:bind({}, '.', vim_tab_right, nil, vim_tab_right)

    local vim_enter = vim(function() hs.eventtap.keyStroke({}, 'RETURN') end)
    caps_mode:bind({}, 'SPACE', vim_enter, nil, vim_enter)

    local on_caps_mode = function()
        caps_mode:enter()
        setVimDisplay(true)
        triggered = false
        on_mode = true
        show_status_bar(true)
    end

    local off_caps_mode = function()
        setVimDisplay()
        caps_mode:exit()

        if not triggered then
            hs.eventtap.keyStroke({}, 'ESCAPE')
        end

        triggered = true
        on_mode = false
        show_status_bar(false)
    end


    hs.hotkey.bind({}, key1, on_caps_mode, off_caps_mode)
    hs.hotkey.bind({}, key2,
    function()
        if not on_mode then
            on_caps_mode()
        else
            off_caps_mode()
        end
    end
    )

    return self
end

function show_status_bar(stat)
    if stat then
        show_status_bar(false)
        boxes = {}
        hs.fnutils.each(hs.screen.allScreens(), function(scr)
            local box = hs.drawing.rectangle(hs.geometry.rect(0,0,0,0))
            draw_rectangle(box, scr, 0, scr:fullFrame().w, hs.drawing.color.red)
            table.insert(boxes, box)
        end)
    else
        hs.fnutils.each(boxes, function(box) box:delete() end)
        boxes = {}
    end
end

function isInScreen(screen, win)
  return win:screen() == screen
end

function draw_rectangle(target_draw, screen, offset, width, fill_color)
  local screeng                  = screen:fullFrame()
  local screen_frame_height      = screen:frame().y
  local screen_full_frame_height = screeng.y
  local height_delta             = screen_frame_height - screen_full_frame_height
  local height                   = 23

  target_draw:setSize(hs.geometry.rect(screeng.x + offset, screen_full_frame_height, width, height))
  target_draw:setTopLeft(hs.geometry.point(screeng.x + offset, screen_full_frame_height))
  target_draw:setFillColor(fill_color)
  target_draw:setFill(true)
  target_draw:setAlpha(0.5)
  target_draw:setLevel(hs.drawing.windowLevels.overlay)
  target_draw:setStroke(false)
  target_draw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
  target_draw:show()
end

return obj
