return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = false,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "vault",
                    path = "~/Documents/vault/",
                },
            },
            templates = {
                folder = "/home/cas/Documents/vault/Templates/",
            },
        },
    },
}
