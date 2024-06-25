return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(event)
					vim.schedule(function()
						require("noice.text.markdown").keys(event.buf)
					end)
				end,
			})

			opts.presets.lsp_doc_border = true
			vim.notify = function(msg, log_level, opts)
				if
					string.match(
						msg,
						"method textDocument/documentColor is not supported by any of the servers registered for the current buffer"
					)
				then
				-- Do nothing to suppress the warning
				else
					-- Call the original vim.notify function for other messages
					vim.notify(msg, log_level, opts)
				end
			end
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
		},
	},

	-- animations
	-- {
	-- 	"echasnovski/mini.animate",
	-- 	event = "VeryLazy",
	-- 	opts = function(_, opts)
	-- 		opts.scroll = {
	-- 			enable = false,
	-- 		}
	-- 	end,
	-- },

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				globalstatus = true,
				theme = "solarized_dark",
				-- theme = "rose-pine",
				-- theme = "tokyonight",
				-- theme = "nightfly",
				-- theme = "everforest",
				-- theme = "gruvbox",
			},
		},
		-- opts = function()
		--   local lualine_nightfly = require("lualine.themes.nightfly")
		--
		--   -- new colors for theme
		--   local new_colors = {
		--     blue = "#65D1FF",
		--     green = "#3EFFDC",
		--     black = "#000000",
		--     red = "#fc514e",
		--     malibu = "#87bcff",
		--     bg_col = "#092236",
		--     color1 = "#82aaff",
		--     color2 = "#21c7a8",
		--     color3 = "#ae81ff",
		--     color4 = "#f3b25e",
		--     color5 = "#ff5874",
		--     color6 = "#092236",
		--     color7 = "#a1aab8",
		--     color8 = "#c3ccdc",
		--     orange = "#f78c6c",
		--   }
		--
		--   -- change nightlfy theme colors
		--   lualine_nightfly.normal = {
		--     a = { fg = new_colors.color6, bg = new_colors.malibu, gui = "bold" },
		--     b = { fg = new_colors.malibu, bg = new_colors.bg_col },
		--     c = { fg = new_colors.malibu, bg = new_colors.bg_col },
		--   }
		--   lualine_nightfly.insert = {
		--     a = { fg = new_colors.color6, bg = new_colors.green },
		--     b = { fg = new_colors.green, bg = new_colors.bg_col },
		--     -- c = { fg = new_colors.green, bg = new_colors.bg_col },
		--   }
		--   lualine_nightfly.visual = {
		--     a = { fg = new_colors.color6, bg = new_colors.color3 },
		--     b = { fg = new_colors.color3, bg = new_colors.bg_col },
		--     -- c = { fg = new_colors.color3, bg = new_colors.bg_col },
		--   }
		--   lualine_nightfly.command = {
		--     a = { fg = new_colors.color6, bg = new_colors.color4 },
		--     b = { fg = new_colors.color4, bg = new_colors.bg_col },
		--     -- c = { fg = new_colors.color4, bg = new_colors.bg_col },
		--   }
		--   lualine_nightfly.replace = {
		--     a = { fg = new_colors.color6, bg = new_colors.color5 },
		--     b = { fg = new_colors.color5, bg = new_colors.bg_col },
		--     -- c = { fg = new_colors.malibu, bg = new_colors.bg_col },
		--   }
		--   lualine_nightfly.inactive = {
		--     a = { fg = new_colors.color7, bg = new_colors.bg_col },
		--     b = { fg = new_colors.color7, bg = new_colors.bg_col },
		--     -- c = { fg = new_colors.color7, bg = new_colors.bg_col },
		--   }
		--   return {
		--     options = {
		--       globalstatus = true,
		--       theme = lualine_nightfly,
		--     },
		--   }
		-- end,
	},

	-- filename
	{
		"b0o/incline.nvim",
		dependencies = { "craftzdog/solarized-osaka.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			-- {{{
			-- local solarized_color = require("solarized-osaka.").setup()
			-- require("incline").setup({
			--   highlight = {
			--     groups = {
			--       InclineNormal = { guibg = solarized_color.magenta500, guifg = solarized_color.base04 },
			--       InclineNormalNC = { guifg = solarized_color.violet500, guibg = solarized_color.base03 },
			--     },
			--   },
			--   window = { margin = { vertical = 0, horizontal = 1 } },
			--   hide = {
			--     cursorline = true,
			--   },
			--   render = function(props)
			--     local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			--     if vim.bo[props.buf].modified then
			--       filename = "[+] " .. filename
			--     end
			--
			--     local icon, color = require("nvim-web-devicons").get_icon_color(filename)
			--     return { { icon, guifg = color }, { " " }, { filename } }
			--   end,
			-- })
			--- }}}
			local helpers = require("incline.helpers")
			local devicons = require("nvim-web-devicons")
			local tokyo_color = require("tokyonight.").setup({ transform = true })
			local gruvbox_color = require("gruvbox").palette
			local solarized_osaka_color = require("solarized-osaka.").setup()
			require("incline").setup({
				window = {
					padding = 0,
					margin = { horizontal = 0 },
				},
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "󰈙 No Name"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					return {
						ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
							or "",
						" ",
						{ filename, gui = modified and "bold,italic" or "bold" },
						" ",
						guibg = "#38507a", -- for nightfly scheme
						guifg = "#21c7a8", -- for nightfly scheme
						-- guibg = solarized_osaka_color.base03, -- for solarized scheme
						-- guifg = solarized_osaka_color.hint, -- for solarized scheme
						-- guibg = gruvbox_color.neutral_aqua, -- for gruvbox scheme
						-- guifg = gruvbox_color.dark1, -- for gruvbox scheme
						-- guibg = tokyo_color.fg_gutter, -- for tokyonight scheme
						-- guifg = tokyo_color.blue, -- for tokyonight scheme
					}
				end,
			})
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = false,
				tmux = true,
				lspsaga = false,
				kitty = { enabled = false, font = "+2" },
			},
			on_open = function(win)
				local view = require("zen-mode.view")
				local layout = view.layout(view.opts)
				vim.api.nvim_win_set_config(win, {
					width = layout.width,
					height = layout.height - 1,
				})
				vim.api.nvim_win_set_config(view.bg_win, {
					width = vim.o.columns,
					height = view.height() - 1,
					row = 1,
					col = layout.col,
					relative = "editor",
				})
			end,
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			local logo = [[
        ███████╗██╗   ██╗███╗   ██╗        ██╗     ██╗███████╗███████╗    
        ██╔════╝██║   ██║████╗  ██║        ██║     ██║██╔════╝██╔════╝    
        █████╗  ██║   ██║██╔██╗ ██║█████╗  ██║     ██║█████╗  █████╗      
        ██╔══╝  ██║   ██║██║╚██╗██║╚════╝  ██║     ██║██╔══╝  ██╔══╝      
        ██║     ╚██████╔╝██║ ╚████║███████╗███████╗██║██║     ███████╗    
        ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝╚═╝     ╚══════╝    
      ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").set_icon({
				gql = {
					icon = "",
					color = "#e535ab",
					cterm_color = "199",
					name = "GraphQL",
				},
			})
		end,
	},
}
