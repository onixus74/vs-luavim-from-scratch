local status_ok, cmdline = pcall(require, "noice")
if not status_ok then
  return
end

cmdline.setup()
