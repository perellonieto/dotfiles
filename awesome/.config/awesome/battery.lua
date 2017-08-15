-- a simple CPU temperatur widget using acpi-tools.
-- This is written in plain lua and should run on
-- any awesome-version.
--
-- source: https://github.com/nevious/awesomeTempWidget

-- M is the returned object containing the function which gathers the information
local M = {}

function M.getTemp(mid, high)

    local temp_out = {}
    local fd = io.popen("acpi -t", "r")
    local line = fd:read()

    while line do
        sensor_num = string.match(line, "Thermal (%d)")
        sensor_temp = string.match(line, "Thermal %d*:.* (%d*\.%d)")
        if tonumber(sensor_temp)>high then
            color = "<span color='red'>"
        elseif tonumber(sensor_temp)>mid then
            color = "<span color='orange'>"
        else
            color = "<span color='cyan'>"
        end

        table.insert(temp_out, "#" .. sensor_num .. ": " .. color .. sensor_temp .. "C</span>")

        line = fd:read()
    end
    return table.concat(temp_out, "|")

end

return M
