local status, noice = pcall(require, "noice")
if not status then return end
local status1, notify = pcall(require, "nvim-notify")
if not status1 then return end
local status2 = pcall(require, "nui.nvim")
if not status2 then return end

noice.setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  messages = {
    enabled = true, -- enables the Noice messages UI
    view = 'notify', -- default view for messages
    view_error = 'notify', -- view for errors
    view_warn = 'notify', -- view for warnings
    view_history = 'messages', -- view for :messages
    view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
  },
})



noice.setup(function(_,opts)
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
end)

notify.setup({
  timeout = 5000,
})

