return {
  "chrisgrieser/nvim-lsp-endhints",
  event = "LspAttach",
  opts = {
    icons = {
      type = "󰜁 type: ",
      parameter = "󰏪 parameter : ",
      offspec = "• offspec : ", -- hint kind not defined in official LSP spec
      unknown = "  unknown : ", -- hint kind is nil
    },
    label = {
      padding = 8,
      marginLeft = 8,
      bracketedParameters = true,
      sameKindSeparator = ", ",
    },
    autoEnableHints = true,
  },
}
