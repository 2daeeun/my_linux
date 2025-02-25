-- toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  keys = {
    { [[<C-\>]] },
    { "<leader>J", function()
        require("toggleterm").toggle(2, nil, nil, "horizontal")
      end,
      desc = "Terminal (Horizontal)"
    },
    { "<leader>j", function()
        require("toggleterm").toggle(2, nil, nil, "float")
      end,
      desc = "Terminal (Float)"
    },
  },
  cmd = { "ToggleTerm", "TermExec" },
  opts = {
    size = 20,
    hide_numbers = true,
    open_mapping = [[<C-\>]],
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = 0.3,
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal",
    winbar = {
      enabled = false,
      name_formatter = function(term)
        return term.name
      end,
    },
  },
}
