local status = pcall(require, "lazygit")
if not status then return end
vim.keymap.set("n", "<leader>gg", ":LazyGit<Return>", { desc = "Lazygit" })
