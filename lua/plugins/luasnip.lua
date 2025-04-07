return {
    "L3MON4D3/LuaSnip", -- snippet engine
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("luasnip").filetype_extend("terraform", { "terraform" })
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
