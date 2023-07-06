-- check https://github.com/catppuccin/nvim#special-integrations for more configuration
local config = {
    flavor = "mocha", -- latte, frappe, macchiato, mocha
    floating_border = "on",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    term_colors = true,
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic" },
        onditionals = {},
        loops = {},
        functions = { "italic" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = { "italic" },
    },
    integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        hop = true,
        telescope = true,
        treesitter_context = true,
        nvimtree = true,
        markdown = true,
        lsp_trouble = true,
        mason = true,
        noice = true,
        notify = true,
        which_key = true,
        native_lsp = {
            enable = true,
            virtual_text = {
                errors = { "bold" },
                hints = { "italic" },
                warnings = {},
                information = {},
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        }
    },
    -- rosewater, flamingo, pink, mauve, red, maroon, peach, yellow...
    -- more colors: https://github.com/catppuccin/catppuccin#-palette
    custom_highlights = function (C)
        return {
            NormalFloat = { bg = C.none }, -- transparent
            TabLineSel = { bg = C.pink },
            Pmenu = { bg = C.none },
            PmenuSel = { bg = C.overlay0 },

            -- nvim-cmp
            -- change values in `winhighlight`
            CmpBorder = { fg = C.yellow },
            CmpDocBorder = { fg = C.rosewater },
            CmpBG = { link = "Pmenu" },
            CmpSel = { link = "PmenuSel" },
            -- telescope
            -- https://github.com/nvim-telescope/telescope.nvim/wiki/FAQ#how-to-change-telescope-highlights-group
            TelescopeBorder = { fg = C.blue },
            -- noice
            -- https://github.com/folke/noice.nvim#-highlight-groups
            NoicePopupmenuBorder = { link = "CmpBorder" },
            -- flash
            -- https://github.com/folke/flash.nvim#-highlights
            FlashLabel = { fg = C.base, bg = C.maroon },
            FlashMatch = { fg = C.text, bg = C.surface2 },
            FlashCurrent = { fg = C.base, bg = C.lavender },
            -- neo-tree
            NeoTreeFloatBorder = { link = "FloatBorder" }
        }
    end,
}

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function ()
        -- setup must be called before loading
        require("catppuccin").setup(config)
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
