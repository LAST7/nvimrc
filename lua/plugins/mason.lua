return {
    "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
    dependencies = {
        "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
        "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
    },
    config = function ()
        require("mason").setup()

        local mason_lspconfig = {
            -- list of servers for mason to install
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
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
            },
            -- auto-install configured formatters & linters (with null-ls)
            automatic_installation = true,
        }

        require("mason-lspconfig").setup(mason_lspconfig)
        require("mason-null-ls").setup(mason_nulllsconfig)

    end
}
