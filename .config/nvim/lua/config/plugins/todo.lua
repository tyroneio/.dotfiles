return {
	"folke/todo-comments.nvim",
	lazy = false,
	opts = {
		highlight = {
			pattern = [[.*<(KEYWORDS)\s*:?]],
			keyword = "bg",
		},
		search = {
			command = "rg",
			pattern = [[(?:--|//|/\*|#|;):? \b(KEYWORDS)\b]],
		},
	},
	keys = {
		{
			"<leader>st",
			":TodoTelescope<CR>",
			desc = "Find TODOs",
		},
	},
}
