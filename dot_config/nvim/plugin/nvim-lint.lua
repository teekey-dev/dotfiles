require("lint").linters_by_ft = {
	lua = { "luacheck" },
	kotlin = { "ktlint" },
	ruby = { "rubocop" },
	toml = { "tombi" },
}

-- Run linting on file open, save, and text changes
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
