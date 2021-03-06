vim.cmd([[ 
  source ~/.vim/vimrc

  " neovim specific stuff
  set termguicolors
  augroup Neovim
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup END

  " packadd cfilter
  packadd cfilter
  ]])

vim.opt.showmode = false
vim.o.inccommand = "split"
vim.o.wildmode = "full"
