-- lua/plugins/folding.lua
-- plugins 디렉토리에서만 설정: TS 기반 폴딩 전역 적용

return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Neovim 시작 초기에 폴딩 옵션 적용
    init = function()
      vim.opt.foldmethod = "expr" -- expr 방식
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- TS 폴드식
      vim.opt.foldlevel = 99 -- 깊은 폴드 허용
      vim.opt.foldlevelstart = 99 -- 기본 펼침
      vim.opt.foldenable = true -- 폴딩 사용
    end,
    -- TS 파서 설치만 보강(기존 설정과 병행 동작)
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = opts.ensure_installed or {}
      local add = { "c", "cpp", "lua", "python", "bash", "javascript", "typescript" }
      vim.list_extend(opts.ensure_installed, add) -- 필요한 언어만 추가
      return opts
    end,
  },
}

-- 함수 폴딩/해제는 커서 위치에서 `z` 계열 키로 합니다. (Tree-sitter 폴딩이 켜져 있다는 전제)
--
-- * 현재 함수(커서가 있는 폴드)
--
--   * `za` : 토글(접기/펼치기)
--   * `zc` : 닫기
--   * `zo` : 열기
--   * `zC` : 하위 포함 모두 닫기
--   * `zO` : 하위 포함 모두 열기
--
-- * 파일 전체
--
--   * `zM` : 전부 닫기(모든 함수/블록 접기)
--   * `zR` : 전부 열기(모든 함수/블록 펼치기)
--   * `zm` : 한 단계 더 “많이 접기”(폴드 레벨 ↑)
--   * `zr` : 한 단계 더 “많이 펼치기”(폴드 레벨 ↓)
--   * `zx` : 폴드 재계산(구조가 반영 안 될 때 갱신)
--
-- * 폴드 이동
--
--   * `zj` / `zk` : 다음/이전 폴드로 이동
--   * `[z` / `]z` : 현재 폴드의 시작/끝으로 이동
--
-- 팁: 파일을 열 때 기본적으로 펼쳐두고 싶으면 `foldlevelstart=99`, 열자마자 접히게 하고 싶으면 낮은 값(예: `0`)을 씁니다. 폴딩이 안 되면 해당 언어의 Tree-sitter 파서가 설치되어 있는지 확인하고, `zx`로 한 번 재계산하세요.
