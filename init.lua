require("config.lazy")

vim.cmd("colorscheme carbonfox")
vim.cmd("set nowrap")

vim.g.mapleader = " "

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-[>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<C- >', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "python" },
	highlight = { enable = true },
	indent = { enable = true },
}
