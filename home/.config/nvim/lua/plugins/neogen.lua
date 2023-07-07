return {
  "danymat/neogen",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = true,
    },
  },
  config = true,
  opts = {
    snippet_engine = "luasnip",
  },
}
