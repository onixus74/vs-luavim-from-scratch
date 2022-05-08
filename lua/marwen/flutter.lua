local status_ok, flutter = pcall(require, "flutter-tools")
if not status_ok then
  return
end

flutter.setup{}
