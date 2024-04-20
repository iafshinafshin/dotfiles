local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({

	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		show_file = true,
		folder_level = 0,
		color_mode = true,
	},
	ui = {
		border = "rounded",
		enable = true,
	},
	lightbulb = {
		enable = false,
	},
	outline = {
		layout = "float",
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
--vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
--vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<CR>", opts)
vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
-- vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
--vim.keymap.set("n", "gr", vim.lsp.buf.rename, { desc = "Rename" }, opts) -- smart rename

-- code action
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
