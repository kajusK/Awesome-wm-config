local gears = require("gears")
local awful = require("awful")

globalkeys = gears.table.join(globalkeys,
	awful.key({ "Mod1" }, "Shift_L", function () kbdcfg.switch() end),
	awful.key({}, "XF86AudioMute", volume_toggle),
	awful.key({}, "XF86AudioLowerVolume", volume_down),
	awful.key({}, "XF86AudioRaiseVolume", volume_up),
	awful.key({}, "XF86AudioMicMute", function () os.execute("amixer set Capture toggle") end),
	awful.key({}, "XF86Display", function () os.execute("scrot -e 'mv $f ~/Obrázky/screenshots/'") end),
	awful.key({}, "XF86AudioPrev", function () os.execute("mocp --prev") end),
	awful.key({}, "XF86AudioPlay", function () os.execute("(pgrep -u kajus -x mocp && mocp -G) || (mocp -S && mocp -p)") end),
	awful.key({}, "XF86AudioNext", function () os.execute("mocp --next") end),
	awful.key({}, "XF86Search", function () awful.spawn("firefox") end),
	awful.key({}, "XF86MyComputer", function () awful.spawn("thunar") end),
	awful.key({}, "XF86Calculator", function () awful.spawn("galculator") end),
	awful.key({}, "XF86Sleep", function () os.execute("systemctl suspend") end),
	awful.key({}, "XF86MonBrightnessUp", function () os.execute("xbacklight +10") end),
	awful.key({}, "XF86MonBrightnessDown", function () os.execute("xbacklight -10") end),
	awful.key({"Control", "Mod1"}, "l", function () awful.spawn(" i3lock -i /home/kajus/Obrázky/tapety/servers.png") end)
)
