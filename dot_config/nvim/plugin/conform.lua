require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		kotlin = { "ktlint" },
		json = { "prettierd" },
		jsonc = { "prettierd" },
		yaml = { "prettierd" },
		rust = { "rust-analyzer" },
		ruby = { "rubocop" },
		elixir = { "elixir-ls" },
		toml = { "tombi" },
	},

	-- Format on save
	format_on_save = {
		timeout_ms = 3000,
		lsp_format = "fallback",
	},
})

-- Manual format keybinding
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
