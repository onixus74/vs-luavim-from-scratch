local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }

-- vim.o.foldcolumn = "auto:3"
-- vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldenable = true
vim.o.foldlevelstart = 99
-- vim.o.foldminlines = 19

local ftMap = {
	vim = "indent",
	python = { "indent" },
	eelixir = { "indent" },
	git = "",
}

ufo.setup({
	open_fold_hl_timeout = 150,
	close_fold_kinds_for_ft = {
		default = { "imports", "comment" },
		json = { "array" },
		c = { "comment", "region" },
	},
	preview = {
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winhighlight = "Normal:Folded",
			winblend = 0,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
			jumpTop = "[",
			jumpBot = "]",
		},
	},
	provider_selector = function(bufnr, filetype, buftype)
		if ftMap[filetype] then
			return ftMap[filetype]
		end

		return { "treesitter", "indent" }
	end,
})

vim.keymap.set("n", "zR", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)
vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds)
vim.keymap.set("n", "zm", ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
