return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		require("null-ls").setup({
			sources = {
				null_ls.builtins.formatting.clang_format,
			},
		})
	end,
}
