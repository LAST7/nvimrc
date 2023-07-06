return {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    cmd = "Markdown",
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
}
