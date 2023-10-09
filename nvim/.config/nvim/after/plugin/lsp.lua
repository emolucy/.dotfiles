local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
    "clangd",
    "lua_ls",
    "texlab",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    --["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    preselect = "none",
    mapping = cmp_mappings,
    completion = {
        completeopt = "menu,menuone,noinsert,noselect",
    },
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
    end, opts)

    -- code lens
    if client.resolved_capabilities.code_lens then
        local codelens = vim.api.nvim_create_augroup("LSPCodeLens", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
            group = codelens,
            callback = function()
                vim.lsp.codelens.refresh()
            end,
            buffer = bufnr,
        })
    end
end)

lsp.setup()

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    --vim.lsp.buf.format()
                end,
            })
        end
    end,
    sources = {
        null_ls.builtins.formatting.prettier.with({
            filetypes = {
                "javascript",
                "typescript",
                "css",
                "scss",
                "html",
                "json",
                "yaml",
                "markdown",
                "graphql",
                "md",
                "txt",
            },
            only_local = "node_modules/.bin",
        }),
        null_ls.builtins.diagnostics.eslint.with({
            filetypes = {
                "javascript",
                "typescript",
            },
            only_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.trim_newlines.with({
            disabled_filetypes = { "rust" },
        }),
        null_ls.builtins.formatting.trim_whitespace.with({
            disabled_filetypes = { "rust" },
        }),
        null_ls.builtins.formatting.stylua,
    },
})

vim.diagnostic.config({
    virtual_text = false,
})
