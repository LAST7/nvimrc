local config = {}

return {
    "MattesGroeger/vim-bookmarks",
    dependencies = {
        "tom-anders/telescope-vim-bookmarks.nvim",
    },

    config = function()
        vim.g.bookmark_sign = ""
        vim.g.bookmark_highlight_lines = 1

        require("telescope").load_extension("vim_bookmarks")
    end,
}
