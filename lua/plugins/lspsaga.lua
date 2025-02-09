local config = {
    ui = {
        border = "rounded",
    },
    outline = {
        auto_close = true,
    },
}

return {
    "glepnir/lspsaga.nvim",
    event = "VeryLazy",
    branch = "main",

    opts = config,
} -- enhanced lsp uis
