-- return {
-- 		"akinsho/toggleterm.nvim",
-- 		-- lazy = false,
-- 		config = function()
-- 			require("toggleterm").setup({
-- 				open_mapping = [[<c-\>]],
-- 				direction = "horizontal",
-- 				float_opts = {
-- 					border = "curved",
-- 					width = 90,
-- 					height = 40,
-- 				},
-- 			})
-- 		end,
-- }
return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			direction = "float",
			float_opts = {
				border = "curved",
				width = 130,
				height = 30,
			},
		})
	end,
}
