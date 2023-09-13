local M = {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>lg", ":LazyGit<cr>", desc = "[L]azy[Git]" },
	},
}

return M
