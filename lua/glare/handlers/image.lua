local M = {}

--- Prettify image link
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()

	-- add icon
	local icon_col
	local icon = config.image.icon
	local has_space = string.match(icon, "%s")
	if config.image.icon_position == "left" then
		icon_col = col1
		icon = has_space and icon or icon .. " "
	else
		icon_col = col2
		icon = has_space and icon or " " .. icon .. " "
	end
	marker:mark(row1, icon_col, {
		end_col = icon_col,
		virt_text = { { icon, "GlareImageIcon" } },
		virt_text_pos = "inline",
		invalidate = true,
	})
end

return M
