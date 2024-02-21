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
    -- "xml",
    "markdown",
    "markdown_inline",
    -- "svelte",
    -- "graphql",
    "bash",
    "lua",
    "python",
    "vim",
    "vimdoc",
    "dockerfile",
    "gitignore",
}

local config = {
    -- enable syntax highlighting
    highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
    },
    -- enable indentation
    indent = { enable = true, disable = { "python" } },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true, disable = { "javascriptreact", "typescriptreact" } },
    textobjects = {
        -- TODO: mapping to switch the selections
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
            },
        },
    },
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
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
        -- treesitter uses weird way of loading user config
        require("nvim-treesitter.configs").setup(config)
        require("nvim-treesitter").setup()
    end,
}
