vim.cmd [[
  try
    set background=dark
    "colorscheme palenight
    "colorscheme onedark
    colorscheme onedarker
    "colorscheme onedarkpro
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

-- Shade
-- require "shade".setup({
--   overlay_opacity = 70,
-- })


-- Onedark (navarasu/onedark.nvim)
require('onedark').setup {
  style = 'cool',
  -- style = 'deep',
  toggle_style_key = '<leader>cs'
}
require('onedark').load()


-- Onedark Pro (olimorris/onedarkpro.nvim)
-- require "onedarkpro".setup({
--   dark_theme = 'onedark_vivid',
-- })

-- require('onedarkpro').load()


-- Colorizer
require 'colorizer'.setup()
