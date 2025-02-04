local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Leader Key Map
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Load core config
require("config.autocmds")
require("config.keymaps")
require("config.options")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General settings
vim.wo.wrap = true
vim.wo.relativenumber = false
vim.wo.number = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.g.project_root = vim.fn.getcwd(-1)

-- Initialize lazy.nvim plugins
require("lazy").setup("plugins", { -- "plugins" refers to lua/plugins/init.lua
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true },
})

-- Rest of your init.lua (pyenv setup, etc.)
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Auto-update plugins",
    callback = function()
        require("lazy").sync({ wait = false, show = false })
    end,
    once = true,
})
