return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
      vim.notify = function(msg, log_level, opts)
        if
          string.match(
            msg,
            "method textDocument/documentColor is not supported by any of the servers registered for the current buffer"
          )
        then
        -- Do nothing to suppress the warning
        else
          -- Call the original vim.notify function for other messages
          vim.notify(msg, log_level, opts)
        end
      end
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
    },
  },

  -- animations
  -- {
  -- 	"echasnovski/mini.animate",
  -- 	event = "VeryLazy",
  -- 	opts = function(_, opts)
  -- 		opts.scroll = {
  -- 			enable = false,
  -- 		}
  -- 	end,
  -- },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        -- theme = "solarized_dark",
        -- theme = "rose-pine",
        theme = "tokyonight",
        -- theme = "nightfly",
        -- theme = "everforest",
        -- theme = "gruvbox",
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      -- {{{
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
      --- }}}
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")
      local tokyo_color = require("tokyonight.colors").setup({ transform = true })
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "󰈙 No Name"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = tokyo_color.fg_gutter,
            guifg = tokyo_color.blue,
          }
        end,
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = false,
        tmux = true,
        lspsaga = false,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
        ███████╗██╗   ██╗███╗   ██╗        ██╗     ██╗███████╗███████╗    
        ██╔════╝██║   ██║████╗  ██║        ██║     ██║██╔════╝██╔════╝    
        █████╗  ██║   ██║██╔██╗ ██║█████╗  ██║     ██║█████╗  █████╗      
        ██╔══╝  ██║   ██║██║╚██╗██║╚════╝  ██║     ██║██╔══╝  ██╔══╝      
        ██║     ╚██████╔╝██║ ╚████║███████╗███████╗██║██║     ███████╗    
        ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝╚═╝     ╚══════╝    
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").set_icon({
        gql = {
          icon = "",
          color = "#e535ab",
          cterm_color = "199",
          name = "GraphQL",
        },
      })
    end,
  },
}
