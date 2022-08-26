local M = {}

M.options = {}
M.setup = function()
    local present, rainbow = pcall(require, "rainbow")

    if not present then
        return
    end
end


return M
