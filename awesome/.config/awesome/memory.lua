-- a simple Memory widget using free.
-- This is written in plain lua and should run on
-- any awesome-version.
--
-- source: https://github.com/nevious/awesomeTempWidget

-- M is the returned object containing the function which gathers the information
local M = {}

function M.getMem(mid, high)

    local mem_out = {}
    local fd = io.popen("free | grep Mem | awk '{printf(\"%.0f\", $3/$2 * 100)}'", "r")
    local percentage = tonumber(fd:read())

    if percentage>high then
        color = "<b><span color='red'>"
    elseif percentage>mid then
        color = "<b><span color='orange'>"
    else
        color = "<b><span color='green'>"
    end

    table.insert(mem_out, "Mem " .. color .. percentage .. "%</span></b>")
    return table.concat(mem_out, "|")
end

return M
