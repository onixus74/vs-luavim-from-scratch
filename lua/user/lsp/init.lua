local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.dap"

-- Tilt dev
lsp_config.tilt_ls.setup({})
