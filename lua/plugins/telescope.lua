return {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	keys = {
		{
			"<C-p>", require('telescope.builtin').find_files,
		},
		{
			"<C-[>", require('telescope.builtin').git_files,
		},
		{
			"<C- >", require('telescope.builtin').live_grep,
		},
		{
			"<leader>fb", require('telescope.builtin').buffers,
		},
		{
			"<leader>fh", require('telescope.builtin').help_tags,
		},
	},
}
