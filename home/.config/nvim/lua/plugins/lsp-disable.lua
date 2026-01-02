-- lsp-disable.lua
return {
  "neovim/nvim-lspconfig",
  enabled = function()
    -- use absolute paths; basename 말고 전체 경로 검사
    local cwd = vim.fn.getcwd() or ""
    local file = vim.api.nvim_buf_get_name(0) or ""

    -- false positive 줄이려 슬래시 포함
    local disabled = { "/kernel_study/", "/linux/", "/fuse/" }

    for _, k in ipairs(disabled) do
      if cwd:find(k, 1, true) or file:find(k, 1, true) then
        return false -- disable LSP
      end
    end
    return true
  end,
}
