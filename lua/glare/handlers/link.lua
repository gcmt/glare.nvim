local M = {}

--- Prettify link
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()
	local link_destination = node:named_child(1)

	local icon = config.link.icon_internal
	if link_destination then
		local text = vim.treesitter.get_node_text(link_destination, context.bufnr)
		if string.match(text, "^https?://") or string.match(text, "^www") then
			icon = config.link.icon_external
		end
	end

	-- add icon
	marker:mark(row1, col2, {
		virt_text = { { icon, "GlareLinkIcon" } },
		virt_text_pos = "inline",
		invalidate = true,
	})
end

return M
