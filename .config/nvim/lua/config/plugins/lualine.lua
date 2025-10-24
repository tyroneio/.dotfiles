return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local function show_macro_recording()
			local reg = vim.fn.reg_recording()
			return (reg == "" and "") or ("Recording @" .. reg)
		end

		lualine.setup({
			sections = {
				lualine_x = { show_macro_recording, "encoding", "filetype" },
			},
		})

		vim.o.cmdheight = 0

		vim.api.nvim_create_autocmd("RecordingEnter", {
			callback = function()
				lualine.refresh({ place = { "statusline" } })
			end,
		})

		vim.api.nvim_create_autocmd("RecordingLeave", {
			callback = function()
				vim.defer_fn(function()
					lualine.refresh({ place = { "statusline" } })
				end, 50)
			end,
		})
	end,
}
