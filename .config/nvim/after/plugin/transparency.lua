require("rose-pine").setup({
	disable_background = true,
})

function ColorMyPencils(color)
	-- color = color or "solarized-osaka" or "rose-pine"
	-- color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

if not vim.g.neovide then
	ColorMyPencils()
end
