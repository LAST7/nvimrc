local config = { }

return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function ()
        require("Comment").setup(config)
    end
}
