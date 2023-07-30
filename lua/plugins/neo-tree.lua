local config = {
    close_if_last_window = true,
    popup_border_style = "rounded",

    window = {
        width = 30,

        mappings = {
            -- switch between filesystem, buffers and git_status
            ["e"] = function()
                vim.api.nvim_exec("Neotree focus filesystem left", true)
            end,
            ["b"] = function()
                vim.api.nvim_exec("Neotree focus buffers left", true)
            end,
            ["g"] = function()
                vim.api.nvim_exec("Neotree focus git_status left", true)
            end,
        },
    },

    -- hide cursor in neo-tree window
    event_handlers = {
        {
            event = "neo_tree_buffer_enter",
            handler = function()
                local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
                hl.blend = 100
                vim.api.nvim_set_hl(0, "Cursor", hl)
                vim.opt.guicursor:append("a:Cursor/lCursor")
            end,
        },
        {
            event = "neo_tree_buffer_leave",
            handler = function()
                local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
                hl.blend = 0
                vim.api.nvim_set_hl(0, "Cursor", hl)
                vim.opt.guicursor:append("a:Cursor/lCursor")
            end,
        },
    },
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v2.x",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "nvim-lua/plenary.lua",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("neo-tree").setup(config)
    end,
}
