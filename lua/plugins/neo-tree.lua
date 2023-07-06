local config = {
    close_if_last_window = true,
    popup_border_style = "rounded",

    window = {
        width = 30,
    },
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "nvim-lua/plenary.lua",
        "MunifTanjim/nui.nvim",
    },

    config = function ()
        require("neo-tree").setup(config)
    end
}
