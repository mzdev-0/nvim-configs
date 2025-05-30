vim.api.nvim_set_keymap("i", "jj", "<esc>", { noremap = false }) -- rebinds "jj" to escape.
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })

-- window splitting
vim.api.nvim_set_keymap("n", "<leader>wv", "<c-w>v", { desc = "split window vertically" })
vim.api.nvim_set_keymap("n", "<leader>ws", "<c-w>s", { desc = "split window horizontally" })
vim.api.nvim_set_keymap("n", "<leader>we", "<c-w>=", { desc = "make splits equal size" })
vim.api.nvim_set_keymap("n", "<leader>wx", "<cmd>close<cr>", { desc = "close current split" })

-- resize window using <ctrl> arrow keys
--map("n", "<c-up>", "<cmd>resize +2<cr>", { desc = "increase window height" })
--map("n", "<c-down>", "<cmd>resize -2<cr>", { desc = "decrease window height" })
--map("n", "<c-left>", "<cmd>vertical resize -2<cr>", { desc = "decrease window width" })
--map("n", "<c-right>", "<cmd>vertical resize +2<cr>", { desc = "increase window width" })

-- move lines
--map("n", "<a-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "move down" })
--map("n", "<a-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "move up" })
--map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move down" })
--map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move up" })
--map("v", "<a-j>", ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "move down" })
--map("v", "<a-k>", ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "move up" })

-- window navigation, <ctrl> hjkl
vim.keymap.set("n", "<leader>ww", "<c-w>w", { desc = "cycle windows" })
vim.keymap.set("n", "<leader>wh", "<c-w>h", { desc = "window left" })
vim.keymap.set("n", "<leader>wj", "<c-w>j", { desc = "window down" })
vim.keymap.set("n", "<leader>wk", "<c-w>k", { desc = "window up" })
vim.keymap.set("n", "<leader>wl", "<c-w>l", { desc = "window right" })

------- obsidian
vim.keymap.set("n", "<leader>ot", "<cmd>obsidiantemplate<cr>", { desc = "open obsidian template picker" })
vim.keymap.set("n", "<leader>of", "<cmd>obsidianquickswitch<cr>", { desc = "open obsidian quick switcher" })
vim.keymap.set("n", "<leader>os", "<cmd>obsidiansearch<cr>", { desc = "open obsidian string search" })
vim.keymap.set("n", "<leader>oo", "<cmd>obsidianfollowlink<cr>", { desc = "follows link under cursor" })
vim.keymap.set("n", "<leader>ob", "<cmd>obsidianbacklinks<cr>", { desc = "open backlinks picker" })
vim.keymap.set("n", "<leader>ol", "<cmd>obsidianlink<cr>", { desc = "links selected text to a note" })
vim.keymap.set("n", "<leader>oe", "<cmd>obsidianextractnote<cr>", { desc = "extracts selected text into new note" })

------- molten (jupyter)
vim.keymap.set("n", "<leader>mi", ":molteninit<cr>")
vim.keymap.set("n", "<leader>mh", ":moltenhideoutput<cr>")
vim.keymap.set(
    "v",
    "<leader>mv",
    ":<c-u>moltenevaluatevisual<cr>",
    { silent = true, desc = "evaluate visual selection" }
)
vim.keymap.set("n", "<leader>mr", ":moltenreevaluatecell<cr>", { silent = true, desc = "re-evaluate cell" })
vim.keymap.set("n", "<leader>mo", ":moltenshowoutput<cr>", { silent = true, desc = "show output" })
vim.keymap.set("n", "<leader>mo", ":moltenevaluateoperator<cr>", { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<leader>me", ":moltenevaluateline<cr>", { silent = true, desc = "evaluate line" })

-- modified up down left right keymaps without the helper
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<down>", "v:count == 0 ? 'gj' : 'j'", { desc = "down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<up>", "v:count == 0 ? 'gk' : 'k'", { desc = "up", expr = true, silent = true })

-- move lines
vim.keymap.set("n", "<a-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "move down" })
vim.keymap.set("n", "<a-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "move up" })
vim.keymap.set("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move down" })
vim.keymap.set("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move up" })
vim.keymap.set("v", "<a-j>", ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "move down" })
vim.keymap.set("v", "<a-k>", ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "move up" })

-- buffers
vim.keymap.set("n", "<s-h>", "<cmd>bprevious<cr>", { desc = "prev buffer" })
vim.keymap.set("n", "<s-l>", "<cmd>bnext<cr>", { desc = "next buffer" })

vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "prev buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "next buffer" })

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "prev buffer" })

vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "switch to other buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "switch to other buffer" })

vim.keymap.set("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>bo", function()
    Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

--- clear highlighted search terms
vim.keymap.set(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "UI Redraw / Clear Highlights / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
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
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

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
    require("conform").format()
end, { desc = "Format with Conform" })

-- diagnostic
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Git Integrations
vim.keymap.set("n", "<leader>gg", "<cmd>Git<cr>", { desc = "Fugitive Status" })
vim.keymap.set("n", "<leader>gb", function()
    require("gitsigns").blame_line({ full = true })
end, { desc = "Git Blame Line" })

-- lazygit
if vim.fn.executable("lazygit") == 1 then
    vim.keymap.set("n", "<leader>gg", function()
        Snacks.lazygit()
    end, { desc = "Lazygit (cwd)" })
    vim.keymap.set("n", "<leader>gf", function()
        Snacks.picker.git_log_file()
    end, { desc = "Git Current File History" })
    vim.keymap.set("n", "<leader>gL", function()
        Snacks.picker.git_log()
    end, { desc = "Git Log (cwd)" })
end

vim.keymap.set("n", "<leader>gb", function()
    Snacks.picker.git_log_line()
end, { desc = "Git Blame Line" })
vim.keymap.set({ "n", "x" }, "<leader>gB", function()
    Snacks.gitbrowse()
end, { desc = "Git Browse (open)" })
vim.keymap.set({ "n", "x" }, "<leader>gY", function()
    Snacks.gitbrowse({
        open = function(url)
            vim.fn.setreg("+", url)
        end,
        notify = false,
    })
end, { desc = "Git Browse (copy)" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
vim.keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
vim.keymap.set("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- floating terminal
vim.keymap.set("n", "<leader>ft", function()
    Snacks.terminal()
end, { desc = "Terminal (cwd)" })

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

-- LSP

vim.keymap.set("n", "<leader>cR", function()
    Snacks.rename.rename_file()
end, { desc = "Rename File", silent = true, noremap = true })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename", silent = true, noremap = true })
vim.keymap.set("n", "]]", function()
    Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference", silent = true, noremap = true })
vim.keymap.set("n", "[[", function()
    Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference", silent = true, noremap = true })
vim.keymap.set("n", "<a-n>", function()
    Snacks.words.jump(vim.v.count1, true)
end, { desc = "Next Reference", silent = true, noremap = true })
vim.keymap.set("n", "<a-p>", function()
    Snacks.words.jump(-vim.v.count1, true)
end, { desc = "Prev Reference", silent = true, noremap = true })
