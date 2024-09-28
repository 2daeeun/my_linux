-- bootstrap lazy.nvim, LazyVim 및 플러그인 설정
require("config.lazy")

-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.timeoutlen = 100
vim.opt.ttimeoutlen = 0

-- notify.nvim 설정
vim.notify = require("notify")
require("notify").setup({
  background_colour = "#000000",
  stages = "fade", -- 알림 애니메이션 단계
  level = "info", -- 알림 레벨 ("trace", "debug", "info", "warn", "error" 중 선택)
  timeout = 3000, -- 알림이 사라지기 전까지의 시간 (밀리초 단위)
  max_width = 80, -- 알림 창의 최대 너비
  max_height = 1000, -- 알림 창의 최대 높이 (nil은 제한 없음)
  minimum_width = 10, -- 알림 창의 최소 너비
  fps = 60, -- 애니메이션의 프레임 속도
  top_down = true, -- 알림이 위에서 아래로 나타나도록 설정
  time_formats = { -- 시간 포맷
    { "%H:%M:%S" }, -- 시간 형식(예: 24시간 형식)
  },
  on_open = function(win) end, -- 알림이 열릴 때 실행할 함수 (빈 함수로 설정)
  on_close = function(win) end, -- 알림이 닫힐 때 실행할 함수 (빈 함수로 설정)
  icons = { -- 알림 레벨별 아이콘 설정
    INFO = "",
    WARN = "",
    ERROR = "",
    DEBUG = "",
    TRACE = "✎",
  },
  render = "default", -- 알림 창 렌더링 방식 ("minimal" 또는 "default")
})

-- 파일 타입별 단축키 매핑
vim.cmd("autocmd FileType python nnoremap <buffer> <F9> :w <bar> exec '!python '.shellescape('%')<CR>")
vim.cmd(
  "autocmd FileType c nnoremap <buffer> <F9> :w <bar> exec '!gcc -g -o '.shellescape('%:r').' '.shellescape('%').' && ./'.shellescape('%:r')<CR>"
)
vim.cmd(
  "autocmd FileType cpp nnoremap <buffer> <F9> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>"
)
vim.cmd(
  "autocmd FileType java nnoremap <buffer> <F9> :exec '!javac' shellescape(expand('%'), 1) '&& java' shellescape(expand('%:r'), 1)<CR>"
)
