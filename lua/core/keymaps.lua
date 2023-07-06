local keymap = vim.keymap
local utils = require("core.utils")
local maps = { i = {}, n = {}, v = {}, o = {}, x = {}, t = {}, }

-- set leader key to space
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------

-- use jj to exit insert mode
maps.i["jj"] = "<ESC>"

-- use U to redo
maps.n["U"] = "<C-r>"

-- map H to ^ and L to $
for _, mode in pairs({"n", "v", "o", "x"}) do
    keymap.set(mode, "H", "^")
    keymap.set(mode, "L", "$")
end

-- change <C-d> and <C-u> to move 9 lines up/down
for _, mode in pairs({"n", "v", "o", "x"}) do
    keymap.set(mode, "<C-u>", "8k")
    keymap.set(mode, "<C-d>", "8j")
end

-- clear search highlights
maps.n["<leader>nh"] = { "<cmd>nohl<cr>", desc = "clear search highlights" }

-- delete single character without copying into register
maps.n["x"] = '"_x'

-- window management
-- movement
for _, direction in pairs({"h", "j", "k", "l"}) do
    maps.n["<C-" .. direction .. ">"] = "<C-w>" .. direction
end
-- split
maps.n["<leader>sv"] = { "<C-w>v", desc = "split window vertically" }
maps.n["<leader>sh"] = { "<C-w>s", desc = "split window horizontally" }
maps.n["<leader>se"] = { "<C-w>=", desc = "make split windows equal in width & height" }
maps.n["<leader>sx"] = { "<cmd>close<cr>", desc = "close current split window" }


----------------------
-- Plugin Keybinds
----------------------

-- toggleterm
maps.n["<leader>tl"] = { "<cmd>ToggleTerm direction=vertical<cr>", desc = "open right terminal" }
maps.n["<leader>tj"] = { "<cmd>ToggleTerm direction=horizontal<cr>", desc = "open bottom terminal" }
maps.n["<leader>tt"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "open floating terminal" }
maps.t["<C-\\>"] = { "<C-\\><C-n>", desc = "toggle terminal" }
-- window movement in terminal
for _, direction in pairs({"h", "j", "k", "l"}) do
    maps.t["<C-" .. direction .. ">"] = "<cmd>wincmd ".. direction .. "<cr>"
end

-- nvim-colorizer
maps.n["<leader>co"] = { "<cmd>ColorizerToggle<cr>", desc = "toggle colorizer" }

-- nvim-tree
maps.n["<leader>e"] = { "<cmd>NeoTreeShowToggle<cr>", desc = "toggle lhs neo-tree file explorer" }
maps.n["<leader>u"] = { "<cmd>NeoTreeFloatToggle<cr>", desc = "toggle floating neo-tree file explorer" }

-- telescope
maps.n["<leader>ff"] = { "<cmd>Telescope find_files<cr>", desc = "find files in cwd, excluding .gitignore" }
maps.n["<leader>fs"] = { "<cmd>Telescope live_grep<cr>", desc = "live grep string in cwd" }
maps.n["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", desc = "list available help tags" }

-- telescope notify history
maps.n["<leader>mh"] = { "<cmd>Telescope notify<cr>", desc = "list notify history" }

-- lazygit commands
maps.n["<leader>gg"] = { "<cmd>LazyGit<cr>", desc = "LazyGit" }
maps.n["<leader>gf"] = { "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit on current file" }

-- gitsigns
maps.n["]g"] = { function () require("gitsigns").next_hunk() end, desc = "Next Git hunk" }
maps.n["[g"] = { function () require("gitsigns").prev_hunk() end, desc = "Prev Git hunk" }
maps.n["<leader>gl"] = { function () require("gitsigns").blame_line() end, desc = "View Git blame" }
maps.n["<leader>gL"] = { function () require("gitsigns").blame_line{ full = true } end, desc = "View full Git blame" }
maps.n["<leader>gp"] = { function () require("gitsigns").preview_hunk() end, desc = "Preview Git hunk" }
maps.n["<leader>gr"] = { function () require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" }
maps.n["<leader>gR"] = { function () require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" }
maps.n["<leader>gs"] = { function () require("gitsigns").stage_hunk() end, desc = "Stage Git hunk" }
maps.n["<leader>gS"] = { function () require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" }
maps.n["<leader>gu"] = { function () require("gitsigns").undo_stage_hunk() end, desc = "Unstage Git hunk" }
maps.n["<leader>gd"] = { function () require("gitsigns").diffthis() end, desc = "View Git diff" }

-- flash:
maps.n["<leader>lw"] = { function () require("flash").jump() end, desc = "flash" }
maps.n["<leader>lt"] = { function () require("flash").treesitter() end, desc = "flash treesitter" }
-- initialize flash with the word under the cursor
maps.n["<leader>lc"] = {
    function ()
        require("flash").jump({
            pattern = vim.fn.expand("<cword>"),
        })
    end,
    desc = "flash the word under cursor"
}
-- jump to a line
maps.n["<leader>ll"] = {
    function ()
        require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 } },
            pattern = "^",
        })
    end
}

-- restart lsp server
maps.n["<leader>rs"] = { "<cmd>LspRestart<cr>", desc = "restart lsp server" }

-- troubles
maps.n["<leader>xx"] = { "<cmd>TroubleToggle<cr>", desc = "toggle trouble panel" }
maps.n["<leader>xc"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "toggle trouble in current workspace" }
maps.n["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", desc = "toggle trouble reference" }

-- bufferline
maps.n["<A-o>"] = { "<cmd>enew<cr>", desc = "open new buffer" }
maps.n["<A-h>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "nevigate to prev buffer" }
maps.n["<A-l>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "nevigate to next buffer" }
maps.n["<A-i>"] = { "<cmd>BufferLinePick<cr>", desc = "choose buffer" }
maps.n["<A-q>"] = { "<cmd>bp|sp|bn|bd!<cr>", desc = "close buffer" }
for i = 1, 9 do
    maps.n["<A-" .. i .. ">"] = { function () require("bufferline").go_to_buffer(i) end }
end

utils.set_mappings(maps)
