local palette = require("incorrectish_colors.palette")

local function select_colors()
	local cfg = vim.g.incorrectish_colors_config or {}
	return vim.tbl_extend("force", palette, cfg.colors or {})
end

return select_colors()
