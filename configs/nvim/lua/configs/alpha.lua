local M = {}

M.options = {}

M.setup = function()
    local present, alpha = pcall(require, "alpha")

    if not present then
        return
    end

    alpha.setup(require 'alpha.themes.dashboard'.config)
end


return M
