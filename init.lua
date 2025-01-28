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

-- Auto-detect pyenv
local function setup_pyenv()
    -- 1. Detect active pyenv Python
    local pyenv_python = vim.fn.trim(vim.fn.system({ "pyenv", "which", "python" }))
    if vim.fn.filereadable(pyenv_python) ~= 1 then
        return
    end

    -- 2. Extract Python version dynamically
    local version_output = vim.fn.systemlist({ "python", "--version" })[1]
    local major, minor = version_output:match("Python (%d+)%.(%d+)%.%d+")
    local py_version = major .. "." .. minor -- "3.13"

    -- 3. Configure Neovim's Python
    vim.g.python3_host_prog = pyenv_python

    -- 4. Set Python path for package discovery
    local pyenv_prefix = vim.fn.trim(vim.fn.system({ "pyenv", "prefix" }))
    local site_packages = pyenv_prefix .. "/lib/python" .. py_version .. "/site-packages"
    vim.env.PYTHONPATH = site_packages

    --    -- 5. Verify setup
    --    vim.notify(("Pyenv: Python %s @ %s"):format(py_version, pyenv_python), vim.log.levels.INFO)
end

-- Run on Neovim start and when changing directories
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    callback = setup_pyenv,
})
