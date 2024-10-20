local M = {}

--- Prettify lists
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local n = 0
	for item, _ in node:iter_children() do
		if not item:named() then
			goto continue
		end
		local row1, col1 = item:range()
		local text = vim.treesitter.get_node_text(item, context.bufnr)
		if string.match(text, "^%d") then
			marker:mark(row1, col1, {
				end_row = col1 + 1,
				virt_text = { { tostring(n + 1), "GlareListMarker" } },
				virt_text_pos = "overlay",
				virt_text_hide = true,
				invalidate = true,
			})
			n = n + 1
		else
			n = 0
			marker:mark(row1, col1, {
				end_row = col1 + 1,
				virt_text = { { config.list.markers[1], "GlareListMarker" } },
				virt_text_pos = "overlay",
				virt_text_hide = true,
				invalidate = true,
			})
		end
		::continue::
	end
end

return M
