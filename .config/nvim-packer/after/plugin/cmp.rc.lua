-- local status, cmp = pcall(require, "cmp")
-- if not status then
-- 	return
-- end
-- local lspkind = require("lspkind")
--
-- local function formatForTailwindCSS(entry, vim_item)
-- 	if vim_item.kind == "Color" and entry.completion_item.documentation then
-- 		local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
-- 		if r then
-- 			local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
-- 			local group = "Tw_" .. color
-- 			if vim.fn.hlID(group) < 1 then
-- 				vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
-- 			end
-- 			vim_item.kind = "●"
-- 			vim_item.kind_hl_group = group
-- 			return vim_item
-- 		end
-- 	end
-- 	vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
-- 	return vim_item
-- end
--
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			require("luasnip").lsp_expand(args.body)
-- 		end,
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<C-e>"] = cmp.mapping.close(),
-- 		["<CR>"] = cmp.mapping.confirm({
-- 			behavior = cmp.ConfirmBehavior.Replace,
-- 			select = true,
-- 		}),
-- 	}),
-- 	sources = cmp.config.sources({
-- 		{ name = "nvim_lsp" },
-- 		{ name = "buffer" },
-- 	}),
-- 	formatting = {
-- 		format = lspkind.cmp_format({
-- 			maxwidth = 50,
-- 			before = function(entry, vim_item)
-- 				vim_item = formatForTailwindCSS(entry, vim_item)
-- 				return vim_item
-- 			end,
-- 		}),
-- 	},
-- })
--
-- vim.cmd([[
--   set completeopt=menuone,noinsert,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]])

local status, cmp = pcall(require, "cmp")
if not status then
	return
end
local status1, lspkind = pcall(require, "lspkind")
if not status1 then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = { -- configure how nvim-cmp interacts with snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- configure lspkind for vs-code like pictograms in completion menu
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
