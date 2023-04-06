local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- local snip_status_ok, snippy = pcall(require, "snippy")
-- if not snip_status_ok then
--   return
-- end

local snip_status_ok, ultisnips = pcall(require, "cmp_nvim_ultisnips")
if not snip_status_ok then
  return
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
  Copilot = "",
}

-- snippy.setup({
--   mappings = {
--     is = {
--       ['<CR>'] = 'expand_or_advance',
--       ['<S-CR>'] = 'previous',
--     },
--     nx = {
--       ['<C-c>'] = 'cut_text',
--     },
--   },
-- })

ultisnips.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      -- snippy.expand_snippet(args.body) -- For `snippy` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `UltiSnips` users.
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.

    ["<Tab>"] = cmp.mapping.confirm { select = true },

    -- Ultisnips

    ["<CR>"] = cmp.mapping(
      function(fallback)
        -- ultisnips.mappings.expand_or_jump_forwards(fallback)
        require("cmp_nvim_ultisnips.mappings").expand_or_jump_forwards(fallback)
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
    ["<S-CR>"] = cmp.mapping(
      function(fallback)
        -- ultisnips.mappings.jump_backwards(fallback)
        require("cmp_nvim_ultisnips.mappings").jump_backwards(fallback)
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
    ["<C-CR>"] = cmp.mapping.confirm({
      -- this is the important line
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        -- cmp_tabnine = "[Tab9]",
        copilot = "[Copilot]",
        ultisnips = "[UltiSnips]",
        -- snippy = "[Snippy]",
        nvim_lsp = "[LSP]",
        -- nvim_lsp_signature_help = "[Signature]",
        treesitter = "[Treesitter]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = 'copilot' },
    -- { name = 'cmp_tabnine' },
    { name = "nvim_lsp" },
    -- { name = "nvim_lsp_signature_help" },
    { name = "ultisnips" },
    -- { name = "snippy" },
    { name = "buffer" },
    { name = "treesitter" },
    { name = "emoji" },
    { name = "path" }
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
}

-- DAP CMP
cmp.setup({
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
  end
})

require("cmp").setup.filetype({ "dap-repl", "dapui_watches" }, {
  sources = {
    { name = "dap" },
  },
})
