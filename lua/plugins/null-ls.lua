return {
    "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
    event = "VeryLazy",
    config = function ()
        -- for conciseness
        -- local formatting = require("null-ls").builtins.formatting -- to setup formatters
        local diagnostics = require("null-ls").builtins.diagnostics -- to setup linters

        -- to setup format on save
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


        local config = {
            -- setup formatters & linters
            sources = {
                --  to disable file types use
                --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
                -- formatting.prettier, -- js/ts formatter
                -- formatting.stylua, -- lua formatter
                diagnostics.codespell,
                diagnostics.eslint_d.with({ -- js/ts linter
                    -- only enable eslint if root has .eslintrc.js
                    condition = function(utils)
                        return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
                    end,
                }),
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
    end
}
