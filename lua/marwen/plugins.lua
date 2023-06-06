local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Neovim Lua Development
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- NvimTree
  use "kyazdani42/nvim-tree.lua"

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- StatusLine
  use "nvim-lualine/lualine.nvim"

  use { 'akinsho/bufferline.nvim', tag = "v2.5.1", requires = 'kyazdani42/nvim-web-devicons' }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"
  -- use "projekt0n/github-nvim-theme"
  -- use "drewtempelmeyer/palenight.vim"
  -- use "Cybolic/palenight.vim"
  -- use 'joshdick/onedark.vim'
  use 'navarasu/onedark.nvim'
  -- use 'olimorris/onedarkpro.nvim'

  -- Colorizer
  use "norcalli/nvim-colorizer.lua"

  -- TMUX
  use "aserowy/tmux.nvim"

  -- LazyGit
  use "kdheepak/lazygit.nvim"

  -- WhichKey
  -- use "folke/which-key.nvim"

  -- Easymotion
  use "easymotion/vim-easymotion"

  -- Smoothscroll
  use "karb94/neoscroll.nvim"

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'ThePrimeagen/git-worktree.nvim'

  -- Gitmoji
  -- use 'Kachyz/vim-gitmoji'
  use 'bruxisma/gitmoji.vim'


  -- TODO: add keymaps <06-07-22 > --
  use 'sindrets/diffview.nvim'

  -- Github reviews
  use "pwntester/octo.nvim"

  -- Shade
  -- use 'sunjon/shade.nvim'

  -- Wakatime
  use 'wakatime/vim-wakatime'

  -- Comments
  use "numToStr/Comment.nvim"

  -- Indentation line
  use "lukas-reineke/indent-blankline.nvim"

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- Close buffers without closing pane
  use "moll/vim-bbye"

  -- Polyglot (Instead of treesitter)
  use 'sheerun/vim-polyglot'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'p00f/nvim-ts-rainbow'
  use 'nvim-treesitter/nvim-treesitter-textobjects'


  -- Bookmarks
  use "MattesGroeger/vim-bookmarks"

  -- Markdown preview
  use "frabjous/knap"

  -- Multi cursor
  -- use "mg979/vim-visual-multi"

  -- Elixir Tools
  use 'Matsa59/potion-maker.nvim'

  -- Typescript Tools
  use 'SaschaMendel/vim-quicktype'

  -- Flutter Tools
  use "akinsho/flutter-tools.nvim"

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'rcarriga/nvim-dap-ui'
  use 'rcarriga/cmp-dap'
  use 'theHamsta/nvim-dap-virtual-text'

  -- Formatting
  -- use "lukas-reineke/lsp-format.nvim" -- NOT USED

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- SchemaStore
  -- use "b0o/schemastore.nvim"

  -- Snippy Snippets (Not USED)
  -- use "dcampos/nvim-snippy" --snippet engine
  -- use "dcampos/cmp-snippy" -- Snippy snippet completions
  -- use "honza/vim-snippets" -- a bunch of snippets to use

  -- Ultisnips Snippets
  use "quangnguyen30192/cmp-nvim-ultisnips"
  use "SirVer/ultisnips"
  use "honza/vim-snippets" -- a bunch of snippets to use

  -- Autocomplete
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP snippet completions
  use "hrsh7th/cmp-emoji" -- Emoji completions


  -- use "hrsh7th/cmp-nvim-lsp-signature-help" -- LSP signature help completions
  use "ray-x/cmp-treesitter" -- Treesitter completions

  -- Code Outline
  use {
    'stevearc/aerial.nvim',

    config = function() require('aerial').setup({
        backends = { "lsp", "treesitter", "markdown" },
        filter_kind = false
      })
    end
  }

  -- Firenvim
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
  }

  -- Dash
  -- use({
  --   'mrjones2014/dash.nvim',
  --   run = 'make install',
  -- })


  -- tabnine
  -- use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
  -- use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

  -- Gh Copilot
  -- use { 'github/copilot.vim' }
  -- use { 'hrsh7th/cmp-copilot' }

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }



  -- Tilt.dev / Starlark
  -- use "cappyzawa/starlark.vim"

end)
