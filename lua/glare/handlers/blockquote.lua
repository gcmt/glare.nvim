local M = {}

--- Prettify blockquote
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()

	-- insert decoration
	for lnum = row2 - 1, row1, -1 do
		marker:mark(lnum, col1, {
			virt_text = { { config.blockquote.marker, "GlareBlockquoteMarker" } },
			virt_text_pos = "overlay",
			virt_text_hide = true,
			invalidate = true,
		})
	end
end

return M
