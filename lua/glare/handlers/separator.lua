local M = {}

--- Prettify separator line
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()

	-- render separator
	marker:mark(row1, col1, {
		virt_text = {
			{ string.rep(config.separator.marker, context.wininfo.width), "GlareSeparator" },
		},
		virt_text_pos = "overlay",
		virt_text_hide = true,
		invalidate = true,
	})
end

return M
