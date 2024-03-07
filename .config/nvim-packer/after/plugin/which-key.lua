local status, which_key = pcall(require, "which-key")
if (not status) then return end

which_key.setup({ })
vim.o.timeout = true
vim.o.timeoutlen = 300
