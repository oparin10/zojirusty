local M = {}


M.options = {

    show_current_context = true,
    show_current_context_start = true
}
M.setup = function()
    local present, indent_blankline = pcall(require, "indent-blankline")

    if not present then
        return
    end
    vim.opt.list = true
    vim.opt.listchars:append("eol:↴")
    vim.o.termguicolors = true

    local options = M.options

    indent_blankline.setup(options)

end


return M
