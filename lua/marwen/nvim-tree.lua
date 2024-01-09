-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local api_status_ok, api = pcall(require, "nvim-tree.api")
if not api_status_ok then
  return
end


local function my_on_attach(bufnr)
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open horizontal'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open vertical'))
end

nvim_tree.setup {
  on_attach = my_on_attach,
  renderer = {
    root_folder_modifier = ":t",
    root_folder_label = true,
    indent_width = 2,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 50,
    side = "right",
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = true,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
  },
  disable_netrw = true,
  hijack_netrw = true,
}






-- OLD
-- nvim_tree.setup {
--   disable_netrw = true,
--   hijack_netrw = true,
--   -- ignore_ft_on_setup = {
--   --   "startify",
--   --   "dashboard",
--   --   "alpha",
--   -- },
--   open_on_tab = false,
--   hijack_cursor = false,
--   update_cwd = true,
--   diagnostics = {
--     enable = true,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     },
--   },
--   update_focused_file = {
--     enable = true,
--     update_cwd = false,
--     ignore_list = {},
--   },
--   system_open = {
--     cmd = nil,
--     args = {},
--   },
--   filters = {
--     dotfiles = true,
--     custom = {},
--   },
--   git = {
--     enable = true,
--     ignore = true,
--     timeout = 500,
--   },
--   filesystem_watchers = {
--     enable = true,
--     debounce_delay = 50,
--   },
--   view = {
--     width = 50,
--     hide_root_folder = false,
--     side = "right",
--     mappings = {
--       custom_only = false,
--       list = {
--         { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
--         { key = "h",                  cb = tree_cb "close_node" },
--         { key = "v",                  cb = tree_cb "vsplit" },
--       },
--     },
--     number = false,
--     relativenumber = false,
--     float = {
--       enable = false,
--       open_win_config = {
--         relative = "editor",
--         border = "rounded",
--         width = 30,
--         height = 30,
--         row = 1,
--         col = 1,
--       },
--     },
--   },
--   trash = {
--     cmd = "trash",
--     require_confirm = true,
--   },
--   renderer = {
--     indent_width = 2,
--     icons = {
--       webdev_colors = true,
--       show = {
--         file = true,
--         folder = true,
--         folder_arrow = false,
--         git = true,
--       },
--       glyphs = {
--         default = "",
--         symlink = "",
--         git = {
--           unstaged = "",
--           staged = "S",
--           unmerged = "",
--           renamed = "➜",
--           deleted = "",
--           untracked = "U",
--           ignored = "◌",
--         },
--         folder = {
--           default = "",
--           open = "",
--           empty = "",
--           empty_open = "",
--           symlink = "",
--         },
--       }
--     },
--     indent_markers = {
--       enable = true,
--       inline_arrows = true,
--       icons = {
--         corner = "└",
--         edge = "│",
--         item = "│",
--         bottom = "─",
--         none = " ",
--       },
--     },
--   },
-- }
