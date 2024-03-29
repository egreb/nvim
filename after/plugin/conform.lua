-- Only run stylua when we can find a root dir
require("conform.formatters.stylua").require_cwd = true

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { { "prettierd", "prettier" } },
		javascript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format { bufnr = args.buf, lsp_fallback = true }
	end,
})
