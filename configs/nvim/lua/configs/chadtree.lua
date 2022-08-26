local M = {}
local fn = vim.fn
local utils = require("core.utils")


local chadtree_deps_path = fn.stdpath("data") .. "/site/pack/start/chadtree/.vars"


M.options = {}
M.setup = function()
    local present, chadtree = pcall(require, "chadtree")

    if not present then
        return
    end
    -- Run CHADdeps if the install path is empty
    -- if utils.path_is_empty(chadtree_deps_path) then
    --     vim.cmd [[echo "Running CHADdeps..."]]
    --     vim.cmd [[CHADdeps]]

    -- else
    --     vim.cmd [[echo "CHADdeps already installed"]]
    -- end
end

return M
