vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false }) -- Rebinds "jj" to Escape.

vim.api.nvim_set_keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.api.nvim_set_keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.api.nvim_set_keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.api.nvim_set_keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

------- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Fuzzy find string in cwd" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy find buffer" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })

------- Obsidian
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Open Obsidian Template Picker" })
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Open Obsidian Quick Switcher" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Open Obsidian String Search" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianFollowLink<CR>", { desc = "Follows Link under Cursor" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Open Backlinks Picker" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLink<CR>", { desc = "Links selected text to a note" })
vim.keymap.set("n", "<leader>oe", "<cmd>ObsidianExtractNote<CR>", { desc = "Extracts selected text into new note" })
