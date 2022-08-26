---@type {bootstrap: fun(plugins: table): nil, build_plugin_table: fun(plugins: table): table, options: table, run: fun(plugins:table): nil}
local M = {}


--- Packer options
---@type table
M.options = {
    auto_clean = true,
    compile_on_sync = true,
    git = { clone_timeout = 6000 },
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

--- Transforms a { [string]: table } into a table in which the string key is the zeroth item in the table.
---@param plugins table
---@return table
M.build_plugin_table = function(plugins)
    local plugin_table = {}
    for key, value in pairs(plugins) do
        local inner_table = {}

        table.insert(inner_table, key)
        for k, v in pairs(value) do
            inner_table[k] = v
        end
        table.insert(plugin_table, inner_table)
    end

    return plugin_table
end

--- Checks if the path is empty and if it is, bootstraps packer by cloning the repo into the appropriate path
---@param plugins table
---@return nil
M.bootstrap = function(plugins)
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    local utils = require("core.utils")
    -- Sets packer floating window background color
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })

    if utils.path_is_empty(install_path) then
        packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
            install_path })
        vim.cmd [[packadd packer.nvim]]
    end

    local packer = require("packer")

    packer.init(M.options)


    local plugin_table = M.build_plugin_table(plugins)

    return packer.startup(function(use)
        use "wbthomason/packer.nvim"
        for _, plugin in pairs(plugin_table) do
            use(plugin)
        end

        if packer_bootstrap then
            packer.sync()
        end
    end)
end

return M
