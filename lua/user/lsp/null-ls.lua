local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		-- LUA
		formatting.stylua,

		-- PRETTIER
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote" } }),

		-- JAVASCRIPT
		diagnostics.eslint,

		-- ELIXIR
		diagnostics.credo,
		formatting.mix,
		formatting.htmlbeautifier.with({
			extra_args = { "-b", "1" },
			filetypes = { "eelixir", "html.eex", "html.leex" },
		}),

		-- PYTHON
		formatting.black.with({ extra_args = { "--fast" } }),

		-- OPENAPI
		-- diagnostics.vacuum,
		-- diagnostics.spectral,

		-- YAML
		-- diagnostics.yamllint
		-- formatting.yamlfix,

		-- GITHUB ACTIONS
		diagnostics.actionlint,

		-- SQL
		-- formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }), -- formatting is done with sqls
		diagnostics.sqlfluff.with({ extra_args = { "--dialect", "ansi" } }),
		forma,
	},
})
