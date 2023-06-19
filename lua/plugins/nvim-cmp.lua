return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function ()
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local cmp = require("cmp")

        -- load vs-code like snippets from plugins (e.g. friendly-snippets)
        require("luasnip/loaders/from_vscode").lazy_load()
        vim.opt.completeopt = "menu,menuone,noselect"

        local config = {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),
            -- configure lspkind for vs-code like icons
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        }

        require("cmp").setup(config)
    end

}
