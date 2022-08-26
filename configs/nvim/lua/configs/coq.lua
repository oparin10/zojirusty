local M = {}


M.options = {}

M.setup = function()
    local present, coq = pcall(require, 'coq')

    if not present then
        return
    end

    vim.g.coq_settings = { auto_start = "shut-up" }
    -- coq.Now() --- Start coq
end


return M
