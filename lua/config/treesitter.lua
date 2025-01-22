return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "gpg",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "lua",
        "nim",
        "php",
        "python",
        "regex",
        "robots",
        "ruby",
        "solidity",
        "sql",
        "tmux",
        "vimdoc",
        "yaml",
        "markdown",
        "markdown_inline",
        "vim",
        "rust",
      },
    })
  end,
}
