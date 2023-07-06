local config = {
    show_end_of_line = true,
    show_current_context = true,
    indent_blankline_show_trailing_blankline_indent = false,
}

return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",

    config = function ()
        require("indent_blankline").setup(config)
    end
}
