*Concepts you may want to Google beforehand: linux, mac, terminal, compiler, emulator, nasm, qemu*

*以下概念你可能需要预先 Google ：linux, mac, terminal, compiler, emulator, nasm, qemu*

**Goal: Install the software required to run this tutorial**

**目标：安装允许本教程所必须的软件**

I'm working on a Mac, though Linux is better because it will have all the standard tools already
available for you.

我一般在 Mac 上工作，但 Linux 会更好因为它为您提供了所有标准工具。

On a mac, [install Homebrew](http://brew.sh) and then `brew install qemu nasm`

在 Mac ，[安装 Homebrew](http://brew.sh) 然后运行 `brew install qemu nasm` 。

Don't use the Xcode developer tools `nasm` if you have them installed, they won't work for the most cases. Always use `/usr/local/bin/nasm`

如果你安装了 Xcode ，不要使用 Xcode 开发工具的 nasm ，他们不能运行大部分样例。始终使用 `/user/local/bin/nasm` 。

On some systems qemu is split into multiple binaries. You may want
to call `qemu-system-x86_64 binfile`

在一些系统里，qemu 被分为多个二进制文件。你可能需要调用 `qemu-system-x86_64 binfile` 。

