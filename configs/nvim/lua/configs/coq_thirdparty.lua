local M = {}


M.options = {
}

M.setup = function()
    local present, artifacts = pcall(require, "coq_3p")

    if not present then
        return
    end

    local options = M.options

    artifacts(options)
end


return M
