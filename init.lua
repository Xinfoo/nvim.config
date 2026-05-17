-- 启用行号
vim.opt.relativenumber = true
vim.opt.number = true

-- 缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- 禁用屏幕边界换行显示
vim.opt.wrap = false

-- 光标行
vim.opt.cursorline = true

-- 启用鼠标
vim.opt.mouse:append("a")

-- 剪贴板
vim.opt.clipboard:append("unnamedplus")

-- 搜索不区分大小写
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 基础外观
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

require("config.neovide")
require("config.proxy")
require("config.lazy")
require("config.settings")
require("config.keymaps")
