local config = {
    scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = false,
        include = {
            node_type = {
                ['*'] = { "*" },
            },
        },
    },
    indent = {
        char = '▎'
    }
}

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",

    opts = config,
}
