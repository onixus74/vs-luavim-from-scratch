local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    -- Layout
    sorting_strategy = "ascending",

    -- layout_strategy = 'bottom_pane',
    -- layout_strategy = 'horizontal',
    -- layout_config = { horizontal = { prompt_position = 'top'}, height = 0.95 },

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        --["<C-n>"] = actions.cycle_history_next,
        --["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        -- ["q"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<C-c>"] = actions.close,
        -- ["q"] = actions.close,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker

    -- Ex
    -- find_files = {
    --  theme = "ivy",
    -- }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure

    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },

    dap = {

    },

    git_worktree = {
    },

    dash = {
      -- -- configure path to Dash.app if installed somewhere other than /Applications/Dash.app
      -- dash_app_path = '/Applications/Dash.app',
      -- -- search engine to fall back to when Dash has no results, must be one of: 'ddg', 'duckduckgo', 'startpage', 'google'
      -- search_engine = 'ddg',
      -- -- debounce while typing, in milliseconds
      -- debounce = 0,
      -- -- map filetype strings to the keywords you've configured for docsets in Dash
      -- -- setting to false will disable filtering by filetype for that filetype
      -- -- filetypes not included in this table will not filter the query by filetype
      -- -- check src/lua_bindings/dash_config_binding.rs to see all defaults
      -- -- the values you pass for file_type_keywords are merged with the defaults
      -- -- to disable filtering for all filetypes,
      -- -- set file_type_keywords = false
      -- file_type_keywords = {
      --   dashboard = false,
      --   NvimTree = false,
      --   TelescopePrompt = false,
      --   terminal = false,
      --   packer = false,
      --   fzf = false,
      --   -- a table of strings will search on multiple keywords
      --   javascript = { 'javascript', 'nodejs' },
      --   typescript = { 'typescript', 'javascript', 'nodejs' },
      --   typescriptreact = { 'typescript', 'javascript', 'react' },
      --   javascriptreact = { 'javascript', 'react' },
      --   -- you can also do a string, for example,
      --   -- sh = 'bash'
      -- }
    }
  }
}

-- Fzf extension
telescope.load_extension("fzf")

-- DAP extension
telescope.load_extension("dap")

-- Flutter extension
telescope.load_extension("flutter")

-- Fallback to find_files if not git_files
local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then require "telescope.builtin".find_files(opts) end
end

return M
