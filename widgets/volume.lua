-- based on http://www.jasonmaur.com/awesome-wm-widgets-configuration/#network
local wibox = require("wibox")

volumewidget = wibox.widget.textbox()

function volume_update()
       local fd = io.popen("amixer sget Master")
       local status = fd:read("*all")
       fd:close()

       local volume = string.match(status, "(%d?%d?%d)%%")
       volume = string.format("% 3d", volume)
       status = string.match(status, "%[(o[^%]]*)%]")
       if string.find(status, "on", 1, true) then
               volume = volume .. "%"
       else
               volume = volume .. "M"
       end
       volumewidget:set_text("V:"..volume)
end

function volume_up()
	os.execute("amixer set Master 2dB+")
	volume_update()
end

function volume_down()
	os.execute("amixer set Master 2dB-")
	volume_update()
end

function volume_toggle()
	os.execute("amixer set Master toggle")
	volume_update()
end

volume_update()
widget_add(volumewidget)
