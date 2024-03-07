local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- Color Schemes
  use({ "craftzdog/solarized-osaka.nvim", priority = 1000 })
  use("folke/tokyonight.nvim")
  use("bluz71/vim-nightfly-colors")
  use ({
    "sainnhe/everforest",
    priority = 1000,
    config = function()
      vim.g.everforest_diagnostic_line_highlight = 1
    end,
    opts = {
      colorscheme = "everforest",
    }})


    use({ "ellisonleao/gruvbox.nvim", priority = 1000 })
    use("rose-pine/neovim")
    use("nvim-lualine/lualine.nvim") -- Statusline
    use("nvim-lua/plenary.nvim") -- Common utilities
    use("onsails/lspkind-nvim") -- vscode-like pictograms
    -- lsp configs
    use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua


    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    -- LSP Support
    use("neovim/nvim-lspconfig") 
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("WhoIsSethDaniel/mason-tool-installer.nvim")
    -- Autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("nvimdev/lspsaga.nvim") -- LSP UIs
    use("mbbill/undotree")
    use("szw/vim-maximizer")
    use({
      "nvim-treesitter/nvim-treesitter",
      run = "TSUpdate",
    })
    use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })
    use("kyazdani42/nvim-web-devicons") -- File icons
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use({ "numToStr/Comment.nvim", requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    } })
    use("folke/zen-mode.nvim")
    -- Lua
    use("folke/which-key.nvim")
    use("folke/noice.nvim")
      use('MunifTanjim/nui.nvim')
      use('rcarriga/nvim-notify')
      use( "NvChad/nvim-colorizer.lua")
      use("uga-rosa/ccc.nvim")
      use("roobert/tailwindcss-colorizer-cmp.nvim")
      use({
        "iamcco/markdown-preview.nvim",
        run = function()
          vim.fn["mkdp#util#install"]()
        end,
      })
      use("akinsho/nvim-bufferline.lua")
      use("lewis6991/gitsigns.nvim")
      use("dinhhuy258/git.nvim") -- For git blame & browse
      use("kdheepak/lazygit.nvim")
end)
