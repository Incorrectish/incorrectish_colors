local colors = require("incorrectish_colors.palette")

local function select_colors()
	local selected = { none = "none" }
	selected = vim.tbl_extend("force", selected, colors[vim.g.incorrectish_colors_config.style])
	selected = vim.tbl_extend("force", selected, vim.g.incorrectish_colors_config.colors)
	return selected
end

return select_colors()
