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
sub sp, sp, 112
str lr, [sp, #104]
str fp, [sp, #96]
add fp, sp, #96
str x0, [fp, #-8]
str x1, [fp, #-16]
str x2, [fp, #-24]
str x3, [fp, #-32]
str x4, [fp, #-40]
str x5, [fp, #-48]
str x6, [fp, #-56]
str x7, [fp, #-64]
ldr x9, [fp, #16]
str x9, [fp, #-72]
ldr x9, [fp, #24]
str x9, [fp, #-80]
ldr x9, [fp, #32]
str x9, [fp, #-88]
mov x9, #0
str x9, [fp, #-96]
mov x9, #0
str x9, [fp, #-104]
mov x9, #0
str x9, [fp, #-112]
ldr x0, =const_0
ldr x0, [x0]
str x0, [fp, #-96]
ldr x0, =const_1
ldr x0, [x0]
str x0, [fp, #-104]
ldr x0, =const_2
ldr x0, [x0]
str x0, [fp, #-112]
while_0_start:
sub sp, sp, 0
ldr x0, [fp, #-104]
ldr x1, [fp, #-80]
bl fn_7
add sp, sp, 0
cmp x0, #1
bne while_0_end
sub sp, sp, 0
ldr x0, [fp, #-96]
ldr x1, [fp, #-112]
bl fn_2
add sp, sp, 0
str x0, [fp, #-96]
sub sp, sp, 0
ldr x0, [fp, #-112]
ldr x1, =const_3
ldr x1, [x1]
bl fn_4
add sp, sp, 0
str x0, [fp, #-112]
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
sub sp, sp, 0
ldr x0, [fp, #-104]
bl fn_21
add sp, sp, 0
str x0, [fp, #-104]
b if_1_end
if_1_end:
b if_0_end
if_0_end:
b while_0_start
while_0_end:
ldr x0, [fp, #-96]
ldr fp, [sp, #96]
ldr lr, [sp, #104]
add sp, sp, 112
ret
// **
.global fn_20
fn_20:
sub sp, sp, 32
str lr, [sp, #24]
str fp, [sp, #16]
add fp, sp, #16
str x0, [fp, #-8]
str x1, [fp, #-16]
mov x9, #0
str x9, [fp, #-24]
mov x9, #0
str x9, [fp, #-32]
ldr x0, =const_6
ldr x0, [x0]
str x0, [fp, #-32]
while_1_start:
sub sp, sp, 0
ldr x0, [fp, #-24]
ldr x1, [fp, #-16]
bl fn_7
add sp, sp, 0
cmp x0, #1
bne while_1_end
sub sp, sp, 0
ldr x0, [fp, #-32]
ldr x1, [fp, #-8]
bl fn_2
add sp, sp, 0
str x0, [fp, #-32]
sub sp, sp, 0
ldr x0, [fp, #-24]
ldr x1, =const_7
ldr x1, [x1]
bl fn_4
add sp, sp, 0
str x0, [fp, #-24]
b while_1_start
while_1_end:
ldr x0, [fp, #-32]
ldr fp, [sp, #16]
ldr lr, [sp, #24]
add sp, sp, 32
ret
// increment
.global fn_21
fn_21:
sub sp, sp, 16
str lr, [sp, #8]
str fp, [sp, #0]
add fp, sp, #0
str x0, [fp, #-8]
sub sp, sp, 0
ldr x0, [fp, #-8]
ldr x1, =const_8
ldr x1, [x1]
bl fn_4
add sp, sp, 0
ldr fp, [sp, #0]
ldr lr, [sp, #8]
add sp, sp, 16
ret
