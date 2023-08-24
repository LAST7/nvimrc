local config = {
    ui = {
        border = "rounded",
    },
}

local mason_lspconfig = {
    -- list of servers for mason to install
    ensure_installed = {
        "html",
        "cssls",
        "lua_ls",
        "emmet_ls",
        "clangd",
        "pyright",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
}

local mason_nulllsconfig = {
    -- list of formatters & linters for mason to install
    ensure_installed = {
        "prettier", -- ts/js formatter
        -- "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
        "sqlfmt",
    },
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true,
}

return {
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
    -- shouldnt be lazy. If so, directly opening a file with nvim will not start lsp
    -- event = "VeryLazy",
    dependencies = {
        "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
        "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
    },
    config = function()
        require("mason").setup(config)

        require("mason-lspconfig").setup(mason_lspconfig)
        require("mason-null-ls").setup(mason_nulllsconfig)
    end,
}
