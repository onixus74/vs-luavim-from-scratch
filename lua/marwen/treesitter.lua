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
    "help",
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
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
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
  }
}
