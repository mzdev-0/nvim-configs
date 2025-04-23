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
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.g.project_root = vim.fn.getcwd(-1)
vim.o.clipboard = "unnamedplus"

-- Initialize lazy.nvim plugins
require("lazy").setup("plugins", { -- "plugins" refers to lua/plugins/init.lua
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true },
})

-- Auto update on startup
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Auto-update plugins",
    callback = function()
        require("lazy").sync({ wait = false, show = false })
    end,
    once = true,
})

-- Integrate OSC52 for remote copying
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
        local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
        copy_to_unnamedplus(vim.v.event.regcontents)
        local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
        copy_to_unnamed(vim.v.event.regcontents)
    end,
})
