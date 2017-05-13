local obj = {}

function obj:init(mod, key, input_source)

    local func = nil

    local pressedfn = function()

        local current_input_source = hs.keycodes.currentSourceID()

        -- hs.alert.show(current_input_source)

        if not (current_input_source == input_source) then
            -- hs.eventtap.keyStroke({}, 'right')
            hs.keycodes.currentSourceID(input_source)
        end
        func:disable()
        hs.eventtap.keyStroke(mod, key)
        func:enable()
    end

    local releasedfn = nil
    local repeatfn = nil

    func = hs.hotkey.new(mod, key, nil, pressedfn, releasedfn, repeatfn)
    func:enable()

    return self
end

return obj

