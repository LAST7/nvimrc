local M = {}

--- Get highlight properties for a given highlight name
---@param name string The highlight group name
---@param fallback? table The fallback highlight properties
---@return table properties # the highlight group properties
function M.get_hlgroup(name, fallback)
    if vim.fn.hlexists(name) == 1 then
        local hl
        if vim.api.nvim_get_hl then -- check for new neovim 0.9 API
            hl = vim.api.nvim_get_hl(0, { name = name, link = false })
            if not hl.fg then hl.fg = "NONE" end
            if not hl.bg then hl.bg = "NONE" end
        else
            hl = vim.api.nvim_get_hl_by_name(name, vim.o.termguicolors)
            if not hl.foreground then hl.foreground = "NONE" end
            if not hl.background then hl.background = "NONE" end
            hl.fg, hl.bg = hl.foreground, hl.background
            hl.ctermfg, hl.ctermbg = hl.fg, hl.bg
            hl.sp = hl.special
        end
        return hl
    end
    return fallback or {}
end

--- Register queued which-key mappings
function M.which_key_register()
    if M.which_key_queue then
        local wk_avail, wk = pcall(require, "which-key")
        if wk_avail then
            for mode, registration in pairs(M.which_key_queue) do
                wk.register(registration, { mode = mode })
            end
        M.which_key_queue = nil
        end
    end
end

--- Table based API for setting keybindings
---@param map_table table A nested table where the first key is the vim mode, the second key is the key to map, and the value is the function to set the mapping to
---@param base? table A base set of options to set on every keybinding
function M.set_mappings(map_table, base)
    -- iterate over the first keys for each mode
    base = base or {}
    for mode, maps in pairs(map_table) do
        -- iterate over each keybinding set in the current mode
        for keymap, options in pairs(maps) do
            -- build the options for the command accordingly
            if options then
                local cmd = options
                local keymap_opts = base
                if type(options) == "table" then
                    cmd = options[1]
                    keymap_opts = vim.tbl_deep_extend("force", keymap_opts, options)
                    keymap_opts[1] = nil
                end
                if not cmd or keymap_opts.name then -- if which-key mapping, queue it
                    if not keymap_opts.name then keymap_opts.name = keymap_opts.desc end
                    if not M.which_key_queue then M.which_key_queue = {} end
                    if not M.which_key_queue[mode] then M.which_key_queue[mode] = {} end
                    M.which_key_queue[mode][keymap] = keymap_opts
                else -- if not which-key mapping, set it
                    vim.keymap.set(mode, keymap, cmd, keymap_opts)
                end
            end
        end
    end
      if package.loaded["which-key"] then M.which_key_register() end -- if which-key is loaded already, register
end


return M
