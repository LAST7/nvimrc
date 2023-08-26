-- list of parsers
local parsers = {
    "c",
    "cpp",
    "json",
    "java",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "xml",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "python",
    "vim",
    "dockerfile",
    "gitignore",
}

local config = {
    -- enable syntax highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    -- enable indentation
    indent = { enable = true, disable = { "python" } },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = parsers,
    -- auto install above language parsers
    auto_install = true,
}

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
    dependencies = {
        "windwp/nvim-ts-autotag",
    },

    config = function()
        require("nvim-treesitter.configs").setup(config)
    end,
}
