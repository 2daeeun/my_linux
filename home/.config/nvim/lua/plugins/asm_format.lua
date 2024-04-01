return {
  { "sbdchd/neoformat" },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
        s = { "asmfmt" },
        asm = { "asmfmt" },
        formatters = {
          stylua = {
            command = require("conform.util").find_executable(
              { "/etc/profiles/per-user/eastxuelian/bin/stylua" },
              "stylua"
            ),
          },
        },
      },
    },
    {
      "LhKipp/nvim-nu",
    },
  },
}

-- https://github.com/AvavaAYA/LianVim/blob/main/lua/plugins/format.lua
-- return {
--   { "sbdchd/neoformat" },
--   {
--     "stevearc/conform.nvim",
--     opts = {
--       formatters_by_ft = {
--         lua = { "stylua" },
--         python = function(bufnr)
--           if require("conform").get_formatter_info("ruff_format", bufnr).available then
--             return { "ruff_format" }
--           else
--             return { "isort", "black" }
--           end
--         end,
--         javascript = { { "prettierd", "prettier" } },
--         markdown = { { "prettierd", "prettier" } },
--         c = { "clang_format", "astyle" },
--         cpp = { "clang_format", "astyle" },
--         rust = { "rustfmt" },
--         nix = { "nixfmt" },
--         s = { "asmfmt" },
--         asm = { "asmfmt" },
--       },
--       formatters = {
--         clang_format = {
--           command = require("conform.util").find_executable({
--             "/etc/profiles/per-user/eastxuelian/bin/clang-format",
--           }, "clang-format"),
--           prepend_args = { "-style=file:/home/eastxuelian/config/.clang-format" },
--         },
--         stylua = {
--           command = require("conform.util").find_executable(
--             { "/etc/profiles/per-user/eastxuelian/bin/stylua" },
--             "stylua"
--           ),
--         },
--       },
--     },
--   },
--   {
--     "LhKipp/nvim-nu",
--   },
-- }
