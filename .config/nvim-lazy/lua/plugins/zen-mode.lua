return {
	"folke/zen-mode.nvim",
	lazy = true,
	opts = function()
		vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<CR>", { desc = "Zen Mode" })
		return {
			plugins = {
				lspsaga = false,
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		}
	end,
}
