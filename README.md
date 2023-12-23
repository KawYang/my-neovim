## 快捷键记录

0. vim 快捷键

### 输入模式


i: 进入INSERT
u: undo changes
Esc: 退出INSERT
Shift + a: 进入末尾并插入
o: 下行插入
O: 上一行插入
c$: 删除光标后所有内容
cw: 删除当前单词
ciw: 删除光标所在单词


:{作用范围}s/{目标}/{替换}/{替换标志}

NORMAL:

dd: 剪切
p: 粘贴
y: 复制
yw: 复制单词
yiw: 复制所在单词
y$: 复制之后的内容

f: 所在行查找
Ctrl + u/d/b/f: 上半页/下半页/下一页/下一页
GG: 末尾 
gg: 开头

diw: 删除所在单词
dw: 删除单词
d$: 删除之后内容
d^: 删除之前内容

Shift V: V-Line 选中行
Shift </>: 缩进

Ctr V: V-BLOCK 


1. 目录树和编辑器切换
> Ctr + H / L

2. vim 换行插入[快捷键](https://www.bbsmax.com/A/QV5ZRNlV5y/)
> i 当前插入
> I 行前插入
> o 下行插入
> O 前行插入

3. 可视模式 0 开头 $ 结尾
4. leader + nh 取消高亮


## lsp 日志
>:lua vim.cmd('e'..vim.lsp.get_log_path())


## 快捷键

> leader + bc : 通过字母切换 bufferline 标签页
> Ctr    + J/K: 切换buffer tab页

## tree

nvim-tree 可以执行常见的 创建 、删除、拷贝、剪切 文件等操作

o 打开关闭文件夹
a 创建文件
r 重命名
x 剪切
c 拷贝
p 粘贴
d 删除
# lsp
## neodev
vim 关键词提示插件: https://github.com/folke/neodev.nvim
## lspsaga

github: https://github.com/nvimdev/lspsaga.nvim

## 卸载JDK

sudo rm -fr /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
sudo rm -fr /Library/PreferencesPanes/JavaControlPanel.prefPane
sudo rm -fr ~/Library/Application\ Support/Java

sudo rm -rf /Library/Java/JavaVirtualMachines/*


## Git 插件

neovim gitsigns和diffview插件介绍
