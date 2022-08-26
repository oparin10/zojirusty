local M = {}

M.options = {
    -- not a typo, bufferline config goes inside a "options" table
    options = {}
}
M.setup = function()
    local present, bufferline = pcall(require, "bufferline")

    if not present then
        return
    end

    vim.opt.termguicolors = true

    local options = M.options

    bufferline.setup(options)
end



return M
