local status, inc_line = pcall(require, "incline")
if not status then
	return
end

local status1, color_sol = pcall(require, "solarized-osaka.colors")
if not status1 then
	return
end

local colors = color_sol.setup()
require("incline").setup({
	highlight = {
		groups = {
			InclineNormal = { guifg = colors.blue500, guibg = colors.base02 }, -- hover split
			InclineNormalNC = { guibg = colors.base00, guifg = colors.yellow500 },
			-- InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
			-- InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
		},
	},
	window = { margin = { vertical = 0, horizontal = 1 } },
	hide = {
		cursorline = true,
	},
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		if vim.bo[props.buf].modified then
			filename = "[+] " .. filename
		end

		local icon, color = require("nvim-web-devicons").get_icon_color(filename)
		return { { icon, guifg = color }, { " " }, { filename } }
	end,
})
