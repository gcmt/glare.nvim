local M = {}

--- Prettify callout
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()

	local raw = vim.treesitter.get_node_text(node, context.bufnr)
	local text = string.lower(string.match(raw, "%a+") or "")
	local overlay, hlgroup
	if config.callouts[text] then
		overlay = config.callouts[text].overlay
		hlgroup = config.callouts[text].hlgroup
	else
		overlay = text
		hlgroup = "GlareCalloutText"
	end

	marker:mark(row1, col1, {
		end_col = col2,
		virt_text = { { overlay .. " ", hlgroup } },
		virt_text_pos = "overlay",
		virt_text_hide = true,
		invalidate = true,
	})
end

return M
