*Concepts you may want to Google beforehand: assembler, BIOS*

*以下概念你可能需要预先 Google ：汇编器，基本输入输出系统*

**Goal: Create a file which the BIOS interprets as a bootable disk**

**目标：创建一个文件，BIOS 会将其解释作可启动的磁盘**

This is very exciting, we're going to create our own boot sector!

这十分令人激动，我们将会创建我们自己的引导扇区！

Theory
------

When the computer boots, the BIOS doesn't know how to load the OS, so it
delegates that task to the boot sector. Thus, the boot sector must be
placed in a known, standard location. That location is the first sector
of the disk (cylinder 0, head 0, sector 0) and it takes 512 bytes.

当电脑启动时，BIOS 并不知道如何加载操作系统，因此它将任务委派给引导扇区。因此，引导扇区必须是在一个一直的标准位置。这个位置就是磁盘的第一扇区（圆柱 0 ，磁头 0 ， 扇区 0 ），占用 512 字节。

To make sure that the "disk is bootable", the BIOS checks that bytes
511 and 512 of the alleged boot sector are bytes `0xAA55`.

为了确认「磁盘可引导」，BIOS 会检查引导扇区的第 511 和 第 512 字节是否为 `0xAA55` 。

This is the simplest boot sector ever:

这是有史以来最简单的引导扇区：

```
e9 fd ff 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[ 29 more lines with sixteen zero-bytes each ]
00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa
```

It is basically all zeros, ending with the 16-bit value
`0xAA55` (beware of endianness, x86 is little-endian). 
The first three bytes perform an infinite jump

它基本上是全零，且以16位值0xAA55结尾（请注意字节序，x86是小端序）。 前三个字节执行无限跳转。

Simplest boot sector ever
-------------------------

You can either write the above 512 bytes
with a binary editor, or just write a very
simple assembler code:

你可以使用二进制编辑器编写以上的 512 字节，也可以只编写一个简单的汇编代码：

```nasm
; Infinite loop (e9 fd ff)
; 无限循环 （e9 fd ff）
loop:
    jmp loop 

; Fill with 510 zeros minus the size of the previous code
; 用 510 减去之前代码个大小的 0 填满
times 510-($-$$) db 0
; Magic number
; 魔数
dw 0xaa55 
```

To compile:
`nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin`

编译：`nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin`

> OSX warning: if this drops an error, read chapter 00 again
>
> OSX 警告：如果这里报错，请读第 00 章。

I know you're anxious to try it out (I am!), so let's do it:

我知道你很像尝试（是我！），因此让我们开始：

`qemu boot_sect_simple.bin`

> On some systems, you may have to run `qemu-system-x86_64 boot_sect_simple.bin` If this gives an SDL error, try passing the --nographic and/or --curses flag(s).
>
> 在一些系统里，你可能需要运行 `qemu-system-x86_64 boot_sect_simple.bin` 。如果这给了你一个 SDL 错误，尝试加参数  --nographic 或 --curses flag(s) 

You will see a window open which says "Booting from Hard Disk..." and
nothing else. When was the last time you were so excited to see an infinite
loop? ;-)

你将会看到一个窗口打开，上面显示「正在从硬盘启动...」然后什么也没有。什么时候是你最后一次对于无限循环如此激动呢？;-)