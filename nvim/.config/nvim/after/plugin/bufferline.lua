require("bufferline").setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
    },
    options = {
        offsets = {
            {
                filetype = "NvimTree",
            }
        },
        separator_style = "thin",
        tab_size = 20,
        themable = true,
    }
}
