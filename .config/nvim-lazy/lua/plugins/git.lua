return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		config = function()
			vim.keymap.set("n", "<leader>gg", ":LazyGit<Return>", { desc = "Lazygit" })
		end,
	},
	{
		"dinhhuy258/git.nvim",
		lazy = true,
		opts = {

			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},
}
