vim.api.nvim_buf_create_user_command(0, "Glare", function(_)
	require("glare").toggle()
end, { nargs = 0 })

require("glare.colors").setup()
require("glare").setup_autocommands()
require("glare").prettify()
