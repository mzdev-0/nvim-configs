vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false }) -- Rebinds "jj" to Escape.
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
-- Window Splitting
vim.api.nvim_set_keymap("n", "<leader>ws", "<C-w>v", { desc = "Split window vertically" })
vim.api.nvim_set_keymap("n", "<leader>wv", "<C-w>s", { desc = "Split window horizontally" })
vim.api.nvim_set_keymap("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
vim.api.nvim_set_keymap("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window navigation
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Cycle windows" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Window right" })

------- Obsidian
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Open Obsidian Template Picker" })
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Open Obsidian Quick Switcher" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Open Obsidian String Search" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianFollowLink<CR>", { desc = "Follows Link under Cursor" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Open Backlinks Picker" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLink<CR>", { desc = "Links selected text to a note" })
vim.keymap.set("n", "<leader>oe", "<cmd>ObsidianExtractNote<CR>", { desc = "Extracts selected text into new note" })

------- Molten (Jupyter)
vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>")
vim.keymap.set(
    "v",
    "<leader>mv",
    ":<C-u>MoltenEvaluateVisual<CR>",
    { silent = true, desc = "evaluate visual selection" }
)
vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
vim.keymap.set("n", "<leader>mo", ":MoltenShowOutput<CR>", { silent = true, desc = "show output" })
vim.keymap.set("n", "<leader>mo", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<leader>me", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })

-- Modified keymaps without the helper
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { desc = "Delete Other Buffers" })

vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

vim.keymap.set({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  require('cmp').close()  -- Using nvim-cmp's native close
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
vim.keymap.set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- commenting
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Formatting
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require('conform').format()
end, { desc = "Format with Conform" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set("n", "<leader>cd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>ud", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Git Integrations
vim.keymap.set("n", "<leader>gg", "<cmd>Git<cr>", { desc = "Fugitive Status" })
vim.keymap.set("n", "<leader>gb", function()
  require('gitsigns').blame_line({ full = true })
end, { desc = "Git Blame Line" })

-- Toggle Options
local toggles = {
  s = { opt = 'spell', name = 'Spelling' },
  w = { opt = 'wrap', name = 'Wrap' },
  L = { opt = 'relativenumber', name = 'Relative Number' },
  l = { opt = 'number', name = 'Line Numbers' },
}

for key, t in pairs(toggles) do
  vim.keymap.set("n", "<leader>u"..key, function()
    vim.o[t.opt] = not vim.o[t.opt]
    vim.notify(t.name .. " " .. (vim.o[t.opt] and "ON" or "OFF"))
  end, { desc = t.name })
end

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
vim.keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
vim.keymap.set("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- LazyVim Changelog
vim.keymap.set("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- Terminal
vim.keymap.set("n", "<leader>ft", "<cmd>split | terminal<cr>", { desc = "Open Terminal" })

-- Terminal Mappings
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Treesitter
vim.keymap.set("n", "<leader>uT", function()
  local ts = require("nvim-treesitter.configs")
  ts.toggle("highlight")
end, { desc = "Toggle Treesitter Highlight" })

vim.keymap.set("n", "gcc", function()
  require("ts-comments").toggle()
end, { desc = "Toggle Treesitter Comment" })

-- Todo Comments
vim.keymap.set("n", "<leader>st", "<cmd>TodoTrouble<cr>", { desc = "Todo List (Trouble)" })

-- Flash Navigation
vim.keymap.set("n", "s", function()
  require("flash").jump()
end, { desc = "Flash Jump" })

-- Neo-tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })

-- Which Key
--vim.keymap.set("n", "<leader>", "<cmd>WhichKey<cr>", { desc = "Show WhichKey" })

-- Noice
vim.keymap.set("n", "<leader>un", "<cmd>Noice dismiss<cr>", { desc = "Dismiss Notifications" })

-- Mini.ai
vim.keymap.set({ "x", "o" }, "a", function()
  require("mini.ai").find_textobj()
end, { desc = "Mini.ai text object" })


