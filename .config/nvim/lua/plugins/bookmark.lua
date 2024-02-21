return {
	"MattesGroeger/vim-bookmarks",
	lazy = false,
	dependencies = {
		"tom-anders/telescope-vim-bookmarks.nvim",
	},
	config = function()
		vim.g.bookmark_sign = "♥"
		vim.g.bookmark_highlight_lines = 1
		require("telescope").load_extension("vim_bookmarks")
	end,
	keys = {
		{
			"n",
			"<leader>ma",
			'<cmd>lua require("telescope").extensions.vim_bookmarks.all()<cr>',
			desc = "Show bookmarks all files",
		},
		{
			"n",
			"<leader>mc",
			'lua require("telescope").extensions.vim_bookmarks.current_file()<Return>',
			desc = "Show bookmarks current files",
		},
	},
}
