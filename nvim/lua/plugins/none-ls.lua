return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		local eslint_d = require("none-ls.diagnostics.eslint_d")
		local flake8 = require("none-ls.diagnostics.flake8")

		null_ls.setup({
			sources = {
				-- lua
				formatting.stylua,

				-- python
				formatting.black.with({ extra_args = { "--fast" } }),
        formatting.isort,
				flake8,

				-- Typescript / Javascript
				formatting.prettier.with({
          filetypes = { "svelte", "javascript", "typescript", "css", "html" }
        }),
				eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
