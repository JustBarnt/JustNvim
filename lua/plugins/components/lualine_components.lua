local M = {}

M.pomodoro_component = function()
    local pomodoro = require "pomo"

    local timer = pomodoro.get_first_to_finish()

    if timer == nil then
        return "󰄉"
    end

    return "󰄉 " .. tostring(timer)
end

return M
