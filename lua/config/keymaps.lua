-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, desc)
    keymap(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

-- 基础操作
map("n", "<leader>w", "<cmd>w<CR>", "保存当前文件")
map("n", "<leader>q", "<cmd>q<CR>", "关闭当前窗口")
map("n", "<leader>Q", "<cmd>qa<CR>", "退出 Neovim")
map("n", "<leader>h", "<cmd>nohlsearch<CR>", "清除搜索高亮")

-- 更舒服的窗口移动
map("n", "<C-h>", "<C-w>h", "切换到左侧窗口")
map("n", "<C-j>", "<C-w>j", "切换到下方窗口")
map("n", "<C-k>", "<C-w>k", "切换到上方窗口")
map("n", "<C-l>", "<C-w>l", "切换到右侧窗口")
map("n", "<leader>sv", "<cmd>vsplit<CR>", "垂直分屏")
map("n", "<leader>sh", "<cmd>split<CR>", "水平分屏")

-- Buffer / 标签页
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", "切换到下一个 Buffer")
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", "切换到上一个 Buffer")
map("n", "<leader>bd", "<cmd>bdelete<CR>", "关闭当前 Buffer")
map("n", "<leader>bp", "<cmd>BufferLinePick<CR>", "选择 Buffer")

-- 文件树
map("n", "<leader>e", "<cmd>Neotree toggle reveal<CR>", "打开或关闭文件树")

-- Telescope
local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, "查找文件")
map("n", "<leader>fg", builtin.live_grep, "全文搜索")
map("n", "<leader>fb", builtin.buffers, "查看 Buffer")
map("n", "<leader>fh", builtin.help_tags, "查看帮助文档")
map("n", "<leader>fr", builtin.oldfiles, "查看最近文件")
map("n", "<leader>fs", builtin.current_buffer_fuzzy_find, "在当前文件内搜索")
map("n", "<leader>fc", builtin.commands, "查找命令")
map("n", "<leader>fk", builtin.keymaps, "查找快捷键")

-- Git
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", "暂存当前 Git hunk")
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", "撤销当前 Git hunk")
map("v", "<leader>gs", ":Gitsigns stage_hunk<CR>", "暂存选中 Git hunk")
map("v", "<leader>gr", ":Gitsigns reset_hunk<CR>", "撤销选中 Git hunk")
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", "预览 Git hunk")
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", "查看当前行 Git blame")
map("n", "]g", "<cmd>Gitsigns next_hunk<CR>", "下一个 Git hunk")
map("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", "上一个 Git hunk")

-- 诊断 / LSP
map("n", "gd", builtin.lsp_definitions, "跳转到定义")
map("n", "gr", builtin.lsp_references, "查看引用")
map("n", "gi", builtin.lsp_implementations, "跳转到实现")
map("n", "gt", builtin.lsp_type_definitions, "跳转到类型定义")
map("n", "K", vim.lsp.buf.hover, "显示悬浮文档")
map("n", "<leader>rn", vim.lsp.buf.rename, "重命名符号")
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "代码操作")
map("n", "<leader>ld", vim.diagnostic.open_float, "显示当前行诊断")
map("n", "<leader>ll", builtin.diagnostics, "查看全部诊断")
map("n", "]d", vim.diagnostic.goto_next, "下一个诊断")
map("n", "[d", vim.diagnostic.goto_prev, "上一个诊断")

-- 终端
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", "打开或关闭浮动终端")
map("t", "<Esc>", [[<C-\><C-n>]], "退出终端插入模式")
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], "切换到左侧窗口")
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], "切换到下方窗口")
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], "切换到上方窗口")
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], "切换到右侧窗口")

-- 可视模式编辑
map("v", "J", ":m '>+1<CR>gv=gv", "向下移动选中行")
map("v", "K", ":m '<-2<CR>gv=gv", "向上移动选中行")
