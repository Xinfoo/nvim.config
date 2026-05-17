if vim.g.neovide then
-- 这些设置应用于neovide

-- 字体
vim.o.guifont = "JetBrains Mono,HarmonyOS Sans SC:h12"

-- 行距
vim.opt.linespace = 0

-- 缩放
vim.g.neovide_scale_factor = 1.0

-- 字体伽马值和对比度
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.5

-- 内边距
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

-- 透明度
vim.g.neovide_opacity = 0.9

-- 键盘输入时隐藏鼠标
vim.g.neovide_hide_mouse_when_typing = true

-- 系统主题
vim.o.background = "dark"
vim.g.neovide_theme = "auto"

-- 全屏启动
vim.g.neovide_fullscreen = false

end
