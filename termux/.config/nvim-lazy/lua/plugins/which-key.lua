return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		require("which-key").register({
			["<Leader>"] = {
				g = {
					name = "Git",
					t = {
						name = "Git With Telescope",
					},
				},
				e = {
					name = "Trees",
				},
				l = {
					name = "Lsp",
					l = {
						name = "Lint",
					},
				},
			},
		})
	end,
}
