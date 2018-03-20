-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

-- Load Debian menu entries
require("debian.menu")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end


-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- Volume widget:
-- {{{
cardid  = 0
channel = "Master"
function volume (mode, widget)
    if mode == "update" then
              local fd = io.popen("amixer -c " .. cardid .. " -- sget " .. channel)
              local status = fd:read("*all")
              fd:close()

        local volume = string.match(status, "(%d?%d?%d)%%")
        volume = string.format("V % 3d", volume)

        status = string.match(status, "%[(o[^%]]*)%]")

        if string.find(status, "on", 1, true) then
            volume = volume .. "%"
        else
            volume = volume .. "M"
        end
        widget.text = volume
    elseif mode == "up" then
        io.popen("amixer -c " .. cardid .. " set " .. channel .. " 2dB+"):read("*all")
        volume("update", widget)
    elseif mode == "down" then
        io.popen("amixer -c " .. cardid .. " set " .. channel .. " 2dB-"):read("*all")
        volume("update", widget)
    else
        io.popen("amixer -c " .. cardid .. " -D pulse set " .. channel .. " 1+ toggle"):read("*all")
        volume("update", widget)
    end
end
-- }}}

-- Screen rotation:
-- {{{
function screen_rotation (screen_name, direction)
    io.popen("xrandr --output " .. screen_name .. " --rotate " .. direction):read("*all")
end
-- }}}

-- Battery widget:
-- {{{
function battery_text (widget)
    fh = assert(io.popen("acpi -a | cut -d \" \" -f 3 -", "r"))
    local adapter_status = fh:read("*line")
    local color = '#FF2222' -- "red":'#FF2222'
    if string.find(adapter_status, "on", 1, true) then
        color = '#00CC00' -- "green":'#00CC00'
    end
    fh:close()

    fh = assert(io.popen("acpi -b | cut -d, -f 2 | tr -d ' '%", "r"))
    local battery_perc = fh:read("*number")
    fh:close()

    local battery_l = '?'
    if battery_perc > 90 then
        battery_l = '█'
    elseif battery_perc > 80 then
        battery_l = '▇'
    elseif battery_perc > 70 then
        battery_l = '▆'
    elseif battery_perc > 60 then
        battery_l = '▅'
    elseif battery_perc > 50 then
        battery_l = '▄'
    elseif battery_perc > 40 then
        battery_l = '▃'
    elseif battery_perc > 30 then
        battery_l = '▂'
    elseif battery_perc > 20 then
        battery_l = '▁'
    else
        battery_l = ' '
    end

    fh = assert(io.popen("acpi -b | cut -d,  -f 2,3 | cut -d \" \" -f 2,3 | tr -d ,", "r"))
    -- battery_widget.text = " |" .. fh:read("*l") .. " | "
    widget.text = "<b><span color=\"" .. color .. "\">|" .. battery_l .. " " .. fh:read("*line") .. "|</span></b>"
    fh:close()
end

battery_widget = widget({ type = "textbox" })
battery_widget.text = "<b>| Battery |</b>"
battery_widgettimer = timer({ timeout = 10 })
battery_widgettimer:add_signal("timeout", function() battery_text(battery_widget) end)
battery_widgettimer:start()
-- }}}
-- Temperature widget:
temp = require("temperature")
myTempWidget = widget({type = "textbox", align = "right"})
awful.hooks.timer.register(10, function() myTempWidget.text = temp.getTemp(60, 80) end)
-- }}}
-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- Pomodoro widget
require('pomodoro')

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
--    awful.layout.suit.magnifier
    awful.layout.suit.floating,
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8 }, s, layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- separator
myseparator = widget({ type = "textbox" })
myseparator.text = " :: "

-- Volume
volume_widget = widget({ type = "textbox", name = "volume_widget", align = "right" })
volume_widget:buttons({
   button({ }, 4, function () volume("up", volume_widget) end),
   button({ }, 5, function () volume("down", volume_widget) end),
   button({ }, 1, function () volume("mute", volume_widget) end)
})
volume("update", volume_widget)

-- Battery


-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        s == 1 and mysystray or nil,
        myseparator,
        volume_widget,
        myseparator,
        pomodoro.widget,
        myseparator,
        battery_widget,
        myseparator,
        myTempWidget,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
-- Use the command line xev to monitor the keys
globalkeys = awful.util.table.join(
    -- Open Time Tracker
    awful.key({modkey, }, "t", function () awful.util.spawn("hamster-time-tracker overview") end),
    -- Print Screen
    awful.key({ }, "Print", function () awful.util.spawn("/home/maikel/bin/screenshot") end),
    -- Screensaver lock
    -- TODO revise that next line works properly
    awful.key({ }, "XF86ScreenSaver", function () awful.util.spawn("xscreensaver-command -lock") end),
    -- Start windows as slave
    -- { rule = { }, properties = { }, callback = awful.client.setslave }
    --
    -- Thinkpad volume keys
    awful.key({ }, "XF86AudioRaiseVolume", function () volume("up", volume_widget) end),
    awful.key({ }, "XF86AudioLowerVolume", function () volume("down", volume_widget) end),
    awful.key({ }, "XF86AudioMute", function () volume("mute", volume_widget) end),
    awful.key({ }, "XF86AudioMicMute", function() awful.util.spawn("amixer set Capture toggle") end),
    -- Spotify
    awful.key({ }, "XF86AudioPlay", function () awful.util.spawn_with_shell("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause") end),
    awful.key({ }, "XF86AudioNext", function () awful.util.spawn_with_shell("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next") end),
    awful.key({ }, "XF86AudioPrev", function () awful.util.spawn_with_shell("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous") end),
    -- End Spotify
    awful.key({ }, "XF86Launch1", function() awful.util.spawn("XF86Launch1.sh") end),
    -- Display, projector, monitor
    awful.key({ }, "XF86Display", function() awful.util.spawn("XF86Display.sh") end),

    -- Laptop Screen rotation
    -- TODO change or add position instead of rotation
    awful.key({ modkey, "Control", "Shift"}, "Up", function () screen_rotation("HDMI1", "normal") end),
    awful.key({ modkey, "Control", "Shift"}, "Left", function () screen_rotation("HDMI1", "left") end),
    awful.key({ modkey, "Control", "Shift"}, "Right", function () screen_rotation("HDMI1", "right") end),
    awful.key({ modkey, "Control", "Shift"}, "Down", function () screen_rotation("HDMI1", "inverted") end),

    awful.key({ modkey,           }, "h",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "l",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "Right",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "Left",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Rename current tag
    awful.key({ modkey, "Shift",  }, "F2",    function ()
                    awful.prompt.run({ prompt = "Rename tab: ", text = awful.tag.selected().name, },
                    mypromptbox[mouse.screen].widget,
                    function (s)
                        awful.tag.selected().name = s
                    end)
            end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = false } },
    { rule = { class = "Gedit" },
      properties = { floating = false } },
    { rule = { class = "Google-chrome" },
      properties = { floating = false } },
    { rule = { class = "Gedit" },
      properties = { floating = false } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = false } },
    { rule = { class = "hamster-time-tracker" },
      properties = { tag = tags[1][7] } },
    { rule = { class = "spotify" },
      properties = { tag = tags[1][7] } },
    { rule = { class = "Thunderbird" },
      properties = { tag = tags[1][8] } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Volume update every 10 seconds
awful.hooks.timer.register(10, function () volume("update", volume_widget) end)

-- Calendar
-- source: http://awesome.naquadah.org/wiki/Calendar_widget
require('calendar2')
calendar2.addCalendarToWidget(mytextclock,
          "<span background='green' color='black'>%s</span>")

-- Autorun programs

function run_once(prg,arg_string,pname,screen)
    if not prg then
        do return nil end
    end

    if not pname then
       pname = prg
    end

    if not arg_string then
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
    else
        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. " ".. arg_string .."' || (" .. prg .. " " .. arg_string .. ")",screen)
    end
end

--previous version was "pgrep -u $USER -x nm-applet > /dev/null || (nm-applet &)"
run_once("nm-applet")                   -- Network connection tool
run_once("thunderbird")                 -- e-mail client
run_once("setxkbmap", "es")             -- Set the keyboard in Spanish
run_once("wmname", "LG3D")              -- Allows opening JVM GUIs
run_once("xscreensaver", "-no-splash")  -- screensaver
-- Time tracker tool
run_once("hamster-indicator", nil, "/usr/bin/python /usr/bin/hamster-indicator")
-- run_once("hamster-time-tracker", "overview", "/usr/bin/python /usr/bin/hamster-time-tracker overview")
-- Different screen color during day
-- In Ubuntu install redshift and redshift-gtk
-- run_once("redshift-gtk", nil, "/usr/bin/python /usr/bin/redshift-gtk")
-- In Ubuntu need to install fluxgui
run_once("fluxgui", nil, "/usr/bin/python /usr/bin/fluxgui")
-- Dropbox daemon
run_once("dropbox", "start", "/home/maikel/.dropbox-dist/dropbox-lnx.x86_64-30.4.22/dropbox")
-- Devmail (synchronization between Microsoft Exchange and Thunderbird)
run_once("/bin/sh", "/home/maikel/Modules/davmail/4.8.0/davmail.sh /home/maikel/Modules/davmail/4.8.0/davmail.properties")
run_once("/home/maikel/bin/system-low-battery-autostart")
