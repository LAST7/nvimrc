local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl = "AlphaButtons",
    }

    if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end


local function footer()
    local date = os.date("  %d/%m/%Y ")
    local time = os.date("  %H:%M:%S ")
    -- local stats = require("lazy").stats()
    -- local plugins = "  " .. stats.count .. " plugins "

    local v = vim.version()
    local version = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

    return date .. time .. version
end


math.randomseed(os.time())
local header_color = "AlphaCol" .. math.random(11)

local options = {
    header = {
        type = "text",
        -- val = require("plugins.alpha.headers")["random"],
        val = {
            [[                                                    ]],
            [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
            [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
            [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
            [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
            [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
            [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
            [[                                                    ]],
        },
        opts = {
            position = "center",
            hl = "Function",
        },
    },

    buttons = {
        type = "group",
        val = {
            button("SPC n", "  New File",     ":ene <BAR> startinsert <CR>"),
            button("SPC f", "  Find File",    ":Telescope find_files<CR>"),
            button("SPC r", "  Recent File",  ":Telescope oldfiles<CR>"),
            button("SPC w", "  Find Word",    ":Telescope live_grep<CR>"),
            button("SPC b", "  Bookmarks",    ":Telescope marks<CR>"),
            button("SPC t", "  Themes",       ":Telescope colorscheme<CR>"),
            button("SPC s", "  Settings",     ":e $MYVIMRC | :cd %:p:h | :NeoTreeShowToggle<cr> | :wincmd l | :pwd<cr>"),
            button("SPC q", "  Exit Neovim",  ":qa<CR>"),
            button("SPC z", "Z  Lazy", ":Lazy<CR>"),
        },
        opts = { spacing = 1 },
    },

    footer = {
        type = "text",
        val = footer(),
        opts = {
            position = "center",
            hl = "Constant",
        },
    },
}

local padd = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.1) })

local config = {
    layout = {
        { type = "padding", val = padd },
        options.header,
        { type = "padding", val = 1 },
        options.buttons,
        { type = "padding", val = 1 },
        options.footer,
    },
    -- hide the cursor using the `highlight-blend`(requires `termguicolors` to be true)
    -- `blend = 100` means invisible
    opts = {
        setup = function ()
            -- hide cursor when in alpha
            vim.api.nvim_create_autocmd('User', {
                pattern = 'AlphaReady',
                desc = 'hide cursor for alpha',
                callback = function ()
                    local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
                    hl.blend = 100
                    vim.api.nvim_set_hl(0, 'Cursor', hl)
                    vim.opt.guicursor:append('a:Cursor/lCursor')
                end,
            })
            -- show cursor after alpha exits
            vim.api.nvim_create_autocmd('BufUnload', {
                buffer = 0,
                desc = 'show cursor after alpha',
                callback = function ()
                    local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
                    hl.blend = 0
                    vim.api.nvim_set_hl(0, 'Cursor', hl)
                    vim.opt.guicursor:remove('a:Cursor/lCursor')
                end,
            })
        end,
    },
}

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        require("alpha").setup(config)
    end,
}
