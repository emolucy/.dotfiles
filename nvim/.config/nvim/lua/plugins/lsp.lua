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
        lazy = false,
        priority = 1000,
        config = function()
            require("mason").setup()
            require("mason-registry").refresh()
        end,
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
                "eslint",
                "ts_ls",
                "texlab",
            },
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
                "prettier",
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
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
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

    -- PLANTUML:
    {
        "aklt/plantuml-syntax",
        ft = { "plantuml" },
        config = function()
            -- detect the filetype
            vim.filetype.add({
                extension = {
                    puml = "plantuml",
                    plantuml = "plantuml",
                },
            })

            -- render on save
            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.puml", "*.plantuml" },
                callback = function(args)
                    vim.system({ "plantuml", "-tsvg", args.file }):wait()
                end,
            })

            -- keybind for rendering
            vim.keymap.set("n", "<leader>pu", function()
                vim.cmd("write")
                local file = vim.fn.expand("%:p")
                vim.system({ "plantuml", "-tsvg", file }):wait()
                vim.notify("rendered svg")
            end, { desc = "render plantuml" })
        end,
    },

    -- LATEX
    {
        "lervag/vimtex",
        init = function()
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_compiler_method = "latexmk"
        end,
    }
}
