return {
    -- catppuccin
    {
        "catppuccin/nvim",
        show_end_of_buffer = false,
        priority = 1000,
        opts = {
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
            },
            integrations = {
                nvimtree = true,
            },
        },
        config = function()
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
        specs = {
            {
                "akinsho/bufferline.nvim",
                optional = true,
                opts = function(_, opts)
                    if (vim.g.colors_name or ""):find("catppuccin") then
                        opts.highlights = require("catppuccin.special.bufferline").get_theme()
                    end
                end,
            },
        },
    }
}
