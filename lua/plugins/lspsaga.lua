return {
    "glepnir/lspsaga.nvim",
    event = "VeryLazy",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
} -- enhanced lsp uis
