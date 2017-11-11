local wibox = require("wibox")
--needs to be global in rc.lua, if defined here, deletes all remaining widgets
--local vicious = require("vicious")

cpuwidget = wibox.widget.graph()
cpuwidget:set_width(30)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 50, 0 },
  stops = { { 0, "#FF5656" }, { 0.5, "#88A175" }, { 1, "#AECF96" }}})
vicious.register(cpuwidget, vicious.widgets.cpu, "$1", 11)

cputext = wibox.widget.textbox()
cputext:set_text("C:")

widget_add(cpuwidget)
widget_add(cputext)
