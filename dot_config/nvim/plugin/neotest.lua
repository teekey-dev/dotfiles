require("neotest").setup({
	adapters = {
		require("neotest-plenary"),
		require("neotest-rspec"),
		require("neotest-kotlin"),
		require("rustaceanvim.neotest"),
	},
	consumers = {
		notify = function(client)
			client.listeners.results = function(_, results, partial)
				if partial then
					return
				end

				local total = 0
				local passed = 0
				local failed = 0
				for _, r in pairs(results) do
					total = total + 1
					if r.status == "passed" then
						passed = passed + 1
					elseif r.status == "failed" then
						failed = failed + 1
					end
				end

				local message = string.format("%d/%d tests passed", passed, total)
				if failed > 0 then
					vim.notify(message, vim.log.levels.ERROR)
				else
					vim.notify(message, vim.log.levels.INFO)
				end
			end
		end,
	},
})

-- Keymaps
vim.keymap.set("n", "<leader>tn", function()
	require("neotest").run.run()
end, { desc = "Run nearest test" })

vim.keymap.set("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run current file" })

vim.keymap.set("n", "<leader>tl", function()
	require("neotest").run.run_last()
end, { desc = "Run last test" })

vim.keymap.set("n", "<leader>ta", function()
	require("neotest").run.attach()
end, { desc = "Attach to running test" })

vim.keymap.set("n", "<leader>to", function()
	require("neotest").output.open({ enter = true })
end, { desc = "Open test output" })

vim.keymap.set("n", "<leader>tO", function()
	require("neotest").output_panel.toggle()
end, { desc = "Toggle test output panel" })

vim.keymap.set("n", "<leader>tC", function()
	require("neotest").output_panel.clear()
end, { desc = "clear test output panel" })

vim.keymap.set("n", "<leader>ts", function()
	require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })
