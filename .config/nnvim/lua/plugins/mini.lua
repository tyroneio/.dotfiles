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
			require("mini.files").setup({
				windows = {
					preview = true,
					preview_width = 50,
				},
				window = {
					config = {
						border = "rounded",
					},
				},
			})
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			statusline.section_location = function()
				return "%2l:%-2v"
			end

			vim.keymap.set(
				"n",
				"-",
				"<CMD>lua MiniFiles.open(MiniFiles.get_latest_path())<CR>",
				{ desc = "Open parent directory" }
			)
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
