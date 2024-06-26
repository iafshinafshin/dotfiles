vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
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
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
-- vim.opt.mouse = ""
vim.g.lazygit_theme = true
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

-- vim.cmd("set proxy=socks5h://localhost:9050")
if vim.g.neovide then
  vim.o.guifont = "PlemolJP35 Console NF"
  -- vim.o.guifont = "JetbrainsMono Nerd Font:h12:a"
  -- vim.o.guifont = "Hack Nerd Font:h12:a"
  -- vim.o.guifont = "Lilex Nerd Font Mono:h12:a"
  vim.g.neovide_scale_factor = 1.5
  -- vim.g.neovide_scale_factor = 1.1
  vim.g.neovide_transparency = 0.8
  -- vim.g.neovide_transparency_point = 0.8
  -- local bg_color = "#00141a"
  -- require("solarized-osaka").setup({
  --   on_colors = function(colors)
  --     colors.bg = bg_color
  --   end,
  -- })
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.2)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
  -- vim.keymap.set("n", "<C-=>", function()
  --   change_scale_factor(1.25)
  -- end)
  -- vim.keymap.set("n", "<C-->", function()
  --   change_scale_factor(1 / 1.25)
  -- end)
end
