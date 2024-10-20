local M = {}

local function lazy_opt()
	local t = {}
	setmetatable(t, {
		__index = function(_, key)
			return require("glare.config").opt[key]
		end,
		__newindex = function(_, key, val)
			require("glare.config").opt[key] = val
		end,
	})
	return t
end

M.opt = lazy_opt()

--- Setup funtion.
---@param opts table Override options
function M.setup(opts)
	local config = require("glare.config").load(opts)
	local logger = require("glare.logger")
	logger.log_level = config.verbosity
end

--- Do rendering
function M.prettify()
	local util = require("glare.util")
	local handlers = require("glare.handlers")
	local config = require("glare.config").get()
	local context = require("glare.context"):new()
	local marker = require("glare.marker"):new(context.bufnr)
	local bufnr = context.bufnr

	marker:clear()
	for _, lang in ipairs({ "markdown", "markdown_inline" }) do
		local trees = vim.treesitter.get_parser(bufnr, lang):parse()
		for _, tree in pairs(trees) do
			for _, query in ipairs(require("glare.queries").get(lang)) do
				for id, node, metadata in query:iter_captures(tree:root(), bufnr) do
					local capture = query.captures[id]
					if handlers[capture] then
						handlers[capture](marker, config, node, metadata, context)
					end
				end
			end
		end
	end

	util.bufset(bufnr, "glare_concealsave", util.optget("conceallevel"))
	util.bufset(bufnr, "glare_active", true)
	util.optset("conceallevel", 2)
end

--- Disable rendering
function M.raw()
	local util = require("glare.util")
	local context = require("glare.context"):new()
	local bufnr = context.bufnr
	local marker = require("glare.marker"):new(bufnr)
	marker:clear()
	util.optset("conceallevel", util.bufget(bufnr, "glare_concealsave"))
	util.bufset(bufnr, "glare_active", false)
end

--- Toggle rendering
function M.toggle()
	local util = require("glare.util")
	local context = require("glare.context"):new()
	if not util.bufget(context.bufnr, "glare_active") then
		M.prettify()
	else
		M.raw()
	end
end

--- Setup rendering triggers
function M.setup_autocommands()
	local util = require("glare.util")
	local Marker = require("glare.marker")

	local augroup = vim.api.nvim_create_augroup("__glare__", { clear = true })
	local bufnr = vim.fn.bufnr("%")

	local update = function()
		if util.bufget(bufnr, "glare_active") and vim.fn.mode() ~= "i" then
			M.prettify()
		end
	end

	vim.api.nvim_create_autocmd({ "TextChanged", "WinResized", "BufModifiedSet", "InsertLeave" }, {
		group = augroup,
		buffer = bufnr,
		desc = "Render markdown",
		callback = util.debounce(100, update),
	})

	vim.api.nvim_create_autocmd({ "InsertEnter" }, {
		group = augroup,
		buffer = bufnr,
		desc = "Clear extmarks on the current line",
		callback = function()
			local curline, curcol = unpack(vim.api.nvim_win_get_cursor(0))
			local marker = Marker:new(bufnr)
			for _, mark in ipairs(marker:get_by_line(curline)) do
				local id, _, col, details = unpack(mark)
				if curcol >= col and curcol <= (details.end_col or col) then
					marker:del_by_id(id)
				end
			end
		end,
	})

	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = require("glare.colors").setup,
	})
end

return M
