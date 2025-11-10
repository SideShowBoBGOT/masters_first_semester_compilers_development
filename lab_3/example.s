.data
.align 8
const0: .dword 1
.align 8
const1: .dword 0
.align 8
const2: .dword 1
.align 8
const3: .dword 1
.align 8
const4: .double 1.0
.align 8
const5: .double 0.0
.align 8
const6: .double 1.0
.align 8
const7: .double 1.0
.align 8
const8: .double 3333.0
.align 8
const9: .dword 2
.align 8
const10: .dword 12
.align 8
const11: .dword 55
.align 8
const12: .dword 104
.align 8
const13: .dword 5
.align 8
const14: .double 33.23122222
.align 8
const15: .double 3444.0
.align 8
const16: .dword 0
.align 8
const17: .dword 5
.align 8
const18: .dword 1
.align 8
const19: .dword 1
.align 8
const20: .dword 2
.text
// ==
.global fn0
fn0:
cmp x0, x1
cset x0, eq
ret
// ==
.global fn1
fn1:
cmp x0, x1
cset x0, eq
ret
// *
.global fn2
fn2:
mul x0, x0, x1
ret
// /
.global fn3
fn3:
sdiv x0, x0, x1
ret
// +
.global fn4
fn4:
add x0, x0, x1
ret
// -
.global fn5
fn5:
sub x0, x0, x1
ret
// >
.global fn6
fn6:
cmp x0, x1
cset x0, gt
ret
// <
.global fn7
fn7:
cmp x0, x1
cset x0, lt
ret
// >=
.global fn8
fn8:
cmp x0, x1
cset x0, ge
ret
// <=
.global fn9
fn9:
cmp x0, x1
cset x0, le
ret
// *
.global fn10
fn10:
fmul d0, d0, d1
ret
// /
.global fn11
fn11:
fdiv d0, d0, d1
ret
// +
.global fn12
fn12:
fadd d0, d0, d1
ret
// -
.global fn13
fn13:
fsub d0, d0, d1
ret
// ==
.global fn14
fn14:
fcmp d0, d1
cset x0, eq
ret
// >
.global fn15
fn15:
fcmp d0, d1
cset x0, gt
ret
// <
.global fn16
fn16:
fcmp d0, d1
cset x0, lt
ret
// >=
.global fn17
fn17:
fcmp d0, d1
cset x0, ge
ret
// <=
.global fn18
fn18:
fcmp d0, d1
cset x0, le
ret
// factorial
.global fn19
fn19:
sub sp, sp, #16
str lr, [sp]
sub sp, sp, #16
str fp, [sp]
mov fp, sp
sub sp, sp, #16
str x0, [fp, #-0]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-16]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-32]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-48]
ldr x9, =const0
str x9, [fp, #-16]
ldr x9, =const1
str x9, [fp, #-32]
ldr x9, =const2
str x9, [fp, #-48]
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
mov sp, fp
ldr fp, [sp]
add sp, sp, #16
ldr lr, [sp]
add sp, sp, #16
ret
// factorial
.global fn20
fn20:
sub sp, sp, #16
str lr, [sp]
sub sp, sp, #16
str fp, [sp]
mov fp, sp
sub sp, sp, #16
str d0, [fp, #-0]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-16]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-32]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-48]
ldr d9, =const4
str d9, [fp, #-16]
ldr d9, =const5
str d9, [fp, #-32]
ldr d9, =const6
str d9, [fp, #-48]
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
mov sp, fp
ldr fp, [sp]
add sp, sp, #16
ldr lr, [sp]
add sp, sp, #16
ret
// my_function
.global fn21
fn21:
sub sp, sp, #16
str lr, [sp]
sub sp, sp, #16
str fp, [sp]
mov fp, sp
sub sp, sp, #16
str x0, [fp, #-0]
sub sp, sp, #16
str x1, [fp, #-16]
sub sp, sp, #16
str d2, [fp, #-32]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-48]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-64]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-80]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-96]
ldr d9, =const8
str d9, [fp, #-32]
ldr x0, =const9
ldr x1, [fp, #-16]
bl fn2
ldr x9, =const10
str x9, [fp, #-16]
ldr x9, =const16
str x9, [fp, #-64]
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
add sp, sp, #16
mov sp, fp
ldr fp, [sp]
add sp, sp, #16
ldr lr, [sp]
add sp, sp, #16
ret
