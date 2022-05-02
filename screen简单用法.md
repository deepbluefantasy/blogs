# 参考资料

- 命令笔记说明：https://wangchujiang.com/linux-command/c/screen.html
- 命令视频讲解：[How to use GNU SCREEN - the Terminal Multiplexer - linux](https://www.youtube.com/watch?v=I4xVn6Io5Nw)

# 会话

- 可以使用`screen -S {name}`命令创建一个新会话（Session），并在会话中执行程序

> 直接使用`screen`也能创建新会话，不过这个会话的名字很难听，不推荐这么做。

- 程序运行后，可以使用`C-a d`将当前会话扔到后台（detach），会话中的程序仍然会运行
- 使用`screen -r {name}`命令可以将后台会话取回（attach）

> 如果会话处于attached状态，则无法进入该会话，此时可以使用`screen -d {name}`将会话detach再进入

- 如果不再需要某会话，则可以使用`screen -XS {name} quit`杀死会话。如果位于会话中，则也可以使用`C-a \`杀死当前会话。
- 最简单的使用方式是`screen {某个命令}`，这样能直接进入一个新会话，并执行命令。命令执行完成后，该会话会自杀。

# 窗口

- 在会话中可以使用`C-a c`创建新窗口，新建窗口属于当前会话

> 这里的`C-a c`表示`Ctrl`+`A`，然后再按`C`，后同

- 使用`C-a w`列出当前会话的所有窗口，使用`C-a n`和`C-a p`上下切换窗口，或使用`C-a {0-9}`指定切换0-9中的某个窗口
- 使用`C-a k`杀死当前窗口，如果当前会话只有一个窗口，则当前会话也会被杀死
- 使用`C-a \`杀死所有窗口，当前会话也会被杀死

