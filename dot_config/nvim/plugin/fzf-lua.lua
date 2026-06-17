local fzf_lua = require("fzf-lua")

fzf_lua.register_ui_select()

fzf_lua.setup({
	fzf_colors = true,
	files = {
		fd_opts = [[--type f --hidden --exclude .git --color=always]],
		git_icons = true,
		no_ignore = true,
	},
	grep = {
		rg_opts = "--column --line-number --hidden --no-heading --color=always --smart-case -g '!.git/'",
		hidden = true,
		git_icons = true,
		no_ignore = true,
	},
	live_grep = {
		rg_opts = "--column --line-number --hidden --no-heading --color=always --smart-case -g '!.git/'",
		hidden = true,
		git_icons = true,
		no_ignore = true,
	},
})

vim.keymap.set("n", "<leader>o", function()
	fzf_lua.files()
end, { noremap = true })
vim.keymap.set("n", "<leader>O", function()
	fzf_lua.files({
		cmd = "fd --type f --hidden --exclude .git --color=always",
	})
end, { noremap = true })
vim.keymap.set("n", "<leader>f", function()
	fzf_lua.live_grep()
end, { noremap = true })

-- Java and Kotlin
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java", "kotlin" },
	callback = function()
		vim.keymap.set("n", "<leader>o", function()
			fzf_lua.files({
				fd_opts = [[--type f --hidden --exclude .git --exclude build --exclude bin --color=always]],
			})
		end, { noremap = true, buffer = true })

		vim.keymap.set("n", "<leader>f", function()
			fzf_lua.live_grep({
				rg_opts = "--column --line-number --hidden --no-heading --color=always --smart-case -g '!.git/' -g '!build/' -g '!bin/'",
			})
		end, { noremap = true, buffer = true })
	end,
})

-- Rust
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		vim.keymap.set("n", "<leader>o", function()
			fzf_lua.files({
				fd_opts = [[--type f --hidden --exclude .git --exclude target --exclude dist --color=always]],
			})
		end, { noremap = true, buffer = true })

		vim.keymap.set("n", "<leader>f", function()
			fzf_lua.live_grep({
				rg_opts = "--column --line-number --hidden --no-heading --color=always --smart-case -g '!.git/' -g '!target/' -g '!dist/'",
			})
		end, { noremap = true, buffer = true })
	end,
})
