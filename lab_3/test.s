
./build/test:     file format elf64-littleaarch64


Disassembly of section .init:

00000000000005d0 <_init>:
 5d0:	d503233f 	paciasp
 5d4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 5d8:	910003fd 	mov	x29, sp
 5dc:	94000036 	bl	6b4 <call_weak_fn>
 5e0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 5e4:	d50323bf 	autiasp
 5e8:	d65f03c0 	ret

Disassembly of section .plt:

00000000000005f0 <.plt>:
 5f0:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 5f4:	f00000f0 	adrp	x16, 1f000 <__abi_tag+0x1e708>
 5f8:	f947fe11 	ldr	x17, [x16, #4088]
 5fc:	913fe210 	add	x16, x16, #0xff8
 600:	d61f0220 	br	x17
 604:	d503201f 	nop
 608:	d503201f 	nop
 60c:	d503201f 	nop

0000000000000610 <__libc_start_main@plt>:
 610:	90000110 	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 614:	f9400211 	ldr	x17, [x16]
 618:	91000210 	add	x16, x16, #0x0
 61c:	d61f0220 	br	x17

0000000000000620 <__cxa_finalize@plt>:
 620:	90000110 	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 624:	f9400611 	ldr	x17, [x16, #8]
 628:	91002210 	add	x16, x16, #0x8
 62c:	d61f0220 	br	x17

0000000000000630 <__gmon_start__@plt>:
 630:	90000110 	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 634:	f9400a11 	ldr	x17, [x16, #16]
 638:	91004210 	add	x16, x16, #0x10
 63c:	d61f0220 	br	x17

0000000000000640 <abort@plt>:
 640:	90000110 	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 644:	f9400e11 	ldr	x17, [x16, #24]
 648:	91006210 	add	x16, x16, #0x18
 64c:	d61f0220 	br	x17

0000000000000650 <puts@plt>:
 650:	90000110 	adrp	x16, 20000 <__libc_start_main@GLIBC_2.34>
 654:	f9401211 	ldr	x17, [x16, #32]
 658:	91008210 	add	x16, x16, #0x20
 65c:	d61f0220 	br	x17

Disassembly of section .text:

0000000000000680 <_start>:
 680:	d503245f 	bti	c
 684:	d280001d 	mov	x29, #0x0                   	// #0
 688:	d280001e 	mov	x30, #0x0                   	// #0
 68c:	aa0003e5 	mov	x5, x0
 690:	f94003e1 	ldr	x1, [sp]
 694:	910023e2 	add	x2, sp, #0x8
 698:	910003e6 	mov	x6, sp
 69c:	f00000e0 	adrp	x0, 1f000 <__abi_tag+0x1e708>
 6a0:	f947ec00 	ldr	x0, [x0, #4056]
 6a4:	d2800003 	mov	x3, #0x0                   	// #0
 6a8:	d2800004 	mov	x4, #0x0                   	// #0
 6ac:	97ffffd9 	bl	610 <__libc_start_main@plt>
 6b0:	97ffffe4 	bl	640 <abort@plt>

00000000000006b4 <call_weak_fn>:
 6b4:	f00000e0 	adrp	x0, 1f000 <__abi_tag+0x1e708>
 6b8:	f947e800 	ldr	x0, [x0, #4048]
 6bc:	b4000040 	cbz	x0, 6c4 <call_weak_fn+0x10>
 6c0:	17ffffdc 	b	630 <__gmon_start__@plt>
 6c4:	d65f03c0 	ret
 6c8:	d503201f 	nop
 6cc:	d503201f 	nop
 6d0:	d503201f 	nop
 6d4:	d503201f 	nop
 6d8:	d503201f 	nop
 6dc:	d503201f 	nop

00000000000006e0 <deregister_tm_clones>:
 6e0:	90000100 	adrp	x0, 20000 <__libc_start_main@GLIBC_2.34>
 6e4:	9100e000 	add	x0, x0, #0x38
 6e8:	90000101 	adrp	x1, 20000 <__libc_start_main@GLIBC_2.34>
 6ec:	9100e021 	add	x1, x1, #0x38
 6f0:	eb00003f 	cmp	x1, x0
 6f4:	540000c0 	b.eq	70c <deregister_tm_clones+0x2c>  // b.none
 6f8:	f00000e1 	adrp	x1, 1f000 <__abi_tag+0x1e708>
 6fc:	f947e021 	ldr	x1, [x1, #4032]
 700:	b4000061 	cbz	x1, 70c <deregister_tm_clones+0x2c>
 704:	aa0103f0 	mov	x16, x1
 708:	d61f0200 	br	x16
 70c:	d65f03c0 	ret

0000000000000710 <register_tm_clones>:
 710:	90000100 	adrp	x0, 20000 <__libc_start_main@GLIBC_2.34>
 714:	9100e000 	add	x0, x0, #0x38
 718:	90000101 	adrp	x1, 20000 <__libc_start_main@GLIBC_2.34>
 71c:	9100e021 	add	x1, x1, #0x38
 720:	cb000021 	sub	x1, x1, x0
 724:	d37ffc22 	lsr	x2, x1, #63
 728:	8b810c41 	add	x1, x2, x1, asr #3
 72c:	9341fc21 	asr	x1, x1, #1
 730:	b40000c1 	cbz	x1, 748 <register_tm_clones+0x38>
 734:	f00000e2 	adrp	x2, 1f000 <__abi_tag+0x1e708>
 738:	f947f042 	ldr	x2, [x2, #4064]
 73c:	b4000062 	cbz	x2, 748 <register_tm_clones+0x38>
 740:	aa0203f0 	mov	x16, x2
 744:	d61f0200 	br	x16
 748:	d65f03c0 	ret

000000000000074c <__do_global_dtors_aux>:
 74c:	d503233f 	paciasp
 750:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 754:	910003fd 	mov	x29, sp
 758:	f9000bf3 	str	x19, [sp, #16]
 75c:	90000113 	adrp	x19, 20000 <__libc_start_main@GLIBC_2.34>
 760:	3940e260 	ldrb	w0, [x19, #56]
 764:	37000140 	tbnz	w0, #0, 78c <__do_global_dtors_aux+0x40>
 768:	f00000e0 	adrp	x0, 1f000 <__abi_tag+0x1e708>
 76c:	f947e400 	ldr	x0, [x0, #4040]
 770:	b4000080 	cbz	x0, 780 <__do_global_dtors_aux+0x34>
 774:	90000100 	adrp	x0, 20000 <__libc_start_main@GLIBC_2.34>
 778:	f9401800 	ldr	x0, [x0, #48]
 77c:	97ffffa9 	bl	620 <__cxa_finalize@plt>
 780:	97ffffd8 	bl	6e0 <deregister_tm_clones>
 784:	52800020 	mov	w0, #0x1                   	// #1
 788:	3900e260 	strb	w0, [x19, #56]
 78c:	f9400bf3 	ldr	x19, [sp, #16]
 790:	a8c27bfd 	ldp	x29, x30, [sp], #32
 794:	d50323bf 	autiasp
 798:	d65f03c0 	ret
 79c:	d503201f 	nop

00000000000007a0 <frame_dummy>:
 7a0:	d503245f 	bti	c
 7a4:	17ffffdb 	b	710 <register_tm_clones>

00000000000007a8 <main>:
 7a8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 7ac:	910003fd 	mov	x29, sp
 7b0:	90000000 	adrp	x0, 0 <_init-0x5d0>
 7b4:	911f9000 	add	x0, x0, #0x7e4
 7b8:	97ffffa6 	bl	650 <puts@plt>
 7bc:	2a1f03e0 	mov	w0, wzr
 7c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 7c4:	d65f03c0 	ret

Disassembly of section .fini:

00000000000007c8 <_fini>:
 7c8:	d503233f 	paciasp
 7cc:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 7d0:	910003fd 	mov	x29, sp
 7d4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 7d8:	d50323bf 	autiasp
 7dc:	d65f03c0 	ret
