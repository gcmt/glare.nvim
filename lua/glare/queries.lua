local M = {}

local logger = require("glare.logger")

---@type table<string, vim.treesitter.Query>
local cache = {}

---@type table<string, string[]>
local queries = {

	markdown = {
		[[
			(atx_heading) @heading
			(minus_metadata) @metadata
			(thematic_break) @separator
			(fenced_code_block) @codeblock
			(block_quote) @blockquote
			(list) @list
		]],
	},

	markdown_inline = {
		[[
			(code_span) @codeinline
			((shortcut_link) @callout (#match? "^[!"))
			(inline_link) @link
			(image) @image
		]],
		[[
			(tag) @tag
		]],
		[[
			(wiki_link) @wikilink
		]],
	},
}

--- Get parsed query for the given language
---@param lang string
---@return vim.treesitter.Query[]
function M.get(lang)
	local ret = {}
	for _, query in ipairs(queries[lang]) do
		if not cache[query] then
			local ok, parsed = pcall(vim.treesitter.query.parse, lang, query)
			if ok then
				cache[query] = parsed
			else
				logger.debug(parsed)
			end
		end
		if cache[query] then
			table.insert(ret, cache[query])
		end
	end
	return ret
end

return M
