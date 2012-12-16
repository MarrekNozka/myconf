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

-- {{{ Variable definitions
homepath = os.getenv("HOME")
-- Themes define colours, icons, and wallpapers
--beautiful.init("/usr/share/awesome/themes/zenburn/theme.lua")

beautiful.init(awful.util.getdir("config") .. "/themes/wine.lua")
--beautiful.init(awful.util.getdir("config") .. "/themes/zenburn.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
smallTerminal = "urxvt  -fn -*-terminus-medium-r-*--16-*-*-*-*-*-iso10646-1"
-- iPython = "rxvt-unicode -e ipython -pylab -q4thread -p marek"
iPython = "rxvt-unicode -e ipython -pylab=gtk "
editor = os.getenv("EDITOR") or "editor"
--editor_cmd = terminal .. " -e " .. editor
editor_cmd = "gvim"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
--    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
--    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.magnifier,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.max
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    if s == 1 then 
        tags[s] = awful.tag({ '1','2','3','4','5','6','7','8','9 |' }, s, layouts[9])
    end
    if s == 2 then 
        tags[s] = awful.tag({ '!1!','@2@','#3#','$4$','%5%','^6^','&7&','*8*','_9_ |' }, s, layouts[1])
    end
end
awful.tag.setproperty(tags[2][1], "layout", layouts[9])

awful.tag.setproperty(tags[2][2], "layout", layouts[4])
awful.tag.setproperty(tags[2][2], "setslave", true)
awful.tag.setproperty(tags[2][2], "nmaster", 1)
awful.tag.setproperty(tags[2][2], "mwfact", 0.70)

awful.tag.setproperty(tags[2][3], "layout", layouts[4])
awful.tag.setproperty(tags[2][3], "mwfact", 0.7)

awful.tag.setproperty(tags[2][4], "layout", layouts[4])
awful.tag.setproperty(tags[2][4], "mwfact", 0.7)
-- }}}
-- {{{ Tags
-- Alternativní způsob
-- Define tags table
--tags = {}
--tags.settings = {
--    { name = "term",     layout = layouts[1], setslave = true, nmaster = 1, ncol = 1, mwfact = 0.600000 },
--    { name = "file",     layout = layouts[7], setslave = true },
--    { name = "work",     layout = layouts[1]  },
--    { name = "web",      layout = layouts[7]  },
--    { name = "mail/im",  layout = layouts[1]  },
--    { name = "grafx",    layout = layouts[8]  },
--    { name = "média",    layout = layouts[1]  },
--    { name = "office",   layout = layouts[8]  },
--    { name = "ostatní",  layout = layouts[1]  }
--}
---- Initialize tags
--for s = 1, screen.count() do
--    tags[s] = {}
--    for i, v in ipairs(tags.settings) do
--        tags[s][i] = tag(v.name)
--        tags[s][i].screen = s
--        awful.tag.setproperty(tags[s][i], "layout",   v.layout)
--        awful.tag.setproperty(tags[s][i], "setslave", v.setslave)
--        awful.tag.setproperty(tags[s][i], "mwfact",   v.mwfact)
--        awful.tag.setproperty(tags[s][i], "nmaster",  v.nmaster)
--        awful.tag.setproperty(tags[s][i], "ncols",    v.ncols)
--        awful.tag.setproperty(tags[s][i], "icon",     v.icon)
--    end
--    tags[s][1].selected = true
--end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "restart", awesome.restart },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { 
                                    { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "APWAL", function () awful.util.spawn("apwal") end},
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "open terminal", terminal }
                                  }
                        })

--mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
--                                     menu = mymainmenu })
mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     command = "" }) 

mylauncher:buttons(awful.util.table.join(
                        mylauncher:buttons(),
                        awful.button({ }, 1, function () mymainmenu:toggle({ keygrabber = true }) end),
                        awful.button({ }, 3, function () awful.util.spawn("apwal") end)
                        )
                  )

-- }}}

-- {{{ Wibox
-- Create a textclock widget
--mytextclock = awful.widget.textclock({ align = "right" })
mytextclock = awful.widget.textclock({ align = "right" }, "| %d.%m.%Y %H:%M " )

-- Create a systray
mysystray = widget({ type = "systray" })

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
                    awful.button({ }, 5, awful.tag.viewnext),
                    awful.button({ }, 4, awful.tag.viewprev)
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
--        mysystray,
        s == 2 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 2, function () mymainmenu:toggle() end),
    awful.button({ }, 3, function () awful.util.spawn("apwal") end),
    awful.button({ }, 5, awful.tag.viewnext),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 6, function () awful.util.spawn("apwal") end)
))
-- }}}

-- {{{
-- Function that show command output on screen 
-- Funkce pro vypsani vystupu prikazu na obrazovku
local function notify_cmd(title, cmd, spawn)

	-- Get data from command
	local out = awful.util.pread(cmd)
	
	-- Escape output
	out = awful.util.escape(out)
	
naughty.notify{text = title .. "\n" .. out, timeout = spawn,
               screen = mouse.screen  
}
	
end
-- }}}

-- {{{ Key bindings
-- Ke zjištění správného kódu klávesy nám pomůže program xev.
-- potom jako klávesu zadávám #123
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, ",",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, ".",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, "Shift"   }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey,           }, "`", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Přidáno
--    awful.key({ modkey,           }, "e",      function () awful.util.spawn("gmrun") end),
    awful.key({ modkey            }, "F2",      function () awful.util.spawn("gmrun") end),
    awful.key({ modkey            }, "w",      function () awful.util.spawn("apwal") end),
    awful.key({ modkey            }, "e",      function () awful.util.spawn("kupfer") end),
    -- zamknuti pc (lock)
    awful.key({ modkey,           }, "z",      function () awful.util.spawn("gmrun xtrlock ") end),
--    awful.key({ modkey            }, "z",      function () awful.util.spawn("xtrlock") end),
    awful.key({ modkey,           }, "b",      function () awful.util.spawn("mocp --next") end),
    awful.key({ modkey,           }, "v",      function () awful.util.spawn("mocp --previous") end),
    awful.key({ modkey,           }, "c",      function () awful.util.spawn("mocp --toggle-pause") end),
    awful.key({ modkey,           }, "s",      function () awful.util.spawn("mocp --stop") end),
    awful.key({ modkey,           }, "p",      function () awful.util.spawn("mocp --play") end),
    awful.key({ modkey, "Shift"   }, "Return", function () awful.util.spawn(smallTerminal) end),
    awful.key({ modkey, "Shift"   }, "p", function () awful.util.spawn(iPython) end),

    -- hlasitost - multimedialni tlacitka (thinkpad r61)
    awful.key({ }       , "#122", function () awful.util.spawn("amixer -q set Master 2- unmute") end),
    awful.key({ }       , "#123", function () awful.util.spawn("amixer -q set Master 2+ unmute") end),
    awful.key({ modkey }, "#122", function () awful.util.spawn("amixer -q set PCM 2- unmute") end),
    awful.key({ modkey }, "#123", function () awful.util.spawn("amixer -q set PCM 2+ unmute") end),
    awful.key({ }       , "#146", function () awful.util.spawn("amixer -q set Master   mute") end),
    awful.key({ modkey} , "#146", function () awful.util.spawn("zsh -c 'amixer -q set Master unmute; amixer -q set PCM unmute'") end),

    -- plovouci okno na vsechny plochy
    awful.key({ modkey }, "d",   function () client.focus.sticky = not client.focus.sticky end),

    -- plovouci okno vzdy navrchu, viz modkey+"t"
--    awful.key({ modkey }, "y",   function () client.focus.ontop = not client.focus.ontop end),

    -- přepne setslave
    awful.key({ modkey   }, "y",
        function ()
            local screen = mouse.screen
            local selTag = awful.tag.selected(screen)
            local show = ""
            awful.tag.setproperty(selTag, 
                                 "setslave",
                                 not awful.tag.getproperty(selTag,"setslave") )

            if awful.tag.getproperty(selTag,"setslave") then
                show = "Slave"
            else
                show = "Master"
            end
            naughty.notify({title="New window", 
                            text=show,
                            timeout = 2,
                            screen = mouse.screen
                           })
        end),

    -- schova okno
    awful.key({ modkey },          "g",   function () client.focus.hide = not client.focus.hide end),

    -- Notifikace - HELP
    awful.key({ modkey },          "F1",   function ()
        notify_cmd("== Tahák Awesome ==", "cat " .. homepath .. "/.config/awesome/help.txt", 0)
    end),

    -- Notifikace - main info
    awful.key({ modkey },          "F7",   function ()
        notify_cmd("Volné místo", "df-wrapper.sh", 10)
    end),

    -- Notifikace - logs
    awful.key({ modkey },          "F8",   function ()
        notify_cmd("dmesg", "dmesg | tail -n 30", 10)
        -- notify_cmd("/var/log/Xorg.0.log", "cat /var/log/Xorg.0.log | tail", 5)
    end),
        
    -- Notifikace - net info
    awful.key({ modkey },          "F5",   function ()
        notify_cmd("Netstat ", "netstat -nat", 0)
    end),
        
    -- Notifikace - proc
    awful.key({ modkey },          "F3",   function ()
        notify_cmd("Procesy", "ps -u | tail -n 30", 10)
    end),	

    -- cal
    awful.key({ modkey },          "F9",   function ()
        notify_cmd("Kalendář", "cal. -t", 0)
    end),	

    -- SSH connect
    awful.key({modkey }, "F6", function ()
        awful.prompt.run({ prompt = "SSH Connect: " }, mypromptbox[mouse.screen].widget,
            function (host) awful.util.spawn(terminal .. " -e ssh " .. host, false) end)
    end),

    -- vertikalni a horzontalni resaiz oken
    awful.key({ modkey, "Mod1" }, "Down", function () awful.client.incwfact(0.05) end),
    awful.key({ modkey, "Mod1" }, "Up", function () awful.client.incwfact(-0.05) end),
    awful.key({ modkey, "Mod1" }, "Right", function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey, "Mod1" }, "Left", function () awful.tag.incmwfact(-0.05)    end),

    -- Zobrazí / schová titlebar (20px vysoky).
    awful.key({ modkey }, "q",   function () if client.focus.titlebar then awful.titlebar.remove(client.focus, { modkey = modkey, height = "20" }) else awful.titlebar.add(client.focus, { modkey = modkey, height = "20" }) end end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
--    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey            }, "F4",     function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey            }, "a",      awful.client.floating.toggle                     ),
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
        end),
    -- přesune na vedlejší tag
    awful.key({ modkey, "Shift"   }, ",",
        function (c)
            local curidx = awful.tag.getidx(c:tags()[1])
            if curidx == 1 then
                c:tags({screen[mouse.screen]:tags()[9]})
            else
                c:tags({screen[mouse.screen]:tags()[curidx - 1]})
            end
        end),
    -- přesune na vedlejší tag
    awful.key({ modkey, "Shift"   }, ".",
    function (c)
            local curidx = awful.tag.getidx(c:tags()[1])
            if curidx == 9 then
                c:tags({screen[mouse.screen]:tags()[1]})
            else
                c:tags({screen[mouse.screen]:tags()[curidx + 1]})
            end
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
    awful.button({ modkey }, 3, awful.mouse.client.resize)
    )

-- Set keys
root.keys(globalkeys)
-- }}}

--
-- $ xprop | egrep -i class 
-- 
-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" }, properties = { floating = true } },
    { rule = { class = "mplayer2" }, properties = { floating = true } },
    { rule = { class = "Smplayer" }, properties = { floating = true } },
    { rule = { class = "Vlc" }, properties = { floating = true } },
    { rule = { class = "Stickynotes_applet" }, properties = { floating = true } },
    { rule = { class = "Topshelf.py" }, properties = { floating = true } },
    { rule = { class = "Display" }, properties = { floating = true } },
    { rule = { class = "Ipython" }, properties = { floating = true } },
    { rule = { class = "Pinentry" }, properties = { floating = true } },
    { rule = { class = "Stardict" }, properties = { floating = true } },
    { rule = { class = "Gimp" }, properties = { floating = true } },
    { rule = { class = "Gtklp" }, properties = { floating = true } },
    { rule = { class = "Qmv" }, properties = { floating = true } },
    { rule = { class = "Turpial" }, properties = { floating = true } },
    { rule = { class = "Foo" }, properties = { floating = true } },
    { rule = { class = "GtkFoo" }, 
                properties = { floating = true,
                               tag = tags[2][1],
                               x=110,
                               y=100,
                               maximized_vertical = true,
                               maximized_horizontal = true
                              } 
             },
    { rule = { class = "Iceweasel" }, 
      except = { instance = "Navigator"},
      properties = {floating = true}
    },
    { rule = { class = "Stardict" }, properties = { floating = true } },
    { rule = { class = "Tilda" }, properties = { floating = true } },
    { rule = { class = "Yakuake" }, properties = { floating = true, border_width = 0 } },
    { rule = { class = "Guake" }, properties = { floating = true } },
    { rule = { class = "Wine" }, properties = { floating = true, border_color = "#d1940c" } },
    { rule = { class = "psi", }, properties = { floating = true } },
    { rule = { class="Psi-plus"}, properties = { floating = true } },
    { rule = { class = "kvm" }, properties = { floating = true } },
    { rule = { class = "MyPasswordSafe" }, properties = { floating = true } },
    { rule = { class = "Mssh" }, properties = { floating = true } },
    { rule = { class = "Krusader" }, properties = { floating = true } },
    { rule = { class = "f00" }, properties = { floating = true } },
    { rule = { class = " " }, properties = { floating = true } },
    { rule = { class = "Wpa_gui" }, properties = { floating = true } },
    { rule = { class = "URxvt" }, callback = awful.client.setslave },
    { rule = { class = "Gmrun" }, properties = { ontop = true } }
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey , height = "18"})

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
        -- nový clienti budou jako slave, ale jen na označených plochách
        local curidx = awful.tag.getidx(c:tags()[1])
        local screen = mouse.screen
        if awful.tag.getproperty(tags[screen][curidx],"setslave") then
            awful.client.setslave(c)
        end

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- skočím hned na pátou plochu
awful.tag.viewonly(tags[2][1])
-- }}}
