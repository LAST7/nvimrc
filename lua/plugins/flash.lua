local config = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
}

return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = function () return {} end,

    config = function ()
        require("flash").setup(config)
    end
}
