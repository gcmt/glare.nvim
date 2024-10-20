-- Allow any of the given types
-- ... string
-- return table
local function typeof(...)
	return { ... }
end

--- Allow any of the given values
---@param ... any
---@return table
local function oneof(...)
	local t = { ... }
	local fn = function(val)
		for _, v in pairs(t) do
			if v == val then
				return true
			end
		end
		return false
	end
	return { fn, "one of " .. table.concat(t, "|") }
end

return {
	["verbosity"] = oneof(0, 1, 2, 3, 4, 5),

	["blockquote"] = typeof("table"),
	["blockquote.marker"] = typeof("string"),

	["codeblock"] = typeof("table"),
	["codeblock.padding"] = typeof("string"),

	["link"] = typeof("table"),
	["link.icon_internal"] = typeof("string"),
	["link.icon_external"] = typeof("string"),

	["wikilink"] = typeof("table"),
	["wikilink.icon"] = typeof("string"),

	["list"] = typeof("table"),
	["list.markers"] = typeof("table"),

	["metadata"] = typeof("table"),
	["metadata.marker"] = typeof("string"),

	["separator"] = typeof("table"),
	["separator.marker"] = typeof("string"),

	["image"] = typeof("table"),
	["image.icon"] = typeof("string"),

	["tag"] = typeof("table"),
	["tag.icon"] = typeof("string"),
	["tag.padding"] = typeof("string"),

	["heading"] = typeof("table"),
	["heading.lines_above"] = typeof("number"),
	["heading.underlines"] = typeof("table"),
	["heading.underlines.h1"] = typeof("string"),
	["heading.underlines.h2"] = typeof("string"),
	["heading.underlines.h3"] = typeof("string"),
	["heading.underlines.h4"] = typeof("string"),
	["heading.underlines.h5"] = typeof("string"),
	["heading.underlines.h6"] = typeof("string"),

	["callouts"] = typeof("table"),
	["callouts.abstract"] = typeof("table"),
	["callouts.abstract.overlay"] = typeof("string"),
	["callouts.abstract.hlgroup"] = typeof("string"),
	["callouts.attention"] = typeof("table"),
	["callouts.attention.overlay"] = typeof("string"),
	["calloutts.overlay.hlgroup"] = typeof("string"),
	["callouts.bug"] = typeof("table"),
	["callouts.bug.overlay"] = typeof("string"),
	["callouts.bug.hlgroup"] = typeof("string"),
	["callouts.caution"] = typeof("table"),
	["callouts.caution.overlay"] = typeof("string"),
	["callouts.caution.hlgroup"] = typeof("string"),
	["callouts.check"] = typeof("table"),
	["callouts.check.overlay"] = typeof("string"),
	["callouts.check.hlgroup"] = typeof("string"),
	["callouts.cite"] = typeof("table"),
	["callouts.cite.overlay"] = typeof("string"),
	["callouts.cite.hlgroup"] = typeof("string"),
	["callouts.danger"] = typeof("table"),
	["callouts.danger.overlay"] = typeof("string"),
	["callouts.danger.hlgroup"] = typeof("string"),
	["callouts.done"] = typeof("table"),
	["callouts.done.overlay"] = typeof("string"),
	["callouts.done.hlgroup"] = typeof("string"),
	["callouts.error"] = typeof("table"),
	["callouts.error.overlay"] = typeof("string"),
	["callouts.error.hlgroup"] = typeof("string"),
	["callouts.example"] = typeof("table"),
	["callouts.example.overlay"] = typeof("string"),
	["callouts.example.hlgroup"] = typeof("string"),
	["callouts.failure"] = typeof("table"),
	["callouts.failure.overlay"] = typeof("string"),
	["callouts.failure.hlgroup"] = typeof("string"),
	["callouts.fail"] = typeof("table"),
	["callouts.fail.overlay"] = typeof("string"),
	["callouts.fail.hlgroup"] = typeof("string"),
	["callouts.faq"] = typeof("table"),
	["callouts.faq.overlay"] = typeof("string"),
	["callouts.faq.hlgroup"] = typeof("string"),
	["callouts.help"] = typeof("table"),
	["callouts.help.overlay"] = typeof("string"),
	["callouts.help.hlgroup"] = typeof("string"),
	["callouts.hint"] = typeof("table"),
	["callouts.hint.overlay"] = typeof("string"),
	["callouts.hint.hlgroup"] = typeof("string"),
	["callouts.important"] = typeof("table"),
	["callouts.important.overlay"] = typeof("string"),
	["callouts.important.hlgroup"] = typeof("string"),
	["callouts.info"] = typeof("table"),
	["callouts.info.overlay"] = typeof("string"),
	["callouts.info.hlgroup"] = typeof("string"),
	["callouts.missing"] = typeof("table"),
	["callouts.missing.overlay"] = typeof("string"),
	["callouts.missing.hlgroup"] = typeof("string"),
	["callouts.note"] = typeof("table"),
	["callouts.note.overlay"] = typeof("string"),
	["callouts.note.hlgroup"] = typeof("string"),
	["callouts.question"] = typeof("table"),
	["callouts.question.overlay"] = typeof("string"),
	["callouts.question.hlgroup"] = typeof("string"),
	["callouts.quote"] = typeof("table"),
	["callouts.quote.overlay"] = typeof("string"),
	["callouts.quote.hlgroup"] = typeof("string"),
	["callouts.success"] = typeof("table"),
	["callouts.success.overlay"] = typeof("string"),
	["callouts.success.hlgroup"] = typeof("string"),
	["callouts.summary"] = typeof("table"),
	["callouts.summary.overlay"] = typeof("string"),
	["callouts.summary.hlgroup"] = typeof("string"),
	["callouts.tip"] = typeof("table"),
	["callouts.tip.overlay"] = typeof("string"),
	["callouts.tip.hlgroup"] = typeof("string"),
	["callouts.tldr"] = typeof("table"),
	["callouts.tldr.overlay"] = typeof("string"),
	["callouts.tldr.hlgroup"] = typeof("string"),
	["callouts.todo"] = typeof("table"),
	["callouts.todo.overlay"] = typeof("string"),
	["callouts.todo.hlgroup"] = typeof("string"),
	["callouts.warning"] = typeof("table"),
	["callouts.warning.overlay"] = typeof("string"),
	["callouts.overlay.hlgroup"] = typeof("string"),
}
