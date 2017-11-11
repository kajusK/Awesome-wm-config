local wibox = require("wibox")
local gears = require("gears")
local vicious = require("vicious")

local temptimer = gears.timer({ timeout = 43 })
tempwidget = wibox.widget.textbox()

function temp_update()
	fh = io.open("/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input", "r")
	res = fh:read("*all")
	fh:close()

	temp = res/1000
	tempwidget:set_text(temp.."°C")
end

temptimer:connect_signal("timeout", temp_update)
temptimer:start()

temp_update()

widget_add(tempwidget)
