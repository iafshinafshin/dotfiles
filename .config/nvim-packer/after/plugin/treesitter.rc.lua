-- local status, treesitter = pcall(require, "nvim-treesitter")
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"markdown",
		"markdown_inline",
		"lua",
		"astro",
		"cmake",
		"vim",
		"cpp",
		"css",
		"fish",
		"gitignore",
		"go",
		"graphql",
		"http",
		"java",
		"php",
		"phpdoc",
		"php_only",
		"rust",
		"scss",
		"sql",
		"svelte",
		"tsx",
		"tsv",
		"javascript",
		"typescript",
		"html",
		"python",
		"jsdoc",
		"regex",
	},

	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = true, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
})
-- MDX
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})
vim.treesitter.language.register("markdown", "mdx")
