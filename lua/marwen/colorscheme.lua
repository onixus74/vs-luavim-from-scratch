vim.cmd [[
try
  colorscheme onedarker
  "colorscheme palenight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
