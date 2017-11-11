local awful = require("awful")

local function run_once(prg)
		awful.spawn.with_shell("pgrep -u $USER -x " .. prg .. " || (" .. prg .. " &)")
end

local cmds =
{
	"nm-applet",
	"pidgin",
	"thunderbird",
	"redshift",
	"seafile-applet",
	"xfce4-clipman",

}

for _,i in pairs(cmds) do
	run_once(i)
end
