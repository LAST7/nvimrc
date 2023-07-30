return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        local lualine_palenight = require("lualine.themes.palenight")

        -- go to https://github.com/nvim-lualine/lualine.nvim
        local config = {
            options = {
                icons_enabled = true,
                theme = lualine_palenight,
                component_separators = { left = ")", right = "(" },
                section_separators = { left = "", right = "" },
                -- section_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                -- section_separators = '|',
            },
            sections = {
                lualine_c = { "filename" },
                -- show @recording message
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ffae64" },
                    },
                },
            },
        }

        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Add the Lsp server name to the status bar
        ins_left({
            function()
                local msg = "None"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()

                if next(clients) == nil then
                    return msg
                end

                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = " LSP:",
            color = { fg = "#ffffff", gui = "bold" },
        })

        require("lualine").setup(config)
    end,
}
