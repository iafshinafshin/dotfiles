local status, zen_mode = pcall(require, "zen-mode")
if not status then
  return
end

zen_mode.setup({
  plugins = { gitsigns = true, tmux = true, kitty = { enabled = false, font = "+2" } }
})

vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<CR>", { desc = "Zen Mode" })
