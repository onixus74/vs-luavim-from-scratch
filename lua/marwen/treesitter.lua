local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  {
    "c",
    "c_sharp",
    "cpp",
    "bash",
    "dart",
    "dockerfile",
    "eex",
    "elixir",
    "erlang",
    "glsl",
    "heex",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "julia",
    "lua",
    "make",
    "markdown",
    "nix",
    "python",
    "ql",
    "query",
    "regex",
    "ruby",
    "rust",
    "scheme",
    "scss",
    "solidity",
    "surface",
    "svelte",
    "swift",
    "todotxt",
    "toml",
    "typescript",
    "vim",
    "yaml",
    "zig"
  },
  sync_install = true,     -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,    -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    -- disable = { "elixir" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  incremental_selection = {
    enable = true
  },
  rainbow = {
    enable = true,
    disable = { "jsx", "cpp", "svelte" }, -- list of languages you want to disable the plugin for
    extended_mode = true,                 -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,                 -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding xor succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      include_surrounding_whitespace = true,
    },
  },
}
