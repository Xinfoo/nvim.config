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

-- Git变动显示
require("gitsigns").setup({})

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
