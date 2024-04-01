-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

vim.notify = require("notify")
require("notify").setup({
  background_colour = "#000000",
  stages = "fade",
})

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
