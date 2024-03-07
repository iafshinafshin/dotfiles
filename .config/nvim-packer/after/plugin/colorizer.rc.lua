local status, colorizer = pcall(require, "colorizer")
if not status then return end

local status1, ccc = pcall(require, "ccc")
if not status1 then return end

local status2, cmp_color = pcall(require, "tailwindcss-colorizer-cmp")
if not status2 then return end

colorizer.setup({
  filetypes = { "*" },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = true, -- 0xAARRGGBB hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes for `mode`: foreground, background,  virtualtext
    mode = "background", -- Set the display mode.
    -- Available methods are true / true / "normal" / "lsp" / "both"
    -- True is same as normal
    tailwind = true, -- Enable tailwind colors
    -- parsers can contain values used in |user_default_options|
    sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
    virtualtext = "󰄮",
    -- virtualtext = "■",
    -- update color values even if buffer is not focused
    -- example use: cmp_menu, cmp_docs
    always_update = true,
  },
  -- all the sub-options of filetypes apply to buftypes
  buftypes = {},
})

ccc.setup({
	point_char = "󰄮", --   ■ 󰄮 ▓ ▚ █ ▣ ▮ ▯ ╳ ╬ ╋ 🞠 ⋈ 󰣏
	-- bar_char = "󰄮",
})

vim.keymap.set("n", "sp", ":CccPick<Return>", {desc = "Color Picker" })
vim.keymap.set("n", "sc", ":CccConvert<Return>", {desc = "Convert Color to HSL & HEX & RGB" })


cmp_color.setup({
  color_square_width = 2,
})
require("cmp").config.formatting = {
  format = cmp_color.formatter,
}
