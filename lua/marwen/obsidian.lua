local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
	return
end

obsidian.setup({
	workspaces = {
		{
			name = "onixus74_macos",
			path = "/Users/marwen/Desktop/_workspace/_tools/obsidian/onixus74",
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
