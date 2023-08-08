return {
  {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
    config = function()
      vim.cmd("let g:dart_html_in_string = v:true")
    end,
  },

  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "dart",
    event = "BufRead pubspec.yaml",
  },
}
