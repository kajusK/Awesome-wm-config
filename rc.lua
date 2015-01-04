---------------------------
-- Modular awesome config
--      Awesome 3.5
---------------------------
--     Jakub Kaderka
---------------------------

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

-- VARIABLES
modkey = "Mod4"
terminal = "xterm"
editor = "vim"
wallpaper = "/home/kajus/Obrázky/tapety/iss_window.jpg"

editor_cmd = terminal .. " -e " .. editor
configpath = os.getenv("HOME") .. "/.config/awesome/"

-- THEME
local theme = "default"
if theme == "default" then
	beautiful.init("/usr/share/awesome/themes/default/theme.lua")
else
	beautiful.init(configpath .. "/themes/" .. theme .. "/theme.lua")
end

-- WALLPAPER
if wallpaper == "default" then
	for s = 1, screen.count() do
		gears.wallpaper.maximized(beautiful.wallpaper, s, true)
	end
else
	for s = 1, screen.count() do
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- LAYOUTS, TAGS
require("conf.tags")

-- MENUS
require("conf.menus")

-- WIDGETS
widgets = {}
function widget_add(widget)
	table.insert(widgets, widget)
end
separator = wibox.widget.textbox()
separator:set_text(" | ")

mailboxes = {
	{"gmail", "/home/kajus/Mail/gmail/INBOX"},
	{"seznam", "/home/kajus/Mail/seznam/INBOX"},
	{"centrum", "/home/kajus/Mail/centrum/INBOX"},
	{"gymjev", "/home/kajus/Mail/gymjev/INBOX"}
}

require("widgets.clock")
widget_add(separator)
require("widgets.battery")
widget_add(separator)
require("widgets.mail")
widget_add(separator)
require("widgets.kb_layout")

-- some WIBOX stuff
require("conf.wibox")

-- BINDINGS
require("conf.bindings")
require("conf.custom_binds")
root.keys(globalkeys)

-- RULES
require("conf.rules")

-- SIGNALS
require("conf.signals")

-- AUTORUN and other stuff
require("conf.autostart")
