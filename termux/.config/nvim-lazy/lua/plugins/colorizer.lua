return {
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = true, -- "Name" codes like Blue or blue
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					AARRGGBB = true, -- 0xAARRGGBB hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
					-- Available modes for `mode`: foreground, background,  virtualtext
					mode = "background", -- Set the display mode.
					-- Available methods are true / true / "normal" / "lsp" / "both"
					-- True is same as normal
					tailwind = true, -- Enable tailwind colors
					-- parsers can contain values used in |user_default_options|
					sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
					virtualtext = "■",
					-- update color values even if buffer is not focused
					-- example use: cmp_menu, cmp_docs
					always_update = true,
				},
				-- all the sub-options of filetypes apply to buftypes
				buftypes = {},
			})
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
			require("cmp").config.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		config = function()
			local keymap = vim.keymap
			local opts = { noremap = true, silent = true }
			keymap.set("n", "sc", ":CccConvert<Return>", { desc = "Replace Current Value With (Rgb, Hsl, Hex)" }, opts)
			keymap.set("n", "sp", ":CccPick<Return>", { desc = "Color Picker" }, opts)
			require("ccc").setup({
				highlighter = { auto_enable = true, lsp = true },
				point_char = "■", --   ■ 󰄮 ▓ ▚ █ ▣ ▮ ▯ ╳ ╬ ╋ 🞠 ⋈ 󰣏
				-- bar_char = "󰄮",
			})
			require("lspconfig").cssls.setup({})
		end,
	},
}
