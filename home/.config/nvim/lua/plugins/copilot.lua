-- ~/.config/nvim/lua/plugins/copilot.lua

return {
  "zbirenbaum/copilot.lua", -- Copilot Lua 플러그인
  cmd = "Copilot", -- Copilot 명령어 로드
  event = "InsertEnter", -- 인서트 모드 진입 시 로드
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true, -- 자동 완성 제안 활성화
        auto_trigger = true, -- 자동 트리거 켜기
        keymap = {
          accept = "<S-k>", -- 제안 수락
          next = "<S-]>", -- 다음 제안으로 이동
          prev = "<S-[>", -- 이전 제안으로 이동
          dismiss = "<S-/>", -- 제안 취소
        },
      },
      panel = {
        enabled = false, -- 별도 패널 비활성화
      },
    })
  end,
}
