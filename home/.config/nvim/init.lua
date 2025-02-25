-- bootstrap lazy.nvim, LazyVim 및 플러그인 설정
require("config.lazy")

-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.timeoutlen = 100
vim.opt.ttimeoutlen = 0

-- 파일 타입별 컴파일 단축키 매핑
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
vim.cmd(
  "autocmd FileType rust nnoremap <buffer> <F9> :w <bar> exec '!rustc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>"
)
