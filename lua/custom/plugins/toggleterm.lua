local M = {
	'akinsho/toggleterm.nvim',
	version = "*",
	lazy = true,
	config = function()
		require("toggleterm").setup({
			direction = "float",
			shell = "zsh",
			autochdir = false,
			shade_terminals = false,
			persist_mode = true,
		})
		vim.cmd([[autocmd TermEnter term://*toggleterm#* setlocal number relativenumber]])
	end,
	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "[Toggle] [T]erminal" },
	}
}

return M
