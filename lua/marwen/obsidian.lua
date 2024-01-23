local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
  return
end

obsidian.setup({
  workspaces = {
    {
      name = "personal",
      path = "~/vaults/personal",
    },
    {
      name = "work",
      path = "~/vaults/work",
    },
  },

  -- see below for full list of options 👇
})
