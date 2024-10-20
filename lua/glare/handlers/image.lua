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
	marker:mark(row1, col1, {
		end_col = col2,
		virt_text = { { config.image.icon, "GlareImageIcon" } },
		virt_text_pos = "inline",
		invalidate = true,
	})
end

return M
