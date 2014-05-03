local awful = require("awful")

layouts =
{
	awful.layout.suit.tile,			--1
	awful.layout.suit.tile.bottom,		--2
	awful.layout.suit.spiral.dwindle,	--3
	awful.layout.suit.max,			--4
	awful.layout.suit.magnifier		--5
	--awful.layout.suit.floating,
	--awful.layout.suit.tile.left,
	--awful.layout.suit.max.fullscreen,
	--awful.layout.suit.tile.top,
	--awful.layout.suit.fair,
	--awful.layout.suit.fair.horizontal,
	--awful.layout.suit.spiral,
}

local mytags = {}
mytags[1] = {
	names  = { "web", "coding", "shell", "im", "music", 6, 7, 8, 9 },
	layout = { layouts[1], layouts[1], layouts[1], layouts[1], layouts[2],
		layouts[3], layouts[4], layouts[5], layouts[1]}
}
mytags[2] = {
	names  = { "web", "coding", "mail", "irc", 5, 6, 7, 8, 9 },
	layout = { layouts[1], layouts[1], layouts[1], layouts[1], layouts[2],
		layouts[3], layouts[4], layouts[5], layouts[1]}
}

tags = {}
for s = 1, screen.count() do
	tags[s] = awful.tag(mytags[s].names, s, mytags[s].layout)
end
