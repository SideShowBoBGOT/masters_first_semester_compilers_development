.data
    msg: .ascii "Hello, World!\n"
    .align 4
.text
    .global fn0
    .global fn1
fn0:
    b fn0
    add x0, x0, x1
    ret

