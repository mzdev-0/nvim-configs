return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = {
    options = {
      theme = "auto",
      globalstatus = vim.o.laststatus == 3,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
      lualine_z = {
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  },
}
