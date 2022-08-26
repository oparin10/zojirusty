local M = {}

M.options = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
}

M.setup = function()
    local present, auto_pairs = pcall(require, "nvim-autopairs")

    if not present then
        return
    end

    local options = M.options

    auto_pairs.setup(options)
end


return M
