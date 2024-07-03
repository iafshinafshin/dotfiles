-- local discipline = require("craftzdog.discipline")
-- discipline.cowboy()
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>uL", function()
	require("lazyvim.util").toggle("relativenumber")
end, { desc = "Toggle Relative Line Numbers" })
-- Do things without affecting the registers

keymap.set("n", "Y", "y$")
keymap.set("n", 'y"', 'yi"')
keymap.set("n", "y'", "yi'")
keymap.set("n", "y{", "yi{")
keymap.set("n", "y[", "yi[")
keymap.set("n", "y<", "yi<")
keymap.set("n", "y(", "yi(")

keymap.set("n", 'c"', 'ci"')
keymap.set("n", "c'", "ci'")
keymap.set("n", "c{", "ci{")
keymap.set("n", "c[", "ci[")
keymap.set("n", "c<", "ci<")
keymap.set("n", "c(", "ci(")

keymap.set("n", 'd"', 'di"')
keymap.set("n", "d'", "di'")
keymap.set("n", "d{", "di{")
keymap.set("n", "d[", "di[")
keymap.set("n", "d<", "di<")
keymap.set("n", "d(", "di(")

keymap.set("n", 'v"', 'vi"')
keymap.set("n", "v'", "vi'")
keymap.set("n", "v{", "vi{")
keymap.set("n", "v[", "vi[")
keymap.set("n", "v<", "vi<")
keymap.set("n", "v(", "vi(")
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>ap", '"0p')
keymap.set("n", "<Leader>aP", '"0P')
keymap.set("v", "<Leader>ap", '"0p')
keymap.set("n", "<Leader>ac", '"_c')
keymap.set("n", "<Leader>aC", '"_C')
keymap.set("v", "<Leader>ac", '"_c')
keymap.set("v", "<Leader>aC", '"_C')
keymap.set("n", "<Leader>ad", '"_d')
keymap.set("n", "<Leader>aD", '"_D')
keymap.set("v", "<Leader>ad", '"_d')
keymap.set("v", "<Leader>aD", '"_D')
keymap.set("n", "db", 'vb"_d')
keymap.set("n", "dw", 'viw"_d')
keymap.set("n", "cd", '"_ciw')
keymap.set("i", "<C-a>", "<Esc>A")
-- Delete and backwards

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
function MyProj()
	local path = {
		"~/Development",
		"~/.ghq/github.com/iafshinafshin",
		"~/.ghq/github.com/iafshinafshin/dotfiles/.config/nvim",
		"~/.ghq/github.com/iafshinafshin/dotfiles/.config",
		"~/.config",
	}
	vim.ui.select(path, {
		prompt = "Select Your Project",
		type = "directory",
		format_item = function(item)
			return "Choose : " .. item
		end,
	}, function(selection)
		vim.cmd("tabnew | e " .. selection)
	end)
end
-- vim.api.nvim_create_user_command("MyProj", "lua MyProj()", {})
keymap.set("n", "<Leader>ap", ":lua MyProj()<Return>", opts)
keymap.set("n", "<leader>an", ":lua NodeDebugMe('~/Development/JavaScript/public/js/javascript.js')<Return>", opts)
-- keymap.set("i", "<C-f>", "<C-o>$")
keymap.set("n", "<A-k>", "<S-v>:m '<-2<CR>gv=gv<Esc>", opts)
keymap.set("n", "<A-j>", "<S-v>:m '>+1<CR>gv=gv<Esc>", opts)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Increment/decreme
keymap.set("n", "=", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set(
	"n",
	"<leader>aR",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Rename With Command Line" }
)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- keymap.set(
-- 	"n",
-- 	"<leader>an",
-- 	':lua require("lazy.util").float_cmd("node ~/Development/JavaScript/public/js/javascript.js")<Return>',
-- 	{ desc = "Run node" },
-- 	opts
-- )
-- keymap.set("n", "<leader>an", function()
-- 	require("lazy.util").float_cmd({ "node", "~/Development/JavaScript/public/js/javascript.js" })
-- end, { desc = "Run node" })
-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command("viw", "", {'bang': n:true})
-- vim.api.nvim_create_user_command("W", "w !sudo tee > /dev/null %", {})
vim.api.nvim_create_user_command("W", "w", {})
keymap.set("n", "<Leader>at", function()
	require("time-tracker").time_info()
end, opts)
-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>")

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "H", "h")
keymap.set("n", "L", "l")
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sd", "<C-W>c", { desc = "Delete window" })
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
-- Resize window
keymap.set("n", "<C-w><right>", "<C-w><")
keymap.set("n", "<C-w><left>", "<C-w>>")
keymap.set("n", "<C-w><down>", "<C-w>+")
keymap.set("n", "<C-w><up>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- hsl(41, 95, 59)
-- hsl(200 30 64)
-- rgb(27, 160, 189)
-- hsl(36, 55, 55)

keymap.set("n", "<leader>r", function()
	require("craftzdog.hsl").replaceHexWithHSL()
end, { desc = "Replace hex with HSL" })

keymap.set("n", "<leader>i", function()
	require("craftzdog.lsp").toggleInlayHints()
end)

-- map("v", "<", "<gv")
-- map("v", ">", ">gv")

-- keymap.set("n", "<leader>an", function()
-- 	LazyVim.terminal("node ~/Development/JavaScript/public/js/javascript.js")
-- end, { desc = "Run node for Dev Proj" })
-- require("lazy.util").float_cmd("node", { cwd = vim.fn.expand("~/Development/JavaScript/public/js/javascript.js") })
