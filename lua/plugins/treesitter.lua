return {
  -- Main Treesitter plugin
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0, --load treesitter early when opening a file frm the cmdline
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Base configuration
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "go",
      "gomod",
      "goctl",
      "cpp",
      "css",
      "csv",
      "cuda",
      "dockerfile",
      "gpg",
      "http",
      "hyprlang",
      "php",
      "powershell",
      "sql",
      "ssh_config",
      "terraform",
      "tmux",
      "xml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    {
    "folke/which-key.nvim",
      opts = {
        spec = {
          { "<BS>", desc = "Decrement Selection", mode = "x" },
          { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
        },
      },
    },

  -- Textobjects extension
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    enabled = true,
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = { ["]m"] = "@function.outer" },
            goto_previous_start = { ["[m"] = "@function.outer" },
          },
        },
      })
    end
  },
    {
      "windwp/nvim-ts-autotag",
      opts = {},
    },
  }
