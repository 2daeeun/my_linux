-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 마크다운 문법 기호를 숨기지 않도록 conceallevel을 0으로 설정
-- (conceallevel: 특정 텍스트 숨김(conceal) 기능을 비활성화하는 설정)
local opt = vim.opt
opt.conceallevel = 0
