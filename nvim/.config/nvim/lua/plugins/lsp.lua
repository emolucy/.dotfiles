return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "saghen/blink.cmp",
        },

        config = function()
            vim.keymap.set("n", "<leader>vd", function()
                vim.diagnostic.open_float()
            end, opts)
            vim.keymap.set("n", "<leader>vca", function()
                vim.lsp.buf.code_action()
            end, opts)
            vim.keymap.set("n", "<leader>vrr", function()
                vim.lsp.buf.references()
            end, opts)
            vim.keymap.set("i", "<C-h>", function()
                vim.lsp.buf.signature_help()
            end, opts)

            -- fix undefined global 'vim'
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            })

            -- use undercurl
            local colors = require("catppuccin.palettes").get_palette()
            vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
            vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.peach })
            vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.teal })
            vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.green })
        end,
    },

    -- #### PACKAGE MANAGER [MASON] ####

    -- base plugin
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- lsp-config servers
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = {
                "rust_analyzer",
                "clangd",
                "lua_ls",
                "jdtls",
                "texlab" },
            automatic_installation = true,
        },
    },

    -- additional servers
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts_extend = { "ensure_installed" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "prettier",
                "eslint",
            },
            auto_update = true,
            run_on_start = true,
        },
    },

    -- formatting
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt" },
                javascript = { "prettier" },
                c = { "clang_format" },
                java = { "lsp" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 2000,
                lsp_format = "fallback",
            },
        },
    },

    -- #### LANGUAGE SPECIFIC SETUP ####
    -- JAVA:
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    local jdtls = require("jdtls")

                    local root_dir = require("jdtls.setup").find_root({
                        "gradlew", "mvnw", ".git",
                    })
                    if not root_dir then return end

                    local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
                    local workspace = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

                    jdtls.start_or_attach({
                        cmd = { "jdtls" },
                        root_dir = root_dir,
                        init_options = { workspace = workspace },
                    })
                end,
            })
        end,
    },
}
