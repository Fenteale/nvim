return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require('gitsigns')

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map('n', '<leader>hn', function()
				if vim.wo.diff then
					vim.cmd.normal({'<leader>hn', bang = true})
				else
					gitsigns.nav_hunk('next')
				end
			end)

			map('n', '<leader>hp', function()
				if vim.wo.diff then
					vim.cmd.normal({'<leader>hp', bang = true})
				else
					gitsigns.nav_hunk('prev')
				end
			end)
		end
	}
}
