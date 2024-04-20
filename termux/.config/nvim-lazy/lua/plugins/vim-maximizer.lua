return {
	"szw/vim-maximizer",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>s", "<cmd>MaximizerToggle<CR>", desc = "Maximize Minimize Current Split" },
	},
}
