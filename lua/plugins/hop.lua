-- you can configure Hop the way you like here; see :h hop-config
local config = {
    keys = "etovxqpdygfblzhckisuran",
}

return {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "VeryLazy",
    config = function ()
        require("hop").setup(config)
    end
}
