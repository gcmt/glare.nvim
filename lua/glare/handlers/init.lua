---@type table<string, function>
local handlers = {
	heading = require("glare.handlers.heading").render,
	tag = require("glare.handlers.tag").render,
	codeblock = require("glare.handlers.codeblock").render,
	codeinline = require("glare.handlers.codeinline").render,
	blockquote = require("glare.handlers.blockquote").render,
	link = require("glare.handlers.link").render,
	list = require("glare.handlers.list").render,
	image = require("glare.handlers.image").render,
	separator = require("glare.handlers.separator").render,
	callout = require("glare.handlers.callout").render,
	metadata = require("glare.handlers.metadata").render,
}

return handlers
