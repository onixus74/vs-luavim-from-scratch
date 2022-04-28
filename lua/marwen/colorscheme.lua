vim.cmd [[
  try
    set background=dark
    colorscheme onedarker
    " colorscheme palenight
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

-- Shade
require "shade".setup({
  overlay_opacity = 70,
})

-- Colorizer
require 'colorizer'.setup()
