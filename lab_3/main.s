
./build/main:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000000a58 <_init>:
 a58:	d503233f 	paciasp
 a5c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 a60:	910003fd 	mov	x29, sp
 a64:	94000084 	bl	c74 <call_weak_fn>
 a68:	a8c17bfd 	ldp	x29, x30, [sp], #16
 a6c:	d50323bf 	autiasp
 a70:	d65f03c0 	ret

Disassembly of section .plt:

0000000000000a80 <.plt>:
 a80:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 a84:	f00000f0 	adrp	x16, 1f000 <__abi_tag+0x1ae50>
 a88:	f947fe11 	ldr	x17, [x16, #4088]
 a8c:	913fe210 	add	x16, x16, #0xff8
 a90:	d61f0220 	br	x17
 a94:	d503201f 	nop
 a98:	d503201f 	nop
 a9c:	d503201f 	nop

0000000000000aa0 <strlen@plt>:
 aa0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 aa4:	f9400211 	ldr	x17, [x16]
 aa8:	91000210 	add	x16, x16, #0x0
 aac:	d61f0220 	br	x17

0000000000000ab0 <__libc_start_main@plt>:
 ab0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 ab4:	f9400611 	ldr	x17, [x16, #8]
 ab8:	91002210 	add	x16, x16, #0x8
 abc:	d61f0220 	br	x17

0000000000000ac0 <__cxa_finalize@plt>:
 ac0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 ac4:	f9400a11 	ldr	x17, [x16, #16]
 ac8:	91004210 	add	x16, x16, #0x10
 acc:	d61f0220 	br	x17

0000000000000ad0 <fputc@plt>:
 ad0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 ad4:	f9400e11 	ldr	x17, [x16, #24]
 ad8:	91006210 	add	x16, x16, #0x18
 adc:	d61f0220 	br	x17

0000000000000ae0 <time@plt>:
 ae0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 ae4:	f9401211 	ldr	x17, [x16, #32]
 ae8:	91008210 	add	x16, x16, #0x20
 aec:	d61f0220 	br	x17

0000000000000af0 <malloc@plt>:
 af0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 af4:	f9401611 	ldr	x17, [x16, #40]
 af8:	9100a210 	add	x16, x16, #0x28
 afc:	d61f0220 	br	x17

0000000000000b00 <open@plt>:
 b00:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b04:	f9401a11 	ldr	x17, [x16, #48]
 b08:	9100c210 	add	x16, x16, #0x30
 b0c:	d61f0220 	br	x17

0000000000000b10 <memset@plt>:
 b10:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b14:	f9401e11 	ldr	x17, [x16, #56]
 b18:	9100e210 	add	x16, x16, #0x38
 b1c:	d61f0220 	br	x17

0000000000000b20 <calloc@plt>:
 b20:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b24:	f9402211 	ldr	x17, [x16, #64]
 b28:	91010210 	add	x16, x16, #0x40
 b2c:	d61f0220 	br	x17

0000000000000b30 <strerror@plt>:
 b30:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b34:	f9402611 	ldr	x17, [x16, #72]
 b38:	91012210 	add	x16, x16, #0x48
 b3c:	d61f0220 	br	x17

0000000000000b40 <close@plt>:
 b40:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b44:	f9402a11 	ldr	x17, [x16, #80]
 b48:	91014210 	add	x16, x16, #0x50
 b4c:	d61f0220 	br	x17

0000000000000b50 <__gmon_start__@plt>:
 b50:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b54:	f9402e11 	ldr	x17, [x16, #88]
 b58:	91016210 	add	x16, x16, #0x58
 b5c:	d61f0220 	br	x17

0000000000000b60 <abort@plt>:
 b60:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b64:	f9403211 	ldr	x17, [x16, #96]
 b68:	91018210 	add	x16, x16, #0x60
 b6c:	d61f0220 	br	x17

0000000000000b70 <puts@plt>:
 b70:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b74:	f9403611 	ldr	x17, [x16, #104]
 b78:	9101a210 	add	x16, x16, #0x68
 b7c:	d61f0220 	br	x17

0000000000000b80 <free@plt>:
 b80:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b84:	f9403a11 	ldr	x17, [x16, #112]
 b88:	9101c210 	add	x16, x16, #0x70
 b8c:	d61f0220 	br	x17

0000000000000b90 <fwrite@plt>:
 b90:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 b94:	f9403e11 	ldr	x17, [x16, #120]
 b98:	9101e210 	add	x16, x16, #0x78
 b9c:	d61f0220 	br	x17

0000000000000ba0 <read@plt>:
 ba0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 ba4:	f9404211 	ldr	x17, [x16, #128]
 ba8:	91020210 	add	x16, x16, #0x80
 bac:	d61f0220 	br	x17

0000000000000bb0 <regexec@plt>:
 bb0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 bb4:	f9404611 	ldr	x17, [x16, #136]
 bb8:	91022210 	add	x16, x16, #0x88
 bbc:	d61f0220 	br	x17

0000000000000bc0 <regfree@plt>:
 bc0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 bc4:	f9404a11 	ldr	x17, [x16, #144]
 bc8:	91024210 	add	x16, x16, #0x90
 bcc:	d61f0220 	br	x17

0000000000000bd0 <regcomp@plt>:
 bd0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 bd4:	f9404e11 	ldr	x17, [x16, #152]
 bd8:	91026210 	add	x16, x16, #0x98
 bdc:	d61f0220 	br	x17

0000000000000be0 <printf@plt>:
 be0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 be4:	f9405211 	ldr	x17, [x16, #160]
 be8:	91028210 	add	x16, x16, #0xa0
 bec:	d61f0220 	br	x17

0000000000000bf0 <__errno_location@plt>:
 bf0:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 bf4:	f9405611 	ldr	x17, [x16, #168]
 bf8:	9102a210 	add	x16, x16, #0xa8
 bfc:	d61f0220 	br	x17

0000000000000c00 <fstat@plt>:
 c00:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 c04:	f9405a11 	ldr	x17, [x16, #176]
 c08:	9102c210 	add	x16, x16, #0xb0
 c0c:	d61f0220 	br	x17

0000000000000c10 <fprintf@plt>:
 c10:	90000110 	adrp	x16, 20000 <strlen@GLIBC_2.17>
 c14:	f9405e11 	ldr	x17, [x16, #184]
 c18:	9102e210 	add	x16, x16, #0xb8
 c1c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000c40 <_start>:
     c40:	d503245f 	bti	c
     c44:	d280001d 	mov	x29, #0x0                   	// #0
     c48:	d280001e 	mov	x30, #0x0                   	// #0
     c4c:	aa0003e5 	mov	x5, x0
     c50:	f94003e1 	ldr	x1, [sp]
     c54:	910023e2 	add	x2, sp, #0x8
     c58:	910003e6 	mov	x6, sp
     c5c:	f00000e0 	adrp	x0, 1f000 <__abi_tag+0x1ae50>
     c60:	f947ec00 	ldr	x0, [x0, #4056]
     c64:	d2800003 	mov	x3, #0x0                   	// #0
     c68:	d2800004 	mov	x4, #0x0                   	// #0
     c6c:	97ffff91 	bl	ab0 <__libc_start_main@plt>
     c70:	97ffffbc 	bl	b60 <abort@plt>

0000000000000c74 <call_weak_fn>:
     c74:	f00000e0 	adrp	x0, 1f000 <__abi_tag+0x1ae50>
     c78:	f947e800 	ldr	x0, [x0, #4048]
     c7c:	b4000040 	cbz	x0, c84 <call_weak_fn+0x10>
     c80:	17ffffb4 	b	b50 <__gmon_start__@plt>
     c84:	d65f03c0 	ret
     c88:	d503201f 	nop
     c8c:	d503201f 	nop
     c90:	d503201f 	nop
     c94:	d503201f 	nop
     c98:	d503201f 	nop
     c9c:	d503201f 	nop

0000000000000ca0 <deregister_tm_clones>:
     ca0:	90000100 	adrp	x0, 20000 <strlen@GLIBC_2.17>
     ca4:	91034000 	add	x0, x0, #0xd0
     ca8:	90000101 	adrp	x1, 20000 <strlen@GLIBC_2.17>
     cac:	91034021 	add	x1, x1, #0xd0
     cb0:	eb00003f 	cmp	x1, x0
     cb4:	540000c0 	b.eq	ccc <deregister_tm_clones+0x2c>  // b.none
     cb8:	f00000e1 	adrp	x1, 1f000 <__abi_tag+0x1ae50>
     cbc:	f947dc21 	ldr	x1, [x1, #4024]
     cc0:	b4000061 	cbz	x1, ccc <deregister_tm_clones+0x2c>
     cc4:	aa0103f0 	mov	x16, x1
     cc8:	d61f0200 	br	x16
     ccc:	d65f03c0 	ret

0000000000000cd0 <register_tm_clones>:
     cd0:	90000100 	adrp	x0, 20000 <strlen@GLIBC_2.17>
     cd4:	91034000 	add	x0, x0, #0xd0
     cd8:	90000101 	adrp	x1, 20000 <strlen@GLIBC_2.17>
     cdc:	91034021 	add	x1, x1, #0xd0
     ce0:	cb000021 	sub	x1, x1, x0
     ce4:	d37ffc22 	lsr	x2, x1, #63
     ce8:	8b810c41 	add	x1, x2, x1, asr #3
     cec:	9341fc21 	asr	x1, x1, #1
     cf0:	b40000c1 	cbz	x1, d08 <register_tm_clones+0x38>
     cf4:	f00000e2 	adrp	x2, 1f000 <__abi_tag+0x1ae50>
     cf8:	f947f042 	ldr	x2, [x2, #4064]
     cfc:	b4000062 	cbz	x2, d08 <register_tm_clones+0x38>
     d00:	aa0203f0 	mov	x16, x2
     d04:	d61f0200 	br	x16
     d08:	d65f03c0 	ret

0000000000000d0c <__do_global_dtors_aux>:
     d0c:	d503233f 	paciasp
     d10:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     d14:	910003fd 	mov	x29, sp
     d18:	f9000bf3 	str	x19, [sp, #16]
     d1c:	90000113 	adrp	x19, 20000 <strlen@GLIBC_2.17>
     d20:	39434260 	ldrb	w0, [x19, #208]
     d24:	37000140 	tbnz	w0, #0, d4c <__do_global_dtors_aux+0x40>
     d28:	f00000e0 	adrp	x0, 1f000 <__abi_tag+0x1ae50>
     d2c:	f947e000 	ldr	x0, [x0, #4032]
     d30:	b4000080 	cbz	x0, d40 <__do_global_dtors_aux+0x34>
     d34:	90000100 	adrp	x0, 20000 <strlen@GLIBC_2.17>
     d38:	f9406400 	ldr	x0, [x0, #200]
     d3c:	97ffff61 	bl	ac0 <__cxa_finalize@plt>
     d40:	97ffffd8 	bl	ca0 <deregister_tm_clones>
     d44:	52800020 	mov	w0, #0x1                   	// #1
     d48:	39034260 	strb	w0, [x19, #208]
     d4c:	f9400bf3 	ldr	x19, [sp, #16]
     d50:	a8c27bfd 	ldp	x29, x30, [sp], #32
     d54:	d50323bf 	autiasp
     d58:	d65f03c0 	ret
     d5c:	d503201f 	nop

0000000000000d60 <frame_dummy>:
     d60:	d503245f 	bti	c
     d64:	17ffffdb 	b	cd0 <register_tm_clones>

0000000000000d68 <main>:
     d68:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
     d6c:	a9016ffc 	stp	x28, x27, [sp, #16]
     d70:	a90267fa 	stp	x26, x25, [sp, #32]
     d74:	a9035ff8 	stp	x24, x23, [sp, #48]
     d78:	a90457f6 	stp	x22, x21, [sp, #64]
     d7c:	a9054ff4 	stp	x20, x19, [sp, #80]
     d80:	910003fd 	mov	x29, sp
     d84:	d11403ff 	sub	sp, sp, #0x500
     d88:	7100081f 	cmp	w0, #0x2
     d8c:	540089a1 	b.ne	1ec0 <main+0x1158>  // b.any
     d90:	f9400420 	ldr	x0, [x1, #8]
     d94:	2a1f03e1 	mov	w1, wzr
     d98:	97ffff5a 	bl	b00 <open@plt>
     d9c:	3100041f 	cmn	w0, #0x1
     da0:	54008aa0 	b.eq	1ef4 <main+0x118c>  // b.none
     da4:	910363e1 	add	x1, sp, #0xd8
     da8:	2a0003f4 	mov	w20, w0
     dac:	97ffff95 	bl	c00 <fstat@plt>
     db0:	3100041f 	cmn	w0, #0x1
     db4:	54008c60 	b.eq	1f40 <main+0x11d8>  // b.none
     db8:	f94087f5 	ldr	x21, [sp, #264]
     dbc:	910006a0 	add	x0, x21, #0x1
     dc0:	97ffff4c 	bl	af0 <malloc@plt>
     dc4:	b4008e40 	cbz	x0, 1f8c <main+0x1224>
     dc8:	aa0003f3 	mov	x19, x0
     dcc:	2a1403e0 	mov	w0, w20
     dd0:	aa1503e2 	mov	x2, x21
     dd4:	aa1303e1 	mov	x1, x19
     dd8:	97ffff72 	bl	ba0 <read@plt>
     ddc:	eb15001f 	cmp	x0, x21
     de0:	54008f01 	b.ne	1fc0 <main+0x1258>  // b.any
     de4:	2a1403e0 	mov	w0, w20
     de8:	38356a7f 	strb	wzr, [x19, x21]
     dec:	97ffff55 	bl	b40 <close@plt>
     df0:	3100041f 	cmn	w0, #0x1
     df4:	54009000 	b.eq	1ff4 <main+0x128c>  // b.none
     df8:	6f00e400 	movi	v0.2d, #0x0
     dfc:	52800860 	mov	w0, #0x43                  	// #67
     e00:	f90007f3 	str	x19, [sp, #8]
     e04:	f9006bf3 	str	x19, [sp, #208]
     e08:	ad0483e0 	stp	q0, q0, [sp, #144]
     e0c:	ad0583e0 	stp	q0, q0, [sp, #176]
     e10:	3d8023e0 	str	q0, [sp, #128]
     e14:	97ffff37 	bl	af0 <malloc@plt>
     e18:	b40091a0 	cbz	x0, 204c <main+0x12e4>
     e1c:	aa0003f4 	mov	x20, x0
     e20:	3900001f 	strb	wzr, [x0]
     e24:	97ffff1f 	bl	aa0 <strlen@plt>
     e28:	52850bc8 	mov	w8, #0x285e                	// #10334
     e2c:	8b000289 	add	x9, x20, x0
     e30:	aa1403e0 	mov	x0, x20
     e34:	79000128 	strh	w8, [x9]
     e38:	3900093f 	strb	wzr, [x9, #2]
     e3c:	97ffff19 	bl	aa0 <strlen@plt>
     e40:	52800515 	mov	w21, #0x28                  	// #40
     e44:	78206a95 	strh	w21, [x20, x0]
     e48:	aa1403e0 	mov	x0, x20
     e4c:	97ffff15 	bl	aa0 <strlen@plt>
     e50:	52850b77 	mov	w23, #0x285b                	// #10331
     e54:	72a00bb7 	movk	w23, #0x5d, lsl #16
     e58:	b8206a97 	str	w23, [x20, x0]
     e5c:	aa1403e0 	mov	x0, x20
     e60:	97ffff10 	bl	aa0 <strlen@plt>
     e64:	52800533 	mov	w19, #0x29                  	// #41
     e68:	78206a93 	strh	w19, [x20, x0]
     e6c:	aa1403e0 	mov	x0, x20
     e70:	97ffff0c 	bl	aa0 <strlen@plt>
     e74:	52800f96 	mov	w22, #0x7c                  	// #124
     e78:	78206a96 	strh	w22, [x20, x0]
     e7c:	aa1403e0 	mov	x0, x20
     e80:	97ffff08 	bl	aa0 <strlen@plt>
     e84:	78206a95 	strh	w21, [x20, x0]
     e88:	aa1403e0 	mov	x0, x20
     e8c:	97ffff05 	bl	aa0 <strlen@plt>
     e90:	321802e8 	orr	w8, w23, #0x100
     e94:	b8206a88 	str	w8, [x20, x0]
     e98:	aa1403e0 	mov	x0, x20
     e9c:	97ffff01 	bl	aa0 <strlen@plt>
     ea0:	78206a93 	strh	w19, [x20, x0]
     ea4:	aa1403e0 	mov	x0, x20
     ea8:	97fffefe 	bl	aa0 <strlen@plt>
     eac:	78206a96 	strh	w22, [x20, x0]
     eb0:	aa1403e0 	mov	x0, x20
     eb4:	97fffefb 	bl	aa0 <strlen@plt>
     eb8:	78206a95 	strh	w21, [x20, x0]
     ebc:	aa1403e0 	mov	x0, x20
     ec0:	97fffef8 	bl	aa0 <strlen@plt>
     ec4:	f0000008 	adrp	x8, 3000 <syntax_statement_list+0x818>
     ec8:	9110b108 	add	x8, x8, #0x42c
     ecc:	8b000289 	add	x9, x20, x0
     ed0:	ad400500 	ldp	q0, q1, [x8]
     ed4:	f841e108 	ldur	x8, [x8, #30]
     ed8:	aa1403e0 	mov	x0, x20
     edc:	ad000520 	stp	q0, q1, [x9]
     ee0:	f801e128 	stur	x8, [x9, #30]
     ee4:	97fffeef 	bl	aa0 <strlen@plt>
     ee8:	78206a93 	strh	w19, [x20, x0]
     eec:	aa1403e0 	mov	x0, x20
     ef0:	97fffeec 	bl	aa0 <strlen@plt>
     ef4:	78206a96 	strh	w22, [x20, x0]
     ef8:	aa1403e0 	mov	x0, x20
     efc:	97fffee9 	bl	aa0 <strlen@plt>
     f00:	78206a95 	strh	w21, [x20, x0]
     f04:	aa1403e0 	mov	x0, x20
     f08:	97fffee6 	bl	aa0 <strlen@plt>
     f0c:	52800148 	mov	w8, #0xa                   	// #10
     f10:	78206a88 	strh	w8, [x20, x0]
     f14:	aa1403e0 	mov	x0, x20
     f18:	97fffee2 	bl	aa0 <strlen@plt>
     f1c:	78206a93 	strh	w19, [x20, x0]
     f20:	aa1403e0 	mov	x0, x20
     f24:	97fffedf 	bl	aa0 <strlen@plt>
     f28:	78206a96 	strh	w22, [x20, x0]
     f2c:	aa1403e0 	mov	x0, x20
     f30:	97fffedc 	bl	aa0 <strlen@plt>
     f34:	78206a95 	strh	w21, [x20, x0]
     f38:	aa1403e0 	mov	x0, x20
     f3c:	97fffed9 	bl	aa0 <strlen@plt>
     f40:	52840b68 	mov	w8, #0x205b                	// #8283
     f44:	8b000289 	add	x9, x20, x0
     f48:	5280056a 	mov	w10, #0x2b                  	// #43
     f4c:	72aba128 	movk	w8, #0x5d09, lsl #16
     f50:	aa1403e0 	mov	x0, x20
     f54:	7900092a 	strh	w10, [x9, #4]
     f58:	b9000128 	str	w8, [x9]
     f5c:	97fffed1 	bl	aa0 <strlen@plt>
     f60:	78206a93 	strh	w19, [x20, x0]
     f64:	aa1403e0 	mov	x0, x20
     f68:	97fffece 	bl	aa0 <strlen@plt>
     f6c:	f00000f9 	adrp	x25, 1f000 <__abi_tag+0x1ae50>
     f70:	f947e739 	ldr	x25, [x25, #4040]
     f74:	78206a93 	strh	w19, [x20, x0]
     f78:	aa1f03e0 	mov	x0, xzr
     f7c:	f9400335 	ldr	x21, [x25]
     f80:	97fffed8 	bl	ae0 <time@plt>
     f84:	aa0003e5 	mov	x5, x0
     f88:	f0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
     f8c:	910eb421 	add	x1, x1, #0x3ad
     f90:	f0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
     f94:	910ae842 	add	x2, x2, #0x2ba
     f98:	f0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
     f9c:	910f3884 	add	x4, x4, #0x3ce
     fa0:	aa1503e0 	mov	x0, x21
     fa4:	528010c3 	mov	w3, #0x86                  	// #134
     fa8:	97ffff1a 	bl	c10 <fprintf@plt>
     fac:	f9400320 	ldr	x0, [x25]
     fb0:	f0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
     fb4:	910fc821 	add	x1, x1, #0x3f2
     fb8:	aa1403e2 	mov	x2, x20
     fbc:	97ffff15 	bl	c10 <fprintf@plt>
     fc0:	f9400323 	ldr	x3, [x25]
     fc4:	f0000000 	adrp	x0, 3000 <syntax_statement_list+0x818>
     fc8:	910f2c00 	add	x0, x0, #0x3cb
     fcc:	52800041 	mov	w1, #0x2                   	// #2
     fd0:	52800022 	mov	w2, #0x1                   	// #1
     fd4:	97fffeef 	bl	b90 <fwrite@plt>
     fd8:	910203e0 	add	x0, sp, #0x80
     fdc:	aa1403e1 	mov	x1, x20
     fe0:	52800022 	mov	w2, #0x1                   	// #1
     fe4:	97fffefb 	bl	bd0 <regcomp@plt>
     fe8:	35008ac0 	cbnz	w0, 2140 <main+0x13d8>
     fec:	aa1403e0 	mov	x0, x20
     ff0:	97fffee4 	bl	b80 <free@plt>
     ff4:	910203e0 	add	x0, sp, #0x80
     ff8:	9101c3e1 	add	x1, sp, #0x70
     ffc:	94000527 	bl	2498 <lexic_analyzer_yield>
    1000:	36000620 	tbz	w0, #0, 10c4 <main+0x35c>
    1004:	d0000014 	adrp	x20, 3000 <syntax_statement_list+0x818>
    1008:	910eb694 	add	x20, x20, #0x3ad
    100c:	d0000015 	adrp	x21, 3000 <syntax_statement_list+0x818>
    1010:	910aeab5 	add	x21, x21, #0x2ba
    1014:	d0000016 	adrp	x22, 3000 <syntax_statement_list+0x818>
    1018:	910bf6d6 	add	x22, x22, #0x2fd
    101c:	d0000013 	adrp	x19, 3000 <syntax_statement_list+0x818>
    1020:	913d8273 	add	x19, x19, #0xf60
    1024:	d0000017 	adrp	x23, 3000 <syntax_statement_list+0x818>
    1028:	910f06f7 	add	x23, x23, #0x3c1
    102c:	d0000018 	adrp	x24, 3000 <syntax_statement_list+0x818>
    1030:	910f2f18 	add	x24, x24, #0x3cb
    1034:	d00000e8 	adrp	x8, 1f000 <__abi_tag+0x1ae50>
    1038:	aa1f03e0 	mov	x0, xzr
    103c:	f947e508 	ldr	x8, [x8, #4040]
    1040:	f9400119 	ldr	x25, [x8]
    1044:	97fffea7 	bl	ae0 <time@plt>
    104c:	aa1903e0 	mov	x0, x25
    1050:	d00000f9 	adrp	x25, 1f000 <__abi_tag+0x1ae50>
    1054:	f947e739 	ldr	x25, [x25, #4040]
    1058:	aa1403e1 	mov	x1, x20
    105c:	aa1503e2 	mov	x2, x21
    1060:	52805a83 	mov	w3, #0x2d4                 	// #724
    1064:	aa1603e4 	mov	x4, x22
    1068:	97fffeea 	bl	c10 <fprintf@plt>
    106c:	b9407be8 	ldr	w8, [sp, #120]
    1070:	f9400320 	ldr	x0, [x25]
    1074:	7100151f 	cmp	w8, #0x5
    1078:	54006962 	b.cs	1da4 <main+0x103c>  // b.hs, b.nlast
    107c:	294e2be9 	ldp	w9, w10, [sp, #112]
    1080:	f9406beb 	ldr	x11, [sp, #208]
    1084:	b8a87a68 	ldrsw	x8, [x19, x8, lsl #2]
    1088:	aa1703e1 	mov	x1, x23
    108c:	93407d29 	sxtw	x9, w9
    1090:	8b080264 	add	x4, x19, x8
    1094:	4b090142 	sub	w2, w10, w9
    1098:	8b090163 	add	x3, x11, x9
    109c:	97fffedd 	bl	c10 <fprintf@plt>
    10a0:	f9400323 	ldr	x3, [x25]
    10a4:	aa1803e0 	mov	x0, x24
    10a8:	52800041 	mov	w1, #0x2                   	// #2
    10ac:	52800022 	mov	w2, #0x1                   	// #1
    10b0:	97fffeb8 	bl	b90 <fwrite@plt>
    10b4:	910203e0 	add	x0, sp, #0x80
    10b8:	9101c3e1 	add	x1, sp, #0x70
    10bc:	940004f7 	bl	2498 <lexic_analyzer_yield>
    10c0:	3707fba0 	tbnz	w0, #0, 1034 <main+0x2cc>
    10c4:	6f00e400 	movi	v0.2d, #0x0
    10c8:	f9406bf4 	ldr	x20, [sp, #208]
    10cc:	aa1f03f5 	mov	x21, xzr
    10d0:	aa1f03f3 	mov	x19, xzr
    10d4:	52800028 	mov	w8, #0x1                   	// #1
    10d8:	b900cbff 	str	wzr, [sp, #200]
    10dc:	f90063ff 	str	xzr, [sp, #192]
    10e0:	ad0103e0 	stp	q0, q0, [sp, #32]
    10e4:	ad0203e0 	stp	q0, q0, [sp, #64]
    10e8:	3d801be0 	str	q0, [sp, #96]
    10ec:	f90017e8 	str	x8, [sp, #40]
    10f0:	910203e0 	add	x0, sp, #0x80
    10f4:	9101c3e1 	add	x1, sp, #0x70
    10f8:	940004e8 	bl	2498 <lexic_analyzer_yield>
    10fc:	360003a0 	tbz	w0, #0, 1170 <main+0x408>
    1100:	b9407be8 	ldr	w8, [sp, #120]
    1104:	51000d09 	sub	w9, w8, #0x3
    1108:	7100093f 	cmp	w9, #0x2
    110c:	54ffff23 	b.cc	10f0 <main+0x388>  // b.lo, b.ul, b.last
    1110:	7100091f 	cmp	w8, #0x2
    1114:	54000101 	b.ne	1134 <main+0x3cc>  // b.any
    1118:	f94027e8 	ldr	x8, [sp, #72]
    111c:	f9402fe9 	ldr	x9, [sp, #88]
    1120:	91000508 	add	x8, x8, #0x1
    1124:	91000529 	add	x9, x9, #0x1
    1128:	f90027e8 	str	x8, [sp, #72]
    112c:	f9002fe9 	str	x9, [sp, #88]
    1130:	17fffff0 	b	10f0 <main+0x388>
    1134:	7100051f 	cmp	w8, #0x1
    1138:	54000160 	b.eq	1164 <main+0x3fc>  // b.none
    113c:	35007a28 	cbnz	w8, 2080 <main+0x1318>
    1140:	f94027e8 	ldr	x8, [sp, #72]
    1144:	f94017e9 	ldr	x9, [sp, #40]
    1148:	910006b5 	add	x21, x21, #0x1
    114c:	91000673 	add	x19, x19, #0x1
    1150:	91000508 	add	x8, x8, #0x1
    1154:	91000529 	add	x9, x9, #0x1
    1158:	f90027e8 	str	x8, [sp, #72]
    115c:	f90017e9 	str	x9, [sp, #40]
    1160:	17ffffe4 	b	10f0 <main+0x388>
    1164:	b4009755 	cbz	x21, 244c <main+0x16e4>
    1168:	d10006b5 	sub	x21, x21, #0x1
    116c:	17ffffe1 	b	10f0 <main+0x388>
    1170:	f94017f6 	ldr	x22, [sp, #40]
    1174:	f9402ff5 	ldr	x21, [sp, #88]
    1178:	52800020 	mov	w0, #0x1                   	// #1
    117c:	d37ceec1 	lsl	x1, x22, #4
    1180:	f90037f5 	str	x21, [sp, #104]
    1184:	f9001ff6 	str	x22, [sp, #56]
    1188:	97fffe66 	bl	b20 <calloc@plt>
    118c:	d37ef6c1 	lsl	x1, x22, #2
    1190:	f90013e0 	str	x0, [sp, #32]
    1194:	52800020 	mov	w0, #0x1                   	// #1
    1198:	97fffe62 	bl	b20 <calloc@plt>
    119c:	f94027e8 	ldr	x8, [sp, #72]
    11a0:	f9001be0 	str	x0, [sp, #48]
    11a4:	52800020 	mov	w0, #0x1                   	// #1
    11a8:	d37ced01 	lsl	x1, x8, #4
    11ac:	97fffe5d 	bl	b20 <calloc@plt>
    11b0:	d37df2a1 	lsl	x1, x21, #3
    11b4:	f90023e0 	str	x0, [sp, #64]
    11b8:	52800020 	mov	w0, #0x1                   	// #1
    11bc:	97fffe59 	bl	b20 <calloc@plt>
    11c0:	d37ef6a1 	lsl	x1, x21, #2
    11c4:	f9002be0 	str	x0, [sp, #80]
    11c8:	52800020 	mov	w0, #0x1                   	// #1
    11cc:	97fffe55 	bl	b20 <calloc@plt>
    11d0:	f90033e0 	str	x0, [sp, #96]
    11d4:	91000660 	add	x0, x19, #0x1
    11d8:	52800101 	mov	w1, #0x8                   	// #8
    11dc:	97fffe51 	bl	b20 <calloc@plt>
    11e0:	aa0003f5 	mov	x21, x0
    11e4:	aa1f03f6 	mov	x22, xzr
    11e8:	aa1f03f3 	mov	x19, xzr
    11ec:	aa1f03f7 	mov	x23, xzr
    11f0:	b900cbff 	str	wzr, [sp, #200]
    11f4:	f90063ff 	str	xzr, [sp, #192]
    11f8:	910203e0 	add	x0, sp, #0x80
    11fc:	9101c3e1 	add	x1, sp, #0x70
    1200:	940004a6 	bl	2498 <lexic_analyzer_yield>
    1204:	36000440 	tbz	w0, #0, 128c <main+0x524>
    1208:	b9407be8 	ldr	w8, [sp, #120]
    120c:	51000d09 	sub	w9, w8, #0x3
    1210:	7100093f 	cmp	w9, #0x2
    1214:	54ffff23 	b.cc	11f8 <main+0x490>  // b.lo, b.ul, b.last
    1218:	7100051f 	cmp	w8, #0x1
    121c:	54000061 	b.ne	1228 <main+0x4c0>  // b.any
    1220:	d10006f7 	sub	x23, x23, #0x1
    1224:	17fffff5 	b	11f8 <main+0x490>
    1228:	7100091f 	cmp	w8, #0x2
    122c:	54000180 	b.eq	125c <main+0x4f4>  // b.none
    1230:	35008f88 	cbnz	w8, 2420 <main+0x16b8>
    1234:	f94013e8 	ldr	x8, [sp, #32]
    1238:	f8777aa9 	ldr	x9, [x21, x23, lsl #3]
    123c:	910006f7 	add	x23, x23, #0x1
    1240:	91000673 	add	x19, x19, #0x1
    1244:	f8377ab3 	str	x19, [x21, x23, lsl #3]
    1248:	8b091108 	add	x8, x8, x9, lsl #4
    124c:	f9400509 	ldr	x9, [x8, #8]
    1250:	91000529 	add	x9, x9, #0x1
    1254:	f9000509 	str	x9, [x8, #8]
    1258:	17ffffe8 	b	11f8 <main+0x490>
    125c:	f8777aa8 	ldr	x8, [x21, x23, lsl #3]
    1260:	f94013e9 	ldr	x9, [sp, #32]
    1264:	f9402bea 	ldr	x10, [sp, #80]
    1268:	8b081128 	add	x8, x9, x8, lsl #4
    126c:	f9400509 	ldr	x9, [x8, #8]
    1270:	91000529 	add	x9, x9, #0x1
    1274:	f9000509 	str	x9, [x8, #8]
    1278:	910006c8 	add	x8, x22, #0x1
    127c:	f9403be9 	ldr	x9, [sp, #112]
    1280:	f8367949 	str	x9, [x10, x22, lsl #3]
    1284:	aa0803f6 	mov	x22, x8
    1288:	17ffffdc 	b	11f8 <main+0x490>
    128c:	f94017e0 	ldr	x0, [sp, #40]
    1290:	b4000160 	cbz	x0, 12bc <main+0x554>
    1294:	f94013e9 	ldr	x9, [sp, #32]
    1298:	aa1f03e8 	mov	x8, xzr
    129c:	aa0003ea 	mov	x10, x0
    12a0:	91002129 	add	x9, x9, #0x8
    12a4:	f940012b 	ldr	x11, [x9]
    12a8:	f100054a 	subs	x10, x10, #0x1
    12ac:	f81f8128 	stur	x8, [x9, #-8]
    12b0:	91004129 	add	x9, x9, #0x10
    12b4:	8b080168 	add	x8, x11, x8
    12b8:	54ffff61 	b.ne	12a4 <main+0x53c>  // b.any
    12bc:	52800101 	mov	w1, #0x8                   	// #8
    12c0:	b900cbff 	str	wzr, [sp, #200]
    12c4:	f90063ff 	str	xzr, [sp, #192]
    12c8:	f90002bf 	str	xzr, [x21]
    12cc:	97fffe15 	bl	b20 <calloc@plt>
    12d0:	b40074e0 	cbz	x0, 216c <main+0x1404>
    12d4:	aa0003f6 	mov	x22, x0
    12d8:	aa1f03f3 	mov	x19, xzr
    12dc:	aa1f03f7 	mov	x23, xzr
    12e0:	aa1f03f8 	mov	x24, xzr
    12e4:	52800039 	mov	w25, #0x1                   	// #1
    12e8:	910203e0 	add	x0, sp, #0x80
    12ec:	9101c3e1 	add	x1, sp, #0x70
    12f0:	9400046a 	bl	2498 <lexic_analyzer_yield>
    12f4:	36000540 	tbz	w0, #0, 139c <main+0x634>
    12f8:	b9407be8 	ldr	w8, [sp, #120]
    12fc:	51000d09 	sub	w9, w8, #0x3
    1300:	7100093f 	cmp	w9, #0x2
    1304:	54ffff23 	b.cc	12e8 <main+0x580>  // b.lo, b.ul, b.last
    1308:	7100051f 	cmp	w8, #0x1
    130c:	54000061 	b.ne	1318 <main+0x5b0>  // b.any
    1310:	d1000718 	sub	x24, x24, #0x1
    1314:	17fffff5 	b	12e8 <main+0x580>
    1318:	7100091f 	cmp	w8, #0x2
    131c:	54000240 	b.eq	1364 <main+0x5fc>  // b.none
    1320:	35006ca8 	cbnz	w8, 20b4 <main+0x134c>
    1324:	f8787aa8 	ldr	x8, [x21, x24, lsl #3]
    1328:	f94013ea 	ldr	x10, [sp, #32]
    132c:	910006f7 	add	x23, x23, #0x1
    1330:	f94023eb 	ldr	x11, [sp, #64]
    1334:	91000718 	add	x24, x24, #0x1
    1338:	d37ced09 	lsl	x9, x8, #4
    133c:	f8387ab7 	str	x23, [x21, x24, lsl #3]
    1340:	f8696949 	ldr	x9, [x10, x9]
    1344:	f8687aca 	ldr	x10, [x22, x8, lsl #3]
    1348:	8b091169 	add	x9, x11, x9, lsl #4
    134c:	8b0a1129 	add	x9, x9, x10, lsl #4
    1350:	9100054a 	add	x10, x10, #0x1
    1354:	f8287aca 	str	x10, [x22, x8, lsl #3]
    1358:	b900013f 	str	wzr, [x9]
    135c:	f9000537 	str	x23, [x9, #8]
    1360:	17ffffe2 	b	12e8 <main+0x580>
    1364:	f8787aa8 	ldr	x8, [x21, x24, lsl #3]
    1368:	f94013ea 	ldr	x10, [sp, #32]
    136c:	f94023eb 	ldr	x11, [sp, #64]
    1370:	d37ced09 	lsl	x9, x8, #4
    1374:	f8696949 	ldr	x9, [x10, x9]
    1378:	f8687aca 	ldr	x10, [x22, x8, lsl #3]
    137c:	8b091169 	add	x9, x11, x9, lsl #4
    1380:	8b0a1129 	add	x9, x9, x10, lsl #4
    1384:	b9000139 	str	w25, [x9]
    1388:	f9000533 	str	x19, [x9, #8]
    138c:	91000549 	add	x9, x10, #0x1
    1390:	91000673 	add	x19, x19, #0x1
    1394:	f8287ac9 	str	x9, [x22, x8, lsl #3]
    1398:	17ffffd4 	b	12e8 <main+0x580>
    139c:	aa1603e0 	mov	x0, x22
    13a0:	97fffdf8 	bl	b80 <free@plt>
    13a4:	aa1503e0 	mov	x0, x21
    13a8:	97fffdf6 	bl	b80 <free@plt>
    13ac:	d00000fa 	adrp	x26, 1f000 <__abi_tag+0x1ae50>
    13b0:	f9406bf3 	ldr	x19, [sp, #208]
    13b4:	aa1f03e0 	mov	x0, xzr
    13b8:	f947e75a 	ldr	x26, [x26, #4040]
    13bc:	f9400358 	ldr	x24, [x26]
    13c0:	97fffdc8 	bl	ae0 <time@plt>
    13c4:	d0000016 	adrp	x22, 3000 <syntax_statement_list+0x818>
    13c8:	910eb6d6 	add	x22, x22, #0x3ad
    13cc:	d0000017 	adrp	x23, 3000 <syntax_statement_list+0x818>
    13d0:	910aeaf7 	add	x23, x23, #0x2ba
    13d4:	d0000015 	adrp	x21, 3000 <syntax_statement_list+0x818>
    13d8:	912076b5 	add	x21, x21, #0x81d
    13dc:	aa0003e5 	mov	x5, x0
    13e0:	aa1803e0 	mov	x0, x24
    13e4:	aa1603e1 	mov	x1, x22
    13e8:	aa1703e2 	mov	x2, x23
    13ec:	52802043 	mov	w3, #0x102                 	// #258
    13f0:	aa1503e4 	mov	x4, x21
    13f4:	97fffe07 	bl	c10 <fprintf@plt>
    13f8:	f9400340 	ldr	x0, [x26]
    13fc:	f94017e2 	ldr	x2, [sp, #40]
    1400:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1404:	9120bc21 	add	x1, x1, #0x82f
    1408:	97fffe02 	bl	c10 <fprintf@plt>
    140c:	f9400343 	ldr	x3, [x26]
    1410:	d0000018 	adrp	x24, 3000 <syntax_statement_list+0x818>
    1414:	910f2f18 	add	x24, x24, #0x3cb
    1418:	aa1803e0 	mov	x0, x24
    141c:	52800041 	mov	w1, #0x2                   	// #2
    1420:	52800022 	mov	w2, #0x1                   	// #1
    1424:	97fffddb 	bl	b90 <fwrite@plt>
    1428:	f9400359 	ldr	x25, [x26]
    142c:	aa1f03e0 	mov	x0, xzr
    1430:	97fffdac 	bl	ae0 <time@plt>
    1434:	aa0003e5 	mov	x5, x0
    1438:	aa1903e0 	mov	x0, x25
    143c:	aa1603e1 	mov	x1, x22
    1440:	aa1703e2 	mov	x2, x23
    1444:	52802063 	mov	w3, #0x103                 	// #259
    1448:	aa1503e4 	mov	x4, x21
    144c:	97fffdf1 	bl	c10 <fprintf@plt>
    1450:	f9400340 	ldr	x0, [x26]
    1454:	f94027e2 	ldr	x2, [sp, #72]
    1458:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    145c:	91215021 	add	x1, x1, #0x854
    1460:	97fffdec 	bl	c10 <fprintf@plt>
    1464:	f9400343 	ldr	x3, [x26]
    1468:	aa1803e0 	mov	x0, x24
    146c:	52800041 	mov	w1, #0x2                   	// #2
    1470:	52800022 	mov	w2, #0x1                   	// #1
    1474:	97fffdc7 	bl	b90 <fwrite@plt>
    1478:	f9400359 	ldr	x25, [x26]
    147c:	aa1f03e0 	mov	x0, xzr
    1480:	97fffd98 	bl	ae0 <time@plt>
    1484:	aa0003e5 	mov	x5, x0
    1488:	aa1903e0 	mov	x0, x25
    148c:	aa1603e1 	mov	x1, x22
    1490:	aa1703e2 	mov	x2, x23
    1494:	52802083 	mov	w3, #0x104                 	// #260
    1498:	aa1503e4 	mov	x4, x21
    149c:	97fffddd 	bl	c10 <fprintf@plt>
    14a0:	f9400340 	ldr	x0, [x26]
    14a4:	f9402fe2 	ldr	x2, [sp, #88]
    14a8:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    14ac:	91220421 	add	x1, x1, #0x881
    14b0:	97fffdd8 	bl	c10 <fprintf@plt>
    14b4:	f9400343 	ldr	x3, [x26]
    14b8:	aa1803e0 	mov	x0, x24
    14bc:	52800041 	mov	w1, #0x2                   	// #2
    14c0:	52800022 	mov	w2, #0x1                   	// #1
    14c4:	97fffdb3 	bl	b90 <fwrite@plt>
    14c8:	d0000000 	adrp	x0, 3000 <syntax_statement_list+0x818>
    14cc:	913d6400 	add	x0, x0, #0xf59
    14d0:	97fffda8 	bl	b70 <puts@plt>
    14d4:	f9402fe8 	ldr	x8, [sp, #88]
    14d8:	b4000268 	cbz	x8, 1524 <main+0x7bc>
    14dc:	aa1f03f7 	mov	x23, xzr
    14e0:	aa1f03f5 	mov	x21, xzr
    14e4:	d0000016 	adrp	x22, 3000 <syntax_statement_list+0x818>
    14e8:	91229ad6 	add	x22, x22, #0x8a6
    14ec:	f9402be8 	ldr	x8, [sp, #80]
    14f0:	aa1603e0 	mov	x0, x22
    14f4:	aa1503e1 	mov	x1, x21
    14f8:	8b170108 	add	x8, x8, x23
    14fc:	29402508 	ldp	w8, w9, [x8]
    1500:	93407d08 	sxtw	x8, w8
    1504:	4b080122 	sub	w2, w9, w8
    1508:	8b080263 	add	x3, x19, x8
    150c:	97fffdb5 	bl	be0 <printf@plt>
    1510:	f9402fe8 	ldr	x8, [sp, #88]
    1514:	910006b5 	add	x21, x21, #0x1
    1518:	910022f7 	add	x23, x23, #0x8
    151c:	eb0802bf 	cmp	x21, x8
    1520:	54fffe63 	b.cc	14ec <main+0x784>  // b.lo, b.ul, b.last
    1524:	f94017e8 	ldr	x8, [sp, #40]
    1528:	b4000648 	cbz	x8, 15f0 <main+0x888>
    152c:	aa1f03f5 	mov	x21, xzr
    1530:	d0000016 	adrp	x22, 3000 <syntax_statement_list+0x818>
    1534:	9122fed6 	add	x22, x22, #0x8bf
    1538:	d0000017 	adrp	x23, 3000 <syntax_statement_list+0x818>
    153c:	91232af7 	add	x23, x23, #0x8ca
    1540:	d0000018 	adrp	x24, 3000 <syntax_statement_list+0x818>
    1544:	91229b18 	add	x24, x24, #0x8a6
    1548:	14000005 	b	155c <main+0x7f4>
    154c:	f94017e8 	ldr	x8, [sp, #40]
    1550:	910006b5 	add	x21, x21, #0x1
    1554:	eb0802bf 	cmp	x21, x8
    1558:	540004c2 	b.cs	15f0 <main+0x888>  // b.hs, b.nlast
    155c:	aa1603e0 	mov	x0, x22
    1560:	aa1503e1 	mov	x1, x21
    1564:	97fffd9f 	bl	be0 <printf@plt>
    1568:	f94013e8 	ldr	x8, [sp, #32]
    156c:	8b151119 	add	x25, x8, x21, lsl #4
    1570:	f9400728 	ldr	x8, [x25, #8]
    1574:	b4fffec8 	cbz	x8, 154c <main+0x7e4>
    1578:	aa1f03fa 	mov	x26, xzr
    157c:	aa1f03fb 	mov	x27, xzr
    1580:	1400000a 	b	15a8 <main+0x840>
    1584:	8b1a0108 	add	x8, x8, x26
    1588:	aa1703e0 	mov	x0, x23
    158c:	f9400501 	ldr	x1, [x8, #8]
    1590:	97fffd94 	bl	be0 <printf@plt>
    1594:	f9400728 	ldr	x8, [x25, #8]
    1598:	9100077b 	add	x27, x27, #0x1
    159c:	9100435a 	add	x26, x26, #0x10
    15a0:	eb08037f 	cmp	x27, x8
    15a4:	54fffd42 	b.cs	154c <main+0x7e4>  // b.hs, b.nlast
    15a8:	f9400328 	ldr	x8, [x25]
    15ac:	f94023e9 	ldr	x9, [sp, #64]
    15b0:	8b081128 	add	x8, x9, x8, lsl #4
    15b4:	b87a6909 	ldr	w9, [x8, x26]
    15b8:	34fffe69 	cbz	w9, 1584 <main+0x81c>
    15bc:	7100053f 	cmp	w9, #0x1
    15c0:	540037c1 	b.ne	1cb8 <main+0xf50>  // b.any
    15c4:	8b1a0108 	add	x8, x8, x26
    15c8:	f9402be9 	ldr	x9, [sp, #80]
    15cc:	aa1803e0 	mov	x0, x24
    15d0:	f9400501 	ldr	x1, [x8, #8]
    15d4:	8b010d28 	add	x8, x9, x1, lsl #3
    15d8:	29402508 	ldp	w8, w9, [x8]
    15dc:	93407d08 	sxtw	x8, w8
    15e0:	4b080122 	sub	w2, w9, w8
    15e4:	8b080263 	add	x3, x19, x8
    15e8:	97fffd7e 	bl	be0 <printf@plt>
    15ec:	17ffffea 	b	1594 <main+0x82c>
    15f0:	9105e3e0 	add	x0, sp, #0x178
    15f4:	2a1f03e1 	mov	w1, wzr
    15f8:	52807002 	mov	w2, #0x380                 	// #896
    15fc:	9105e3f3 	add	x19, sp, #0x178
    1600:	97fffd44 	bl	b10 <memset@plt>
    1604:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1608:	91237421 	add	x1, x1, #0x8dd
    160c:	9105e3e0 	add	x0, sp, #0x178
    1610:	52800022 	mov	w2, #0x1                   	// #1
    1614:	97fffd6f 	bl	bd0 <regcomp@plt>
    1618:	35005c40 	cbnz	w0, 21a0 <main+0x1438>
    161c:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1620:	9124a821 	add	x1, x1, #0x92a
    1624:	91010260 	add	x0, x19, #0x40
    1628:	52800022 	mov	w2, #0x1                   	// #1
    162c:	97fffd69 	bl	bd0 <regcomp@plt>
    1630:	35005ce0 	cbnz	w0, 21cc <main+0x1464>
    1634:	9105e3f3 	add	x19, sp, #0x178
    1638:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    163c:	9125cc21 	add	x1, x1, #0x973
    1640:	91020260 	add	x0, x19, #0x80
    1644:	52800022 	mov	w2, #0x1                   	// #1
    1648:	97fffd62 	bl	bd0 <regcomp@plt>
    164c:	35005d60 	cbnz	w0, 21f8 <main+0x1490>
    1650:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1654:	9126cc21 	add	x1, x1, #0x9b3
    1658:	91030260 	add	x0, x19, #0xc0
    165c:	52800022 	mov	w2, #0x1                   	// #1
    1660:	97fffd5c 	bl	bd0 <regcomp@plt>
    1664:	35005e00 	cbnz	w0, 2224 <main+0x14bc>
    1668:	9105e3f3 	add	x19, sp, #0x178
    166c:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1670:	9127d821 	add	x1, x1, #0x9f6
    1674:	91040260 	add	x0, x19, #0x100
    1678:	52800022 	mov	w2, #0x1                   	// #1
    167c:	97fffd55 	bl	bd0 <regcomp@plt>
    1680:	35005e80 	cbnz	w0, 2250 <main+0x14e8>
    1684:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1688:	91290821 	add	x1, x1, #0xa42
    168c:	91050260 	add	x0, x19, #0x140
    1690:	52800022 	mov	w2, #0x1                   	// #1
    1694:	97fffd4f 	bl	bd0 <regcomp@plt>
    1698:	35005f20 	cbnz	w0, 227c <main+0x1514>
    169c:	9105e3f3 	add	x19, sp, #0x178
    16a0:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    16a4:	912a0021 	add	x1, x1, #0xa80
    16a8:	91060260 	add	x0, x19, #0x180
    16ac:	52800022 	mov	w2, #0x1                   	// #1
    16b0:	97fffd48 	bl	bd0 <regcomp@plt>
    16b4:	35005fa0 	cbnz	w0, 22a8 <main+0x1540>
    16b8:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    16bc:	912b1021 	add	x1, x1, #0xac4
    16c0:	91070260 	add	x0, x19, #0x1c0
    16c4:	52800022 	mov	w2, #0x1                   	// #1
    16c8:	97fffd42 	bl	bd0 <regcomp@plt>
    16cc:	35006040 	cbnz	w0, 22d4 <main+0x156c>
    16d0:	9105e3f9 	add	x25, sp, #0x178
    16d4:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    16d8:	912c2c21 	add	x1, x1, #0xb0b
    16dc:	91080320 	add	x0, x25, #0x200
    16e0:	52800022 	mov	w2, #0x1                   	// #1
    16e4:	97fffd3b 	bl	bd0 <regcomp@plt>
    16e8:	350060c0 	cbnz	w0, 2300 <main+0x1598>
    16ec:	91090335 	add	x21, x25, #0x240
    16f0:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    16f4:	912d3021 	add	x1, x1, #0xb4c
    16f8:	aa1503e0 	mov	x0, x21
    16fc:	52800022 	mov	w2, #0x1                   	// #1
    1700:	97fffd34 	bl	bd0 <regcomp@plt>
    1704:	35006140 	cbnz	w0, 232c <main+0x15c4>
    1708:	9105e3f3 	add	x19, sp, #0x178
    170c:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1710:	912fd821 	add	x1, x1, #0xbf6
    1714:	910a0260 	add	x0, x19, #0x280
    1718:	52800022 	mov	w2, #0x1                   	// #1
    171c:	97fffd2d 	bl	bd0 <regcomp@plt>
    1720:	350061c0 	cbnz	w0, 2358 <main+0x15f0>
    1724:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1728:	9130f821 	add	x1, x1, #0xc3e
    172c:	910b0260 	add	x0, x19, #0x2c0
    1730:	52800022 	mov	w2, #0x1                   	// #1
    1734:	97fffd27 	bl	bd0 <regcomp@plt>
    1738:	35006260 	cbnz	w0, 2384 <main+0x161c>
    173c:	9105e3f3 	add	x19, sp, #0x178
    1740:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1744:	91321c21 	add	x1, x1, #0xc87
    1748:	910c0260 	add	x0, x19, #0x300
    174c:	52800022 	mov	w2, #0x1                   	// #1
    1750:	97fffd20 	bl	bd0 <regcomp@plt>
    1754:	350062e0 	cbnz	w0, 23b0 <main+0x1648>
    1758:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    175c:	91339021 	add	x1, x1, #0xce4
    1760:	910d0260 	add	x0, x19, #0x340
    1764:	52800022 	mov	w2, #0x1                   	// #1
    1768:	52800033 	mov	w19, #0x1                   	// #1
    176c:	97fffd19 	bl	bd0 <regcomp@plt>
    1770:	35006360 	cbnz	w0, 23dc <main+0x1674>
    1774:	f94013e9 	ldr	x9, [sp, #32]
    1778:	f9401be8 	ldr	x8, [sp, #48]
    177c:	f9000be9 	str	x9, [sp, #16]
    1780:	f9400529 	ldr	x9, [x9, #8]
    1784:	b9000113 	str	w19, [x8]
    1788:	b4001449 	cbz	x9, 1a10 <main+0xca8>
    178c:	aa1f03ed 	mov	x13, xzr
    1790:	d0000016 	adrp	x22, 3000 <syntax_statement_list+0x818>
    1794:	911516d6 	add	x22, x22, #0x545
    1798:	1400000f 	b	17d4 <main+0xa6c>
    179c:	9100c2e0 	add	x0, x23, #0x30
    17a0:	910083e1 	add	x1, sp, #0x20
    17a4:	9105e3e2 	add	x2, sp, #0x178
    17a8:	aa1403e3 	mov	x3, x20
    17ac:	9400040f 	bl	27e8 <syntax_statement_list>
    17b0:	a94137e8 	ldp	x8, x13, [sp, #16]
    17b4:	f9401eea 	ldr	x10, [x23, #56]
    17b8:	f9400509 	ldr	x9, [x8, #8]
    17bc:	f9401be8 	ldr	x8, [sp, #48]
    17c0:	910005ad 	add	x13, x13, #0x1
    17c4:	eb0901bf 	cmp	x13, x9
    17c8:	528000e9 	mov	w9, #0x7                   	// #7
    17cc:	b82a7909 	str	w9, [x8, x10, lsl #2]
    17d0:	54001202 	b.cs	1a10 <main+0xca8>  // b.hs, b.nlast
    17d4:	f94023e9 	ldr	x9, [sp, #64]
    17d8:	8b0d112a 	add	x10, x9, x13, lsl #4
    17dc:	b940014b 	ldr	w11, [x10]
    17e0:	3500356b 	cbnz	w11, 1e8c <main+0x1124>
    17e4:	f940054b 	ldr	x11, [x10, #8]
    17e8:	f94013ea 	ldr	x10, [sp, #32]
    17ec:	8b0b114a 	add	x10, x10, x11, lsl #4
    17f0:	f940054c 	ldr	x12, [x10, #8]
    17f4:	f100119f 	cmp	x12, #0x4
    17f8:	5280004c 	mov	w12, #0x2                   	// #2
    17fc:	b82b790c 	str	w12, [x8, x11, lsl #2]
    1800:	540032c1 	b.ne	1e58 <main+0x10f0>  // b.any
    1804:	f9400148 	ldr	x8, [x10]
    1808:	f9402be1 	ldr	x1, [sp, #80]
    180c:	9105c3e3 	add	x3, sp, #0x170
    1810:	aa1403e0 	mov	x0, x20
    1814:	52804d44 	mov	w4, #0x26a                 	// #618
    1818:	aa1603e5 	mov	x5, x22
    181c:	8b081137 	add	x23, x9, x8, lsl #4
    1820:	9105e3e8 	add	x8, sp, #0x178
    1824:	f9000fed 	str	x13, [sp, #24]
    1828:	f900bbe8 	str	x8, [sp, #368]
    182c:	aa1703e2 	mov	x2, x23
    1830:	9400039d 	bl	26a4 <assert_atom_regex>
    1834:	f94006e8 	ldr	x8, [x23, #8]
    1838:	f94033e9 	ldr	x9, [sp, #96]
    183c:	910042e2 	add	x2, x23, #0x10
    1840:	f9402be1 	ldr	x1, [sp, #80]
    1844:	9105a3e3 	add	x3, sp, #0x168
    1848:	aa1403e0 	mov	x0, x20
    184c:	52804de4 	mov	w4, #0x26f                 	// #623
    1850:	aa1603e5 	mov	x5, x22
    1854:	5280018a 	mov	w10, #0xc                   	// #12
    1858:	b828792a 	str	w10, [x9, x8, lsl #2]
    185c:	f900b7f5 	str	x21, [sp, #360]
    1860:	94000391 	bl	26a4 <assert_atom_regex>
    1864:	f94033e8 	ldr	x8, [sp, #96]
    1868:	f9400ee9 	ldr	x9, [x23, #24]
    186c:	5280016a 	mov	w10, #0xb                   	// #11
    1870:	b829790a 	str	w10, [x8, x9, lsl #2]
    1874:	b94022e8 	ldr	w8, [x23, #32]
    1878:	35002d68 	cbnz	w8, 1e24 <main+0x10bc>
    187c:	f94016e8 	ldr	x8, [x23, #40]
    1880:	f94013e9 	ldr	x9, [sp, #32]
    1884:	5280006b 	mov	w11, #0x3                   	// #3
    1888:	8b08113c 	add	x28, x9, x8, lsl #4
    188c:	f9401be9 	ldr	x9, [sp, #48]
    1890:	f940078a 	ldr	x10, [x28, #8]
    1894:	b828792b 	str	w11, [x9, x8, lsl #2]
    1898:	b4fff82a 	cbz	x10, 179c <main+0xa34>
    189c:	aa1f03f3 	mov	x19, xzr
    18a0:	aa1f03fb 	mov	x27, xzr
    18a4:	1400000a 	b	18cc <main+0xb64>
    18a8:	52800088 	mov	w8, #0x4                   	// #4
    18ac:	f9400789 	ldr	x9, [x28, #8]
    18b0:	f94033ea 	ldr	x10, [sp, #96]
    18b4:	9100077b 	add	x27, x27, #0x1
    18b8:	f9400f0b 	ldr	x11, [x24, #24]
    18bc:	91004273 	add	x19, x19, #0x10
    18c0:	eb09037f 	cmp	x27, x9
    18c4:	b82b7948 	str	w8, [x10, x11, lsl #2]
    18c8:	54fff6a2 	b.cs	179c <main+0xa34>  // b.hs, b.nlast
    18cc:	f94023e8 	ldr	x8, [sp, #64]
    18d0:	f9400389 	ldr	x9, [x28]
    18d4:	8b091109 	add	x9, x8, x9, lsl #4
    18d8:	b873692a 	ldr	w10, [x9, x19]
    18dc:	35001baa 	cbnz	w10, 1c50 <main+0xee8>
    18e0:	8b130129 	add	x9, x9, x19
    18e4:	f94013ea 	ldr	x10, [sp, #32]
    18e8:	f9400529 	ldr	x9, [x9, #8]
    18ec:	8b09114a 	add	x10, x10, x9, lsl #4
    18f0:	f940054b 	ldr	x11, [x10, #8]
    18f4:	f100097f 	cmp	x11, #0x2
    18f8:	54001c61 	b.ne	1c84 <main+0xf1c>  // b.any
    18fc:	f940014a 	ldr	x10, [x10]
    1900:	f9401beb 	ldr	x11, [sp, #48]
    1904:	910583e3 	add	x3, sp, #0x160
    1908:	f9402be1 	ldr	x1, [sp, #80]
    190c:	aa1403e0 	mov	x0, x20
    1910:	52805004 	mov	w4, #0x280                 	// #640
    1914:	8b0a1118 	add	x24, x8, x10, lsl #4
    1918:	aa1603e5 	mov	x5, x22
    191c:	5280008c 	mov	w12, #0x4                   	// #4
    1920:	b829796c 	str	w12, [x11, x9, lsl #2]
    1924:	aa1803e2 	mov	x2, x24
    1928:	f900b3f5 	str	x21, [sp, #352]
    192c:	9400035e 	bl	26a4 <assert_atom_regex>
    1930:	f94033e8 	ldr	x8, [sp, #96]
    1934:	f9400709 	ldr	x9, [x24, #8]
    1938:	5280002a 	mov	w10, #0x1                   	// #1
    193c:	b829790a 	str	w10, [x8, x9, lsl #2]
    1940:	b9401308 	ldr	w8, [x24, #16]
    1944:	7100051f 	cmp	w8, #0x1
    1948:	540016a1 	b.ne	1c1c <main+0xeb4>  // b.any
    194c:	f9402be8 	ldr	x8, [sp, #80]
    1950:	f9400f09 	ldr	x9, [x24, #24]
    1954:	91080320 	add	x0, x25, #0x200
    1958:	f900afff 	str	xzr, [sp, #344]
    195c:	910563e3 	add	x3, sp, #0x158
    1960:	52800022 	mov	w2, #0x1                   	// #1
    1964:	8b090d1a 	add	x26, x8, x9, lsl #3
    1968:	2a1f03e4 	mov	w4, wzr
    196c:	b9800348 	ldrsw	x8, [x26]
    1970:	8b080281 	add	x1, x20, x8
    1974:	97fffc8f 	bl	bb0 <regexec@plt>
    1978:	7100041f 	cmp	w0, #0x1
    197c:	54fff961 	b.ne	18a8 <main+0xb40>  // b.any
    1980:	b9800348 	ldrsw	x8, [x26]
    1984:	9105e3e9 	add	x9, sp, #0x178
    1988:	910563e3 	add	x3, sp, #0x158
    198c:	91050120 	add	x0, x9, #0x140
    1990:	52800022 	mov	w2, #0x1                   	// #1
    1994:	2a1f03e4 	mov	w4, wzr
    1998:	8b080281 	add	x1, x20, x8
    199c:	97fffc85 	bl	bb0 <regexec@plt>
    19a0:	7100041f 	cmp	w0, #0x1
    19a4:	540002c1 	b.ne	19fc <main+0xc94>  // b.any
    19a8:	b9800348 	ldrsw	x8, [x26]
    19ac:	9105e3f9 	add	x25, sp, #0x178
    19b0:	910563e3 	add	x3, sp, #0x158
    19b4:	91060320 	add	x0, x25, #0x180
    19b8:	52800022 	mov	w2, #0x1                   	// #1
    19bc:	2a1f03e4 	mov	w4, wzr
    19c0:	8b080281 	add	x1, x20, x8
    19c4:	97fffc7b 	bl	bb0 <regexec@plt>
    19c8:	7100041f 	cmp	w0, #0x1
    19cc:	540001c1 	b.ne	1a04 <main+0xc9c>  // b.any
    19d0:	b9800348 	ldrsw	x8, [x26]
    19d4:	91070320 	add	x0, x25, #0x1c0
    19d8:	910563e3 	add	x3, sp, #0x158
    19dc:	52800022 	mov	w2, #0x1                   	// #1
    19e0:	2a1f03e4 	mov	w4, wzr
    19e4:	8b080281 	add	x1, x20, x8
    19e8:	97fffc72 	bl	bb0 <regexec@plt>
    19ec:	7100041f 	cmp	w0, #0x1
    19f0:	54001c00 	b.eq	1d70 <main+0x1008>  // b.none
    19f4:	528000a8 	mov	w8, #0x5                   	// #5
    19f8:	14000004 	b	1a08 <main+0xca0>
    19fc:	52800048 	mov	w8, #0x2                   	// #2
    1a00:	17ffffab 	b	18ac <main+0xb44>
    1a04:	52800068 	mov	w8, #0x3                   	// #3
    1a08:	9105e3f9 	add	x25, sp, #0x178
    1a0c:	17ffffa8 	b	18ac <main+0xb44>
    1a10:	9105e3e0 	add	x0, sp, #0x178
    1a14:	97fffc6b 	bl	bc0 <regfree@plt>
    1a18:	9105e3e8 	add	x8, sp, #0x178
    1a1c:	91010100 	add	x0, x8, #0x40
    1a20:	97fffc68 	bl	bc0 <regfree@plt>
    1a24:	9105e3f3 	add	x19, sp, #0x178
    1a28:	91020260 	add	x0, x19, #0x80
    1a2c:	97fffc65 	bl	bc0 <regfree@plt>
    1a30:	91030260 	add	x0, x19, #0xc0
    1a34:	97fffc63 	bl	bc0 <regfree@plt>
    1a38:	9105e3f3 	add	x19, sp, #0x178
    1a3c:	91040260 	add	x0, x19, #0x100
    1a40:	97fffc60 	bl	bc0 <regfree@plt>
    1a44:	91050260 	add	x0, x19, #0x140
    1a48:	97fffc5e 	bl	bc0 <regfree@plt>
    1a4c:	9105e3f3 	add	x19, sp, #0x178
    1a50:	91060260 	add	x0, x19, #0x180
    1a54:	97fffc5b 	bl	bc0 <regfree@plt>
    1a58:	91070260 	add	x0, x19, #0x1c0
    1a5c:	97fffc59 	bl	bc0 <regfree@plt>
    1a60:	91080320 	add	x0, x25, #0x200
    1a64:	97fffc57 	bl	bc0 <regfree@plt>
    1a68:	aa1503e0 	mov	x0, x21
    1a6c:	97fffc55 	bl	bc0 <regfree@plt>
    1a70:	9105e3f3 	add	x19, sp, #0x178
    1a74:	910a0260 	add	x0, x19, #0x280
    1a78:	97fffc52 	bl	bc0 <regfree@plt>
    1a7c:	910b0260 	add	x0, x19, #0x2c0
    1a80:	97fffc50 	bl	bc0 <regfree@plt>
    1a84:	9105e3f3 	add	x19, sp, #0x178
    1a88:	910c0260 	add	x0, x19, #0x300
    1a8c:	97fffc4d 	bl	bc0 <regfree@plt>
    1a90:	910d0260 	add	x0, x19, #0x340
    1a94:	97fffc4b 	bl	bc0 <regfree@plt>
    1a98:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1a9c:	f9401fe8 	ldr	x8, [sp, #56]
    1aa0:	f947e673 	ldr	x19, [x19, #4040]
    1aa4:	b40000e8 	cbz	x8, 1ac0 <main+0xd58>
    1aa8:	f9401be9 	ldr	x9, [sp, #48]
    1aac:	aa0803ea 	mov	x10, x8
    1ab0:	b840452b 	ldr	w11, [x9], #4
    1ab4:	340018cb 	cbz	w11, 1dcc <main+0x1064>
    1ab8:	f100054a 	subs	x10, x10, #0x1
    1abc:	54ffffa1 	b.ne	1ab0 <main+0xd48>  // b.any
    1ac0:	f94037e9 	ldr	x9, [sp, #104]
    1ac4:	b40000c9 	cbz	x9, 1adc <main+0xd74>
    1ac8:	f94033ea 	ldr	x10, [sp, #96]
    1acc:	b840454b 	ldr	w11, [x10], #4
    1ad0:	3400194b 	cbz	w11, 1df8 <main+0x1090>
    1ad4:	f1000529 	subs	x9, x9, #0x1
    1ad8:	54ffffa1 	b.ne	1acc <main+0xd64>  // b.any
    1adc:	b4000868 	cbz	x8, 1be8 <main+0xe80>
    1ae0:	f94023ea 	ldr	x10, [sp, #64]
    1ae4:	f9401beb 	ldr	x11, [sp, #48]
    1ae8:	aa1f03e9 	mov	x9, xzr
    1aec:	f94013ec 	ldr	x12, [sp, #32]
    1af0:	9100214d 	add	x13, x10, #0x8
    1af4:	14000004 	b	1b04 <main+0xd9c>
    1af8:	91000529 	add	x9, x9, #0x1
    1afc:	eb08013f 	cmp	x9, x8
    1b00:	54000740 	b.eq	1be8 <main+0xe80>  // b.none
    1b04:	b869796e 	ldr	w14, [x11, x9, lsl #2]
    1b08:	71001ddf 	cmp	w14, #0x7
    1b0c:	54000260 	b.eq	1b58 <main+0xdf0>  // b.none
    1b10:	710021df 	cmp	w14, #0x8
    1b14:	54ffff21 	b.ne	1af8 <main+0xd90>  // b.any
    1b18:	8b09118f 	add	x15, x12, x9, lsl #4
    1b1c:	f94005ee 	ldr	x14, [x15, #8]
    1b20:	b4fffece 	cbz	x14, 1af8 <main+0xd90>
    1b24:	f94001ef 	ldr	x15, [x15]
    1b28:	8b0f11af 	add	x15, x13, x15, lsl #4
    1b2c:	14000004 	b	1b3c <main+0xdd4>
    1b30:	f10005ce 	subs	x14, x14, #0x1
    1b34:	910041ef 	add	x15, x15, #0x10
    1b38:	54fffe00 	b.eq	1af8 <main+0xd90>  // b.none
    1b3c:	b85f81f0 	ldur	w16, [x15, #-8]
    1b40:	35ffff90 	cbnz	w16, 1b30 <main+0xdc8>
    1b44:	f94001f0 	ldr	x16, [x15]
    1b48:	b8707970 	ldr	w16, [x11, x16, lsl #2]
    1b4c:	7100321f 	cmp	w16, #0xc
    1b50:	54ffff01 	b.ne	1b30 <main+0xdc8>  // b.any
    1b54:	1400007c 	b	1d44 <main+0xfdc>
    1b58:	8b09118e 	add	x14, x12, x9, lsl #4
    1b5c:	f94005ce 	ldr	x14, [x14, #8]
    1b60:	b4002c4e 	cbz	x14, 20e8 <main+0x1380>
    1b64:	d37ced2f 	lsl	x15, x9, #4
    1b68:	f10005d0 	subs	x16, x14, #0x1
    1b6c:	f86f698f 	ldr	x15, [x12, x15]
    1b70:	54000160 	b.eq	1b9c <main+0xe34>  // b.none
    1b74:	8b0f11b1 	add	x17, x13, x15, lsl #4
    1b78:	b85f8232 	ldur	w18, [x17, #-8]
    1b7c:	35000cf2 	cbnz	w18, 1d18 <main+0xfb0>
    1b80:	f9400232 	ldr	x18, [x17]
    1b84:	b8727972 	ldr	w18, [x11, x18, lsl #2]
    1b88:	7100325f 	cmp	w18, #0xc
    1b8c:	54000b00 	b.eq	1cec <main+0xf84>  // b.none
    1b90:	f1000610 	subs	x16, x16, #0x1
    1b94:	91004231 	add	x17, x17, #0x10
    1b98:	54ffff01 	b.ne	1b78 <main+0xe10>  // b.any
    1b9c:	8b0f114f 	add	x15, x10, x15, lsl #4
    1ba0:	8b0e11ee 	add	x14, x15, x14, lsl #4
    1ba4:	b85f01cf 	ldur	w15, [x14, #-16]
    1ba8:	35002b6f 	cbnz	w15, 2114 <main+0x13ac>
    1bac:	f85f81ce 	ldur	x14, [x14, #-8]
    1bb0:	b86e796e 	ldr	w14, [x11, x14, lsl #2]
    1bb4:	710031df 	cmp	w14, #0xc
    1bb8:	54fffa00 	b.eq	1af8 <main+0xd90>  // b.none
    1bbc:	f9400260 	ldr	x0, [x19]
    1bc0:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1bc4:	910a6021 	add	x1, x1, #0x298
    1bc8:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1bcc:	910ae842 	add	x2, x2, #0x2ba
    1bd0:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1bd4:	91151484 	add	x4, x4, #0x545
    1bd8:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1bdc:	911f04a5 	add	x5, x5, #0x7c1
    1be0:	52805583 	mov	w3, #0x2ac                 	// #684
    1be4:	1400020a 	b	240c <main+0x16a4>
    1be8:	910203e0 	add	x0, sp, #0x80
    1bec:	97fffbf5 	bl	bc0 <regfree@plt>
    1bf0:	f94007e0 	ldr	x0, [sp, #8]
    1bf4:	97fffbe3 	bl	b80 <free@plt>
    1bf8:	2a1f03e0 	mov	w0, wzr
    1bfc:	911403ff 	add	sp, sp, #0x500
    1c00:	a9454ff4 	ldp	x20, x19, [sp, #80]
    1c04:	a94457f6 	ldp	x22, x21, [sp, #64]
    1c08:	a9435ff8 	ldp	x24, x23, [sp, #48]
    1c0c:	a94267fa 	ldp	x26, x25, [sp, #32]
    1c10:	a9416ffc 	ldp	x28, x27, [sp, #16]
    1c14:	a8c67bfd 	ldp	x29, x30, [sp], #96
    1c18:	d65f03c0 	ret
    1c1c:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1c20:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1c24:	910a6021 	add	x1, x1, #0x298
    1c28:	f947e673 	ldr	x19, [x19, #4040]
    1c2c:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1c30:	910ae842 	add	x2, x2, #0x2ba
    1c34:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1c38:	91151484 	add	x4, x4, #0x545
    1c3c:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1c40:	9119d8a5 	add	x5, x5, #0x676
    1c44:	f9400260 	ldr	x0, [x19]
    1c48:	52805083 	mov	w3, #0x284                 	// #644
    1c4c:	140001f0 	b	240c <main+0x16a4>
    1c50:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1c54:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1c58:	910a6021 	add	x1, x1, #0x298
    1c5c:	f947e673 	ldr	x19, [x19, #4040]
    1c60:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1c64:	910ae842 	add	x2, x2, #0x2ba
    1c68:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1c6c:	91151484 	add	x4, x4, #0x545
    1c70:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1c74:	911884a5 	add	x5, x5, #0x621
    1c78:	f9400260 	ldr	x0, [x19]
    1c7c:	52804f43 	mov	w3, #0x27a                 	// #634
    1c80:	140001e3 	b	240c <main+0x16a4>
    1c84:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1c88:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1c8c:	910a6021 	add	x1, x1, #0x298
    1c90:	f947e673 	ldr	x19, [x19, #4040]
    1c94:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1c98:	910ae842 	add	x2, x2, #0x2ba
    1c9c:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1ca0:	91151484 	add	x4, x4, #0x545
    1ca4:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1ca8:	911974a5 	add	x5, x5, #0x65d
    1cac:	f9400260 	ldr	x0, [x19]
    1cb0:	52804f83 	mov	w3, #0x27c                 	// #636
    1cb4:	140001d6 	b	240c <main+0x16a4>
    1cb8:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1cbc:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1cc0:	910a6021 	add	x1, x1, #0x298
    1cc4:	f947e673 	ldr	x19, [x19, #4040]
    1cc8:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1ccc:	910ae842 	add	x2, x2, #0x2ba
    1cd0:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1cd4:	91207484 	add	x4, x4, #0x81d
    1cd8:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1cdc:	911594a5 	add	x5, x5, #0x565
    1ce0:	f9400260 	ldr	x0, [x19]
    1ce4:	52802363 	mov	w3, #0x11b                 	// #283
    1ce8:	140001c9 	b	240c <main+0x16a4>
    1cec:	f9400260 	ldr	x0, [x19]
    1cf0:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1cf4:	910a6021 	add	x1, x1, #0x298
    1cf8:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1cfc:	910ae842 	add	x2, x2, #0x2ba
    1d00:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1d04:	91151484 	add	x4, x4, #0x545
    1d08:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1d0c:	911d94a5 	add	x5, x5, #0x765
    1d10:	52805503 	mov	w3, #0x2a8                 	// #680
    1d14:	140001be 	b	240c <main+0x16a4>
    1d18:	f9400260 	ldr	x0, [x19]
    1d1c:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1d20:	910a6021 	add	x1, x1, #0x298
    1d24:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1d28:	910ae842 	add	x2, x2, #0x2ba
    1d2c:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1d30:	91151484 	add	x4, x4, #0x545
    1d34:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1d38:	911690a5 	add	x5, x5, #0x5a4
    1d3c:	528054e3 	mov	w3, #0x2a7                 	// #679
    1d40:	140001b3 	b	240c <main+0x16a4>
    1d44:	f9400260 	ldr	x0, [x19]
    1d48:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1d4c:	910a6021 	add	x1, x1, #0x298
    1d50:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1d54:	910ae842 	add	x2, x2, #0x2ba
    1d58:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1d5c:	91151484 	add	x4, x4, #0x545
    1d60:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1d64:	911d94a5 	add	x5, x5, #0x765
    1d68:	52805663 	mov	w3, #0x2b3                 	// #691
    1d6c:	140001a8 	b	240c <main+0x16a4>
    1d70:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1d74:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1d78:	910a6021 	add	x1, x1, #0x298
    1d7c:	f947e673 	ldr	x19, [x19, #4040]
    1d80:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1d84:	910ae842 	add	x2, x2, #0x2ba
    1d88:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1d8c:	91151484 	add	x4, x4, #0x545
    1d90:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1d94:	911594a5 	add	x5, x5, #0x565
    1d98:	f9400260 	ldr	x0, [x19]
    1d9c:	52805223 	mov	w3, #0x291                 	// #657
    1da0:	1400019b 	b	240c <main+0x16a4>
    1da4:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1da8:	910a6021 	add	x1, x1, #0x298
    1dac:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1db0:	910ae842 	add	x2, x2, #0x2ba
    1db4:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1db8:	9114d884 	add	x4, x4, #0x536
    1dbc:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1dc0:	911594a5 	add	x5, x5, #0x565
    1dc4:	528009c3 	mov	w3, #0x4e                  	// #78
    1dc8:	140000b8 	b	20a8 <main+0x1340>
    1dcc:	f9400260 	ldr	x0, [x19]
    1dd0:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1dd4:	910a6021 	add	x1, x1, #0x298
    1dd8:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1ddc:	910ae842 	add	x2, x2, #0x2ba
    1de0:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1de4:	91151484 	add	x4, x4, #0x545
    1de8:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1dec:	911ac8a5 	add	x5, x5, #0x6b2
    1df0:	52805383 	mov	w3, #0x29c                 	// #668
    1df4:	14000186 	b	240c <main+0x16a4>
    1df8:	f9400260 	ldr	x0, [x19]
    1dfc:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1e00:	910a6021 	add	x1, x1, #0x298
    1e04:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1e08:	910ae842 	add	x2, x2, #0x2ba
    1e0c:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1e10:	91151484 	add	x4, x4, #0x545
    1e14:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1e18:	911be0a5 	add	x5, x5, #0x6f8
    1e1c:	528053e3 	mov	w3, #0x29f                 	// #671
    1e20:	1400017b 	b	240c <main+0x16a4>
    1e24:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1e28:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1e2c:	910a6021 	add	x1, x1, #0x298
    1e30:	f947e673 	ldr	x19, [x19, #4040]
    1e34:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1e38:	910ae842 	add	x2, x2, #0x2ba
    1e3c:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1e40:	91151484 	add	x4, x4, #0x545
    1e44:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1e48:	9117aca5 	add	x5, x5, #0x5eb
    1e4c:	f9400260 	ldr	x0, [x19]
    1e50:	52804e83 	mov	w3, #0x274                 	// #628
    1e54:	1400016e 	b	240c <main+0x16a4>
    1e58:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1e5c:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1e60:	910a6021 	add	x1, x1, #0x298
    1e64:	f947e673 	ldr	x19, [x19, #4040]
    1e68:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1e6c:	910ae842 	add	x2, x2, #0x2ba
    1e70:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1e74:	91151484 	add	x4, x4, #0x545
    1e78:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1e7c:	91174ca5 	add	x5, x5, #0x5d3
    1e80:	f9400260 	ldr	x0, [x19]
    1e84:	52804ce3 	mov	w3, #0x267                 	// #615
    1e88:	14000161 	b	240c <main+0x16a4>
    1e8c:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1e90:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1e94:	910a6021 	add	x1, x1, #0x298
    1e98:	f947e673 	ldr	x19, [x19, #4040]
    1e9c:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1ea0:	910ae842 	add	x2, x2, #0x2ba
    1ea4:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1ea8:	91151484 	add	x4, x4, #0x545
    1eac:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1eb0:	91165ca5 	add	x5, x5, #0x597
    1eb4:	f9400260 	ldr	x0, [x19]
    1eb8:	52804c83 	mov	w3, #0x264                 	// #612
    1ebc:	14000154 	b	240c <main+0x16a4>
    1ec0:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1ec4:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1ec8:	910a6021 	add	x1, x1, #0x298
    1ecc:	f947e673 	ldr	x19, [x19, #4040]
    1ed0:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1ed4:	910ae842 	add	x2, x2, #0x2ba
    1ed8:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1edc:	910bf484 	add	x4, x4, #0x2fd
    1ee0:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1ee4:	910c08a5 	add	x5, x5, #0x302
    1ee8:	f9400260 	ldr	x0, [x19]
    1eec:	528058a3 	mov	w3, #0x2c5                 	// #709
    1ef0:	14000147 	b	240c <main+0x16a4>
    1ef4:	d00000f5 	adrp	x21, 1f000 <__abi_tag+0x1ae50>
    1ef8:	f947e6b5 	ldr	x21, [x21, #4040]
    1efc:	f94002b3 	ldr	x19, [x21]
    1f00:	97fffb3c 	bl	bf0 <__errno_location@plt>
    1f04:	b9400014 	ldr	w20, [x0]
    1f08:	2a1403e0 	mov	w0, w20
    1f0c:	97fffb09 	bl	b30 <strerror@plt>
    1f10:	aa0003e6 	mov	x6, x0
    1f14:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1f18:	910c3021 	add	x1, x1, #0x30c
    1f1c:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1f20:	910ae842 	add	x2, x2, #0x2ba
    1f24:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1f28:	910bf484 	add	x4, x4, #0x2fd
    1f2c:	d0000007 	adrp	x7, 3000 <syntax_statement_list+0x818>
    1f30:	910d1ce7 	add	x7, x7, #0x347
    1f34:	aa1303e0 	mov	x0, x19
    1f38:	528058e3 	mov	w3, #0x2c7                 	// #711
    1f3c:	14000040 	b	203c <main+0x12d4>
    1f40:	d00000f5 	adrp	x21, 1f000 <__abi_tag+0x1ae50>
    1f44:	f947e6b5 	ldr	x21, [x21, #4040]
    1f48:	f94002b3 	ldr	x19, [x21]
    1f4c:	97fffb29 	bl	bf0 <__errno_location@plt>
    1f50:	b9400014 	ldr	w20, [x0]
    1f54:	2a1403e0 	mov	w0, w20
    1f58:	97fffaf6 	bl	b30 <strerror@plt>
    1f5c:	aa0003e6 	mov	x6, x0
    1f60:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1f64:	910c3021 	add	x1, x1, #0x30c
    1f68:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1f6c:	910ae842 	add	x2, x2, #0x2ba
    1f70:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1f74:	910bf484 	add	x4, x4, #0x2fd
    1f78:	d0000007 	adrp	x7, 3000 <syntax_statement_list+0x818>
    1f7c:	910d28e7 	add	x7, x7, #0x34a
    1f80:	aa1303e0 	mov	x0, x19
    1f84:	52805923 	mov	w3, #0x2c9                 	// #713
    1f88:	1400002d 	b	203c <main+0x12d4>
    1f8c:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1f90:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1f94:	910a6021 	add	x1, x1, #0x298
    1f98:	f947e673 	ldr	x19, [x19, #4040]
    1f9c:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1fa0:	910ae842 	add	x2, x2, #0x2ba
    1fa4:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1fa8:	910bf484 	add	x4, x4, #0x2fd
    1fac:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1fb0:	910d6ca5 	add	x5, x5, #0x35b
    1fb4:	f9400260 	ldr	x0, [x19]
    1fb8:	52805963 	mov	w3, #0x2cb                 	// #715
    1fbc:	14000114 	b	240c <main+0x16a4>
    1fc0:	d00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    1fc4:	d0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    1fc8:	910a6021 	add	x1, x1, #0x298
    1fcc:	f947e673 	ldr	x19, [x19, #4040]
    1fd0:	d0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    1fd4:	910ae842 	add	x2, x2, #0x2ba
    1fd8:	d0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    1fdc:	910bf484 	add	x4, x4, #0x2fd
    1fe0:	d0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    1fe4:	910db8a5 	add	x5, x5, #0x36e
    1fe8:	f9400260 	ldr	x0, [x19]
    1fec:	52805983 	mov	w3, #0x2cc                 	// #716
    1ff0:	14000107 	b	240c <main+0x16a4>
    1ff4:	d00000f5 	adrp	x21, 1f000 <__abi_tag+0x1ae50>
    1ff8:	f947e6b5 	ldr	x21, [x21, #4040]
    1ffc:	f94002b3 	ldr	x19, [x21]
    2000:	97fffafc 	bl	bf0 <__errno_location@plt>
    2004:	b9400014 	ldr	w20, [x0]
    2008:	2a1403e0 	mov	w0, w20
    200c:	97fffac9 	bl	b30 <strerror@plt>
    2010:	aa0003e6 	mov	x6, x0
    2014:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2018:	910c3021 	add	x1, x1, #0x30c
    201c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2020:	910ae842 	add	x2, x2, #0x2ba
    2024:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2028:	910bf484 	add	x4, x4, #0x2fd
    202c:	b0000007 	adrp	x7, 3000 <syntax_statement_list+0x818>
    2030:	910e8ce7 	add	x7, x7, #0x3a3
    2034:	aa1303e0 	mov	x0, x19
    2038:	528059c3 	mov	w3, #0x2ce                 	// #718
    203c:	2a1403e5 	mov	w5, w20
    2040:	97fffaf4 	bl	c10 <fprintf@plt>
    2044:	f94002a1 	ldr	x1, [x21]
    2048:	140000f3 	b	2414 <main+0x16ac>
    204c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2050:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2054:	910a6021 	add	x1, x1, #0x298
    2058:	f947e673 	ldr	x19, [x19, #4040]
    205c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2060:	910ae842 	add	x2, x2, #0x2ba
    2064:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2068:	910f3884 	add	x4, x4, #0x3ce
    206c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2070:	910f88a5 	add	x5, x5, #0x3e2
    2074:	f9400260 	ldr	x0, [x19]
    2078:	52800f23 	mov	w3, #0x79                  	// #121
    207c:	140000e4 	b	240c <main+0x16a4>
    2080:	f9400320 	ldr	x0, [x25]
    2084:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2088:	910a6021 	add	x1, x1, #0x298
    208c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2090:	910ae842 	add	x2, x2, #0x2ba
    2094:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2098:	91151484 	add	x4, x4, #0x545
    209c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    20a0:	911594a5 	add	x5, x5, #0x565
    20a4:	52803e23 	mov	w3, #0x1f1                 	// #497
    20a8:	97fffada 	bl	c10 <fprintf@plt>
    20ac:	f9400321 	ldr	x1, [x25]
    20b0:	140000d9 	b	2414 <main+0x16ac>
    20b4:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    20b8:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    20bc:	910a6021 	add	x1, x1, #0x298
    20c0:	f947e673 	ldr	x19, [x19, #4040]
    20c4:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    20c8:	910ae842 	add	x2, x2, #0x2ba
    20cc:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    20d0:	91151484 	add	x4, x4, #0x545
    20d4:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    20d8:	911594a5 	add	x5, x5, #0x565
    20dc:	f9400260 	ldr	x0, [x19]
    20e0:	52804a83 	mov	w3, #0x254                 	// #596
    20e4:	140000ca 	b	240c <main+0x16a4>
    20e8:	f9400260 	ldr	x0, [x19]
    20ec:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    20f0:	910a6021 	add	x1, x1, #0x298
    20f4:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    20f8:	910ae842 	add	x2, x2, #0x2ba
    20fc:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2100:	91151484 	add	x4, x4, #0x545
    2104:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2108:	911cf8a5 	add	x5, x5, #0x73e
    210c:	52805483 	mov	w3, #0x2a4                 	// #676
    2110:	140000bf 	b	240c <main+0x16a4>
    2114:	f9400260 	ldr	x0, [x19]
    2118:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    211c:	910a6021 	add	x1, x1, #0x298
    2120:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2124:	910ae842 	add	x2, x2, #0x2ba
    2128:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    212c:	91151484 	add	x4, x4, #0x545
    2130:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2134:	911690a5 	add	x5, x5, #0x5a4
    2138:	52805563 	mov	w3, #0x2ab                 	// #683
    213c:	140000b4 	b	240c <main+0x16a4>
    2140:	f9400320 	ldr	x0, [x25]
    2144:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2148:	910a6021 	add	x1, x1, #0x298
    214c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2150:	910ae842 	add	x2, x2, #0x2ba
    2154:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2158:	910f3884 	add	x4, x4, #0x3ce
    215c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2160:	910fd8a5 	add	x5, x5, #0x3f6
    2164:	528010e3 	mov	w3, #0x87                  	// #135
    2168:	17ffffd0 	b	20a8 <main+0x1340>
    216c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2170:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2174:	910a6021 	add	x1, x1, #0x298
    2178:	f947e673 	ldr	x19, [x19, #4040]
    217c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2180:	910ae842 	add	x2, x2, #0x2ba
    2184:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2188:	91151484 	add	x4, x4, #0x545
    218c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2190:	911620a5 	add	x5, x5, #0x588
    2194:	f9400260 	ldr	x0, [x19]
    2198:	528046a3 	mov	w3, #0x235                 	// #565
    219c:	1400009c 	b	240c <main+0x16a4>
    21a0:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    21a4:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    21a8:	910a6021 	add	x1, x1, #0x298
    21ac:	f947e673 	ldr	x19, [x19, #4040]
    21b0:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    21b4:	910ae842 	add	x2, x2, #0x2ba
    21b8:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    21bc:	91238484 	add	x4, x4, #0x8e1
    21c0:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    21c4:	9123e0a5 	add	x5, x5, #0x8f8
    21c8:	1400008f 	b	2404 <main+0x169c>
    21cc:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    21d0:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    21d4:	910a6021 	add	x1, x1, #0x298
    21d8:	f947e673 	ldr	x19, [x19, #4040]
    21dc:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    21e0:	910ae842 	add	x2, x2, #0x2ba
    21e4:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    21e8:	91238484 	add	x4, x4, #0x8e1
    21ec:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    21f0:	9124c4a5 	add	x5, x5, #0x931
    21f4:	14000084 	b	2404 <main+0x169c>
    21f8:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    21fc:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2200:	910a6021 	add	x1, x1, #0x298
    2204:	f947e673 	ldr	x19, [x19, #4040]
    2208:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    220c:	910ae842 	add	x2, x2, #0x2ba
    2210:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2214:	91238484 	add	x4, x4, #0x8e1
    2218:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    221c:	9125dca5 	add	x5, x5, #0x977
    2220:	14000079 	b	2404 <main+0x169c>
    2224:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2228:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    222c:	910a6021 	add	x1, x1, #0x298
    2230:	f947e673 	ldr	x19, [x19, #4040]
    2234:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2238:	910ae842 	add	x2, x2, #0x2ba
    223c:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2240:	91238484 	add	x4, x4, #0x8e1
    2244:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2248:	9126e0a5 	add	x5, x5, #0x9b8
    224c:	1400006e 	b	2404 <main+0x169c>
    2250:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2254:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2258:	910a6021 	add	x1, x1, #0x298
    225c:	f947e673 	ldr	x19, [x19, #4040]
    2260:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2264:	910ae842 	add	x2, x2, #0x2ba
    2268:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    226c:	91238484 	add	x4, x4, #0x8e1
    2270:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2274:	9127f8a5 	add	x5, x5, #0x9fe
    2278:	14000063 	b	2404 <main+0x169c>
    227c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2280:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2284:	910a6021 	add	x1, x1, #0x298
    2288:	f947e673 	ldr	x19, [x19, #4040]
    228c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2290:	910ae842 	add	x2, x2, #0x2ba
    2294:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2298:	91238484 	add	x4, x4, #0x8e1
    229c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    22a0:	91291ca5 	add	x5, x5, #0xa47
    22a4:	14000058 	b	2404 <main+0x169c>
    22a8:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    22ac:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    22b0:	910a6021 	add	x1, x1, #0x298
    22b4:	f947e673 	ldr	x19, [x19, #4040]
    22b8:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    22bc:	910ae842 	add	x2, x2, #0x2ba
    22c0:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    22c4:	91238484 	add	x4, x4, #0x8e1
    22c8:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    22cc:	912a1ca5 	add	x5, x5, #0xa87
    22d0:	1400004d 	b	2404 <main+0x169c>
    22d4:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    22d8:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    22dc:	910a6021 	add	x1, x1, #0x298
    22e0:	f947e673 	ldr	x19, [x19, #4040]
    22e4:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    22e8:	910ae842 	add	x2, x2, #0x2ba
    22ec:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    22f0:	91238484 	add	x4, x4, #0x8e1
    22f4:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    22f8:	912b30a5 	add	x5, x5, #0xacc
    22fc:	14000042 	b	2404 <main+0x169c>
    2300:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2304:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2308:	910a6021 	add	x1, x1, #0x298
    230c:	f947e673 	ldr	x19, [x19, #4040]
    2310:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2314:	910ae842 	add	x2, x2, #0x2ba
    2318:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    231c:	91238484 	add	x4, x4, #0x8e1
    2320:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2324:	912c44a5 	add	x5, x5, #0xb11
    2328:	14000037 	b	2404 <main+0x169c>
    232c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2330:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2334:	910a6021 	add	x1, x1, #0x298
    2338:	f947e673 	ldr	x19, [x19, #4040]
    233c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2340:	910ae842 	add	x2, x2, #0x2ba
    2344:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2348:	91238484 	add	x4, x4, #0x8e1
    234c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2350:	912e18a5 	add	x5, x5, #0xb86
    2354:	1400002c 	b	2404 <main+0x169c>
    2358:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    235c:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2360:	910a6021 	add	x1, x1, #0x298
    2364:	f947e673 	ldr	x19, [x19, #4040]
    2368:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    236c:	910ae842 	add	x2, x2, #0x2ba
    2370:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2374:	91238484 	add	x4, x4, #0x8e1
    2378:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    237c:	913008a5 	add	x5, x5, #0xc02
    2380:	14000021 	b	2404 <main+0x169c>
    2384:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2388:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    238c:	910a6021 	add	x1, x1, #0x298
    2390:	f947e673 	ldr	x19, [x19, #4040]
    2394:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2398:	910ae842 	add	x2, x2, #0x2ba
    239c:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    23a0:	91238484 	add	x4, x4, #0x8e1
    23a4:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    23a8:	91312ca5 	add	x5, x5, #0xc4b
    23ac:	14000016 	b	2404 <main+0x169c>
    23b0:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    23b4:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    23b8:	910a6021 	add	x1, x1, #0x298
    23bc:	f947e673 	ldr	x19, [x19, #4040]
    23c0:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    23c4:	910ae842 	add	x2, x2, #0x2ba
    23c8:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    23cc:	91238484 	add	x4, x4, #0x8e1
    23d0:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    23d4:	913274a5 	add	x5, x5, #0xc9d
    23d8:	1400000b 	b	2404 <main+0x169c>
    23dc:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    23e0:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    23e4:	910a6021 	add	x1, x1, #0x298
    23e8:	f947e673 	ldr	x19, [x19, #4040]
    23ec:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    23f0:	910ae842 	add	x2, x2, #0x2ba
    23f4:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    23f8:	91238484 	add	x4, x4, #0x8e1
    23fc:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2400:	9133b4a5 	add	x5, x5, #0xced
    2404:	f9400260 	ldr	x0, [x19]
    2408:	52802803 	mov	w3, #0x140                 	// #320
    240c:	97fffa01 	bl	c10 <fprintf@plt>
    2410:	f9400261 	ldr	x1, [x19]
    2414:	52800140 	mov	w0, #0xa                   	// #10
    2418:	97fff9ae 	bl	ad0 <fputc@plt>
    241c:	97fff9d1 	bl	b60 <abort@plt>
    2420:	f9400320 	ldr	x0, [x25]
    2424:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2428:	910a6021 	add	x1, x1, #0x298
    242c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2430:	910ae842 	add	x2, x2, #0x2ba
    2434:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2438:	91151484 	add	x4, x4, #0x545
    243c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2440:	911594a5 	add	x5, x5, #0x565
    2444:	52804443 	mov	w3, #0x222                 	// #546
    2448:	17ffff18 	b	20a8 <main+0x1340>
    244c:	f9400320 	ldr	x0, [x25]
    2450:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2454:	910a6021 	add	x1, x1, #0x298
    2458:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    245c:	910ae842 	add	x2, x2, #0x2ba
    2460:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2464:	91151484 	add	x4, x4, #0x545
    2468:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    246c:	911558a5 	add	x5, x5, #0x556
    2470:	52803ce3 	mov	w3, #0x1e7                 	// #487
    2474:	97fff9e7 	bl	c10 <fprintf@plt>
    2478:	29580be8 	ldp	w8, w2, [sp, #192]
    247c:	b940cbe9 	ldr	w9, [sp, #200]
    2480:	f9400320 	ldr	x0, [x25]
    2484:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2488:	91159c21 	add	x1, x1, #0x567
    248c:	4b090103 	sub	w3, w8, w9
    2490:	97fff9e0 	bl	c10 <fprintf@plt>
    2494:	17ffff06 	b	20ac <main+0x1344>

0000000000002498 <lexic_analyzer_yield>:
    2498:	d101c3ff 	sub	sp, sp, #0x70
    249c:	a9047bfd 	stp	x29, x30, [sp, #64]
    24a0:	f9002bf5 	str	x21, [sp, #80]
    24a4:	a9064ff4 	stp	x20, x19, [sp, #96]
    24a8:	910103fd 	add	x29, sp, #0x40
    24ac:	6f00e400 	movi	v0.2d, #0x0
    24b0:	f9402808 	ldr	x8, [x0, #80]
    24b4:	b9804009 	ldrsw	x9, [x0, #64]
    24b8:	aa0103f4 	mov	x20, x1
    24bc:	910003e3 	mov	x3, sp
    24c0:	528000e2 	mov	w2, #0x7                   	// #7
    24c4:	8b090101 	add	x1, x8, x9
    24c8:	2a1f03e4 	mov	w4, wzr
    24cc:	aa0003f3 	mov	x19, x0
    24d0:	f9001bff 	str	xzr, [sp, #48]
    24d4:	ad0083e0 	stp	q0, q0, [sp, #16]
    24d8:	3d8003e0 	str	q0, [sp]
    24dc:	97fff9b5 	bl	bb0 <regexec@plt>
    24e0:	2a0003f5 	mov	w21, w0
    24e4:	7100041f 	cmp	w0, #0x1
    24e8:	54000780 	b.eq	25d8 <lexic_analyzer_yield+0x140>  // b.none
    24ec:	29422be9 	ldp	w9, w10, [sp, #16]
    24f0:	294023eb 	ldp	w11, w8, [sp]
    24f4:	2948366c 	ldp	w12, w13, [x19, #64]
    24f8:	3100053f 	cmn	w9, #0x1
    24fc:	3a411944 	ccmn	w10, #0x1, #0x4, ne	// ne = any
    2500:	0b0c0169 	add	w9, w11, w12
    2504:	0b0c010a 	add	w10, w8, w12
    2508:	1a9f07eb 	cset	w11, ne	// ne = any
    250c:	54000060 	b.eq	2518 <lexic_analyzer_yield+0x80>  // b.none
    2510:	2900fe8a 	stp	w10, wzr, [x20, #4]
    2514:	b9000289 	str	w9, [x20]
    2518:	b9401bee 	ldr	w14, [sp, #24]
    251c:	310005df 	cmn	w14, #0x1
    2520:	54000100 	b.eq	2540 <lexic_analyzer_yield+0xa8>  // b.none
    2524:	b9401fee 	ldr	w14, [sp, #28]
    2528:	310005df 	cmn	w14, #0x1
    252c:	540000a0 	b.eq	2540 <lexic_analyzer_yield+0xa8>  // b.none
    2530:	370006cb 	tbnz	w11, #0, 2608 <lexic_analyzer_yield+0x170>
    2534:	5280002b 	mov	w11, #0x1                   	// #1
    2538:	b9000289 	str	w9, [x20]
    253c:	2900ae8a 	stp	w10, w11, [x20, #4]
    2540:	b94023ee 	ldr	w14, [sp, #32]
    2544:	310005df 	cmn	w14, #0x1
    2548:	54000120 	b.eq	256c <lexic_analyzer_yield+0xd4>  // b.none
    254c:	b94027ee 	ldr	w14, [sp, #36]
    2550:	310005df 	cmn	w14, #0x1
    2554:	540000c0 	b.eq	256c <lexic_analyzer_yield+0xd4>  // b.none
    2558:	3700058b 	tbnz	w11, #0, 2608 <lexic_analyzer_yield+0x170>
    255c:	5280004b 	mov	w11, #0x2                   	// #2
    2560:	b9000289 	str	w9, [x20]
    2564:	2900ae8a 	stp	w10, w11, [x20, #4]
    2568:	5280002b 	mov	w11, #0x1                   	// #1
    256c:	b9402bee 	ldr	w14, [sp, #40]
    2570:	310005df 	cmn	w14, #0x1
    2574:	54000160 	b.eq	25a0 <lexic_analyzer_yield+0x108>  // b.none
    2578:	b9402fee 	ldr	w14, [sp, #44]
    257c:	310005df 	cmn	w14, #0x1
    2580:	54000100 	b.eq	25a0 <lexic_analyzer_yield+0x108>  // b.none
    2584:	110005ad 	add	w13, w13, #0x1
    2588:	2908b26d 	stp	w13, w12, [x19, #68]
    258c:	370003eb 	tbnz	w11, #0, 2608 <lexic_analyzer_yield+0x170>
    2590:	5280006b 	mov	w11, #0x3                   	// #3
    2594:	b9000289 	str	w9, [x20]
    2598:	2900ae8a 	stp	w10, w11, [x20, #4]
    259c:	5280002b 	mov	w11, #0x1                   	// #1
    25a0:	b94033ec 	ldr	w12, [sp, #48]
    25a4:	3100059f 	cmn	w12, #0x1
    25a8:	54000100 	b.eq	25c8 <lexic_analyzer_yield+0x130>  // b.none
    25ac:	b94037ec 	ldr	w12, [sp, #52]
    25b0:	3100059f 	cmn	w12, #0x1
    25b4:	540000a0 	b.eq	25c8 <lexic_analyzer_yield+0x130>  // b.none
    25b8:	3700028b 	tbnz	w11, #0, 2608 <lexic_analyzer_yield+0x170>
    25bc:	5280008b 	mov	w11, #0x4                   	// #4
    25c0:	b9000289 	str	w9, [x20]
    25c4:	2900ae8a 	stp	w10, w11, [x20, #4]
    25c8:	b9404269 	ldr	w9, [x19, #64]
    25cc:	0b080128 	add	w8, w9, w8
    25d0:	b9004268 	str	w8, [x19, #64]
    25d4:	14000006 	b	25ec <lexic_analyzer_yield+0x154>
    25d8:	f9402a60 	ldr	x0, [x19, #80]
    25dc:	b9404274 	ldr	w20, [x19, #64]
    25e0:	97fff930 	bl	aa0 <strlen@plt>
    25e4:	6b00029f 	cmp	w20, w0
    25e8:	540002e1 	b.ne	2644 <lexic_analyzer_yield+0x1ac>  // b.any
    25ec:	710006bf 	cmp	w21, #0x1
    25f0:	1a9f07e0 	cset	w0, ne	// ne = any
    25f4:	a9464ff4 	ldp	x20, x19, [sp, #96]
    25f8:	f9402bf5 	ldr	x21, [sp, #80]
    25fc:	a9447bfd 	ldp	x29, x30, [sp, #64]
    2600:	9101c3ff 	add	sp, sp, #0x70
    2604:	d65f03c0 	ret
    2608:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    260c:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2610:	910a6021 	add	x1, x1, #0x298
    2614:	f947e673 	ldr	x19, [x19, #4040]
    2618:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    261c:	910ae842 	add	x2, x2, #0x2ba
    2620:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2624:	91116084 	add	x4, x4, #0x458
    2628:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    262c:	9111b4a5 	add	x5, x5, #0x46d
    2630:	f9400260 	ldr	x0, [x19]
    2634:	528013a3 	mov	w3, #0x9d                  	// #157
    2638:	97fff976 	bl	c10 <fprintf@plt>
    263c:	f9400261 	ldr	x1, [x19]
    2640:	14000016 	b	2698 <lexic_analyzer_yield+0x200>
    2644:	b00000f4 	adrp	x20, 1f000 <__abi_tag+0x1ae50>
    2648:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    264c:	910a6021 	add	x1, x1, #0x298
    2650:	f947e694 	ldr	x20, [x20, #4040]
    2654:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2658:	910ae842 	add	x2, x2, #0x2ba
    265c:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2660:	91116084 	add	x4, x4, #0x458
    2664:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2668:	9111f8a5 	add	x5, x5, #0x47e
    266c:	f9400280 	ldr	x0, [x20]
    2670:	52801523 	mov	w3, #0xa9                  	// #169
    2674:	97fff967 	bl	c10 <fprintf@plt>
    2678:	29480a68 	ldp	w8, w2, [x19, #64]
    267c:	b9404a69 	ldr	w9, [x19, #72]
    2680:	f9400280 	ldr	x0, [x20]
    2684:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2688:	9112f821 	add	x1, x1, #0x4be
    268c:	4b090103 	sub	w3, w8, w9
    2690:	97fff960 	bl	c10 <fprintf@plt>
    2694:	f9400281 	ldr	x1, [x20]
    2698:	52800140 	mov	w0, #0xa                   	// #10
    269c:	97fff90d 	bl	ad0 <fputc@plt>
    26a0:	97fff930 	bl	b60 <abort@plt>

00000000000026a4 <assert_atom_regex>:
    26a4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    26a8:	f9000bf5 	str	x21, [sp, #16]
    26ac:	a9024ff4 	stp	x20, x19, [sp, #32]
    26b0:	910003fd 	mov	x29, sp
    26b4:	b9400048 	ldr	w8, [x2]
    26b8:	aa0503f3 	mov	x19, x5
    26bc:	2a0403f4 	mov	w20, w4
    26c0:	7100051f 	cmp	w8, #0x1
    26c4:	54000301 	b.ne	2724 <assert_atom_regex+0x80>  // b.any
    26c8:	f9400448 	ldr	x8, [x2, #8]
    26cc:	52800022 	mov	w2, #0x1                   	// #1
    26d0:	2a1f03e4 	mov	w4, wzr
    26d4:	8b080c35 	add	x21, x1, x8, lsl #3
    26d8:	f9400068 	ldr	x8, [x3]
    26dc:	910063a3 	add	x3, x29, #0x18
    26e0:	b98002a9 	ldrsw	x9, [x21]
    26e4:	8b090001 	add	x1, x0, x9
    26e8:	aa0803e0 	mov	x0, x8
    26ec:	97fff931 	bl	bb0 <regexec@plt>
    26f0:	7100041f 	cmp	w0, #0x1
    26f4:	540002a0 	b.eq	2748 <assert_atom_regex+0xa4>  // b.none
    26f8:	b9401ba8 	ldr	w8, [x29, #24]
    26fc:	35000448 	cbnz	w8, 2784 <assert_atom_regex+0xe0>
    2700:	294022a9 	ldp	w9, w8, [x21]
    2704:	b9401faa 	ldr	w10, [x29, #28]
    2708:	4b090108 	sub	w8, w8, w9
    270c:	6b08015f 	cmp	w10, w8
    2710:	540004c1 	b.ne	27a8 <assert_atom_regex+0x104>  // b.any
    2714:	a9424ff4 	ldp	x20, x19, [sp, #32]
    2718:	f9400bf5 	ldr	x21, [sp, #16]
    271c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2720:	d65f03c0 	ret
    2724:	b00000f5 	adrp	x21, 1f000 <__abi_tag+0x1ae50>
    2728:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    272c:	910a6021 	add	x1, x1, #0x298
    2730:	f947e6b5 	ldr	x21, [x21, #4040]
    2734:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2738:	910ae842 	add	x2, x2, #0x2ba
    273c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2740:	913ca8a5 	add	x5, x5, #0xf2a
    2744:	14000021 	b	27c8 <assert_atom_regex+0x124>
    2748:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    274c:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2750:	910a6021 	add	x1, x1, #0x298
    2754:	f947e673 	ldr	x19, [x19, #4040]
    2758:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    275c:	910ae842 	add	x2, x2, #0x2ba
    2760:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2764:	91362084 	add	x4, x4, #0xd88
    2768:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    276c:	911594a5 	add	x5, x5, #0x565
    2770:	f9400260 	ldr	x0, [x19]
    2774:	52802ba3 	mov	w3, #0x15d                 	// #349
    2778:	97fff926 	bl	c10 <fprintf@plt>
    277c:	f9400261 	ldr	x1, [x19]
    2780:	14000017 	b	27dc <assert_atom_regex+0x138>
    2784:	b00000f5 	adrp	x21, 1f000 <__abi_tag+0x1ae50>
    2788:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    278c:	910a6021 	add	x1, x1, #0x298
    2790:	f947e6b5 	ldr	x21, [x21, #4040]
    2794:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2798:	910ae842 	add	x2, x2, #0x2ba
    279c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    27a0:	9134aca5 	add	x5, x5, #0xd2b
    27a4:	14000009 	b	27c8 <assert_atom_regex+0x124>
    27a8:	b00000f5 	adrp	x21, 1f000 <__abi_tag+0x1ae50>
    27ac:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    27b0:	910a6021 	add	x1, x1, #0x298
    27b4:	f947e6b5 	ldr	x21, [x21, #4040]
    27b8:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    27bc:	910ae842 	add	x2, x2, #0x2ba
    27c0:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    27c4:	913504a5 	add	x5, x5, #0xd41
    27c8:	f94002a0 	ldr	x0, [x21]
    27cc:	2a1403e3 	mov	w3, w20
    27d0:	aa1303e4 	mov	x4, x19
    27d4:	97fff90f 	bl	c10 <fprintf@plt>
    27d8:	f94002a1 	ldr	x1, [x21]
    27dc:	52800140 	mov	w0, #0xa                   	// #10
    27e0:	97fff8bc 	bl	ad0 <fputc@plt>
    27e4:	97fff8df 	bl	b60 <abort@plt>

00000000000027e8 <syntax_statement_list>:
    27e8:	d10203ff 	sub	sp, sp, #0x80
    27ec:	a9027bfd 	stp	x29, x30, [sp, #32]
    27f0:	a9036ffc 	stp	x28, x27, [sp, #48]
    27f4:	a90467fa 	stp	x26, x25, [sp, #64]
    27f8:	a9055ff8 	stp	x24, x23, [sp, #80]
    27fc:	a90657f6 	stp	x22, x21, [sp, #96]
    2800:	a9074ff4 	stp	x20, x19, [sp, #112]
    2804:	910083fd 	add	x29, sp, #0x20
    2808:	b9400008 	ldr	w8, [x0]
    280c:	350043e8 	cbnz	w8, 3088 <syntax_statement_list+0x8a0>
    2810:	f9400028 	ldr	x8, [x1]
    2814:	f9400409 	ldr	x9, [x0, #8]
    2818:	aa0103f5 	mov	x21, x1
    281c:	5280010b 	mov	w11, #0x8                   	// #8
    2820:	8b091119 	add	x25, x8, x9, lsl #4
    2824:	f9400828 	ldr	x8, [x1, #16]
    2828:	f940072a 	ldr	x10, [x25, #8]
    282c:	b829790b 	str	w11, [x8, x9, lsl #2]
    2830:	b40020ea 	cbz	x10, 2c4c <syntax_statement_list+0x464>
    2834:	aa0303f3 	mov	x19, x3
    2838:	aa0203f4 	mov	x20, x2
    283c:	aa1f03fa 	mov	x26, xzr
    2840:	91090048 	add	x8, x2, #0x240
    2844:	528001b7 	mov	w23, #0xd                   	// #13
    2848:	f90007e8 	str	x8, [sp, #8]
    284c:	1400000f 	b	2888 <syntax_statement_list+0xa0>
    2850:	91004300 	add	x0, x24, #0x10
    2854:	aa1503e1 	mov	x1, x21
    2858:	aa1403e2 	mov	x2, x20
    285c:	aa1303e3 	mov	x3, x19
    2860:	9400021b 	bl	30cc <syntax_simple_argument>
    2864:	91008300 	add	x0, x24, #0x20
    2868:	aa1503e1 	mov	x1, x21
    286c:	aa1403e2 	mov	x2, x20
    2870:	aa1303e3 	mov	x3, x19
    2874:	97ffffdd 	bl	27e8 <syntax_statement_list>
    2878:	f9400728 	ldr	x8, [x25, #8]
    287c:	9100075a 	add	x26, x26, #0x1
    2880:	eb08035f 	cmp	x26, x8
    2884:	54001e42 	b.cs	2c4c <syntax_statement_list+0x464>  // b.hs, b.nlast
    2888:	f94012a8 	ldr	x8, [x21, #32]
    288c:	f9400329 	ldr	x9, [x25]
    2890:	8b091109 	add	x9, x8, x9, lsl #4
    2894:	8b1a1136 	add	x22, x9, x26, lsl #4
    2898:	b94002c9 	ldr	w9, [x22]
    289c:	35002029 	cbnz	w9, 2ca0 <syntax_statement_list+0x4b8>
    28a0:	f94002a9 	ldr	x9, [x21]
    28a4:	f94006ca 	ldr	x10, [x22, #8]
    28a8:	8b0a113b 	add	x27, x9, x10, lsl #4
    28ac:	f9400769 	ldr	x9, [x27, #8]
    28b0:	b4002129 	cbz	x9, 2cd4 <syntax_statement_list+0x4ec>
    28b4:	f9400369 	ldr	x9, [x27]
    28b8:	8b091118 	add	x24, x8, x9, lsl #4
    28bc:	b9400308 	ldr	w8, [x24]
    28c0:	7100051f 	cmp	w8, #0x1
    28c4:	54001d41 	b.ne	2c6c <syntax_statement_list+0x484>  // b.any
    28c8:	f9401aa8 	ldr	x8, [x21, #48]
    28cc:	f9400709 	ldr	x9, [x24, #8]
    28d0:	91020280 	add	x0, x20, #0x80
    28d4:	f81f83bf 	stur	xzr, [x29, #-8]
    28d8:	d10023a3 	sub	x3, x29, #0x8
    28dc:	52800022 	mov	w2, #0x1                   	// #1
    28e0:	8b090d1c 	add	x28, x8, x9, lsl #3
    28e4:	2a1f03e4 	mov	w4, wzr
    28e8:	b9800388 	ldrsw	x8, [x28]
    28ec:	8b080261 	add	x1, x19, x8
    28f0:	97fff8b0 	bl	bb0 <regexec@plt>
    28f4:	7100041f 	cmp	w0, #0x1
    28f8:	540008e1 	b.ne	2a14 <syntax_statement_list+0x22c>  // b.any
    28fc:	b9800388 	ldrsw	x8, [x28]
    2900:	91010280 	add	x0, x20, #0x40
    2904:	d10023a3 	sub	x3, x29, #0x8
    2908:	52800022 	mov	w2, #0x1                   	// #1
    290c:	2a1f03e4 	mov	w4, wzr
    2910:	8b080261 	add	x1, x19, x8
    2914:	97fff8a7 	bl	bb0 <regexec@plt>
    2918:	7100041f 	cmp	w0, #0x1
    291c:	54000b61 	b.ne	2a88 <syntax_statement_list+0x2a0>  // b.any
    2920:	b9800388 	ldrsw	x8, [x28]
    2924:	91030280 	add	x0, x20, #0xc0
    2928:	d10023a3 	sub	x3, x29, #0x8
    292c:	52800022 	mov	w2, #0x1                   	// #1
    2930:	2a1f03e4 	mov	w4, wzr
    2934:	8b080261 	add	x1, x19, x8
    2938:	97fff89e 	bl	bb0 <regexec@plt>
    293c:	7100041f 	cmp	w0, #0x1
    2940:	54000ca1 	b.ne	2ad4 <syntax_statement_list+0x2ec>  // b.any
    2944:	b9800388 	ldrsw	x8, [x28]
    2948:	91040280 	add	x0, x20, #0x100
    294c:	d10023a3 	sub	x3, x29, #0x8
    2950:	52800022 	mov	w2, #0x1                   	// #1
    2954:	2a1f03e4 	mov	w4, wzr
    2958:	8b080261 	add	x1, x19, x8
    295c:	97fff895 	bl	bb0 <regexec@plt>
    2960:	7100041f 	cmp	w0, #0x1
    2964:	54001041 	b.ne	2b6c <syntax_statement_list+0x384>  // b.any
    2968:	b9800388 	ldrsw	x8, [x28]
    296c:	f94007e0 	ldr	x0, [sp, #8]
    2970:	d10023a3 	sub	x3, x29, #0x8
    2974:	52800022 	mov	w2, #0x1                   	// #1
    2978:	2a1f03e4 	mov	w4, wzr
    297c:	8b080261 	add	x1, x19, x8
    2980:	97fff88c 	bl	bb0 <regexec@plt>
    2984:	7100041f 	cmp	w0, #0x1
    2988:	54003660 	b.eq	3054 <syntax_statement_list+0x86c>  // b.none
    298c:	b85f83a8 	ldur	w8, [x29, #-8]
    2990:	35003328 	cbnz	w8, 2ff4 <syntax_statement_list+0x80c>
    2994:	29402389 	ldp	w9, w8, [x28]
    2998:	b85fc3aa 	ldur	w10, [x29, #-4]
    299c:	4b090108 	sub	w8, w8, w9
    29a0:	6b08015f 	cmp	w10, w8
    29a4:	540033e1 	b.ne	3020 <syntax_statement_list+0x838>  // b.any
    29a8:	f940076a 	ldr	x10, [x27, #8]
    29ac:	f9400aa8 	ldr	x8, [x21, #16]
    29b0:	528000cd 	mov	w13, #0x6                   	// #6
    29b4:	f94006c9 	ldr	x9, [x22, #8]
    29b8:	f94022ab 	ldr	x11, [x21, #64]
    29bc:	f940070c 	ldr	x12, [x24, #8]
    29c0:	f100095f 	cmp	x10, #0x2
    29c4:	b829790d 	str	w13, [x8, x9, lsl #2]
    29c8:	52800168 	mov	w8, #0xb                   	// #11
    29cc:	b82c7968 	str	w8, [x11, x12, lsl #2]
    29d0:	54fff543 	b.cc	2878 <syntax_statement_list+0x90>  // b.lo, b.ul, b.last
    29d4:	52800216 	mov	w22, #0x10                  	// #16
    29d8:	52800038 	mov	w24, #0x1                   	// #1
    29dc:	f94012a8 	ldr	x8, [x21, #32]
    29e0:	f9400369 	ldr	x9, [x27]
    29e4:	aa1503e1 	mov	x1, x21
    29e8:	aa1403e2 	mov	x2, x20
    29ec:	aa1303e3 	mov	x3, x19
    29f0:	8b091108 	add	x8, x8, x9, lsl #4
    29f4:	8b160100 	add	x0, x8, x22
    29f8:	940001b5 	bl	30cc <syntax_simple_argument>
    29fc:	f9400768 	ldr	x8, [x27, #8]
    2a00:	91000718 	add	x24, x24, #0x1
    2a04:	910042d6 	add	x22, x22, #0x10
    2a08:	eb08031f 	cmp	x24, x8
    2a0c:	54fffe83 	b.cc	29dc <syntax_statement_list+0x1f4>  // b.lo, b.ul, b.last
    2a10:	17ffff9a 	b	2878 <syntax_statement_list+0x90>
    2a14:	b85f83a8 	ldur	w8, [x29, #-8]
    2a18:	35001a88 	cbnz	w8, 2d68 <syntax_statement_list+0x580>
    2a1c:	29402389 	ldp	w9, w8, [x28]
    2a20:	b85fc3aa 	ldur	w10, [x29, #-4]
    2a24:	4b090108 	sub	w8, w8, w9
    2a28:	6b08015f 	cmp	w10, w8
    2a2c:	540016e1 	b.ne	2d08 <syntax_statement_list+0x520>  // b.any
    2a30:	f940076a 	ldr	x10, [x27, #8]
    2a34:	f9400aa8 	ldr	x8, [x21, #16]
    2a38:	5280012d 	mov	w13, #0x9                   	// #9
    2a3c:	f94006c9 	ldr	x9, [x22, #8]
    2a40:	f94022ab 	ldr	x11, [x21, #64]
    2a44:	f940070c 	ldr	x12, [x24, #8]
    2a48:	f100115f 	cmp	x10, #0x4
    2a4c:	b829790d 	str	w13, [x8, x9, lsl #2]
    2a50:	b82c7977 	str	w23, [x11, x12, lsl #2]
    2a54:	54001701 	b.ne	2d34 <syntax_statement_list+0x54c>  // b.any
    2a58:	91004300 	add	x0, x24, #0x10
    2a5c:	aa1503e1 	mov	x1, x21
    2a60:	aa1403e2 	mov	x2, x20
    2a64:	aa1303e3 	mov	x3, x19
    2a68:	94000199 	bl	30cc <syntax_simple_argument>
    2a6c:	91008300 	add	x0, x24, #0x20
    2a70:	aa1503e1 	mov	x1, x21
    2a74:	aa1403e2 	mov	x2, x20
    2a78:	aa1303e3 	mov	x3, x19
    2a7c:	97ffff5b 	bl	27e8 <syntax_statement_list>
    2a80:	9100c300 	add	x0, x24, #0x30
    2a84:	17ffff79 	b	2868 <syntax_statement_list+0x80>
    2a88:	b85f83a8 	ldur	w8, [x29, #-8]
    2a8c:	35001888 	cbnz	w8, 2d9c <syntax_statement_list+0x5b4>
    2a90:	29402389 	ldp	w9, w8, [x28]
    2a94:	b85fc3aa 	ldur	w10, [x29, #-4]
    2a98:	4b090108 	sub	w8, w8, w9
    2a9c:	6b08015f 	cmp	w10, w8
    2aa0:	54001941 	b.ne	2dc8 <syntax_statement_list+0x5e0>  // b.any
    2aa4:	f940076a 	ldr	x10, [x27, #8]
    2aa8:	f9400aa8 	ldr	x8, [x21, #16]
    2aac:	5280014d 	mov	w13, #0xa                   	// #10
    2ab0:	f94006c9 	ldr	x9, [x22, #8]
    2ab4:	f94022ab 	ldr	x11, [x21, #64]
    2ab8:	f940070c 	ldr	x12, [x24, #8]
    2abc:	f1000d5f 	cmp	x10, #0x3
    2ac0:	b829790d 	str	w13, [x8, x9, lsl #2]
    2ac4:	528001c8 	mov	w8, #0xe                   	// #14
    2ac8:	b82c7968 	str	w8, [x11, x12, lsl #2]
    2acc:	54ffec20 	b.eq	2850 <syntax_statement_list+0x68>  // b.none
    2ad0:	140000cb 	b	2dfc <syntax_statement_list+0x614>
    2ad4:	b85f83a8 	ldur	w8, [x29, #-8]
    2ad8:	35001ac8 	cbnz	w8, 2e30 <syntax_statement_list+0x648>
    2adc:	29402389 	ldp	w9, w8, [x28]
    2ae0:	b85fc3aa 	ldur	w10, [x29, #-4]
    2ae4:	4b090108 	sub	w8, w8, w9
    2ae8:	6b08015f 	cmp	w10, w8
    2aec:	54001b81 	b.ne	2e5c <syntax_statement_list+0x674>  // b.any
    2af0:	f940076a 	ldr	x10, [x27, #8]
    2af4:	f9400aa8 	ldr	x8, [x21, #16]
    2af8:	5280016d 	mov	w13, #0xb                   	// #11
    2afc:	f94006c9 	ldr	x9, [x22, #8]
    2b00:	f94022ab 	ldr	x11, [x21, #64]
    2b04:	f940070c 	ldr	x12, [x24, #8]
    2b08:	f1000d5f 	cmp	x10, #0x3
    2b0c:	b829790d 	str	w13, [x8, x9, lsl #2]
    2b10:	528001e8 	mov	w8, #0xf                   	// #15
    2b14:	b82c7968 	str	w8, [x11, x12, lsl #2]
    2b18:	54001bc1 	b.ne	2e90 <syntax_statement_list+0x6a8>  // b.any
    2b1c:	f9401aa1 	ldr	x1, [x21, #48]
    2b20:	f94007e8 	ldr	x8, [sp, #8]
    2b24:	91004302 	add	x2, x24, #0x10
    2b28:	910043e3 	add	x3, sp, #0x10
    2b2c:	aa1303e0 	mov	x0, x19
    2b30:	52803764 	mov	w4, #0x1bb                 	// #443
    2b34:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2b38:	913668a5 	add	x5, x5, #0xd9a
    2b3c:	f9000be8 	str	x8, [sp, #16]
    2b40:	97fffed9 	bl	26a4 <assert_atom_regex>
    2b44:	f94022a8 	ldr	x8, [x21, #64]
    2b48:	f9400f09 	ldr	x9, [x24, #24]
    2b4c:	528000ca 	mov	w10, #0x6                   	// #6
    2b50:	aa1803e0 	mov	x0, x24
    2b54:	b829790a 	str	w10, [x8, x9, lsl #2]
    2b58:	b8420c09 	ldr	w9, [x0, #32]!
    2b5c:	34000389 	cbz	w9, 2bcc <syntax_statement_list+0x3e4>
    2b60:	7100053f 	cmp	w9, #0x1
    2b64:	540002a0 	b.eq	2bb8 <syntax_statement_list+0x3d0>  // b.none
    2b68:	140000d7 	b	2ec4 <syntax_statement_list+0x6dc>
    2b6c:	b85f83a8 	ldur	w8, [x29, #-8]
    2b70:	35001f88 	cbnz	w8, 2f60 <syntax_statement_list+0x778>
    2b74:	29402389 	ldp	w9, w8, [x28]
    2b78:	b85fc3aa 	ldur	w10, [x29, #-4]
    2b7c:	4b090108 	sub	w8, w8, w9
    2b80:	6b08015f 	cmp	w10, w8
    2b84:	54002041 	b.ne	2f8c <syntax_statement_list+0x7a4>  // b.any
    2b88:	f940076a 	ldr	x10, [x27, #8]
    2b8c:	f9400aa8 	ldr	x8, [x21, #16]
    2b90:	5280018d 	mov	w13, #0xc                   	// #12
    2b94:	f94006c9 	ldr	x9, [x22, #8]
    2b98:	f94022ab 	ldr	x11, [x21, #64]
    2b9c:	f940070c 	ldr	x12, [x24, #8]
    2ba0:	f100095f 	cmp	x10, #0x2
    2ba4:	b829790d 	str	w13, [x8, x9, lsl #2]
    2ba8:	52800208 	mov	w8, #0x10                  	// #16
    2bac:	b82c7968 	str	w8, [x11, x12, lsl #2]
    2bb0:	54002081 	b.ne	2fc0 <syntax_statement_list+0x7d8>  // b.any
    2bb4:	91004300 	add	x0, x24, #0x10
    2bb8:	aa1503e1 	mov	x1, x21
    2bbc:	aa1403e2 	mov	x2, x20
    2bc0:	aa1303e3 	mov	x3, x19
    2bc4:	94000142 	bl	30cc <syntax_simple_argument>
    2bc8:	17ffff2c 	b	2878 <syntax_statement_list+0x90>
    2bcc:	f94002a9 	ldr	x9, [x21]
    2bd0:	f940170a 	ldr	x10, [x24, #40]
    2bd4:	528000ac 	mov	w12, #0x5                   	// #5
    2bd8:	f9400aab 	ldr	x11, [x21, #16]
    2bdc:	8b0a1136 	add	x22, x9, x10, lsl #4
    2be0:	b82a796c 	str	w12, [x11, x10, lsl #2]
    2be4:	f94006c9 	ldr	x9, [x22, #8]
    2be8:	b4001a29 	cbz	x9, 2f2c <syntax_statement_list+0x744>
    2bec:	f94012aa 	ldr	x10, [x21, #32]
    2bf0:	f94002cb 	ldr	x11, [x22]
    2bf4:	8b0b114a 	add	x10, x10, x11, lsl #4
    2bf8:	b940014b 	ldr	w11, [x10]
    2bfc:	7100057f 	cmp	w11, #0x1
    2c00:	540017c1 	b.ne	2ef8 <syntax_statement_list+0x710>  // b.any
    2c04:	f940054b 	ldr	x11, [x10, #8]
    2c08:	f100053f 	cmp	x9, #0x1
    2c0c:	52800169 	mov	w9, #0xb                   	// #11
    2c10:	b82b7909 	str	w9, [x8, x11, lsl #2]
    2c14:	54ffe320 	b.eq	2878 <syntax_statement_list+0x90>  // b.none
    2c18:	91004158 	add	x24, x10, #0x10
    2c1c:	5280003b 	mov	w27, #0x1                   	// #1
    2c20:	aa1803e0 	mov	x0, x24
    2c24:	aa1503e1 	mov	x1, x21
    2c28:	aa1403e2 	mov	x2, x20
    2c2c:	aa1303e3 	mov	x3, x19
    2c30:	94000127 	bl	30cc <syntax_simple_argument>
    2c34:	f94006c8 	ldr	x8, [x22, #8]
    2c38:	9100077b 	add	x27, x27, #0x1
    2c3c:	91004318 	add	x24, x24, #0x10
    2c40:	eb08037f 	cmp	x27, x8
    2c44:	54fffee3 	b.cc	2c20 <syntax_statement_list+0x438>  // b.lo, b.ul, b.last
    2c48:	17ffff0c 	b	2878 <syntax_statement_list+0x90>
    2c4c:	a9474ff4 	ldp	x20, x19, [sp, #112]
    2c50:	a94657f6 	ldp	x22, x21, [sp, #96]
    2c54:	a9455ff8 	ldp	x24, x23, [sp, #80]
    2c58:	a94467fa 	ldp	x26, x25, [sp, #64]
    2c5c:	a9436ffc 	ldp	x28, x27, [sp, #48]
    2c60:	a9427bfd 	ldp	x29, x30, [sp, #32]
    2c64:	910203ff 	add	sp, sp, #0x80
    2c68:	d65f03c0 	ret
    2c6c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2c70:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2c74:	910a6021 	add	x1, x1, #0x298
    2c78:	f947e673 	ldr	x19, [x19, #4040]
    2c7c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2c80:	910ae842 	add	x2, x2, #0x2ba
    2c84:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2c88:	91366884 	add	x4, x4, #0xd9a
    2c8c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2c90:	9137f8a5 	add	x5, x5, #0xdfe
    2c94:	f9400260 	ldr	x0, [x19]
    2c98:	52803303 	mov	w3, #0x198                 	// #408
    2c9c:	14000107 	b	30b8 <syntax_statement_list+0x8d0>
    2ca0:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2ca4:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2ca8:	910a6021 	add	x1, x1, #0x298
    2cac:	f947e673 	ldr	x19, [x19, #4040]
    2cb0:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2cb4:	910ae842 	add	x2, x2, #0x2ba
    2cb8:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2cbc:	91366884 	add	x4, x4, #0xd9a
    2cc0:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2cc4:	9136c0a5 	add	x5, x5, #0xdb0
    2cc8:	f9400260 	ldr	x0, [x19]
    2ccc:	52803283 	mov	w3, #0x194                 	// #404
    2cd0:	140000fa 	b	30b8 <syntax_statement_list+0x8d0>
    2cd4:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2cd8:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2cdc:	910a6021 	add	x1, x1, #0x298
    2ce0:	f947e673 	ldr	x19, [x19, #4040]
    2ce4:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2ce8:	910ae842 	add	x2, x2, #0x2ba
    2cec:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2cf0:	91366884 	add	x4, x4, #0xd9a
    2cf4:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2cf8:	9137a4a5 	add	x5, x5, #0xde9
    2cfc:	f9400260 	ldr	x0, [x19]
    2d00:	528032c3 	mov	w3, #0x196                 	// #406
    2d04:	140000ed 	b	30b8 <syntax_statement_list+0x8d0>
    2d08:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2d0c:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2d10:	910a6021 	add	x1, x1, #0x298
    2d14:	f947e673 	ldr	x19, [x19, #4040]
    2d18:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2d1c:	910ae842 	add	x2, x2, #0x2ba
    2d20:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2d24:	91366884 	add	x4, x4, #0xd9a
    2d28:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2d2c:	913928a5 	add	x5, x5, #0xe4a
    2d30:	14000018 	b	2d90 <syntax_statement_list+0x5a8>
    2d34:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2d38:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2d3c:	910a6021 	add	x1, x1, #0x298
    2d40:	f947e673 	ldr	x19, [x19, #4040]
    2d44:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2d48:	910ae842 	add	x2, x2, #0x2ba
    2d4c:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2d50:	91366884 	add	x4, x4, #0xd9a
    2d54:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2d58:	913ab4a5 	add	x5, x5, #0xead
    2d5c:	f9400260 	ldr	x0, [x19]
    2d60:	52803403 	mov	w3, #0x1a0                 	// #416
    2d64:	140000d5 	b	30b8 <syntax_statement_list+0x8d0>
    2d68:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2d6c:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2d70:	910a6021 	add	x1, x1, #0x298
    2d74:	f947e673 	ldr	x19, [x19, #4040]
    2d78:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2d7c:	910ae842 	add	x2, x2, #0x2ba
    2d80:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2d84:	91366884 	add	x4, x4, #0xd9a
    2d88:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2d8c:	9138c8a5 	add	x5, x5, #0xe32
    2d90:	f9400260 	ldr	x0, [x19]
    2d94:	528033a3 	mov	w3, #0x19d                 	// #413
    2d98:	140000c8 	b	30b8 <syntax_statement_list+0x8d0>
    2d9c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2da0:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2da4:	910a6021 	add	x1, x1, #0x298
    2da8:	f947e673 	ldr	x19, [x19, #4040]
    2dac:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2db0:	910ae842 	add	x2, x2, #0x2ba
    2db4:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2db8:	91366884 	add	x4, x4, #0xd9a
    2dbc:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2dc0:	9138c8a5 	add	x5, x5, #0xe32
    2dc4:	1400000b 	b	2df0 <syntax_statement_list+0x608>
    2dc8:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2dcc:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2dd0:	910a6021 	add	x1, x1, #0x298
    2dd4:	f947e673 	ldr	x19, [x19, #4040]
    2dd8:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2ddc:	910ae842 	add	x2, x2, #0x2ba
    2de0:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2de4:	91366884 	add	x4, x4, #0xd9a
    2de8:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2dec:	913928a5 	add	x5, x5, #0xe4a
    2df0:	f9400260 	ldr	x0, [x19]
    2df4:	52803563 	mov	w3, #0x1ab                 	// #427
    2df8:	140000b0 	b	30b8 <syntax_statement_list+0x8d0>
    2dfc:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2e00:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2e04:	910a6021 	add	x1, x1, #0x298
    2e08:	f947e673 	ldr	x19, [x19, #4040]
    2e0c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2e10:	910ae842 	add	x2, x2, #0x2ba
    2e14:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2e18:	91366884 	add	x4, x4, #0xd9a
    2e1c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2e20:	913b0ca5 	add	x5, x5, #0xec3
    2e24:	f9400260 	ldr	x0, [x19]
    2e28:	528035c3 	mov	w3, #0x1ae                 	// #430
    2e2c:	140000a3 	b	30b8 <syntax_statement_list+0x8d0>
    2e30:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2e34:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2e38:	910a6021 	add	x1, x1, #0x298
    2e3c:	f947e673 	ldr	x19, [x19, #4040]
    2e40:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2e44:	910ae842 	add	x2, x2, #0x2ba
    2e48:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2e4c:	91366884 	add	x4, x4, #0xd9a
    2e50:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2e54:	9138c8a5 	add	x5, x5, #0xe32
    2e58:	1400000b 	b	2e84 <syntax_statement_list+0x69c>
    2e5c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2e60:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2e64:	910a6021 	add	x1, x1, #0x298
    2e68:	f947e673 	ldr	x19, [x19, #4040]
    2e6c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2e70:	910ae842 	add	x2, x2, #0x2ba
    2e74:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2e78:	91366884 	add	x4, x4, #0xd9a
    2e7c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2e80:	913928a5 	add	x5, x5, #0xe4a
    2e84:	f9400260 	ldr	x0, [x19]
    2e88:	528036c3 	mov	w3, #0x1b6                 	// #438
    2e8c:	1400008b 	b	30b8 <syntax_statement_list+0x8d0>
    2e90:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2e94:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2e98:	910a6021 	add	x1, x1, #0x298
    2e9c:	f947e673 	ldr	x19, [x19, #4040]
    2ea0:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2ea4:	910ae842 	add	x2, x2, #0x2ba
    2ea8:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2eac:	91366884 	add	x4, x4, #0xd9a
    2eb0:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2eb4:	913b0ca5 	add	x5, x5, #0xec3
    2eb8:	f9400260 	ldr	x0, [x19]
    2ebc:	52803723 	mov	w3, #0x1b9                 	// #441
    2ec0:	1400007e 	b	30b8 <syntax_statement_list+0x8d0>
    2ec4:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2ec8:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2ecc:	910a6021 	add	x1, x1, #0x298
    2ed0:	f947e673 	ldr	x19, [x19, #4040]
    2ed4:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2ed8:	910ae842 	add	x2, x2, #0x2ba
    2edc:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2ee0:	913c1884 	add	x4, x4, #0xf06
    2ee4:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2ee8:	911594a5 	add	x5, x5, #0x565
    2eec:	f9400260 	ldr	x0, [x19]
    2ef0:	52803103 	mov	w3, #0x188                 	// #392
    2ef4:	14000071 	b	30b8 <syntax_statement_list+0x8d0>
    2ef8:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2efc:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2f00:	910a6021 	add	x1, x1, #0x298
    2f04:	f947e673 	ldr	x19, [x19, #4040]
    2f08:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2f0c:	910ae842 	add	x2, x2, #0x2ba
    2f10:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2f14:	913c1884 	add	x4, x4, #0xf06
    2f18:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2f1c:	913c98a5 	add	x5, x5, #0xf26
    2f20:	f9400260 	ldr	x0, [x19]
    2f24:	52803003 	mov	w3, #0x180                 	// #384
    2f28:	14000064 	b	30b8 <syntax_statement_list+0x8d0>
    2f2c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2f30:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2f34:	910a6021 	add	x1, x1, #0x298
    2f38:	f947e673 	ldr	x19, [x19, #4040]
    2f3c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2f40:	910ae842 	add	x2, x2, #0x2ba
    2f44:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2f48:	913c1884 	add	x4, x4, #0xf06
    2f4c:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2f50:	913c58a5 	add	x5, x5, #0xf16
    2f54:	f9400260 	ldr	x0, [x19]
    2f58:	52802fc3 	mov	w3, #0x17e                 	// #382
    2f5c:	14000057 	b	30b8 <syntax_statement_list+0x8d0>
    2f60:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2f64:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2f68:	910a6021 	add	x1, x1, #0x298
    2f6c:	f947e673 	ldr	x19, [x19, #4040]
    2f70:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2f74:	910ae842 	add	x2, x2, #0x2ba
    2f78:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2f7c:	91366884 	add	x4, x4, #0xd9a
    2f80:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2f84:	9138c8a5 	add	x5, x5, #0xe32
    2f88:	1400000b 	b	2fb4 <syntax_statement_list+0x7cc>
    2f8c:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2f90:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2f94:	910a6021 	add	x1, x1, #0x298
    2f98:	f947e673 	ldr	x19, [x19, #4040]
    2f9c:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2fa0:	910ae842 	add	x2, x2, #0x2ba
    2fa4:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2fa8:	91366884 	add	x4, x4, #0xd9a
    2fac:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2fb0:	913928a5 	add	x5, x5, #0xe4a
    2fb4:	f9400260 	ldr	x0, [x19]
    2fb8:	52803803 	mov	w3, #0x1c0                 	// #448
    2fbc:	1400003f 	b	30b8 <syntax_statement_list+0x8d0>
    2fc0:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2fc4:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2fc8:	910a6021 	add	x1, x1, #0x298
    2fcc:	f947e673 	ldr	x19, [x19, #4040]
    2fd0:	b0000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    2fd4:	910ae842 	add	x2, x2, #0x2ba
    2fd8:	b0000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    2fdc:	91366884 	add	x4, x4, #0xd9a
    2fe0:	b0000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    2fe4:	913b64a5 	add	x5, x5, #0xed9
    2fe8:	f9400260 	ldr	x0, [x19]
    2fec:	52803863 	mov	w3, #0x1c3                 	// #451
    2ff0:	14000032 	b	30b8 <syntax_statement_list+0x8d0>
    2ff4:	b00000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    2ff8:	b0000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    2ffc:	910a6021 	add	x1, x1, #0x298
    3000:	f947e673 	ldr	x19, [x19, #4040]
    3004:	90000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    3008:	910ae842 	add	x2, x2, #0x2ba
    300c:	90000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    3010:	91366884 	add	x4, x4, #0xd9a
    3014:	90000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    3018:	9138c8a5 	add	x5, x5, #0xe32
    301c:	1400000b 	b	3048 <syntax_statement_list+0x860>
    3020:	900000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    3024:	90000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    3028:	910a6021 	add	x1, x1, #0x298
    302c:	f947e673 	ldr	x19, [x19, #4040]
    3030:	90000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    3034:	910ae842 	add	x2, x2, #0x2ba
    3038:	90000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    303c:	91366884 	add	x4, x4, #0xd9a
    3040:	90000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    3044:	913928a5 	add	x5, x5, #0xe4a
    3048:	f9400260 	ldr	x0, [x19]
    304c:	528038e3 	mov	w3, #0x1c7                 	// #455
    3050:	1400001a 	b	30b8 <syntax_statement_list+0x8d0>
    3054:	900000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    3058:	90000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    305c:	910a6021 	add	x1, x1, #0x298
    3060:	f947e673 	ldr	x19, [x19, #4040]
    3064:	90000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    3068:	910ae842 	add	x2, x2, #0x2ba
    306c:	90000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    3070:	91366884 	add	x4, x4, #0xd9a
    3074:	90000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    3078:	911594a5 	add	x5, x5, #0x565
    307c:	f9400260 	ldr	x0, [x19]
    3080:	52803a03 	mov	w3, #0x1d0                 	// #464
    3084:	1400000d 	b	30b8 <syntax_statement_list+0x8d0>
    3088:	900000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    308c:	90000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    3090:	910a6021 	add	x1, x1, #0x298
    3094:	f947e673 	ldr	x19, [x19, #4040]
    3098:	90000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    309c:	910ae842 	add	x2, x2, #0x2ba
    30a0:	90000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    30a4:	91366884 	add	x4, x4, #0xd9a
    30a8:	90000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    30ac:	911690a5 	add	x5, x5, #0x5a4
    30b0:	f9400260 	ldr	x0, [x19]
    30b4:	528031c3 	mov	w3, #0x18e                 	// #398
    30b8:	97fff6d6 	bl	c10 <fprintf@plt>
    30bc:	f9400261 	ldr	x1, [x19]
    30c0:	52800140 	mov	w0, #0xa                   	// #10
    30c4:	97fff683 	bl	ad0 <fputc@plt>
    30c8:	97fff6a6 	bl	b60 <abort@plt>

00000000000030cc <syntax_simple_argument>:
    30cc:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    30d0:	f9000bf7 	str	x23, [sp, #16]
    30d4:	a90257f6 	stp	x22, x21, [sp, #32]
    30d8:	a9034ff4 	stp	x20, x19, [sp, #48]
    30dc:	910003fd 	mov	x29, sp
    30e0:	b9400008 	ldr	w8, [x0]
    30e4:	7100051f 	cmp	w8, #0x1
    30e8:	540008e1 	b.ne	3204 <syntax_simple_argument+0x138>  // b.any
    30ec:	f9401828 	ldr	x8, [x1, #48]
    30f0:	f9400409 	ldr	x9, [x0, #8]
    30f4:	aa0303f5 	mov	x21, x3
    30f8:	f9000fbf 	str	xzr, [x29, #24]
    30fc:	aa0203f6 	mov	x22, x2
    3100:	aa0003f3 	mov	x19, x0
    3104:	8b090d17 	add	x23, x8, x9, lsl #3
    3108:	aa0103f4 	mov	x20, x1
    310c:	91090040 	add	x0, x2, #0x240
    3110:	52800022 	mov	w2, #0x1                   	// #1
    3114:	2a1f03e4 	mov	w4, wzr
    3118:	b98002e8 	ldrsw	x8, [x23]
    311c:	8b080061 	add	x1, x3, x8
    3120:	910063a3 	add	x3, x29, #0x18
    3124:	97fff6a3 	bl	bb0 <regexec@plt>
    3128:	7100041f 	cmp	w0, #0x1
    312c:	540004e1 	b.ne	31c8 <syntax_simple_argument+0xfc>  // b.any
    3130:	b98002e8 	ldrsw	x8, [x23]
    3134:	910b02c0 	add	x0, x22, #0x2c0
    3138:	910063a3 	add	x3, x29, #0x18
    313c:	52800022 	mov	w2, #0x1                   	// #1
    3140:	2a1f03e4 	mov	w4, wzr
    3144:	8b0802a1 	add	x1, x21, x8
    3148:	97fff69a 	bl	bb0 <regexec@plt>
    314c:	7100041f 	cmp	w0, #0x1
    3150:	54000401 	b.ne	31d0 <syntax_simple_argument+0x104>  // b.any
    3154:	b98002e8 	ldrsw	x8, [x23]
    3158:	910c02c0 	add	x0, x22, #0x300
    315c:	910063a3 	add	x3, x29, #0x18
    3160:	52800022 	mov	w2, #0x1                   	// #1
    3164:	2a1f03e4 	mov	w4, wzr
    3168:	8b0802a1 	add	x1, x21, x8
    316c:	97fff691 	bl	bb0 <regexec@plt>
    3170:	7100041f 	cmp	w0, #0x1
    3174:	54000321 	b.ne	31d8 <syntax_simple_argument+0x10c>  // b.any
    3178:	b98002e8 	ldrsw	x8, [x23]
    317c:	910a02c0 	add	x0, x22, #0x280
    3180:	910063a3 	add	x3, x29, #0x18
    3184:	52800022 	mov	w2, #0x1                   	// #1
    3188:	2a1f03e4 	mov	w4, wzr
    318c:	8b0802a1 	add	x1, x21, x8
    3190:	97fff688 	bl	bb0 <regexec@plt>
    3194:	7100041f 	cmp	w0, #0x1
    3198:	54000241 	b.ne	31e0 <syntax_simple_argument+0x114>  // b.any
    319c:	b98002e8 	ldrsw	x8, [x23]
    31a0:	910d02c0 	add	x0, x22, #0x340
    31a4:	910063a3 	add	x3, x29, #0x18
    31a8:	52800022 	mov	w2, #0x1                   	// #1
    31ac:	2a1f03e4 	mov	w4, wzr
    31b0:	8b0802a1 	add	x1, x21, x8
    31b4:	97fff67f 	bl	bb0 <regexec@plt>
    31b8:	7100041f 	cmp	w0, #0x1
    31bc:	54000460 	b.eq	3248 <syntax_simple_argument+0x17c>  // b.none
    31c0:	52800148 	mov	w8, #0xa                   	// #10
    31c4:	14000008 	b	31e4 <syntax_simple_argument+0x118>
    31c8:	528000c8 	mov	w8, #0x6                   	// #6
    31cc:	14000006 	b	31e4 <syntax_simple_argument+0x118>
    31d0:	528000e8 	mov	w8, #0x7                   	// #7
    31d4:	14000004 	b	31e4 <syntax_simple_argument+0x118>
    31d8:	52800108 	mov	w8, #0x8                   	// #8
    31dc:	14000002 	b	31e4 <syntax_simple_argument+0x118>
    31e0:	52800128 	mov	w8, #0x9                   	// #9
    31e4:	f9402289 	ldr	x9, [x20, #64]
    31e8:	f940066a 	ldr	x10, [x19, #8]
    31ec:	b82a7928 	str	w8, [x9, x10, lsl #2]
    31f0:	a9434ff4 	ldp	x20, x19, [sp, #48]
    31f4:	f9400bf7 	ldr	x23, [sp, #16]
    31f8:	a94257f6 	ldp	x22, x21, [sp, #32]
    31fc:	a8c47bfd 	ldp	x29, x30, [sp], #64
    3200:	d65f03c0 	ret
    3204:	900000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    3208:	90000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    320c:	910a6021 	add	x1, x1, #0x298
    3210:	f947e673 	ldr	x19, [x19, #4040]
    3214:	90000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    3218:	910ae842 	add	x2, x2, #0x2ba
    321c:	90000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    3220:	913bbc84 	add	x4, x4, #0xeef
    3224:	90000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    3228:	913ca8a5 	add	x5, x5, #0xf2a
    322c:	f9400260 	ldr	x0, [x19]
    3230:	52802c63 	mov	w3, #0x163                 	// #355
    3234:	97fff677 	bl	c10 <fprintf@plt>
    3238:	f9400261 	ldr	x1, [x19]
    323c:	52800140 	mov	w0, #0xa                   	// #10
    3240:	97fff624 	bl	ad0 <fputc@plt>
    3244:	97fff647 	bl	b60 <abort@plt>
    3248:	900000f3 	adrp	x19, 1f000 <__abi_tag+0x1ae50>
    324c:	90000001 	adrp	x1, 3000 <syntax_statement_list+0x818>
    3250:	910a6021 	add	x1, x1, #0x298
    3254:	f947e673 	ldr	x19, [x19, #4040]
    3258:	90000002 	adrp	x2, 3000 <syntax_statement_list+0x818>
    325c:	910ae842 	add	x2, x2, #0x2ba
    3260:	90000004 	adrp	x4, 3000 <syntax_statement_list+0x818>
    3264:	913bbc84 	add	x4, x4, #0xeef
    3268:	90000005 	adrp	x5, 3000 <syntax_statement_list+0x818>
    326c:	911594a5 	add	x5, x5, #0x565
    3270:	f9400260 	ldr	x0, [x19]
    3274:	52802e23 	mov	w3, #0x171                 	// #369
    3278:	17ffffef 	b	3234 <syntax_simple_argument+0x168>

Disassembly of section .fini:

000000000000327c <_fini>:
    327c:	d503233f 	paciasp
    3280:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    3284:	910003fd 	mov	x29, sp
    3288:	a8c17bfd 	ldp	x29, x30, [sp], #16
    328c:	d50323bf 	autiasp
    3290:	d65f03c0 	ret
