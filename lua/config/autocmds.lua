vim.api.nvim_create_autocmd("FileType", {
    pattern = "neo-tree",
    callback = function()
        -- Open file in a vertical split
        vim.keymap.set("n", "<leader>wv", function()
            local node = require("neo-tree.sources.manager").get_state().closest_node
            if node and node.type == "file" then
                vim.cmd("vsplit " .. node.path)
            end
        end, { buffer = true, desc = "Open file in vertical split" })

        -- Open file in a horizontal split
        vim.keymap.set("n", "<leader>wh", function()
            local node = require("neo-tree.sources.manager").get_state().closest_node
            if node and node.type == "file" then
                vim.cmd("split " .. node.path)
            end
        end, { buffer = true, desc = "Open file in horizontal split" })
    end,
})
