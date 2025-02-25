-- lsp-disable.lua
return {
  "neovim/nvim-lspconfig",
  enabled = function()
    -- 현재 작업 디렉토리에서 마지막 폴더명 또는 파일명을 가져오기
    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- 현재 디렉토리명 가져오기
    local filename = vim.fn.expand("%:t") -- 현재 열려 있는 파일명 가져오기

    -- LSP를 비활성화할 키워드 목록
    local disabled_keywords = {
      "kernel_study",
      "skiplist.h",
    }

    -- 현재 디렉토리명 또는 파일명에 키워드가 포함되는지 확인
    for _, keyword in ipairs(disabled_keywords) do
      if cwd:find(keyword, 1, true) or filename:find(keyword, 1, true) then
        return false -- LSP 비활성화
      end
    end

    return true -- 그 외에는 LSP 활성화
  end,
}
