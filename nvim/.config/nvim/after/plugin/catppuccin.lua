require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    no_italic = false,
    no_bold = false,
    show_end_of_buffer = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    color_overrides = {},
    highlight_overrides = {
        mocha = function(C)
            return {
                TabLineSel = { bg = C.pink },
                CmpBorder = { fg = C.surface2 },
                Pmenu = { bg = C.none },
                TelescopeBorder = { link = "FloatBorder" },
            }
        end,
    },
    integrations = {
        nvimtree = true,
        barbar = false,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
