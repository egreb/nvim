local M = {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function(_, _)
		local status, null_ls = pcall(require, "null-ls")
		if (not status) then return end
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup {
			debug = true,
			sources = {
				-- null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.eslint_d.with({
				-- 	diagnostics_format = '[eslint] #{m}\n(#{c})'
				-- }),
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.gofumpt,
				-- null_ls.builtins.formatting.golines,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = false })
						end,
					})
				end
			end
		}
	end,
}

return M
