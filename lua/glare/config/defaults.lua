--- Default plugin options
return {
	verbosity = vim.log.levels.INFO,

	blockquote = {
		marker = "▋ ",
	},

	codeblock = {
		padding = "  ",
	},

	link = {
		icon_internal = "󰌹",
		icon_external = "",
		icon_position = "left",
	},

	wikilink = {
		icon = "󰌹",
		icon_position = "left",
	},

	image = {
		icon = "",
		icon_position = "left",
	},

	list = {
		markers = { "∙" },
	},

	tasklist = {
		icon_checked = "",
		icon_unchecked = "",
	},

	metadata = {
		marker = "🭷",
	},

	separator = {
		marker = "🭷",
	},

	tag = {
		icon = " ",
		padding = " ",
	},

	heading = {
		lines_above = 1,
		underlines = {
			h1 = "━",
			h2 = "━",
			h3 = "🭷",
			h4 = "─",
			h5 = "┄",
			h6 = "┄",
		},
	},

	callouts = {
		abstract = { overlay = "󰨸 Abstract", hlgroup = "GlareCalloutText" },
		attention = { overlay = "󰀪 Attention", hlgroup = "GlareCalloutText" },
		bug = { overlay = "󰨰 Bug", hlgroup = "GlareCalloutText" },
		caution = { overlay = "󰳦 Caution", hlgroup = "GlareCalloutText" },
		check = { overlay = " Check", hlgroup = "GlareCalloutText" },
		cite = { overlay = "󱆨 Cite", hlgroup = "GlareCalloutText" },
		danger = { overlay = "󱐌 Danger", hlgroup = "GlareCalloutText" },
		done = { overlay = " Done", hlgroup = "GlareCalloutText" },
		error = { overlay = "󱈸 Error", hlgroup = "GlareCalloutText" },
		example = { overlay = " Example", hlgroup = "GlareCalloutText" },
		failure = { overlay = " Failure", hlgroup = "GlareCalloutText" },
		fail = { overlay = " Fail", hlgroup = "GlareCalloutText" },
		faq = { overlay = "󰘥 Faq", hlgroup = "GlareCalloutText" },
		help = { overlay = "󰘥 Help", hlgroup = "GlareCalloutText" },
		hint = { overlay = "󰌶 Hint", hlgroup = "GlareCalloutText" },
		important = { overlay = "󰅾 Important", hlgroup = "GlareCalloutText" },
		info = { overlay = "󰋽 Info", hlgroup = "GlareCalloutText" },
		missing = { overlay = " Missing", hlgroup = "GlareCalloutText" },
		note = { overlay = "󰋽 Note", hlgroup = "GlareCalloutText" },
		question = { overlay = "󰘥 Question", hlgroup = "GlareCalloutText" },
		quote = { overlay = "󱆨 Quote", hlgroup = "GlareCalloutText" },
		success = { overlay = " Success", hlgroup = "GlareCalloutText" },
		summary = { overlay = "󰨸 Summary", hlgroup = "GlareCalloutText" },
		tip = { overlay = "󰌶 Tip", hlgroup = "GlareCalloutText" },
		tldr = { overlay = "󰨸 Tldr", hlgroup = "GlareCalloutText" },
		todo = { overlay = "󰗡 Todo", hlgroup = "GlareCalloutText" },
		warning = { overlay = "󰀪 Warning", hlgroup = "GlareCalloutText" },
	},
}
