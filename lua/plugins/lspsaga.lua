local config = {
    ui = {
        border = "rounded",
    },
    outline = {
        auto_close = true,
        close_after_jump = true,
        layout = "float",
    },
}

return {
    "glepnir/lspsaga.nvim",
    event = "VeryLazy",
    branch = "main",
    config = function()
        require("lspsaga").setup(config)
    end,
} -- enhanced lsp uis
