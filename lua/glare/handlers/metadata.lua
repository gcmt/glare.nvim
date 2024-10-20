local M = {}

--- Prettify yaml metadata
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()
	local char = config.metadata.marker

	--- overlay on fisrt line
	marker:mark(row1, col1, {
		virt_text = { { string.rep(char, 3), "GlareMetadataMarker" } },
		virt_text_pos = "overlay",
		virt_text_hide = true,
		invalidate = true,
	})

	--- overlay on last line
	marker:mark(row2 - 1, col2, {
		virt_text = { { string.rep(char, 3), "GlareMetadataMarker" } },
		virt_text_pos = "overlay",
		virt_text_hide = true,
		invalidate = true,
	})
end

return M
