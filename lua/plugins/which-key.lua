-- configurations are at https://github.com/folke/which-key.nvim
local config = {
    window = {
        border = "single", -- none, single, double, shadow
        -- winblend = 20, -- value between 0-100. 100 for fully transparent
    },
}

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup(config)
    end,
}
