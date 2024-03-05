local status, zenMode = pcall(require, "zen-mode")
if not status then
	return
end

zenMode.setup({
	plugins = {
		gitsigns = true,
		tmux = true,
		kitty = { enabled = false, font = "+2" },
	},
})

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { silent = true, expr = true, desc = "Zen Mode" })
