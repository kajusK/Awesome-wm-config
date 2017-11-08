local wibox = require("wibox")
local naughty = require("naughty")

local battery = wibox.widget.textbox()
local notified = 100
battery:set_text("Battery")
local batterytimer = timer({ timeout = 10 })


function battery_check()
	fh = io.popen("acpi", "r")
	res = fh:read("*all")
	fh:close()
	if res == nil then
		return
	end

	bat = tonumber(string.sub(string.match(res, "%d+%%") or "0%", 1, -2))
	time = string.match(res, "%d+:%d+") or false
	charging = string.match(res, "Charging") or false

	for l in string.gmatch(res,'[^\r\n]+') do
		bat_new = tonumber(string.sub(string.match(l, "%d+%%") or "0%", 1, -2))
		disch = string.match(l, "Discharging") or false

		if disch or (bat_new < bat) then
			time = string.match(l, "%d+:%d+") or false
			charging = string.match(l, "Charging") or false
			bat = bat_new
		end

	end

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

batterytimer:connect_signal("timeout", battery_check)
batterytimer:start()
widget_add(battery)

battery_check()

