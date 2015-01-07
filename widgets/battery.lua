local wibox = require("wibox")
local naughty = require("naughty")

local battery = wibox.widget.textbox()
local notified = 100
battery:set_text("Battery")
local batterytimer = timer({ timeout = 10 })
batterytimer:connect_signal("timeout",
	function()
		fh = io.popen("acpi", "r")
		res = fh:read("*l")
		fh:close()
		if res == nil then
			return
		end
		bat = tonumber(string.sub(string.match(res, "%d+%%") or "0%", 1, -2))
		time = string.match(res, "%d+:%d+") or false
		charging = string.match(res, "Charging") or false

		if time then
			battery:set_text(bat .. "%, " .. time)
		else
			battery:set_text(bat .. "%")
		end

		if charging or bat > 20 then
			notified = 100
			return
		end

		-- will notify every 5% starting at 20%
		if notified-4 > bat then
			naughty.notify({title="Battery low", text="Connect the power adapter", timeout=0, bg="#FF0000", fg="000000"})
			notified = bat
		end
	end
)
batterytimer:start()

widget_add(battery)
