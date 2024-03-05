local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, masonlspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
masonlspconfig.setup {
  automatic_installation = true,
  ensure_installed = {
				"prettier", -- prettier formatter
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"phpactor",
				"pylama",
				"css-lsp",
				"cssmodules-language-server",
				"html-lsp",
				"ast_grep",
				"beautysh",
				"emmet-language-server",
				"easy-coding-standard",
				"lua-language-server",
				"eslint_d",
				"prettierd",
				"graphql-language-service-cli",
				"prisma-language-server",
				"rust-analyzer",
				"taplo",
				"easy-coding-standard",
				"intelephense",

  },
}
