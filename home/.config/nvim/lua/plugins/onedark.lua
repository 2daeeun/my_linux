return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark",
    },
  },

  -- 기존에 사용했던 테마
  -- {
  --   "navarasu/onedark.nvim",
  --   opts = {
  --     style = "deep",
  --     transparent = true,
  --     background_colour = "#000000",
  --   },
  -- },

  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        colors = {
          bg = "#000000",
          fg = "#abb2bf",
          red = "#ef596f",
          orange = "#d19a66",
          yellow = "#e5c07b",
          green = "#89ca78",
          cyan = "#2bbac5",
          blue = "#61afef",
          purple = "#d55fde",
          white = "#abb2bf",
          black = "#000000",
          gray = "#434852",
          highlight = "#e2be7d",
          comment = "#7f848e",
          none = "NONE",
        },
        options = {
          transparency = true,
        },
      })
      vim.cmd("colorscheme onedark_dark")
    end,
  },
}
