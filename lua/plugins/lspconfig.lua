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
    },
    config = function ()
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        -- fix clangd encoding bug
        capabilities.offsetEncoding = 'utf-8'

        -- configure bash server
        require("lspconfig")["bashls"].setup{
            capabilities = capabilities,
        }

        -- configure cpp clangd
        require("lspconfig")["clangd"].setup({
            capabilities = capabilities,
        })

        -- configure xml server
        require("lspconfig")["lemminx"].setup({
            capabilities = capabilities,
        })

        -- configure css server
        require("lspconfig")["cssls"].setup({
            capabilities = capabilities,
        })

        -- configure html server
        require("lspconfig")["html"].setup({
            capabilities = capabilities,
        })

        require("lspconfig")["cssls"].setup({
            capabilities = capabilities,
        })
        -- configure emmet language server
        require("lspconfig")["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- configure pyright server
        require("lspconfig")["pyright"].setup({
            capabilities = capabilities,
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
                },
            },
        })
        -- enable borders for floating windows
        local lspconfig_win = require("lspconfig.ui.windows")
        lspconfig_win.default_options = {
            border = "rounded",
        }
    end
}
