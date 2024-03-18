return {
	{ "nvim-lua/plenary.nvim", lazy = true }, -- lua functions that many plugins use
	{
		"Wansmer/treesj",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local keymap = vim.keymap
			local tsj = require("treesj")

			tsj.setup({
				use_default_keymaps = false,
			})
			keymap.set("n", "<leader>j", require("treesj").toggle, { desc = "Floating table functions" })
			keymap.set("n", "<leader>J", function()
				require("treesj").toggle({ split = { recursive = true } })
			end, { desc = "Floating table functions" })
		end,
	},
	{
		"iafshinafshin/end-tag.nvim",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		config = function()
			require("end-tag").setup()
		end,
	},
}
