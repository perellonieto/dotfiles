

-- a simple CPU usage widget using /proc/stat.
-- This is written in plain lua and should run on
-- any awesome-version.
--
-- source: https://github.com/nevious/awesomeTempWidget

-- M is the returned object containing the function which gathers the information
local M = {}

function M.getCpu(mid, high)

    local cpu_out = {'CPU'}
    local fd = io.popen("grep 'cpu' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} {print int(usage)}'", "r")
    local line = fd:read()

    while line do
        cpu_usage = tonumber(line)
        if cpu_usage>high then
            color = "<b><span color='red'>"
        elseif cpu_usage>mid then
            color = "<b><span color='orange'>"
        else
            color = "<b><span color='green'>"
        end

        table.insert(cpu_out, color .. cpu_usage .. "%</span></b>")

        line = fd:read()
    end
    return table.concat(cpu_out, "|")

end

return M
