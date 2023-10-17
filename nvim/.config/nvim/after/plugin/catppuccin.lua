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
    color_overrides = {
        macchiato = {
            -- ui
            base = "#1e0e16",
            crust = "#150b12",
            mantle = "#150a10",
            surface0 = "#2d1a23",
            surface1 = "#412532",
            surface2 = "#4e2d3c",
            overlay0 = "#785554",
            overlay1 = "#966a69",
            overlay2 = "#a18578",

            -- text 
            text = "#e7d3ca",
            subtext1 = "#95845f",
            subtext2 = "#a59673",

            -- colors
            rosewater = "#cb9dd1",
            flamingo = "#cb9dd1",
            pink = "#e37dcf",
            mauve = "#ad76a2",
            red = "#eb5e54",
            maroon = "#c77a86",
            peach = "#c7885c",
            yellow = "#e4bf67",
            green = "#9bb172",
            teal = "#8cb6c5",
            sky = "#8cb6c5",
            sapphire = "#8c90c5",
            blue = "#8c90c5",
            lavender = "#997ccb",
        },
    },
})
vim.cmd.colorscheme("catppuccin")
