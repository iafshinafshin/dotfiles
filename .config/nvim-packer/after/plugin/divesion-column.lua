local status, division_col = pcall(require, "statuscol")
if not status then
	return
end
local status1, builtin = pcall(require, "statuscol.builtin")
if not status1 then
	return
end

division_col.setup({
	relculright = true,
	segments = {
		{
			sign = { name = { "GitSign*" }, maxwidth = 1, colwidth = 1 },
			click = "v:lua.ScSa",
		},
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
			sign = {
				namespace = { "gitsigns" },
				maxwidth = 1,
				colwidth = 1,
				auto = false,
				fillchar = " ",
				fillcharhl = "StatusColumnSeparator",
			},
			click = "v:lua.ScSa",
		},
	},
})
