local status_ok, ogpt = pcall(require, "ogpt")
if not status_ok then
	return
end

ogpt.setup({
	default_provider = {
		-- can also support `textgenui`
		name = "ollama",
		api_host = os.getenv("OLLAMA_API_HOST"),
		api_key = os.getenv("OLLAMA_API_KEY"),
	},
	api_params = {
		-- "llama2", "codellama", "mistral", "mixtral"
		model = "mistral",
		temperature = 0.8,
		top_p = 0.99,
	},
})
