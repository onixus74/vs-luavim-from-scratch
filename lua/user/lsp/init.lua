local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.dap")

-- NullLS used only when something is not working well in Mason
require("user.lsp.null-ls")

-- Tilt dev
lsp_config.tilt_ls.setup({})
