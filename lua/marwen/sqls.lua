local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local sqls_status_ok, sqls = pcall(require, "sqls")
if not sqls_status_ok then
	return
end

lspconfig.sqls.setup({
	on_attach = function(client, bufnr)
		-- disable sqls formatting in favor of sql-formatter via null_ls
		client.server_capabilities.documentFormattingProvider = false

		sqls.on_attach(client, bufnr) -- require sqls.nvim
	end,
	settings = {
		sqls = {
			connections = {
				{
					alias = "copia_dev",
					driver = "postgresql",
					dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=postgres dbname=copia_dev sslmode=disable",
				},
				{
					alias = "clickhouse",
					driver = "mysql",
					dataSourceName = "default:@tcp(127.0.0.1:9004)/default",
				},
			},
		},
	},
})
