return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[

        ███████╗██╗   ██╗███╗   ██╗        ██╗     ██╗███████╗███████╗    
        ██╔════╝██║   ██║████╗  ██║        ██║     ██║██╔════╝██╔════╝    
        █████╗  ██║   ██║██╔██╗ ██║█████╗  ██║     ██║█████╗  █████╗      
        ██╔══╝  ██║   ██║██║╚██╗██║╚════╝  ██║     ██║██╔══╝  ██╔══╝      
        ██║     ╚██████╔╝██║ ╚████║███████╗███████╗██║██║     ███████╗    
        ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝╚═╝     ╚══════╝    
      ]]
		logo = string.rep("\n", 8) .. logo
		-- Set header
		dashboard.section.header.val = vim.split(logo, "\n")
		-- dashboard.section.header.val = {
		-- 	"                                                     ",
		-- 	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		-- 	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		-- 	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		-- 	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		-- 	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		-- 	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		-- 	"                                                     ",
		-- }

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "  : New File", "<cmd>ene<CR>"),
			dashboard.button("e", "  : Toggle file explorer", ":NvimTreeToggle<Return>"),
			dashboard.button("pd", "󰺧  : Discover Projects", ":Telescope neovim-project discover<Return>"),
			dashboard.button("pr", "󰺯  : Recent Projects", ":Telescope neovim-project<Return>"),
			dashboard.button("f", "󰱼  : Find File", ";f"),
			dashboard.button("r", "  : Find Word", ";r"),
			-- dashboard.button("SPC s", "󰁯  : Restore Session For Current Directory", "SessionRestore"),
			dashboard.button("q", "  : Quit ", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
