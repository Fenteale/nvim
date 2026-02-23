return {
	'nvim-mini/mini.nvim',
	version = false,

	config = function(_, opts)
		require('mini.map').setup()
		vim.keymap.set("n", "<Leader>mo", MiniMap.open)
		vim.keymap.set("n", "<Leader>mc", MiniMap.close)
		vim.keymap.set("n", "<Leader>mt", MiniMap.toggle)

		require('mini.sessions').setup()
		-- vim.keymap.set("n", "<Leader>ms", vim.ui.input({prompt = "Session Name (Leave blank for Default session)" }, function(str) MiniSessions.write(str) end)
		vim.keymap.set("n", "<Leader>msw", function()
			local inp = vim.fn.input("Session Name: ")
			if string.len(inp) == 0
			then
				MiniSessions.write()
			else
				MiniSessions.write(inp)
			end
		end)
		vim.keymap.set("n", "<Leader>msd", function() MiniSessions.select("delete") end)

		require('mini.starter').setup()
		vim.keymap.set("n", "<Leader>start", MiniStarter.open)
	end,
}
