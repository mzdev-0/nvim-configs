return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "GEMINI_API_KEY",
          model = "gemini-2.0-flash-exp",
        },
      })
    end,
  },
  opts = {
    strategies = {
      chat = {
        adapter = "gemini"
      },
      inline = {
        adapter = "gemini",
      },
    },
    display = {
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ",
        provider = "telescope",
        opts = {
          show_default_actions = true,
          show_default_prompt_library = true,
        },
      },
    },
  },
}
