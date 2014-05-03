local awful = require("awful")
local beautiful = require("beautiful")

awful.rules.rules = {
	-- All clients will match this rule.
	{ rule = { },
	properties = { border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			keys = clientkeys,
			buttons = clientbuttons } },

	{ rule = { class = "MPlayer" },
	properties = { floating = true } },
	{ rule = { class = "gimp" },
	properties = { floating = true } },

	--fixed tags
	{ rule = { class = "Pidgin" },
	properties = { tag = tags[1][4] } },
	{ rule = { class = "Firefox" },
	properties = { tag = tags[1][1] } },
}
