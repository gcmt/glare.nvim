local M = {}

--- Prettify inline code
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()

	if row1 ~= row2 then
		-- can happen
		return {}
	end

	-- add background
	marker:mark(row1, col1, {
		end_col = col2,
		hl_group = "GlareCodeinlineBg",
		invalidate = true,
	})

	-- conceal first delimiter
	marker:mark(row1, col1, {
		end_col = col1 + 1,
		hl_group = "GlareCodeinlineBg",
		conceal = " ",
	})

	-- conceal last delimiter
	marker:mark(row1, col2 - 1, {
		end_col = col2,
		hl_group = "GlareCodeinlineBg",
		conceal = " ",
	})
end

return M
