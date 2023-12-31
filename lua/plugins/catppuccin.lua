-- rosewater, flamingo, pink, mauve, red, maroon, peach, yellow...
-- more colors: https://github.com/catppuccin/catppuccin#-palette
local highlight_groups = function(C)
    return {
        NormalFloat = { bg = C.none }, -- transparent
        FloatBorder = { fg = C.lavender },
        TabLineSel = { bg = C.red },
        Pmenu = { bg = C.none },
        PmenuSel = { bg = C.overlay0 },

        -- nvim-cmp
        -- change values in `winhighlight`
        CmpBorder = { fg = C.yellow },
        CmpDocBorder = { fg = C.rosewater },
        CmpBG = { link = "Pmenu" },
        CmpSel = { link = "PmenuSel" },
        -- telescope
        -- https://github.com/nvim-telescope/telescope.nvim/wiki/
        -- FAQ#how-to-change-telescope-highlights-group
        TelescopeBorder = { fg = C.blue },
        -- noice
        -- https://github.com/folke/noice.nvim#-highlight-groups
        NoicePopupmenuBorder = { link = "CmpBorder" },
        -- flash
        -- https://github.com/folke/flash.nvim#-highlights
        FlashLabel = { fg = C.crust, bg = C.red },
        FlashMatch = { fg = C.text, bg = C.surface2 },
        FlashCurrent = { fg = C.surface1, bg = C.blue },
        --[[ -- neo-tree
        NeoTreeFloatBorder = { link = "FloatBorder" },
        NeoTreeTabInactive = { link = "Pmenu" },
        NeoTreeTabActive = { link = "CursorLine" },
        NeoTreeTabSeparatorInactive = { link = "Pmenu" },
        NeoTreeTabSeparatorActive = { link = "CursorLine" },
        -- indent-blankline
        IblIndent = { fg = C.overlay0 },
        IblScope = { fg = C.blue }, ]]
        -- null-ls
        NullLsInfoBorder = { link = "FloatBorder" },
    }
end

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
        flash = false,
        gitsigns = true,
        indent_blankline = {
            enabled = true,
            scope_color = "blue",
            colored_indent_levels = true,
        },
        lsp_trouble = true,
        markdown = true,
        mason = true,
        neotree = true,
        noice = true,
        notify = true,
        telescope = {
            enabled = true,
        },
        treesitter_context = true,
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
            inlay_hints = {
                background = true,
            },
        },
    },
    -- user defined highlight group
    custom_highlights = function(C)
        return highlight_groups(C)
    end,
}

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
        -- setup must be called before loading
        require("catppuccin").setup(config)
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
