--[[
simple mail widget
count mails from MailBoxes

open mutt on click
--]]
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")

local text = "Mail: "

function read_maildir(dir)
	local count = 0
	local f = io.popen("find " .. dir .. " -type f -wholename '*/new/*' | wc -l")
	if f == nil then return 0 end
	count = f:read()
	f:close()

	return count
end

function check_mails()
	local count = 0

	for i=1,#mailboxes do
		count = count + read_maildir(mailboxes[i][2])
	end
	
	local msg = text .. count
	if count ~= 0 then
		msg = '<span color="#FF0000">' .. msg .. '</span>'
	end
	mailwidget:set_markup(msg)
end

--set widget
mailwidget = wibox.widget.textbox()
mailwidget:set_text(text .. '?')

mailwidget:buttons(
	awful.util.table.join(awful.button({ }, 1, 
		function()
			awful.util.spawn(terminal .. " -e mutt")
		end
	))
)

local mailtimer = timer({ timeout = 60 })
mailtimer:connect_signal("timeout", check_mails)
mailtimer:start()
check_mails()

widget_add(mailwidget)
