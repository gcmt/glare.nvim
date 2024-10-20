local M = {}

--- Prettify heading
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local text = vim.treesitter.get_node_text(node, context.bufnr)
	local lvl = #string.match(text, "^#+")
	local char = config.heading.underlines["h" .. tostring(lvl)] or ""
	local row1, col1, row2, col2 = node:range()

	-- insert line below the heading
	marker:mark(row1, col2, {
		virt_lines = { { { string.rep(char, context.wininfo.width), "GlareHeadingUnderline" } } },
		virt_text_pos = "inline",
		invalidate = true,
	})

	if config.heading.lines_above > 0 then
		local lines = {}
		for _ = 1, config.heading.lines_above do
			table.insert(lines, { { " ", "GlareHeadingLineAbove" } })
		end
		marker:mark(row1, col2, {
			virt_lines = lines,
			virt_text_pos = "inline",
			virt_lines_above = true,
			invalidate = true,
		})
	end

	-- conceal hash characters
	marker:mark(row1, col1, {
		end_col = col1 + #string.match(text, "^#+%s*"),
		conceal = "",
	})
end

return M
