local status_ok, noice = pcall(require, "noice")
if not status_ok then
	return
end

noice.setup({
	notify = {
		view = "mini",
	},
	messages = {
		view = "mini",
		view_error = "mini",
		view_warn = "mini",
	},
})
