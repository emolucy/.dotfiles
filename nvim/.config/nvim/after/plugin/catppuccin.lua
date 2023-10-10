require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    show_end_of_buffer = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    integrations = {
        cmp = true,
        nvimtree = true,
        treesitter = true,
    },
})

--vim.cmd.colorscheme "catppuccin"
