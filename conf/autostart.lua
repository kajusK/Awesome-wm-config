local awful = require("awful")

local function run_once(prg)
		awful.util.spawn_with_shell("pgrep -u $USER -x " .. prg .. " || (" .. prg .. ")")
end

local cmds =
{
	"nm-applet",
	"pidgin",
}

for _,i in pairs(cmds) do
	run_once(i)
end
