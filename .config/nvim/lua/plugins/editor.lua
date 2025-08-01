return {
	{
		enabled = false,
		"folke/flash.nvim",
		---@type Flash.Config
		opts = {
			search = {
				forward = true,
				multi_window = false,
				wrap = false,
				incremental = true,
			},
		},
	},

	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				hsl_color = {
					pattern = "hsl%(%d+,? %d+,? %d+%)",
					group = function(_, match)
						local utils = require("solarized-osaka.hsl")
						--- @type string, string, string
						local nh, ns, nl = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
						--- @type number?, number?, number?
						local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
						--- @type string
						local hex_color = utils.hslToHex(h, s, l)
						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
					end,
				},
			},
		},
	},

	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},

	{
		"telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				"<leader>fP",
				function()
					require("telescope.builtin").find_files({
						cwd = require("lazy.core.config").options.root,
					})
				end,
				desc = "Find Plugin File",
			},
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					local telescope = require("telescope")
					telescope.setup({
						defaults = {
							file_ignore_pattern = {
								"node_modules",
								"*.png$",
								"*.jpng$",
								"*.jpg$",
								"*.gif$",
								"*.webp$",
								"*.mp4$",
								"*.mp3$",
								"*.mkv$",
							},
						},
					})
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
					-- local ignore_file = require("telescope.defaults.file_ignore_patterns")
				end,
				desc = "Lists files in your current working directory, respects .gitignore",
			},
			{
				";r",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep({
						additional_args = { "--hidden" },
					})
				end,
				desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
			},
			{
				"\\\\",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "Lists open buffers",
			},
			{
				";h",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags()
				end,
				desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
			},
			{
				";;",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume()
				end,
				desc = "Resume the previous telescope picker",
			},
			{
				";b",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
				desc = "Lists Diagnostics for all open buffers or a specific buffer",
			},
			{
				";s",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter()
				end,
				desc = "Lists Function names, variables, from Treesitter",
			},
			{
				"sf",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "Open File Browser with the path of the current buffer",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions
			telescope.defaults = {
				winblend = 70,
			}
			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
			})
			opts.pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			}
			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			}
			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"mrjones2014/legendary.nvim",
		dependencies = {
			"hinell/duplicate.nvim",
		},
		priority = 10000,
		lazy = false,
		config = function()
			local legendary = require("legendary")
			legendary.keymaps({
				-- duplicate
				{
					description = "Line: duplicate up",
					mode = { "n" },
					"<S-A-Up>",
					"<CMD>LineDuplicate -1<CR>",
				},
				{
					description = "Line: duplicate down",
					mode = { "n" },
					"<S-A-Down>",
					"<CMD>LineDuplicate +1<CR>",
				},
				{
					description = "Selection: duplicate up",
					mode = { "v" },
					"<S-A-Up>",
					"<CMD>VisualDuplicate -1<CR>",
				},
				{
					description = "Selection: duplicate down",
					mode = { "v" },
					"<S-A-Down>",
					"<CMD>VisualDuplicate +1<CR>",
				},
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<C-e>",
				function()
					local harpoon = require("harpoon")
					harpoon:list():prev()
				end,
				desc = "Harpoon: Going To Number 4 Window",
			},
			{
				"<C-p>",
				function()
					local harpoon = require("harpoon")
					harpoon:list():next()
				end,
				desc = "Harpoon: Going To Number 4 Window",
			},
		},
		config = function()
			local harpoon = require("harpoon")
			local wk = require("which-key")
			harpoon:setup()

			vim.keymap.set("n", "fa", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "fl", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "fe", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "fi", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "fg", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "fh", function()
				harpoon:list():select(4)
			end)
			-- wk.register({
			-- 	f = {
			-- 		name = "Harpoon",
			-- 		l = {
			-- 			function()
			-- 				harpoon.ui:toggle_quick_menu(require("harpoon"):list())
			-- 			end,
			-- 			"Harpoon: List Of Windows",
			-- 		}, -- additional options for creating the keymap
			-- 		e = {
			-- 			function()
			-- 				harpoon:list():select(1)
			-- 			end,
			-- 			"Harpoon: Going To Number 1 Window",
			-- 		}, -- just a label. don't create any mapping
			-- 		i = {
			-- 			function()
			-- 				harpoon:list():select(2)
			-- 			end,
			-- 			"Harpoon: Going To Number 2 Window",
			-- 		}, -- same as above
			-- 		g = {
			-- 			function()
			-- 				harpoon:list():select(3)
			-- 			end,
			-- 			"Harpoon: Going To Number 3 Window",
			-- 		}, -- same as above
			-- 		h = {
			-- 			function()
			-- 				harpoon:list():select(4)
			-- 			end,
			-- 			"Harpoon: Going To Number 4 Window",
			-- 		}, -- same as above
			-- 		a = {
			-- 			function()
			-- 				harpoon:list():add()
			-- 			end,
			-- 			"Harpoon: Add To List",
			-- 		}, -- create a binding with label
			-- 	},
			-- })
		end,
	},
}
