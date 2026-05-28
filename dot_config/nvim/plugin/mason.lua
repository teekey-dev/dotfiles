require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"cspell-lsp",
		"json-lsp",
		"kotlin-lsp",
		"ktlint",
		"lua-language-server",
		"luacheck",
		"prettierd",
		"rubocop",
		"solargraph",
		"stylua",
		"terraform",
		"terraform-ls",
		"tombi",
		"yaml-language-server",
	},
	auto_update = false,
	run_on_start = true,
})
