require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    show_end_of_buffer = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    integrations = {
        nvimtree = true,
    },
})

vim.cmd.colorscheme "catppuccin"
