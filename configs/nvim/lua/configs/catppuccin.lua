local M = {}

M.options = {}

M.setup = function()
    local present, catppuccin = pcall(require, "catppuccin")

    if not present then
        return
    end
    local options = M.options
    vim.g.catppuccin_flavour = "mocha"

    catppuccin.setup(options)

    vim.cmd [[colorscheme catppuccin]]
end


return M
