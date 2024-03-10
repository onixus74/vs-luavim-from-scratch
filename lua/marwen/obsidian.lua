local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
	return
end

local os = require("os").getenv("OS")

local function get_obsidian_directory()
	if os == "macos" then
		return "/Users/marwen/Desktop/_workspace/_tools/obsidian/onixus74"
	else
		return "/mnt/c/Users/marwe/OneDrive/Desktop/_workspace/_onixus74/onixus74.md"
	end
end

obsidian.setup({
	workspaces = {
		{
			name = "onixus74_macos",
			path = get_obsidian_directory(),
		},
	},
	new_notes_location = "Inbox",
	notes_subdir = "notes",

	templates = {
		subdir = "_/templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
	},
	attachments = {
		img_folder = "_/attachements",
	},

	-- see below for full list of options 👇
})
