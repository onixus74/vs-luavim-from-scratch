local status_ok, genLLM = pcall(require, "gen")
if not status_ok then
	return
end

local ops = {
	-- model = "llama2",       -- The default model to use.
	model = "codellama", -- The default model to use.
	host = "localhost",
	port = "11434",
	display_mode = "split", -- The display mode. Can be "float" or "split".
	show_prompt = true,    -- Shows the Prompt submitted to Ollama.
	show_model = true,     -- Displays which model you are using at the beginning of your chat session.
	no_auto_close = true,  -- Never closes the window automatically.
	-- init = function(options)
	-- 	pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
	-- end,
	init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
	-- Function to initialize Ollama
	command = function(options)
		return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
	end,
	-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
	-- This can also be a lua function returning a command string, with options as the input parameter.
	-- The executed command must return a JSON object with { response, context }
	-- (context property is optional).
	-- list_models = "<omitted lua function>", -- Retrieves a list of model names
	debug = false, -- Prints errors and the command which is run.
}

genLLM.setup(ops)
