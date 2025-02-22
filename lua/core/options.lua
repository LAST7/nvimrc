local opt = vim.opt -- for conciseness

-- neovide settings
if vim.g.neovide then
    opt.guifont = "FiraCode Nerd Font:h11"

    vim.g.neovide_fullscreen = false
    vim.g.neovide_transparency = 0.8
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_scale_factor = 1.25

    -- frame rate display
    -- vim.g.neovide_profiler = true
end

-- disable EditorConfig
vim.g.editorconfig = false

-- line numbers
opt.number = true -- shows absolute line number on cursor line
opt.relativenumber = true
-- shows both absolute line number and relative line number
-- but gitsign will disappear if this turned on
-- opt.statuscolumn = "%l %r"

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- 2 spaces for c & cpp
--[[ vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.tabstop = 4
    end,
}) ]]

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight cursorline

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

-- UTF-8
opt.fileencoding = "UTF-8"
vim.g.encoding = "UTF-8"

-- remain lines around the cursor
opt.scrolloff = 8
opt.sidescrolloff = 8

-- show invisible characters
opt.list = true
opt.listchars = {
    space = "·",
    -- tab = "^I",
    tab = ">~",
    eol = "↴",
    trail = "■",
}

-- enhance the completion function
opt.wildmenu = true
opt.completeopt = "menu,menuone,noselect"

-- wait for mappings
opt.timeout = true
opt.timeoutlen = 300

-- apply search when typing
opt.incsearch = true

-- mouse support
opt.mouse = "a"

-- the reference line on the right side
opt.colorcolumn = "80"
