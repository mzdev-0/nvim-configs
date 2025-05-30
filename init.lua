-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Disable netrw
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- General settings
vim.wo.wrap = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.g.project_root = vim.fn.getcwd(-1)
vim.o.clipboard = "unnamedplus"
