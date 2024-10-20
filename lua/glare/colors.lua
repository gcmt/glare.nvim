local M = {}

M.colors = {
	GlareCodeblockBg = "ColorColumn",
	GlareCodeinlineBg = "ColorColumn",
	GlareLinkIcon = "Normal",
	GlareWikilinkIcon = "Normal",
	GlareImageIcon = "Normal",
	GlareListMarker = "Normal",
	GlareMetadataMarker = "NonText",
	GlareSeparator = "NonText",
	GlareBlockquoteMarker = "NonText",
	GlareHeadingUnderline = "NonText",
	GlareHeadingLineAbove = "Normal",
	GlareTagIcon = "Normal",
	GlareTagBg = "CursorColumn",
	GlareCalloutText = "Normal",
}

function M.setup()
	for name, link in pairs(M.colors) do
		vim.api.nvim_set_hl(0, name, { link = link, default = true })
	end
end

return M
