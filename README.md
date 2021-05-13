os-tutorial（操作系统教程）
===========

How to create an OS from scratch!

如何从零开始创建一个操作系统！

I have always wanted to learn how to make an OS from scratch. In college I was taught
how to implement advanced features (pagination, semaphores, memory management, etc)
but:

- I never got to start from my own boot sector
- College is hard so I don't remember most of it.
- I'm fed up with people who think that reading an already existing kernel, even if small, is 
a good idea to learn operating systems.

我一直想学习如何从头开始制作一个操作系统。 在大学里，我曾学过如何实现高级功能（分页，
信号量，内存管理等），但是：

- 我从来没有从（写）自己的引导区开始
- 大学（课程）很难，我记不住大部分。
- 我厌倦了人们所认为的好主意，即读一个已有的内核（的代码），即使它很小。

Inspired by [this document](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)
and the [OSDev wiki](http://wiki.osdev.org/), I'll try to make short step-by-step READMEs and
code samples for anybody to follow. Honestly, this tutorial is basically the first document but
split into smaller pieces and without the theory.

受到[这片文档](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)和 [OSDev wiki](http://wiki.osdev.org/) 的启发，我将会制作分步骤且简短的 README 和代码样例以供任何人跟随（学习）。
老实说，本教程仅仅是分割成小块的，且不涉及理论的基础初级文档。

Updated: more sources: [the little book about OS development](https://littleosbook.github.io),
[JamesM's kernel development tutorials](https://web.archive.org/web/20160412174753/http://www.jamesmolloy.co.uk/tutorial_html/index.html)

更新：更多资源：[关于操作系统开发的小册](https://littleosbook.github.io),[JamesM's 内核开发教程](https://web.archive.org/web/20160412174753/http://www.jamesmolloy.co.uk/tutorial_html/index.html)


Features
--------

- This course is a code tutorial aimed at people who are comfortable with low level computing. For example,
programmers who have curiosity on how an OS works but don't have the time or willpower to start reading the Linux kernel
top to bottom.
- There is little theory. Yes, this is a feature. Google is your theory lecturer. Once you pass college, 
excessive theory is worse than no theory because it makes things seem more difficult than they really are.
- The lessons are tiny and may take 5-15 minutes to complete. Trust me and trust yourself. You can do it!



- 本课程是针对不熟悉低级计算的人员的代码教程。例如，那些对操作系统如何工作感到好奇，又没有时间和意愿去开始从头到位阅读 Linux 内核的程序员。
- 几乎不讲理论。是的，这是一个特点。 Google 是你的理论讲师。一旦你从大学毕业，（你就会发现，）过多的理论比没有理论还要糟糕，因为它会使事情看起来比实际困难得多。
- 这些课程量很小，可能需要花费 5－15 分钟去完成。相信我，去相信你自己。你可以做到的！


How to use this tutorial（如何使用本教程）
------------------------

1. Start with the first folder and go down in order. They build on previous code, so if 
you jump right to folder 05 and don't know why there is a `mov ah, 0x0e`, it's because you missed lecture 02.
Really, just go in order. You can always skip stuff you already know.
2. Open the README and read the first line, which details the concepts you should be familiar with
before reading the code. Google concepts you are not familiar with. The second line states the goals for each lesson. 
Read them, because they explain why we do what we do. The "why" is as important as the "how".
3. Read the rest of the README. It is **very concise**.
4. (Optional) Try to write the code files by yourself after reading the README.
5. Look at the code examples. They are extremely well commented.
6. (Optional) Experiment with them and try to break things. The only way to make sure you understood something is
trying to break it or replicate it with different commands.



1. 从第一个文件夹开始并顺着往下。它们基于之前的代码构建，因此你如果跳过直接去第五个文件夹，你将会不知道为什么是 `mov ah 0x0e` ，这是因为你错过了课程 02 。
2. 打开 README 并从第一行开始读，这将会告诉你一些你需要在阅读代码之前应该熟悉的概念。 Google 你不熟悉的概念。第二行陈述了每一节课的目标。阅读它们，因为他们会解释为什么我们要这么做。「为什么」与「怎么做」同样重要。
3. 阅读剩下的 README 。剩下的**非常简明**。
4. （可选）在阅读完 README 之后，尝试自己写一写代码。
5. 阅读代码样例，它们都有很好的注释。
6. （可选）试验这些代码并尝试打破一些东西。确保你理解某些内容的唯一方式，就是用不同的指令去打破或复制它。

TL;DR: First read the README on each folder, then the code files. If you're brave, try to code them yourself.

太长不读：首先读在每一个文件夹下的 README 文件，然后阅读代码文件。如果你足够有勇气，尝试自己编码。


Strategy（战略）
--------

We will want to do many things with our OS:

- Boot from scratch, without GRUB - DONE!
- Enter 32-bit mode - DONE
- Jump from Assembly to C - DONE!
- Interrupt handling - DONE!
- Screen output and keyboard input - DONE!
- A tiny, basic `libc` which grows to suit our needs - DONE!
- Memory management
- Write a filesystem to store files
- Create a very simple shell
- User mode
- Maybe we will write a simple text editor
- Multiple processes and scheduling

在我们的操作系统里我们想要做很多事情：

- 从头开始不用 GRUB 启动 - 完成！
- 进入 32 位模式 - 完成！
- 从汇编跃入 C 语言 - 完成！
- 中断控制 - 完成！
- 屏幕输出和键盘输入 - 完成！
- 一个小的、基础的 `libc` 以能够满足我们的需求 - DONE！
- 内存管理
- 写一个文件系统以存储文件
- 创建一下很简单 shell
- 用户模式
- 可以的话我们会写一个简单的文本编辑器
- 多线程和调度

Probably we will go through them in that order, however it's soon to tell.

也许我们会按着顺序进行，但很快它将会告诉我们是否如此。

If we feel brave enough:

- A BASIC interpreter, like in the 70s!
- A GUI
- Networking

如果我们感到足够勇敢：

- 一个 BASIC 解释器，像 70 年代那样的风格！
- 一个图形化界面
- 网络



Contributing
------------

This is a personal learning project, and even though it hasn't been updated for a long time, I still have hopes to get into it at some point.

这是一个个人的学习项目，即使它已经很长时间没有更新，但我仍然希望（大家）在任一时间都能参与进来。

I'm thankful to all those who have pointed out bugs and submitted pull requests. I will need some time to review everything and I cannot guarantee that at this moment.

我感谢所有指出错误并提交请求的人。 我需要一些时间来复查所有内容，我目前（还）不能保证（所有内容的可靠性）。

Please feel free to fork this repo. If many of you are interested in continuing the project, let me know and I'll link the "main fork" from here.

请随时 fork 本仓库。如果你非常感兴趣将该项目进行下去的话，请让我知道，我会在这提供一个「main fork」的链接。