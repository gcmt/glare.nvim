local M = {}

--- Get option value
---@param name string Option name
---@param opts table? Optional parameters
function M.optget(name, opts)
	opts = vim.tbl_extend("force", { scope = "local" }, opts or {})
	return vim.api.nvim_get_option_value(name, opts)
end

--- Set option value
---@param name string Option name
---@param value any Value to set
---@param opts table? Optional parameters
function M.optset(name, value, opts)
	opts = vim.tbl_extend("force", { scope = "local" }, opts or {})
	vim.api.nvim_set_option_value(name, value, opts)
end

--- Set bufferlocal variable
---@param name string Variable name
---@param value any Value to set
function M.bufset(bufnr, name, value)
	vim.api.nvim_buf_set_var(bufnr, name, value)
end

--- Get buffer-local variable
---@param bufnr integer Buffer number
---@param name string Variable name
---@param default any? Default return value
function M.bufget(bufnr, name, default)
	local ok, ret = pcall(vim.api.nvim_buf_get_var, bufnr, name)
	if ok then
		return ret
	end
	return default
end

--- Debounce function
---@param ms integer Delay in milliseconds
---@param callback function Function to debounce
---@return function
function M.debounce(ms, callback)
	local id = -1
	return function(...)
		local args = { ... }
		vim.fn.timer_stop(id)
		id = vim.fn.timer_start(ms, function()
			callback(unpack(args))
		end)
	end
end

return M
