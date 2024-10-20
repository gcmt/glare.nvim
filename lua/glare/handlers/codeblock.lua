local M = {}

--- Prettify code block
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()

	if node:type() ~= "fenced_code_block" then
		return {}
	end

	-- add background
	marker:mark(row1, col1, {
		end_row = row2,
		hl_group = "GlareCodeblockBg",
		hl_eol = true,
		invalidate = true,
	})

	-- add left padding
	for lnum = row2 - 1, row1, -1 do
		marker:mark(lnum, col1, {
			virt_text = { { config.codeblock.padding, "GlareCodeblockBg" } },
			virt_text_pos = "inline",
			virt_text_repeat_linebreak = true,
			invalidate = true,
		})
	end
end

return M
