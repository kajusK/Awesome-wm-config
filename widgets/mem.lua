local wibox = require("wibox")
--needs to be global in rc.lua, if defined here, deletes all remaining widgets
--local vicious = require("vicious")

memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "M:$1%",23)

widget_add(memwidget)
