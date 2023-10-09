local macchiato = require("catppuccin.palettes").get_palette "macchiato"

require("bufferline").setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = macchiato.crust },
            }
        }
    },
    options = {
        offsets = {
            {
                filetype = "NvimTree",
            }
        },
        separator_style = "slant",
        tab_size = 20,
        themable = true,
    }
}

