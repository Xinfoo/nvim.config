-- 应用插件后要启用的配置应该放在这里，而不是init.lua

-- 主题设置
vim.cmd[[colorscheme tokyonight]]

-- 底端状态栏
require("lualine").setup({
    options = {
        theme = "auto";
        globalstatus = true;
    }
})

-- 启动标签页
require("alpha").setup(require("alpha.themes.dashboard").config)

-- 多标签页支持
require("bufferline").setup({
    options = {
        offsets = {
            {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
            }
        }
    }
})
