local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

-- Debugging

-- Elixir
dap.adapters.mix_task = {
  type = 'executable',
  -- command = '/Users/marwen/.local/share/nvim/lsp_servers/elixir/elixir-ls/debugger.sh', -- debugger.bat for windows
  command = '/Users/marwen/.elixir-ls/release/debugger.sh', -- debugger.bat for windows
  args = {}
}

-- dap.configurations.elixir = {
--   {
--     type = "mix_task",
--     name = "mix test",
--     task = 'test',
--     taskArgs = { "--trace" },
--     request = "launch",
--     startApps = true, -- for Phoenix projects
--     projectDir = "${workspaceFolder}",
--     requireFiles = {
--       "test/**/test_helper.exs",
--       "test/**/*_test.exs"
--     }
--   },
-- }

dap.configurations.elixir = {
  -- {
  --   type = "mix_task",
  --   name = "mix",
  --   request = "launch",
  --   projectDir = "${workspaceFolder}"
  -- },
  {
    type = "mix_task",
    name = "phx.server",
    task = "phx.server",
    request = "launch",
    projectDir = "${workspaceFolder}"
  }

}
