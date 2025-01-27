local function custom_on_attach(client, bufnr)
    require("lazyvim.util").on_attach(client, bufnr)
    require("config.diagnostics").setup()
end
return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = { -- Primary for LangChain type checking
                    settings = {
                        python = {
                            pythonPath = vim.fn.trim(vim.fn.system("pyenv which python")),
                            analysis = {
                                extraPaths = {
                                    vim.fn.system("pyenv prefix"):gsub("%s+", "")
                                        .. "/lib/python"
                                        .. vim.fn
                                            .system(
                                                [[python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"]]
                                            )
                                            :gsub("%s+", "")
                                        .. "/site-packages",
                                },
                                typeCheckingMode = "basic",
                                diagnosticSeverityOverrides = {
                                    reportMissingTypeStubs = "none", -- LangChain-specific quirk
                                },
                            },
                        },
                    },
                },
            },
            setup = {
                pyright = function(_, opts)
                    require("lspconfig").pyright.setup(opts)
                end,
                ["*"] = function(server, opts)
                    opts.on_attach = function(client, bufnr)
                        custom_on_attach(client, bufnr)
                        if opts.setup and opts.setup.on_attach then
                            opts.setup.on_attach(client, bufnr)
                        end
                    end
                    return opts
                end,
            },
        },
    },
}
