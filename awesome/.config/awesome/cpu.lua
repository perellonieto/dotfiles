

-- a simple CPU usage widget using /proc/stat.
-- This is written in plain lua and should run on
-- any awesome-version.
--
-- source: https://github.com/nevious/awesomeTempWidget

-- M is the returned object containing the function which gathers the information
local M = {}

-- Initialize the cpu usage to 0
local total_prev = {}
local idle_prev = {}
local fd = io.popen("grep 'cpu' /proc/stat | wc -l", "r")
local line = fd:read()
local num_cpus = tonumber(line)
for i=1, num_cpus do
    total_prev[i] = 0
    idle_prev[i] = 0
end


function M.getCpu(mid, high)

    local cpu_out = {'cpu'}
    -- user(1) nice(2) system(3) idle(4) iowait(5) irq(6) softirq(7) steal(8)
    -- guest(9) guest_nice(10)
    local fd = io.popen("grep 'cpu' /proc/stat", "r")

    local line = fd:read()

    local i = 1
    while line do
        local user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice = line:match('(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)$')

        local total = user + nice + system + idle + iowait + irq + softirq + steal

        local diff_idle = idle - idle_prev[i]
        local diff_total = total - total_prev[i]
        local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

        if diff_usage>high then
            color = 'red'
        elseif diff_usage>mid then
            color = 'orange'
        else
            color = '#00CC00' -- "green":'#00CC00'
        end

        table.insert(cpu_out, "<b><span color='" .. color .. "'>" .. math.floor(diff_usage) .. "%</span></b>")

        total_prev[i] = total
        idle_prev[i] = idle
        line = fd:read()
        i = i + 1
    end
    table.insert(cpu_out, '')
    return table.concat(cpu_out, '|')

end

return M
