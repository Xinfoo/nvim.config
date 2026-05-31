# Neovim Config

> 注意：这是我的个人 Neovim 配置，不是面向所有人的通用发行版。其中包含一些带有个人环境假设的设置，尤其是
> `lua/config/proxy.lua` 里的本机代理配置。如果你的代理地址不是 `http://127.0.0.1:7897`，或者你不需要代理，
> 请先修改或禁用它，再进行插件安装。

一份偏日常开发使用的 Neovim 配置。整体思路是保持轻量、清晰、可继续扩展：用
`lazy.nvim` 管理插件，围绕文件检索、项目浏览、Git 提示、LSP 和补全搭出一个顺手的编辑环境。

## 特性

- 基于 `lazy.nvim` 的插件管理，首次启动会自动安装插件管理器。
- 使用 `tokyonight.nvim` 作为默认主题。
- `lualine.nvim` 状态栏和 `bufferline.nvim` 标签页增强。
- `neo-tree.nvim` 文件树，适合快速浏览项目结构。
- `telescope.nvim` 提供文件查找、全文搜索、Buffer 与帮助文档检索。
- `mason.nvim` + `mason-lspconfig.nvim` 管理 LSP 服务。
- `blink.cmp` 提供 LSP、路径、片段和 Buffer 补全。
- `gitsigns.nvim` 显示 Git 行级变更。
- `toggleterm.nvim` 提供浮动终端。
- 包含 Neovide 的 GUI 字体、透明度和主题配置。

## 环境依赖

建议先安装下面这些工具：

- Neovim
- Git
- Lua 5.1
- LuaRocks
- ripgrep
- fd
- wl-clipboard
- Node.js / npm
- make 和 C 编译器，用于构建 `telescope-fzf-native.nvim`
- Nerd Font，可选但推荐，用于正常显示图标

### Arch Linux

```sh
sudo pacman -S neovim git lua51 luarocks ripgrep fd wl-clipboard npm base-devel
```

### Ubuntu / Debian

```sh
sudo apt update
sudo apt install neovim git lua5.1 luarocks ripgrep fd-find wl-clipboard nodejs npm build-essential
```

Debian/Ubuntu 的 `fd` 命令通常叫 `fdfind`。如果 Telescope 找不到 `fd`，可以手动创建一个用户级软链接：

```sh
mkdir -p ~/.local/bin
ln -s "$(command -v fdfind)" ~/.local/bin/fd
```

### Fedora / RHEL

```sh
sudo dnf install neovim git lua luarocks ripgrep fd-find wl-clipboard nodejs npm make gcc gcc-c++
```

RHEL 系发行版如果默认仓库里缺少较新的 Neovim 或部分工具，可能需要先启用 EPEL、COPR 或使用官方 AppImage/源码安装。

如果使用 Java LSP，系统里还需要可用的 JDK。

## 安装

先备份已有配置：

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

然后把本仓库克隆到 Neovim 配置目录：

```sh
git clone <this-repo-url> ~/.config/nvim
```

启动 Neovim：

```sh
nvim
```

第一次启动时，`lazy.nvim` 会自动拉取插件。Mason 会确保安装这些 LSP：

- `lua_ls`
- `clangd`
- `jdtls`
- `bashls`

## 快捷键

Leader 键是空格，Local Leader 是反斜杠 `\`。

### 基础操作

| 快捷键 | 功能 |
| --- | --- |
| `<leader>w` | 保存当前文件 |
| `<leader>q` | 关闭当前窗口 |
| `<leader>Q` | 退出 Neovim |
| `<leader>h` | 清除搜索高亮 |

### 窗口与 Buffer

| 快捷键 | 功能 |
| --- | --- |
| `<C-h>` | 切换到左侧窗口 |
| `<C-j>` | 切换到下方窗口 |
| `<C-k>` | 切换到上方窗口 |
| `<C-l>` | 切换到右侧窗口 |
| `<leader>sv` | 垂直分屏 |
| `<leader>sh` | 水平分屏 |
| `<S-l>` | 切换到下一个 Buffer |
| `<S-h>` | 切换到上一个 Buffer |
| `<leader>bd` | 关闭当前 Buffer |
| `<leader>bp` | 使用 Bufferline 选择 Buffer |

### 文件树

| 快捷键 | 功能 |
| --- | --- |
| `<leader>e` | 打开或关闭 Neo-tree，并定位到当前文件 |

### Telescope

| 快捷键 | 功能 |
| --- | --- |
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 全文搜索 |
| `<leader>fb` | 查看 Buffer |
| `<leader>fh` | 查看帮助文档 |
| `<leader>fr` | 查看最近文件 |
| `<leader>fs` | 在当前文件内搜索 |
| `<leader>fc` | 查找命令 |
| `<leader>fk` | 查找快捷键 |

### Git

| 快捷键 | 功能 |
| --- | --- |
| `<leader>gs` | 暂存当前或选中的 Git hunk |
| `<leader>gr` | 撤销当前或选中的 Git hunk |
| `<leader>gp` | 预览当前 Git hunk |
| `<leader>gb` | 查看当前行 Git blame |
| `]g` | 跳到下一个 Git hunk |
| `[g` | 跳到上一个 Git hunk |

### LSP 与诊断

| 快捷键 | 功能 |
| --- | --- |
| `gd` | 跳转到定义 |
| `gr` | 查看引用 |
| `gi` | 跳转到实现 |
| `gt` | 跳转到类型定义 |
| `K` | 显示悬浮文档 |
| `<leader>rn` | 重命名符号 |
| `<leader>ca` | 代码操作 |
| `<leader>ld` | 显示当前行诊断 |
| `<leader>ll` | 查看全部诊断 |
| `]d` | 跳到下一个诊断 |
| `[d` | 跳到上一个诊断 |

### 终端与可视模式

| 快捷键 | 功能 |
| --- | --- |
| `<leader>tt` | 打开或关闭浮动终端 |
| `<C-\>` | 打开或关闭浮动终端 |
| `<Esc>` | 在终端中退出插入模式 |
| `J` | 在可视模式中向下移动选中行 |
| `K` | 在可视模式中向上移动选中行 |

## 目录结构

```text
.
├── init.lua                 # 入口文件
├── lua
│   ├── config
│   │   ├── lazy.lua         # lazy.nvim 启动与插件加载
│   │   ├── settings.lua     # 基础选项与插件配置
│   │   ├── keymaps.lua      # 快捷键
│   │   ├── neovide.lua      # Neovide GUI 配置
│   │   └── proxy.lua        # 插件下载代理配置
│   └── plugins              # 插件声明
└── README.md
```

## 注意事项

`lua/config/proxy.lua` 默认设置了本机代理：

```lua
local proxy_url = "http://127.0.0.1:7897"
```

如果你不使用这个代理，或者端口不一致，请修改该文件，或在 `init.lua` 中注释掉：

```lua
require("config.proxy")
```

否则首次下载插件时可能会连接失败。

## 自定义

- 基础编辑行为放在 `lua/config/settings.lua`。
- 快捷键放在 `lua/config/keymaps.lua`。
- 插件声明放在 `lua/plugins/`，新增插件时建议单独建一个 Lua 文件。
- 插件初始化和较集中化的配置目前放在 `lua/config/settings.lua`。

## License

本项目使用 MIT License，详见 [LICENSE](./LICENSE)。
