local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Neovim Lua Development
	use("nvim-lua/popup.nvim")  -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- NvimTree
	use("nvim-tree/nvim-tree.lua")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- StatusLine
	use("nvim-lualine/lualine.nvim")

	use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("navarasu/onedark.nvim")

	-- Colorizer
	use("norcalli/nvim-colorizer.lua")

	-- TMUX
	use("aserowy/tmux.nvim")

	-- LazyGit
	use("kdheepak/lazygit.nvim")

	-- WhichKey
	-- use "folke/which-key.nvim"

	-- Easymotion
	use("easymotion/vim-easymotion")

	-- Smoothscroll
	use("karb94/neoscroll.nvim")

	-- Scroll map
	use("lewis6991/satellite.nvim")

	-- Folding
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	})

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("ThePrimeagen/git-worktree.nvim")

	-- Gitmoji
	-- use 'Kachyz/vim-gitmoji'
	use("bruxisma/gitmoji.vim")

	-- TODO: add keymaps <06-07-22 > --
	use("sindrets/diffview.nvim")

	-- Github reviews
	use("pwntester/octo.nvim")

	-- Shade
	-- use 'sunjon/shade.nvim'

	-- Wakatime
	use("wakatime/vim-wakatime")

	-- Comments
	use("numToStr/Comment.nvim")

	-- Indentation line
	use("lukas-reineke/indent-blankline.nvim")

	-- Autopairs
	use("windwp/nvim-autopairs")

	-- Close buffers without closing pane
	use("moll/vim-bbye")

	-- Polyglot (Instead of treesitter)
	use("sheerun/vim-polyglot")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Bookmarks
	use("MattesGroeger/vim-bookmarks")

	-- Markdown preview
	-- use "frabjous/knap"
	use("ellisonleao/glow.nvim")

	-- Mermaid diagram
	use({
		"3rd/diagram.nvim",
		requires = {
			"3rd/image.nvim",
		},
	})

	-- vim-abolish

	-- Multi cursor
	use("mg979/vim-visual-multi")

	-- Elixir Tools
	use("Matsa59/potion-maker.nvim")

	-- Typescript Tools
	use("SaschaMendel/vim-quicktype")

	-- SQL Tools
	use("nanotee/sqls.nvim")

	-- Flutter Tools
	use("akinsho/flutter-tools.nvim")

	-- Debugging
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
	use("nvim-telescope/telescope-dap.nvim")
	use("rcarriga/cmp-dap")
	use("theHamsta/nvim-dap-virtual-text")

	-- Formatting
	-- use "lukas-reineke/lsp-format.nvim" -- NOT USED

	-- LSP
	use("williamboman/mason.nvim")        -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")          -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Highlighting
	use("RRethy/vim-illuminate")

	-- Images Preview
	-- use 'edluffy/hologram.nvim'

	-- Ultisnips Snippets
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use("SirVer/ultisnips")
	use("honza/vim-snippets") -- a bunch of snippets to use

	-- Autocomplete
	use("hrsh7th/nvim-cmp")    -- The completion plugin
	use("hrsh7th/cmp-buffer")  -- buffer completions
	use("hrsh7th/cmp-path")    -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP snippet completions
	use("hrsh7th/cmp-emoji")   -- Emoji completions

	-- use "hrsh7th/cmp-nvim-lsp-signature-help" -- LSP signature help completions
	use("ray-x/cmp-treesitter") -- Treesitter completions

	-- Code Outline
	use({
		"stevearc/aerial.nvim",

		config = function()
			require("aerial").setup({
				backends = { "lsp", "treesitter", "markdown" },
				filter_kind = false,
			})
		end,
	})

	-- Bufkill
	use("qpkorr/vim-bufkill")

	-- CSV
	-- use("chrisbra/csv.vim")

	use {
		'hat0uma/csvview.nvim',
		config = function()
			require('csvview').setup()
		end
	}

	-- Yaml Companion
	use({
		"someone-stole-my-name/yaml-companion.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	})

	-- Firenvim
	-- use({
	-- 	"glacambre/firenvim",
	-- 	run = function()
	-- 		vim.fn["firenvim#install"](0)
	-- 	end,
	-- })

	-- Tabnine
	use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- Gh Copilot
	-- use { 'github/copilot.vim' }
	-- use { 'hrsh7th/cmp-copilot' }

	-- Gh Copilot Alternative
	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 		})
	-- 	end,
	-- })
	--
	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- })

	-- WIP Avante.nvim - Cursor AI Alternative

	use { 'stevearc/dressing.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'MunifTanjim/nui.nvim' }

	use {
		'yetone/avante.nvim',
		run = "make", -- or "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" for Windows
		requires = {
			{ 'nvim-treesitter/nvim-treesitter' },
			{ 'stevearc/dressing.nvim' },
			{ 'nvim-lua/plenary.nvim' },
			{ 'MunifTanjim/nui.nvim' },
			{ 'nvim-tree/nvim-web-devicons' }, -- optional, for file icons
			{ 'zbirenbaum/copilot.lua' },   -- optional, for Copilot integration
			{
				'HakonHarnes/img-clip.nvim',
				config = function()
					require('img-clip').setup({
						default = {
							embed_image_as_base64 = false,
							prompt_for_file_name = false,
							use_absolute_path = true, -- required for Windows users
							drag_and_drop = {
								insert_mode = true,
							},
						},
					})
				end,
			},
			{
				'MeanderingProgrammer/render-markdown.nvim',
				config = function()
					require('render-markdown').setup({
						file_types = { "markdown", "Avante" },
					})
				end,
			},
		},
	}
	-- END WIP Avante.nvim - Cursor AI Alternative

	-- Ollama LLMs
	use("David-Kunz/gen.nvim")

	-- Obisdian
	use({
		"epwalsh/obsidian.nvim",
		tag = "*", -- recommended, use latest release instead of latest commit
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	--- Noice
	use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })

	-- Github Notifications
	use({
		"rlch/github-notifications.nvim",
		config = [[require('github-notifications')]],
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
end)
