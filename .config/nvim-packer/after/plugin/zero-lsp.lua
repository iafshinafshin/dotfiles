local status, lsp_zero = pcall(require, "lsp-zero")
if (not status) then return end

lsp_zero.setup({ })
require('lspconfig').lua_ls.setup({})
