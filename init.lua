-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.wo.wrap = true
vim.wo.relativenumber = false
vim.wo.number = true

vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Auto-update plugins",
    callback = function()
        -- Run `:Lazy sync` in the background (non-blocking)
        require("lazy").sync({ wait = false, show = false })
    end,
    once = true, -- Ensure the autocommand only runs once per session
})
