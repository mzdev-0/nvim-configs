return {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    lazy = false,
    priority = 970,
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "gopls",
                "clangd",
            },
            automatic_installation = true, -- if lsp is speced elsewhere, will also be installed
        })
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "black",
                "clang-format",
                "htmlbeautifier",
            },
        })
    end,
}
