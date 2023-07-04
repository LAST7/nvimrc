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
    custom_highlights = function (C)
        return {
            NormalFloat = { bg = C.surface0 },
            TabLineSel = { bg = C.pink },
            CmpBorder = { fg = C.yellow },
            CmpDocBorder = { fg = C.rosewater },
            Pmenu = { bg = C.none },
            PmenuSel = { bg = C.overlay0 },
            TelescopeBorder = { fg = C.blue },
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
