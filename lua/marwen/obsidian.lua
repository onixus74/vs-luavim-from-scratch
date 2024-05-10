local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
	return
end

local os = vim.loop.os_uname().sysname

local function get_obsidian_directory()
	if os == "Darwin" then
		return "/Users/marwen/Desktop/_workspace/_onixus74/onixus74.md"
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
})
