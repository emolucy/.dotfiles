return {
    -- treesitter
    --[[{
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        priority = 900,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "rust",
                "javascript",
                "typescript",
                "cpp",
                "c",
                "lua",
                "vim",
                "latex",
                "gitignore",
                "json",
                "tsx",
                "html",
            },

            auto_install = true,

            highlight = {
                enable = true,

                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },]]

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        priority = 900,
        build = ":TSUpdate",
        config = function()
            local parsers = {
                "rust",
                "javascript",
                "typescript",
                "cpp",
                "c",
                "lua",
                "vim",
                "gitignore",
                "json",
                "tsx",
                "html",
                "latex",
            }

            -- install parsers (replacement for ensure_installed + auto_install)
            for _, lang in ipairs(parsers) do
                pcall(vim.treesitter.language.add, lang)
            end

            -- attach treesitter highlighting to buffers
            vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },

    -- autoclose html tags
    {
        "windwp/nvim-ts-autotag",
        opts = {}
    },

    -- autopair
    {
        "windwp/nvim-autopairs",
        opts = {}
    },
}
