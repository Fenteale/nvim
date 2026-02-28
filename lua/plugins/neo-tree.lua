local is_neotree_focused = function()
    -- Get our current buffer number
    local bufnr = vim.api.nvim_get_current_buf and vim.api.nvim_get_current_buf() or vim.fn.bufnr()
    -- Get all the available sources in neo-tree
    for _, source in ipairs(require("neo-tree").config.sources) do
        -- Get each sources state
        local state = require("neo-tree.sources.manager").get_state(source)
        -- Check if the source has a state, if the state has a buffer and if the buffer is our current buffer
        if state and state.bufnr and state.bufnr == bufnr then
            -- print("Neotree is focused!")
            return true
        end
    end
    -- print("Neotree is not focused!")
    return false
end

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
		--vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", {})
		vim.keymap.set("n", "<C-n>", function()
			if is_neotree_focused() then
				vim.cmd(":Neotree close")
			else
				vim.cmd(":Neotree filesystem left focus")
			end
		end)
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
