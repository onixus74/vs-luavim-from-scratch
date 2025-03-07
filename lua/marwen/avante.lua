local status_ok, avante = pcall(require, "avante")
if not status_ok then
  return
end


avante.setup({
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | "ollama" | string
  provider = "claude",                  -- Recommend using Claude
  auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
  cursor_applying_provider = 'claude',  -- In this example, use Groq for applying, but you can also use any provider you want.
  -- web_search_engine = {
  --   provider = "searxng",                -- tavily, serpapi, searchapi, google or kagi
  -- },
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-7-sonnet-latest",
    temperature = 0,
    max_tokens = 8192,
  },
  vendors = {
    ollama_deepseek = {
      __inherited_from = "openai",
      api_key_name = "",
      endpoint = "http://127.0.0.1:11434/v1",
      model = "deepseek-r1:8b",
      temperature = 0,
    },
    groq = { -- define groq provider
      __inherited_from = 'openai',
      api_key_name = 'GROQ_API_KEY',
      endpoint = 'https://api.groq.com/openai/v1/',
      model = 'llama-3.3-70b-versatile',
      max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
    },
  },
  dual_boost = {
    enabled = false,
    first_provider = "openai",
    second_provider = "ollama_deepseek",
    prompt =
    "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
    timeout = 60000, -- Timeout in milliseconds
  },
  behaviour = {
    auto_suggestions = true,            -- Experimental stage
    enable_cursor_planning_mode = true, -- enable cursor planning mode!
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
  },
  mappings = {
    --- @class AvanteConflictMappings
    diff = {
      ours = "co",
      theirs = "ct",
      all_theirs = "ca",
      both = "cb",
      cursor = "cc",
      next = "]x",
      prev = "[x",
    },
    suggestion = {
      accept = "<S-Tab>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    sidebar = {
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
    },
  },
  hints = { enabled = true },
  windows = {
    ---@type "right" | "left" | "top" | "bottom"
    position = "right", -- the position of the sidebar
    wrap = true,        -- similar to vim.o.wrap
    width = 30,         -- default % based on available width
    sidebar_header = {
      align = "right",  -- left, center, right for title
      rounded = false,
    },
    edit = {
      border = "rounded",
      start_insert = false, -- Start insert mode when opening the edit window
    },
    ask = {
      floating = false,     -- Open the 'AvanteAsk' prompt in a floating window
      start_insert = false, -- Start insert mode when opening the ask window
      border = "rounded",
      ---@type "ours" | "theirs"
      focus_on_apply = "ours", -- which diff to focus after applying
    },
  },
  highlights = {
    ---@type AvanteConflictHighlights
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  --- @class AvanteConflictUserConfig
  diff = {
    autojump = true,
    ---@type string | fun(): any
    list_opener = "copen",
  },
})

require("avante_lib").load()
