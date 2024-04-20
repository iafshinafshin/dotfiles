return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			-- import comment plugin safely
			local comment = require("Comment")
			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
			-- enable comment
			comment.setup({
				-- for commenting tsx and jsx files
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		-- lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })

			vim.keymap.set("n", "<leader>t", ":TodoTelescope<Return>", { desc = "Todo Comment" })

			require("todo-comments").setup()
		end,
	},
}
