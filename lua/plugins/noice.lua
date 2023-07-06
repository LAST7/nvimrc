local config = {
    messages = {
        -- to prevent neovide from crashing
        view = false;
    },
    -- show @recording messages
    routes = {
        {
            view = "notify",
            filter = { event = "msg_showmode" },
        },
    },
    -- display the cmdline and popupmenu together
    views = {
        cmdline_popup = {
            position = {
                row = 5,
                col = "50%",
            },
            size = {
                width = 60,
                height = "auto",
            },
        },
        popupmenu = {
            relative = "editor",
            position = {
                row = 8,
                col = "50%",
            },
            size = {
                width = 60,
                height = 10,
            },
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = {
                    Normal = "Normal",
                    FloatBorder = "NoicePopupmenuBorder",
                },
            },
        },
    },
}

return {
    "folke/noice.nvim",
    config = function ()
        require("noice").setup(config)
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- "rcarriga/nvim-notify",
    }
}
