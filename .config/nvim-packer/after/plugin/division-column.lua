local status, division_col = pcall(require, "statuscol")
if not status then
	return
end
local builtin = require("statuscol.builtin")

division_col.setup({
	relculright = true,
	segments = {
		{
			sign = { name = { "Diagnostic" }, auto = true },
			click = "v:lua.ScSa",
		},
		{
			sign = { name = { "Dap*" }, auto = true },
			click = "v:lua.ScSa",
		},
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
		{
			sign = { namespace = { "gitsign*" }, colwidth = 1, wrap = true },
			click = "v:lua.ScSa",
		},
	},
})
