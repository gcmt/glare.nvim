local M = {}

M.log_level = vim.log.levels.INFO
M.prefix = "glare: "

function M.err(fmt, ...)
	if M.log_level <= vim.log.levels.ERROR then
		vim.notify(M.prefix .. string.format(fmt, ...), vim.log.levels.ERROR)
	end
end

function M.warn(fmt, ...)
	if M.log_level <= vim.log.levels.WARN then
		vim.notify(M.prefix .. string.format(fmt, ...), vim.log.levels.WARN)
	end
end

function M.info(fmt, ...)
	if M.log_level <= vim.log.levels.INFO then
		vim.notify(M.prefix .. string.format(fmt, ...), vim.log.levels.INFO)
	end
end

function M.debug(fmt, ...)
	if M.log_level <= vim.log.levels.DEBUG then
		vim.notify(M.prefix .. string.format(fmt, ...), vim.log.levels.DEBUG)
	end
end

return M
