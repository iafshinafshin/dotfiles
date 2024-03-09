local status, conform = pcall(require, "conform")
if not status then return end


conform.setup({
  formatters_by_ft = {
    javascript = { "prettier", "ast_grep" },
    typescript = { "prettier", "ast_grep" },
    javascriptreact = { "prettier", "ast_grep" },
    typescriptreact = { "prettier", "ast_grep" },
    svelte = { "prettier" },
    css = { "prettier", "ast_grep" },
    html = { "prettier", "ast_grep" },
    json = { "prettier", "ast_grep" },
    yaml = { "prettier", "ast_grep" },
    markdown = { "prettier", "ast_grep" },
    graphql = { "prettier", "ast_grep" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
