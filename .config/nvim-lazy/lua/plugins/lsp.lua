return {
	-- Language server installer
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		diagnostics = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua",
				"selene",
				"biome",
				"phpcbf",
				"jq",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"phpactor",
				"phpcs",
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
		},
		config = function()
			local mason = require("mason")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			-- import lspconfig plugin
			local lspconfig = require("lspconfig")

			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local keymap = vim.keymap -- for conciseness

			local opts = { noremap = true, silent = true }
			local on_attach = function(bufnr, client)
				opts.buffer = bufnr

				-- set keybinds
				-- 	opts.desc = "Show LSP references"
				-- 	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				--
				-- 	opts.desc = "Go to declaration"
				-- 	keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				--
				-- 	opts.desc = "Show LSP definitions"
				-- 	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				--
				-- 	opts.desc = "Show LSP implementations"
				-- 	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				--
				-- 	opts.desc = "Show LSP type definitions"
				-- 	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				--
				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				--
				-- 	opts.desc = "Smart rename"
				-- 	keymap.set("n", "gr", vim.lsp.buf.rename, opts) -- smart rename
				--
				-- 	opts.desc = "Show line diagnostics"
				-- 	keymap.set("n", "G", vim.diagnostic.open_float, opts) -- show diagnostics for line
				--
				-- 	opts.desc = "Go to previous diagnostic"
				-- 	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				--
				-- 	opts.desc = "Go to next diagnostic"
				-- 	keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
				-- 	keymap.set("n", "<C-j>", vim.diagnostic.goto_next) -- jump to next diagnostic in buffer
				--
				-- 	opts.desc = "Restart LSP"
				-- 	keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			-- (not in youtube nvim video)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure typescript server with plugin
			lspconfig["tsserver"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure css server
			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure tailwindcss server
			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure svelte server
			lspconfig["svelte"].setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)

					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							if client.name == "svelte" then
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
							end
						end,
					})
				end,
			})

			-- configure prisma orm server
			lspconfig["prismals"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure graphql language server
			lspconfig["graphql"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
			})

			-- configure emmet language server
			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			})

			-- configure python server
			lspconfig["pyright"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
	},
	-- Select a formatter for a language
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = {
						"prettierd",
						"prettier",
						"biome" --[[ , "ast_grep" ]],
					},
					typescript = { "prettierd", "prettier", "biome", "ast_grep" },
					javascriptreact = { "prettierd", "prettier", "biome", "ast_grep" },
					typescriptreact = { "prettierd", "prettier", "biome", "ast_grep" },
					svelte = { "prettier" },
					php = { "phpcbf" },
					css = { "prettierd", "prettier", "ast_grep" },
					html = { "prettierd", "prettier", "ast_grep" },
					json = { "prettierd", "prettier", "jq", "ast_grep", "biome" },
					yaml = { "prettierd", "prettier", "ast_grep" },
					markdown = { "prettierd", "prettier", "ast_grep" },
					graphql = { "prettierd", "prettier", "ast_grep" },
					lua = { "stylua", "ast_grep" },
					python = { "isort", "black", "ast_grep" },
					rust = { "rust-analyzer" },
					bash = { "beautysh", "shfmt" },
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
		end,
	},
	-- linter
	{
		"mfussenegger/nvim-lint",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				python = { "pylint", "pylama" },
				lua = { "luacheck" },
				markdown = { "markdownlint" },
				bash = { "shellcheck" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>llr", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = true,
					separator = "  ",
					show_file = true,
					folder_level = 0,
					color_mode = true,
				},
				ui = {
					border = "rounded",
					enable = true,
				},
				lightbulb = {
					enable = false,
				},
				outline = {
					layout = "float",
				},
			})

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
			vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
			vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
			vim.keymap.set({ "n", "v" }, "gd", "<Cmd>Lspsaga finder<CR>", opts)
			vim.keymap.set("n", "gt", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
			-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
			vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
			-- vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.rename, { desc = "Rename" }, opts) -- smart rename
			-- vim.keymap.set("n", "gr", ":IncRename ", { desc = "Rename" }, opts) -- smart rename
			-- error lens
			vim.fn.sign_define({
				{
					name = "DiagnosticSignError",
					text = "",
					texthl = "DiagnosticSignError",
					linehl = "ErrorLine",
				},
				{
					name = "DiagnosticSignWarn",
					text = "",
					texthl = "DiagnosticSignWarn",
					linehl = "WarningLine",
				},
				{
					name = "DiagnosticSignInfo",
					text = "",
					texthl = "DiagnosticSignInfo",
					linehl = "InfoLine",
				},
				{
					name = "DiagnosticSignHint",
					text = "󰠠",
					-- text = "󰠠",
					texthl = "DiagnosticSignHint",
					linehl = "HintLine",
				},
			})
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = "IncRename",
		config = true,
	},
}
