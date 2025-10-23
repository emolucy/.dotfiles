return {
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		opts = {
			ensure_installed = {
				"rust",
				"javascript",
				"typescript",
				"cpp",
				"c",
				"lua",
				"vim",
				"latex",
				"gitignore",
				"json",
				"tsx",
				"html",
			},

			auto_install = true,

			highlight = {
				enable = true,

				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		},
		build = ":TSUpdate",
	},

	-- autoclose html tags
	{
		"windwp/nvim-ts-autotag",
	},

	-- autopair
	{
		"windwp/nvim-autopairs",

		config = true,
	},
}
