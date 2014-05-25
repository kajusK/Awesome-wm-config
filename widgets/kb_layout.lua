local awful = require("awful")
local wibox = require("wibox")

-- Keyboard map indicator and changer
kbdcfg = {}
kbdcfg.cmd = "setxkbmap"
kbdcfg.layout = { { "us", "" }, { "cz", "qwerty" }}
kbdcfg.current = 2 - 1  -- default layout - 1
kbdcfg.widget = wibox.widget.textbox()
kbdcfg.widget:set_text(" " .. kbdcfg.layout[kbdcfg.current][1] .. " ")

kbdcfg.switch = function ()
	kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
	local t = kbdcfg.layout[kbdcfg.current]
	kbdcfg.widget:set_text(" " .. t[1] .. " ")
	os.execute( kbdcfg.cmd .. " " .. t[1] .. " " .. t[2] )
end

-- switch to default layout
kbdcfg.switch()

-- Mouse bindings
kbdcfg.widget:buttons(
	awful.util.table.join(awful.button({ }, 1, function () kbdcfg.switch() end))
)

widget_add(kbdcfg.widget)
