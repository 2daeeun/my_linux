-- comment.lua
return {
  "numToStr/Comment.nvim",
  opts = {
    --- 설정 변경 ---
    mappings = {
      basic = true, -- 기본 키맵 활성화
      extra = true, -- 추가 키맵 활성화
      extended = false,
    },
    pre_hook = nil, -- LSP와 연동 시 필요
    post_hook = nil,
    --- 블록 주석 스타일 변경 ---
    toggler = {
      line = "gcc", -- 기본 한 줄 주석 토글
      block = "gbc", -- 기본 블록 주석 토글
    },
    opleader = {
      line = "gc", -- 라인 주석
      block = "gb", -- 블록 주석
    },
    extra = {
      above = "gcO", -- 위에 주석 추가
      below = "gco", -- 아래에 주석 추가
      eol = "gcA", -- 라인 끝에 주석 추가
    },
    --- 주석 스타일을 C 스타일로 강제 ---
    block_comment = { "/*", "*/" },
  },
}
