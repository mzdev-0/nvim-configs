return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["jj"] = actions.close,
            },
          },
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fs", require("telescope.builtin").live_grep, { desc = "Find string" })
      vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find buffer" })
      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Find help" })
      vim.keymap.set("n", "<leader><leader>", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.getcwd(),
          hidden = true,
        })
      end, { desc = "Find files in project root" })
    end,
  },
}
