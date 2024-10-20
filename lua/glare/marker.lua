---@class Marker
---@field NS integer Namespace ID
---@field bufnr integer Buffer number
local Marker = {}
Marker.__index = Marker

Marker.NS = vim.api.nvim_create_namespace("__glare__")

--- Create new Marker instance
---@param bufnr integer
---@return Marker
function Marker:new(bufnr)
	local marker = {}
	setmetatable(marker, Marker)
	marker.bufnr = bufnr
	return marker
end

--- Set extmark
---@param lnum integer Line number
---@param col integer Column number
---@param opts? table Extmark options
function Marker:mark(lnum, col, opts)
	vim.api.nvim_buf_set_extmark(self.bufnr, Marker.NS, lnum, col, opts or {})
end

--- Get extmarks one the given position
---@param lnum integer Line number
---@param col integer? Column number
function Marker:get_by_line(lnum, col)
	return vim.api.nvim_buf_get_extmarks(
		self.bufnr,
		Marker.NS,
		{ lnum - 1, col or 0 },
		{ lnum - 1, col or -1 },
		{ details = true, overlap = true, hl_name = true, type = "virt_text" }
	)
end

--- Delete extmark by id
---@param id integer Extmark id
function Marker:del_by_id(id)
	return vim.api.nvim_buf_del_extmark(self.bufnr, Marker.NS, id)
end

--- Clear extmarks in the given range
---@param startpos integer? Start line number, 0-indexed
---@param endpos integer? End line number, 0-indexed, exclusive
function Marker:clear(startpos, endpos)
	startpos = startpos or 0
	endpos = endpos or -1
	vim.api.nvim_buf_clear_namespace(self.bufnr, Marker.NS, startpos, endpos)
end

return Marker
