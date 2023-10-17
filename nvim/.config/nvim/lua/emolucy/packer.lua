local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "catppuccin/nvim",
        as = "catppuccin",
        lazy = false,
        priority = 150,
    })
    use({ "ellisonleao/gruvbox.nvim" })
    -- use({'rktjmp/lush.nvim'})
    -- use "rktjmp/shipwright.nvim"

    -- use({'~/charcoal-feathers-extended', as = "charcoalfeathers", config = vim.cmd.colorscheme "charcoalfeathers"})

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("tpope/vim-fugitive")

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
            { "jose-elias-alvarez/null-ls.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    })

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    use("nvim-tree/nvim-web-devicons")
    use({
        "akinsho/bufferline.nvim",
        requires = {
            { "nvim-web-devicons" },
        },
        lazy = false,
        after = "catppuccin",
        config = vim.cmd.colorscheme("catppuccin")
    })

    use("nvim-tree/nvim-tree.lua")

    -- use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }
    use("lervag/vimtex")

    use({ "christoomey/vim-tmux-navigator", lazy = false })

    use("famiu/bufdelete.nvim")

    use("andweeb/presence.nvim")

    use("lukas-reineke/indent-blankline.nvim")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
