local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

local monitormenu = {
	{ "VGA", "xrandr --output VGA1 --auto --output LVDS1 --off" },
	{ "LVDS", "xrandr --output VGA1 --off --output LVDS1 --auto" },
	{ "both", "xrandr --output VGA1 --auto --output LVDS1 --auto --output VGA1 --right-of LVDS1" },
}

local officemenu = {
	{ "writer", "soffice -writer" },
	{ "calc", "soffice -calc" },
}

local awesomemenu = {
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", awesome.quit },
}

mymainmenu = awful.menu({
	items = {
		{ "monitor", monitormenu },
		{ "office", officemenu },
		{ "awesome", awesomemenu },

		{ "suspend", "systemctl suspend" },
		{ "hibernate", "systemctl hibernate" },
		{ "reboot", "reboot" },
		{ "shutdown", "shutdown" },
	}
})

launcher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
