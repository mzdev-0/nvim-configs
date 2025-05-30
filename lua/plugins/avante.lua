return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = "openrouter",
    auto_suggestions_provider = "gemini",
    gemini = {
      model = "gemini-2.5-flash-preview-05-20",
      safety_settings = {
        {
          category = "HARM_CATEGORY_HARASSMENT",
          threshold = "OFF",
        },
        {
          category = "HARM_CATEGORY_DANGEROUS_CONTENT",
          threshold = "OFF",
        },
        {
          category = "HARM_CATEGORY_HATE_SPEECH",
          threshold = "OFF",
        },
        {
          category = "HARM_CATEGORY_SEXUALLY_EXPLICIT",
          threshold = "OFF",
        },
        {
          category = "HARM_CATEGORY_CIVIC_INTEGRITY",
          threshold = "OFF",
        },
      },
    },
    vendors = {
      ["gemini-chat"] = {
        __inherited_from = "gemini",
        model = "gemini-2.5-pro-preview-05-06",
      },
      ["openrouter"] = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1/",
        model = "deepseek/deepseek-chat-v3-0324",
        api_key_name = "OPENROUTER_API_KEY",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
