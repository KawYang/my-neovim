## 快捷键记录

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



## 卸载JDK

sudo rm -fr /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
sudo rm -fr /Library/PreferencesPanes/JavaControlPanel.prefPane
sudo rm -fr ~/Library/Application\ Support/Java

sudo rm -rf /Library/Java/JavaVirtualMachines/*
