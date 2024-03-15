return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" }, -- 
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

    -- stylua: ignore start
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")

        map("n", "<Leader>gtc", ":Telescope git_commits<Return>", "Open Commits With Telescope")
        map("n", "<Leader>gtb", ":Telescope git_branches<Return>", "Open Branches With Telescope")
        map("n", "<Leader>gts", ":Telescope git_status<Return>", "Open Status With Telescope")
			end,
		},
		config = true,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.keymap.set("n", "<leader>gg", ":LazyGit<Return>", { desc = "Lazygit" })
		end,
	},
	{
		"dinhhuy258/git.nvim",
		-- lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},
}
