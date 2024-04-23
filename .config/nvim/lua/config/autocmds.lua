-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "*.json", "*.jsonc", "*.lua" },
-- 	callback = function()
-- 		vim.keymap.set("i", "<C-f>", "<C-o>$,")
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.json", "*.jsonc", "*.lua" },
	callback = function()
		vim.keymap.set("i", "<C-f>", "<C-o>$,")
	end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.js", "*.php", "*.jsx" },
	callback = function()
		vim.keymap.set("i", "<C-f>", "<C-o>$;")
	end,
})
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "*.json", "*.jsonc", "*.lua" },
-- 	callback = function()
-- 		vim.keymap.set("i", "<C-f>", "<C-o>$,")
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "*.js", "*.php", "*.jsx" },
-- 	callback = function()
-- 		vim.keymap.set("i", "<C-f>", "<C-o>$;")
-- 	end,
-- })
