return {
	{
		"nvim-mini/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			require("mini.bracketed").setup()
			require("mini.align").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup()
			require("mini.pairs").setup()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
