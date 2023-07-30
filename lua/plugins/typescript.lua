local config = {
    server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = {
            vim.keymap.set("n", "gD", "<cmd>TypescriptGoToSourceDefinition<cr>"),
        },
    },
}

return {
    "jose-elias-alvarez/typescript.nvim",
    event = "VeryLazy",

    config = function()
        -- require("typescript").setup({})
        require("typescript").setup(config)
    end,
}
