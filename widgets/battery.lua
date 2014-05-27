local wibox = require("wibox")

local function get_battery()

end

local battery = wibox.widget.textbox()
battery:set_text("Battery")
local batterytimer = timer({ timeout = 5 })
batterytimer:connect_signal("timeout",
	function()
		fh = io.popen("acpi | cut -d, -f 2,3 | cut -d ' ' -f 1,2,3 | cut -d : -f 1,2", "r")
		res = fh:read("*l")
		if res ~= nil then
			battery:set_text(res)
		end
		fh:close()
	end
)
batterytimer:start()

widget_add(battery)
