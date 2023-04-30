require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    no_italic = false,
    no_bold = false,
    show_end_of_buffer = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    integrations = {
        nvimtree = true,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
