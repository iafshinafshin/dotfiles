vim.g.mapleader = " "
-- aa
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
--
vim.opt.clipboard:append("unnamedplus")
vim.opt.number = true

vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true
-- vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = "a"

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "fish"
vim.opt.backupskip = "/tmp/*"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
--

-- vim.opt.fillchars = {
-- 	foldopen = "",
-- 	foldclose = "",
-- 	-- fold = "⸱",
-- 	fold = " ",
-- 	foldsep = " ",
-- 	diff = "╱",
-- 	eob = " ",
-- }

-- -- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
--
vim.cmd([[colorscheme solarized-osaka]])
-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme everforest]])
-- vim.cmd([[colorscheme tokyonight]])

if vim.g.neovide then
	vim.o.guifont = "JetbrainsMono Nerd Font"
	-- vim.g.neovide_scale_factor = 1.1
	vim.g.neovide_transparency = 0.8
	-- vim.g.neovide_transparency_point = 0.8
	local bg_color = "#00141a"
	require("solarized-osaka").setup({
		on_colors = function(colors)
			colors.bg = bg_color
		end,
	})
end
