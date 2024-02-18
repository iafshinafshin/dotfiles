local discipline = require("craftzdog.discipline")

-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>uL", function()
	require("lazyvim.util").toggle("relativenumber")
end, { desc = "Toggle Relative Line Numbers" })
-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Increment/decreme
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')
-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- keymap.set("n", "i", "a", opts)

-- Save with root permission (not working for now)
vim.api.nvim_create_user_command("W", "w !sudo tee > /dev/null %", {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<Return>")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sd", "<C-W>c", { desc = "Delete window", remap = true })
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- my config

-- keymap.set("i", "<C-s>", "<C-p>", opts)
-- keymap.set("i", "<C-j>", "<down>")
-- keymap.set("i", "<C-l>", "<up>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- #faba32
--
-- hsl(0, 0, 100)
-- #faba32
keymap.set("n", "<leader>ar", function()
	require("craftzdog.hsl").hex_to_rgb()
end)
keymap.set("n", "<leader>al", function()
	require("craftzdog.hsl").hslToHex(h, s, l)
end)
keymap.set("n", "<leader>ah", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

-- default keymap in lazyvim

-- This file is automatically loaded by lazyvim.config.init
-- better up/down

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- map(
-- 	"n",
-- 	"<leader>ur",
-- 	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
-- 	{ desc = "Redraw / clear hlsearch / diff update" }
-- )
--
-- -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
--
-- -- better indenting
-- map("v", "<", "<gv")
-- map("v", ">", ">gv")
--
-- map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
-- map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
--
-- -- formatting
-- map({ "n", "v" }, "<leader>cf", function()
-- 	Util.format({ force = true })
-- end, { desc = "Format" })
