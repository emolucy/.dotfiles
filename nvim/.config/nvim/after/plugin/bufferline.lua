local macchiato = require("catppuccin.palettes").get_palette "macchiato"

require("bufferline").setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = "#000000" },
            },
            macchiato = {
                background = { fg = macchiato.text },
            },
            latte = {
                background = { fg = "#000000" },
            },
        },
    },
    options = {
        offsets = {
            {
                filetype = "NvimTree",
            }
        },
        tab_size = 22
    }
}

