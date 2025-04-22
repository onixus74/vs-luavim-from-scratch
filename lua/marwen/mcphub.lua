local status_ok, mcphub = pcall(require, "mcphub")
if not status_ok then
  return
end

mcphub.setup({
  -- Required options
  port = 3088,                                                     -- Port for MCP Hub server
  config = "/Users/marwen/.dotfiles/.config/nvim/mcpservers.json", -- Path to config file
  -- This sets vim.g.mcphub_auto_approve to false by default (can also be toggled from the HUB UI with `ga`)
  auto_approve = true,

  -- Optional options
  on_ready = function(hub)
    -- Called when hub is ready
    vim.notify("MCP Hub is ready", vim.log.levels.INFO)
  end,
  on_error = function(err)
    -- Called on errors
    vim.notify("MCP Hub error: " .. err, vim.log.levels.ERROR)
  end,
  shutdown_delay = 0, -- Wait 0ms before shutting down server after last client exits
  log = {
    level = vim.log.levels.WARN,
    to_file = false,
    file_path = nil,
    prefix = "MCPHub"
  },
})
