local status, conform = pcall(require, "conform")
if not status then
  return
end

conform.setup({
  formatters_by_ft = {
    javascript = { "prettierd", "prettier", "ast_grep" },
    typescript = { "prettierd", "prettier", "ast_grep" },
    javascriptreact = { "prettierd", "prettier", "ast_grep" },
    typescriptreact = { "prettierd", "prettier", "ast_grep" },
    svelte = { "prettier" },
    css = { "prettierd", "prettier", "ast_grep" },
    html = { "prettierd", "prettier", "ast_grep" },
    json = { "prettierd", "prettier", "ast_grep" },
    yaml = { "prettierd", "prettier", "ast_grep" },
    markdown = { "prettierd", "prettier", "ast_grep" },
    graphql = { "prettierd", "prettier", "ast_grep" },
    lua = { "stylua", "ast_grep" },
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
