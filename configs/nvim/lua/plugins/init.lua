---@type {[string]: table}
local plugins = {

    -- Helper functions
    -- https://github.com/nvim-lua/plenary.nvim
    ["nvim-lua/plenary.nvim"] = { module = "plenary" },

    -- Alpha nvim - dashboard plugin
    -- https://github.com/goolord/alpha-nvim
    ["goolord/alpha-nvim"] = {
        config = function()
            require("configs.alpha").setup()
        end
    },
    -- Telescope nvim - fuzzy file search plugin
    -- https://github.com/nvim-telescope/telescope.nvim
    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        config = function()
            require("configs.telescope").setup()
        end
    },

    -- WhichKey nvim - show available keybindings
    -- https://github.com/folke/which-key.nvim
    ["folke/which-key.nvim"] = {
        module = "which-key",
        config = function()
            require("configs.whichkey").setup()
        end
    },

    -- Chadtree - Nvim File tree
    ["ms-jpq/chadtree"] = {
        branch = "chad",
        as = "chadtree",
        run = "python3 -m chadtree deps",
        config = function()
            require("configs.chadtree").setup()
        end
    },

    -- Coq_nvim - Nvim completion
    -- https://github.com/ms-jpq/coq_nvim
    ["ms-jpq/coq_nvim"] = {
        branch = "coq",
        event = "InsertEnter",
        opt = true,
        run = ":COQdeps",
        config = function()
            require("configs.coq").setup()
        end,
        disable = false
    },
    -- Coq_nvim dependency
    ["ms-jpq/coq.artifacts"] = {
        branch = "artifacts",
        config = function()
            require("configs.coq_artifacts").setup()
        end

    },

    -- Coq_nvim dependency
    ["ms-jpq/coq.thirdparty"] = {
        branch = "3p",
        config = function()
            require("configs.coq_thirdparty").setup()
        end
    },

    -- Catppuccin theme
    -- https://github.com/catppuccin/nvim
    ["catppuccin/nvim"] = {
        as = "catppuccin",
        config = function()
            require("configs.catppuccin").setup()
        end
    },

    -- Lightspeed neovim - Motion plugin
    -- https://github.com/ggandor/lightspeed.nvim
    ["ggandor/lightspeed.nvim"] = {
        as = "lightspeed",
        requires = { "tpope/vim-repeat" },
        config = function()
            require("configs.lightspeed").setup()
        end
    },

    -- Indent blankline - line guides plugin
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    ["lukas-reineke/indent-blankline.nvim"] = {
        as = "indent-blankline",
        config = function()
            require("configs.indent_blankline").setup()
        end
    },
    -- Nvim-treesitter - syntax highlighting
    -- https://github.com/nvim-treesitter/nvim-treesitter
    ["nvim-treesitter/nvim-treesitter"] = {
        config = function()
            require("configs.treesitter").setup()
        end,
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    },

    -- Bracket colorizer
    -- https://github.com/luochen1990/rainbow
    ["luochen1990/rainbow"] = {
        as = "rainbow",
        config = function()
            require("configs.rainbow").setup()
        end
    },


    -- Git diff symbols
    -- https://github.com/lewis6991/gitsigns.nvim
    ["lewis6991/gitsigns.nvim"] = {
        config = function()
            require("configs.gitsigns").setup()
        end
    },

    -- LSP server installer
    -- https://github.com/williamboman/mason.nvim
    ["williamboman/mason.nvim"] = {
        config = function()
            require("configs.mason").setup()
        end
    },

    -- Buffer line plugin
    -- https://github.com/akinsho/bufferline.nvim
    ["akinsho/bufferline.nvim"] = {
        requires = { "kyazdani42/nvim-web-devicons" },
        tag = "v2.*",
        config = function()
            require("configs.bufferline").setup()
        end
    },

    -- Neovim status line plugin
    -- https://github.com/nvim-lualine/lualine.nvim
    ["nvim-lualine/lualine.nvim"] = {
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("configs.lualine").setup()
        end
    },

    -- Color highligher plugin
    -- https://github.com/norcalli/nvim-colorizer.lua
    ["norcalli/nvim-colorizer.lua"] = {
        config = function()
            require("configs.colorizer").setup()
        end

    },
    -- Insert or delete brackets, parens, quotes in pairs
    -- https://github.com/jiangmiao/auto-pairs
    ["jiangmiao/auto-pairs"] = {
        config = function()
            require("configs.auto_pairs").setup()
        end
    },

    -- Commenting plugin for neovim
    -- https://github.com/numToStr/Comment.nvim
    ["numToStr/Comment.nvim"] = {
        config = function()
            require("configs.comment").setup()
        end

    },
    ["neovim/nvim-lspconfig"] = {
        config = function()
            require("configs.lspconfig").setup()
        end
    }
}

return plugins
