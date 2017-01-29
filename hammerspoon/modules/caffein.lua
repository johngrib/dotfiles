local caffeine = hs.menubar.new()

local obj = {}

function obj:init(mod, key)

    function setCaffeineDisplay(state)
        if state then
            hs.alert.show('커피를 마셨습니다.')
            caffeine:setTitle("☕️🙄")
        else
            hs.alert.show('잠이 옵니다.')
            caffeine:setTitle("😴")
        end
    end

    function caffeineClicked()
        setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
    end

    if caffeine then
        caffeine:setClickCallback(caffeineClicked)
        setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
    end

    hs.hotkey.bind(mod, key, caffeineClicked)
end

return obj
-- hs.hotkey.bind({'cmd'}, key1, on_caps_mode, off_caps_mode)
