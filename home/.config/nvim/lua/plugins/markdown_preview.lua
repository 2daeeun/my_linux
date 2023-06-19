-- return {
--   {
--     "iamcco/markdown-preview.nvim",
--     cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
--     lazy = false,
--     build = function()
--       vim.fn["mkdp#util#install"]()
--     end,
--     init = function()
--       vim.g.mkdp_theme = "dark"
--     end,
--   },
-- }

return {
  "iamcco/markdown-preview.nvim",
  run = function()
    vim.fn["mkdp#util#install"]()
  end,
}
