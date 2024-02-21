return {
    "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
    event = "VeryLazy",
    config = function()
        local formatting = require("null-ls").builtins.formatting
        local diagnostics = require("null-ls").builtins.diagnostics
        -- local completion = require("null-ls").builtins.completion

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
                formatting.autopep8, -- python formatter
                formatting.sqlfmt, -- sql formatter
                -- diagnostics.codespell,
                diagnostics.eslint_d.with({ -- js/ts linter
                    -- only enable eslint if root has .eslintrc.js
                    condition = function(utils)
                        return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
                    end,
                }),
                -- completion.spell,
            },
            -- configure formatting keymap
            on_attach = function(current_client)
                local utils = require("core.utils")
                local maps = { n = {} }

                if current_client.supports_method("textDocument/formatting") then
                    maps.n["<space>w"] = {
                        function()
                            vim.lsp.buf.format({
                                filter = function(client)
                                    return client.name == "null-ls"
                                end,
                            })
                        end,
                        desc = "format the buffer with null-ls formatter",
                    }
                    utils.set_mappings(maps)
                    -- configure format on save
                    --[[ vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
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
                    }) ]]
                end
            end,
        }
        require("null-ls").setup(config)
    end,
}
