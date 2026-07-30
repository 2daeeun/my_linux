return {
  {
    "jannis-baum/vivify.vim",
    ft = { "markdown" },
    init = function()
      vim.g.vivify_instant_refresh = 1
      vim.g.vivify_auto_scroll = 1
    end,
  },
}
