local M = {}
M.options = {}
M.setup = function()
    local present, lightspeed = pcall(require, "lightspeed")

    if not present then
        return
    end
    -- no need to call setup unless you want to change the options
end

return M
