return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	event = "BufReadPre",
	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "python" },
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
