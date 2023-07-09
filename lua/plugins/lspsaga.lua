local config = {
    ui = {
        border = 'rounded',
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
