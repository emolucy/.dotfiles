return {
    -- blink.cmp for completion
    {
        "saghen/blink.cmp",
        version = "1.*",

        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = "super-tab",
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    auto_show = false,
                },
                keyword = {
                    range = "prefix",
                },
            },

            sources = {
                default = { "lsp", "path", "buffer", "snippets" },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },

            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },

    -- luasnip
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
    },
}
