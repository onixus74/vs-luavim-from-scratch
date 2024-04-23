local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end


lspconfig.sqls.setup {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr) -- require sqls.nvim
  end,
  settings = {
    sqls = {
      connections = {
        -- {
        --   driver = 'mysql',
        --   dataSourceName = 'root:root@tcp(127.0.0.1:13306)/world',
        -- },
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=postgres dbname=copia_dev sslmode=disable',
        },
      },
    },
  },
}
