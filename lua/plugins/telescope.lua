
-- import telescope actions safely
--[[ local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end ]]

-- telescope.load_extension("fzf")

local config = {}

return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    config = function ()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("notify")
        require("telescope").setup(config)
    end
}
