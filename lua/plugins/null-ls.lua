return {
    "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
    event = "VeryLazy",
    config = function()
        local formatting = require("null-ls").builtins.formatting
        local diagnostics = require("null-ls").builtins.diagnostics
        -- local completion = require("null-ls").builtins.completion

        -- to setup format on save
        -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local config = {
            border = "rounded",
            -- setup formatters & linters
            sources = {
                -- to disable file types use
                -- "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
                -- set tab width
                formatting.prettier.with({
                    extra_args = function()
                        return {
                            "--tab-width",
                            4,
                        }
                    end,
                }),
                formatting.stylua.with({
                    extra_args = function()
                        return {
                            "--indent-type",
                            "Spaces",
                            "--indent-width",
                            4,
                        }
                    end,
                }), -- lua formatter
                formatting.sqlfmt,
                diagnostics.codespell,
                diagnostics.eslint_d.with({ -- js/ts linter
                    -- only enable eslint if root has .eslintrc.js
                    condition = function(utils)
                        return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
                    end,
                }),
                -- require("typescript.extensions.null-ls.code-actions"),
                -- completion.spell,
            },
            -- configure format on save
            on_attach = function(current_client, bufnr)
                if current_client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                filter = function(client)
                                    --  only use null-ls for formatting instead of lsp server
                                    return client.name == "null-ls"
                                end,
                                bufnr = bufnr,
                            })
                        end,
                    })
                end
            end,
        }
        require("null-ls").setup(config)
    end,
}
