local M = {}

--- Prettify wikilinks
---@param marker Marker Extmarks manager
---@param config table Config
---@param node TSNode
---@param metadata vim.treesitter.query.TSMetadata
---@param context Context
function M.render(marker, config, node, metadata, context)
	local row1, col1, row2, col2 = node:range()

	-- conceal [[ markers
	marker:mark(row1, col1, {
		end_col = col1 + 2,
		conceal = "",
	})

	-- conceal ]] markers
	marker:mark(row1, col2 - 2, {
		end_col = col2,
		conceal = "",
	})

	-- add icon
	marker:mark(row1, col2, {
		virt_text = { { config.wikilink.icon, "GlareWikilinkIcon" } },
		virt_text_pos = "inline",
		invalidate = true,
	})

	-- if link_text exists, then conceal link_destination
	local link_destination = node:named_child(0)
	local link_text = node:named_child(1)
	if link_text and link_destination then
		local _, _col1, _, _col2 = link_destination:range()
		marker:mark(row1, _col1, {
			end_col = _col2 + 1,
			conceal = "",
		})
	end
end

return M
