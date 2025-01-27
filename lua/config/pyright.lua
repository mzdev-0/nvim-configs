require("lspconfig").pyright.setup({
    on_attach = function(client, bufnr)
        -- Your existing on_attach config
    end,
    settings = {
        python = {
            pythonPath = vim.fn.trim(vim.fn.system("pyenv which python")),
            analysis = {
                typeCheckingMode = "off", -- Optional perf tweak
                extraPaths = vim.split(vim.fn.system("python -c 'import sys; print(sys.path[-1])'"), "\n"),
            },
        },
    },
})
