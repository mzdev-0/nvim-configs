return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    priority = 990,

    opts = function()
        return {
            sources = { "filesystem", "buffers", "git_status" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            window = {
                position = "right",
                mappings = {
                    ["l"] = "open",
                    ["h"] = "close_node",
                    ["<space>"] = "none",
                    ["Y"] = {
                        function(state)
                            local node = state.tree:get_node()
                            local path = node:get_id()
                            vim.fn.setreg("+", path, "c")
                        end,
                        desc = "Copy Path to Clipboard",
                    },
                    ["O"] = {
                        function(state)
                            require("lazy.util").open(state.tree:get_node().path, { system = true })
                        end,
                        desc = "Open with System Application",
                    },
                    ["<leader>wv"] = {
                        command = function(state)
                            local node = state.tree:get_node()
                            if node.type == "file" then
                                vim.cmd("vsplit " .. node.path)
                                vim.api.nvim_win_set_config(0, { split = "left" })
                            end
                        end,
                        desc = "Open in vertical split",
                    },
                    ["<leader>wh"] = function(state)
                        local node = state.tree:get_node()
                        if node.type == "file" then
                            -- Find the main editor window (non-NeoTree window)
                            local main_win = nil
                            for _, win in ipairs(vim.api.nvim_list_wins()) do
                                local buf = vim.api.nvim_win_get_buf(win)
                                local ft = vim.api.nvim_buf_get_option(buf, "filetype")
                                if ft ~= "neo-tree" then
                                    main_win = win
                                    break
                                end
                            end

                            if main_win then
                                -- Switch to the main editor window
                                vim.api.nvim_set_current_win(main_win)
                                -- Open the file in a horizontal split
                                vim.cmd("split " .. node.path)
                            else
                                -- Fallback: Open in the current window
                                vim.cmd("split " .. node.path)
                            end
                        end
                    end,
                    ["P"] = { "toggle_preview", config = { use_float = false } },
                },
            },
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                git_status = {
                    symbols = {
                        unstaged = "󰄱",
                        staged = "󰱒",
                    },
                },
            },
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = true,
        }
    end,
}
