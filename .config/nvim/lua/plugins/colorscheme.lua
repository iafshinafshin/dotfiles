return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
		config = function()
			require("solarized-osaka").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true, bold = true },
					functions = { italic = true, bold = true },
					variables = { bold = true },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

				--- You can override specific color groups to use other groups or a hex color
				--- function will be called with a ColorScheme table
				---@param colors ColorScheme
				on_colors = function(colors) end,

				--- You can override specific highlights to use other groups or a hex color
				--- function will be called with a Highlights and ColorScheme table
				---@param highlights Highlights
				---@param colors ColorScheme
				on_highlights = function(highlights, colors) end,
			})
		end,
		config = function()
			if vim.g.neovide then
				local new_bg = "#002527"
				-- local new_bg = "#00141a" "#002527"
				require("solarized-osaka").setup({
					-- style = "storm",
					transparent = false,
					on_colors = function(colors)
						colors.bg = new_bg
					end,
				})
			end
		end,
	},
	{
		"bluz71/vim-nightfly-colors",
		lazy = true,
		priority = 1000,
		-- opts = {
		-- 	colorscheme = "nightfly",
		-- },
	},
	{
		"joshdick/onedark.vim",
		lazy = true,
		priority = 1000,
		opts = {
			colorscheme = "onedark",
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			colorscheme = "gruvbox",
		},
	},
	{
		"sainnhe/everforest",
		lazy = true,
		priority = 1000,
		config = function()
			vim.g.everforest_diagnostic_line_highlight = 1
			-- vim.cmd([[colorscheme everforest]])
		end,
		opts = {
			colorscheme = "everforest",
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = {},
	},
	{
		"rose-pine/neovim",
		lazy = false,
		as = "rose-pine",
		config = function()
			-- vim.cmd("colorscheme rose-pine")
			require("rose-pine").setup({
				disable_background = true,
			})
		end,
	},
}
