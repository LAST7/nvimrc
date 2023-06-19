local config = {
    filetypes = { "*" },

}

return {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function ()
        require("colorizer").setup(config)
    end
}
