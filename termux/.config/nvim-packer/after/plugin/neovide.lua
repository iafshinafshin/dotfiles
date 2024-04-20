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

	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<D-=>", function()
		change_scale_factor(1.25)
	end)
	vim.keymap.set("n", "<D-->", function()
		change_scale_factor(1 / 1.25)
	end)

	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
	vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end
