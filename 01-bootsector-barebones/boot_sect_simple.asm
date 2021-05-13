; A simple boot sector program that loops forever
; 一个简单的不断循环的启动扇区程序
loop:
    jmp loop

times 510-($-$$) db 0
dw 0xaa55
