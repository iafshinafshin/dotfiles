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
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
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
				";t",
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
				";e",
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
		"coffebar/neovim-project",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"Shatur/neovim-session-manager",
				config = function()
					local Path = require("plenary.path")
					local config = require("session_manager.config")
					require("session_manager").setup({
						sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
						session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
						dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.loop.cwd()` if the passed `dir` is `nil`.
						autoload_mode = config.AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
						autosave_last_session = true, -- Automatically save last session on exit and on session switch.
						autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
						autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
						autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
							"gitcommit",
							"gitrebase",
						},
						autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
						autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
						max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
					})
				end,
			},
		},
		lazy = false,
		priority = 100,
		opts = {
			projects = { -- define project roots
				"~/.ghq/github.com/iafshinafshin/*",
				"~/.config/*",
			},
		},
		init = function()
			-- enable saving the state of plugins in the session
			vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
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
				-- project
				{
					description = "find a project based on patterns",
					mode = { "n" },
					"<leader>ad",
					"<CMD>Telescope neovim-project discover<CR>",
				},
				{
					description = "select a project from your recent history",
					mode = { "n" },
					"<leader>ap",
					"<CMD>Telescope neovim-project history<CR>",
				},
			})
		end,
	},
}
