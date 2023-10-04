vim.g.mapleader = " "
local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "jk", "<ESC>")
keymap.set("n", "qq", ":q!<CR>")
keymap.set("n", "<C-h>", "<C-w><C-w>")
keymap.set("n", "<C-s>", ":w<CR>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动 - 快捷键 选中后 shift + j, k

keymap.set("v", "J", ":m '>+1<CR>gv=gv  多行移动")
keymap.set("v", "K", ":m '<-2<CR>gv=gv  多行移动")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v  水平添加窗口") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s  垂直新增窗口") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR> 取消高亮")

-- 切换buffer
-- keymap.set("n", "<C-H>", ":bnext<CR>")
-- keymap.set("n", "<C-K>", ":bprevious<CR>")
keymap.set("n", "<C-J>", ":BufferLineCyclePrev<CR> 向前切换buffer")
keymap.set("n", "<C-K>", ":BufferLineCycleNext<CR> 向后切换buffer")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>E", ":NvimTreeToggle<CR> 打开/关闭目录")
-- keymap.set("n", "<leader>e", ":NeoTreeFloat<CR>")
-- keymap.set("n", "<leader>E", ":NeoTreeShow<CR>")

-- hop.nvim

keymap.set("n", "<leader>hw", ":HopWord<CR>")
keymap.set("n", "<leader>hww", ":HopWordMW<CR>")
keymap.set("n", "<leader>hc", ":HopChar2<CR>")
keymap.set("n", "<leader>hcc", ":HopChar2MW<CR>")
keymap.set("n", "<leader>hl", ":HopLine<CR>")
keymap.set("n", "<leader>hll", ":HopLineStart<CR>")

keymap.set("n", "<leader>lg", ":TermExec cmd='lg'<CR>")
keymap.set("n", "lg", ":TermExec cmd='lg'<CR>")

keymap.set("n", "<leader>e", ":Telescope buffers<CR>")
keymap.set("n", "<C-t>", ":ToggleTerm<CR>")
keymap.set("n", "<leader>t", ":TermSelect<CR>")
