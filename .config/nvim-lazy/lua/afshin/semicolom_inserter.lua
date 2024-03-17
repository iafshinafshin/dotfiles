local M = {
	comma = {
		filetypes = { "javascript", "php", "typescript" },
	},
	semicolon = {
		filetypes = { "javascript", "php", "typescript" },
	},
}
M.keymap = "<C-e>"
-- print(string.len(M.defaulst.semicolon.filetypes))
function M.end_of_tag()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = M.semicolon.filetypes,
		callback = function()
			vim.keymap.set("i", M.keymap, "<C-o>$;", { noremap = true, silent = true })
		end,
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = M.comma.filetypes[function()
			local t = 0
			for i in string.len(M.comma) do
				t = i - 1
				return t
			end
		end],
		callback = function()
			vim.keymap.set("i", M.keymap, "<C-o>$,", { noremap = true, silent = true })
		end,
	})
end

return M
