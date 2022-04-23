vim.cmd [[
try
  "colorscheme palenight
  colorscheme onedarker
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
