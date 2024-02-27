return {
	-- tools
	{
		"williamboman/mason.nvim",
		diagnostics = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
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
			})
		end,

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

	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			---@type lspconfig.options
			servers = {
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				html = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
				lua_ls = {
					-- enabled = false,
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									-- "--log-level=trace",
								},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								-- enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
			},
			setup = {},
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local keymap = vim.keymap

			require("lspsaga").setup({

				outline = {
					enable = true,
					layout = "float",
				},
				lightbulb = {
					enable = false,
				},
				ui = {
					border = "rounded",
				},
				symbol_in_winbar = {
					enable = true,
					separator = "  ",
					show_file = true,
					folder_level = 0,
					color_mode = true,
				},
			})

			keymap.set("n", "gt", ":Lspsaga outline<Return>")
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = "VeryLazy",
		config = function()
			require("lsp-zero")
			require("lspconfig").lua_ls.setup({})
			-- don't copy/paste this if you don't know what is `lua_ls`.
			-- yes, lsp-zero has changed since ThePrimeagen released his video "0 to LSP".
		end,
	},
}
