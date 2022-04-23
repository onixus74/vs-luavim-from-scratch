local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end
---Includes `<leader>cc`, `<leader>cb`, `<leader>c[count]{motion}` and `gb[count]{motion}`
comment.setup {
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>cc',
    ---Block-comment toggle keymap
    block = '<leader>cb',
  }, 
  opleader = {
    ---Line-comment keymap
    line = '<leader>c',
    ---Block-comment keymap
    -- block = 'gb',
  },
}
