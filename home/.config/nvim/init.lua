-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
vim.opt.relativenumber = false

vim.notify = require("notify")
require("notify").setup({
  background_colour = "#000000",
  stages = "fade",
})
