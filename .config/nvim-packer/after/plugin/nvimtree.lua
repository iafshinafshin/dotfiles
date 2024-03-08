local status, nvim_tree = pcall(require, "nvim-tree")
if not status then return end


-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

-- configure nvim-tree
nvim_tree.setup({
  view = {
    width = 35,
    relativenumber = false,
    number = false,
  },
  -- change folder arrow icons
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "󰆤",
        modified = "●",
        folder = {
          -- arrow_closed = "",
          -- arrow_open = "",
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "󰄱",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "✖",
          ignored = "",
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  filters = {
    custom = { ".DS_Store" },
  },
  git = {
    ignore = false,
  },
})

-- set keymaps
local keymap = vim.keymap

keymap.set("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
