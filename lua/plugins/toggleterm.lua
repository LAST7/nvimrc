local config = {
    open_mapping = [[<C-\>]],
    direction = "float",
    size = function (term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,

    autochdir = true,
    shade_terminals = true,
    -- shade_factor = 2
    start_in_insert = true,
    insert_mappings = true,
    close_on_exit = true,
    -- shell = 
    float_opts = {
        border = "curved", -- "single", "double", "shadow", "curved"
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
    winbar = {
        enabled = true,
        name_formatter = function (term)
            return term.name
        end,
    },
}

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",

    config = function ()
        require("toggleterm").setup(config)
    end
}
