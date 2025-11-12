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
const_4: .dword 1
.align 8
const_5: .dword 1
.align 8
const_6: .double 1.0
.align 8
const_7: .dword 1
.align 8
const_8: .dword 2
.align 8
const_9: .dword 2
.align 8
const_10: .dword 1
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
sub sp, sp, 176
str lr, [sp, #168]
str fp, [sp, #160]
add fp, sp, #160
// factorial argument var1
str x0, [fp, #-8]
// factorial argument var2
str x1, [fp, #-16]
// factorial argument var3
str x2, [fp, #-24]
// factorial argument var4
str x3, [fp, #-32]
// factorial argument var5
str x4, [fp, #-40]
// factorial argument var6
str x5, [fp, #-48]
// factorial argument var7
str x6, [fp, #-56]
// factorial argument var8
str x7, [fp, #-64]
// factorial argument var9
ldr x9, [fp, #16]
str x9, [fp, #-72]
// factorial argument num
ldr x9, [fp, #24]
str x9, [fp, #-80]
// factorial argument var10
ldr x9, [fp, #32]
str x9, [fp, #-88]
// factorial argument var11
ldr x9, [fp, #40]
str x9, [fp, #-96]
// factorial argument var12
ldr x9, [fp, #48]
str x9, [fp, #-104]
// factorial argument var13
ldr x9, [fp, #56]
str x9, [fp, #-112]
// factorial argument var14
ldr x9, [fp, #64]
str x9, [fp, #-120]
// factorial argument var15
ldr x9, [fp, #72]
str x9, [fp, #-128]
// factorial variable prod
mov x9, #0
str x9, [fp, #-136]
// factorial variable i
mov x9, #0
str x9, [fp, #-144]
// factorial variable acc
mov x9, #0
str x9, [fp, #-152]
ldr x0, =const_0
ldr x0, [x0]
str x0, [fp, #-136]
ldr x0, =const_1
ldr x0, [x0]
str x0, [fp, #-144]
ldr x0, =const_2
ldr x0, [x0]
str x0, [fp, #-152]
while_0_start:
sub sp, sp, 0
// fn call "<" arg "i"
ldr x0, [fp, #-144]
// fn call "<" arg "num"
ldr x1, [fp, #-80]
// fn call "<"
bl fn_7
add sp, sp, 0
cmp x0, #1
bne while_0_end
sub sp, sp, 0
// fn call "*" arg "prod"
ldr x0, [fp, #-136]
// fn call "*" arg "acc"
ldr x1, [fp, #-152]
// fn call "*"
bl fn_2
add sp, sp, 0
str x0, [fp, #-136]
sub sp, sp, 0
// fn call "+" arg "acc"
ldr x0, [fp, #-152]
// fn call "+" arg "1"
ldr x1, =const_3
ldr x1, [x1]
// fn call "+"
bl fn_4
add sp, sp, 0
str x0, [fp, #-152]
sub sp, sp, 0
// fn call "increment" arg "i"
ldr x0, [fp, #-144]
// fn call "increment"
bl fn_23
add sp, sp, 0
str x0, [fp, #-144]
b while_0_start
while_0_end:
ldr x0, [fp, #-136]
ldr fp, [sp, #160]
ldr lr, [sp, #168]
add sp, sp, 176
ret
// **
.global fn_20
fn_20:
sub sp, sp, 48
str lr, [sp, #40]
str fp, [sp, #32]
add fp, sp, #32
// ** argument a
str x0, [fp, #-8]
// ** argument b
str x1, [fp, #-16]
// ** variable i
mov x9, #0
str x9, [fp, #-24]
// ** variable res
mov x9, #0
str x9, [fp, #-32]
ldr x0, =const_4
ldr x0, [x0]
str x0, [fp, #-32]
while_1_start:
sub sp, sp, 0
// fn call "<" arg "i"
ldr x0, [fp, #-24]
// fn call "<" arg "b"
ldr x1, [fp, #-16]
// fn call "<"
bl fn_7
add sp, sp, 0
cmp x0, #1
bne while_1_end
sub sp, sp, 0
// fn call "*" arg "res"
ldr x0, [fp, #-32]
// fn call "*" arg "a"
ldr x1, [fp, #-8]
// fn call "*"
bl fn_2
add sp, sp, 0
str x0, [fp, #-32]
sub sp, sp, 0
// fn call "+" arg "i"
ldr x0, [fp, #-24]
// fn call "+" arg "1"
ldr x1, =const_5
ldr x1, [x1]
// fn call "+"
bl fn_4
add sp, sp, 0
str x0, [fp, #-24]
b while_1_start
while_1_end:
ldr x0, [fp, #-32]
ldr fp, [sp, #32]
ldr lr, [sp, #40]
add sp, sp, 48
ret
// **
.global fn_21
fn_21:
sub sp, sp, 48
str lr, [sp, #40]
str fp, [sp, #32]
add fp, sp, #32
// ** argument a
str d0, [fp, #-8]
// ** argument b
str x0, [fp, #-16]
// ** variable i
mov x9, #0
str x9, [fp, #-24]
// ** variable res
movi d9, #0
str d9, [fp, #-32]
ldr x0, =const_6
ldr d0, [x0]
str d0, [fp, #-32]
while_2_start:
sub sp, sp, 0
// fn call "<" arg "i"
ldr x0, [fp, #-24]
// fn call "<" arg "b"
ldr x1, [fp, #-16]
// fn call "<"
bl fn_7
add sp, sp, 0
cmp x0, #1
bne while_2_end
sub sp, sp, 0
// fn call "*" arg "res"
ldr d0, [fp, #-32]
// fn call "*" arg "a"
ldr d1, [fp, #-8]
// fn call "*"
bl fn_10
add sp, sp, 0
str d0, [fp, #-32]
sub sp, sp, 0
// fn call "+" arg "i"
ldr x0, [fp, #-24]
// fn call "+" arg "1"
ldr x1, =const_7
ldr x1, [x1]
// fn call "+"
bl fn_4
add sp, sp, 0
str x0, [fp, #-24]
b while_2_start
while_2_end:
ldr d0, [fp, #-32]
ldr fp, [sp, #32]
ldr lr, [sp, #40]
add sp, sp, 48
ret
// sum_of_squares
.global fn_22
fn_22:
sub sp, sp, 256
str lr, [sp, #248]
str fp, [sp, #240]
add fp, sp, #240
// sum_of_squares argument var1
str x0, [fp, #-8]
// sum_of_squares argument var2
str x1, [fp, #-16]
// sum_of_squares argument var3
str x2, [fp, #-24]
// sum_of_squares argument var4
str x3, [fp, #-32]
// sum_of_squares argument var5
str x4, [fp, #-40]
// sum_of_squares argument var6
str x5, [fp, #-48]
// sum_of_squares argument var7
str x6, [fp, #-56]
// sum_of_squares argument var8
str x7, [fp, #-64]
// sum_of_squares argument var9
ldr x9, [fp, #16]
str x9, [fp, #-72]
// sum_of_squares argument num
ldr x9, [fp, #24]
str x9, [fp, #-80]
// sum_of_squares argument var10
ldr x9, [fp, #32]
str x9, [fp, #-88]
// sum_of_squares argument var11
ldr x9, [fp, #40]
str x9, [fp, #-96]
// sum_of_squares argument var12
ldr x9, [fp, #48]
str x9, [fp, #-104]
// sum_of_squares argument var13
ldr x9, [fp, #56]
str x9, [fp, #-112]
// sum_of_squares argument var14
str d0, [fp, #-120]
// sum_of_squares argument var15
str d1, [fp, #-128]
// sum_of_squares argument var16
str d2, [fp, #-136]
// sum_of_squares argument var17
str d3, [fp, #-144]
// sum_of_squares argument var18
str d4, [fp, #-152]
// sum_of_squares argument var19
str d5, [fp, #-160]
// sum_of_squares argument var20
str d6, [fp, #-168]
// sum_of_squares argument var21
str d7, [fp, #-176]
// sum_of_squares argument var22
ldr d9, [fp, #64]
str d9, [fp, #-184]
// sum_of_squares argument var23
ldr d9, [fp, #72]
str d9, [fp, #-192]
// sum_of_squares argument var24
ldr d9, [fp, #80]
str d9, [fp, #-200]
// sum_of_squares argument var25
ldr d9, [fp, #88]
str d9, [fp, #-208]
// sum_of_squares argument var26
ldr d9, [fp, #96]
str d9, [fp, #-216]
// sum_of_squares argument var27
ldr d9, [fp, #104]
str d9, [fp, #-224]
// sum_of_squares variable square1
movi d9, #0
str d9, [fp, #-232]
// sum_of_squares variable square2
movi d9, #0
str d9, [fp, #-240]
sub sp, sp, 0
// fn call "**" arg "var25"
ldr d0, [fp, #-208]
// fn call "**" arg "2"
ldr x0, =const_8
ldr x0, [x0]
// fn call "**"
bl fn_21
add sp, sp, 0
str d0, [fp, #-232]
sub sp, sp, 0
// fn call "**" arg "var26"
ldr d0, [fp, #-216]
// fn call "**" arg "2"
ldr x0, =const_9
ldr x0, [x0]
// fn call "**"
bl fn_21
add sp, sp, 0
str d0, [fp, #-240]
sub sp, sp, 0
// fn call "+" arg "square1"
ldr d0, [fp, #-232]
// fn call "+" arg "square2"
ldr d1, [fp, #-240]
// fn call "+"
bl fn_12
add sp, sp, 0
ldr fp, [sp, #240]
ldr lr, [sp, #248]
add sp, sp, 256
ret
// increment
.global fn_23
fn_23:
sub sp, sp, 32
str lr, [sp, #24]
str fp, [sp, #16]
add fp, sp, #16
// increment argument val
str x0, [fp, #-8]
sub sp, sp, 0
// fn call "+" arg "val"
ldr x0, [fp, #-8]
// fn call "+" arg "1"
ldr x1, =const_10
ldr x1, [x1]
// fn call "+"
bl fn_4
add sp, sp, 0
ldr fp, [sp, #16]
ldr lr, [sp, #24]
add sp, sp, 32
ret
