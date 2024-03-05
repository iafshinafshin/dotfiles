-- local discipline = require("craftzdog.discipline")

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
keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Increment/decreme
keymap.set("n", "=", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete and backwards
keymap.set("n", "dw", 'vb"_d')
keymap.set("n", "<leader>as", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- keymap.set("n", "i", "a", opts)

-- Save with root permission (not working for now)
vim.api.nvim_create_user_command("W", "w !sudo tee > /dev/null %", {})

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")
-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<Return>")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { expr = true, desc = "Close Tab" })
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sd", "<C-W>c", { desc = "Delete window", remap = true })
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
-- Resize window keymap.set("n", "<C-w><left>", "<C-w><") keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- my config
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- keymap.set("i", "<C-s>", "<C-p>", opts)
-- keymap.set("i", "<C-j>", "<down>")
-- keymap.set("i", "<C-l>", "<up>")

-- hsl(41, 95, 59)
--
-- hsl(200 30 64)
-- rgb(27 160 189)

keymap.set("n", "<leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)
