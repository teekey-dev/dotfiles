require("lualine").setup({
	options = {
		theme = require("catppuccin.utils.lualine")("latte"),
	},
	sections = {
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{ "filename", path = 0 },
		},
		lualine_x = {
			"%S", -- showcmd
			"lsp_status",
			"encoding",
			"fileformat",
			"filetype",
		},
	},
	extensions = {
		"fugitive",
		"mason",
		"neo-tree",
	},
})
