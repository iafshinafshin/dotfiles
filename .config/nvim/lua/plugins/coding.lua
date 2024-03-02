return {
	-- Create annotations with one keybind, and jump your cursor in the inserted annotation
	{
		"danymat/neogen",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},

	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		lazy = false,
		eys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	-- Go forward/backward with square brackets
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "down",
		},
	},

	{
		"nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},
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
	{
		"fedepujol/move.nvim",
		lazy = true,
		config = function()
			local opts = { noremap = true, silent = true }
			-- Normal-mode commands
			vim.keymap.set("n", "<A-Up>", ":MoveLine(-1)<CR>", opts)
			vim.keymap.set("n", "<A-Down>", ":MoveLine(1)<CR>", opts)

			-- Visual-mode commands
			vim.keymap.set("v", "<A-Down>", ":MoveBlock(1)<CR>", opts)
			vim.keymap.set("v", "<A-Up>", ":MoveBlock(-1)<CR>", opts)

			line = {
				enable = true, -- Enables line movement
				indent = true, -- Toggles indentation
			}
			block = {
				enable = true, -- Enables block movement
				indent = true, -- Toggles indentation
			}
			word = {
				enable = true, -- Enables word movement
			}
			char = {
				enable = false, -- Enables char movement
			}
		end,
	},
	{
		"f-person/git-blame.nvim",
		lazy = false,
	},
	{
		"kevinhwang91/nvim-ufo",
		lazy = false,
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "lsp", "indent" }
				end,
			})
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
			vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
			vim.keymap.set("n", "zk", require("ufo").peekFoldedLinesUnderCursor)
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })
			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })

			vim.keymap.set("n", "<leader>t", "<cmd>TodoTelescope<cr>", { desc = "Previous todo comment" })

			require("todo-comments").setup()
		end,
	},
	{
		"Wansmer/treesj",
		lazy = false,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local keymap = vim.keymap
			local tsj = require("treesj")

			tsj.setup({
				use_default_keymaps = false,
			})
			keymap.set("n", "<leader>j", require("treesj").toggle)
			keymap.set("n", "<leader>J", function()
				require("treesj").toggle({ split = { recursive = true } })
			end)
		end,
	},
	{
		"mbbill/undotree",
		lazy = false,
		config = function()
			vim.keymap.set("n", "<leader>au", vim.cmd.UndotreeToggle)
		end,
	},
}
