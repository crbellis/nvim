vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g["prettier#autoformat"] = 1
vim.g["prettier#autoformat_require_pragma"] = 0
vim.g.mapleader = " "
vim.g["lightline"] = {
      colorscheme = 'ayu_mirage',
      active = {
              left = {{'mode', 'paste'},
              {'branch', 'filename', 'modified'}},
              right = {{'lineinfo', 'percent'}}
      },
      separator = { left = "",  right = "" },
      subseparator = { left = "", right = "" }
}

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30
vim.g.material_style = "deep ocean"
