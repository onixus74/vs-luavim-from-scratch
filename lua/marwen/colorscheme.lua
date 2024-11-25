-- vim.cmd([[
--   try
--     set background=dark
--     "colorscheme palenight
--     "colorscheme onedark
--     colorscheme onedarker
--     "colorscheme onedarkpro
--   catch /^Vim\%((\a\+)\)\=:E185/
--     colorscheme default
--     set background=dark
--   endtry
-- ]])

-- Shade
-- require "shade".setup({
--   overlay_opacity = 70,
-- })

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	return
end

onedark.setup({
	-- Main options --
	-- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	style = "warmer",

	transparent = false,         -- Show/hide background
	term_colors = true,          -- Change terminal color as per the selected theme style
	ending_tildes = false,       -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = "<leader>cs",                                                    -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"

	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "italic",
		functions = "italic",
		strings = "italic",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {},    -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true,   -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})

onedark.load()

-- Colorizer
require("colorizer").setup()
