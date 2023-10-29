local noice = require("noice")
noice.setup({
	routes = {
		{
			view = "notify",
			filter = { event = "msg_showmode" },
		},
	},
})

require("lualine").setup({
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      }
    },
  },
})
