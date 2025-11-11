.data
.align 8
const_0: .dword 1
.align 8
const_1: .dword 0
.align 8
const_2: .dword 1
.align 8
const_3: .dword 1
.align 8
const_4: .dword 0
.align 8
const_5: .dword 0
.align 8
const_6: .dword 1
.align 8
const_7: .dword 1
.align 8
const_8: .dword 1
.text
// ==
.global fn_0
fn_0:
cmp x0, x1
cset x0, eq
ret
// ==
.global fn_1
fn_1:
cmp x0, x1
cset x0, eq
ret
// *
.global fn_2
fn_2:
mul x0, x0, x1
ret
// /
.global fn_3
fn_3:
sdiv x0, x0, x1
ret
// +
.global fn_4
fn_4:
add x0, x0, x1
ret
// -
.global fn_5
fn_5:
sub x0, x0, x1
ret
// >
.global fn_6
fn_6:
cmp x0, x1
cset x0, gt
ret
// <
.global fn_7
fn_7:
cmp x0, x1
cset x0, lt
ret
// >=
.global fn_8
fn_8:
cmp x0, x1
cset x0, ge
ret
// <=
.global fn_9
fn_9:
cmp x0, x1
cset x0, le
ret
// *
.global fn_10
fn_10:
fmul d0, d0, d1
ret
// /
.global fn_11
fn_11:
fdiv d0, d0, d1
ret
// +
.global fn_12
fn_12:
fadd d0, d0, d1
ret
// -
.global fn_13
fn_13:
fsub d0, d0, d1
ret
// ==
.global fn_14
fn_14:
fcmp d0, d1
cset x0, eq
ret
// >
.global fn_15
fn_15:
fcmp d0, d1
cset x0, gt
ret
// <
.global fn_16
fn_16:
fcmp d0, d1
cset x0, lt
ret
// >=
.global fn_17
fn_17:
fcmp d0, d1
cset x0, ge
ret
// <=
.global fn_18
fn_18:
fcmp d0, d1
cset x0, le
ret
// factorial
.global fn_19
fn_19:
sub sp, sp, #16
str lr, [sp]
sub sp, sp, #16
str fp, [sp]
mov fp, sp
sub sp, sp, #16
str x0, [fp, #-16]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-32]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-48]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-64]
ldr x0, =const_0
ldr x0, [x0]
str x0, [fp, #-32]
ldr x0, =const_1
ldr x0, [x0]
str x0, [fp, #-48]
ldr x0, =const_2
ldr x0, [x0]
str x0, [fp, #-64]
while_0_start:
ldr x0, [fp, #-48]
ldr x1, [fp, #-16]
bl fn_7
cmp x0, #1
bne while_0_end
ldr x0, [fp, #-32]
ldr x1, [fp, #-64]
bl fn_2
str x0, [fp, #-32]
ldr x0, [fp, #-64]
ldr x1, =const_3
ldr x1, [x1]
bl fn_4
str x0, [fp, #-64]
ldr x0, =const_4
ldr x0, [x0]
cmp x0, #1
bne if_0_false
if_0_true:
b if_0_end
if_0_false:
ldr x0, =const_5
ldr x0, [x0]
cmp x0, #1
bne if_1_false
if_1_true:
b if_1_end
if_1_false:
ldr x0, [fp, #-48]
bl fn_21
str x0, [fp, #-48]
b if_1_end
if_1_end:
b if_0_end
if_0_end:
b while_0_start
while_0_end:
ldr x0, [fp, #-32]
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
// **
.global fn_20
fn_20:
sub sp, sp, #16
str lr, [sp]
sub sp, sp, #16
str fp, [sp]
mov fp, sp
sub sp, sp, #16
str x0, [fp, #-16]
sub sp, sp, #16
str x1, [fp, #-32]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-48]
sub sp, sp, #16
mov x9, #0
str x9, [fp, #-64]
ldr x0, =const_6
ldr x0, [x0]
str x0, [fp, #-64]
while_1_start:
ldr x0, [fp, #-48]
ldr x1, [fp, #-32]
bl fn_7
cmp x0, #1
bne while_1_end
ldr x0, [fp, #-64]
ldr x1, [fp, #-16]
bl fn_2
str x0, [fp, #-64]
ldr x0, [fp, #-48]
ldr x1, =const_7
ldr x1, [x1]
bl fn_4
str x0, [fp, #-48]
b while_1_start
while_1_end:
ldr x0, [fp, #-64]
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
// increment
.global fn_21
fn_21:
sub sp, sp, #16
str lr, [sp]
sub sp, sp, #16
str fp, [sp]
mov fp, sp
sub sp, sp, #16
str x0, [fp, #-16]
ldr x0, [fp, #-16]
ldr x1, =const_8
ldr x1, [x1]
bl fn_4
add sp, sp, #16
mov sp, fp
ldr fp, [sp]
add sp, sp, #16
ldr lr, [sp]
add sp, sp, #16
ret
