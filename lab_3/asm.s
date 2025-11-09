.data
    msg: .ascii "Hello, World!\n"
    .align 4
.text
    .global fn0
    .global fn1
fn1:
    b 
fn0:
    sub sp, sp, #16
    str x1, [sp]
    add x0, x0, x1
    ret
    ; mov x0, #1
    ; ldr x1, =msg
    ; mov x2, #14
    ; mov w8, #0x40
    ; svc #0
    ; mov x0, #0
    ; mov w8, #0x5d
    ; svc #0

