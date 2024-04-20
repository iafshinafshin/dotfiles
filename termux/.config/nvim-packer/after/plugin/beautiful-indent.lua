local status, indent = pcall(require, "ibl")
if not status then return end
local status1, anim_indent = pcall(require, "mini.indentscope")
if not status1 then return end

anim_indent.setup({
  -- symbol = "▏",
  symbol = "│",
  options = { try_as_border = true },
})

indent.setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
})
