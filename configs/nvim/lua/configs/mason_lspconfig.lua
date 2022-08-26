local M = {}


M.options = {
    -- language servers to automatically install
    ensure_installed = {}
}


M.setup = function()
    local present, mason_lspconfig = pcall(require, "mason-lspconfig")

    if not present then
        return
    end



    mason_lspconfig.setup {}
end

return M
