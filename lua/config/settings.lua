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

-- 文件树
require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        position = "left",
    }
})

-- 启动标签页
require("alpha").setup(require("alpha.themes.dashboard").config)

-- Git变动显示
require("gitsigns").setup({})

-- 浮动终端支持
require("toggleterm").setup({
  -- 尺寸设置：如果是水平/垂直分割时占的大小
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end, 

  -- 开启快捷键：Ctrl + \
  open_mapping = [[<c-\>]],

  -- 默认进入插入模式
  start_in_insert = true,
  insert_mappings = true,   -- 允许在插入模式下使用 open_mapping
  terminal_mappings = true, -- 允许在终端模式下使用 open_mapping
  persist_size = true,
  
  -- 窗口样式：浮动
  direction = "float", 
  
  close_on_exit = true, -- 进程退出后自动关闭窗口
  shell = vim.o.shell,  -- 使用系统默认 shell
  
  -- 浮动窗口具体配置
  float_opts = {
    border = "curved", -- 边框样式：'single', 'double', 'shadow', 'curved'
    winblend = 3,      -- 稍微有一点点透明度，更有质感
  },
})

-- 全局搜索支持
require("telescope").setup({})

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

-- LSP服务器与自动补全
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",   --Lua语言支持
        "clangd",   --C/C++语言支持
        "jdtls",    --Java语言支持
        "bashls",   --Bash语言支持，需要Node.JS
    }
})
require("blink.cmp").setup({
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
        preset = "default"
    },

    appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono"
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
        documentation = {
            auto_show = false
        }
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer"
        },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    }
})
