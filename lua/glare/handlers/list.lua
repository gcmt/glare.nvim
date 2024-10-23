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
		local c0 = item:named_child(0)
		if not c0 then
			goto continue
		end
		local row1, col1, row2, col2 = c0:range()
		if c0:type() == "list_marker_dot" then
			marker:mark(row1, col1, {
				virt_text = { { tostring(n + 1), "GlareListMarker" } },
				virt_text_pos = "overlay",
				virt_text_hide = true,
				invalidate = true,
			})
			n = n + 1
		elseif c0:type() == "list_marker_minus" then
			n = 0
			local c1 = item:named_child(1)
			if c1 and vim.startswith(c1:type(), "task_list_marker_") then
				_, _, _, col2 = c1:range()
				local icon
				local hl_group
				if c1:type() == "task_list_marker_checked" then
					icon = config.tasklist.icon_checked
					hl_group = "GlareTasklistMarkerChecked"
				elseif c1:type() == "task_list_marker_unchecked" then
					icon = config.tasklist.icon_unchecked
					hl_group = "GlareTasklistMarkerUnchecked"
				end
				marker:mark(row1, col1, {
					end_col = col2,
					virt_text_hide = true,
					conceal = icon,
					hl_group = hl_group,
				})
			else
				marker:mark(row1, col1, {
					virt_text = { { config.list.markers[1], "GlareListMarker" } },
					virt_text_pos = "overlay",
					virt_text_hide = true,
					invalidate = true,
				})
			end
		end
		::continue::
	end
end

return M
