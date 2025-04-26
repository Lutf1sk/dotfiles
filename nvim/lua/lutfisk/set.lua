
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 16

vim.opt.updatetime = 50

-- Project specific

tabsize = 4

if vim.fn.getcwd() == "/home/lutfisk/src/bw/game" then
  tabsize = 2
  vim.opt.expandtab   = true
end

vim.opt.tabstop     = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth  = tabsize
