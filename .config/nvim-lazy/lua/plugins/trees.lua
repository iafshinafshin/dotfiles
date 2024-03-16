return {
	{
		"nvim-tree/nvim-tree.lua",
		event = { "BufReadPre", "BufNewFile" },
		-- lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local nvimtree = require("nvim-tree")

			-- recommended settings from nvim-tree documentation
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- change color for arrows in tree to light blue
			vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
			vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

			-- configure nvim-tree
			nvimtree.setup({
				view = {
					width = 30,
					relativenumber = false,
					number = false,
					signcolumn = "no",
				},
				-- change folder arrow icons
				renderer = {
					indent_markers = {
						enable = true,
					},
					icons = {
						glyphs = {
							default = "",
							symlink = "",
							bookmark = "󰆤",
							modified = "●",
							folder = {
								-- arrow_closed = "",
								-- arrow_open = "",
								arrow_closed = "", -- arrow when folder is closed
								arrow_open = "", -- arrow when folder is open
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "󰄱",
								staged = "",
								unmerged = "",
								renamed = "➜",
								untracked = "",
								deleted = "✖",
								ignored = "",
							},
						},
					},
				},
				-- disable window_picker for
				-- explorer to work well with
				-- window splits
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
				filters = {
					custom = { ".DS_Store" },
				},
				git = {
					ignore = false,
				},
			})

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" }) -- toggle file explorer
		end,
	},
	{
		"mbbill/undotree",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- require("undotree").setup({})
			local keymap = vim.keymap -- for conciseness
			keymap.set("n", "<leader>eu", ":UndotreeToggle<Return>", { desc = "Undo Tree" }) -- toggle file explorer
		end,
	},
}
