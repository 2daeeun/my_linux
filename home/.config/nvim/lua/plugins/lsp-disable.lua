-- lsp-disable.lua
return {
  "neovim/nvim-lspconfig",
  enabled = function()
    -- 현재 작업 디렉토리 확인
    local cwd = vim.fn.getcwd()
    -- 특정 디렉토리와 비교
    -- if cwd:find("키워드") then
    if cwd:find("kernel_study") then
      return false -- LSP 비활성화
    end
    return true -- 그 외에는 활성화
  end,
}
