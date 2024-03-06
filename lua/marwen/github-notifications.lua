local status_ok, github_notifications = pcall(require, "github-notifications")
if not status_ok then
	return
end

github_notifications.setup({
	username = "onixus74",
	token = "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",
})
