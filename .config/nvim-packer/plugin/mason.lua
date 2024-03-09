local status, mason = pcall(require, "mason")
if (not status) then return end
local status1, masonlspconfig = pcall(require, "mason-lspconfig")
if (not status1) then return end
local status2, mason_installer = pcall(require, "mason-tool-installer")
if (not status2) then return end
-- require("packer").setup(function(use)
--
-- end)
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
masonlspconfig.setup({
})

mason_installer.setup({
  ensure_installed = {
    "prettier", -- prettier formatter
    "stylua",
    "selene",
    "luacheck",
    "shellcheck",
    "shfmt",
    "tailwindcss-language-server",
    "typescript-language-server",
    -- "phpactor",
    "pylama",
    "css-lsp",
    "cssmodules-language-server",
    "html-lsp",
    "ast_grep",
    "beautysh",
    "emmet-language-server",
    "easy-coding-standard",
    "eslint_d",
    "pylint",
    "prettierd",
    "graphql-language-service-cli",
    "prisma-language-server",
    "taplo",
    "easy-coding-standard",
    "intelephense",
    'lua-language-server',
    'stylua',
    'eslint_d',
    'prettierd',
    'rust-analyzer',
  },
  automatic_installation = true,
})
