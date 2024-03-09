local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- Color Schemes
	use({ "craftzdog/solarized-osaka.nvim", priority = 1000 })
	use("folke/tokyonight.nvim")
	use("bluz71/vim-nightfly-colors")
	use({
		"sainnhe/everforest",
		priority = 1000,
		config = function()
			vim.everforest_diagnostic_line_highlight = 1
		end,
		opts = {
			colorscheme = "everforest",
		},
	})

	use({ "ellisonleao/gruvbox.nvim", priority = 1000 })
	use("rose-pine/neovim")
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("nvim-lua/plenary.nvim") -- Common utilities

	use("onsails/lspkind-nvim") -- vscode-like pictograms
	-- lsp configs
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

	-- LSP Support
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")
	use("mfussenegger/nvim-lint")

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("nvimdev/lspsaga.nvim") -- LSP UIs
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("stevearc/conform.nvim")

	use("mbbill/undotree")
	use("szw/vim-maximizer")
	use("kylechui/nvim-surround")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
	})
	use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("stevearc/dressing.nvim")
	use("3rd/image.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("Shatur/neovim-session-manager")
	use({
		"coffebar/neovim-project",
		requires = {
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
		priority = 100,
		opts = {
			projects = { -- define project roots
				"~/.ghq/github.com/iafshinafshin/*",
				"~/.ghq/gitlab.com/*",
				"~/.config/*",
			},
		},
	})
	use("mrjones2014/legendary.nvim")
	use("hinell/duplicate.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use({
		"numToStr/Comment.nvim",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	})
	use("folke/zen-mode.nvim")
	-- Lua
	use("folke/todo-comments.nvim")
	use({
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	})
	use({
		"echasnovski/mini.indentscope",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"NvimTreeToggle",
					"nvim-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	})
	use("folke/which-key.nvim")
	use({
		"folke/noice.nvim",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
		requires = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					timeout = 3000,
					max_height = function()
						return math.floor(vim.o.lines * 0.75)
					end,
					max_width = function()
						return math.floor(vim.o.columns * 0.75)
					end,
					on_open = function(win)
						vim.api.nvim_win_set_config(win, { zindex = 100 })
					end,
				},
			},
		},
	})
	use("NvChad/nvim-colorizer.lua")
	use("uga-rosa/ccc.nvim")
	use("roobert/tailwindcss-colorizer-cmp.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("nvim-tree/nvim-tree.lua")
	use("akinsho/nvim-bufferline.lua")
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim") -- For git blame & browse
	use("kdheepak/lazygit.nvim")
end)
