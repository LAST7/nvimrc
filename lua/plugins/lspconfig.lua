-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return {
    "neovim/nvim-lspconfig", -- easily configure language servers
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
    },
    config = function()
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                silent = true,
                border = "rounded",
            }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
            ["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                { virtual_text = true }
            ),
        }

        -- fix clangd encoding bug
        capabilities.offsetEncoding = "utf-8"

        -- configure bash server
        require("lspconfig")["bashls"].setup({
            capabilities = capabilities,
            handlers = handlers,
        })

        -- configure cpp clangd
        require("lspconfig")["clangd"].setup({
            capabilities = capabilities,
            handlers = handlers,
        })

        -- configure xml server
        --[[ require("lspconfig")["lemminx"].setup({
            capabilities = capabilities,
        }) ]]

        -- configure emmet language server
        require("lspconfig")["emmet_language_server"].setup({
            capabilities = capabilities,
            filetypes = {
                "css",
                -- "eruby",
                "html",
                -- "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                -- "svelte",
                -- "pug",
                "typescriptreact",
                "vue",
            },
        })

        -- configure pyright server
        require("lspconfig")["pyright"].setup({
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                pyright = {
                    autoImportCompletion = true,
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },
        })

        -- configure lua server (with special settings)
        require("lspconfig")["lua_ls"].setup({
            capabilities = capabilities,
            handlers = handlers,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                    -- override the completion with neodev plugin
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        })
        -- enable borders for floating windows
        local lspconfig_win = require("lspconfig.ui.windows")
        lspconfig_win.default_options = {
            border = "rounded",
        }
    end,
}
