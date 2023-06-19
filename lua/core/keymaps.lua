local keymap = vim.keymap

-- set leader key to space
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------

-- use jj to exit insert mode
keymap.set("i", "jj", "<ESC>")

-- use U to redo
keymap.set("n", "U", "<C-r>")

-- map H to ^ and L to $
keymap.set("n", "H", "^")
keymap.set("v", "H", "^")
keymap.set("n", "L", "$")
keymap.set("v", "L", "$")

-- change <C-d> and <C-u> to move 9 lines up/down
keymap.set("n", "<C-u>", "9k")
keymap.set("v", "<C-u>", "9k")
keymap.set("n", "<C-d>", "9j")
keymap.set("v", "<C-d>", "9j")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- toggleterm
keymap.set("n", "<leader>tl", ":ToggleTerm direction=vertical<cr>")
keymap.set("n", "<leader>tj", ":ToggleTerm direction=horizontal<cr>")
keymap.set("n", "<leader>tt", ":ToggleTerm direction=float<cr>")
keymap.set("t", "<C-\\>", "<C-\\><C-n>")
keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>")
keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>")
keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>")
keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>")

-- nvim-colorizer
keymap.set("n", "<leader>co", ":ColorizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>lds", "<cmd>Telescope lsp_document_symbols<cr>") -- list all functions/structs/classes/modules in the current buffer

-- telescope git commands
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- lazygit commands
keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>")
keymap.set("n", "<leader>gf", "<cmd>LazyGitFilterCurrentFile<cr>")

-- telescope notify history
keymap.set("n", "<leader>mh", "<cmd>Telescope notify<cr>") -- list the notification message history

-- hop cmd
keymap.set("n", "<leader>hf", ":HopWord<cr>")
keymap.set("n", "<leader>hff", ":HopWordMW<cr>")
keymap.set("n", "<leader>hc", ":HopChar2<cr>")
keymap.set("n", "<leader>hcc", ":HopChar2MW<cr>")
keymap.set("n", "<leader>hl", ":HopLine<cr>")
keymap.set("n", "<leader>hls", ":HopLineStart<cr>")

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- troubles
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xc", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- bufferline
keymap.set("n", "<A-o>", "<cmd> enew <CR>") -- new buffer
keymap.set("n", "<A-h>", "<cmd> BufferLineCyclePrev <CR>") -- nevigate previous buffer
keymap.set("n", "<A-l>", "<cmd> BufferLineCycleNext <CR>") -- -
keymap.set("n", "<A-f>", "<cmd> BufferLinePick <CR>") -- close buffer
keymap.set("n", "<A-q>", "<cmd> bp|sp|bn|bd! <CR>") -- close buffer
for i = 1, 9 do
    -- keymap.set("n", "<A-" .. i .. ">", "<cmd>" .. i .. "tabn<CR>")
    keymap.set("n", "<A-" .. i .. ">", function() require("bufferline").go_to_buffer(i) end)
end

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xc", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
