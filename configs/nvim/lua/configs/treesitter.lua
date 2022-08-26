local M = {}

M.options = {
    ensure_installed = {
        "lua", "rust"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
}

M.setup = function()
    local present, treesitter = pcall(require, "nvim-treesitter.configs")

    if not present then
        return
    end

    local options = M.options

    treesitter.setup(options)
end


return M
