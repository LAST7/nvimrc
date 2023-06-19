-- check https://github.com/catppuccin/nvim#special-integrations for more configuration
local config = {
    flavor = "mocha", -- latte, frappe, macchiato, mocha
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
}

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function ()
        require("catppuccin").setup(config)
        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
