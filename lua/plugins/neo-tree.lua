return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		close_if_last_window = true,
		enable_git_status = true,
		auto_clean_after_session_restore = true,
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
		},
	},
	config = function(_, opts)
		require('neo-tree').setup(opts)
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
