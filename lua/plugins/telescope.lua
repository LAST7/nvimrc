local actions = require("telescope.actions")

local config = {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
    },
}

return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    version = "0.1.x",
    config = function ()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("notify")
        require("telescope").setup(config)
    end
}
