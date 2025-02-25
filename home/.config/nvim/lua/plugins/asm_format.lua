-- asm_format.lua
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
