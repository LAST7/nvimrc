return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "amarakon/nvim-cmp-fonts",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local cmp = require("cmp")

        -- load vs-code like snippets from plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        -- extend snippet, making javascript react available for .ts/.tsx files
        -- BUG: js snippets are not available in .ts files,
        -- while they are available in .tsx files.
        luasnip.filetype_extend("typescript", { "javascript" })
        luasnip.filetype_extend("typescriptreact", { "javascript" })

        local WIDE_HEIGHT = 40
        local config = {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    winhighlight = "Normal:CmpBG,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
                    scrolloff = 0,
                    col_offset = 0,
                    side_padding = 1,
                    scrollbar = true,
                },
                documentation = {
                    max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
                    max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    winhighlight = "Normal:CmpBG,FloatBorder:CmpDocBorder,CursorLine:CmpSel,Search:None",
                },
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    -- replace expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- to only jump inside the snippet region
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    -- elseif luasnip.jumpable() then
                    --     luasnip.jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<A-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
                { name = "calc" }, -- calculator
                -- replace space with dash when typing a name of a font
                -- to avoid cmp restarting
                -- { name = "fonts", option = { space_filter = "-" } }, -- fonts
            }),
            -- configure lspkind for vs-code like icons
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                    mode = "symbol_text",
                    menu = {
                        buffer = "[Buf]",
                        nvim_lsp = "[LSP]",
                        path = "[Path]",
                        calc = "[Calc]",
                        luasnip = "[Lua]",
                        -- fonts = "[Font]",
                    },
                }),
            },
        }

        require("cmp").setup(config)
    end,
}
