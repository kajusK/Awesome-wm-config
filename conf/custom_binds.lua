local awful = require("awful")

globalkeys = awful.util.table.join(globalkeys,
	awful.key({ "Mod1" }, "Shift_L", function () kbdcfg.switch() end),
	awful.key({}, "XF86AudioMute", function () os.execute("amixer set Master toggle") end),
	awful.key({}, "XF86AudioLowerVolume", function () os.execute("amixer set Master 2dB-") end),
	awful.key({}, "XF86AudioRaiseVolume", function () os.execute("amixer set Master 2dB+") end),
	awful.key({}, "XF86AudioMicMute", function () os.execute("amixer set Capture toggle") end),
	awful.key({}, "XF86WebCam", function () os.execute("scrot -e 'mv $f ~/Obrázky/screenshots/'") end),
	awful.key({}, "XF86AudioPrev", function () os.execute("mocp --prev") end),
	awful.key({}, "XF86AudioPlay", function () os.execute("(pgrep -u kajus -x mocp && mocp -G) || (mocp -S && mocp -p)") end),
	awful.key({}, "XF86AudioNext", function () os.execute("mocp --next") end),
	--awful.key({}, "XF86Display", function () os.execute("") end),
	awful.key({}, "XF86Search", function () awful.util.spawn("firefox") end),
	awful.key({}, "XF86MyComputer", function () awful.util.spawn("thunar") end),
	awful.key({}, "XF86Calculator", function () awful.util.spawn("galculator") end),
	awful.key({}, "XF86Sleep", function () os.execute("systemctl suspend") end),
	awful.key({"Control", "Mod1"}, "l", function () awful.util.spawn("slock") end)
)
