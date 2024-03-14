return {
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				direction = "horizontal",
				float_opts = {
					border = "curved",
					width = 90,
					height = 40,
				},
			})
		end,
	},
}
