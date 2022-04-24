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
  use "akinsho/bufferline.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "drewtempelmeyer/palenight.vim"

  -- TMUX
  use "aserowy/tmux.nvim"

  -- Easymotion
  use "easymotion/vim-easymotion"

  -- Smoothscroll
  use "karb94/neoscroll.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Comments
  use "numToStr/Comment.nvim"

  -- Indentation line
  use "lukas-reineke/indent-blankline.nvim"

  -- Autopairs
  use "windwp/nvim-autopairs" 

  -- Close buffers without closing pane
  use "moll/vim-bbye"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- autocomplete and snippets
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")

  use("onsails/lspkind-nvim")
end)
