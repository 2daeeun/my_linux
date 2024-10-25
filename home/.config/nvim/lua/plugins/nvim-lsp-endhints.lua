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
      padding = 1,
      marginLeft = 0,
      bracketedParameters = true,
    },
    autoEnableHints = true,
  },
}
