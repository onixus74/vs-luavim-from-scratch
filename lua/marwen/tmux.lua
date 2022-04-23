local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
  return
end

tmux.setup {
  navigation = {
      -- enables default keybindings (C-hjkl) for normal mode
      enable_default_keybindings = true,
  }
}
