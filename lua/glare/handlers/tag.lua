local M = {}

--- Prettify tags
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()

	-- add icon
	marker:mark(row1, col1, {
		virt_text = {
			{ config.tag.padding .. config.tag.icon, { "GlareTagIcon", "GlareTagBg" } },
		},
		virt_text_pos = "inline",
		hl_group = "GlareTagBg",
		invalidate = true,
	})

	-- add background
	marker:mark(row1, col1, {
		end_col = col2,
		hl_group = "GlareTagBg",
		invalidate = true,
	})

	-- add right padding
	marker:mark(row1, col2, {
		end_col = col2,
		virt_text = { { config.tag.padding, "GlareTagBg" } },
		virt_text_pos = "inline",
		hl_group = "GlareTagBg",
		invalidate = true,
	})

	-- conceal hash character
	marker:mark(row1, col1, {
		end_col = col1 + 1,
		conceal = "",
	})
end

return M
