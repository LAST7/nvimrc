local config = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
}

return {
    "folke/flash.nvim",
    event = "VeryLazy",

    config = function()
        require("flash").setup(config)
    end,
}
