local status_ok, github_notifications = pcall(require, "github-notifications")
if not status_ok then
	return
end

github_notifications.setup({
	username = "onixus74",
	token = "",
})
