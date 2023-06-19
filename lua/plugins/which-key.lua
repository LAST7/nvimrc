-- configurations are at https://github.com/folke/which-key.nvim
local config = { }

return {
    "folke/which-key.nvim",
    config = function ()
        require("which-key").setup(config)
    end
}
