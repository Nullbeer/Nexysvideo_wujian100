
.//Obj/wujian100_open-hello_world.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <Reset_Handler>:
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
.option push
.option norelax
    la      gp, __global_pointer$
       0:	20000197          	auipc	gp,0x20000
       4:	4e818193          	addi	gp,gp,1256 # 200004e8 <_impure_ptr>
.option pop
    la      a0, Default_Handler
       8:	00000517          	auipc	a0,0x0
       c:	1b850513          	addi	a0,a0,440 # 1c0 <Default_Handler>
    ori     a0, a0, 3
      10:	00356513          	ori	a0,a0,3
    csrw    mtvec, a0
      14:	30551073          	csrw	mtvec,a0

    la      a0, __Vectors
      18:	b1818513          	addi	a0,gp,-1256 # 20000000 <__Vectors>
    csrw    mtvt, a0
      1c:	30751073          	csrw	mtvt,a0

    la      sp, g_top_irqstack
      20:	20001117          	auipc	sp,0x20001
      24:	54010113          	addi	sp,sp,1344 # 20001560 <g_top_irqstack>

    /* Load data section */
    la      a0, __erodata
      28:	00009517          	auipc	a0,0x9
      2c:	83850513          	addi	a0,a0,-1992 # 8860 <__ctor_end__>
    la      a1, __data_start__
      30:	b1818593          	addi	a1,gp,-1256 # 20000000 <__Vectors>
    la      a2, __data_end__
      34:	00c18613          	addi	a2,gp,12 # 200004f4 <errno>
    bgeu    a1, a2, 2f
      38:	00c5fa63          	bgeu	a1,a2,4c <Reset_Handler+0x4c>
1:
    lw      t0, (a0)
      3c:	00052283          	lw	t0,0(a0)
    sw      t0, (a1)
      40:	0055a023          	sw	t0,0(a1)
    addi    a0, a0, 4
      44:	0511                	addi	a0,a0,4
    addi    a1, a1, 4
      46:	0591                	addi	a1,a1,4
    bltu    a1, a2, 1b
      48:	fec5eae3          	bltu	a1,a2,3c <Reset_Handler+0x3c>
2:

    /* Clear bss section */
    la      a0, __bss_start__
      4c:	00c18513          	addi	a0,gp,12 # 200004f4 <errno>
    la      a1, __bss_end__
      50:	20002597          	auipc	a1,0x20002
      54:	24058593          	addi	a1,a1,576 # 20002290 <__bss_end__>
    bgeu    a0, a1, 2f
      58:	00b57763          	bgeu	a0,a1,66 <Reset_Handler+0x66>
1:
    sw      zero, (a0)
      5c:	00052023          	sw	zero,0(a0)
    addi    a0, a0, 4
      60:	0511                	addi	a0,a0,4
    bltu    a0, a1, 1b
      62:	feb56de3          	bltu	a0,a1,5c <Reset_Handler+0x5c>
2:

#ifndef __NO_SYSTEM_INIT
    jal     SystemInit
      66:	4bd030ef          	jal	ra,3d22 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal     board_init
      6a:	3cd020ef          	jal	ra,2c36 <board_init>
#endif

    jal     main
      6e:	042040ef          	jal	ra,40b0 <main>

00000072 <__exit>:

    .size   Reset_Handler, . - Reset_Handler

__exit:
    j      __exit
      72:	a001                	j	72 <__exit>
	...

00000080 <Default_IRQHandler>:
    .align  2
    .global Default_IRQHandler
    .weak   Default_IRQHandler
    .type   Default_IRQHandler, %function
Default_IRQHandler:
    addi    sp, sp, -48
      80:	7179                	addi	sp,sp,-48
    sw      t0, 4(sp)
      82:	c216                	sw	t0,4(sp)
    sw      t1, 8(sp)
      84:	c41a                	sw	t1,8(sp)
    csrr    t0, mepc
      86:	341022f3          	csrr	t0,mepc
    csrr    t1, mcause
      8a:	34202373          	csrr	t1,mcause
    sw      t1, 40(sp)
      8e:	d41a                	sw	t1,40(sp)
    sw      t0, 44(sp)
      90:	d616                	sw	t0,44(sp)
    csrs    mstatus, 8
      92:	30046073          	csrsi	mstatus,8

    sw      ra, 0(sp)
      96:	c006                	sw	ra,0(sp)
    sw      t2, 12(sp)
      98:	c61e                	sw	t2,12(sp)
    sw      a0, 16(sp)
      9a:	c82a                	sw	a0,16(sp)
    sw      a1, 20(sp)
      9c:	ca2e                	sw	a1,20(sp)
    sw      a2, 24(sp)
      9e:	cc32                	sw	a2,24(sp)
    sw      a3, 28(sp)
      a0:	ce36                	sw	a3,28(sp)
    sw      a4, 32(sp)
      a2:	d03a                	sw	a4,32(sp)
    sw      a5, 36(sp)
      a4:	d23e                	sw	a5,36(sp)

    andi    t1, t1, 0x3FF
      a6:	3ff37313          	andi	t1,t1,1023
    slli    t1, t1, 2
      aa:	030a                	slli	t1,t1,0x2

    la      t0, g_irqvector
      ac:	20002297          	auipc	t0,0x20002
      b0:	b8428293          	addi	t0,t0,-1148 # 20001c30 <g_irqvector>
    add     t0, t0, t1
      b4:	929a                	add	t0,t0,t1
    lw      t2, (t0)
      b6:	0002a383          	lw	t2,0(t0)
    jalr    t2
      ba:	9382                	jalr	t2

    csrc    mstatus, 8
      bc:	30047073          	csrci	mstatus,8

    lw      a1, 40(sp)
      c0:	55a2                	lw	a1,40(sp)
    andi    a0, a1, 0x3FF
      c2:	3ff5f513          	andi	a0,a1,1023

    /* clear pending */
    li      a2, 0xE000E100
      c6:	e000e637          	lui	a2,0xe000e
      ca:	10060613          	addi	a2,a2,256 # e000e100 <__heap_end+0xbffde100>
    add     a2, a2, a0
      ce:	962a                	add	a2,a2,a0
    lb      a3, 0(a2)
      d0:	00060683          	lb	a3,0(a2)
    li      a4, 1
      d4:	4705                	li	a4,1
    not     a4, a4
      d6:	fff74713          	not	a4,a4
    and     a5, a4, a3
      da:	00d777b3          	and	a5,a4,a3
    sb      a5, 0(a2)
      de:	00f60023          	sb	a5,0(a2)

    li      t0, MSTATUS_PRV1
      e2:	6289                	lui	t0,0x2
      e4:	88028293          	addi	t0,t0,-1920 # 1880 <__muldf3+0x25c>
    csrs    mstatus, t0
      e8:	3002a073          	csrs	mstatus,t0
    csrw    mcause, a1
      ec:	34259073          	csrw	mcause,a1
    lw      t0, 44(sp)
      f0:	52b2                	lw	t0,44(sp)
    csrw    mepc, t0
      f2:	34129073          	csrw	mepc,t0
    lw      ra, 0(sp)
      f6:	4082                	lw	ra,0(sp)
    lw      t0, 4(sp)
      f8:	4292                	lw	t0,4(sp)
    lw      t1, 8(sp)
      fa:	4322                	lw	t1,8(sp)
    lw      t2, 12(sp)
      fc:	43b2                	lw	t2,12(sp)
    lw      a0, 16(sp)
      fe:	4542                	lw	a0,16(sp)
    lw      a1, 20(sp)
     100:	45d2                	lw	a1,20(sp)
    lw      a2, 24(sp)
     102:	4662                	lw	a2,24(sp)
    lw      a3, 28(sp)
     104:	46f2                	lw	a3,28(sp)
    lw      a4, 32(sp)
     106:	5702                	lw	a4,32(sp)
    lw      a5, 36(sp)
     108:	5792                	lw	a5,36(sp)

    addi    sp, sp, 48
     10a:	6145                	addi	sp,sp,48
    mret
     10c:	30200073          	mret

00000110 <trap>:
    .align  2
    .global trap
    .type   trap, %function
trap:
    /* Check for interrupt */
    addi    sp, sp, -4
     110:	1171                	addi	sp,sp,-4
    sw      t0, 0x0(sp)
     112:	c016                	sw	t0,0(sp)
    csrr    t0, mcause
     114:	342022f3          	csrr	t0,mcause

    blt     t0, x0, .Lirq
     118:	0602c463          	bltz	t0,180 <trap+0x70>

    addi    sp, sp, 4
     11c:	0111                	addi	sp,sp,4

    la      t0, g_trap_sp
     11e:	20001297          	auipc	t0,0x20001
     122:	64228293          	addi	t0,t0,1602 # 20001760 <g_trap_sp>
    addi    t0, t0, -68
     126:	fbc28293          	addi	t0,t0,-68
    sw      x1, 0(t0)
     12a:	0012a023          	sw	ra,0(t0)
    sw      x2, 4(t0)
     12e:	0022a223          	sw	sp,4(t0)
    sw      x3, 8(t0)
     132:	0032a423          	sw	gp,8(t0)
    sw      x4, 12(t0)
     136:	0042a623          	sw	tp,12(t0)
    sw      x6, 20(t0)
     13a:	0062aa23          	sw	t1,20(t0)
    sw      x7, 24(t0)
     13e:	0072ac23          	sw	t2,24(t0)
    sw      x8, 28(t0)
     142:	0082ae23          	sw	s0,28(t0)
    sw      x9, 32(t0)
     146:	0292a023          	sw	s1,32(t0)
    sw      x10, 36(t0)
     14a:	02a2a223          	sw	a0,36(t0)
    sw      x11, 40(t0)
     14e:	02b2a423          	sw	a1,40(t0)
    sw      x12, 44(t0)
     152:	02c2a623          	sw	a2,44(t0)
    sw      x13, 48(t0)
     156:	02d2a823          	sw	a3,48(t0)
    sw      x14, 52(t0)
     15a:	02e2aa23          	sw	a4,52(t0)
    sw      x15, 56(t0)
     15e:	02f2ac23          	sw	a5,56(t0)
    csrr    a0, mepc
     162:	34102573          	csrr	a0,mepc
    sw      a0, 60(t0)
     166:	02a2ae23          	sw	a0,60(t0)
    csrr    a0, mstatus
     16a:	30002573          	csrr	a0,mstatus
    sw      a0, 64(t0)
     16e:	04a2a023          	sw	a0,64(t0)

    mv      a0, t0
     172:	8516                	mv	a0,t0
    lw      t0, -4(sp)
     174:	ffc12283          	lw	t0,-4(sp)
    mv      sp, a0
     178:	812a                	mv	sp,a0
    sw      t0, 16(sp)
     17a:	c816                	sw	t0,16(sp)

    jal     trap_c
     17c:	405030ef          	jal	ra,3d80 <trap_c>


.Lirq:
    lw      t0, 0x0(sp)
     180:	4282                	lw	t0,0(sp)
    addi    sp, sp, 4
     182:	0111                	addi	sp,sp,4
    j       Default_IRQHandler
     184:	efdff06f          	j	80 <Default_IRQHandler>
     188:	00000013          	nop
     18c:	00000013          	nop
     190:	00000013          	nop
     194:	00000013          	nop
     198:	00000013          	nop
     19c:	00000013          	nop
     1a0:	00000013          	nop
     1a4:	00000013          	nop
     1a8:	00000013          	nop
     1ac:	00000013          	nop
     1b0:	00000013          	nop
     1b4:	00000013          	nop
     1b8:	00000013          	nop
     1bc:	00000013          	nop

000001c0 <Default_Handler>:
    .align  6
    .weak   Default_Handler
    .global Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    j      trap
     1c0:	bf81                	j	110 <trap>
	...

000001f6 <__udivdi3>:
     1f6:	1161                	addi	sp,sp,-8
     1f8:	c222                	sw	s0,4(sp)
     1fa:	c026                	sw	s1,0(sp)
     1fc:	82aa                	mv	t0,a0
     1fe:	87ae                	mv	a5,a1
     200:	20069e63          	bnez	a3,41c <__min_heap_size+0x21c>
     204:	85b6                	mv	a1,a3
     206:	8332                	mv	t1,a2
     208:	83aa                	mv	t2,a0
     20a:	00007697          	auipc	a3,0x7
     20e:	07e68693          	addi	a3,a3,126 # 7288 <__clz_tab>
     212:	0cc7f263          	bgeu	a5,a2,2d6 <__min_heap_size+0xd6>
     216:	6741                	lui	a4,0x10
     218:	853e                	mv	a0,a5
     21a:	0ae67763          	bgeu	a2,a4,2c8 <__min_heap_size+0xc8>
     21e:	0ff00713          	li	a4,255
     222:	00c73733          	sltu	a4,a4,a2
     226:	070e                	slli	a4,a4,0x3
     228:	00e655b3          	srl	a1,a2,a4
     22c:	96ae                	add	a3,a3,a1
     22e:	0006c683          	lbu	a3,0(a3)
     232:	9736                	add	a4,a4,a3
     234:	02000693          	li	a3,32
     238:	40e68433          	sub	s0,a3,a4
     23c:	00e68c63          	beq	a3,a4,254 <__min_heap_size+0x54>
     240:	008796b3          	sll	a3,a5,s0
     244:	00e2d733          	srl	a4,t0,a4
     248:	00861333          	sll	t1,a2,s0
     24c:	00d76533          	or	a0,a4,a3
     250:	008293b3          	sll	t2,t0,s0
     254:	01035593          	srli	a1,t1,0x10
     258:	02b556b3          	divu	a3,a0,a1
     25c:	01031613          	slli	a2,t1,0x10
     260:	8241                	srli	a2,a2,0x10
     262:	0103d793          	srli	a5,t2,0x10
     266:	02b57733          	remu	a4,a0,a1
     26a:	8536                	mv	a0,a3
     26c:	02d602b3          	mul	t0,a2,a3
     270:	0742                	slli	a4,a4,0x10
     272:	8fd9                	or	a5,a5,a4
     274:	0057fc63          	bgeu	a5,t0,28c <__min_heap_size+0x8c>
     278:	979a                	add	a5,a5,t1
     27a:	fff68513          	addi	a0,a3,-1
     27e:	0067e763          	bltu	a5,t1,28c <__min_heap_size+0x8c>
     282:	0057f563          	bgeu	a5,t0,28c <__min_heap_size+0x8c>
     286:	ffe68513          	addi	a0,a3,-2
     28a:	979a                	add	a5,a5,t1
     28c:	405787b3          	sub	a5,a5,t0
     290:	02b7f733          	remu	a4,a5,a1
     294:	03c2                	slli	t2,t2,0x10
     296:	0103d393          	srli	t2,t2,0x10
     29a:	02b7d7b3          	divu	a5,a5,a1
     29e:	0742                	slli	a4,a4,0x10
     2a0:	007763b3          	or	t2,a4,t2
     2a4:	02f60633          	mul	a2,a2,a5
     2a8:	873e                	mv	a4,a5
     2aa:	00c3fb63          	bgeu	t2,a2,2c0 <__min_heap_size+0xc0>
     2ae:	939a                	add	t2,t2,t1
     2b0:	fff78713          	addi	a4,a5,-1
     2b4:	0063e663          	bltu	t2,t1,2c0 <__min_heap_size+0xc0>
     2b8:	00c3f463          	bgeu	t2,a2,2c0 <__min_heap_size+0xc0>
     2bc:	ffe78713          	addi	a4,a5,-2
     2c0:	0542                	slli	a0,a0,0x10
     2c2:	8d59                	or	a0,a0,a4
     2c4:	4581                	li	a1,0
     2c6:	a855                	j	37a <__min_heap_size+0x17a>
     2c8:	010005b7          	lui	a1,0x1000
     2cc:	4741                	li	a4,16
     2ce:	f4b66de3          	bltu	a2,a1,228 <__min_heap_size+0x28>
     2d2:	4761                	li	a4,24
     2d4:	bf91                	j	228 <__min_heap_size+0x28>
     2d6:	e601                	bnez	a2,2de <__min_heap_size+0xde>
     2d8:	4705                	li	a4,1
     2da:	02c75333          	divu	t1,a4,a2
     2de:	6741                	lui	a4,0x10
     2e0:	0ae37163          	bgeu	t1,a4,382 <__min_heap_size+0x182>
     2e4:	0ff00713          	li	a4,255
     2e8:	00677363          	bgeu	a4,t1,2ee <__min_heap_size+0xee>
     2ec:	45a1                	li	a1,8
     2ee:	00b35733          	srl	a4,t1,a1
     2f2:	96ba                	add	a3,a3,a4
     2f4:	0006c703          	lbu	a4,0(a3)
     2f8:	02000693          	li	a3,32
     2fc:	972e                	add	a4,a4,a1
     2fe:	40e68533          	sub	a0,a3,a4
     302:	08e69763          	bne	a3,a4,390 <__min_heap_size+0x190>
     306:	406787b3          	sub	a5,a5,t1
     30a:	4585                	li	a1,1
     30c:	01035293          	srli	t0,t1,0x10
     310:	01031613          	slli	a2,t1,0x10
     314:	8241                	srli	a2,a2,0x10
     316:	0103d713          	srli	a4,t2,0x10
     31a:	0257f6b3          	remu	a3,a5,t0
     31e:	0257d7b3          	divu	a5,a5,t0
     322:	06c2                	slli	a3,a3,0x10
     324:	8f55                	or	a4,a4,a3
     326:	02f60433          	mul	s0,a2,a5
     32a:	853e                	mv	a0,a5
     32c:	00877c63          	bgeu	a4,s0,344 <__min_heap_size+0x144>
     330:	971a                	add	a4,a4,t1
     332:	fff78513          	addi	a0,a5,-1
     336:	00676763          	bltu	a4,t1,344 <__min_heap_size+0x144>
     33a:	00877563          	bgeu	a4,s0,344 <__min_heap_size+0x144>
     33e:	ffe78513          	addi	a0,a5,-2
     342:	971a                	add	a4,a4,t1
     344:	8f01                	sub	a4,a4,s0
     346:	025777b3          	remu	a5,a4,t0
     34a:	03c2                	slli	t2,t2,0x10
     34c:	0103d393          	srli	t2,t2,0x10
     350:	02575733          	divu	a4,a4,t0
     354:	07c2                	slli	a5,a5,0x10
     356:	0077e3b3          	or	t2,a5,t2
     35a:	02e60633          	mul	a2,a2,a4
     35e:	87ba                	mv	a5,a4
     360:	00c3fb63          	bgeu	t2,a2,376 <__min_heap_size+0x176>
     364:	939a                	add	t2,t2,t1
     366:	fff70793          	addi	a5,a4,-1 # ffff <__ctor_end__+0x779f>
     36a:	0063e663          	bltu	t2,t1,376 <__min_heap_size+0x176>
     36e:	00c3f463          	bgeu	t2,a2,376 <__min_heap_size+0x176>
     372:	ffe70793          	addi	a5,a4,-2
     376:	0542                	slli	a0,a0,0x10
     378:	8d5d                	or	a0,a0,a5
     37a:	4412                	lw	s0,4(sp)
     37c:	4482                	lw	s1,0(sp)
     37e:	0121                	addi	sp,sp,8
     380:	8082                	ret
     382:	01000737          	lui	a4,0x1000
     386:	45c1                	li	a1,16
     388:	f6e363e3          	bltu	t1,a4,2ee <__min_heap_size+0xee>
     38c:	45e1                	li	a1,24
     38e:	b785                	j	2ee <__min_heap_size+0xee>
     390:	00a31333          	sll	t1,t1,a0
     394:	00e7d6b3          	srl	a3,a5,a4
     398:	00a293b3          	sll	t2,t0,a0
     39c:	00a797b3          	sll	a5,a5,a0
     3a0:	01035513          	srli	a0,t1,0x10
     3a4:	00e2d733          	srl	a4,t0,a4
     3a8:	02a6d2b3          	divu	t0,a3,a0
     3ac:	00f76633          	or	a2,a4,a5
     3b0:	01031793          	slli	a5,t1,0x10
     3b4:	83c1                	srli	a5,a5,0x10
     3b6:	01065593          	srli	a1,a2,0x10
     3ba:	02a6f733          	remu	a4,a3,a0
     3be:	025786b3          	mul	a3,a5,t0
     3c2:	0742                	slli	a4,a4,0x10
     3c4:	8f4d                	or	a4,a4,a1
     3c6:	8596                	mv	a1,t0
     3c8:	00d77c63          	bgeu	a4,a3,3e0 <__min_heap_size+0x1e0>
     3cc:	971a                	add	a4,a4,t1
     3ce:	fff28593          	addi	a1,t0,-1
     3d2:	00676763          	bltu	a4,t1,3e0 <__min_heap_size+0x1e0>
     3d6:	00d77563          	bgeu	a4,a3,3e0 <__min_heap_size+0x1e0>
     3da:	ffe28593          	addi	a1,t0,-2
     3de:	971a                	add	a4,a4,t1
     3e0:	40d706b3          	sub	a3,a4,a3
     3e4:	02a6f733          	remu	a4,a3,a0
     3e8:	02a6d6b3          	divu	a3,a3,a0
     3ec:	0742                	slli	a4,a4,0x10
     3ee:	02d78533          	mul	a0,a5,a3
     3f2:	01061793          	slli	a5,a2,0x10
     3f6:	83c1                	srli	a5,a5,0x10
     3f8:	8fd9                	or	a5,a5,a4
     3fa:	8736                	mv	a4,a3
     3fc:	00a7fc63          	bgeu	a5,a0,414 <__min_heap_size+0x214>
     400:	979a                	add	a5,a5,t1
     402:	fff68713          	addi	a4,a3,-1
     406:	0067e763          	bltu	a5,t1,414 <__min_heap_size+0x214>
     40a:	00a7f563          	bgeu	a5,a0,414 <__min_heap_size+0x214>
     40e:	ffe68713          	addi	a4,a3,-2
     412:	979a                	add	a5,a5,t1
     414:	05c2                	slli	a1,a1,0x10
     416:	8f89                	sub	a5,a5,a0
     418:	8dd9                	or	a1,a1,a4
     41a:	bdcd                	j	30c <__min_heap_size+0x10c>
     41c:	12d5ef63          	bltu	a1,a3,55a <__min_heap_size+0x35a>
     420:	6741                	lui	a4,0x10
     422:	02e6ff63          	bgeu	a3,a4,460 <__min_heap_size+0x260>
     426:	0ff00713          	li	a4,255
     42a:	00d73733          	sltu	a4,a4,a3
     42e:	070e                	slli	a4,a4,0x3
     430:	00e6d533          	srl	a0,a3,a4
     434:	00007597          	auipc	a1,0x7
     438:	e5458593          	addi	a1,a1,-428 # 7288 <__clz_tab>
     43c:	95aa                	add	a1,a1,a0
     43e:	0005c583          	lbu	a1,0(a1)
     442:	02000513          	li	a0,32
     446:	972e                	add	a4,a4,a1
     448:	40e505b3          	sub	a1,a0,a4
     44c:	02e51163          	bne	a0,a4,46e <__min_heap_size+0x26e>
     450:	4505                	li	a0,1
     452:	f2f6e4e3          	bltu	a3,a5,37a <__min_heap_size+0x17a>
     456:	00c2b633          	sltu	a2,t0,a2
     45a:	00164513          	xori	a0,a2,1
     45e:	bf31                	j	37a <__min_heap_size+0x17a>
     460:	010005b7          	lui	a1,0x1000
     464:	4741                	li	a4,16
     466:	fcb6e5e3          	bltu	a3,a1,430 <__min_heap_size+0x230>
     46a:	4761                	li	a4,24
     46c:	b7d1                	j	430 <__min_heap_size+0x230>
     46e:	00e65333          	srl	t1,a2,a4
     472:	00b696b3          	sll	a3,a3,a1
     476:	00d36333          	or	t1,t1,a3
     47a:	00e7d3b3          	srl	t2,a5,a4
     47e:	01035413          	srli	s0,t1,0x10
     482:	0283f6b3          	remu	a3,t2,s0
     486:	01031513          	slli	a0,t1,0x10
     48a:	8141                	srli	a0,a0,0x10
     48c:	00e2d733          	srl	a4,t0,a4
     490:	00b797b3          	sll	a5,a5,a1
     494:	8fd9                	or	a5,a5,a4
     496:	0107d713          	srli	a4,a5,0x10
     49a:	00b61633          	sll	a2,a2,a1
     49e:	0283d3b3          	divu	t2,t2,s0
     4a2:	06c2                	slli	a3,a3,0x10
     4a4:	8ed9                	or	a3,a3,a4
     4a6:	027504b3          	mul	s1,a0,t2
     4aa:	871e                	mv	a4,t2
     4ac:	0096fc63          	bgeu	a3,s1,4c4 <__min_heap_size+0x2c4>
     4b0:	969a                	add	a3,a3,t1
     4b2:	fff38713          	addi	a4,t2,-1
     4b6:	0066e763          	bltu	a3,t1,4c4 <__min_heap_size+0x2c4>
     4ba:	0096f563          	bgeu	a3,s1,4c4 <__min_heap_size+0x2c4>
     4be:	ffe38713          	addi	a4,t2,-2
     4c2:	969a                	add	a3,a3,t1
     4c4:	8e85                	sub	a3,a3,s1
     4c6:	0286f3b3          	remu	t2,a3,s0
     4ca:	07c2                	slli	a5,a5,0x10
     4cc:	83c1                	srli	a5,a5,0x10
     4ce:	0286d6b3          	divu	a3,a3,s0
     4d2:	03c2                	slli	t2,t2,0x10
     4d4:	00f3e7b3          	or	a5,t2,a5
     4d8:	02d50533          	mul	a0,a0,a3
     4dc:	83b6                	mv	t2,a3
     4de:	00a7fc63          	bgeu	a5,a0,4f6 <__min_heap_size+0x2f6>
     4e2:	979a                	add	a5,a5,t1
     4e4:	fff68393          	addi	t2,a3,-1
     4e8:	0067e763          	bltu	a5,t1,4f6 <__min_heap_size+0x2f6>
     4ec:	00a7f563          	bgeu	a5,a0,4f6 <__min_heap_size+0x2f6>
     4f0:	ffe68393          	addi	t2,a3,-2
     4f4:	979a                	add	a5,a5,t1
     4f6:	8f89                	sub	a5,a5,a0
     4f8:	6441                	lui	s0,0x10
     4fa:	01071513          	slli	a0,a4,0x10
     4fe:	00756533          	or	a0,a0,t2
     502:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0x779f>
     506:	00e573b3          	and	t2,a0,a4
     50a:	01055693          	srli	a3,a0,0x10
     50e:	8f71                	and	a4,a4,a2
     510:	8241                	srli	a2,a2,0x10
     512:	02e38333          	mul	t1,t2,a4
     516:	02e68733          	mul	a4,a3,a4
     51a:	02c383b3          	mul	t2,t2,a2
     51e:	02c686b3          	mul	a3,a3,a2
     522:	93ba                	add	t2,t2,a4
     524:	01035613          	srli	a2,t1,0x10
     528:	961e                	add	a2,a2,t2
     52a:	00e67363          	bgeu	a2,a4,530 <__min_heap_size+0x330>
     52e:	96a2                	add	a3,a3,s0
     530:	01065713          	srli	a4,a2,0x10
     534:	96ba                	add	a3,a3,a4
     536:	02d7e063          	bltu	a5,a3,556 <__min_heap_size+0x356>
     53a:	d8d795e3          	bne	a5,a3,2c4 <__min_heap_size+0xc4>
     53e:	67c1                	lui	a5,0x10
     540:	17fd                	addi	a5,a5,-1
     542:	8e7d                	and	a2,a2,a5
     544:	0642                	slli	a2,a2,0x10
     546:	00f37333          	and	t1,t1,a5
     54a:	00b292b3          	sll	t0,t0,a1
     54e:	961a                	add	a2,a2,t1
     550:	4581                	li	a1,0
     552:	e2c2f4e3          	bgeu	t0,a2,37a <__min_heap_size+0x17a>
     556:	157d                	addi	a0,a0,-1
     558:	b3b5                	j	2c4 <__min_heap_size+0xc4>
     55a:	4581                	li	a1,0
     55c:	4501                	li	a0,0
     55e:	bd31                	j	37a <__min_heap_size+0x17a>

00000560 <__umoddi3>:
     560:	1151                	addi	sp,sp,-12
     562:	c422                	sw	s0,8(sp)
     564:	c226                	sw	s1,4(sp)
     566:	87aa                	mv	a5,a0
     568:	872e                	mv	a4,a1
     56a:	1c069a63          	bnez	a3,73e <__umoddi3+0x1de>
     56e:	8336                	mv	t1,a3
     570:	8432                	mv	s0,a2
     572:	00007697          	auipc	a3,0x7
     576:	d1668693          	addi	a3,a3,-746 # 7288 <__clz_tab>
     57a:	0ac5fa63          	bgeu	a1,a2,62e <__umoddi3+0xce>
     57e:	62c1                	lui	t0,0x10
     580:	0a567063          	bgeu	a2,t0,620 <__umoddi3+0xc0>
     584:	0ff00293          	li	t0,255
     588:	00c2f363          	bgeu	t0,a2,58e <__umoddi3+0x2e>
     58c:	4321                	li	t1,8
     58e:	006652b3          	srl	t0,a2,t1
     592:	9696                	add	a3,a3,t0
     594:	0006c683          	lbu	a3,0(a3)
     598:	9336                	add	t1,t1,a3
     59a:	02000693          	li	a3,32
     59e:	406682b3          	sub	t0,a3,t1
     5a2:	00668c63          	beq	a3,t1,5ba <__umoddi3+0x5a>
     5a6:	005595b3          	sll	a1,a1,t0
     5aa:	00655333          	srl	t1,a0,t1
     5ae:	00561433          	sll	s0,a2,t0
     5b2:	00b36733          	or	a4,t1,a1
     5b6:	005517b3          	sll	a5,a0,t0
     5ba:	01045393          	srli	t2,s0,0x10
     5be:	02777633          	remu	a2,a4,t2
     5c2:	01041513          	slli	a0,s0,0x10
     5c6:	8141                	srli	a0,a0,0x10
     5c8:	0107d693          	srli	a3,a5,0x10
     5cc:	02775733          	divu	a4,a4,t2
     5d0:	0642                	slli	a2,a2,0x10
     5d2:	8ed1                	or	a3,a3,a2
     5d4:	02e50733          	mul	a4,a0,a4
     5d8:	00e6f863          	bgeu	a3,a4,5e8 <__umoddi3+0x88>
     5dc:	96a2                	add	a3,a3,s0
     5de:	0086e563          	bltu	a3,s0,5e8 <__umoddi3+0x88>
     5e2:	00e6f363          	bgeu	a3,a4,5e8 <__umoddi3+0x88>
     5e6:	96a2                	add	a3,a3,s0
     5e8:	8e99                	sub	a3,a3,a4
     5ea:	0276f733          	remu	a4,a3,t2
     5ee:	07c2                	slli	a5,a5,0x10
     5f0:	83c1                	srli	a5,a5,0x10
     5f2:	0276d6b3          	divu	a3,a3,t2
     5f6:	02d506b3          	mul	a3,a0,a3
     5fa:	01071513          	slli	a0,a4,0x10
     5fe:	8fc9                	or	a5,a5,a0
     600:	00d7f863          	bgeu	a5,a3,610 <__umoddi3+0xb0>
     604:	97a2                	add	a5,a5,s0
     606:	0087e563          	bltu	a5,s0,610 <__umoddi3+0xb0>
     60a:	00d7f363          	bgeu	a5,a3,610 <__umoddi3+0xb0>
     60e:	97a2                	add	a5,a5,s0
     610:	8f95                	sub	a5,a5,a3
     612:	0057d533          	srl	a0,a5,t0
     616:	4581                	li	a1,0
     618:	4422                	lw	s0,8(sp)
     61a:	4492                	lw	s1,4(sp)
     61c:	0131                	addi	sp,sp,12
     61e:	8082                	ret
     620:	010002b7          	lui	t0,0x1000
     624:	4341                	li	t1,16
     626:	f65664e3          	bltu	a2,t0,58e <__umoddi3+0x2e>
     62a:	4361                	li	t1,24
     62c:	b78d                	j	58e <__umoddi3+0x2e>
     62e:	e601                	bnez	a2,636 <__umoddi3+0xd6>
     630:	4705                	li	a4,1
     632:	02c75433          	divu	s0,a4,a2
     636:	6741                	lui	a4,0x10
     638:	08e47163          	bgeu	s0,a4,6ba <__umoddi3+0x15a>
     63c:	0ff00713          	li	a4,255
     640:	00877363          	bgeu	a4,s0,646 <__umoddi3+0xe6>
     644:	4321                	li	t1,8
     646:	00645733          	srl	a4,s0,t1
     64a:	96ba                	add	a3,a3,a4
     64c:	0006c603          	lbu	a2,0(a3)
     650:	02000713          	li	a4,32
     654:	9332                	add	t1,t1,a2
     656:	406702b3          	sub	t0,a4,t1
     65a:	06671763          	bne	a4,t1,6c8 <__umoddi3+0x168>
     65e:	8d81                	sub	a1,a1,s0
     660:	01045693          	srli	a3,s0,0x10
     664:	01041513          	slli	a0,s0,0x10
     668:	8141                	srli	a0,a0,0x10
     66a:	0107d613          	srli	a2,a5,0x10
     66e:	02d5f733          	remu	a4,a1,a3
     672:	02d5d5b3          	divu	a1,a1,a3
     676:	0742                	slli	a4,a4,0x10
     678:	8f51                	or	a4,a4,a2
     67a:	02b505b3          	mul	a1,a0,a1
     67e:	00b77863          	bgeu	a4,a1,68e <__umoddi3+0x12e>
     682:	9722                	add	a4,a4,s0
     684:	00876563          	bltu	a4,s0,68e <__umoddi3+0x12e>
     688:	00b77363          	bgeu	a4,a1,68e <__umoddi3+0x12e>
     68c:	9722                	add	a4,a4,s0
     68e:	40b705b3          	sub	a1,a4,a1
     692:	02d5f733          	remu	a4,a1,a3
     696:	07c2                	slli	a5,a5,0x10
     698:	83c1                	srli	a5,a5,0x10
     69a:	02d5d5b3          	divu	a1,a1,a3
     69e:	0742                	slli	a4,a4,0x10
     6a0:	8fd9                	or	a5,a5,a4
     6a2:	02b50533          	mul	a0,a0,a1
     6a6:	00a7f863          	bgeu	a5,a0,6b6 <__umoddi3+0x156>
     6aa:	97a2                	add	a5,a5,s0
     6ac:	0087e563          	bltu	a5,s0,6b6 <__umoddi3+0x156>
     6b0:	00a7f363          	bgeu	a5,a0,6b6 <__umoddi3+0x156>
     6b4:	97a2                	add	a5,a5,s0
     6b6:	8f89                	sub	a5,a5,a0
     6b8:	bfa9                	j	612 <__umoddi3+0xb2>
     6ba:	01000737          	lui	a4,0x1000
     6be:	4341                	li	t1,16
     6c0:	f8e463e3          	bltu	s0,a4,646 <__umoddi3+0xe6>
     6c4:	4361                	li	t1,24
     6c6:	b741                	j	646 <__umoddi3+0xe6>
     6c8:	00541433          	sll	s0,s0,t0
     6cc:	0065d6b3          	srl	a3,a1,t1
     6d0:	005517b3          	sll	a5,a0,t0
     6d4:	00655333          	srl	t1,a0,t1
     6d8:	01045513          	srli	a0,s0,0x10
     6dc:	02a6f733          	remu	a4,a3,a0
     6e0:	005595b3          	sll	a1,a1,t0
     6e4:	00b36633          	or	a2,t1,a1
     6e8:	01041593          	slli	a1,s0,0x10
     6ec:	81c1                	srli	a1,a1,0x10
     6ee:	01065313          	srli	t1,a2,0x10
     6f2:	02a6d6b3          	divu	a3,a3,a0
     6f6:	0742                	slli	a4,a4,0x10
     6f8:	00676733          	or	a4,a4,t1
     6fc:	02d586b3          	mul	a3,a1,a3
     700:	00d77863          	bgeu	a4,a3,710 <__umoddi3+0x1b0>
     704:	9722                	add	a4,a4,s0
     706:	00876563          	bltu	a4,s0,710 <__umoddi3+0x1b0>
     70a:	00d77363          	bgeu	a4,a3,710 <__umoddi3+0x1b0>
     70e:	9722                	add	a4,a4,s0
     710:	40d706b3          	sub	a3,a4,a3
     714:	02a6f733          	remu	a4,a3,a0
     718:	02a6d6b3          	divu	a3,a3,a0
     71c:	0742                	slli	a4,a4,0x10
     71e:	02d586b3          	mul	a3,a1,a3
     722:	01061593          	slli	a1,a2,0x10
     726:	81c1                	srli	a1,a1,0x10
     728:	8dd9                	or	a1,a1,a4
     72a:	00d5f863          	bgeu	a1,a3,73a <__umoddi3+0x1da>
     72e:	95a2                	add	a1,a1,s0
     730:	0085e563          	bltu	a1,s0,73a <__umoddi3+0x1da>
     734:	00d5f363          	bgeu	a1,a3,73a <__umoddi3+0x1da>
     738:	95a2                	add	a1,a1,s0
     73a:	8d95                	sub	a1,a1,a3
     73c:	b715                	j	660 <__umoddi3+0x100>
     73e:	ecd5ede3          	bltu	a1,a3,618 <__umoddi3+0xb8>
     742:	6341                	lui	t1,0x10
     744:	0466f563          	bgeu	a3,t1,78e <__umoddi3+0x22e>
     748:	0ff00293          	li	t0,255
     74c:	00d2b333          	sltu	t1,t0,a3
     750:	030e                	slli	t1,t1,0x3
     752:	0066d3b3          	srl	t2,a3,t1
     756:	00007297          	auipc	t0,0x7
     75a:	b3228293          	addi	t0,t0,-1230 # 7288 <__clz_tab>
     75e:	929e                	add	t0,t0,t2
     760:	0002c283          	lbu	t0,0(t0)
     764:	929a                	add	t0,t0,t1
     766:	02000313          	li	t1,32
     76a:	405303b3          	sub	t2,t1,t0
     76e:	02531763          	bne	t1,t0,79c <__umoddi3+0x23c>
     772:	00b6e463          	bltu	a3,a1,77a <__umoddi3+0x21a>
     776:	00c56963          	bltu	a0,a2,788 <__umoddi3+0x228>
     77a:	40c507b3          	sub	a5,a0,a2
     77e:	8d95                	sub	a1,a1,a3
     780:	00f53533          	sltu	a0,a0,a5
     784:	40a58733          	sub	a4,a1,a0
     788:	853e                	mv	a0,a5
     78a:	85ba                	mv	a1,a4
     78c:	b571                	j	618 <__umoddi3+0xb8>
     78e:	010002b7          	lui	t0,0x1000
     792:	4341                	li	t1,16
     794:	fa56efe3          	bltu	a3,t0,752 <__umoddi3+0x1f2>
     798:	4361                	li	t1,24
     79a:	bf65                	j	752 <__umoddi3+0x1f2>
     79c:	007696b3          	sll	a3,a3,t2
     7a0:	00565333          	srl	t1,a2,t0
     7a4:	00d36333          	or	t1,t1,a3
     7a8:	0055d4b3          	srl	s1,a1,t0
     7ac:	01035413          	srli	s0,t1,0x10
     7b0:	00555733          	srl	a4,a0,t0
     7b4:	007517b3          	sll	a5,a0,t2
     7b8:	0284d533          	divu	a0,s1,s0
     7bc:	c03e                	sw	a5,0(sp)
     7be:	007595b3          	sll	a1,a1,t2
     7c2:	8dd9                	or	a1,a1,a4
     7c4:	01031713          	slli	a4,t1,0x10
     7c8:	8341                	srli	a4,a4,0x10
     7ca:	00761633          	sll	a2,a2,t2
     7ce:	0284f7b3          	remu	a5,s1,s0
     7d2:	02a704b3          	mul	s1,a4,a0
     7d6:	01079693          	slli	a3,a5,0x10
     7da:	0105d793          	srli	a5,a1,0x10
     7de:	8fd5                	or	a5,a5,a3
     7e0:	86aa                	mv	a3,a0
     7e2:	0097fc63          	bgeu	a5,s1,7fa <__umoddi3+0x29a>
     7e6:	979a                	add	a5,a5,t1
     7e8:	fff50693          	addi	a3,a0,-1
     7ec:	0067e763          	bltu	a5,t1,7fa <__umoddi3+0x29a>
     7f0:	0097f563          	bgeu	a5,s1,7fa <__umoddi3+0x29a>
     7f4:	ffe50693          	addi	a3,a0,-2
     7f8:	979a                	add	a5,a5,t1
     7fa:	8f85                	sub	a5,a5,s1
     7fc:	0287f533          	remu	a0,a5,s0
     800:	05c2                	slli	a1,a1,0x10
     802:	81c1                	srli	a1,a1,0x10
     804:	0287d433          	divu	s0,a5,s0
     808:	0542                	slli	a0,a0,0x10
     80a:	8dc9                	or	a1,a1,a0
     80c:	02870733          	mul	a4,a4,s0
     810:	87a2                	mv	a5,s0
     812:	00e5fc63          	bgeu	a1,a4,82a <__umoddi3+0x2ca>
     816:	959a                	add	a1,a1,t1
     818:	fff40793          	addi	a5,s0,-1
     81c:	0065e763          	bltu	a1,t1,82a <__umoddi3+0x2ca>
     820:	00e5f563          	bgeu	a1,a4,82a <__umoddi3+0x2ca>
     824:	ffe40793          	addi	a5,s0,-2
     828:	959a                	add	a1,a1,t1
     82a:	06c2                	slli	a3,a3,0x10
     82c:	6441                	lui	s0,0x10
     82e:	8edd                	or	a3,a3,a5
     830:	40e58733          	sub	a4,a1,a4
     834:	fff40593          	addi	a1,s0,-1 # ffff <__ctor_end__+0x779f>
     838:	00b6f7b3          	and	a5,a3,a1
     83c:	01065493          	srli	s1,a2,0x10
     840:	82c1                	srli	a3,a3,0x10
     842:	8df1                	and	a1,a1,a2
     844:	02b78533          	mul	a0,a5,a1
     848:	02b685b3          	mul	a1,a3,a1
     84c:	029787b3          	mul	a5,a5,s1
     850:	029686b3          	mul	a3,a3,s1
     854:	97ae                	add	a5,a5,a1
     856:	01055493          	srli	s1,a0,0x10
     85a:	97a6                	add	a5,a5,s1
     85c:	00b7f363          	bgeu	a5,a1,862 <__umoddi3+0x302>
     860:	96a2                	add	a3,a3,s0
     862:	0107d593          	srli	a1,a5,0x10
     866:	96ae                	add	a3,a3,a1
     868:	65c1                	lui	a1,0x10
     86a:	15fd                	addi	a1,a1,-1
     86c:	8fed                	and	a5,a5,a1
     86e:	07c2                	slli	a5,a5,0x10
     870:	8d6d                	and	a0,a0,a1
     872:	953e                	add	a0,a0,a5
     874:	00d76763          	bltu	a4,a3,882 <__umoddi3+0x322>
     878:	00d71d63          	bne	a4,a3,892 <__umoddi3+0x332>
     87c:	4782                	lw	a5,0(sp)
     87e:	00a7fa63          	bgeu	a5,a0,892 <__umoddi3+0x332>
     882:	40c50633          	sub	a2,a0,a2
     886:	00c53533          	sltu	a0,a0,a2
     88a:	932a                	add	t1,t1,a0
     88c:	406686b3          	sub	a3,a3,t1
     890:	8532                	mv	a0,a2
     892:	4782                	lw	a5,0(sp)
     894:	40d706b3          	sub	a3,a4,a3
     898:	40a78533          	sub	a0,a5,a0
     89c:	00a7b5b3          	sltu	a1,a5,a0
     8a0:	40b685b3          	sub	a1,a3,a1
     8a4:	005597b3          	sll	a5,a1,t0
     8a8:	00755533          	srl	a0,a0,t2
     8ac:	8d5d                	or	a0,a0,a5
     8ae:	0075d5b3          	srl	a1,a1,t2
     8b2:	b39d                	j	618 <__umoddi3+0xb8>

000008b4 <__adddf3>:
     8b4:	00100337          	lui	t1,0x100
     8b8:	137d                	addi	t1,t1,-1
     8ba:	1131                	addi	sp,sp,-20
     8bc:	00b377b3          	and	a5,t1,a1
     8c0:	0145d713          	srli	a4,a1,0x14
     8c4:	c426                	sw	s1,8(sp)
     8c6:	078e                	slli	a5,a5,0x3
     8c8:	7ff77493          	andi	s1,a4,2047
     8cc:	01d55713          	srli	a4,a0,0x1d
     8d0:	8fd9                	or	a5,a5,a4
     8d2:	00d37733          	and	a4,t1,a3
     8d6:	0146d313          	srli	t1,a3,0x14
     8da:	c622                	sw	s0,12(sp)
     8dc:	7ff37313          	andi	t1,t1,2047
     8e0:	01f5d413          	srli	s0,a1,0x1f
     8e4:	070e                	slli	a4,a4,0x3
     8e6:	01f6d593          	srli	a1,a3,0x1f
     8ea:	c806                	sw	ra,16(sp)
     8ec:	01d65693          	srli	a3,a2,0x1d
     8f0:	8f55                	or	a4,a4,a3
     8f2:	050e                	slli	a0,a0,0x3
     8f4:	060e                	slli	a2,a2,0x3
     8f6:	406486b3          	sub	a3,s1,t1
     8fa:	22b41463          	bne	s0,a1,b22 <__adddf3+0x26e>
     8fe:	0ed05263          	blez	a3,9e2 <__adddf3+0x12e>
     902:	02031863          	bnez	t1,932 <__adddf3+0x7e>
     906:	00c765b3          	or	a1,a4,a2
     90a:	20058a63          	beqz	a1,b1e <__adddf3+0x26a>
     90e:	fff68593          	addi	a1,a3,-1
     912:	e989                	bnez	a1,924 <__adddf3+0x70>
     914:	962a                	add	a2,a2,a0
     916:	00a63533          	sltu	a0,a2,a0
     91a:	97ba                	add	a5,a5,a4
     91c:	97aa                	add	a5,a5,a0
     91e:	8532                	mv	a0,a2
     920:	4485                	li	s1,1
     922:	a8b9                	j	980 <__adddf3+0xcc>
     924:	7ff00313          	li	t1,2047
     928:	00669d63          	bne	a3,t1,942 <__adddf3+0x8e>
     92c:	7ff00493          	li	s1,2047
     930:	aa71                	j	acc <__adddf3+0x218>
     932:	7ff00593          	li	a1,2047
     936:	18b48b63          	beq	s1,a1,acc <__adddf3+0x218>
     93a:	008005b7          	lui	a1,0x800
     93e:	8f4d                	or	a4,a4,a1
     940:	85b6                	mv	a1,a3
     942:	03800693          	li	a3,56
     946:	08b6ca63          	blt	a3,a1,9da <__adddf3+0x126>
     94a:	46fd                	li	a3,31
     94c:	06b6c163          	blt	a3,a1,9ae <__adddf3+0xfa>
     950:	02000313          	li	t1,32
     954:	40b30333          	sub	t1,t1,a1
     958:	006716b3          	sll	a3,a4,t1
     95c:	00b652b3          	srl	t0,a2,a1
     960:	00661633          	sll	a2,a2,t1
     964:	0056e6b3          	or	a3,a3,t0
     968:	00c03633          	snez	a2,a2
     96c:	8e55                	or	a2,a2,a3
     96e:	00b75733          	srl	a4,a4,a1
     972:	962a                	add	a2,a2,a0
     974:	00a63533          	sltu	a0,a2,a0
     978:	973e                	add	a4,a4,a5
     97a:	00a707b3          	add	a5,a4,a0
     97e:	8532                	mv	a0,a2
     980:	00800737          	lui	a4,0x800
     984:	8f7d                	and	a4,a4,a5
     986:	14070363          	beqz	a4,acc <__adddf3+0x218>
     98a:	0485                	addi	s1,s1,1
     98c:	7ff00713          	li	a4,2047
     990:	48e48b63          	beq	s1,a4,e26 <__adddf3+0x572>
     994:	ff800737          	lui	a4,0xff800
     998:	177d                	addi	a4,a4,-1
     99a:	8ff9                	and	a5,a5,a4
     99c:	00155713          	srli	a4,a0,0x1
     9a0:	8905                	andi	a0,a0,1
     9a2:	8d59                	or	a0,a0,a4
     9a4:	01f79713          	slli	a4,a5,0x1f
     9a8:	8d59                	or	a0,a0,a4
     9aa:	8385                	srli	a5,a5,0x1
     9ac:	a205                	j	acc <__adddf3+0x218>
     9ae:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f7780>
     9b2:	02000293          	li	t0,32
     9b6:	00d756b3          	srl	a3,a4,a3
     9ba:	4301                	li	t1,0
     9bc:	00558863          	beq	a1,t0,9cc <__adddf3+0x118>
     9c0:	04000313          	li	t1,64
     9c4:	40b305b3          	sub	a1,t1,a1
     9c8:	00b71333          	sll	t1,a4,a1
     9cc:	00c36633          	or	a2,t1,a2
     9d0:	00c03633          	snez	a2,a2
     9d4:	8e55                	or	a2,a2,a3
     9d6:	4701                	li	a4,0
     9d8:	bf69                	j	972 <__adddf3+0xbe>
     9da:	8e59                	or	a2,a2,a4
     9dc:	00c03633          	snez	a2,a2
     9e0:	bfdd                	j	9d6 <__adddf3+0x122>
     9e2:	cacd                	beqz	a3,a94 <__adddf3+0x1e0>
     9e4:	409305b3          	sub	a1,t1,s1
     9e8:	e48d                	bnez	s1,a12 <__adddf3+0x15e>
     9ea:	00a7e6b3          	or	a3,a5,a0
     9ee:	42068363          	beqz	a3,e14 <__adddf3+0x560>
     9f2:	fff58693          	addi	a3,a1,-1
     9f6:	e699                	bnez	a3,a04 <__adddf3+0x150>
     9f8:	9532                	add	a0,a0,a2
     9fa:	97ba                	add	a5,a5,a4
     9fc:	00c53633          	sltu	a2,a0,a2
     a00:	97b2                	add	a5,a5,a2
     a02:	bf39                	j	920 <__adddf3+0x6c>
     a04:	7ff00293          	li	t0,2047
     a08:	00559d63          	bne	a1,t0,a22 <__adddf3+0x16e>
     a0c:	87ba                	mv	a5,a4
     a0e:	8532                	mv	a0,a2
     a10:	bf31                	j	92c <__adddf3+0x78>
     a12:	7ff00693          	li	a3,2047
     a16:	fed30be3          	beq	t1,a3,a0c <__adddf3+0x158>
     a1a:	008006b7          	lui	a3,0x800
     a1e:	8fd5                	or	a5,a5,a3
     a20:	86ae                	mv	a3,a1
     a22:	03800593          	li	a1,56
     a26:	06d5c363          	blt	a1,a3,a8c <__adddf3+0x1d8>
     a2a:	45fd                	li	a1,31
     a2c:	02d5ca63          	blt	a1,a3,a60 <__adddf3+0x1ac>
     a30:	02000293          	li	t0,32
     a34:	40d282b3          	sub	t0,t0,a3
     a38:	005795b3          	sll	a1,a5,t0
     a3c:	00d553b3          	srl	t2,a0,a3
     a40:	00551533          	sll	a0,a0,t0
     a44:	0075e5b3          	or	a1,a1,t2
     a48:	00a03533          	snez	a0,a0
     a4c:	8d4d                	or	a0,a0,a1
     a4e:	00d7d7b3          	srl	a5,a5,a3
     a52:	9532                	add	a0,a0,a2
     a54:	97ba                	add	a5,a5,a4
     a56:	00c53633          	sltu	a2,a0,a2
     a5a:	97b2                	add	a5,a5,a2
     a5c:	849a                	mv	s1,t1
     a5e:	b70d                	j	980 <__adddf3+0xcc>
     a60:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f7780>
     a64:	02000393          	li	t2,32
     a68:	00b7d5b3          	srl	a1,a5,a1
     a6c:	4281                	li	t0,0
     a6e:	00768863          	beq	a3,t2,a7e <__adddf3+0x1ca>
     a72:	04000293          	li	t0,64
     a76:	40d286b3          	sub	a3,t0,a3
     a7a:	00d792b3          	sll	t0,a5,a3
     a7e:	00a2e533          	or	a0,t0,a0
     a82:	00a03533          	snez	a0,a0
     a86:	8d4d                	or	a0,a0,a1
     a88:	4781                	li	a5,0
     a8a:	b7e1                	j	a52 <__adddf3+0x19e>
     a8c:	8d5d                	or	a0,a0,a5
     a8e:	00a03533          	snez	a0,a0
     a92:	bfdd                	j	a88 <__adddf3+0x1d4>
     a94:	00148693          	addi	a3,s1,1
     a98:	7fe6f593          	andi	a1,a3,2046
     a9c:	e1bd                	bnez	a1,b02 <__adddf3+0x24e>
     a9e:	00a7e6b3          	or	a3,a5,a0
     aa2:	e4a9                	bnez	s1,aec <__adddf3+0x238>
     aa4:	36068c63          	beqz	a3,e1c <__adddf3+0x568>
     aa8:	00c766b3          	or	a3,a4,a2
     aac:	c285                	beqz	a3,acc <__adddf3+0x218>
     aae:	962a                	add	a2,a2,a0
     ab0:	97ba                	add	a5,a5,a4
     ab2:	00a63533          	sltu	a0,a2,a0
     ab6:	97aa                	add	a5,a5,a0
     ab8:	00800737          	lui	a4,0x800
     abc:	8f7d                	and	a4,a4,a5
     abe:	8532                	mv	a0,a2
     ac0:	c711                	beqz	a4,acc <__adddf3+0x218>
     ac2:	ff800737          	lui	a4,0xff800
     ac6:	177d                	addi	a4,a4,-1
     ac8:	8ff9                	and	a5,a5,a4
     aca:	4485                	li	s1,1
     acc:	00757713          	andi	a4,a0,7
     ad0:	34070d63          	beqz	a4,e2a <__adddf3+0x576>
     ad4:	00f57713          	andi	a4,a0,15
     ad8:	4691                	li	a3,4
     ada:	34d70863          	beq	a4,a3,e2a <__adddf3+0x576>
     ade:	00450713          	addi	a4,a0,4
     ae2:	00a73533          	sltu	a0,a4,a0
     ae6:	97aa                	add	a5,a5,a0
     ae8:	853a                	mv	a0,a4
     aea:	a681                	j	e2a <__adddf3+0x576>
     aec:	d285                	beqz	a3,a0c <__adddf3+0x158>
     aee:	8e59                	or	a2,a2,a4
     af0:	e2060ee3          	beqz	a2,92c <__adddf3+0x78>
     af4:	4401                	li	s0,0
     af6:	004007b7          	lui	a5,0x400
     afa:	4501                	li	a0,0
     afc:	7ff00493          	li	s1,2047
     b00:	a62d                	j	e2a <__adddf3+0x576>
     b02:	7ff00593          	li	a1,2047
     b06:	30b68e63          	beq	a3,a1,e22 <__adddf3+0x56e>
     b0a:	962a                	add	a2,a2,a0
     b0c:	00a63533          	sltu	a0,a2,a0
     b10:	97ba                	add	a5,a5,a4
     b12:	97aa                	add	a5,a5,a0
     b14:	01f79513          	slli	a0,a5,0x1f
     b18:	8205                	srli	a2,a2,0x1
     b1a:	8d51                	or	a0,a0,a2
     b1c:	8385                	srli	a5,a5,0x1
     b1e:	84b6                	mv	s1,a3
     b20:	b775                	j	acc <__adddf3+0x218>
     b22:	0cd05463          	blez	a3,bea <__adddf3+0x336>
     b26:	06031f63          	bnez	t1,ba4 <__adddf3+0x2f0>
     b2a:	00c765b3          	or	a1,a4,a2
     b2e:	d9e5                	beqz	a1,b1e <__adddf3+0x26a>
     b30:	fff68593          	addi	a1,a3,-1
     b34:	e991                	bnez	a1,b48 <__adddf3+0x294>
     b36:	40c50633          	sub	a2,a0,a2
     b3a:	00c53533          	sltu	a0,a0,a2
     b3e:	8f99                	sub	a5,a5,a4
     b40:	8f89                	sub	a5,a5,a0
     b42:	8532                	mv	a0,a2
     b44:	4485                	li	s1,1
     b46:	a0b1                	j	b92 <__adddf3+0x2de>
     b48:	7ff00313          	li	t1,2047
     b4c:	de6680e3          	beq	a3,t1,92c <__adddf3+0x78>
     b50:	03800693          	li	a3,56
     b54:	08b6c763          	blt	a3,a1,be2 <__adddf3+0x32e>
     b58:	46fd                	li	a3,31
     b5a:	04b6ce63          	blt	a3,a1,bb6 <__adddf3+0x302>
     b5e:	02000313          	li	t1,32
     b62:	40b30333          	sub	t1,t1,a1
     b66:	006716b3          	sll	a3,a4,t1
     b6a:	00b652b3          	srl	t0,a2,a1
     b6e:	00661633          	sll	a2,a2,t1
     b72:	0056e6b3          	or	a3,a3,t0
     b76:	00c03633          	snez	a2,a2
     b7a:	8e55                	or	a2,a2,a3
     b7c:	00b75733          	srl	a4,a4,a1
     b80:	40c50633          	sub	a2,a0,a2
     b84:	00c53533          	sltu	a0,a0,a2
     b88:	40e78733          	sub	a4,a5,a4
     b8c:	40a707b3          	sub	a5,a4,a0
     b90:	8532                	mv	a0,a2
     b92:	008006b7          	lui	a3,0x800
     b96:	00d7f733          	and	a4,a5,a3
     b9a:	db0d                	beqz	a4,acc <__adddf3+0x218>
     b9c:	16fd                	addi	a3,a3,-1
     b9e:	8efd                	and	a3,a3,a5
     ba0:	832a                	mv	t1,a0
     ba2:	aa55                	j	d56 <__adddf3+0x4a2>
     ba4:	7ff00593          	li	a1,2047
     ba8:	f2b482e3          	beq	s1,a1,acc <__adddf3+0x218>
     bac:	008005b7          	lui	a1,0x800
     bb0:	8f4d                	or	a4,a4,a1
     bb2:	85b6                	mv	a1,a3
     bb4:	bf71                	j	b50 <__adddf3+0x29c>
     bb6:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f7780>
     bba:	02000293          	li	t0,32
     bbe:	00d756b3          	srl	a3,a4,a3
     bc2:	4301                	li	t1,0
     bc4:	00558863          	beq	a1,t0,bd4 <__adddf3+0x320>
     bc8:	04000313          	li	t1,64
     bcc:	40b305b3          	sub	a1,t1,a1
     bd0:	00b71333          	sll	t1,a4,a1
     bd4:	00c36633          	or	a2,t1,a2
     bd8:	00c03633          	snez	a2,a2
     bdc:	8e55                	or	a2,a2,a3
     bde:	4701                	li	a4,0
     be0:	b745                	j	b80 <__adddf3+0x2cc>
     be2:	8e59                	or	a2,a2,a4
     be4:	00c03633          	snez	a2,a2
     be8:	bfdd                	j	bde <__adddf3+0x32a>
     bea:	c2f9                	beqz	a3,cb0 <__adddf3+0x3fc>
     bec:	409302b3          	sub	t0,t1,s1
     bf0:	e895                	bnez	s1,c24 <__adddf3+0x370>
     bf2:	00a7e6b3          	or	a3,a5,a0
     bf6:	28068863          	beqz	a3,e86 <__adddf3+0x5d2>
     bfa:	fff28693          	addi	a3,t0,-1 # ffffff <__ctor_end__+0xff779f>
     bfe:	ea91                	bnez	a3,c12 <__adddf3+0x35e>
     c00:	40a60533          	sub	a0,a2,a0
     c04:	40f707b3          	sub	a5,a4,a5
     c08:	00a63633          	sltu	a2,a2,a0
     c0c:	8f91                	sub	a5,a5,a2
     c0e:	842e                	mv	s0,a1
     c10:	bf15                	j	b44 <__adddf3+0x290>
     c12:	7ff00393          	li	t2,2047
     c16:	00729f63          	bne	t0,t2,c34 <__adddf3+0x380>
     c1a:	87ba                	mv	a5,a4
     c1c:	8532                	mv	a0,a2
     c1e:	7ff00493          	li	s1,2047
     c22:	a07d                	j	cd0 <__adddf3+0x41c>
     c24:	7ff00693          	li	a3,2047
     c28:	fed309e3          	beq	t1,a3,c1a <__adddf3+0x366>
     c2c:	008006b7          	lui	a3,0x800
     c30:	8fd5                	or	a5,a5,a3
     c32:	8696                	mv	a3,t0
     c34:	03800293          	li	t0,56
     c38:	06d2c863          	blt	t0,a3,ca8 <__adddf3+0x3f4>
     c3c:	42fd                	li	t0,31
     c3e:	02d2ce63          	blt	t0,a3,c7a <__adddf3+0x3c6>
     c42:	02000393          	li	t2,32
     c46:	40d383b3          	sub	t2,t2,a3
     c4a:	007792b3          	sll	t0,a5,t2
     c4e:	00d55433          	srl	s0,a0,a3
     c52:	00751533          	sll	a0,a0,t2
     c56:	0082e2b3          	or	t0,t0,s0
     c5a:	00a03533          	snez	a0,a0
     c5e:	00a2e533          	or	a0,t0,a0
     c62:	00d7d7b3          	srl	a5,a5,a3
     c66:	40a60533          	sub	a0,a2,a0
     c6a:	40f707b3          	sub	a5,a4,a5
     c6e:	00a63633          	sltu	a2,a2,a0
     c72:	8f91                	sub	a5,a5,a2
     c74:	849a                	mv	s1,t1
     c76:	842e                	mv	s0,a1
     c78:	bf29                	j	b92 <__adddf3+0x2de>
     c7a:	fe068293          	addi	t0,a3,-32 # 7fffe0 <__ctor_end__+0x7f7780>
     c7e:	02000413          	li	s0,32
     c82:	0057d2b3          	srl	t0,a5,t0
     c86:	4381                	li	t2,0
     c88:	00868863          	beq	a3,s0,c98 <__adddf3+0x3e4>
     c8c:	04000393          	li	t2,64
     c90:	40d386b3          	sub	a3,t2,a3
     c94:	00d793b3          	sll	t2,a5,a3
     c98:	00a3e533          	or	a0,t2,a0
     c9c:	00a03533          	snez	a0,a0
     ca0:	00a2e533          	or	a0,t0,a0
     ca4:	4781                	li	a5,0
     ca6:	b7c1                	j	c66 <__adddf3+0x3b2>
     ca8:	8d5d                	or	a0,a0,a5
     caa:	00a03533          	snez	a0,a0
     cae:	bfdd                	j	ca4 <__adddf3+0x3f0>
     cb0:	00148693          	addi	a3,s1,1
     cb4:	7fe6f693          	andi	a3,a3,2046
     cb8:	eaa5                	bnez	a3,d28 <__adddf3+0x474>
     cba:	00a7e333          	or	t1,a5,a0
     cbe:	00c766b3          	or	a3,a4,a2
     cc2:	e8a1                	bnez	s1,d12 <__adddf3+0x45e>
     cc4:	00031863          	bnez	t1,cd4 <__adddf3+0x420>
     cc8:	1c068363          	beqz	a3,e8e <__adddf3+0x5da>
     ccc:	87ba                	mv	a5,a4
     cce:	8532                	mv	a0,a2
     cd0:	842e                	mv	s0,a1
     cd2:	bbed                	j	acc <__adddf3+0x218>
     cd4:	de068ce3          	beqz	a3,acc <__adddf3+0x218>
     cd8:	40c50333          	sub	t1,a0,a2
     cdc:	006532b3          	sltu	t0,a0,t1
     ce0:	40e786b3          	sub	a3,a5,a4
     ce4:	405686b3          	sub	a3,a3,t0
     ce8:	008002b7          	lui	t0,0x800
     cec:	0056f2b3          	and	t0,a3,t0
     cf0:	00028a63          	beqz	t0,d04 <__adddf3+0x450>
     cf4:	40a60533          	sub	a0,a2,a0
     cf8:	40f707b3          	sub	a5,a4,a5
     cfc:	00a63633          	sltu	a2,a2,a0
     d00:	8f91                	sub	a5,a5,a2
     d02:	b7f9                	j	cd0 <__adddf3+0x41c>
     d04:	00d36533          	or	a0,t1,a3
     d08:	18050763          	beqz	a0,e96 <__adddf3+0x5e2>
     d0c:	87b6                	mv	a5,a3
     d0e:	851a                	mv	a0,t1
     d10:	bb75                	j	acc <__adddf3+0x218>
     d12:	00031863          	bnez	t1,d22 <__adddf3+0x46e>
     d16:	18068263          	beqz	a3,e9a <__adddf3+0x5e6>
     d1a:	87ba                	mv	a5,a4
     d1c:	8532                	mv	a0,a2
     d1e:	842e                	mv	s0,a1
     d20:	b131                	j	92c <__adddf3+0x78>
     d22:	c00685e3          	beqz	a3,92c <__adddf3+0x78>
     d26:	b3f9                	j	af4 <__adddf3+0x240>
     d28:	40c50333          	sub	t1,a0,a2
     d2c:	006532b3          	sltu	t0,a0,t1
     d30:	40e786b3          	sub	a3,a5,a4
     d34:	405686b3          	sub	a3,a3,t0
     d38:	008002b7          	lui	t0,0x800
     d3c:	0056f2b3          	and	t0,a3,t0
     d40:	06028b63          	beqz	t0,db6 <__adddf3+0x502>
     d44:	40a60333          	sub	t1,a2,a0
     d48:	40f707b3          	sub	a5,a4,a5
     d4c:	00663633          	sltu	a2,a2,t1
     d50:	40c786b3          	sub	a3,a5,a2
     d54:	842e                	mv	s0,a1
     d56:	c6b5                	beqz	a3,dc2 <__adddf3+0x50e>
     d58:	8536                	mv	a0,a3
     d5a:	c21a                	sw	t1,4(sp)
     d5c:	c036                	sw	a3,0(sp)
     d5e:	424010ef          	jal	ra,2182 <__clzsi2>
     d62:	4682                	lw	a3,0(sp)
     d64:	4312                	lw	t1,4(sp)
     d66:	ff850713          	addi	a4,a0,-8
     d6a:	47fd                	li	a5,31
     d6c:	06e7c563          	blt	a5,a4,dd6 <__adddf3+0x522>
     d70:	02000793          	li	a5,32
     d74:	8f99                	sub	a5,a5,a4
     d76:	00e696b3          	sll	a3,a3,a4
     d7a:	00f357b3          	srl	a5,t1,a5
     d7e:	8fd5                	or	a5,a5,a3
     d80:	00e31533          	sll	a0,t1,a4
     d84:	08974263          	blt	a4,s1,e08 <__adddf3+0x554>
     d88:	8f05                	sub	a4,a4,s1
     d8a:	00170613          	addi	a2,a4,1 # ff800001 <__heap_end+0xdf7d0001>
     d8e:	46fd                	li	a3,31
     d90:	04c6c963          	blt	a3,a2,de2 <__adddf3+0x52e>
     d94:	02000713          	li	a4,32
     d98:	8f11                	sub	a4,a4,a2
     d9a:	00e796b3          	sll	a3,a5,a4
     d9e:	00c555b3          	srl	a1,a0,a2
     da2:	00e51533          	sll	a0,a0,a4
     da6:	8ecd                	or	a3,a3,a1
     da8:	00a03533          	snez	a0,a0
     dac:	8d55                	or	a0,a0,a3
     dae:	00c7d7b3          	srl	a5,a5,a2
     db2:	4481                	li	s1,0
     db4:	bb21                	j	acc <__adddf3+0x218>
     db6:	00d36533          	or	a0,t1,a3
     dba:	fd51                	bnez	a0,d56 <__adddf3+0x4a2>
     dbc:	4781                	li	a5,0
     dbe:	4481                	li	s1,0
     dc0:	a8c9                	j	e92 <__adddf3+0x5de>
     dc2:	851a                	mv	a0,t1
     dc4:	c236                	sw	a3,4(sp)
     dc6:	c01a                	sw	t1,0(sp)
     dc8:	3ba010ef          	jal	ra,2182 <__clzsi2>
     dcc:	4692                	lw	a3,4(sp)
     dce:	4302                	lw	t1,0(sp)
     dd0:	02050513          	addi	a0,a0,32
     dd4:	bf49                	j	d66 <__adddf3+0x4b2>
     dd6:	fd850793          	addi	a5,a0,-40
     dda:	00f317b3          	sll	a5,t1,a5
     dde:	4501                	li	a0,0
     de0:	b755                	j	d84 <__adddf3+0x4d0>
     de2:	1705                	addi	a4,a4,-31
     de4:	02000593          	li	a1,32
     de8:	00e7d733          	srl	a4,a5,a4
     dec:	4681                	li	a3,0
     dee:	00b60763          	beq	a2,a1,dfc <__adddf3+0x548>
     df2:	04000693          	li	a3,64
     df6:	8e91                	sub	a3,a3,a2
     df8:	00d796b3          	sll	a3,a5,a3
     dfc:	8d55                	or	a0,a0,a3
     dfe:	00a03533          	snez	a0,a0
     e02:	8d59                	or	a0,a0,a4
     e04:	4781                	li	a5,0
     e06:	b775                	j	db2 <__adddf3+0x4fe>
     e08:	8c99                	sub	s1,s1,a4
     e0a:	ff800737          	lui	a4,0xff800
     e0e:	177d                	addi	a4,a4,-1
     e10:	8ff9                	and	a5,a5,a4
     e12:	b96d                	j	acc <__adddf3+0x218>
     e14:	87ba                	mv	a5,a4
     e16:	8532                	mv	a0,a2
     e18:	84ae                	mv	s1,a1
     e1a:	b94d                	j	acc <__adddf3+0x218>
     e1c:	87ba                	mv	a5,a4
     e1e:	8532                	mv	a0,a2
     e20:	b175                	j	acc <__adddf3+0x218>
     e22:	7ff00493          	li	s1,2047
     e26:	4781                	li	a5,0
     e28:	4501                	li	a0,0
     e2a:	00800737          	lui	a4,0x800
     e2e:	8f7d                	and	a4,a4,a5
     e30:	cb11                	beqz	a4,e44 <__adddf3+0x590>
     e32:	0485                	addi	s1,s1,1
     e34:	7ff00713          	li	a4,2047
     e38:	06e48663          	beq	s1,a4,ea4 <__adddf3+0x5f0>
     e3c:	ff800737          	lui	a4,0xff800
     e40:	177d                	addi	a4,a4,-1
     e42:	8ff9                	and	a5,a5,a4
     e44:	01d79713          	slli	a4,a5,0x1d
     e48:	810d                	srli	a0,a0,0x3
     e4a:	8d59                	or	a0,a0,a4
     e4c:	7ff00713          	li	a4,2047
     e50:	838d                	srli	a5,a5,0x3
     e52:	00e49963          	bne	s1,a4,e64 <__adddf3+0x5b0>
     e56:	8d5d                	or	a0,a0,a5
     e58:	4781                	li	a5,0
     e5a:	c509                	beqz	a0,e64 <__adddf3+0x5b0>
     e5c:	000807b7          	lui	a5,0x80
     e60:	4501                	li	a0,0
     e62:	4401                	li	s0,0
     e64:	01449713          	slli	a4,s1,0x14
     e68:	7ff006b7          	lui	a3,0x7ff00
     e6c:	07b2                	slli	a5,a5,0xc
     e6e:	8f75                	and	a4,a4,a3
     e70:	83b1                	srli	a5,a5,0xc
     e72:	047e                	slli	s0,s0,0x1f
     e74:	8fd9                	or	a5,a5,a4
     e76:	40c2                	lw	ra,16(sp)
     e78:	0087e733          	or	a4,a5,s0
     e7c:	4432                	lw	s0,12(sp)
     e7e:	44a2                	lw	s1,8(sp)
     e80:	85ba                	mv	a1,a4
     e82:	0151                	addi	sp,sp,20
     e84:	8082                	ret
     e86:	87ba                	mv	a5,a4
     e88:	8532                	mv	a0,a2
     e8a:	8496                	mv	s1,t0
     e8c:	b591                	j	cd0 <__adddf3+0x41c>
     e8e:	4781                	li	a5,0
     e90:	4501                	li	a0,0
     e92:	4401                	li	s0,0
     e94:	bf59                	j	e2a <__adddf3+0x576>
     e96:	4781                	li	a5,0
     e98:	bfed                	j	e92 <__adddf3+0x5de>
     e9a:	4501                	li	a0,0
     e9c:	4401                	li	s0,0
     e9e:	004007b7          	lui	a5,0x400
     ea2:	b9a9                	j	afc <__adddf3+0x248>
     ea4:	4781                	li	a5,0
     ea6:	4501                	li	a0,0
     ea8:	bf71                	j	e44 <__adddf3+0x590>

00000eaa <__divdf3>:
     eaa:	fdc10113          	addi	sp,sp,-36
     eae:	cc26                	sw	s1,24(sp)
     eb0:	872a                	mv	a4,a0
     eb2:	84b2                	mv	s1,a2
     eb4:	87aa                	mv	a5,a0
     eb6:	01f5d613          	srli	a2,a1,0x1f
     eba:	0145d513          	srli	a0,a1,0x14
     ebe:	00c59313          	slli	t1,a1,0xc
     ec2:	d006                	sw	ra,32(sp)
     ec4:	ce22                	sw	s0,28(sp)
     ec6:	7ff57513          	andi	a0,a0,2047
     eca:	c432                	sw	a2,8(sp)
     ecc:	00c35313          	srli	t1,t1,0xc
     ed0:	c551                	beqz	a0,f5c <__divdf3+0xb2>
     ed2:	7ff00593          	li	a1,2047
     ed6:	0eb50863          	beq	a0,a1,fc6 <__divdf3+0x11c>
     eda:	01d75413          	srli	s0,a4,0x1d
     ede:	030e                	slli	t1,t1,0x3
     ee0:	008007b7          	lui	a5,0x800
     ee4:	00646433          	or	s0,s0,t1
     ee8:	8c5d                	or	s0,s0,a5
     eea:	c0150613          	addi	a2,a0,-1023
     eee:	00371793          	slli	a5,a4,0x3
     ef2:	4301                	li	t1,0
     ef4:	0146d513          	srli	a0,a3,0x14
     ef8:	01f6d713          	srli	a4,a3,0x1f
     efc:	00c69393          	slli	t2,a3,0xc
     f00:	7ff57513          	andi	a0,a0,2047
     f04:	c63a                	sw	a4,12(sp)
     f06:	00c3d393          	srli	t2,t2,0xc
     f0a:	cd79                	beqz	a0,fe8 <__divdf3+0x13e>
     f0c:	7ff00713          	li	a4,2047
     f10:	14e50763          	beq	a0,a4,105e <__divdf3+0x1b4>
     f14:	01d4d713          	srli	a4,s1,0x1d
     f18:	038e                	slli	t2,t2,0x3
     f1a:	007763b3          	or	t2,a4,t2
     f1e:	008006b7          	lui	a3,0x800
     f22:	00d3e3b3          	or	t2,t2,a3
     f26:	00349713          	slli	a4,s1,0x3
     f2a:	c0150513          	addi	a0,a0,-1023
     f2e:	4681                	li	a3,0
     f30:	45a2                	lw	a1,8(sp)
     f32:	44b2                	lw	s1,12(sp)
     f34:	8e09                	sub	a2,a2,a0
     f36:	c232                	sw	a2,4(sp)
     f38:	00231613          	slli	a2,t1,0x2
     f3c:	8da5                	xor	a1,a1,s1
     f3e:	8e55                	or	a2,a2,a3
     f40:	c02e                	sw	a1,0(sp)
     f42:	167d                	addi	a2,a2,-1
     f44:	45b9                	li	a1,14
     f46:	12c5ed63          	bltu	a1,a2,1080 <__divdf3+0x1d6>
     f4a:	00006597          	auipc	a1,0x6
     f4e:	2c658593          	addi	a1,a1,710 # 7210 <__srodata>
     f52:	060a                	slli	a2,a2,0x2
     f54:	962e                	add	a2,a2,a1
     f56:	4210                	lw	a2,0(a2)
     f58:	962e                	add	a2,a2,a1
     f5a:	8602                	jr	a2
     f5c:	00e36433          	or	s0,t1,a4
     f60:	c83d                	beqz	s0,fd6 <__divdf3+0x12c>
     f62:	c636                	sw	a3,12(sp)
     f64:	04030063          	beqz	t1,fa4 <__divdf3+0xfa>
     f68:	851a                	mv	a0,t1
     f6a:	c23a                	sw	a4,4(sp)
     f6c:	c01a                	sw	t1,0(sp)
     f6e:	214010ef          	jal	ra,2182 <__clzsi2>
     f72:	4302                	lw	t1,0(sp)
     f74:	4712                	lw	a4,4(sp)
     f76:	46b2                	lw	a3,12(sp)
     f78:	ff550593          	addi	a1,a0,-11
     f7c:	47f1                	li	a5,28
     f7e:	02b7ce63          	blt	a5,a1,fba <__divdf3+0x110>
     f82:	4475                	li	s0,29
     f84:	ff850793          	addi	a5,a0,-8
     f88:	8c0d                	sub	s0,s0,a1
     f8a:	00f31333          	sll	t1,t1,a5
     f8e:	00875433          	srl	s0,a4,s0
     f92:	00646433          	or	s0,s0,t1
     f96:	00f717b3          	sll	a5,a4,a5
     f9a:	c0d00593          	li	a1,-1011
     f9e:	40a58633          	sub	a2,a1,a0
     fa2:	bf81                	j	ef2 <__divdf3+0x48>
     fa4:	853a                	mv	a0,a4
     fa6:	c21a                	sw	t1,4(sp)
     fa8:	c03a                	sw	a4,0(sp)
     faa:	1d8010ef          	jal	ra,2182 <__clzsi2>
     fae:	46b2                	lw	a3,12(sp)
     fb0:	4312                	lw	t1,4(sp)
     fb2:	4702                	lw	a4,0(sp)
     fb4:	02050513          	addi	a0,a0,32
     fb8:	b7c1                	j	f78 <__divdf3+0xce>
     fba:	fd850413          	addi	s0,a0,-40
     fbe:	00871433          	sll	s0,a4,s0
     fc2:	4781                	li	a5,0
     fc4:	bfd9                	j	f9a <__divdf3+0xf0>
     fc6:	00e36433          	or	s0,t1,a4
     fca:	c811                	beqz	s0,fde <__divdf3+0x134>
     fcc:	841a                	mv	s0,t1
     fce:	7ff00613          	li	a2,2047
     fd2:	430d                	li	t1,3
     fd4:	b705                	j	ef4 <__divdf3+0x4a>
     fd6:	4781                	li	a5,0
     fd8:	4601                	li	a2,0
     fda:	4305                	li	t1,1
     fdc:	bf21                	j	ef4 <__divdf3+0x4a>
     fde:	4781                	li	a5,0
     fe0:	7ff00613          	li	a2,2047
     fe4:	4309                	li	t1,2
     fe6:	b739                	j	ef4 <__divdf3+0x4a>
     fe8:	0093e733          	or	a4,t2,s1
     fec:	c349                	beqz	a4,106e <__divdf3+0x1c4>
     fee:	04038463          	beqz	t2,1036 <__divdf3+0x18c>
     ff2:	851e                	mv	a0,t2
     ff4:	ca1a                	sw	t1,20(sp)
     ff6:	c832                	sw	a2,16(sp)
     ff8:	c23e                	sw	a5,4(sp)
     ffa:	c01e                	sw	t2,0(sp)
     ffc:	186010ef          	jal	ra,2182 <__clzsi2>
    1000:	4382                	lw	t2,0(sp)
    1002:	4792                	lw	a5,4(sp)
    1004:	4642                	lw	a2,16(sp)
    1006:	4352                	lw	t1,20(sp)
    1008:	ff550293          	addi	t0,a0,-11
    100c:	4771                	li	a4,28
    100e:	04574263          	blt	a4,t0,1052 <__divdf3+0x1a8>
    1012:	46f5                	li	a3,29
    1014:	ff850713          	addi	a4,a0,-8
    1018:	405686b3          	sub	a3,a3,t0
    101c:	00e393b3          	sll	t2,t2,a4
    1020:	00d4d6b3          	srl	a3,s1,a3
    1024:	0076e3b3          	or	t2,a3,t2
    1028:	00e49733          	sll	a4,s1,a4
    102c:	c0d00693          	li	a3,-1011
    1030:	40a68533          	sub	a0,a3,a0
    1034:	bded                	j	f2e <__divdf3+0x84>
    1036:	8526                	mv	a0,s1
    1038:	ca1e                	sw	t2,20(sp)
    103a:	c81a                	sw	t1,16(sp)
    103c:	c232                	sw	a2,4(sp)
    103e:	c03e                	sw	a5,0(sp)
    1040:	142010ef          	jal	ra,2182 <__clzsi2>
    1044:	43d2                	lw	t2,20(sp)
    1046:	4342                	lw	t1,16(sp)
    1048:	4612                	lw	a2,4(sp)
    104a:	4782                	lw	a5,0(sp)
    104c:	02050513          	addi	a0,a0,32
    1050:	bf65                	j	1008 <__divdf3+0x15e>
    1052:	fd850393          	addi	t2,a0,-40
    1056:	007493b3          	sll	t2,s1,t2
    105a:	4701                	li	a4,0
    105c:	bfc1                	j	102c <__divdf3+0x182>
    105e:	0093e733          	or	a4,t2,s1
    1062:	cb11                	beqz	a4,1076 <__divdf3+0x1cc>
    1064:	8726                	mv	a4,s1
    1066:	7ff00513          	li	a0,2047
    106a:	468d                	li	a3,3
    106c:	b5d1                	j	f30 <__divdf3+0x86>
    106e:	4381                	li	t2,0
    1070:	4501                	li	a0,0
    1072:	4685                	li	a3,1
    1074:	bd75                	j	f30 <__divdf3+0x86>
    1076:	4381                	li	t2,0
    1078:	7ff00513          	li	a0,2047
    107c:	4689                	li	a3,2
    107e:	bd4d                	j	f30 <__divdf3+0x86>
    1080:	0083e663          	bltu	t2,s0,108c <__divdf3+0x1e2>
    1084:	2c741263          	bne	s0,t2,1348 <__divdf3+0x49e>
    1088:	2ce7e063          	bltu	a5,a4,1348 <__divdf3+0x49e>
    108c:	01f41613          	slli	a2,s0,0x1f
    1090:	0017d693          	srli	a3,a5,0x1
    1094:	01f79513          	slli	a0,a5,0x1f
    1098:	8005                	srli	s0,s0,0x1
    109a:	00d667b3          	or	a5,a2,a3
    109e:	03a2                	slli	t2,t2,0x8
    10a0:	0103d493          	srli	s1,t2,0x10
    10a4:	02945333          	divu	t1,s0,s1
    10a8:	01875613          	srli	a2,a4,0x18
    10ac:	00766633          	or	a2,a2,t2
    10b0:	00871593          	slli	a1,a4,0x8
    10b4:	01061713          	slli	a4,a2,0x10
    10b8:	8341                	srli	a4,a4,0x10
    10ba:	c43a                	sw	a4,8(sp)
    10bc:	0107d693          	srli	a3,a5,0x10
    10c0:	02947433          	remu	s0,s0,s1
    10c4:	02670733          	mul	a4,a4,t1
    10c8:	0442                	slli	s0,s0,0x10
    10ca:	8c55                	or	s0,s0,a3
    10cc:	869a                	mv	a3,t1
    10ce:	00e47c63          	bgeu	s0,a4,10e6 <__divdf3+0x23c>
    10d2:	9432                	add	s0,s0,a2
    10d4:	fff30693          	addi	a3,t1,-1 # fffff <__ctor_end__+0xf779f>
    10d8:	00c46763          	bltu	s0,a2,10e6 <__divdf3+0x23c>
    10dc:	00e47563          	bgeu	s0,a4,10e6 <__divdf3+0x23c>
    10e0:	ffe30693          	addi	a3,t1,-2
    10e4:	9432                	add	s0,s0,a2
    10e6:	8c19                	sub	s0,s0,a4
    10e8:	029452b3          	divu	t0,s0,s1
    10ec:	01061713          	slli	a4,a2,0x10
    10f0:	8341                	srli	a4,a4,0x10
    10f2:	07c2                	slli	a5,a5,0x10
    10f4:	83c1                	srli	a5,a5,0x10
    10f6:	02947433          	remu	s0,s0,s1
    10fa:	8396                	mv	t2,t0
    10fc:	02570333          	mul	t1,a4,t0
    1100:	0442                	slli	s0,s0,0x10
    1102:	8fc1                	or	a5,a5,s0
    1104:	0067fc63          	bgeu	a5,t1,111c <__divdf3+0x272>
    1108:	97b2                	add	a5,a5,a2
    110a:	fff28393          	addi	t2,t0,-1 # 7fffff <__ctor_end__+0x7f779f>
    110e:	00c7e763          	bltu	a5,a2,111c <__divdf3+0x272>
    1112:	0067f563          	bgeu	a5,t1,111c <__divdf3+0x272>
    1116:	ffe28393          	addi	t2,t0,-2
    111a:	97b2                	add	a5,a5,a2
    111c:	06c2                	slli	a3,a3,0x10
    111e:	6441                	lui	s0,0x10
    1120:	0076e6b3          	or	a3,a3,t2
    1124:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0x779f>
    1128:	00e6f2b3          	and	t0,a3,a4
    112c:	406787b3          	sub	a5,a5,t1
    1130:	8f6d                	and	a4,a4,a1
    1132:	0106d313          	srli	t1,a3,0x10
    1136:	025703b3          	mul	t2,a4,t0
    113a:	c43a                	sw	a4,8(sp)
    113c:	02e30733          	mul	a4,t1,a4
    1140:	c63a                	sw	a4,12(sp)
    1142:	0105d713          	srli	a4,a1,0x10
    1146:	025702b3          	mul	t0,a4,t0
    114a:	02e30333          	mul	t1,t1,a4
    114e:	4732                	lw	a4,12(sp)
    1150:	92ba                	add	t0,t0,a4
    1152:	0103d713          	srli	a4,t2,0x10
    1156:	9716                	add	a4,a4,t0
    1158:	42b2                	lw	t0,12(sp)
    115a:	00577363          	bgeu	a4,t0,1160 <__divdf3+0x2b6>
    115e:	9322                	add	t1,t1,s0
    1160:	6441                	lui	s0,0x10
    1162:	147d                	addi	s0,s0,-1
    1164:	01075293          	srli	t0,a4,0x10
    1168:	8f61                	and	a4,a4,s0
    116a:	0742                	slli	a4,a4,0x10
    116c:	0083f3b3          	and	t2,t2,s0
    1170:	9316                	add	t1,t1,t0
    1172:	971e                	add	a4,a4,t2
    1174:	0067e763          	bltu	a5,t1,1182 <__divdf3+0x2d8>
    1178:	83b6                	mv	t2,a3
    117a:	02679e63          	bne	a5,t1,11b6 <__divdf3+0x30c>
    117e:	02e57c63          	bgeu	a0,a4,11b6 <__divdf3+0x30c>
    1182:	952e                	add	a0,a0,a1
    1184:	00b532b3          	sltu	t0,a0,a1
    1188:	92b2                	add	t0,t0,a2
    118a:	9796                	add	a5,a5,t0
    118c:	fff68393          	addi	t2,a3,-1 # 7fffff <__ctor_end__+0x7f779f>
    1190:	00f66663          	bltu	a2,a5,119c <__divdf3+0x2f2>
    1194:	02f61163          	bne	a2,a5,11b6 <__divdf3+0x30c>
    1198:	00b56f63          	bltu	a0,a1,11b6 <__divdf3+0x30c>
    119c:	0067e663          	bltu	a5,t1,11a8 <__divdf3+0x2fe>
    11a0:	00f31b63          	bne	t1,a5,11b6 <__divdf3+0x30c>
    11a4:	00e57963          	bgeu	a0,a4,11b6 <__divdf3+0x30c>
    11a8:	952e                	add	a0,a0,a1
    11aa:	ffe68393          	addi	t2,a3,-2
    11ae:	00b536b3          	sltu	a3,a0,a1
    11b2:	96b2                	add	a3,a3,a2
    11b4:	97b6                	add	a5,a5,a3
    11b6:	40e502b3          	sub	t0,a0,a4
    11ba:	40678333          	sub	t1,a5,t1
    11be:	00553533          	sltu	a0,a0,t0
    11c2:	40a30333          	sub	t1,t1,a0
    11c6:	577d                	li	a4,-1
    11c8:	10660063          	beq	a2,t1,12c8 <__divdf3+0x41e>
    11cc:	02935433          	divu	s0,t1,s1
    11d0:	01061793          	slli	a5,a2,0x10
    11d4:	83c1                	srli	a5,a5,0x10
    11d6:	0102d693          	srli	a3,t0,0x10
    11da:	02878733          	mul	a4,a5,s0
    11de:	029377b3          	remu	a5,t1,s1
    11e2:	07c2                	slli	a5,a5,0x10
    11e4:	8fd5                	or	a5,a5,a3
    11e6:	86a2                	mv	a3,s0
    11e8:	00e7fc63          	bgeu	a5,a4,1200 <__divdf3+0x356>
    11ec:	97b2                	add	a5,a5,a2
    11ee:	fff40693          	addi	a3,s0,-1 # ffff <__ctor_end__+0x779f>
    11f2:	00c7e763          	bltu	a5,a2,1200 <__divdf3+0x356>
    11f6:	00e7f563          	bgeu	a5,a4,1200 <__divdf3+0x356>
    11fa:	ffe40693          	addi	a3,s0,-2
    11fe:	97b2                	add	a5,a5,a2
    1200:	40e78733          	sub	a4,a5,a4
    1204:	02975333          	divu	t1,a4,s1
    1208:	01061793          	slli	a5,a2,0x10
    120c:	83c1                	srli	a5,a5,0x10
    120e:	02678533          	mul	a0,a5,t1
    1212:	841a                	mv	s0,t1
    1214:	029777b3          	remu	a5,a4,s1
    1218:	01029713          	slli	a4,t0,0x10
    121c:	8341                	srli	a4,a4,0x10
    121e:	07c2                	slli	a5,a5,0x10
    1220:	8fd9                	or	a5,a5,a4
    1222:	00a7fc63          	bgeu	a5,a0,123a <__divdf3+0x390>
    1226:	97b2                	add	a5,a5,a2
    1228:	fff30413          	addi	s0,t1,-1
    122c:	00c7e763          	bltu	a5,a2,123a <__divdf3+0x390>
    1230:	00a7f563          	bgeu	a5,a0,123a <__divdf3+0x390>
    1234:	ffe30413          	addi	s0,t1,-2
    1238:	97b2                	add	a5,a5,a2
    123a:	06c2                	slli	a3,a3,0x10
    123c:	8ec1                	or	a3,a3,s0
    123e:	4422                	lw	s0,8(sp)
    1240:	8f89                	sub	a5,a5,a0
    1242:	4522                	lw	a0,8(sp)
    1244:	0106d293          	srli	t0,a3,0x10
    1248:	01069713          	slli	a4,a3,0x10
    124c:	02828333          	mul	t1,t0,s0
    1250:	8341                	srli	a4,a4,0x10
    1252:	0105d413          	srli	s0,a1,0x10
    1256:	02a70533          	mul	a0,a4,a0
    125a:	02e40733          	mul	a4,s0,a4
    125e:	025402b3          	mul	t0,s0,t0
    1262:	971a                	add	a4,a4,t1
    1264:	01055413          	srli	s0,a0,0x10
    1268:	9722                	add	a4,a4,s0
    126a:	00677463          	bgeu	a4,t1,1272 <__divdf3+0x3c8>
    126e:	6341                	lui	t1,0x10
    1270:	929a                	add	t0,t0,t1
    1272:	01075313          	srli	t1,a4,0x10
    1276:	929a                	add	t0,t0,t1
    1278:	6341                	lui	t1,0x10
    127a:	137d                	addi	t1,t1,-1
    127c:	00677733          	and	a4,a4,t1
    1280:	0742                	slli	a4,a4,0x10
    1282:	00657533          	and	a0,a0,t1
    1286:	953a                	add	a0,a0,a4
    1288:	0057e663          	bltu	a5,t0,1294 <__divdf3+0x3ea>
    128c:	1a579663          	bne	a5,t0,1438 <__divdf3+0x58e>
    1290:	8736                	mv	a4,a3
    1292:	c91d                	beqz	a0,12c8 <__divdf3+0x41e>
    1294:	97b2                	add	a5,a5,a2
    1296:	fff68713          	addi	a4,a3,-1
    129a:	02c7e163          	bltu	a5,a2,12bc <__divdf3+0x412>
    129e:	0057e663          	bltu	a5,t0,12aa <__divdf3+0x400>
    12a2:	18579a63          	bne	a5,t0,1436 <__divdf3+0x58c>
    12a6:	00a5fd63          	bgeu	a1,a0,12c0 <__divdf3+0x416>
    12aa:	ffe68713          	addi	a4,a3,-2
    12ae:	00159693          	slli	a3,a1,0x1
    12b2:	00b6b5b3          	sltu	a1,a3,a1
    12b6:	962e                	add	a2,a2,a1
    12b8:	97b2                	add	a5,a5,a2
    12ba:	85b6                	mv	a1,a3
    12bc:	00579463          	bne	a5,t0,12c4 <__divdf3+0x41a>
    12c0:	00b50463          	beq	a0,a1,12c8 <__divdf3+0x41e>
    12c4:	00176713          	ori	a4,a4,1
    12c8:	4792                	lw	a5,4(sp)
    12ca:	3ff78793          	addi	a5,a5,1023 # 8003ff <__ctor_end__+0x7f7b9f>
    12ce:	0af05e63          	blez	a5,138a <__divdf3+0x4e0>
    12d2:	00777693          	andi	a3,a4,7
    12d6:	ce81                	beqz	a3,12ee <__divdf3+0x444>
    12d8:	00f77693          	andi	a3,a4,15
    12dc:	4611                	li	a2,4
    12de:	00c68863          	beq	a3,a2,12ee <__divdf3+0x444>
    12e2:	00470693          	addi	a3,a4,4 # ff800004 <__heap_end+0xdf7d0004>
    12e6:	00e6b733          	sltu	a4,a3,a4
    12ea:	93ba                	add	t2,t2,a4
    12ec:	8736                	mv	a4,a3
    12ee:	010006b7          	lui	a3,0x1000
    12f2:	00d3f6b3          	and	a3,t2,a3
    12f6:	ca89                	beqz	a3,1308 <__divdf3+0x45e>
    12f8:	ff0007b7          	lui	a5,0xff000
    12fc:	17fd                	addi	a5,a5,-1
    12fe:	00f3f3b3          	and	t2,t2,a5
    1302:	4792                	lw	a5,4(sp)
    1304:	40078793          	addi	a5,a5,1024 # ff000400 <__heap_end+0xdefd0400>
    1308:	7fe00693          	li	a3,2046
    130c:	06f6c163          	blt	a3,a5,136e <__divdf3+0x4c4>
    1310:	01d39693          	slli	a3,t2,0x1d
    1314:	830d                	srli	a4,a4,0x3
    1316:	8f55                	or	a4,a4,a3
    1318:	0033d393          	srli	t2,t2,0x3
    131c:	7ff006b7          	lui	a3,0x7ff00
    1320:	07d2                	slli	a5,a5,0x14
    1322:	8ff5                	and	a5,a5,a3
    1324:	4682                	lw	a3,0(sp)
    1326:	03b2                	slli	t2,t2,0xc
    1328:	5082                	lw	ra,32(sp)
    132a:	4472                	lw	s0,28(sp)
    132c:	00c3d393          	srli	t2,t2,0xc
    1330:	01f69593          	slli	a1,a3,0x1f
    1334:	0077e7b3          	or	a5,a5,t2
    1338:	00b7e6b3          	or	a3,a5,a1
    133c:	44e2                	lw	s1,24(sp)
    133e:	853a                	mv	a0,a4
    1340:	85b6                	mv	a1,a3
    1342:	02410113          	addi	sp,sp,36
    1346:	8082                	ret
    1348:	4692                	lw	a3,4(sp)
    134a:	4501                	li	a0,0
    134c:	16fd                	addi	a3,a3,-1
    134e:	c236                	sw	a3,4(sp)
    1350:	b3b9                	j	109e <__divdf3+0x1f4>
    1352:	4722                	lw	a4,8(sp)
    1354:	83a2                	mv	t2,s0
    1356:	869a                	mv	a3,t1
    1358:	c03a                	sw	a4,0(sp)
    135a:	873e                	mv	a4,a5
    135c:	478d                	li	a5,3
    135e:	0af68e63          	beq	a3,a5,141a <__divdf3+0x570>
    1362:	4785                	li	a5,1
    1364:	0cf68263          	beq	a3,a5,1428 <__divdf3+0x57e>
    1368:	4789                	li	a5,2
    136a:	f4f69fe3          	bne	a3,a5,12c8 <__divdf3+0x41e>
    136e:	4381                	li	t2,0
    1370:	4701                	li	a4,0
    1372:	7ff00793          	li	a5,2047
    1376:	b75d                	j	131c <__divdf3+0x472>
    1378:	47b2                	lw	a5,12(sp)
    137a:	c03e                	sw	a5,0(sp)
    137c:	b7c5                	j	135c <__divdf3+0x4b2>
    137e:	000803b7          	lui	t2,0x80
    1382:	4701                	li	a4,0
    1384:	c002                	sw	zero,0(sp)
    1386:	468d                	li	a3,3
    1388:	bfd1                	j	135c <__divdf3+0x4b2>
    138a:	4685                	li	a3,1
    138c:	8e9d                	sub	a3,a3,a5
    138e:	03800613          	li	a2,56
    1392:	08d64b63          	blt	a2,a3,1428 <__divdf3+0x57e>
    1396:	467d                	li	a2,31
    1398:	04d64c63          	blt	a2,a3,13f0 <__divdf3+0x546>
    139c:	4792                	lw	a5,4(sp)
    139e:	00d75633          	srl	a2,a4,a3
    13a2:	41e78593          	addi	a1,a5,1054
    13a6:	00b397b3          	sll	a5,t2,a1
    13aa:	00b71733          	sll	a4,a4,a1
    13ae:	8fd1                	or	a5,a5,a2
    13b0:	00e03733          	snez	a4,a4
    13b4:	8f5d                	or	a4,a4,a5
    13b6:	00d3d3b3          	srl	t2,t2,a3
    13ba:	00777793          	andi	a5,a4,7
    13be:	cf81                	beqz	a5,13d6 <__divdf3+0x52c>
    13c0:	00f77793          	andi	a5,a4,15
    13c4:	4691                	li	a3,4
    13c6:	00d78863          	beq	a5,a3,13d6 <__divdf3+0x52c>
    13ca:	00470693          	addi	a3,a4,4
    13ce:	00e6b733          	sltu	a4,a3,a4
    13d2:	93ba                	add	t2,t2,a4
    13d4:	8736                	mv	a4,a3
    13d6:	008007b7          	lui	a5,0x800
    13da:	00f3f7b3          	and	a5,t2,a5
    13de:	eba1                	bnez	a5,142e <__divdf3+0x584>
    13e0:	01d39793          	slli	a5,t2,0x1d
    13e4:	830d                	srli	a4,a4,0x3
    13e6:	8f5d                	or	a4,a4,a5
    13e8:	0033d393          	srli	t2,t2,0x3
    13ec:	4781                	li	a5,0
    13ee:	b73d                	j	131c <__divdf3+0x472>
    13f0:	5605                	li	a2,-31
    13f2:	40f607b3          	sub	a5,a2,a5
    13f6:	02000613          	li	a2,32
    13fa:	00f3d7b3          	srl	a5,t2,a5
    13fe:	4581                	li	a1,0
    1400:	00c68763          	beq	a3,a2,140e <__divdf3+0x564>
    1404:	4692                	lw	a3,4(sp)
    1406:	43e68593          	addi	a1,a3,1086 # 7ff0043e <__heap_end+0x5fed043e>
    140a:	00b395b3          	sll	a1,t2,a1
    140e:	8f4d                	or	a4,a4,a1
    1410:	00e03733          	snez	a4,a4
    1414:	8f5d                	or	a4,a4,a5
    1416:	4381                	li	t2,0
    1418:	b74d                	j	13ba <__divdf3+0x510>
    141a:	000803b7          	lui	t2,0x80
    141e:	4701                	li	a4,0
    1420:	7ff00793          	li	a5,2047
    1424:	c002                	sw	zero,0(sp)
    1426:	bddd                	j	131c <__divdf3+0x472>
    1428:	4381                	li	t2,0
    142a:	4701                	li	a4,0
    142c:	b7c1                	j	13ec <__divdf3+0x542>
    142e:	4381                	li	t2,0
    1430:	4701                	li	a4,0
    1432:	4785                	li	a5,1
    1434:	b5e5                	j	131c <__divdf3+0x472>
    1436:	86ba                	mv	a3,a4
    1438:	8736                	mv	a4,a3
    143a:	b569                	j	12c4 <__divdf3+0x41a>

0000143c <__eqdf2>:
    143c:	001007b7          	lui	a5,0x100
    1440:	17fd                	addi	a5,a5,-1
    1442:	1151                	addi	sp,sp,-12
    1444:	00b7f2b3          	and	t0,a5,a1
    1448:	0145d713          	srli	a4,a1,0x14
    144c:	81fd                	srli	a1,a1,0x1f
    144e:	c422                	sw	s0,8(sp)
    1450:	c226                	sw	s1,4(sp)
    1452:	832a                	mv	t1,a0
    1454:	842a                	mv	s0,a0
    1456:	c02e                	sw	a1,0(sp)
    1458:	7ff77713          	andi	a4,a4,2047
    145c:	0146d593          	srli	a1,a3,0x14
    1460:	7ff00513          	li	a0,2047
    1464:	8ff5                	and	a5,a5,a3
    1466:	84b2                	mv	s1,a2
    1468:	7ff5f593          	andi	a1,a1,2047
    146c:	82fd                	srli	a3,a3,0x1f
    146e:	00a71a63          	bne	a4,a0,1482 <__eqdf2+0x46>
    1472:	0062e3b3          	or	t2,t0,t1
    1476:	4505                	li	a0,1
    1478:	02039a63          	bnez	t2,14ac <__eqdf2+0x70>
    147c:	02e59863          	bne	a1,a4,14ac <__eqdf2+0x70>
    1480:	a019                	j	1486 <__eqdf2+0x4a>
    1482:	00a59563          	bne	a1,a0,148c <__eqdf2+0x50>
    1486:	8e5d                	or	a2,a2,a5
    1488:	4505                	li	a0,1
    148a:	e20d                	bnez	a2,14ac <__eqdf2+0x70>
    148c:	4505                	li	a0,1
    148e:	00b71f63          	bne	a4,a1,14ac <__eqdf2+0x70>
    1492:	00f29d63          	bne	t0,a5,14ac <__eqdf2+0x70>
    1496:	00941b63          	bne	s0,s1,14ac <__eqdf2+0x70>
    149a:	4782                	lw	a5,0(sp)
    149c:	00d78c63          	beq	a5,a3,14b4 <__eqdf2+0x78>
    14a0:	00071663          	bnez	a4,14ac <__eqdf2+0x70>
    14a4:	0062e533          	or	a0,t0,t1
    14a8:	00a03533          	snez	a0,a0
    14ac:	4422                	lw	s0,8(sp)
    14ae:	4492                	lw	s1,4(sp)
    14b0:	0131                	addi	sp,sp,12
    14b2:	8082                	ret
    14b4:	4501                	li	a0,0
    14b6:	bfdd                	j	14ac <__eqdf2+0x70>

000014b8 <__gedf2>:
    14b8:	00100737          	lui	a4,0x100
    14bc:	1161                	addi	sp,sp,-8
    14be:	177d                	addi	a4,a4,-1
    14c0:	0145d313          	srli	t1,a1,0x14
    14c4:	00b772b3          	and	t0,a4,a1
    14c8:	c222                	sw	s0,4(sp)
    14ca:	c026                	sw	s1,0(sp)
    14cc:	87aa                	mv	a5,a0
    14ce:	83aa                	mv	t2,a0
    14d0:	7ff37313          	andi	t1,t1,2047
    14d4:	01f5d513          	srli	a0,a1,0x1f
    14d8:	7ff00493          	li	s1,2047
    14dc:	0146d593          	srli	a1,a3,0x14
    14e0:	8f75                	and	a4,a4,a3
    14e2:	8432                	mv	s0,a2
    14e4:	7ff5f593          	andi	a1,a1,2047
    14e8:	82fd                	srli	a3,a3,0x1f
    14ea:	00931763          	bne	t1,s1,14f8 <__gedf2+0x40>
    14ee:	00f2e4b3          	or	s1,t0,a5
    14f2:	c8a5                	beqz	s1,1562 <__gedf2+0xaa>
    14f4:	5579                	li	a0,-2
    14f6:	a825                	j	152e <__gedf2+0x76>
    14f8:	00959563          	bne	a1,s1,1502 <__gedf2+0x4a>
    14fc:	00c764b3          	or	s1,a4,a2
    1500:	f8f5                	bnez	s1,14f4 <__gedf2+0x3c>
    1502:	06031263          	bnez	t1,1566 <__gedf2+0xae>
    1506:	00f2e7b3          	or	a5,t0,a5
    150a:	0017b793          	seqz	a5,a5
    150e:	e199                	bnez	a1,1514 <__gedf2+0x5c>
    1510:	8e59                	or	a2,a2,a4
    1512:	c239                	beqz	a2,1558 <__gedf2+0xa0>
    1514:	00079a63          	bnez	a5,1528 <__gedf2+0x70>
    1518:	00d51463          	bne	a0,a3,1520 <__gedf2+0x68>
    151c:	0065dd63          	bge	a1,t1,1536 <__gedf2+0x7e>
    1520:	02050a63          	beqz	a0,1554 <__gedf2+0x9c>
    1524:	557d                	li	a0,-1
    1526:	a021                	j	152e <__gedf2+0x76>
    1528:	557d                	li	a0,-1
    152a:	c291                	beqz	a3,152e <__gedf2+0x76>
    152c:	8536                	mv	a0,a3
    152e:	4412                	lw	s0,4(sp)
    1530:	4482                	lw	s1,0(sp)
    1532:	0121                	addi	sp,sp,8
    1534:	8082                	ret
    1536:	00b35563          	bge	t1,a1,1540 <__gedf2+0x88>
    153a:	fe051ae3          	bnez	a0,152e <__gedf2+0x76>
    153e:	b7dd                	j	1524 <__gedf2+0x6c>
    1540:	fe5760e3          	bltu	a4,t0,1520 <__gedf2+0x68>
    1544:	00e29c63          	bne	t0,a4,155c <__gedf2+0xa4>
    1548:	fc746ce3          	bltu	s0,t2,1520 <__gedf2+0x68>
    154c:	fe83e7e3          	bltu	t2,s0,153a <__gedf2+0x82>
    1550:	4501                	li	a0,0
    1552:	bff1                	j	152e <__gedf2+0x76>
    1554:	4505                	li	a0,1
    1556:	bfe1                	j	152e <__gedf2+0x76>
    1558:	ffe5                	bnez	a5,1550 <__gedf2+0x98>
    155a:	b7d9                	j	1520 <__gedf2+0x68>
    155c:	fce2efe3          	bltu	t0,a4,153a <__gedf2+0x82>
    1560:	bfc5                	j	1550 <__gedf2+0x98>
    1562:	f8658de3          	beq	a1,t1,14fc <__gedf2+0x44>
    1566:	fa0599e3          	bnez	a1,1518 <__gedf2+0x60>
    156a:	4781                	li	a5,0
    156c:	b755                	j	1510 <__gedf2+0x58>

0000156e <__ledf2>:
    156e:	00100737          	lui	a4,0x100
    1572:	1161                	addi	sp,sp,-8
    1574:	177d                	addi	a4,a4,-1
    1576:	0145d313          	srli	t1,a1,0x14
    157a:	00b772b3          	and	t0,a4,a1
    157e:	c222                	sw	s0,4(sp)
    1580:	c026                	sw	s1,0(sp)
    1582:	87aa                	mv	a5,a0
    1584:	83aa                	mv	t2,a0
    1586:	7ff37313          	andi	t1,t1,2047
    158a:	01f5d513          	srli	a0,a1,0x1f
    158e:	7ff00493          	li	s1,2047
    1592:	0146d593          	srli	a1,a3,0x14
    1596:	8f75                	and	a4,a4,a3
    1598:	8432                	mv	s0,a2
    159a:	7ff5f593          	andi	a1,a1,2047
    159e:	82fd                	srli	a3,a3,0x1f
    15a0:	00931763          	bne	t1,s1,15ae <__ledf2+0x40>
    15a4:	00f2e4b3          	or	s1,t0,a5
    15a8:	c8a5                	beqz	s1,1618 <__ledf2+0xaa>
    15aa:	4509                	li	a0,2
    15ac:	a825                	j	15e4 <__ledf2+0x76>
    15ae:	00959563          	bne	a1,s1,15b8 <__ledf2+0x4a>
    15b2:	00c764b3          	or	s1,a4,a2
    15b6:	f8f5                	bnez	s1,15aa <__ledf2+0x3c>
    15b8:	06031263          	bnez	t1,161c <__ledf2+0xae>
    15bc:	00f2e7b3          	or	a5,t0,a5
    15c0:	0017b793          	seqz	a5,a5
    15c4:	e199                	bnez	a1,15ca <__ledf2+0x5c>
    15c6:	8e59                	or	a2,a2,a4
    15c8:	c239                	beqz	a2,160e <__ledf2+0xa0>
    15ca:	00079a63          	bnez	a5,15de <__ledf2+0x70>
    15ce:	00d51463          	bne	a0,a3,15d6 <__ledf2+0x68>
    15d2:	0065dd63          	bge	a1,t1,15ec <__ledf2+0x7e>
    15d6:	02050a63          	beqz	a0,160a <__ledf2+0x9c>
    15da:	557d                	li	a0,-1
    15dc:	a021                	j	15e4 <__ledf2+0x76>
    15de:	557d                	li	a0,-1
    15e0:	c291                	beqz	a3,15e4 <__ledf2+0x76>
    15e2:	8536                	mv	a0,a3
    15e4:	4412                	lw	s0,4(sp)
    15e6:	4482                	lw	s1,0(sp)
    15e8:	0121                	addi	sp,sp,8
    15ea:	8082                	ret
    15ec:	00b35563          	bge	t1,a1,15f6 <__ledf2+0x88>
    15f0:	fe051ae3          	bnez	a0,15e4 <__ledf2+0x76>
    15f4:	b7dd                	j	15da <__ledf2+0x6c>
    15f6:	fe5760e3          	bltu	a4,t0,15d6 <__ledf2+0x68>
    15fa:	00e29c63          	bne	t0,a4,1612 <__ledf2+0xa4>
    15fe:	fc746ce3          	bltu	s0,t2,15d6 <__ledf2+0x68>
    1602:	fe83e7e3          	bltu	t2,s0,15f0 <__ledf2+0x82>
    1606:	4501                	li	a0,0
    1608:	bff1                	j	15e4 <__ledf2+0x76>
    160a:	4505                	li	a0,1
    160c:	bfe1                	j	15e4 <__ledf2+0x76>
    160e:	ffe5                	bnez	a5,1606 <__ledf2+0x98>
    1610:	b7d9                	j	15d6 <__ledf2+0x68>
    1612:	fce2efe3          	bltu	t0,a4,15f0 <__ledf2+0x82>
    1616:	bfc5                	j	1606 <__ledf2+0x98>
    1618:	f8658de3          	beq	a1,t1,15b2 <__ledf2+0x44>
    161c:	fa0599e3          	bnez	a1,15ce <__ledf2+0x60>
    1620:	4781                	li	a5,0
    1622:	b755                	j	15c6 <__ledf2+0x58>

00001624 <__muldf3>:
    1624:	fd810113          	addi	sp,sp,-40
    1628:	0145d293          	srli	t0,a1,0x14
    162c:	01f5d793          	srli	a5,a1,0x1f
    1630:	d022                	sw	s0,32(sp)
    1632:	00c59313          	slli	t1,a1,0xc
    1636:	d206                	sw	ra,36(sp)
    1638:	ce26                	sw	s1,28(sp)
    163a:	7ff2f293          	andi	t0,t0,2047
    163e:	c43e                	sw	a5,8(sp)
    1640:	842a                	mv	s0,a0
    1642:	00c35313          	srli	t1,t1,0xc
    1646:	08028863          	beqz	t0,16d6 <__muldf3+0xb2>
    164a:	7ff00793          	li	a5,2047
    164e:	0ef28763          	beq	t0,a5,173c <__muldf3+0x118>
    1652:	01d55793          	srli	a5,a0,0x1d
    1656:	030e                	slli	t1,t1,0x3
    1658:	0067e333          	or	t1,a5,t1
    165c:	008007b7          	lui	a5,0x800
    1660:	00f36333          	or	t1,t1,a5
    1664:	00351593          	slli	a1,a0,0x3
    1668:	c0128293          	addi	t0,t0,-1023
    166c:	4481                	li	s1,0
    166e:	0146d513          	srli	a0,a3,0x14
    1672:	01f6d793          	srli	a5,a3,0x1f
    1676:	00c69413          	slli	s0,a3,0xc
    167a:	7ff57513          	andi	a0,a0,2047
    167e:	c63e                	sw	a5,12(sp)
    1680:	8031                	srli	s0,s0,0xc
    1682:	cd71                	beqz	a0,175e <__muldf3+0x13a>
    1684:	7ff00793          	li	a5,2047
    1688:	14f50463          	beq	a0,a5,17d0 <__muldf3+0x1ac>
    168c:	01d65793          	srli	a5,a2,0x1d
    1690:	040e                	slli	s0,s0,0x3
    1692:	8c5d                	or	s0,s0,a5
    1694:	008007b7          	lui	a5,0x800
    1698:	8c5d                	or	s0,s0,a5
    169a:	00361713          	slli	a4,a2,0x3
    169e:	c0150513          	addi	a0,a0,-1023
    16a2:	4781                	li	a5,0
    16a4:	4632                	lw	a2,12(sp)
    16a6:	46a2                	lw	a3,8(sp)
    16a8:	8eb1                	xor	a3,a3,a2
    16aa:	c036                	sw	a3,0(sp)
    16ac:	00a286b3          	add	a3,t0,a0
    16b0:	c836                	sw	a3,16(sp)
    16b2:	0685                	addi	a3,a3,1
    16b4:	c236                	sw	a3,4(sp)
    16b6:	00249693          	slli	a3,s1,0x2
    16ba:	8edd                	or	a3,a3,a5
    16bc:	16fd                	addi	a3,a3,-1
    16be:	4639                	li	a2,14
    16c0:	12d66963          	bltu	a2,a3,17f2 <__muldf3+0x1ce>
    16c4:	00006617          	auipc	a2,0x6
    16c8:	b8860613          	addi	a2,a2,-1144 # 724c <__srodata+0x3c>
    16cc:	068a                	slli	a3,a3,0x2
    16ce:	96b2                	add	a3,a3,a2
    16d0:	4294                	lw	a3,0(a3)
    16d2:	96b2                	add	a3,a3,a2
    16d4:	8682                	jr	a3
    16d6:	00a365b3          	or	a1,t1,a0
    16da:	c9ad                	beqz	a1,174c <__muldf3+0x128>
    16dc:	c636                	sw	a3,12(sp)
    16de:	c232                	sw	a2,4(sp)
    16e0:	02030f63          	beqz	t1,171e <__muldf3+0xfa>
    16e4:	851a                	mv	a0,t1
    16e6:	c01a                	sw	t1,0(sp)
    16e8:	29b000ef          	jal	ra,2182 <__clzsi2>
    16ec:	4302                	lw	t1,0(sp)
    16ee:	4612                	lw	a2,4(sp)
    16f0:	46b2                	lw	a3,12(sp)
    16f2:	ff550713          	addi	a4,a0,-11
    16f6:	47f1                	li	a5,28
    16f8:	02e7cc63          	blt	a5,a4,1730 <__muldf3+0x10c>
    16fc:	47f5                	li	a5,29
    16fe:	ff850593          	addi	a1,a0,-8
    1702:	8f99                	sub	a5,a5,a4
    1704:	00b31333          	sll	t1,t1,a1
    1708:	00f457b3          	srl	a5,s0,a5
    170c:	0067e333          	or	t1,a5,t1
    1710:	00b415b3          	sll	a1,s0,a1
    1714:	c0d00293          	li	t0,-1011
    1718:	40a282b3          	sub	t0,t0,a0
    171c:	bf81                	j	166c <__muldf3+0x48>
    171e:	c01a                	sw	t1,0(sp)
    1720:	263000ef          	jal	ra,2182 <__clzsi2>
    1724:	46b2                	lw	a3,12(sp)
    1726:	4612                	lw	a2,4(sp)
    1728:	4302                	lw	t1,0(sp)
    172a:	02050513          	addi	a0,a0,32
    172e:	b7d1                	j	16f2 <__muldf3+0xce>
    1730:	fd850313          	addi	t1,a0,-40
    1734:	00641333          	sll	t1,s0,t1
    1738:	4581                	li	a1,0
    173a:	bfe9                	j	1714 <__muldf3+0xf0>
    173c:	00a365b3          	or	a1,t1,a0
    1740:	c991                	beqz	a1,1754 <__muldf3+0x130>
    1742:	85aa                	mv	a1,a0
    1744:	7ff00293          	li	t0,2047
    1748:	448d                	li	s1,3
    174a:	b715                	j	166e <__muldf3+0x4a>
    174c:	4301                	li	t1,0
    174e:	4281                	li	t0,0
    1750:	4485                	li	s1,1
    1752:	bf31                	j	166e <__muldf3+0x4a>
    1754:	4301                	li	t1,0
    1756:	7ff00293          	li	t0,2047
    175a:	4489                	li	s1,2
    175c:	bf09                	j	166e <__muldf3+0x4a>
    175e:	00c46733          	or	a4,s0,a2
    1762:	cf3d                	beqz	a4,17e0 <__muldf3+0x1bc>
    1764:	04040263          	beqz	s0,17a8 <__muldf3+0x184>
    1768:	8522                	mv	a0,s0
    176a:	ca32                	sw	a2,20(sp)
    176c:	c81a                	sw	t1,16(sp)
    176e:	c22e                	sw	a1,4(sp)
    1770:	c016                	sw	t0,0(sp)
    1772:	211000ef          	jal	ra,2182 <__clzsi2>
    1776:	4282                	lw	t0,0(sp)
    1778:	4592                	lw	a1,4(sp)
    177a:	4342                	lw	t1,16(sp)
    177c:	4652                	lw	a2,20(sp)
    177e:	ff550693          	addi	a3,a0,-11
    1782:	47f1                	li	a5,28
    1784:	04d7c063          	blt	a5,a3,17c4 <__muldf3+0x1a0>
    1788:	47f5                	li	a5,29
    178a:	ff850713          	addi	a4,a0,-8
    178e:	8f95                	sub	a5,a5,a3
    1790:	00e41433          	sll	s0,s0,a4
    1794:	00f657b3          	srl	a5,a2,a5
    1798:	8c5d                	or	s0,s0,a5
    179a:	00e61733          	sll	a4,a2,a4
    179e:	c0d00793          	li	a5,-1011
    17a2:	40a78533          	sub	a0,a5,a0
    17a6:	bdf5                	j	16a2 <__muldf3+0x7e>
    17a8:	8532                	mv	a0,a2
    17aa:	ca1a                	sw	t1,20(sp)
    17ac:	c82e                	sw	a1,16(sp)
    17ae:	c216                	sw	t0,4(sp)
    17b0:	c032                	sw	a2,0(sp)
    17b2:	1d1000ef          	jal	ra,2182 <__clzsi2>
    17b6:	4352                	lw	t1,20(sp)
    17b8:	45c2                	lw	a1,16(sp)
    17ba:	4292                	lw	t0,4(sp)
    17bc:	4602                	lw	a2,0(sp)
    17be:	02050513          	addi	a0,a0,32
    17c2:	bf75                	j	177e <__muldf3+0x15a>
    17c4:	fd850413          	addi	s0,a0,-40
    17c8:	00861433          	sll	s0,a2,s0
    17cc:	4701                	li	a4,0
    17ce:	bfc1                	j	179e <__muldf3+0x17a>
    17d0:	00c46733          	or	a4,s0,a2
    17d4:	cb11                	beqz	a4,17e8 <__muldf3+0x1c4>
    17d6:	8732                	mv	a4,a2
    17d8:	7ff00513          	li	a0,2047
    17dc:	478d                	li	a5,3
    17de:	b5d9                	j	16a4 <__muldf3+0x80>
    17e0:	4401                	li	s0,0
    17e2:	4501                	li	a0,0
    17e4:	4785                	li	a5,1
    17e6:	bd7d                	j	16a4 <__muldf3+0x80>
    17e8:	4401                	li	s0,0
    17ea:	7ff00513          	li	a0,2047
    17ee:	4789                	li	a5,2
    17f0:	bd55                	j	16a4 <__muldf3+0x80>
    17f2:	0105d613          	srli	a2,a1,0x10
    17f6:	01075493          	srli	s1,a4,0x10
    17fa:	029606b3          	mul	a3,a2,s1
    17fe:	67c1                	lui	a5,0x10
    1800:	17fd                	addi	a5,a5,-1
    1802:	8dfd                	and	a1,a1,a5
    1804:	8f7d                	and	a4,a4,a5
    1806:	02e603b3          	mul	t2,a2,a4
    180a:	c436                	sw	a3,8(sp)
    180c:	02b486b3          	mul	a3,s1,a1
    1810:	02e58533          	mul	a0,a1,a4
    1814:	969e                	add	a3,a3,t2
    1816:	82b6                	mv	t0,a3
    1818:	01055693          	srli	a3,a0,0x10
    181c:	9696                	add	a3,a3,t0
    181e:	0076f763          	bgeu	a3,t2,182c <__muldf3+0x208>
    1822:	029603b3          	mul	t2,a2,s1
    1826:	62c1                	lui	t0,0x10
    1828:	929e                	add	t0,t0,t2
    182a:	c416                	sw	t0,8(sp)
    182c:	0106d293          	srli	t0,a3,0x10
    1830:	8efd                	and	a3,a3,a5
    1832:	8d7d                	and	a0,a0,a5
    1834:	06c2                	slli	a3,a3,0x10
    1836:	96aa                	add	a3,a3,a0
    1838:	8fe1                	and	a5,a5,s0
    183a:	01045513          	srli	a0,s0,0x10
    183e:	02f603b3          	mul	t2,a2,a5
    1842:	ca36                	sw	a3,20(sp)
    1844:	02f586b3          	mul	a3,a1,a5
    1848:	02b505b3          	mul	a1,a0,a1
    184c:	0106d413          	srli	s0,a3,0x10
    1850:	959e                	add	a1,a1,t2
    1852:	95a2                	add	a1,a1,s0
    1854:	02a60633          	mul	a2,a2,a0
    1858:	0075f463          	bgeu	a1,t2,1860 <__muldf3+0x23c>
    185c:	63c1                	lui	t2,0x10
    185e:	961e                	add	a2,a2,t2
    1860:	0105d393          	srli	t2,a1,0x10
    1864:	961e                	add	a2,a2,t2
    1866:	c632                	sw	a2,12(sp)
    1868:	6641                	lui	a2,0x10
    186a:	fff60393          	addi	t2,a2,-1 # ffff <__ctor_end__+0x779f>
    186e:	0075f5b3          	and	a1,a1,t2
    1872:	0076f6b3          	and	a3,a3,t2
    1876:	05c2                	slli	a1,a1,0x10
    1878:	95b6                	add	a1,a1,a3
    187a:	00b286b3          	add	a3,t0,a1
    187e:	01035293          	srli	t0,t1,0x10
    1882:	00737333          	and	t1,t1,t2
    1886:	026703b3          	mul	t2,a4,t1
    188a:	cc36                	sw	a3,24(sp)
    188c:	02e28733          	mul	a4,t0,a4
    1890:	026486b3          	mul	a3,s1,t1
    1894:	02548433          	mul	s0,s1,t0
    1898:	96ba                	add	a3,a3,a4
    189a:	0103d493          	srli	s1,t2,0x10
    189e:	96a6                	add	a3,a3,s1
    18a0:	00e6f363          	bgeu	a3,a4,18a6 <__muldf3+0x282>
    18a4:	9432                	add	s0,s0,a2
    18a6:	0106d613          	srli	a2,a3,0x10
    18aa:	6741                	lui	a4,0x10
    18ac:	9622                	add	a2,a2,s0
    18ae:	fff70413          	addi	s0,a4,-1 # ffff <__ctor_end__+0x779f>
    18b2:	026784b3          	mul	s1,a5,t1
    18b6:	8ee1                	and	a3,a3,s0
    18b8:	06c2                	slli	a3,a3,0x10
    18ba:	0083f3b3          	and	t2,t2,s0
    18be:	969e                	add	a3,a3,t2
    18c0:	02f287b3          	mul	a5,t0,a5
    18c4:	02650333          	mul	t1,a0,t1
    18c8:	025502b3          	mul	t0,a0,t0
    18cc:	933e                	add	t1,t1,a5
    18ce:	0104d513          	srli	a0,s1,0x10
    18d2:	932a                	add	t1,t1,a0
    18d4:	00f37363          	bgeu	t1,a5,18da <__muldf3+0x2b6>
    18d8:	92ba                	add	t0,t0,a4
    18da:	4762                	lw	a4,24(sp)
    18dc:	47a2                	lw	a5,8(sp)
    18de:	6541                	lui	a0,0x10
    18e0:	157d                	addi	a0,a0,-1
    18e2:	97ba                	add	a5,a5,a4
    18e4:	00a37733          	and	a4,t1,a0
    18e8:	0742                	slli	a4,a4,0x10
    18ea:	8ce9                	and	s1,s1,a0
    18ec:	94ba                	add	s1,s1,a4
    18ee:	4732                	lw	a4,12(sp)
    18f0:	00b7b5b3          	sltu	a1,a5,a1
    18f4:	97b6                	add	a5,a5,a3
    18f6:	94ba                	add	s1,s1,a4
    18f8:	00b48533          	add	a0,s1,a1
    18fc:	00d7b6b3          	sltu	a3,a5,a3
    1900:	00c50433          	add	s0,a0,a2
    1904:	00d403b3          	add	t2,s0,a3
    1908:	00e4b4b3          	sltu	s1,s1,a4
    190c:	00b535b3          	sltu	a1,a0,a1
    1910:	00d3b6b3          	sltu	a3,t2,a3
    1914:	8dc5                	or	a1,a1,s1
    1916:	01035313          	srli	t1,t1,0x10
    191a:	00c43433          	sltu	s0,s0,a2
    191e:	8c55                	or	s0,s0,a3
    1920:	959a                	add	a1,a1,t1
    1922:	942e                	add	s0,s0,a1
    1924:	46d2                	lw	a3,20(sp)
    1926:	92a2                	add	t0,t0,s0
    1928:	0173d713          	srli	a4,t2,0x17
    192c:	00929413          	slli	s0,t0,0x9
    1930:	8c59                	or	s0,s0,a4
    1932:	00979713          	slli	a4,a5,0x9
    1936:	8f55                	or	a4,a4,a3
    1938:	83dd                	srli	a5,a5,0x17
    193a:	00e03733          	snez	a4,a4
    193e:	8f5d                	or	a4,a4,a5
    1940:	010007b7          	lui	a5,0x1000
    1944:	03a6                	slli	t2,t2,0x9
    1946:	8fe1                	and	a5,a5,s0
    1948:	00776733          	or	a4,a4,t2
    194c:	c7dd                	beqz	a5,19fa <__muldf3+0x3d6>
    194e:	00175793          	srli	a5,a4,0x1
    1952:	8b05                	andi	a4,a4,1
    1954:	8f5d                	or	a4,a4,a5
    1956:	01f41793          	slli	a5,s0,0x1f
    195a:	8f5d                	or	a4,a4,a5
    195c:	8005                	srli	s0,s0,0x1
    195e:	4792                	lw	a5,4(sp)
    1960:	3ff78793          	addi	a5,a5,1023 # 10003ff <__ctor_end__+0xff7b9f>
    1964:	08f05e63          	blez	a5,1a00 <__muldf3+0x3dc>
    1968:	00777693          	andi	a3,a4,7
    196c:	ce81                	beqz	a3,1984 <__muldf3+0x360>
    196e:	00f77693          	andi	a3,a4,15
    1972:	4611                	li	a2,4
    1974:	00c68863          	beq	a3,a2,1984 <__muldf3+0x360>
    1978:	00470693          	addi	a3,a4,4
    197c:	00e6b733          	sltu	a4,a3,a4
    1980:	943a                	add	s0,s0,a4
    1982:	8736                	mv	a4,a3
    1984:	010006b7          	lui	a3,0x1000
    1988:	8ee1                	and	a3,a3,s0
    198a:	ca81                	beqz	a3,199a <__muldf3+0x376>
    198c:	ff0007b7          	lui	a5,0xff000
    1990:	17fd                	addi	a5,a5,-1
    1992:	8c7d                	and	s0,s0,a5
    1994:	4792                	lw	a5,4(sp)
    1996:	40078793          	addi	a5,a5,1024 # ff000400 <__heap_end+0xdefd0400>
    199a:	7fe00693          	li	a3,2046
    199e:	0ef6ce63          	blt	a3,a5,1a9a <__muldf3+0x476>
    19a2:	01d41693          	slli	a3,s0,0x1d
    19a6:	830d                	srli	a4,a4,0x3
    19a8:	8f55                	or	a4,a4,a3
    19aa:	800d                	srli	s0,s0,0x3
    19ac:	7ff006b7          	lui	a3,0x7ff00
    19b0:	07d2                	slli	a5,a5,0x14
    19b2:	0432                	slli	s0,s0,0xc
    19b4:	8ff5                	and	a5,a5,a3
    19b6:	8031                	srli	s0,s0,0xc
    19b8:	8c5d                	or	s0,s0,a5
    19ba:	4782                	lw	a5,0(sp)
    19bc:	5092                	lw	ra,36(sp)
    19be:	44f2                	lw	s1,28(sp)
    19c0:	07fe                	slli	a5,a5,0x1f
    19c2:	00f466b3          	or	a3,s0,a5
    19c6:	5402                	lw	s0,32(sp)
    19c8:	853a                	mv	a0,a4
    19ca:	85b6                	mv	a1,a3
    19cc:	02810113          	addi	sp,sp,40
    19d0:	8082                	ret
    19d2:	47a2                	lw	a5,8(sp)
    19d4:	c03e                	sw	a5,0(sp)
    19d6:	841a                	mv	s0,t1
    19d8:	872e                	mv	a4,a1
    19da:	87a6                	mv	a5,s1
    19dc:	4689                	li	a3,2
    19de:	0ad78e63          	beq	a5,a3,1a9a <__muldf3+0x476>
    19e2:	468d                	li	a3,3
    19e4:	0ad78463          	beq	a5,a3,1a8c <__muldf3+0x468>
    19e8:	4685                	li	a3,1
    19ea:	f6d79ae3          	bne	a5,a3,195e <__muldf3+0x33a>
    19ee:	4401                	li	s0,0
    19f0:	4701                	li	a4,0
    19f2:	a0b5                	j	1a5e <__muldf3+0x43a>
    19f4:	46b2                	lw	a3,12(sp)
    19f6:	c036                	sw	a3,0(sp)
    19f8:	b7d5                	j	19dc <__muldf3+0x3b8>
    19fa:	47c2                	lw	a5,16(sp)
    19fc:	c23e                	sw	a5,4(sp)
    19fe:	b785                	j	195e <__muldf3+0x33a>
    1a00:	4605                	li	a2,1
    1a02:	8e1d                	sub	a2,a2,a5
    1a04:	03800693          	li	a3,56
    1a08:	fec6c3e3          	blt	a3,a2,19ee <__muldf3+0x3ca>
    1a0c:	46fd                	li	a3,31
    1a0e:	04c6ca63          	blt	a3,a2,1a62 <__muldf3+0x43e>
    1a12:	4792                	lw	a5,4(sp)
    1a14:	00c755b3          	srl	a1,a4,a2
    1a18:	41e78793          	addi	a5,a5,1054
    1a1c:	00f416b3          	sll	a3,s0,a5
    1a20:	00f71733          	sll	a4,a4,a5
    1a24:	8ecd                	or	a3,a3,a1
    1a26:	00e03733          	snez	a4,a4
    1a2a:	8f55                	or	a4,a4,a3
    1a2c:	00c45433          	srl	s0,s0,a2
    1a30:	00777793          	andi	a5,a4,7
    1a34:	cf81                	beqz	a5,1a4c <__muldf3+0x428>
    1a36:	00f77793          	andi	a5,a4,15
    1a3a:	4691                	li	a3,4
    1a3c:	00d78863          	beq	a5,a3,1a4c <__muldf3+0x428>
    1a40:	00470793          	addi	a5,a4,4
    1a44:	00e7b733          	sltu	a4,a5,a4
    1a48:	943a                	add	s0,s0,a4
    1a4a:	873e                	mv	a4,a5
    1a4c:	008007b7          	lui	a5,0x800
    1a50:	8fe1                	and	a5,a5,s0
    1a52:	eba9                	bnez	a5,1aa4 <__muldf3+0x480>
    1a54:	01d41793          	slli	a5,s0,0x1d
    1a58:	830d                	srli	a4,a4,0x3
    1a5a:	8f5d                	or	a4,a4,a5
    1a5c:	800d                	srli	s0,s0,0x3
    1a5e:	4781                	li	a5,0
    1a60:	b7b1                	j	19ac <__muldf3+0x388>
    1a62:	5685                	li	a3,-31
    1a64:	40f687b3          	sub	a5,a3,a5
    1a68:	02000593          	li	a1,32
    1a6c:	00f457b3          	srl	a5,s0,a5
    1a70:	4681                	li	a3,0
    1a72:	00b60763          	beq	a2,a1,1a80 <__muldf3+0x45c>
    1a76:	4692                	lw	a3,4(sp)
    1a78:	43e68693          	addi	a3,a3,1086 # 7ff0043e <__heap_end+0x5fed043e>
    1a7c:	00d416b3          	sll	a3,s0,a3
    1a80:	8f55                	or	a4,a4,a3
    1a82:	00e03733          	snez	a4,a4
    1a86:	8f5d                	or	a4,a4,a5
    1a88:	4401                	li	s0,0
    1a8a:	b75d                	j	1a30 <__muldf3+0x40c>
    1a8c:	00080437          	lui	s0,0x80
    1a90:	4701                	li	a4,0
    1a92:	7ff00793          	li	a5,2047
    1a96:	c002                	sw	zero,0(sp)
    1a98:	bf11                	j	19ac <__muldf3+0x388>
    1a9a:	4401                	li	s0,0
    1a9c:	4701                	li	a4,0
    1a9e:	7ff00793          	li	a5,2047
    1aa2:	b729                	j	19ac <__muldf3+0x388>
    1aa4:	4401                	li	s0,0
    1aa6:	4701                	li	a4,0
    1aa8:	4785                	li	a5,1
    1aaa:	b709                	j	19ac <__muldf3+0x388>

00001aac <__subdf3>:
    1aac:	00100337          	lui	t1,0x100
    1ab0:	137d                	addi	t1,t1,-1
    1ab2:	1131                	addi	sp,sp,-20
    1ab4:	00b377b3          	and	a5,t1,a1
    1ab8:	0145d713          	srli	a4,a1,0x14
    1abc:	c426                	sw	s1,8(sp)
    1abe:	078e                	slli	a5,a5,0x3
    1ac0:	7ff77493          	andi	s1,a4,2047
    1ac4:	01d55713          	srli	a4,a0,0x1d
    1ac8:	8fd9                	or	a5,a5,a4
    1aca:	00d37733          	and	a4,t1,a3
    1ace:	c622                	sw	s0,12(sp)
    1ad0:	0146d313          	srli	t1,a3,0x14
    1ad4:	01f5d413          	srli	s0,a1,0x1f
    1ad8:	070e                	slli	a4,a4,0x3
    1ada:	01d65593          	srli	a1,a2,0x1d
    1ade:	8f4d                	or	a4,a4,a1
    1ae0:	c806                	sw	ra,16(sp)
    1ae2:	7ff37313          	andi	t1,t1,2047
    1ae6:	7ff00593          	li	a1,2047
    1aea:	050e                	slli	a0,a0,0x3
    1aec:	82fd                	srli	a3,a3,0x1f
    1aee:	060e                	slli	a2,a2,0x3
    1af0:	00b31563          	bne	t1,a1,1afa <__subdf3+0x4e>
    1af4:	00c765b3          	or	a1,a4,a2
    1af8:	e199                	bnez	a1,1afe <__subdf3+0x52>
    1afa:	0016c693          	xori	a3,a3,1
    1afe:	406482b3          	sub	t0,s1,t1
    1b02:	22869563          	bne	a3,s0,1d2c <__subdf3+0x280>
    1b06:	0e505263          	blez	t0,1bea <__subdf3+0x13e>
    1b0a:	02031863          	bnez	t1,1b3a <__subdf3+0x8e>
    1b0e:	00c766b3          	or	a3,a4,a2
    1b12:	56068f63          	beqz	a3,2090 <__subdf3+0x5e4>
    1b16:	fff28593          	addi	a1,t0,-1 # ffff <__ctor_end__+0x779f>
    1b1a:	e989                	bnez	a1,1b2c <__subdf3+0x80>
    1b1c:	962a                	add	a2,a2,a0
    1b1e:	00a63533          	sltu	a0,a2,a0
    1b22:	97ba                	add	a5,a5,a4
    1b24:	97aa                	add	a5,a5,a0
    1b26:	8532                	mv	a0,a2
    1b28:	4485                	li	s1,1
    1b2a:	a8b9                	j	1b88 <__subdf3+0xdc>
    1b2c:	7ff00693          	li	a3,2047
    1b30:	00d29d63          	bne	t0,a3,1b4a <__subdf3+0x9e>
    1b34:	7ff00493          	li	s1,2047
    1b38:	aa79                	j	1cd6 <__subdf3+0x22a>
    1b3a:	7ff00693          	li	a3,2047
    1b3e:	18d48c63          	beq	s1,a3,1cd6 <__subdf3+0x22a>
    1b42:	008006b7          	lui	a3,0x800
    1b46:	8f55                	or	a4,a4,a3
    1b48:	8596                	mv	a1,t0
    1b4a:	03800693          	li	a3,56
    1b4e:	08b6ca63          	blt	a3,a1,1be2 <__subdf3+0x136>
    1b52:	46fd                	li	a3,31
    1b54:	06b6c163          	blt	a3,a1,1bb6 <__subdf3+0x10a>
    1b58:	02000313          	li	t1,32
    1b5c:	40b30333          	sub	t1,t1,a1
    1b60:	006716b3          	sll	a3,a4,t1
    1b64:	00b652b3          	srl	t0,a2,a1
    1b68:	00661633          	sll	a2,a2,t1
    1b6c:	0056e6b3          	or	a3,a3,t0
    1b70:	00c03633          	snez	a2,a2
    1b74:	8e55                	or	a2,a2,a3
    1b76:	00b75733          	srl	a4,a4,a1
    1b7a:	962a                	add	a2,a2,a0
    1b7c:	00a63533          	sltu	a0,a2,a0
    1b80:	973e                	add	a4,a4,a5
    1b82:	00a707b3          	add	a5,a4,a0
    1b86:	8532                	mv	a0,a2
    1b88:	00800737          	lui	a4,0x800
    1b8c:	8f7d                	and	a4,a4,a5
    1b8e:	14070463          	beqz	a4,1cd6 <__subdf3+0x22a>
    1b92:	0485                	addi	s1,s1,1
    1b94:	7ff00713          	li	a4,2047
    1b98:	48e48c63          	beq	s1,a4,2030 <__subdf3+0x584>
    1b9c:	ff800737          	lui	a4,0xff800
    1ba0:	177d                	addi	a4,a4,-1
    1ba2:	8ff9                	and	a5,a5,a4
    1ba4:	00155713          	srli	a4,a0,0x1
    1ba8:	8905                	andi	a0,a0,1
    1baa:	8d59                	or	a0,a0,a4
    1bac:	01f79713          	slli	a4,a5,0x1f
    1bb0:	8d59                	or	a0,a0,a4
    1bb2:	8385                	srli	a5,a5,0x1
    1bb4:	a20d                	j	1cd6 <__subdf3+0x22a>
    1bb6:	fe058693          	addi	a3,a1,-32
    1bba:	02000293          	li	t0,32
    1bbe:	00d756b3          	srl	a3,a4,a3
    1bc2:	4301                	li	t1,0
    1bc4:	00558863          	beq	a1,t0,1bd4 <__subdf3+0x128>
    1bc8:	04000313          	li	t1,64
    1bcc:	40b305b3          	sub	a1,t1,a1
    1bd0:	00b71333          	sll	t1,a4,a1
    1bd4:	00c36633          	or	a2,t1,a2
    1bd8:	00c03633          	snez	a2,a2
    1bdc:	8e55                	or	a2,a2,a3
    1bde:	4701                	li	a4,0
    1be0:	bf69                	j	1b7a <__subdf3+0xce>
    1be2:	8e59                	or	a2,a2,a4
    1be4:	00c03633          	snez	a2,a2
    1be8:	bfdd                	j	1bde <__subdf3+0x132>
    1bea:	0a028a63          	beqz	t0,1c9e <__subdf3+0x1f2>
    1bee:	409305b3          	sub	a1,t1,s1
    1bf2:	e48d                	bnez	s1,1c1c <__subdf3+0x170>
    1bf4:	00a7e6b3          	or	a3,a5,a0
    1bf8:	42068363          	beqz	a3,201e <__subdf3+0x572>
    1bfc:	fff58693          	addi	a3,a1,-1
    1c00:	e699                	bnez	a3,1c0e <__subdf3+0x162>
    1c02:	9532                	add	a0,a0,a2
    1c04:	97ba                	add	a5,a5,a4
    1c06:	00c53633          	sltu	a2,a0,a2
    1c0a:	97b2                	add	a5,a5,a2
    1c0c:	bf31                	j	1b28 <__subdf3+0x7c>
    1c0e:	7ff00293          	li	t0,2047
    1c12:	00559d63          	bne	a1,t0,1c2c <__subdf3+0x180>
    1c16:	87ba                	mv	a5,a4
    1c18:	8532                	mv	a0,a2
    1c1a:	bf29                	j	1b34 <__subdf3+0x88>
    1c1c:	7ff00693          	li	a3,2047
    1c20:	fed30be3          	beq	t1,a3,1c16 <__subdf3+0x16a>
    1c24:	008006b7          	lui	a3,0x800
    1c28:	8fd5                	or	a5,a5,a3
    1c2a:	86ae                	mv	a3,a1
    1c2c:	03800593          	li	a1,56
    1c30:	06d5c363          	blt	a1,a3,1c96 <__subdf3+0x1ea>
    1c34:	45fd                	li	a1,31
    1c36:	02d5ca63          	blt	a1,a3,1c6a <__subdf3+0x1be>
    1c3a:	02000293          	li	t0,32
    1c3e:	40d282b3          	sub	t0,t0,a3
    1c42:	005795b3          	sll	a1,a5,t0
    1c46:	00d553b3          	srl	t2,a0,a3
    1c4a:	00551533          	sll	a0,a0,t0
    1c4e:	0075e5b3          	or	a1,a1,t2
    1c52:	00a03533          	snez	a0,a0
    1c56:	8d4d                	or	a0,a0,a1
    1c58:	00d7d7b3          	srl	a5,a5,a3
    1c5c:	9532                	add	a0,a0,a2
    1c5e:	97ba                	add	a5,a5,a4
    1c60:	00c53633          	sltu	a2,a0,a2
    1c64:	97b2                	add	a5,a5,a2
    1c66:	849a                	mv	s1,t1
    1c68:	b705                	j	1b88 <__subdf3+0xdc>
    1c6a:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f7780>
    1c6e:	02000393          	li	t2,32
    1c72:	00b7d5b3          	srl	a1,a5,a1
    1c76:	4281                	li	t0,0
    1c78:	00768863          	beq	a3,t2,1c88 <__subdf3+0x1dc>
    1c7c:	04000293          	li	t0,64
    1c80:	40d286b3          	sub	a3,t0,a3
    1c84:	00d792b3          	sll	t0,a5,a3
    1c88:	00a2e533          	or	a0,t0,a0
    1c8c:	00a03533          	snez	a0,a0
    1c90:	8d4d                	or	a0,a0,a1
    1c92:	4781                	li	a5,0
    1c94:	b7e1                	j	1c5c <__subdf3+0x1b0>
    1c96:	8d5d                	or	a0,a0,a5
    1c98:	00a03533          	snez	a0,a0
    1c9c:	bfdd                	j	1c92 <__subdf3+0x1e6>
    1c9e:	00148693          	addi	a3,s1,1
    1ca2:	7fe6f593          	andi	a1,a3,2046
    1ca6:	e1bd                	bnez	a1,1d0c <__subdf3+0x260>
    1ca8:	00a7e6b3          	or	a3,a5,a0
    1cac:	e4a9                	bnez	s1,1cf6 <__subdf3+0x24a>
    1cae:	36068c63          	beqz	a3,2026 <__subdf3+0x57a>
    1cb2:	00c766b3          	or	a3,a4,a2
    1cb6:	c285                	beqz	a3,1cd6 <__subdf3+0x22a>
    1cb8:	962a                	add	a2,a2,a0
    1cba:	97ba                	add	a5,a5,a4
    1cbc:	00a63533          	sltu	a0,a2,a0
    1cc0:	97aa                	add	a5,a5,a0
    1cc2:	00800737          	lui	a4,0x800
    1cc6:	8f7d                	and	a4,a4,a5
    1cc8:	8532                	mv	a0,a2
    1cca:	c711                	beqz	a4,1cd6 <__subdf3+0x22a>
    1ccc:	ff800737          	lui	a4,0xff800
    1cd0:	177d                	addi	a4,a4,-1
    1cd2:	8ff9                	and	a5,a5,a4
    1cd4:	4485                	li	s1,1
    1cd6:	00757713          	andi	a4,a0,7
    1cda:	34070d63          	beqz	a4,2034 <__subdf3+0x588>
    1cde:	00f57713          	andi	a4,a0,15
    1ce2:	4691                	li	a3,4
    1ce4:	34d70863          	beq	a4,a3,2034 <__subdf3+0x588>
    1ce8:	00450713          	addi	a4,a0,4 # 10004 <__ctor_end__+0x77a4>
    1cec:	00a73533          	sltu	a0,a4,a0
    1cf0:	97aa                	add	a5,a5,a0
    1cf2:	853a                	mv	a0,a4
    1cf4:	a681                	j	2034 <__subdf3+0x588>
    1cf6:	d285                	beqz	a3,1c16 <__subdf3+0x16a>
    1cf8:	8e59                	or	a2,a2,a4
    1cfa:	e2060de3          	beqz	a2,1b34 <__subdf3+0x88>
    1cfe:	4401                	li	s0,0
    1d00:	004007b7          	lui	a5,0x400
    1d04:	4501                	li	a0,0
    1d06:	7ff00493          	li	s1,2047
    1d0a:	a62d                	j	2034 <__subdf3+0x588>
    1d0c:	7ff00593          	li	a1,2047
    1d10:	30b68e63          	beq	a3,a1,202c <__subdf3+0x580>
    1d14:	962a                	add	a2,a2,a0
    1d16:	00a63533          	sltu	a0,a2,a0
    1d1a:	97ba                	add	a5,a5,a4
    1d1c:	97aa                	add	a5,a5,a0
    1d1e:	01f79513          	slli	a0,a5,0x1f
    1d22:	8205                	srli	a2,a2,0x1
    1d24:	8d51                	or	a0,a0,a2
    1d26:	8385                	srli	a5,a5,0x1
    1d28:	84b6                	mv	s1,a3
    1d2a:	b775                	j	1cd6 <__subdf3+0x22a>
    1d2c:	0c505563          	blez	t0,1df6 <__subdf3+0x34a>
    1d30:	08031063          	bnez	t1,1db0 <__subdf3+0x304>
    1d34:	00c766b3          	or	a3,a4,a2
    1d38:	34068c63          	beqz	a3,2090 <__subdf3+0x5e4>
    1d3c:	fff28593          	addi	a1,t0,-1
    1d40:	e991                	bnez	a1,1d54 <__subdf3+0x2a8>
    1d42:	40c50633          	sub	a2,a0,a2
    1d46:	00c53533          	sltu	a0,a0,a2
    1d4a:	8f99                	sub	a5,a5,a4
    1d4c:	8f89                	sub	a5,a5,a0
    1d4e:	8532                	mv	a0,a2
    1d50:	4485                	li	s1,1
    1d52:	a0b1                	j	1d9e <__subdf3+0x2f2>
    1d54:	7ff00693          	li	a3,2047
    1d58:	dcd28ee3          	beq	t0,a3,1b34 <__subdf3+0x88>
    1d5c:	03800693          	li	a3,56
    1d60:	08b6c763          	blt	a3,a1,1dee <__subdf3+0x342>
    1d64:	46fd                	li	a3,31
    1d66:	04b6ce63          	blt	a3,a1,1dc2 <__subdf3+0x316>
    1d6a:	02000313          	li	t1,32
    1d6e:	40b30333          	sub	t1,t1,a1
    1d72:	006716b3          	sll	a3,a4,t1
    1d76:	00b652b3          	srl	t0,a2,a1
    1d7a:	00661633          	sll	a2,a2,t1
    1d7e:	0056e6b3          	or	a3,a3,t0
    1d82:	00c03633          	snez	a2,a2
    1d86:	8e55                	or	a2,a2,a3
    1d88:	00b75733          	srl	a4,a4,a1
    1d8c:	40c50633          	sub	a2,a0,a2
    1d90:	00c53533          	sltu	a0,a0,a2
    1d94:	40e78733          	sub	a4,a5,a4
    1d98:	40a707b3          	sub	a5,a4,a0
    1d9c:	8532                	mv	a0,a2
    1d9e:	008005b7          	lui	a1,0x800
    1da2:	00b7f733          	and	a4,a5,a1
    1da6:	db05                	beqz	a4,1cd6 <__subdf3+0x22a>
    1da8:	15fd                	addi	a1,a1,-1
    1daa:	8dfd                	and	a1,a1,a5
    1dac:	832a                	mv	t1,a0
    1dae:	aa5d                	j	1f64 <__subdf3+0x4b8>
    1db0:	7ff00693          	li	a3,2047
    1db4:	f2d481e3          	beq	s1,a3,1cd6 <__subdf3+0x22a>
    1db8:	008006b7          	lui	a3,0x800
    1dbc:	8f55                	or	a4,a4,a3
    1dbe:	8596                	mv	a1,t0
    1dc0:	bf71                	j	1d5c <__subdf3+0x2b0>
    1dc2:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f7780>
    1dc6:	02000293          	li	t0,32
    1dca:	00d756b3          	srl	a3,a4,a3
    1dce:	4301                	li	t1,0
    1dd0:	00558863          	beq	a1,t0,1de0 <__subdf3+0x334>
    1dd4:	04000313          	li	t1,64
    1dd8:	40b305b3          	sub	a1,t1,a1
    1ddc:	00b71333          	sll	t1,a4,a1
    1de0:	00c36633          	or	a2,t1,a2
    1de4:	00c03633          	snez	a2,a2
    1de8:	8e55                	or	a2,a2,a3
    1dea:	4701                	li	a4,0
    1dec:	b745                	j	1d8c <__subdf3+0x2e0>
    1dee:	8e59                	or	a2,a2,a4
    1df0:	00c03633          	snez	a2,a2
    1df4:	bfdd                	j	1dea <__subdf3+0x33e>
    1df6:	0c028463          	beqz	t0,1ebe <__subdf3+0x412>
    1dfa:	409302b3          	sub	t0,t1,s1
    1dfe:	e895                	bnez	s1,1e32 <__subdf3+0x386>
    1e00:	00a7e5b3          	or	a1,a5,a0
    1e04:	28058863          	beqz	a1,2094 <__subdf3+0x5e8>
    1e08:	fff28593          	addi	a1,t0,-1
    1e0c:	e991                	bnez	a1,1e20 <__subdf3+0x374>
    1e0e:	40a60533          	sub	a0,a2,a0
    1e12:	40f707b3          	sub	a5,a4,a5
    1e16:	00a63633          	sltu	a2,a2,a0
    1e1a:	8f91                	sub	a5,a5,a2
    1e1c:	8436                	mv	s0,a3
    1e1e:	bf0d                	j	1d50 <__subdf3+0x2a4>
    1e20:	7ff00393          	li	t2,2047
    1e24:	00729f63          	bne	t0,t2,1e42 <__subdf3+0x396>
    1e28:	87ba                	mv	a5,a4
    1e2a:	8532                	mv	a0,a2
    1e2c:	7ff00493          	li	s1,2047
    1e30:	a07d                	j	1ede <__subdf3+0x432>
    1e32:	7ff00593          	li	a1,2047
    1e36:	feb309e3          	beq	t1,a1,1e28 <__subdf3+0x37c>
    1e3a:	008005b7          	lui	a1,0x800
    1e3e:	8fcd                	or	a5,a5,a1
    1e40:	8596                	mv	a1,t0
    1e42:	03800293          	li	t0,56
    1e46:	06b2c863          	blt	t0,a1,1eb6 <__subdf3+0x40a>
    1e4a:	42fd                	li	t0,31
    1e4c:	02b2ce63          	blt	t0,a1,1e88 <__subdf3+0x3dc>
    1e50:	02000393          	li	t2,32
    1e54:	40b383b3          	sub	t2,t2,a1
    1e58:	007792b3          	sll	t0,a5,t2
    1e5c:	00b55433          	srl	s0,a0,a1
    1e60:	00751533          	sll	a0,a0,t2
    1e64:	0082e2b3          	or	t0,t0,s0
    1e68:	00a03533          	snez	a0,a0
    1e6c:	00a2e533          	or	a0,t0,a0
    1e70:	00b7d7b3          	srl	a5,a5,a1
    1e74:	40a60533          	sub	a0,a2,a0
    1e78:	40f707b3          	sub	a5,a4,a5
    1e7c:	00a63633          	sltu	a2,a2,a0
    1e80:	8f91                	sub	a5,a5,a2
    1e82:	849a                	mv	s1,t1
    1e84:	8436                	mv	s0,a3
    1e86:	bf21                	j	1d9e <__subdf3+0x2f2>
    1e88:	fe058293          	addi	t0,a1,-32 # 7fffe0 <__ctor_end__+0x7f7780>
    1e8c:	02000413          	li	s0,32
    1e90:	0057d2b3          	srl	t0,a5,t0
    1e94:	4381                	li	t2,0
    1e96:	00858863          	beq	a1,s0,1ea6 <__subdf3+0x3fa>
    1e9a:	04000393          	li	t2,64
    1e9e:	40b385b3          	sub	a1,t2,a1
    1ea2:	00b793b3          	sll	t2,a5,a1
    1ea6:	00a3e533          	or	a0,t2,a0
    1eaa:	00a03533          	snez	a0,a0
    1eae:	00a2e533          	or	a0,t0,a0
    1eb2:	4781                	li	a5,0
    1eb4:	b7c1                	j	1e74 <__subdf3+0x3c8>
    1eb6:	8d5d                	or	a0,a0,a5
    1eb8:	00a03533          	snez	a0,a0
    1ebc:	bfdd                	j	1eb2 <__subdf3+0x406>
    1ebe:	00148593          	addi	a1,s1,1
    1ec2:	7fe5f593          	andi	a1,a1,2046
    1ec6:	e9a5                	bnez	a1,1f36 <__subdf3+0x48a>
    1ec8:	00a7e333          	or	t1,a5,a0
    1ecc:	00c765b3          	or	a1,a4,a2
    1ed0:	e8a1                	bnez	s1,1f20 <__subdf3+0x474>
    1ed2:	00031863          	bnez	t1,1ee2 <__subdf3+0x436>
    1ed6:	1c058363          	beqz	a1,209c <__subdf3+0x5f0>
    1eda:	87ba                	mv	a5,a4
    1edc:	8532                	mv	a0,a2
    1ede:	8436                	mv	s0,a3
    1ee0:	bbdd                	j	1cd6 <__subdf3+0x22a>
    1ee2:	de058ae3          	beqz	a1,1cd6 <__subdf3+0x22a>
    1ee6:	40c50333          	sub	t1,a0,a2
    1eea:	006532b3          	sltu	t0,a0,t1
    1eee:	40e785b3          	sub	a1,a5,a4
    1ef2:	405585b3          	sub	a1,a1,t0
    1ef6:	008002b7          	lui	t0,0x800
    1efa:	0055f2b3          	and	t0,a1,t0
    1efe:	00028a63          	beqz	t0,1f12 <__subdf3+0x466>
    1f02:	40a60533          	sub	a0,a2,a0
    1f06:	40f707b3          	sub	a5,a4,a5
    1f0a:	00a63633          	sltu	a2,a2,a0
    1f0e:	8f91                	sub	a5,a5,a2
    1f10:	b7f9                	j	1ede <__subdf3+0x432>
    1f12:	00b36533          	or	a0,t1,a1
    1f16:	18050763          	beqz	a0,20a4 <__subdf3+0x5f8>
    1f1a:	87ae                	mv	a5,a1
    1f1c:	851a                	mv	a0,t1
    1f1e:	bb65                	j	1cd6 <__subdf3+0x22a>
    1f20:	00031863          	bnez	t1,1f30 <__subdf3+0x484>
    1f24:	18058263          	beqz	a1,20a8 <__subdf3+0x5fc>
    1f28:	87ba                	mv	a5,a4
    1f2a:	8532                	mv	a0,a2
    1f2c:	8436                	mv	s0,a3
    1f2e:	b119                	j	1b34 <__subdf3+0x88>
    1f30:	c00582e3          	beqz	a1,1b34 <__subdf3+0x88>
    1f34:	b3e9                	j	1cfe <__subdf3+0x252>
    1f36:	40c50333          	sub	t1,a0,a2
    1f3a:	006532b3          	sltu	t0,a0,t1
    1f3e:	40e785b3          	sub	a1,a5,a4
    1f42:	405585b3          	sub	a1,a1,t0
    1f46:	008002b7          	lui	t0,0x800
    1f4a:	0055f2b3          	and	t0,a1,t0
    1f4e:	06028a63          	beqz	t0,1fc2 <__subdf3+0x516>
    1f52:	40a60333          	sub	t1,a2,a0
    1f56:	40f707b3          	sub	a5,a4,a5
    1f5a:	00663633          	sltu	a2,a2,t1
    1f5e:	40c785b3          	sub	a1,a5,a2
    1f62:	8436                	mv	s0,a3
    1f64:	c5ad                	beqz	a1,1fce <__subdf3+0x522>
    1f66:	852e                	mv	a0,a1
    1f68:	c21a                	sw	t1,4(sp)
    1f6a:	c02e                	sw	a1,0(sp)
    1f6c:	2c19                	jal	2182 <__clzsi2>
    1f6e:	4582                	lw	a1,0(sp)
    1f70:	4312                	lw	t1,4(sp)
    1f72:	ff850713          	addi	a4,a0,-8
    1f76:	47fd                	li	a5,31
    1f78:	06e7c463          	blt	a5,a4,1fe0 <__subdf3+0x534>
    1f7c:	02000793          	li	a5,32
    1f80:	8f99                	sub	a5,a5,a4
    1f82:	00e595b3          	sll	a1,a1,a4
    1f86:	00f357b3          	srl	a5,t1,a5
    1f8a:	8fcd                	or	a5,a5,a1
    1f8c:	00e31533          	sll	a0,t1,a4
    1f90:	08974163          	blt	a4,s1,2012 <__subdf3+0x566>
    1f94:	8f05                	sub	a4,a4,s1
    1f96:	00170613          	addi	a2,a4,1 # ff800001 <__heap_end+0xdf7d0001>
    1f9a:	46fd                	li	a3,31
    1f9c:	04c6c863          	blt	a3,a2,1fec <__subdf3+0x540>
    1fa0:	02000713          	li	a4,32
    1fa4:	8f11                	sub	a4,a4,a2
    1fa6:	00e796b3          	sll	a3,a5,a4
    1faa:	00c555b3          	srl	a1,a0,a2
    1fae:	00e51533          	sll	a0,a0,a4
    1fb2:	8ecd                	or	a3,a3,a1
    1fb4:	00a03533          	snez	a0,a0
    1fb8:	8d55                	or	a0,a0,a3
    1fba:	00c7d7b3          	srl	a5,a5,a2
    1fbe:	4481                	li	s1,0
    1fc0:	bb19                	j	1cd6 <__subdf3+0x22a>
    1fc2:	00b36533          	or	a0,t1,a1
    1fc6:	fd59                	bnez	a0,1f64 <__subdf3+0x4b8>
    1fc8:	4781                	li	a5,0
    1fca:	4481                	li	s1,0
    1fcc:	a8d1                	j	20a0 <__subdf3+0x5f4>
    1fce:	851a                	mv	a0,t1
    1fd0:	c22e                	sw	a1,4(sp)
    1fd2:	c01a                	sw	t1,0(sp)
    1fd4:	227d                	jal	2182 <__clzsi2>
    1fd6:	4592                	lw	a1,4(sp)
    1fd8:	4302                	lw	t1,0(sp)
    1fda:	02050513          	addi	a0,a0,32
    1fde:	bf51                	j	1f72 <__subdf3+0x4c6>
    1fe0:	fd850793          	addi	a5,a0,-40
    1fe4:	00f317b3          	sll	a5,t1,a5
    1fe8:	4501                	li	a0,0
    1fea:	b75d                	j	1f90 <__subdf3+0x4e4>
    1fec:	1705                	addi	a4,a4,-31
    1fee:	02000593          	li	a1,32
    1ff2:	00e7d733          	srl	a4,a5,a4
    1ff6:	4681                	li	a3,0
    1ff8:	00b60763          	beq	a2,a1,2006 <__subdf3+0x55a>
    1ffc:	04000693          	li	a3,64
    2000:	8e91                	sub	a3,a3,a2
    2002:	00d796b3          	sll	a3,a5,a3
    2006:	8d55                	or	a0,a0,a3
    2008:	00a03533          	snez	a0,a0
    200c:	8d59                	or	a0,a0,a4
    200e:	4781                	li	a5,0
    2010:	b77d                	j	1fbe <__subdf3+0x512>
    2012:	8c99                	sub	s1,s1,a4
    2014:	ff800737          	lui	a4,0xff800
    2018:	177d                	addi	a4,a4,-1
    201a:	8ff9                	and	a5,a5,a4
    201c:	b96d                	j	1cd6 <__subdf3+0x22a>
    201e:	87ba                	mv	a5,a4
    2020:	8532                	mv	a0,a2
    2022:	84ae                	mv	s1,a1
    2024:	b94d                	j	1cd6 <__subdf3+0x22a>
    2026:	87ba                	mv	a5,a4
    2028:	8532                	mv	a0,a2
    202a:	b175                	j	1cd6 <__subdf3+0x22a>
    202c:	7ff00493          	li	s1,2047
    2030:	4781                	li	a5,0
    2032:	4501                	li	a0,0
    2034:	00800737          	lui	a4,0x800
    2038:	8f7d                	and	a4,a4,a5
    203a:	cb11                	beqz	a4,204e <__subdf3+0x5a2>
    203c:	0485                	addi	s1,s1,1
    203e:	7ff00713          	li	a4,2047
    2042:	06e48863          	beq	s1,a4,20b2 <__subdf3+0x606>
    2046:	ff800737          	lui	a4,0xff800
    204a:	177d                	addi	a4,a4,-1
    204c:	8ff9                	and	a5,a5,a4
    204e:	01d79713          	slli	a4,a5,0x1d
    2052:	810d                	srli	a0,a0,0x3
    2054:	8d59                	or	a0,a0,a4
    2056:	7ff00713          	li	a4,2047
    205a:	838d                	srli	a5,a5,0x3
    205c:	00e49963          	bne	s1,a4,206e <__subdf3+0x5c2>
    2060:	8d5d                	or	a0,a0,a5
    2062:	4781                	li	a5,0
    2064:	c509                	beqz	a0,206e <__subdf3+0x5c2>
    2066:	000807b7          	lui	a5,0x80
    206a:	4501                	li	a0,0
    206c:	4401                	li	s0,0
    206e:	01449713          	slli	a4,s1,0x14
    2072:	7ff006b7          	lui	a3,0x7ff00
    2076:	07b2                	slli	a5,a5,0xc
    2078:	8f75                	and	a4,a4,a3
    207a:	83b1                	srli	a5,a5,0xc
    207c:	047e                	slli	s0,s0,0x1f
    207e:	8fd9                	or	a5,a5,a4
    2080:	40c2                	lw	ra,16(sp)
    2082:	0087e733          	or	a4,a5,s0
    2086:	4432                	lw	s0,12(sp)
    2088:	44a2                	lw	s1,8(sp)
    208a:	85ba                	mv	a1,a4
    208c:	0151                	addi	sp,sp,20
    208e:	8082                	ret
    2090:	8496                	mv	s1,t0
    2092:	b191                	j	1cd6 <__subdf3+0x22a>
    2094:	87ba                	mv	a5,a4
    2096:	8532                	mv	a0,a2
    2098:	8496                	mv	s1,t0
    209a:	b591                	j	1ede <__subdf3+0x432>
    209c:	4781                	li	a5,0
    209e:	4501                	li	a0,0
    20a0:	4401                	li	s0,0
    20a2:	bf49                	j	2034 <__subdf3+0x588>
    20a4:	4781                	li	a5,0
    20a6:	bfed                	j	20a0 <__subdf3+0x5f4>
    20a8:	4501                	li	a0,0
    20aa:	4401                	li	s0,0
    20ac:	004007b7          	lui	a5,0x400
    20b0:	b999                	j	1d06 <__subdf3+0x25a>
    20b2:	4781                	li	a5,0
    20b4:	4501                	li	a0,0
    20b6:	bf61                	j	204e <__subdf3+0x5a2>

000020b8 <__fixdfsi>:
    20b8:	0145d713          	srli	a4,a1,0x14
    20bc:	001006b7          	lui	a3,0x100
    20c0:	fff68793          	addi	a5,a3,-1 # fffff <__ctor_end__+0xf779f>
    20c4:	7ff77713          	andi	a4,a4,2047
    20c8:	3fe00613          	li	a2,1022
    20cc:	8fed                	and	a5,a5,a1
    20ce:	81fd                	srli	a1,a1,0x1f
    20d0:	04e65463          	bge	a2,a4,2118 <__fixdfsi+0x60>
    20d4:	41d00613          	li	a2,1053
    20d8:	00e65863          	bge	a2,a4,20e8 <__fixdfsi+0x30>
    20dc:	80000537          	lui	a0,0x80000
    20e0:	fff54513          	not	a0,a0
    20e4:	952e                	add	a0,a0,a1
    20e6:	8082                	ret
    20e8:	8fd5                	or	a5,a5,a3
    20ea:	43300693          	li	a3,1075
    20ee:	8e99                	sub	a3,a3,a4
    20f0:	467d                	li	a2,31
    20f2:	00d64d63          	blt	a2,a3,210c <__fixdfsi+0x54>
    20f6:	bed70713          	addi	a4,a4,-1043 # ff7ffbed <__heap_end+0xdf7cfbed>
    20fa:	00e797b3          	sll	a5,a5,a4
    20fe:	00d55533          	srl	a0,a0,a3
    2102:	8d5d                	or	a0,a0,a5
    2104:	c999                	beqz	a1,211a <__fixdfsi+0x62>
    2106:	40a00533          	neg	a0,a0
    210a:	8082                	ret
    210c:	41300513          	li	a0,1043
    2110:	8d19                	sub	a0,a0,a4
    2112:	00a7d533          	srl	a0,a5,a0
    2116:	b7fd                	j	2104 <__fixdfsi+0x4c>
    2118:	4501                	li	a0,0
    211a:	8082                	ret

0000211c <__floatsidf>:
    211c:	1151                	addi	sp,sp,-12
    211e:	c406                	sw	ra,8(sp)
    2120:	c222                	sw	s0,4(sp)
    2122:	c026                	sw	s1,0(sp)
    2124:	cd21                	beqz	a0,217c <__floatsidf+0x60>
    2126:	41f55793          	srai	a5,a0,0x1f
    212a:	00a7c433          	xor	s0,a5,a0
    212e:	8c1d                	sub	s0,s0,a5
    2130:	01f55493          	srli	s1,a0,0x1f
    2134:	8522                	mv	a0,s0
    2136:	20b1                	jal	2182 <__clzsi2>
    2138:	41e00713          	li	a4,1054
    213c:	47a9                	li	a5,10
    213e:	8f09                	sub	a4,a4,a0
    2140:	02a7c863          	blt	a5,a0,2170 <__floatsidf+0x54>
    2144:	47ad                	li	a5,11
    2146:	8f89                	sub	a5,a5,a0
    2148:	0555                	addi	a0,a0,21
    214a:	00f457b3          	srl	a5,s0,a5
    214e:	00a41433          	sll	s0,s0,a0
    2152:	8526                	mv	a0,s1
    2154:	07b2                	slli	a5,a5,0xc
    2156:	0752                	slli	a4,a4,0x14
    2158:	83b1                	srli	a5,a5,0xc
    215a:	057e                	slli	a0,a0,0x1f
    215c:	8fd9                	or	a5,a5,a4
    215e:	40a2                	lw	ra,8(sp)
    2160:	00a7e733          	or	a4,a5,a0
    2164:	8522                	mv	a0,s0
    2166:	4412                	lw	s0,4(sp)
    2168:	4482                	lw	s1,0(sp)
    216a:	85ba                	mv	a1,a4
    216c:	0131                	addi	sp,sp,12
    216e:	8082                	ret
    2170:	1555                	addi	a0,a0,-11
    2172:	00a417b3          	sll	a5,s0,a0
    2176:	8526                	mv	a0,s1
    2178:	4401                	li	s0,0
    217a:	bfe9                	j	2154 <__floatsidf+0x38>
    217c:	4701                	li	a4,0
    217e:	4781                	li	a5,0
    2180:	bfe5                	j	2178 <__floatsidf+0x5c>

00002182 <__clzsi2>:
    2182:	67c1                	lui	a5,0x10
    2184:	02f57663          	bgeu	a0,a5,21b0 <__clzsi2+0x2e>
    2188:	0ff00793          	li	a5,255
    218c:	00a7b7b3          	sltu	a5,a5,a0
    2190:	078e                	slli	a5,a5,0x3
    2192:	02000713          	li	a4,32
    2196:	8f1d                	sub	a4,a4,a5
    2198:	00f55533          	srl	a0,a0,a5
    219c:	00005797          	auipc	a5,0x5
    21a0:	0ec78793          	addi	a5,a5,236 # 7288 <__clz_tab>
    21a4:	953e                	add	a0,a0,a5
    21a6:	00054503          	lbu	a0,0(a0) # 80000000 <__heap_end+0x5ffd0000>
    21aa:	40a70533          	sub	a0,a4,a0
    21ae:	8082                	ret
    21b0:	01000737          	lui	a4,0x1000
    21b4:	47c1                	li	a5,16
    21b6:	fce56ee3          	bltu	a0,a4,2192 <__clzsi2+0x10>
    21ba:	47e1                	li	a5,24
    21bc:	bfd9                	j	2192 <__clzsi2+0x10>

000021be <memmove>:
    21be:	02a5f263          	bgeu	a1,a0,21e2 <memmove+0x24>
    21c2:	00c587b3          	add	a5,a1,a2
    21c6:	00f57e63          	bgeu	a0,a5,21e2 <memmove+0x24>
    21ca:	00c50733          	add	a4,a0,a2
    21ce:	c20d                	beqz	a2,21f0 <memmove+0x32>
    21d0:	fff7c683          	lbu	a3,-1(a5)
    21d4:	17fd                	addi	a5,a5,-1
    21d6:	177d                	addi	a4,a4,-1
    21d8:	00d70023          	sb	a3,0(a4) # 1000000 <__ctor_end__+0xff77a0>
    21dc:	fef59ae3          	bne	a1,a5,21d0 <memmove+0x12>
    21e0:	8082                	ret
    21e2:	47bd                	li	a5,15
    21e4:	00c7e763          	bltu	a5,a2,21f2 <memmove+0x34>
    21e8:	87aa                	mv	a5,a0
    21ea:	fff60693          	addi	a3,a2,-1
    21ee:	ea09                	bnez	a2,2200 <memmove+0x42>
    21f0:	8082                	ret
    21f2:	00a5e7b3          	or	a5,a1,a0
    21f6:	8b8d                	andi	a5,a5,3
    21f8:	cf99                	beqz	a5,2216 <memmove+0x58>
    21fa:	fff60693          	addi	a3,a2,-1
    21fe:	87aa                	mv	a5,a0
    2200:	0685                	addi	a3,a3,1
    2202:	96be                	add	a3,a3,a5
    2204:	0005c703          	lbu	a4,0(a1)
    2208:	0785                	addi	a5,a5,1
    220a:	0585                	addi	a1,a1,1
    220c:	fee78fa3          	sb	a4,-1(a5)
    2210:	fed79ae3          	bne	a5,a3,2204 <memmove+0x46>
    2214:	8082                	ret
    2216:	ff060293          	addi	t0,a2,-16
    221a:	ff02f293          	andi	t0,t0,-16
    221e:	02c1                	addi	t0,t0,16
    2220:	00550333          	add	t1,a0,t0
    2224:	872e                	mv	a4,a1
    2226:	87aa                	mv	a5,a0
    2228:	4314                	lw	a3,0(a4)
    222a:	0741                	addi	a4,a4,16
    222c:	07c1                	addi	a5,a5,16
    222e:	fed7a823          	sw	a3,-16(a5)
    2232:	ff472683          	lw	a3,-12(a4)
    2236:	fed7aa23          	sw	a3,-12(a5)
    223a:	ff872683          	lw	a3,-8(a4)
    223e:	fed7ac23          	sw	a3,-8(a5)
    2242:	ffc72683          	lw	a3,-4(a4)
    2246:	fed7ae23          	sw	a3,-4(a5)
    224a:	fcf31fe3          	bne	t1,a5,2228 <memmove+0x6a>
    224e:	00c67713          	andi	a4,a2,12
    2252:	9596                	add	a1,a1,t0
    2254:	00f67313          	andi	t1,a2,15
    2258:	cb21                	beqz	a4,22a8 <memmove+0xea>
    225a:	1171                	addi	sp,sp,-4
    225c:	c022                	sw	s0,0(sp)
    225e:	872e                	mv	a4,a1
    2260:	82be                	mv	t0,a5
    2262:	440d                	li	s0,3
    2264:	00072383          	lw	t2,0(a4)
    2268:	0711                	addi	a4,a4,4
    226a:	40e306b3          	sub	a3,t1,a4
    226e:	0072a023          	sw	t2,0(t0) # 800000 <__ctor_end__+0x7f77a0>
    2272:	96ae                	add	a3,a3,a1
    2274:	0291                	addi	t0,t0,4
    2276:	fed467e3          	bltu	s0,a3,2264 <memmove+0xa6>
    227a:	ffc30713          	addi	a4,t1,-4 # ffffc <__ctor_end__+0xf779c>
    227e:	9b71                	andi	a4,a4,-4
    2280:	8a0d                	andi	a2,a2,3
    2282:	0711                	addi	a4,a4,4
    2284:	fff60693          	addi	a3,a2,-1
    2288:	97ba                	add	a5,a5,a4
    228a:	0685                	addi	a3,a3,1
    228c:	95ba                	add	a1,a1,a4
    228e:	96be                	add	a3,a3,a5
    2290:	ca09                	beqz	a2,22a2 <memmove+0xe4>
    2292:	0005c703          	lbu	a4,0(a1)
    2296:	0785                	addi	a5,a5,1
    2298:	0585                	addi	a1,a1,1
    229a:	fee78fa3          	sb	a4,-1(a5)
    229e:	fed79ae3          	bne	a5,a3,2292 <memmove+0xd4>
    22a2:	4402                	lw	s0,0(sp)
    22a4:	0111                	addi	sp,sp,4
    22a6:	8082                	ret
    22a8:	861a                	mv	a2,t1
    22aa:	b781                	j	21ea <memmove+0x2c>

000022ac <memset>:
    22ac:	433d                	li	t1,15
    22ae:	872a                	mv	a4,a0
    22b0:	02c37563          	bgeu	t1,a2,22da <memset+0x2e>
    22b4:	00f77793          	andi	a5,a4,15
    22b8:	e3c9                	bnez	a5,233a <memset+0x8e>
    22ba:	06059763          	bnez	a1,2328 <memset+0x7c>
    22be:	ff067693          	andi	a3,a2,-16
    22c2:	8a3d                	andi	a2,a2,15
    22c4:	96ba                	add	a3,a3,a4
    22c6:	c30c                	sw	a1,0(a4)
    22c8:	c34c                	sw	a1,4(a4)
    22ca:	c70c                	sw	a1,8(a4)
    22cc:	c74c                	sw	a1,12(a4)
    22ce:	0741                	addi	a4,a4,16
    22d0:	fed76be3          	bltu	a4,a3,22c6 <memset+0x1a>
    22d4:	00061363          	bnez	a2,22da <memset+0x2e>
    22d8:	8082                	ret
    22da:	40c306b3          	sub	a3,t1,a2
    22de:	068a                	slli	a3,a3,0x2
    22e0:	00000297          	auipc	t0,0x0
    22e4:	9696                	add	a3,a3,t0
    22e6:	00a68067          	jr	10(a3)
    22ea:	00b70723          	sb	a1,14(a4)
    22ee:	00b706a3          	sb	a1,13(a4)
    22f2:	00b70623          	sb	a1,12(a4)
    22f6:	00b705a3          	sb	a1,11(a4)
    22fa:	00b70523          	sb	a1,10(a4)
    22fe:	00b704a3          	sb	a1,9(a4)
    2302:	00b70423          	sb	a1,8(a4)
    2306:	00b703a3          	sb	a1,7(a4)
    230a:	00b70323          	sb	a1,6(a4)
    230e:	00b702a3          	sb	a1,5(a4)
    2312:	00b70223          	sb	a1,4(a4)
    2316:	00b701a3          	sb	a1,3(a4)
    231a:	00b70123          	sb	a1,2(a4)
    231e:	00b700a3          	sb	a1,1(a4)
    2322:	00b70023          	sb	a1,0(a4)
    2326:	8082                	ret
    2328:	0ff5f593          	andi	a1,a1,255
    232c:	00859693          	slli	a3,a1,0x8
    2330:	8dd5                	or	a1,a1,a3
    2332:	01059693          	slli	a3,a1,0x10
    2336:	8dd5                	or	a1,a1,a3
    2338:	b759                	j	22be <memset+0x12>
    233a:	00279693          	slli	a3,a5,0x2
    233e:	00000297          	auipc	t0,0x0
    2342:	9696                	add	a3,a3,t0
    2344:	8286                	mv	t0,ra
    2346:	fa8680e7          	jalr	-88(a3)
    234a:	8096                	mv	ra,t0
    234c:	17c1                	addi	a5,a5,-16
    234e:	8f1d                	sub	a4,a4,a5
    2350:	963e                	add	a2,a2,a5
    2352:	f8c374e3          	bgeu	t1,a2,22da <memset+0x2e>
    2356:	b795                	j	22ba <memset+0xe>
	...

0000235a <strchr>:
    235a:	0ff5f693          	andi	a3,a1,255
    235e:	00357793          	andi	a5,a0,3
    2362:	cec9                	beqz	a3,23fc <strchr+0xa2>
    2364:	00078b63          	beqz	a5,237a <strchr+0x20>
    2368:	00054783          	lbu	a5,0(a0)
    236c:	c7d1                	beqz	a5,23f8 <strchr+0x9e>
    236e:	08d78663          	beq	a5,a3,23fa <strchr+0xa0>
    2372:	0505                	addi	a0,a0,1
    2374:	00357793          	andi	a5,a0,3
    2378:	fbe5                	bnez	a5,2368 <strchr+0xe>
    237a:	0ff5f593          	andi	a1,a1,255
    237e:	00859313          	slli	t1,a1,0x8
    2382:	4118                	lw	a4,0(a0)
    2384:	0065e5b3          	or	a1,a1,t1
    2388:	01059313          	slli	t1,a1,0x10
    238c:	00b36333          	or	t1,t1,a1
    2390:	feff0637          	lui	a2,0xfeff0
    2394:	00e345b3          	xor	a1,t1,a4
    2398:	eff60613          	addi	a2,a2,-257 # fefefeff <__heap_end+0xdefbfeff>
    239c:	00c587b3          	add	a5,a1,a2
    23a0:	00c702b3          	add	t0,a4,a2
    23a4:	fff5c593          	not	a1,a1
    23a8:	fff74713          	not	a4,a4
    23ac:	8fed                	and	a5,a5,a1
    23ae:	00e2f733          	and	a4,t0,a4
    23b2:	808085b7          	lui	a1,0x80808
    23b6:	8fd9                	or	a5,a5,a4
    23b8:	08058593          	addi	a1,a1,128 # 80808080 <__heap_end+0x607d8080>
    23bc:	8fed                	and	a5,a5,a1
    23be:	e785                	bnez	a5,23e6 <strchr+0x8c>
    23c0:	4158                	lw	a4,4(a0)
    23c2:	0511                	addi	a0,a0,4
    23c4:	006742b3          	xor	t0,a4,t1
    23c8:	00c707b3          	add	a5,a4,a2
    23cc:	00c283b3          	add	t2,t0,a2
    23d0:	fff74713          	not	a4,a4
    23d4:	fff2c293          	not	t0,t0
    23d8:	8ff9                	and	a5,a5,a4
    23da:	0053f2b3          	and	t0,t2,t0
    23de:	0057e7b3          	or	a5,a5,t0
    23e2:	8fed                	and	a5,a5,a1
    23e4:	dff1                	beqz	a5,23c0 <strchr+0x66>
    23e6:	00054783          	lbu	a5,0(a0)
    23ea:	c799                	beqz	a5,23f8 <strchr+0x9e>
    23ec:	06f68163          	beq	a3,a5,244e <strchr+0xf4>
    23f0:	00154783          	lbu	a5,1(a0)
    23f4:	0505                	addi	a0,a0,1
    23f6:	fbfd                	bnez	a5,23ec <strchr+0x92>
    23f8:	4501                	li	a0,0
    23fa:	8082                	ret
    23fc:	cb81                	beqz	a5,240c <strchr+0xb2>
    23fe:	00054783          	lbu	a5,0(a0)
    2402:	dfe5                	beqz	a5,23fa <strchr+0xa0>
    2404:	0505                	addi	a0,a0,1
    2406:	00357793          	andi	a5,a0,3
    240a:	fbf5                	bnez	a5,23fe <strchr+0xa4>
    240c:	4118                	lw	a4,0(a0)
    240e:	feff0637          	lui	a2,0xfeff0
    2412:	eff60613          	addi	a2,a2,-257 # fefefeff <__heap_end+0xdefbfeff>
    2416:	00c707b3          	add	a5,a4,a2
    241a:	808086b7          	lui	a3,0x80808
    241e:	fff74713          	not	a4,a4
    2422:	8ff9                	and	a5,a5,a4
    2424:	08068693          	addi	a3,a3,128 # 80808080 <__heap_end+0x607d8080>
    2428:	8ff5                	and	a5,a5,a3
    242a:	eb91                	bnez	a5,243e <strchr+0xe4>
    242c:	4158                	lw	a4,4(a0)
    242e:	0511                	addi	a0,a0,4
    2430:	00c707b3          	add	a5,a4,a2
    2434:	fff74713          	not	a4,a4
    2438:	8ff9                	and	a5,a5,a4
    243a:	8ff5                	and	a5,a5,a3
    243c:	dbe5                	beqz	a5,242c <strchr+0xd2>
    243e:	00054783          	lbu	a5,0(a0)
    2442:	dfc5                	beqz	a5,23fa <strchr+0xa0>
    2444:	00154783          	lbu	a5,1(a0)
    2448:	0505                	addi	a0,a0,1
    244a:	ffed                	bnez	a5,2444 <strchr+0xea>
    244c:	8082                	ret
    244e:	8082                	ret

00002450 <strcpy>:
    2450:	00b567b3          	or	a5,a0,a1
    2454:	8b8d                	andi	a5,a5,3
    2456:	efb1                	bnez	a5,24b2 <strcpy+0x62>
    2458:	4198                	lw	a4,0(a1)
    245a:	7f7f86b7          	lui	a3,0x7f7f8
    245e:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    2462:	00d777b3          	and	a5,a4,a3
    2466:	97b6                	add	a5,a5,a3
    2468:	8fd9                	or	a5,a5,a4
    246a:	8fd5                	or	a5,a5,a3
    246c:	567d                	li	a2,-1
    246e:	04c79b63          	bne	a5,a2,24c4 <strcpy+0x74>
    2472:	862a                	mv	a2,a0
    2474:	537d                	li	t1,-1
    2476:	c218                	sw	a4,0(a2)
    2478:	41d8                	lw	a4,4(a1)
    247a:	0591                	addi	a1,a1,4
    247c:	0611                	addi	a2,a2,4
    247e:	00d777b3          	and	a5,a4,a3
    2482:	97b6                	add	a5,a5,a3
    2484:	8fd9                	or	a5,a5,a4
    2486:	8fd5                	or	a5,a5,a3
    2488:	fe6787e3          	beq	a5,t1,2476 <strcpy+0x26>
    248c:	0005c783          	lbu	a5,0(a1)
    2490:	0015c703          	lbu	a4,1(a1)
    2494:	0025c683          	lbu	a3,2(a1)
    2498:	00f60023          	sb	a5,0(a2)
    249c:	c799                	beqz	a5,24aa <strcpy+0x5a>
    249e:	00e600a3          	sb	a4,1(a2)
    24a2:	c701                	beqz	a4,24aa <strcpy+0x5a>
    24a4:	00d60123          	sb	a3,2(a2)
    24a8:	e291                	bnez	a3,24ac <strcpy+0x5c>
    24aa:	8082                	ret
    24ac:	000601a3          	sb	zero,3(a2)
    24b0:	8082                	ret
    24b2:	87aa                	mv	a5,a0
    24b4:	0005c703          	lbu	a4,0(a1)
    24b8:	0785                	addi	a5,a5,1
    24ba:	0585                	addi	a1,a1,1
    24bc:	fee78fa3          	sb	a4,-1(a5)
    24c0:	fb75                	bnez	a4,24b4 <strcpy+0x64>
    24c2:	8082                	ret
    24c4:	862a                	mv	a2,a0
    24c6:	b7d9                	j	248c <strcpy+0x3c>
	...

000024ca <_strerror_r>:
    24ca:	87ae                	mv	a5,a1
    24cc:	08e00713          	li	a4,142
    24d0:	85b2                	mv	a1,a2
    24d2:	00f76d63          	bltu	a4,a5,24ec <_strerror_r+0x22>
    24d6:	00005617          	auipc	a2,0x5
    24da:	eb260613          	addi	a2,a2,-334 # 7388 <__clz_tab+0x100>
    24de:	00279313          	slli	t1,a5,0x2
    24e2:	9332                	add	t1,t1,a2
    24e4:	00032703          	lw	a4,0(t1)
    24e8:	9732                	add	a4,a4,a2
    24ea:	8702                	jr	a4
    24ec:	1151                	addi	sp,sp,-12
    24ee:	c406                	sw	ra,8(sp)
    24f0:	32068f63          	beqz	a3,282e <_strerror_r+0x364>
    24f4:	8636                	mv	a2,a3
    24f6:	853e                	mv	a0,a5
    24f8:	2f15                	jal	2c2c <_user_strerror>
    24fa:	32050563          	beqz	a0,2824 <_strerror_r+0x35a>
    24fe:	40a2                	lw	ra,8(sp)
    2500:	0131                	addi	sp,sp,12
    2502:	8082                	ret
    2504:	00006517          	auipc	a0,0x6
    2508:	2c850513          	addi	a0,a0,712 # 87cc <pad_line+0x68c>
    250c:	8082                	ret
    250e:	00006517          	auipc	a0,0x6
    2512:	2a650513          	addi	a0,a0,678 # 87b4 <pad_line+0x674>
    2516:	8082                	ret
    2518:	00006517          	auipc	a0,0x6
    251c:	25450513          	addi	a0,a0,596 # 876c <pad_line+0x62c>
    2520:	8082                	ret
    2522:	00006517          	auipc	a0,0x6
    2526:	26250513          	addi	a0,a0,610 # 8784 <pad_line+0x644>
    252a:	8082                	ret
    252c:	00006517          	auipc	a0,0x6
    2530:	e4450513          	addi	a0,a0,-444 # 8370 <pad_line+0x230>
    2534:	8082                	ret
    2536:	00006517          	auipc	a0,0x6
    253a:	1fa50513          	addi	a0,a0,506 # 8730 <pad_line+0x5f0>
    253e:	8082                	ret
    2540:	00006517          	auipc	a0,0x6
    2544:	06450513          	addi	a0,a0,100 # 85a4 <pad_line+0x464>
    2548:	8082                	ret
    254a:	00006517          	auipc	a0,0x6
    254e:	2e250513          	addi	a0,a0,738 # 882c <pad_line+0x6ec>
    2552:	8082                	ret
    2554:	00006517          	auipc	a0,0x6
    2558:	ce450513          	addi	a0,a0,-796 # 8238 <pad_line+0xf8>
    255c:	8082                	ret
    255e:	00006517          	auipc	a0,0x6
    2562:	ca250513          	addi	a0,a0,-862 # 8200 <pad_line+0xc0>
    2566:	8082                	ret
    2568:	00006517          	auipc	a0,0x6
    256c:	23850513          	addi	a0,a0,568 # 87a0 <pad_line+0x660>
    2570:	8082                	ret
    2572:	00006517          	auipc	a0,0x6
    2576:	29250513          	addi	a0,a0,658 # 8804 <pad_line+0x6c4>
    257a:	8082                	ret
    257c:	00006517          	auipc	a0,0x6
    2580:	f8050513          	addi	a0,a0,-128 # 84fc <pad_line+0x3bc>
    2584:	8082                	ret
    2586:	00006517          	auipc	a0,0x6
    258a:	eae50513          	addi	a0,a0,-338 # 8434 <pad_line+0x2f4>
    258e:	8082                	ret
    2590:	00006517          	auipc	a0,0x6
    2594:	d7850513          	addi	a0,a0,-648 # 8308 <pad_line+0x1c8>
    2598:	8082                	ret
    259a:	00006517          	auipc	a0,0x6
    259e:	e6e50513          	addi	a0,a0,-402 # 8408 <pad_line+0x2c8>
    25a2:	8082                	ret
    25a4:	00006517          	auipc	a0,0x6
    25a8:	d5450513          	addi	a0,a0,-684 # 82f8 <pad_line+0x1b8>
    25ac:	8082                	ret
    25ae:	00006517          	auipc	a0,0x6
    25b2:	29250513          	addi	a0,a0,658 # 8840 <pad_line+0x700>
    25b6:	8082                	ret
    25b8:	00006517          	auipc	a0,0x6
    25bc:	d9450513          	addi	a0,a0,-620 # 834c <pad_line+0x20c>
    25c0:	8082                	ret
    25c2:	00006517          	auipc	a0,0x6
    25c6:	f5e50513          	addi	a0,a0,-162 # 8520 <pad_line+0x3e0>
    25ca:	8082                	ret
    25cc:	00006517          	auipc	a0,0x6
    25d0:	17c50513          	addi	a0,a0,380 # 8748 <pad_line+0x608>
    25d4:	8082                	ret
    25d6:	00006517          	auipc	a0,0x6
    25da:	14250513          	addi	a0,a0,322 # 8718 <pad_line+0x5d8>
    25de:	8082                	ret
    25e0:	00006517          	auipc	a0,0x6
    25e4:	10850513          	addi	a0,a0,264 # 86e8 <pad_line+0x5a8>
    25e8:	8082                	ret
    25ea:	00006517          	auipc	a0,0x6
    25ee:	0e650513          	addi	a0,a0,230 # 86d0 <pad_line+0x590>
    25f2:	8082                	ret
    25f4:	00006517          	auipc	a0,0x6
    25f8:	0bc50513          	addi	a0,a0,188 # 86b0 <pad_line+0x570>
    25fc:	8082                	ret
    25fe:	00006517          	auipc	a0,0x6
    2602:	09250513          	addi	a0,a0,146 # 8690 <pad_line+0x550>
    2606:	8082                	ret
    2608:	00006517          	auipc	a0,0x6
    260c:	05850513          	addi	a0,a0,88 # 8660 <pad_line+0x520>
    2610:	8082                	ret
    2612:	00006517          	auipc	a0,0x6
    2616:	02a50513          	addi	a0,a0,42 # 863c <pad_line+0x4fc>
    261a:	8082                	ret
    261c:	00006517          	auipc	a0,0x6
    2620:	0e050513          	addi	a0,a0,224 # 86fc <pad_line+0x5bc>
    2624:	8082                	ret
    2626:	00006517          	auipc	a0,0x6
    262a:	1ba50513          	addi	a0,a0,442 # 87e0 <pad_line+0x6a0>
    262e:	8082                	ret
    2630:	00006517          	auipc	a0,0x6
    2634:	ff450513          	addi	a0,a0,-12 # 8624 <pad_line+0x4e4>
    2638:	8082                	ret
    263a:	00006517          	auipc	a0,0x6
    263e:	fce50513          	addi	a0,a0,-50 # 8608 <pad_line+0x4c8>
    2642:	8082                	ret
    2644:	00006517          	auipc	a0,0x6
    2648:	fb050513          	addi	a0,a0,-80 # 85f4 <pad_line+0x4b4>
    264c:	8082                	ret
    264e:	00006517          	auipc	a0,0x6
    2652:	f8a50513          	addi	a0,a0,-118 # 85d8 <pad_line+0x498>
    2656:	8082                	ret
    2658:	00006517          	auipc	a0,0x6
    265c:	f7450513          	addi	a0,a0,-140 # 85cc <pad_line+0x48c>
    2660:	8082                	ret
    2662:	00006517          	auipc	a0,0x6
    2666:	f5650513          	addi	a0,a0,-170 # 85b8 <pad_line+0x478>
    266a:	8082                	ret
    266c:	00006517          	auipc	a0,0x6
    2670:	f2850513          	addi	a0,a0,-216 # 8594 <pad_line+0x454>
    2674:	8082                	ret
    2676:	00006517          	auipc	a0,0x6
    267a:	f0650513          	addi	a0,a0,-250 # 857c <pad_line+0x43c>
    267e:	8082                	ret
    2680:	00006517          	auipc	a0,0x6
    2684:	ee850513          	addi	a0,a0,-280 # 8568 <pad_line+0x428>
    2688:	8082                	ret
    268a:	00006517          	auipc	a0,0x6
    268e:	ec650513          	addi	a0,a0,-314 # 8550 <pad_line+0x410>
    2692:	8082                	ret
    2694:	00006517          	auipc	a0,0x6
    2698:	fc450513          	addi	a0,a0,-60 # 8658 <pad_line+0x518>
    269c:	8082                	ret
    269e:	00006517          	auipc	a0,0x6
    26a2:	ea250513          	addi	a0,a0,-350 # 8540 <pad_line+0x400>
    26a6:	8082                	ret
    26a8:	00006517          	auipc	a0,0x6
    26ac:	e9050513          	addi	a0,a0,-368 # 8538 <pad_line+0x3f8>
    26b0:	8082                	ret
    26b2:	00006517          	auipc	a0,0x6
    26b6:	e6250513          	addi	a0,a0,-414 # 8514 <pad_line+0x3d4>
    26ba:	8082                	ret
    26bc:	00006517          	auipc	a0,0x6
    26c0:	e2c50513          	addi	a0,a0,-468 # 84e8 <pad_line+0x3a8>
    26c4:	8082                	ret
    26c6:	00006517          	auipc	a0,0x6
    26ca:	e0650513          	addi	a0,a0,-506 # 84cc <pad_line+0x38c>
    26ce:	8082                	ret
    26d0:	00006517          	auipc	a0,0x6
    26d4:	de850513          	addi	a0,a0,-536 # 84b8 <pad_line+0x378>
    26d8:	8082                	ret
    26da:	00006517          	auipc	a0,0x6
    26de:	dae50513          	addi	a0,a0,-594 # 8488 <pad_line+0x348>
    26e2:	8082                	ret
    26e4:	00006517          	auipc	a0,0x6
    26e8:	d9850513          	addi	a0,a0,-616 # 847c <pad_line+0x33c>
    26ec:	8082                	ret
    26ee:	00006517          	auipc	a0,0x6
    26f2:	d7e50513          	addi	a0,a0,-642 # 846c <pad_line+0x32c>
    26f6:	8082                	ret
    26f8:	00006517          	auipc	a0,0x6
    26fc:	d5c50513          	addi	a0,a0,-676 # 8454 <pad_line+0x314>
    2700:	8082                	ret
    2702:	00006517          	auipc	a0,0x6
    2706:	d4250513          	addi	a0,a0,-702 # 8444 <pad_line+0x304>
    270a:	8082                	ret
    270c:	00006517          	auipc	a0,0x6
    2710:	d1050513          	addi	a0,a0,-752 # 841c <pad_line+0x2dc>
    2714:	8082                	ret
    2716:	00006517          	auipc	a0,0x6
    271a:	ce250513          	addi	a0,a0,-798 # 83f8 <pad_line+0x2b8>
    271e:	8082                	ret
    2720:	00006517          	auipc	a0,0x6
    2724:	cc850513          	addi	a0,a0,-824 # 83e8 <pad_line+0x2a8>
    2728:	8082                	ret
    272a:	00006517          	auipc	a0,0x6
    272e:	ca650513          	addi	a0,a0,-858 # 83d0 <pad_line+0x290>
    2732:	8082                	ret
    2734:	00006517          	auipc	a0,0x6
    2738:	c7c50513          	addi	a0,a0,-900 # 83b0 <pad_line+0x270>
    273c:	8082                	ret
    273e:	00006517          	auipc	a0,0x6
    2742:	c5250513          	addi	a0,a0,-942 # 8390 <pad_line+0x250>
    2746:	8082                	ret
    2748:	00006517          	auipc	a0,0x6
    274c:	bf050513          	addi	a0,a0,-1040 # 8338 <pad_line+0x1f8>
    2750:	8082                	ret
    2752:	00006517          	auipc	a0,0x6
    2756:	bd650513          	addi	a0,a0,-1066 # 8328 <pad_line+0x1e8>
    275a:	8082                	ret
    275c:	00006517          	auipc	a0,0x6
    2760:	b8c50513          	addi	a0,a0,-1140 # 82e8 <pad_line+0x1a8>
    2764:	8082                	ret
    2766:	00006517          	auipc	a0,0x6
    276a:	b7250513          	addi	a0,a0,-1166 # 82d8 <pad_line+0x198>
    276e:	8082                	ret
    2770:	00006517          	auipc	a0,0x6
    2774:	b5450513          	addi	a0,a0,-1196 # 82c4 <pad_line+0x184>
    2778:	8082                	ret
    277a:	00006517          	auipc	a0,0x6
    277e:	b3e50513          	addi	a0,a0,-1218 # 82b8 <pad_line+0x178>
    2782:	8082                	ret
    2784:	00006517          	auipc	a0,0x6
    2788:	b1c50513          	addi	a0,a0,-1252 # 82a0 <pad_line+0x160>
    278c:	8082                	ret
    278e:	00006517          	auipc	a0,0x6
    2792:	b0650513          	addi	a0,a0,-1274 # 8294 <pad_line+0x154>
    2796:	8082                	ret
    2798:	00006517          	auipc	a0,0x6
    279c:	ae850513          	addi	a0,a0,-1304 # 8280 <pad_line+0x140>
    27a0:	8082                	ret
    27a2:	00006517          	auipc	a0,0x6
    27a6:	aca50513          	addi	a0,a0,-1334 # 826c <pad_line+0x12c>
    27aa:	8082                	ret
    27ac:	00006517          	auipc	a0,0x6
    27b0:	aac50513          	addi	a0,a0,-1364 # 8258 <pad_line+0x118>
    27b4:	8082                	ret
    27b6:	00006517          	auipc	a0,0x6
    27ba:	a7650513          	addi	a0,a0,-1418 # 822c <pad_line+0xec>
    27be:	8082                	ret
    27c0:	00006517          	auipc	a0,0x6
    27c4:	a5c50513          	addi	a0,a0,-1444 # 821c <pad_line+0xdc>
    27c8:	8082                	ret
    27ca:	00006517          	auipc	a0,0x6
    27ce:	a2250513          	addi	a0,a0,-1502 # 81ec <pad_line+0xac>
    27d2:	8082                	ret
    27d4:	00006517          	auipc	a0,0x6
    27d8:	a0450513          	addi	a0,a0,-1532 # 81d8 <pad_line+0x98>
    27dc:	8082                	ret
    27de:	00006517          	auipc	a0,0x6
    27e2:	9de50513          	addi	a0,a0,-1570 # 81bc <pad_line+0x7c>
    27e6:	8082                	ret
    27e8:	00006517          	auipc	a0,0x6
    27ec:	9c850513          	addi	a0,a0,-1592 # 81b0 <pad_line+0x70>
    27f0:	8082                	ret
    27f2:	00006517          	auipc	a0,0x6
    27f6:	9a650513          	addi	a0,a0,-1626 # 8198 <pad_line+0x58>
    27fa:	8082                	ret
    27fc:	00006517          	auipc	a0,0x6
    2800:	98c50513          	addi	a0,a0,-1652 # 8188 <pad_line+0x48>
    2804:	8082                	ret
    2806:	00006517          	auipc	a0,0x6
    280a:	96650513          	addi	a0,a0,-1690 # 816c <pad_line+0x2c>
    280e:	8082                	ret
    2810:	00006517          	auipc	a0,0x6
    2814:	04850513          	addi	a0,a0,72 # 8858 <pad_line+0x718>
    2818:	8082                	ret
    281a:	00006517          	auipc	a0,0x6
    281e:	94650513          	addi	a0,a0,-1722 # 8160 <pad_line+0x20>
    2822:	8082                	ret
    2824:	00005517          	auipc	a0,0x5
    2828:	00850513          	addi	a0,a0,8 # 782c <sg_usi_config+0xa4>
    282c:	b9c9                	j	24fe <_strerror_r+0x34>
    282e:	86aa                	mv	a3,a0
    2830:	b1d1                	j	24f4 <_strerror_r+0x2a>

00002832 <strerror>:
    2832:	85aa                	mv	a1,a0
    2834:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2838:	4681                	li	a3,0
    283a:	4601                	li	a2,0
    283c:	b179                	j	24ca <_strerror_r>

0000283e <strerror_l>:
    283e:	85aa                	mv	a1,a0
    2840:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2844:	4681                	li	a3,0
    2846:	4601                	li	a2,0
    2848:	b149                	j	24ca <_strerror_r>
	...

0000284c <strlen>:
    284c:	00357793          	andi	a5,a0,3
    2850:	872a                	mv	a4,a0
    2852:	ef9d                	bnez	a5,2890 <strlen+0x44>
    2854:	7f7f86b7          	lui	a3,0x7f7f8
    2858:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    285c:	55fd                	li	a1,-1
    285e:	4310                	lw	a2,0(a4)
    2860:	0711                	addi	a4,a4,4
    2862:	00d677b3          	and	a5,a2,a3
    2866:	97b6                	add	a5,a5,a3
    2868:	8fd1                	or	a5,a5,a2
    286a:	8fd5                	or	a5,a5,a3
    286c:	feb789e3          	beq	a5,a1,285e <strlen+0x12>
    2870:	ffc74683          	lbu	a3,-4(a4)
    2874:	ffd74603          	lbu	a2,-3(a4)
    2878:	ffe74783          	lbu	a5,-2(a4)
    287c:	8f09                	sub	a4,a4,a0
    287e:	c695                	beqz	a3,28aa <strlen+0x5e>
    2880:	02060263          	beqz	a2,28a4 <strlen+0x58>
    2884:	00f03533          	snez	a0,a5
    2888:	953a                	add	a0,a0,a4
    288a:	1579                	addi	a0,a0,-2
    288c:	8082                	ret
    288e:	d2f9                	beqz	a3,2854 <strlen+0x8>
    2890:	00074783          	lbu	a5,0(a4)
    2894:	0705                	addi	a4,a4,1
    2896:	00377693          	andi	a3,a4,3
    289a:	fbf5                	bnez	a5,288e <strlen+0x42>
    289c:	8f09                	sub	a4,a4,a0
    289e:	fff70513          	addi	a0,a4,-1
    28a2:	8082                	ret
    28a4:	ffd70513          	addi	a0,a4,-3
    28a8:	8082                	ret
    28aa:	ffc70513          	addi	a0,a4,-4
    28ae:	8082                	ret
	...

000028b2 <_strtol_l.part.0>:
    28b2:	1111                	addi	sp,sp,-28
    28b4:	c82a                	sw	a0,16(sp)
    28b6:	cc22                	sw	s0,24(sp)
    28b8:	ca26                	sw	s1,20(sp)
    28ba:	872e                	mv	a4,a1
    28bc:	c42e                	sw	a1,8(sp)
    28be:	c032                	sw	a2,0(sp)
    28c0:	00005517          	auipc	a0,0x5
    28c4:	d0550513          	addi	a0,a0,-763 # 75c5 <_ctype_+0x1>
    28c8:	00074783          	lbu	a5,0(a4)
    28cc:	85ba                	mv	a1,a4
    28ce:	0705                	addi	a4,a4,1
    28d0:	00f50633          	add	a2,a0,a5
    28d4:	00064603          	lbu	a2,0(a2)
    28d8:	8a21                	andi	a2,a2,8
    28da:	f67d                	bnez	a2,28c8 <_strtol_l.part.0+0x16>
    28dc:	02d00613          	li	a2,45
    28e0:	0ec78063          	beq	a5,a2,29c0 <_strtol_l.part.0+0x10e>
    28e4:	02b00613          	li	a2,43
    28e8:	06c78063          	beq	a5,a2,2948 <_strtol_l.part.0+0x96>
    28ec:	800004b7          	lui	s1,0x80000
    28f0:	fff4c493          	not	s1,s1
    28f4:	c602                	sw	zero,12(sp)
    28f6:	c2bd                	beqz	a3,295c <_strtol_l.part.0+0xaa>
    28f8:	4641                	li	a2,16
    28fa:	8436                	mv	s0,a3
    28fc:	0cc68b63          	beq	a3,a2,29d2 <_strtol_l.part.0+0x120>
    2900:	0284f633          	remu	a2,s1,s0
    2904:	4581                	li	a1,0
    2906:	4501                	li	a0,0
    2908:	4325                	li	t1,9
    290a:	43e5                	li	t2,25
    290c:	0284d2b3          	divu	t0,s1,s0
    2910:	c232                	sw	a2,4(sp)
    2912:	fd078613          	addi	a2,a5,-48
    2916:	00c37863          	bgeu	t1,a2,2926 <_strtol_l.part.0+0x74>
    291a:	fbf78613          	addi	a2,a5,-65
    291e:	04c3e863          	bltu	t2,a2,296e <_strtol_l.part.0+0xbc>
    2922:	fc978613          	addi	a2,a5,-55
    2926:	04d65c63          	bge	a2,a3,297e <_strtol_l.part.0+0xcc>
    292a:	0405c063          	bltz	a1,296a <_strtol_l.part.0+0xb8>
    292e:	55fd                	li	a1,-1
    2930:	00a2e863          	bltu	t0,a0,2940 <_strtol_l.part.0+0x8e>
    2934:	06a28663          	beq	t0,a0,29a0 <_strtol_l.part.0+0xee>
    2938:	4585                	li	a1,1
    293a:	02850533          	mul	a0,a0,s0
    293e:	9532                	add	a0,a0,a2
    2940:	0705                	addi	a4,a4,1
    2942:	fff74783          	lbu	a5,-1(a4)
    2946:	b7f1                	j	2912 <_strtol_l.part.0+0x60>
    2948:	800004b7          	lui	s1,0x80000
    294c:	c602                	sw	zero,12(sp)
    294e:	00074783          	lbu	a5,0(a4)
    2952:	fff4c493          	not	s1,s1
    2956:	00258713          	addi	a4,a1,2
    295a:	fed9                	bnez	a3,28f8 <_strtol_l.part.0+0x46>
    295c:	03000693          	li	a3,48
    2960:	08d78d63          	beq	a5,a3,29fa <_strtol_l.part.0+0x148>
    2964:	4429                	li	s0,10
    2966:	46a9                	li	a3,10
    2968:	bf61                	j	2900 <_strtol_l.part.0+0x4e>
    296a:	55fd                	li	a1,-1
    296c:	bfd1                	j	2940 <_strtol_l.part.0+0x8e>
    296e:	f9f78613          	addi	a2,a5,-97
    2972:	00c3e663          	bltu	t2,a2,297e <_strtol_l.part.0+0xcc>
    2976:	fa978613          	addi	a2,a5,-87
    297a:	fad648e3          	blt	a2,a3,292a <_strtol_l.part.0+0x78>
    297e:	0205c563          	bltz	a1,29a8 <_strtol_l.part.0+0xf6>
    2982:	47b2                	lw	a5,12(sp)
    2984:	c399                	beqz	a5,298a <_strtol_l.part.0+0xd8>
    2986:	40a00533          	neg	a0,a0
    298a:	4782                	lw	a5,0(sp)
    298c:	c791                	beqz	a5,2998 <_strtol_l.part.0+0xe6>
    298e:	08059163          	bnez	a1,2a10 <_strtol_l.part.0+0x15e>
    2992:	4782                	lw	a5,0(sp)
    2994:	4722                	lw	a4,8(sp)
    2996:	c398                	sw	a4,0(a5)
    2998:	4462                	lw	s0,24(sp)
    299a:	44d2                	lw	s1,20(sp)
    299c:	0171                	addi	sp,sp,28
    299e:	8082                	ret
    29a0:	4792                	lw	a5,4(sp)
    29a2:	f8c7cfe3          	blt	a5,a2,2940 <_strtol_l.part.0+0x8e>
    29a6:	bf49                	j	2938 <_strtol_l.part.0+0x86>
    29a8:	46c2                	lw	a3,16(sp)
    29aa:	02200793          	li	a5,34
    29ae:	8526                	mv	a0,s1
    29b0:	c29c                	sw	a5,0(a3)
    29b2:	4782                	lw	a5,0(sp)
    29b4:	d3f5                	beqz	a5,2998 <_strtol_l.part.0+0xe6>
    29b6:	fff70793          	addi	a5,a4,-1
    29ba:	c43e                	sw	a5,8(sp)
    29bc:	8526                	mv	a0,s1
    29be:	bfd1                	j	2992 <_strtol_l.part.0+0xe0>
    29c0:	4605                	li	a2,1
    29c2:	00074783          	lbu	a5,0(a4)
    29c6:	800004b7          	lui	s1,0x80000
    29ca:	00258713          	addi	a4,a1,2
    29ce:	c632                	sw	a2,12(sp)
    29d0:	b71d                	j	28f6 <_strtol_l.part.0+0x44>
    29d2:	03000613          	li	a2,48
    29d6:	00c79a63          	bne	a5,a2,29ea <_strtol_l.part.0+0x138>
    29da:	00074603          	lbu	a2,0(a4)
    29de:	05800593          	li	a1,88
    29e2:	0df67613          	andi	a2,a2,223
    29e6:	00b60463          	beq	a2,a1,29ee <_strtol_l.part.0+0x13c>
    29ea:	4441                	li	s0,16
    29ec:	bf11                	j	2900 <_strtol_l.part.0+0x4e>
    29ee:	00174783          	lbu	a5,1(a4)
    29f2:	4441                	li	s0,16
    29f4:	0709                	addi	a4,a4,2
    29f6:	46c1                	li	a3,16
    29f8:	b721                	j	2900 <_strtol_l.part.0+0x4e>
    29fa:	00074683          	lbu	a3,0(a4)
    29fe:	05800613          	li	a2,88
    2a02:	0df6f693          	andi	a3,a3,223
    2a06:	fec684e3          	beq	a3,a2,29ee <_strtol_l.part.0+0x13c>
    2a0a:	4421                	li	s0,8
    2a0c:	46a1                	li	a3,8
    2a0e:	bdcd                	j	2900 <_strtol_l.part.0+0x4e>
    2a10:	84aa                	mv	s1,a0
    2a12:	b755                	j	29b6 <_strtol_l.part.0+0x104>

00002a14 <_strtol_r>:
    2a14:	4705                	li	a4,1
    2a16:	00e68763          	beq	a3,a4,2a24 <_strtol_r+0x10>
    2a1a:	02400713          	li	a4,36
    2a1e:	00d76363          	bltu	a4,a3,2a24 <_strtol_r+0x10>
    2a22:	bd41                	j	28b2 <_strtol_l.part.0>
    2a24:	1151                	addi	sp,sp,-12
    2a26:	c406                	sw	ra,8(sp)
    2a28:	2421                	jal	2c30 <__errno>
    2a2a:	40a2                	lw	ra,8(sp)
    2a2c:	47d9                	li	a5,22
    2a2e:	c11c                	sw	a5,0(a0)
    2a30:	4501                	li	a0,0
    2a32:	0131                	addi	sp,sp,12
    2a34:	8082                	ret

00002a36 <strtol_l>:
    2a36:	4705                	li	a4,1
    2a38:	00e60d63          	beq	a2,a4,2a52 <strtol_l+0x1c>
    2a3c:	02400713          	li	a4,36
    2a40:	00c76963          	bltu	a4,a2,2a52 <strtol_l+0x1c>
    2a44:	87aa                	mv	a5,a0
    2a46:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2a4a:	86b2                	mv	a3,a2
    2a4c:	862e                	mv	a2,a1
    2a4e:	85be                	mv	a1,a5
    2a50:	b58d                	j	28b2 <_strtol_l.part.0>
    2a52:	1151                	addi	sp,sp,-12
    2a54:	c406                	sw	ra,8(sp)
    2a56:	2ae9                	jal	2c30 <__errno>
    2a58:	40a2                	lw	ra,8(sp)
    2a5a:	47d9                	li	a5,22
    2a5c:	c11c                	sw	a5,0(a0)
    2a5e:	4501                	li	a0,0
    2a60:	0131                	addi	sp,sp,12
    2a62:	8082                	ret

00002a64 <strtol>:
    2a64:	4705                	li	a4,1
    2a66:	00e60d63          	beq	a2,a4,2a80 <strtol+0x1c>
    2a6a:	02400713          	li	a4,36
    2a6e:	00c76963          	bltu	a4,a2,2a80 <strtol+0x1c>
    2a72:	87aa                	mv	a5,a0
    2a74:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2a78:	86b2                	mv	a3,a2
    2a7a:	862e                	mv	a2,a1
    2a7c:	85be                	mv	a1,a5
    2a7e:	bd15                	j	28b2 <_strtol_l.part.0>
    2a80:	1151                	addi	sp,sp,-12
    2a82:	c406                	sw	ra,8(sp)
    2a84:	2275                	jal	2c30 <__errno>
    2a86:	40a2                	lw	ra,8(sp)
    2a88:	47d9                	li	a5,22
    2a8a:	c11c                	sw	a5,0(a0)
    2a8c:	4501                	li	a0,0
    2a8e:	0131                	addi	sp,sp,12
    2a90:	8082                	ret

00002a92 <_strtoul_l.constprop.0>:
    2a92:	1121                	addi	sp,sp,-24
    2a94:	ca22                	sw	s0,20(sp)
    2a96:	c826                	sw	s1,16(sp)
    2a98:	c62a                	sw	a0,12(sp)
    2a9a:	c032                	sw	a2,0(sp)
    2a9c:	872e                	mv	a4,a1
    2a9e:	00005317          	auipc	t1,0x5
    2aa2:	b2730313          	addi	t1,t1,-1241 # 75c5 <_ctype_+0x1>
    2aa6:	00074783          	lbu	a5,0(a4)
    2aaa:	853a                	mv	a0,a4
    2aac:	0705                	addi	a4,a4,1
    2aae:	00f30633          	add	a2,t1,a5
    2ab2:	00064603          	lbu	a2,0(a2)
    2ab6:	8a21                	andi	a2,a2,8
    2ab8:	f67d                	bnez	a2,2aa6 <_strtoul_l.constprop.0+0x14>
    2aba:	02d00613          	li	a2,45
    2abe:	0cc78c63          	beq	a5,a2,2b96 <_strtoul_l.constprop.0+0x104>
    2ac2:	02b00613          	li	a2,43
    2ac6:	c402                	sw	zero,8(sp)
    2ac8:	06c78a63          	beq	a5,a2,2b3c <_strtoul_l.constprop.0+0xaa>
    2acc:	00068d63          	beqz	a3,2ae6 <_strtoul_l.constprop.0+0x54>
    2ad0:	4641                	li	a2,16
    2ad2:	0cc68963          	beq	a3,a2,2ba4 <_strtoul_l.constprop.0+0x112>
    2ad6:	567d                	li	a2,-1
    2ad8:	02d653b3          	divu	t2,a2,a3
    2adc:	84b6                	mv	s1,a3
    2ade:	02d67633          	remu	a2,a2,a3
    2ae2:	c232                	sw	a2,4(sp)
    2ae4:	a829                	j	2afe <_strtoul_l.constprop.0+0x6c>
    2ae6:	03000693          	li	a3,48
    2aea:	0ed78463          	beq	a5,a3,2bd2 <_strtoul_l.constprop.0+0x140>
    2aee:	4695                	li	a3,5
    2af0:	1999a3b7          	lui	t2,0x1999a
    2af4:	c236                	sw	a3,4(sp)
    2af6:	99938393          	addi	t2,t2,-1639 # 19999999 <__ctor_end__+0x19991139>
    2afa:	44a9                	li	s1,10
    2afc:	46a9                	li	a3,10
    2afe:	4301                	li	t1,0
    2b00:	4501                	li	a0,0
    2b02:	42a5                	li	t0,9
    2b04:	4465                	li	s0,25
    2b06:	fd078613          	addi	a2,a5,-48
    2b0a:	00c2f863          	bgeu	t0,a2,2b1a <_strtoul_l.constprop.0+0x88>
    2b0e:	fbf78613          	addi	a2,a5,-65
    2b12:	02c46c63          	bltu	s0,a2,2b4a <_strtoul_l.constprop.0+0xb8>
    2b16:	fc978613          	addi	a2,a5,-55
    2b1a:	04d65063          	bge	a2,a3,2b5a <_strtoul_l.constprop.0+0xc8>
    2b1e:	02034463          	bltz	t1,2b46 <_strtoul_l.constprop.0+0xb4>
    2b22:	537d                	li	t1,-1
    2b24:	00a3e863          	bltu	t2,a0,2b34 <_strtoul_l.constprop.0+0xa2>
    2b28:	04750963          	beq	a0,t2,2b7a <_strtoul_l.constprop.0+0xe8>
    2b2c:	02950533          	mul	a0,a0,s1
    2b30:	4305                	li	t1,1
    2b32:	9532                	add	a0,a0,a2
    2b34:	0705                	addi	a4,a4,1
    2b36:	fff74783          	lbu	a5,-1(a4)
    2b3a:	b7f1                	j	2b06 <_strtoul_l.constprop.0+0x74>
    2b3c:	00074783          	lbu	a5,0(a4)
    2b40:	00250713          	addi	a4,a0,2
    2b44:	b761                	j	2acc <_strtoul_l.constprop.0+0x3a>
    2b46:	537d                	li	t1,-1
    2b48:	b7f5                	j	2b34 <_strtoul_l.constprop.0+0xa2>
    2b4a:	f9f78613          	addi	a2,a5,-97
    2b4e:	00c46663          	bltu	s0,a2,2b5a <_strtoul_l.constprop.0+0xc8>
    2b52:	fa978613          	addi	a2,a5,-87
    2b56:	fcd644e3          	blt	a2,a3,2b1e <_strtoul_l.constprop.0+0x8c>
    2b5a:	02034463          	bltz	t1,2b82 <_strtoul_l.constprop.0+0xf0>
    2b5e:	47a2                	lw	a5,8(sp)
    2b60:	c399                	beqz	a5,2b66 <_strtoul_l.constprop.0+0xd4>
    2b62:	40a00533          	neg	a0,a0
    2b66:	4782                	lw	a5,0(sp)
    2b68:	c789                	beqz	a5,2b72 <_strtoul_l.constprop.0+0xe0>
    2b6a:	02031363          	bnez	t1,2b90 <_strtoul_l.constprop.0+0xfe>
    2b6e:	4782                	lw	a5,0(sp)
    2b70:	c38c                	sw	a1,0(a5)
    2b72:	4452                	lw	s0,20(sp)
    2b74:	44c2                	lw	s1,16(sp)
    2b76:	0161                	addi	sp,sp,24
    2b78:	8082                	ret
    2b7a:	4792                	lw	a5,4(sp)
    2b7c:	fac7cce3          	blt	a5,a2,2b34 <_strtoul_l.constprop.0+0xa2>
    2b80:	b775                	j	2b2c <_strtoul_l.constprop.0+0x9a>
    2b82:	46b2                	lw	a3,12(sp)
    2b84:	02200793          	li	a5,34
    2b88:	557d                	li	a0,-1
    2b8a:	c29c                	sw	a5,0(a3)
    2b8c:	4782                	lw	a5,0(sp)
    2b8e:	d3f5                	beqz	a5,2b72 <_strtoul_l.constprop.0+0xe0>
    2b90:	fff70593          	addi	a1,a4,-1
    2b94:	bfe9                	j	2b6e <_strtoul_l.constprop.0+0xdc>
    2b96:	00074783          	lbu	a5,0(a4)
    2b9a:	4705                	li	a4,1
    2b9c:	c43a                	sw	a4,8(sp)
    2b9e:	00250713          	addi	a4,a0,2
    2ba2:	b72d                	j	2acc <_strtoul_l.constprop.0+0x3a>
    2ba4:	03000613          	li	a2,48
    2ba8:	04c79c63          	bne	a5,a2,2c00 <_strtoul_l.constprop.0+0x16e>
    2bac:	00074603          	lbu	a2,0(a4)
    2bb0:	05800513          	li	a0,88
    2bb4:	0df67613          	andi	a2,a2,223
    2bb8:	02a61d63          	bne	a2,a0,2bf2 <_strtoul_l.constprop.0+0x160>
    2bbc:	46bd                	li	a3,15
    2bbe:	100003b7          	lui	t2,0x10000
    2bc2:	00174783          	lbu	a5,1(a4)
    2bc6:	c236                	sw	a3,4(sp)
    2bc8:	0709                	addi	a4,a4,2
    2bca:	13fd                	addi	t2,t2,-1
    2bcc:	44c1                	li	s1,16
    2bce:	46c1                	li	a3,16
    2bd0:	b73d                	j	2afe <_strtoul_l.constprop.0+0x6c>
    2bd2:	00074683          	lbu	a3,0(a4)
    2bd6:	05800613          	li	a2,88
    2bda:	0df6f693          	andi	a3,a3,223
    2bde:	fcc68fe3          	beq	a3,a2,2bbc <_strtoul_l.constprop.0+0x12a>
    2be2:	469d                	li	a3,7
    2be4:	200003b7          	lui	t2,0x20000
    2be8:	c236                	sw	a3,4(sp)
    2bea:	13fd                	addi	t2,t2,-1
    2bec:	44a1                	li	s1,8
    2bee:	46a1                	li	a3,8
    2bf0:	b739                	j	2afe <_strtoul_l.constprop.0+0x6c>
    2bf2:	53fd                	li	t2,-1
    2bf4:	463d                	li	a2,15
    2bf6:	02d3d3b3          	divu	t2,t2,a3
    2bfa:	44c1                	li	s1,16
    2bfc:	c232                	sw	a2,4(sp)
    2bfe:	b701                	j	2afe <_strtoul_l.constprop.0+0x6c>
    2c00:	463d                	li	a2,15
    2c02:	100003b7          	lui	t2,0x10000
    2c06:	c232                	sw	a2,4(sp)
    2c08:	13fd                	addi	t2,t2,-1
    2c0a:	44c1                	li	s1,16
    2c0c:	bdcd                	j	2afe <_strtoul_l.constprop.0+0x6c>

00002c0e <_strtoul_r>:
    2c0e:	b551                	j	2a92 <_strtoul_l.constprop.0>

00002c10 <strtoul_l>:
    2c10:	87aa                	mv	a5,a0
    2c12:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2c16:	86b2                	mv	a3,a2
    2c18:	862e                	mv	a2,a1
    2c1a:	85be                	mv	a1,a5
    2c1c:	bd9d                	j	2a92 <_strtoul_l.constprop.0>

00002c1e <strtoul>:
    2c1e:	87aa                	mv	a5,a0
    2c20:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2c24:	86b2                	mv	a3,a2
    2c26:	862e                	mv	a2,a1
    2c28:	85be                	mv	a1,a5
    2c2a:	b5a5                	j	2a92 <_strtoul_l.constprop.0>

00002c2c <_user_strerror>:
    2c2c:	4501                	li	a0,0
    2c2e:	8082                	ret

00002c30 <__errno>:
    2c30:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2c34:	8082                	ret

00002c36 <board_init>:

extern int clock_timer_init(void);
extern int clock_timer_start(void);

void board_init(void)
{
    2c36:	1151                	addi	sp,sp,-12
    2c38:	c406                	sw	ra,8(sp)
    int32_t ret = 0;
    /* init the console*/
    clock_timer_init();
    2c3a:	1d4010ef          	jal	ra,3e0e <clock_timer_init>
    clock_timer_start();
    2c3e:	24a010ef          	jal	ra,3e88 <clock_timer_start>

    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2c42:	4581                	li	a1,0
    2c44:	4501                	li	a0,0
    2c46:	223000ef          	jal	ra,3668 <csi_usart_initialize>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    if (ret < 0) {
        return;
    }
}
    2c4a:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2c4c:	02a1a623          	sw	a0,44(gp) # 20000514 <console_handle>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2c50:	65f1                	lui	a1,0x1c
    2c52:	478d                	li	a5,3
    2c54:	4701                	li	a4,0
    2c56:	4681                	li	a3,0
    2c58:	4601                	li	a2,0
    2c5a:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x139a0>
}
    2c5e:	0131                	addi	sp,sp,12
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2c60:	20b0006f          	j	366a <csi_usart_config>

00002c64 <drv_irq_enable>:
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__STATIC_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    CLIC->INTIE[IRQn] |= CLIC_INTIE_IE_Msk;
    2c64:	e000e7b7          	lui	a5,0xe000e
    2c68:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    2c6c:	953e                	add	a0,a0,a5
    2c6e:	40054783          	lbu	a5,1024(a0)
    2c72:	0ff7f793          	andi	a5,a5,255
    2c76:	0017e793          	ori	a5,a5,1
    2c7a:	40f50023          	sb	a5,1024(a0)
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_enable_sirq(irq_num);
#else
    csi_vic_enable_irq(irq_num);
#endif
}
    2c7e:	8082                	ret

00002c80 <drv_irq_register>:
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    g_irqvector[irq_num] = irq_handler;
    2c80:	200027b7          	lui	a5,0x20002
    2c84:	050a                	slli	a0,a0,0x2
    2c86:	c3078793          	addi	a5,a5,-976 # 20001c30 <g_irqvector>
    2c8a:	97aa                	add	a5,a5,a0
    2c8c:	c38c                	sw	a1,0(a5)
}
    2c8e:	8082                	ret

00002c90 <wj_usi_set_rxfifo_th>:

static wj_usi_priv_t usi_instance[CONFIG_USI_NUM];

void wj_usi_set_rxfifo_th(wj_usi_reg_t *addr, uint32_t length)
{
    addr->USI_INTR_CTRL &= ~USI_INTR_CTRL_TH_MODE;
    2c90:	457c                	lw	a5,76(a0)
    2c92:	7741                	lui	a4,0xffff0
    2c94:	177d                	addi	a4,a4,-1
    2c96:	8ff9                	and	a5,a5,a4
    2c98:	c57c                	sw	a5,76(a0)
    addr->USI_INTR_CTRL &= USI_INTR_CTRL_RXFIFO_TH;
    2c9a:	457c                	lw	a5,76(a0)
    2c9c:	cff7f793          	andi	a5,a5,-769
    2ca0:	c57c                	sw	a5,76(a0)

    if (length >= USI_RX_MAX_FIFO) {
    2ca2:	47bd                	li	a5,15
    2ca4:	00b7f963          	bgeu	a5,a1,2cb6 <wj_usi_set_rxfifo_th+0x26>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_12 | USI_INTR_CTRL_TH_MODE;
    2ca8:	457c                	lw	a5,76(a0)
    2caa:	6741                	lui	a4,0x10
    2cac:	30070713          	addi	a4,a4,768 # 10300 <__ctor_end__+0x7aa0>
    } else if (length >= USI_RX_MAX_FIFO - 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2cb0:	8fd9                	or	a5,a5,a4
    } else {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2cb2:	c57c                	sw	a5,76(a0)
    }
}
    2cb4:	8082                	ret
    } else if (length >= USI_RX_MAX_FIFO - 4) {
    2cb6:	47ad                	li	a5,11
    2cb8:	00b7f763          	bgeu	a5,a1,2cc6 <wj_usi_set_rxfifo_th+0x36>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    2cbc:	6741                	lui	a4,0x10
    2cbe:	457c                	lw	a5,76(a0)
    2cc0:	20070713          	addi	a4,a4,512 # 10200 <__ctor_end__+0x79a0>
    2cc4:	b7f5                	j	2cb0 <wj_usi_set_rxfifo_th+0x20>
    } else if (length >= 4) {
    2cc6:	478d                	li	a5,3
    2cc8:	00b7f763          	bgeu	a5,a1,2cd6 <wj_usi_set_rxfifo_th+0x46>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2ccc:	6741                	lui	a4,0x10
    2cce:	457c                	lw	a5,76(a0)
    2cd0:	10070713          	addi	a4,a4,256 # 10100 <__ctor_end__+0x78a0>
    2cd4:	bff1                	j	2cb0 <wj_usi_set_rxfifo_th+0x20>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2cd6:	457c                	lw	a5,76(a0)
    2cd8:	1007e793          	ori	a5,a5,256
    2cdc:	bfd9                	j	2cb2 <wj_usi_set_rxfifo_th+0x22>

00002cde <wj_usi_irqhandler>:
//            CSI_DRIVER
//------------------------------------------
void wj_usi_irqhandler(int32_t idx)
{
    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usi_priv->base);
    2cde:	200017b7          	lui	a5,0x20001
    2ce2:	00351713          	slli	a4,a0,0x3
    2ce6:	76878793          	addi	a5,a5,1896 # 20001768 <usi_instance>
    2cea:	97ba                	add	a5,a5,a4
    2cec:	439c                	lw	a5,0(a5)

    switch (addr->USI_MODE_SEL & 0x3) {
    2cee:	4705                	li	a4,1
    2cf0:	43dc                	lw	a5,4(a5)
    2cf2:	8b8d                	andi	a5,a5,3
    2cf4:	00e78863          	beq	a5,a4,2d04 <wj_usi_irqhandler+0x26>
    2cf8:	4709                	li	a4,2
    2cfa:	00e78663          	beq	a5,a4,2d06 <wj_usi_irqhandler+0x28>
    2cfe:	00079563          	bnez	a5,2d08 <wj_usi_irqhandler+0x2a>
        case USI_MODE_UART:
#ifndef  CONFIG_CHIP_PANGU
            wj_usi_usart_irqhandler(idx);
    2d02:	af01                	j	3412 <wj_usi_usart_irqhandler>
#endif
            break;

        case USI_MODE_I2C:
            wj_usi_i2c_irqhandler(idx);
    2d04:	a0a1                	j	2d4c <wj_usi_i2c_irqhandler>
            break;

        case USI_MODE_SPI:
            wj_usi_spi_irqhandler(idx);
    2d06:	acfd                	j	3004 <wj_usi_spi_irqhandler>
            break;

        default:
            return;
    }
}
    2d08:	8082                	ret

00002d0a <drv_usi_initialize>:

int32_t drv_usi_initialize(int32_t idx)
{
    2d0a:	1131                	addi	sp,sp,-20
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usi_init(idx, &base, &irq);
    2d0c:	0050                	addi	a2,sp,4
    2d0e:	858a                	mv	a1,sp
{
    2d10:	c622                	sw	s0,12(sp)
    2d12:	c806                	sw	ra,16(sp)
    2d14:	842a                	mv	s0,a0
    uint32_t base = 0u;
    2d16:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    2d18:	c202                	sw	zero,4(sp)
    int32_t ret = target_usi_init(idx, &base, &irq);
    2d1a:	1dd000ef          	jal	ra,36f6 <target_usi_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    2d1e:	4789                	li	a5,2
    2d20:	02a7e163          	bltu	a5,a0,2d42 <drv_usi_initialize+0x38>
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    usi_priv->base = base;
    2d24:	4782                	lw	a5,0(sp)
    2d26:	20001537          	lui	a0,0x20001
    2d2a:	040e                	slli	s0,s0,0x3
    2d2c:	76850513          	addi	a0,a0,1896 # 20001768 <usi_instance>
    2d30:	9522                	add	a0,a0,s0
    2d32:	c11c                	sw	a5,0(a0)
    usi_priv->irq  = irq;
    2d34:	4792                	lw	a5,4(sp)
    2d36:	c15c                	sw	a5,4(a0)

    return 0;
    2d38:	4501                	li	a0,0
}
    2d3a:	40c2                	lw	ra,16(sp)
    2d3c:	4432                	lw	s0,12(sp)
    2d3e:	0151                	addi	sp,sp,20
    2d40:	8082                	ret
        return ERR_USI(DRV_ERROR_PARAMETER);
    2d42:	81180537          	lui	a0,0x81180
    2d46:	08450513          	addi	a0,a0,132 # 81180084 <__heap_end+0x61150084>
    2d4a:	bfc5                	j	2d3a <drv_usi_initialize+0x30>

00002d4c <wj_usi_i2c_irqhandler>:

}
void wj_usi_i2c_irqhandler(int32_t idx)
{
    wj_usi_iic_priv_t *iic_priv = &iic_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2d4c:	03000713          	li	a4,48
    2d50:	02e50733          	mul	a4,a0,a4
    2d54:	200017b7          	lui	a5,0x20001
    2d58:	78078693          	addi	a3,a5,1920 # 20001780 <iic_instance>
{
    2d5c:	1121                	addi	sp,sp,-24
    2d5e:	c822                	sw	s0,16(sp)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;

    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d60:	6599                	lui	a1,0x6
{
    2d62:	c626                	sw	s1,12(sp)
    2d64:	ca06                	sw	ra,20(sp)
    2d66:	84aa                	mv	s1,a0
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2d68:	78078793          	addi	a5,a5,1920
    2d6c:	9736                	add	a4,a4,a3
    2d6e:	4300                	lw	s0,0(a4)
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2d70:	4874                	lw	a3,84(s0)
    2d72:	00e69313          	slli	t1,a3,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d76:	8df5                	and	a1,a1,a3
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2d78:	00e35313          	srli	t1,t1,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d7c:	c19d                	beqz	a1,2da2 <wj_usi_i2c_irqhandler+0x56>
        /* If arbitration fault, it indicates either a slave device not
        * responding as expected, or other master which is not supported
        * by this SW.
        */
        iic_priv->status    = IIC_STATE_DONE;
    2d7e:	4691                	li	a3,4
    2d80:	d714                	sw	a3,40(a4)
        addr->USI_EN = 0;
    2d82:	00042023          	sw	zero,0(s0) # 80000 <__ctor_end__+0x777a0>
        addr->USI_INTR_UNMASK = 0;
    2d86:	04042e23          	sw	zero,92(s0)
        addr->USI_INTR_EN = 0;
        addr->USI_INTR_CLR = intr_state;

        if (iic_priv->cb_event) {
    2d8a:	4718                	lw	a4,8(a4)
        addr->USI_INTR_EN = 0;
    2d8c:	04042823          	sw	zero,80(s0)
        addr->USI_INTR_CLR = intr_state;
    2d90:	06642023          	sw	t1,96(s0)
        if (iic_priv->cb_event) {
    2d94:	cf11                	beqz	a4,2db0 <wj_usi_i2c_irqhandler+0x64>
            if (iic_priv->cb_event) {
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
            }
        }
    }
}
    2d96:	4442                	lw	s0,16(sp)
    2d98:	40d2                	lw	ra,20(sp)
    2d9a:	44b2                	lw	s1,12(sp)
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d9c:	459d                	li	a1,7
}
    2d9e:	0161                	addi	sp,sp,24
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2da0:	8702                	jr	a4
    switch (iic_priv->status) {
    2da2:	5710                	lw	a2,40(a4)
    2da4:	4505                	li	a0,1
    2da6:	02a60663          	beq	a2,a0,2dd2 <wj_usi_i2c_irqhandler+0x86>
    2daa:	4589                	li	a1,2
    2dac:	10b60263          	beq	a2,a1,2eb0 <wj_usi_i2c_irqhandler+0x164>
            if (iic_priv->cb_event) {
    2db0:	03000713          	li	a4,48
    2db4:	02e48733          	mul	a4,s1,a4
            addr->USI_INTR_CLR = intr_state;
    2db8:	06642023          	sw	t1,96(s0)
            addr->USI_INTR_UNMASK = 0;
    2dbc:	04042e23          	sw	zero,92(s0)
            addr->USI_INTR_EN = 0;
    2dc0:	04042823          	sw	zero,80(s0)
            addr->USI_EN = 0;
    2dc4:	00042023          	sw	zero,0(s0)
            if (iic_priv->cb_event) {
    2dc8:	97ba                	add	a5,a5,a4
    2dca:	479c                	lw	a5,8(a5)
    2dcc:	c7e1                	beqz	a5,2e94 <wj_usi_i2c_irqhandler+0x148>
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2dce:	4599                	li	a1,6
    2dd0:	a2d9                	j	2f96 <wj_usi_i2c_irqhandler+0x24a>
    if (intr_stat & USI_INT_TX_EMPTY) {
    2dd2:	0026f513          	andi	a0,a3,2
    uint8_t emptyfifo = 0;
    2dd6:	4601                	li	a2,0
    if (intr_stat & USI_INT_TX_EMPTY) {
    2dd8:	cd05                	beqz	a0,2e10 <wj_usi_i2c_irqhandler+0xc4>
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2dda:	5350                	lw	a2,36(a4)
    2ddc:	4b08                	lw	a0,16(a4)
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2dde:	4458                	lw	a4,12(s0)
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2de0:	8d11                	sub	a0,a0,a2
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2de2:	8321                	srli	a4,a4,0x8
    2de4:	4641                	li	a2,16
    2de6:	8b7d                	andi	a4,a4,31
    2de8:	40e60733          	sub	a4,a2,a4
    2dec:	0ff57613          	andi	a2,a0,255
    2df0:	00a77963          	bgeu	a4,a0,2e02 <wj_usi_i2c_irqhandler+0xb6>
    2df4:	4458                	lw	a4,12(s0)
    2df6:	4641                	li	a2,16
    2df8:	8321                	srli	a4,a4,0x8
    2dfa:	8b7d                	andi	a4,a4,31
    2dfc:	8e19                	sub	a2,a2,a4
    2dfe:	0ff67613          	andi	a2,a2,255
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2e02:	03000713          	li	a4,48
    2e06:	02e48733          	mul	a4,s1,a4
    2e0a:	973e                	add	a4,a4,a5
        for (i = 0; i < emptyfifo; i++) {
    2e0c:	08c5e963          	bltu	a1,a2,2e9e <wj_usi_i2c_irqhandler+0x152>
    if (iic_priv->tx_cnt == iic_priv->tx_total_num) {
    2e10:	03000713          	li	a4,48
    2e14:	02e48733          	mul	a4,s1,a4
    2e18:	973e                	add	a4,a4,a5
    2e1a:	534c                	lw	a1,36(a4)
    2e1c:	4b18                	lw	a4,16(a4)
    2e1e:	00e59963          	bne	a1,a4,2e30 <wj_usi_i2c_irqhandler+0xe4>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2e22:	5418                	lw	a4,40(s0)
    2e24:	00276713          	ori	a4,a4,2
    2e28:	d418                	sw	a4,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    2e2a:	4838                	lw	a4,80(s0)
    2e2c:	9b75                	andi	a4,a4,-3
    2e2e:	c838                	sw	a4,80(s0)
    if (intr_stat & USI_INT_I2C_STOP) {
    2e30:	6705                	lui	a4,0x1
    2e32:	8f75                	and	a4,a4,a3
    2e34:	cb0d                	beqz	a4,2e66 <wj_usi_i2c_irqhandler+0x11a>
        iic_priv->status  = IIC_STATE_SEND_DONE;
    2e36:	03000713          	li	a4,48
    2e3a:	02e48733          	mul	a4,s1,a4
    2e3e:	4595                	li	a1,5
    2e40:	973e                	add	a4,a4,a5
    2e42:	d70c                	sw	a1,40(a4)
        if (iic_priv->cb_event) {
    2e44:	4718                	lw	a4,8(a4)
        addr->USI_EN = 0;
    2e46:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2e4a:	cf11                	beqz	a4,2e66 <wj_usi_i2c_irqhandler+0x11a>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2e4c:	4581                	li	a1,0
    2e4e:	8526                	mv	a0,s1
    2e50:	c432                	sw	a2,8(sp)
    2e52:	c21a                	sw	t1,4(sp)
    2e54:	c036                	sw	a3,0(sp)
    2e56:	9702                	jalr	a4
    2e58:	4622                	lw	a2,8(sp)
    2e5a:	4312                	lw	t1,4(sp)
    2e5c:	4682                	lw	a3,0(sp)
    2e5e:	200017b7          	lui	a5,0x20001
    2e62:	78078793          	addi	a5,a5,1920 # 20001780 <iic_instance>
    iic_priv->tx_cnt += emptyfifo;
    2e66:	03000713          	li	a4,48
    2e6a:	02e48733          	mul	a4,s1,a4
    if (intr_stat & USI_INT_TX_WERR) {
    2e6e:	8ac1                	andi	a3,a3,16
    iic_priv->tx_cnt += emptyfifo;
    2e70:	97ba                	add	a5,a5,a4
    2e72:	53d8                	lw	a4,36(a5)
    2e74:	963a                	add	a2,a2,a4
    2e76:	d3d0                	sw	a2,36(a5)
    if (intr_stat & USI_INT_TX_WERR) {
    2e78:	ce81                	beqz	a3,2e90 <wj_usi_i2c_irqhandler+0x144>
        iic_priv->status = IIC_STATE_ERROR;
    2e7a:	471d                	li	a4,7
    2e7c:	d798                	sw	a4,40(a5)
        if (iic_priv->cb_event) {
    2e7e:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2e80:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2e84:	c791                	beqz	a5,2e90 <wj_usi_i2c_irqhandler+0x144>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2e86:	459d                	li	a1,7
    2e88:	8526                	mv	a0,s1
    2e8a:	c01a                	sw	t1,0(sp)
    2e8c:	9782                	jalr	a5
    2e8e:	4302                	lw	t1,0(sp)
            addr->USI_INTR_CLR = intr_state;
    2e90:	06642023          	sw	t1,96(s0)
}
    2e94:	40d2                	lw	ra,20(sp)
    2e96:	4442                	lw	s0,16(sp)
    2e98:	44b2                	lw	s1,12(sp)
    2e9a:	0161                	addi	sp,sp,24
    2e9c:	8082                	ret
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2e9e:	4f08                	lw	a0,24(a4)
        for (i = 0; i < emptyfifo; i++) {
    2ea0:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = tx_data;
    2ea2:	00054283          	lbu	t0,0(a0)
            iic_priv->tx_buf++;
    2ea6:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = tx_data;
    2ea8:	00542423          	sw	t0,8(s0)
            iic_priv->tx_buf++;
    2eac:	cf08                	sw	a0,24(a4)
        for (i = 0; i < emptyfifo; i++) {
    2eae:	bfb9                	j	2e0c <wj_usi_i2c_irqhandler+0xc0>
    if (intr_stat & USI_INT_RX_THOLD) {
    2eb0:	0206f613          	andi	a2,a3,32
    2eb4:	ca25                	beqz	a2,2f24 <wj_usi_i2c_irqhandler+0x1d8>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    2eb6:	02000613          	li	a2,32
    2eba:	d030                	sw	a2,96(s0)
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2ebc:	4450                	lw	a2,12(s0)
    2ebe:	8241                	srli	a2,a2,0x10
    2ec0:	01f67513          	andi	a0,a2,31
        for (i = 0; i < rx_num; i++) {
    2ec4:	4601                	li	a2,0
    2ec6:	0ca66e63          	bltu	a2,a0,2fa2 <wj_usi_i2c_irqhandler+0x256>
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2eca:	03000613          	li	a2,48
    2ece:	02c48633          	mul	a2,s1,a2
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2ed2:	4458                	lw	a4,12(s0)
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2ed4:	4585                	li	a1,1
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2ed6:	8321                	srli	a4,a4,0x8
    2ed8:	8b7d                	andi	a4,a4,31
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2eda:	963e                	add	a2,a2,a5
    2edc:	5208                	lw	a0,32(a2)
    2ede:	4641                	li	a2,16
    2ee0:	8e19                	sub	a2,a2,a4
    2ee2:	00a67663          	bgeu	a2,a0,2eee <wj_usi_i2c_irqhandler+0x1a2>
    2ee6:	45c1                	li	a1,16
    2ee8:	8d99                	sub	a1,a1,a4
    2eea:	0ff5f593          	andi	a1,a1,255
        if (iic_priv->rx_clk == 0) {
    2eee:	03000713          	li	a4,48
    2ef2:	02e48733          	mul	a4,s1,a4
    2ef6:	973e                	add	a4,a4,a5
    2ef8:	5310                	lw	a2,32(a4)
    2efa:	ce61                	beqz	a2,2fd2 <wj_usi_i2c_irqhandler+0x286>
        for (i = 0; i < rxfifo; i++) {
    2efc:	4601                	li	a2,0
            addr->USI_TX_RX_FIFO = 0x100;
    2efe:	10000313          	li	t1,256
        for (i = 0; i < rxfifo; i++) {
    2f02:	0ab61f63          	bne	a2,a1,2fc0 <wj_usi_i2c_irqhandler+0x274>
        wj_usi_set_rxfifo_th(addr, rxfifo);
    2f06:	8522                	mv	a0,s0
    2f08:	c236                	sw	a3,4(sp)
    2f0a:	c02e                	sw	a1,0(sp)
    2f0c:	3351                	jal	2c90 <wj_usi_set_rxfifo_th>
        if (rxfifo == 0) {
    2f0e:	4582                	lw	a1,0(sp)
    2f10:	200017b7          	lui	a5,0x20001
    2f14:	4692                	lw	a3,4(sp)
    2f16:	78078793          	addi	a5,a5,1920 # 20001780 <iic_instance>
    2f1a:	e589                	bnez	a1,2f24 <wj_usi_i2c_irqhandler+0x1d8>
            addr->USI_INTR_EN |= USI_INT_I2C_STOP;
    2f1c:	4838                	lw	a4,80(s0)
    2f1e:	6605                	lui	a2,0x1
    2f20:	8f51                	or	a4,a4,a2
    2f22:	c838                	sw	a4,80(s0)
    if (iic_priv->rx_cnt == iic_priv->rx_total_num) {
    2f24:	03000713          	li	a4,48
    2f28:	02e48733          	mul	a4,s1,a4
    2f2c:	973e                	add	a4,a4,a5
    2f2e:	4f50                	lw	a2,28(a4)
    2f30:	4758                	lw	a4,12(a4)
    2f32:	00e61a63          	bne	a2,a4,2f46 <wj_usi_i2c_irqhandler+0x1fa>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2f36:	5418                	lw	a4,40(s0)
    2f38:	00276713          	ori	a4,a4,2
    2f3c:	d418                	sw	a4,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_RX_THOLD;
    2f3e:	4838                	lw	a4,80(s0)
    2f40:	fdf77713          	andi	a4,a4,-33
    2f44:	c838                	sw	a4,80(s0)
    if ((intr_stat & USI_INT_RX_WERR) || (intr_stat & USI_INT_RX_RERR)) {
    2f46:	3006f713          	andi	a4,a3,768
    2f4a:	c70d                	beqz	a4,2f74 <wj_usi_i2c_irqhandler+0x228>
        iic_priv->status = IIC_STATE_ERROR;
    2f4c:	03000713          	li	a4,48
    2f50:	02e48733          	mul	a4,s1,a4
    2f54:	461d                	li	a2,7
    2f56:	973e                	add	a4,a4,a5
    2f58:	d710                	sw	a2,40(a4)
        if (iic_priv->cb_event) {
    2f5a:	4718                	lw	a4,8(a4)
        addr->USI_EN = 0;
    2f5c:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f60:	cb11                	beqz	a4,2f74 <wj_usi_i2c_irqhandler+0x228>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2f62:	459d                	li	a1,7
    2f64:	8526                	mv	a0,s1
    2f66:	c036                	sw	a3,0(sp)
    2f68:	9702                	jalr	a4
    2f6a:	4682                	lw	a3,0(sp)
    2f6c:	200017b7          	lui	a5,0x20001
    2f70:	78078793          	addi	a5,a5,1920 # 20001780 <iic_instance>
    if (intr_stat & USI_INT_I2C_STOP) {
    2f74:	6705                	lui	a4,0x1
    2f76:	8ef9                	and	a3,a3,a4
    2f78:	de91                	beqz	a3,2e94 <wj_usi_i2c_irqhandler+0x148>
        addr->USI_INTR_CLR = USI_INT_I2C_STOP;
    2f7a:	d038                	sw	a4,96(s0)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2f7c:	03000713          	li	a4,48
    2f80:	02e48733          	mul	a4,s1,a4
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2f84:	4581                	li	a1,0
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2f86:	97ba                	add	a5,a5,a4
    2f88:	4719                	li	a4,6
    2f8a:	d798                	sw	a4,40(a5)
        if (iic_priv->cb_event) {
    2f8c:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2f8e:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f92:	f00781e3          	beqz	a5,2e94 <wj_usi_i2c_irqhandler+0x148>
}
    2f96:	4442                	lw	s0,16(sp)
    2f98:	40d2                	lw	ra,20(sp)
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2f9a:	8526                	mv	a0,s1
}
    2f9c:	44b2                	lw	s1,12(sp)
    2f9e:	0161                	addi	sp,sp,24
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2fa0:	8782                	jr	a5
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2fa2:	00842303          	lw	t1,8(s0)
    2fa6:	4b4c                	lw	a1,20(a4)
        for (i = 0; i < rx_num; i++) {
    2fa8:	0605                	addi	a2,a2,1
    2faa:	0ff67613          	andi	a2,a2,255
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2fae:	00658023          	sb	t1,0(a1) # 6000 <rcvr_datablock+0x4e>
            iic_priv->rx_buf++;
    2fb2:	4b4c                	lw	a1,20(a4)
    2fb4:	0585                	addi	a1,a1,1
    2fb6:	cb4c                	sw	a1,20(a4)
            iic_priv->rx_cnt++;;
    2fb8:	4f4c                	lw	a1,28(a4)
    2fba:	0585                	addi	a1,a1,1
    2fbc:	cf4c                	sw	a1,28(a4)
        for (i = 0; i < rx_num; i++) {
    2fbe:	b721                	j	2ec6 <wj_usi_i2c_irqhandler+0x17a>
            addr->USI_TX_RX_FIFO = 0x100;
    2fc0:	00642423          	sw	t1,8(s0)
            iic_priv->rx_clk--;
    2fc4:	5308                	lw	a0,32(a4)
        for (i = 0; i < rxfifo; i++) {
    2fc6:	0605                	addi	a2,a2,1
    2fc8:	0ff67613          	andi	a2,a2,255
            iic_priv->rx_clk--;
    2fcc:	157d                	addi	a0,a0,-1
    2fce:	d308                	sw	a0,32(a4)
        for (i = 0; i < rxfifo; i++) {
    2fd0:	bf0d                	j	2f02 <wj_usi_i2c_irqhandler+0x1b6>
            rxfifo = 0;
    2fd2:	4581                	li	a1,0
    2fd4:	bf0d                	j	2f06 <wj_usi_i2c_irqhandler+0x1ba>

00002fd6 <wj_spi_ss_control.isra.0>:
/**
  \brief control ss line depend on controlled Output mode.
*/
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
{
    if (spi_priv->ss_mode == SPI_SS_MASTER_HW_OUTPUT) {
    2fd6:	4789                	li	a5,2
    2fd8:	02f51463          	bne	a0,a5,3000 <wj_spi_ss_control.isra.0+0x2a>
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
    2fdc:	1151                	addi	sp,sp,-12
    2fde:	c406                	sw	ra,8(sp)
        if (stat == SPI_SS_INACTIVE) {
    2fe0:	e991                	bnez	a1,2ff4 <wj_spi_ss_control.isra.0+0x1e>
            csi_gpio_pin_write(pgpio_pin_handle, true);
    2fe2:	4585                	li	a1,1
        } else if (stat == SPI_SS_ACTIVE) {
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2fe4:	0101a503          	lw	a0,16(gp) # 200004f8 <pgpio_pin_handle>
    2fe8:	157000ef          	jal	ra,393e <csi_gpio_pin_write>
        } else {
            return -1;
        }
    }

    return 0;
    2fec:	4501                	li	a0,0
}
    2fee:	40a2                	lw	ra,8(sp)
    2ff0:	0131                	addi	sp,sp,12
    2ff2:	8082                	ret
        } else if (stat == SPI_SS_ACTIVE) {
    2ff4:	4785                	li	a5,1
            return -1;
    2ff6:	557d                	li	a0,-1
        } else if (stat == SPI_SS_ACTIVE) {
    2ff8:	fef59be3          	bne	a1,a5,2fee <wj_spi_ss_control.isra.0+0x18>
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2ffc:	4581                	li	a1,0
    2ffe:	b7dd                	j	2fe4 <wj_spi_ss_control.isra.0+0xe>
    return 0;
    3000:	4501                	li	a0,0
}
    3002:	8082                	ret

00003004 <wj_usi_spi_irqhandler>:
  \brief       handler the interrupt.
  \param[in]   spi      Pointer to \ref SPI_RESOURCES
*/
void wj_usi_spi_irqhandler(int32_t idx)
{
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3004:	04c00793          	li	a5,76
    3008:	02f507b3          	mul	a5,a0,a5
{
    300c:	1101                	addi	sp,sp,-32
    300e:	cc22                	sw	s0,24(sp)
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3010:	20002437          	lui	s0,0x20002
    3014:	81040313          	addi	t1,s0,-2032 # 20001810 <spi_instance>
{
    3018:	ca26                	sw	s1,20(sp)
    301a:	ce06                	sw	ra,28(sp)
    301c:	872a                	mv	a4,a0
    301e:	81040413          	addi	s0,s0,-2032
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3022:	933e                	add	t1,t1,a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3024:	00032483          	lw	s1,0(t1)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    3028:	48f0                	lw	a2,84(s1)
    302a:	00e61793          	slli	a5,a2,0xe
    302e:	83b9                	srli	a5,a5,0xe
    3030:	c03e                	sw	a5,0(sp)

    /* deal with receive FIFO full interrupt */
    if (intr_state & USI_INT_SPI_STOP) {
    3032:	000207b7          	lui	a5,0x20
    3036:	8ff1                	and	a5,a5,a2
    3038:	c7c9                	beqz	a5,30c2 <wj_usi_spi_irqhandler+0xbe>
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    303a:	44dc                	lw	a5,12(s1)
    uint32_t length = spi_priv->recv_num;
    303c:	01432503          	lw	a0,20(t1)
    uint8_t *pbuffer = spi_priv->recv_buf;
    3040:	01c32583          	lw	a1,28(t1)
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    3044:	83c1                	srli	a5,a5,0x10
    uint32_t rxdata_num = (rxnum > length) ? length : rxnum;
    3046:	8bfd                	andi	a5,a5,31
    3048:	00f57363          	bgeu	a0,a5,304e <wj_usi_spi_irqhandler+0x4a>
    304c:	87aa                	mv	a5,a0
    for (i = 0; i < rxdata_num; i++) {
    304e:	00f582b3          	add	t0,a1,a5
    3052:	0a559d63          	bne	a1,t0,310c <wj_usi_spi_irqhandler+0x108>
    length -= rxdata_num;
    3056:	40f502b3          	sub	t0,a0,a5
    if (length <= 0) {
    305a:	0af51f63          	bne	a0,a5,3118 <wj_usi_spi_irqhandler+0x114>
        addr->USI_INTR_EN &= ~USI_INT_SPI_STOP;
    305e:	48bc                	lw	a5,80(s1)
    3060:	7581                	lui	a1,0xfffe0
    3062:	15fd                	addi	a1,a1,-1
    3064:	8fed                	and	a5,a5,a1
    3066:	c8bc                	sw	a5,80(s1)
        spi_priv->status.busy = 0U;
    3068:	04c00793          	li	a5,76
    306c:	02f707b3          	mul	a5,a4,a5
    3070:	c832                	sw	a2,16(sp)
    3072:	c63a                	sw	a4,12(sp)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3074:	c21a                	sw	t1,4(sp)
        spi_priv->status.busy = 0U;
    3076:	97a2                	add	a5,a5,s0
    3078:	0387c583          	lbu	a1,56(a5) # 20038 <__ctor_end__+0x177d8>
        spi_priv->recv_num = 0;
    307c:	c43e                	sw	a5,8(sp)
        spi_priv->status.busy = 0U;
    307e:	99f9                	andi	a1,a1,-2
    3080:	02b78c23          	sb	a1,56(a5)
        addr->USI_EN = 0x0;
    3084:	0004a023          	sw	zero,0(s1) # 80000000 <__heap_end+0x5ffd0000>
        addr->USI_EN = 0xf;
    3088:	45bd                	li	a1,15
    308a:	c08c                	sw	a1,0(s1)
        addr->USI_EN = 0x0;
    308c:	0004a023          	sw	zero,0(s1)
        spi_priv->recv_num = 0;
    3090:	0007aa23          	sw	zero,20(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3094:	03434503          	lbu	a0,52(t1)
    3098:	4581                	li	a1,0
    309a:	3f35                	jal	2fd6 <wj_spi_ss_control.isra.0>
        if (spi_priv->cb_event) {
    309c:	47a2                	lw	a5,8(sp)
    309e:	4312                	lw	t1,4(sp)
    30a0:	4732                	lw	a4,12(sp)
    30a2:	00c7a383          	lw	t2,12(a5)
    30a6:	4642                	lw	a2,16(sp)
    30a8:	00038a63          	beqz	t2,30bc <wj_usi_spi_irqhandler+0xb8>
            spi_priv->cb_event(spi_priv->idx, SPI_EVENT_RX_COMPLETE);
    30ac:	43a8                	lw	a0,64(a5)
    30ae:	4589                	li	a1,2
    30b0:	c41a                	sw	t1,8(sp)
    30b2:	c232                	sw	a2,4(sp)
    30b4:	9382                	jalr	t2
            return;
    30b6:	4612                	lw	a2,4(sp)
    30b8:	4322                	lw	t1,8(sp)
    30ba:	4732                	lw	a4,12(sp)
        wj_spi_intr_rx_full(spi_priv);
        addr->USI_INTR_CLR = USI_INT_SPI_STOP;
    30bc:	000207b7          	lui	a5,0x20
    30c0:	d0bc                	sw	a5,96(s1)
    }

    /* deal with transmit FIFO empty interrupt */
    if (intr_state & USI_INT_TX_EMPTY) {
    30c2:	8a09                	andi	a2,a2,2
    30c4:	10060363          	beqz	a2,31ca <wj_usi_spi_irqhandler+0x1c6>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    30c8:	04c00793          	li	a5,76
    30cc:	02f707b3          	mul	a5,a4,a5
    30d0:	97a2                	add	a5,a5,s0
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30d2:	5b8c                	lw	a1,48(a5)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    30d4:	4390                	lw	a2,0(a5)
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30d6:	c1d9                	beqz	a1,315c <wj_usi_spi_irqhandler+0x158>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    30d8:	578c                	lw	a1,40(a5)
    30da:	47c1                	li	a5,16
    30dc:	00b7f363          	bgeu	a5,a1,30e2 <wj_usi_spi_irqhandler+0xde>
    30e0:	45c1                	li	a1,16
    30e2:	04c00793          	li	a5,76
    30e6:	02f707b3          	mul	a5,a4,a5
    30ea:	4281                	li	t0,0
    30ec:	97a2                	add	a5,a5,s0
    30ee:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    30f0:	08558563          	beq	a1,t0,317a <wj_usi_spi_irqhandler+0x176>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    30f4:	4f88                	lw	a0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    30f6:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    30f8:	00054383          	lbu	t2,0(a0)
            spi_priv->send_buf++;
    30fc:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    30fe:	00762423          	sw	t2,8(a2) # 1008 <__divdf3+0x15e>
            spi_priv->send_buf++;
    3102:	cf88                	sw	a0,24(a5)
            spi_priv->send_num--;
    3104:	4b88                	lw	a0,16(a5)
    3106:	157d                	addi	a0,a0,-1
    3108:	cb88                	sw	a0,16(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    310a:	b7dd                	j	30f0 <wj_usi_spi_irqhandler+0xec>
        *pbuffer = addr->USI_TX_RX_FIFO;
    310c:	0084a383          	lw	t2,8(s1)
        pbuffer++;
    3110:	0585                	addi	a1,a1,1
        *pbuffer = addr->USI_TX_RX_FIFO;
    3112:	fe758fa3          	sb	t2,-1(a1) # fffdffff <__heap_end+0xdffaffff>
    for (i = 0; i < rxdata_num; i++) {
    3116:	bf35                	j	3052 <wj_usi_spi_irqhandler+0x4e>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3118:	04c00793          	li	a5,76
    311c:	02f707b3          	mul	a5,a4,a5
    3120:	97a2                	add	a5,a5,s0
    3122:	4388                	lw	a0,0(a5)
            addr->USI_SPI_CTRL &= ~WJ_USI_SPI_CTRL_TMODE;
    3124:	04452383          	lw	t2,68(a0)
    3128:	fcf3f393          	andi	t2,t2,-49
    312c:	04752223          	sw	t2,68(a0)
            addr->USI_SPI_CTRL |= WJ_USI_SPI_CTRL_TMODE_RX;
    3130:	04452383          	lw	t2,68(a0)
    3134:	0203e393          	ori	t2,t2,32
    3138:	04752223          	sw	t2,68(a0)
    spi_priv->mode = mode;
    313c:	4509                	li	a0,2
    313e:	db88                	sw	a0,48(a5)
        spi_priv->recv_buf = pbuffer;
    3140:	cfcc                	sw	a1,28(a5)
        spi_priv->recv_num = length;
    3142:	0057aa23          	sw	t0,20(a5) # 20014 <__ctor_end__+0x177b4>
    3146:	bf9d                	j	30bc <wj_usi_spi_irqhandler+0xb8>
            *spi_priv->recv_buf = addr->USI_TX_RX_FIFO;
    3148:	4608                	lw	a0,8(a2)
    314a:	4fcc                	lw	a1,28(a5)
    314c:	00a58023          	sb	a0,0(a1)
            spi_priv->recv_buf++;
    3150:	4fcc                	lw	a1,28(a5)
    3152:	0585                	addi	a1,a1,1
    3154:	cfcc                	sw	a1,28(a5)
            spi_priv->transfer_num--;
    3156:	53cc                	lw	a1,36(a5)
    3158:	15fd                	addi	a1,a1,-1
    315a:	d3cc                	sw	a1,36(a5)
        while (spi_priv->transfer_num) {
    315c:	53c8                	lw	a0,36(a5)
    315e:	f56d                	bnez	a0,3148 <wj_usi_spi_irqhandler+0x144>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    3160:	578c                	lw	a1,40(a5)
    3162:	47c1                	li	a5,16
    3164:	00b7f363          	bgeu	a5,a1,316a <wj_usi_spi_irqhandler+0x166>
    3168:	45c1                	li	a1,16
    316a:	04c00793          	li	a5,76
    316e:	02f707b3          	mul	a5,a4,a5
    3172:	97a2                	add	a5,a5,s0
    3174:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    3176:	06b51163          	bne	a0,a1,31d8 <wj_usi_spi_irqhandler+0x1d4>
    if (spi_priv->clk_num == 0) {
    317a:	04c00793          	li	a5,76
    317e:	02f707b3          	mul	a5,a4,a5
    3182:	97a2                	add	a5,a5,s0
    3184:	578c                	lw	a1,40(a5)
    3186:	eda5                	bnez	a1,31fe <wj_usi_spi_irqhandler+0x1fa>
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    3188:	4a2c                	lw	a1,80(a2)
    318a:	c63a                	sw	a4,12(sp)
    318c:	c432                	sw	a2,8(sp)
    318e:	99f5                	andi	a1,a1,-3
    3190:	ca2c                	sw	a1,80(a2)
        spi_priv->status.busy = 0U;
    3192:	0387c583          	lbu	a1,56(a5)
        spi_priv->send_num = 0;
    3196:	0007a823          	sw	zero,16(a5)
    319a:	c23e                	sw	a5,4(sp)
        spi_priv->status.busy = 0U;
    319c:	99f9                	andi	a1,a1,-2
    319e:	02b78c23          	sb	a1,56(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    31a2:	03434503          	lbu	a0,52(t1)
    31a6:	4581                	li	a1,0
    31a8:	353d                	jal	2fd6 <wj_spi_ss_control.isra.0>
        addr->USI_EN = 0x0;
    31aa:	4622                	lw	a2,8(sp)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    31ac:	4792                	lw	a5,4(sp)
        addr->USI_EN = 0xf;
    31ae:	45bd                	li	a1,15
        addr->USI_EN = 0x0;
    31b0:	00062023          	sw	zero,0(a2)
        addr->USI_EN = 0xf;
    31b4:	c20c                	sw	a1,0(a2)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    31b6:	5b8c                	lw	a1,48(a5)
    31b8:	47d0                	lw	a2,12(a5)
    31ba:	4732                	lw	a4,12(sp)
    31bc:	ed95                	bnez	a1,31f8 <wj_usi_spi_irqhandler+0x1f4>
            if (spi_priv->cb_event) {
    31be:	04060063          	beqz	a2,31fe <wj_usi_spi_irqhandler+0x1fa>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    31c2:	43a8                	lw	a0,64(a5)
    31c4:	9602                	jalr	a2
        wj_spi_intr_tx_empty(spi_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    31c6:	4789                	li	a5,2
    31c8:	d0bc                	sw	a5,96(s1)
    }

    addr->USI_INTR_CLR = intr_state;
    31ca:	4782                	lw	a5,0(sp)
}
    31cc:	40f2                	lw	ra,28(sp)
    31ce:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    31d0:	d0bc                	sw	a5,96(s1)
}
    31d2:	44d2                	lw	s1,20(sp)
    31d4:	6105                	addi	sp,sp,32
    31d6:	8082                	ret
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31d8:	0187a283          	lw	t0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31dc:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31de:	0002c383          	lbu	t2,0(t0) # 233e <memset+0x92>
            spi_priv->send_buf++;
    31e2:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31e4:	00762423          	sw	t2,8(a2)
            spi_priv->send_buf++;
    31e8:	0057ac23          	sw	t0,24(a5)
            spi_priv->send_num--;
    31ec:	0107a283          	lw	t0,16(a5)
    31f0:	12fd                	addi	t0,t0,-1
    31f2:	0057a823          	sw	t0,16(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31f6:	b741                	j	3176 <wj_usi_spi_irqhandler+0x172>
            if (spi_priv->cb_event) {
    31f8:	c219                	beqz	a2,31fe <wj_usi_spi_irqhandler+0x1fa>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    31fa:	4585                	li	a1,1
    31fc:	b7d9                	j	31c2 <wj_usi_spi_irqhandler+0x1be>
    spi_priv->clk_num -= spi_priv->transfer_num;
    31fe:	04c00513          	li	a0,76
    3202:	02a70733          	mul	a4,a4,a0
    3206:	943a                	add	s0,s0,a4
    3208:	541c                	lw	a5,40(s0)
    320a:	5058                	lw	a4,36(s0)
    320c:	8f99                	sub	a5,a5,a4
    320e:	d41c                	sw	a5,40(s0)
    3210:	bf5d                	j	31c6 <wj_usi_spi_irqhandler+0x1c2>

00003212 <ck_usart_intr_recv_data>:
  \brief        interrupt service function for receiver data available.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_data(wj_usi_usart_priv_t *usart_priv)
{
    if ((usart_priv->rx_total_num == 0) || (usart_priv->rx_buf == NULL)) {
    3212:	4558                	lw	a4,12(a0)
    3214:	c319                	beqz	a4,321a <ck_usart_intr_recv_data+0x8>
    3216:	495c                	lw	a5,20(a0)
    3218:	e789                	bnez	a5,3222 <ck_usart_intr_recv_data+0x10>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    321a:	451c                	lw	a5,8(a0)
    321c:	45b9                	li	a1,14
        usart_priv->rx_buf = NULL;
        usart_priv->rx_busy = 0;
        usart_priv->rx_total_num = 0;

        if (usart_priv->cb_event) {
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    321e:	5948                	lw	a0,52(a0)
    3220:	8782                	jr	a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3222:	4110                	lw	a2,0(a0)
    uint32_t rxfifo_num = (addr->USI_FIFO_STA >> 16) & 0xf;
    3224:	465c                	lw	a5,12(a2)
    3226:	83c1                	srli	a5,a5,0x10
    3228:	8bbd                	andi	a5,a5,15
    uint32_t rxdata_num = (rxfifo_num > usart_priv->rx_total_num) ? usart_priv->rx_total_num : rxfifo_num;
    322a:	00f77363          	bgeu	a4,a5,3230 <ck_usart_intr_recv_data+0x1e>
    322e:	87ba                	mv	a5,a4
    for (i = 0; i < rxdata_num; i++) {
    3230:	4701                	li	a4,0
    3232:	02f71363          	bne	a4,a5,3258 <ck_usart_intr_recv_data+0x46>
    if (usart_priv->rx_cnt >= usart_priv->rx_total_num) {
    3236:	4d58                	lw	a4,28(a0)
    3238:	455c                	lw	a5,12(a0)
    323a:	02f76b63          	bltu	a4,a5,3270 <ck_usart_intr_recv_data+0x5e>
        usart_priv->last_rx_num = usart_priv->rx_total_num;
    323e:	d91c                	sw	a5,48(a0)
        if (usart_priv->cb_event) {
    3240:	451c                	lw	a5,8(a0)
        usart_priv->rx_cnt = 0;
    3242:	00052e23          	sw	zero,28(a0)
        usart_priv->rx_buf = NULL;
    3246:	00052a23          	sw	zero,20(a0)
        usart_priv->rx_busy = 0;
    324a:	02052423          	sw	zero,40(a0)
        usart_priv->rx_total_num = 0;
    324e:	00052623          	sw	zero,12(a0)
        if (usart_priv->cb_event) {
    3252:	cf99                	beqz	a5,3270 <ck_usart_intr_recv_data+0x5e>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    3254:	4585                	li	a1,1
    3256:	b7e1                	j	321e <ck_usart_intr_recv_data+0xc>
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    3258:	460c                	lw	a1,8(a2)
    325a:	4954                	lw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    325c:	0705                	addi	a4,a4,1
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    325e:	00b68023          	sb	a1,0(a3)
        usart_priv->rx_cnt++;
    3262:	4d54                	lw	a3,28(a0)
    3264:	0685                	addi	a3,a3,1
    3266:	cd54                	sw	a3,28(a0)
        usart_priv->rx_buf++;
    3268:	4954                	lw	a3,20(a0)
    326a:	0685                	addi	a3,a3,1
    326c:	c954                	sw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    326e:	b7d1                	j	3232 <ck_usart_intr_recv_data+0x20>
        }
    }
}
    3270:	8082                	ret

00003272 <drv_usi_usart_config_baudrate>:
{
    3272:	1151                	addi	sp,sp,-12
    3274:	c222                	sw	s0,4(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3276:	4100                	lw	s0,0(a0)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3278:	5948                	lw	a0,52(a0)
{
    327a:	c026                	sw	s1,0(sp)
    327c:	c406                	sw	ra,8(sp)
    addr->USI_EN = 0x0;
    327e:	00042023          	sw	zero,0(s0)
{
    3282:	84ae                	mv	s1,a1
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3284:	28d000ef          	jal	ra,3d10 <drv_get_usi_freq>
    3288:	4729                	li	a4,10
    328a:	02e50533          	mul	a0,a0,a4
    328e:	029555b3          	divu	a1,a0,s1
    3292:	8191                	srli	a1,a1,0x4
        divisor = (divisor / 10);
    3294:	02e5d7b3          	divu	a5,a1,a4
    if ((divisor % 10) >= 5) {
    3298:	02e5f5b3          	remu	a1,a1,a4
    329c:	4711                	li	a4,4
    329e:	00b76363          	bltu	a4,a1,32a4 <drv_usi_usart_config_baudrate+0x32>
        divisor = divisor / 10 - 1;
    32a2:	17fd                	addi	a5,a5,-1
    addr->USI_CLK_DIV0 = divisor;
    32a4:	c81c                	sw	a5,16(s0)
    addr->USI_EN = 0xf;
    32a6:	47bd                	li	a5,15
}
    32a8:	40a2                	lw	ra,8(sp)
    addr->USI_EN = 0xf;
    32aa:	c01c                	sw	a5,0(s0)
}
    32ac:	4412                	lw	s0,4(sp)
    32ae:	4482                	lw	s1,0(sp)
    32b0:	4501                	li	a0,0
    32b2:	0131                	addi	sp,sp,12
    32b4:	8082                	ret

000032b6 <drv_usi_usart_config_mode>:
    USART_NULL_PARAM_CHK(handle);
    32b6:	cd11                	beqz	a0,32d2 <drv_usi_usart_config_mode+0x1c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    32b8:	411c                	lw	a5,0(a0)
        addr->USI_EN = 0xf;
    32ba:	473d                	li	a4,15
    addr->USI_EN = 0x0;
    32bc:	0007a023          	sw	zero,0(a5)
        addr->USI_EN = 0xf;
    32c0:	c398                	sw	a4,0(a5)
    if (mode == USART_MODE_ASYNCHRONOUS) {
    32c2:	e199                	bnez	a1,32c8 <drv_usi_usart_config_mode+0x12>
        return 0;
    32c4:	4501                	li	a0,0
    32c6:	8082                	ret
    return ERR_USART(USART_ERROR_MODE);
    32c8:	81020537          	lui	a0,0x81020
    32cc:	08650513          	addi	a0,a0,134 # 81020086 <__heap_end+0x60ff0086>
    32d0:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    32d2:	81020537          	lui	a0,0x81020
    32d6:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    32da:	8082                	ret

000032dc <drv_usi_usart_config_parity>:
    USART_NULL_PARAM_CHK(handle);
    32dc:	c539                	beqz	a0,332a <drv_usi_usart_config_parity+0x4e>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    32de:	411c                	lw	a5,0(a0)
    switch (parity) {
    32e0:	4705                	li	a4,1
    addr->USI_EN = 0x0;
    32e2:	0007a023          	sw	zero,0(a5)
    switch (parity) {
    32e6:	02e58763          	beq	a1,a4,3314 <drv_usi_usart_config_parity+0x38>
    32ea:	4709                	li	a4,2
    32ec:	00e58b63          	beq	a1,a4,3302 <drv_usi_usart_config_parity+0x26>
    32f0:	04059263          	bnez	a1,3334 <drv_usi_usart_config_parity+0x58>
            addr->USI_UART_CTRL &= ~CTRL_PARITY_ENABLE;
    32f4:	4f98                	lw	a4,24(a5)
    32f6:	9b3d                	andi	a4,a4,-17
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    32f8:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    32fa:	473d                	li	a4,15
    32fc:	c398                	sw	a4,0(a5)
    return 0;
    32fe:	4501                	li	a0,0
    3300:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    3302:	4f98                	lw	a4,24(a5)
    3304:	8b3d                	andi	a4,a4,15
    3306:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    3308:	4f98                	lw	a4,24(a5)
    330a:	01076713          	ori	a4,a4,16
    330e:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ODD;
    3310:	4f98                	lw	a4,24(a5)
    3312:	b7dd                	j	32f8 <drv_usi_usart_config_parity+0x1c>
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    3314:	4f98                	lw	a4,24(a5)
    3316:	8b3d                	andi	a4,a4,15
    3318:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    331a:	4f98                	lw	a4,24(a5)
    331c:	01076713          	ori	a4,a4,16
    3320:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    3322:	4f98                	lw	a4,24(a5)
    3324:	02076713          	ori	a4,a4,32
    3328:	bfc1                	j	32f8 <drv_usi_usart_config_parity+0x1c>
    USART_NULL_PARAM_CHK(handle);
    332a:	81020537          	lui	a0,0x81020
    332e:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
    3332:	8082                	ret
    switch (parity) {
    3334:	81020537          	lui	a0,0x81020
    3338:	08950513          	addi	a0,a0,137 # 81020089 <__heap_end+0x60ff0089>
}
    333c:	8082                	ret

0000333e <drv_usi_usart_config_stopbits>:
    USART_NULL_PARAM_CHK(handle);
    333e:	c531                	beqz	a0,338a <drv_usi_usart_config_stopbits+0x4c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3340:	411c                	lw	a5,0(a0)
    switch (stopbit) {
    3342:	4705                	li	a4,1
    addr->USI_EN = 0x0;
    3344:	0007a023          	sw	zero,0(a5)
    switch (stopbit) {
    3348:	02e58963          	beq	a1,a4,337a <drv_usi_usart_config_stopbits+0x3c>
    334c:	4709                	li	a4,2
    334e:	00e58e63          	beq	a1,a4,336a <drv_usi_usart_config_stopbits+0x2c>
    3352:	04059163          	bnez	a1,3394 <drv_usi_usart_config_stopbits+0x56>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3356:	4f98                	lw	a4,24(a5)
    3358:	03377713          	andi	a4,a4,51
    335c:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1;
    335e:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3360:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    3362:	473d                	li	a4,15
    3364:	c398                	sw	a4,0(a5)
    return 0;
    3366:	4501                	li	a0,0
    3368:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    336a:	4f98                	lw	a4,24(a5)
    336c:	03377713          	andi	a4,a4,51
    3370:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1_5;
    3372:	4f98                	lw	a4,24(a5)
    3374:	00476713          	ori	a4,a4,4
    3378:	b7e5                	j	3360 <drv_usi_usart_config_stopbits+0x22>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    337a:	4f98                	lw	a4,24(a5)
    337c:	03377713          	andi	a4,a4,51
    3380:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3382:	4f98                	lw	a4,24(a5)
    3384:	00876713          	ori	a4,a4,8
    3388:	bfe1                	j	3360 <drv_usi_usart_config_stopbits+0x22>
    USART_NULL_PARAM_CHK(handle);
    338a:	81020537          	lui	a0,0x81020
    338e:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
    3392:	8082                	ret
    switch (stopbit) {
    3394:	81020537          	lui	a0,0x81020
    3398:	08a50513          	addi	a0,a0,138 # 8102008a <__heap_end+0x60ff008a>
}
    339c:	8082                	ret

0000339e <drv_usi_usart_config_databits>:
    USART_NULL_PARAM_CHK(handle);
    339e:	c52d                	beqz	a0,3408 <drv_usi_usart_config_databits+0x6a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    33a0:	411c                	lw	a5,0(a0)
    switch (databits) {
    33a2:	4709                	li	a4,2
    addr->USI_EN = 0x0;
    33a4:	0007a023          	sw	zero,0(a5)
    switch (databits) {
    33a8:	04e58063          	beq	a1,a4,33e8 <drv_usi_usart_config_databits+0x4a>
    33ac:	00b76e63          	bltu	a4,a1,33c8 <drv_usi_usart_config_databits+0x2a>
    33b0:	02059463          	bnez	a1,33d8 <drv_usi_usart_config_databits+0x3a>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33b4:	4f98                	lw	a4,24(a5)
    33b6:	03c77713          	andi	a4,a4,60
    33ba:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_5;
    33bc:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    33be:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    33c0:	473d                	li	a4,15
    33c2:	c398                	sw	a4,0(a5)
    return 0;
    33c4:	4501                	li	a0,0
    33c6:	8082                	ret
    switch (databits) {
    33c8:	470d                	li	a4,3
    33ca:	02e58763          	beq	a1,a4,33f8 <drv_usi_usart_config_databits+0x5a>
    33ce:	81020537          	lui	a0,0x81020
    33d2:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60ff0088>
    33d6:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33d8:	4f98                	lw	a4,24(a5)
    33da:	03c77713          	andi	a4,a4,60
    33de:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_6;
    33e0:	4f98                	lw	a4,24(a5)
    33e2:	00176713          	ori	a4,a4,1
    33e6:	bfe1                	j	33be <drv_usi_usart_config_databits+0x20>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33e8:	4f98                	lw	a4,24(a5)
    33ea:	03c77713          	andi	a4,a4,60
    33ee:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_7;
    33f0:	4f98                	lw	a4,24(a5)
    33f2:	00276713          	ori	a4,a4,2
    33f6:	b7e1                	j	33be <drv_usi_usart_config_databits+0x20>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33f8:	4f98                	lw	a4,24(a5)
    33fa:	03c77713          	andi	a4,a4,60
    33fe:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    3400:	4f98                	lw	a4,24(a5)
    3402:	00376713          	ori	a4,a4,3
    3406:	bf65                	j	33be <drv_usi_usart_config_databits+0x20>
    USART_NULL_PARAM_CHK(handle);
    3408:	81020537          	lui	a0,0x81020
    340c:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3410:	8082                	ret

00003412 <wj_usi_usart_irqhandler>:
    }
}

void wj_usi_usart_irqhandler(int idx)
{
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3412:	03800793          	li	a5,56
    3416:	02f507b3          	mul	a5,a0,a5
    341a:	200026b7          	lui	a3,0x20002
    341e:	8f468713          	addi	a4,a3,-1804 # 200018f4 <usi_usart_instance>
{
    3422:	1101                	addi	sp,sp,-32
    3424:	ca26                	sw	s1,20(sp)
    3426:	8f468693          	addi	a3,a3,-1804
    342a:	cc22                	sw	s0,24(sp)
    342c:	ce06                	sw	ra,28(sp)
    342e:	c036                	sw	a3,0(sp)
    3430:	842a                	mv	s0,a0
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3432:	97ba                	add	a5,a5,a4
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3434:	4398                	lw	a4,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    3436:	4b64                	lw	s1,84(a4)
    3438:	00e49613          	slli	a2,s1,0xe
    343c:	8239                	srli	a2,a2,0xe
    343e:	c232                	sw	a2,4(sp)

    if (intr_state & USI_INT_TX_EMPTY) {
    3440:	0024f613          	andi	a2,s1,2
    3444:	c229                	beqz	a2,3486 <wj_usi_usart_irqhandler+0x74>
    if (usart_priv->tx_total_num == 0) {
    3446:	4b94                	lw	a3,16(a5)
    3448:	ce8d                	beqz	a3,3482 <wj_usi_usart_irqhandler+0x70>
    if (usart_priv->tx_cnt >= usart_priv->tx_total_num) {
    344a:	5390                	lw	a2,32(a5)
    344c:	0cd66363          	bltu	a2,a3,3512 <wj_usi_usart_irqhandler+0x100>
        addr->USI_INTR_EN &= (~USI_INT_TX_EMPTY);
    3450:	4b30                	lw	a2,80(a4)
    3452:	9a75                	andi	a2,a2,-3
    3454:	cb30                	sw	a2,80(a4)
        addr->USI_INTR_EN |= USI_INT_UART_STOP;
    3456:	4b30                	lw	a2,80(a4)
    3458:	40066613          	ori	a2,a2,1024
    345c:	cb30                	sw	a2,80(a4)
        usart_priv->last_tx_num = usart_priv->tx_total_num;
    345e:	d7d4                	sw	a3,44(a5)
        if (usart_priv->cb_event) {
    3460:	4794                	lw	a3,8(a5)
        usart_priv->tx_cnt = 0;
    3462:	0207a023          	sw	zero,32(a5)
        usart_priv->tx_busy = 0;
    3466:	0207a223          	sw	zero,36(a5)
        usart_priv->tx_buf = NULL;
    346a:	0007ac23          	sw	zero,24(a5)
        usart_priv->tx_total_num = 0;
    346e:	0007a823          	sw	zero,16(a5)
        if (usart_priv->cb_event) {
    3472:	ca81                	beqz	a3,3482 <wj_usi_usart_irqhandler+0x70>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_SEND_COMPLETE);
    3474:	5bc8                	lw	a0,52(a5)
    3476:	4581                	li	a1,0
    3478:	c63a                	sw	a4,12(sp)
    347a:	c43e                	sw	a5,8(sp)
    347c:	9682                	jalr	a3
    347e:	47a2                	lw	a5,8(sp)
    3480:	4732                	lw	a4,12(sp)
        ck_usart_intr_threshold_empty(usart_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    3482:	4689                	li	a3,2
    3484:	d334                	sw	a3,96(a4)
    }

    if (intr_state & USI_INT_RX_THOLD) {
    3486:	0204f693          	andi	a3,s1,32
    348a:	ca91                	beqz	a3,349e <wj_usi_usart_irqhandler+0x8c>
        ck_usart_intr_recv_data(usart_priv);
    348c:	853e                	mv	a0,a5
    348e:	c63a                	sw	a4,12(sp)
    3490:	c43e                	sw	a5,8(sp)
    3492:	3341                	jal	3212 <ck_usart_intr_recv_data>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    3494:	4732                	lw	a4,12(sp)
    3496:	47a2                	lw	a5,8(sp)
    3498:	02000693          	li	a3,32
    349c:	d334                	sw	a3,96(a4)
    }

    if (intr_state & USI_INT_UART_STOP) {
    349e:	4004f693          	andi	a3,s1,1024
    34a2:	c695                	beqz	a3,34ce <wj_usi_usart_irqhandler+0xbc>
        if (USI_FIFO_STA_RX_NUM(addr) > 0) {
    34a4:	4754                	lw	a3,12(a4)
    34a6:	82c1                	srli	a3,a3,0x10
    34a8:	8afd                	andi	a3,a3,31
    34aa:	ce99                	beqz	a3,34c8 <wj_usi_usart_irqhandler+0xb6>
    if ((usart_priv->rx_total_num != 0) && (usart_priv->rx_buf != NULL)) {
    34ac:	03800693          	li	a3,56
    34b0:	02d406b3          	mul	a3,s0,a3
    34b4:	4602                	lw	a2,0(sp)
    34b6:	96b2                	add	a3,a3,a2
    34b8:	46d0                	lw	a2,12(a3)
    34ba:	ce51                	beqz	a2,3556 <wj_usi_usart_irqhandler+0x144>
    34bc:	4ad4                	lw	a3,20(a3)
    34be:	cec1                	beqz	a3,3556 <wj_usi_usart_irqhandler+0x144>
        ck_usart_intr_recv_data(usart_priv);
    34c0:	853e                	mv	a0,a5
    34c2:	c43a                	sw	a4,8(sp)
    34c4:	33b9                	jal	3212 <ck_usart_intr_recv_data>
        return;
    34c6:	4722                	lw	a4,8(sp)
            ck_usart_intr_char_timeout(usart_priv);     //receive small data
        }

        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    34c8:	02000793          	li	a5,32
    34cc:	d33c                	sw	a5,96(a4)
    }

    if (intr_state & USI_INT_UART_PERR) {
    34ce:	80ad                	srli	s1,s1,0xb
    34d0:	8885                	andi	s1,s1,1
    34d2:	c88d                	beqz	s1,3504 <wj_usi_usart_irqhandler+0xf2>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    34d4:	03800513          	li	a0,56
    34d8:	02a40433          	mul	s0,s0,a0
    34dc:	4782                	lw	a5,0(sp)
    34de:	943e                	add	s0,s0,a5
    34e0:	401c                	lw	a5,0(s0)
    addr->USI_EN &= ~USI_RX_FIFO_EN;
    34e2:	4394                	lw	a3,0(a5)
    34e4:	9add                	andi	a3,a3,-9
    34e6:	c394                	sw	a3,0(a5)
    addr->USI_EN |= USI_RX_FIFO_EN;
    34e8:	4394                	lw	a3,0(a5)
    34ea:	0086e693          	ori	a3,a3,8
    34ee:	c394                	sw	a3,0(a5)
    if (usart_priv->cb_event) {
    34f0:	441c                	lw	a5,8(s0)
    34f2:	c791                	beqz	a5,34fe <wj_usi_usart_irqhandler+0xec>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RX_PARITY_ERROR);
    34f4:	5848                	lw	a0,52(s0)
    34f6:	45a5                	li	a1,9
    34f8:	c03a                	sw	a4,0(sp)
    34fa:	9782                	jalr	a5
    34fc:	4702                	lw	a4,0(sp)
        ck_usart_intr_recv_line(usart_priv);
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    34fe:	02000793          	li	a5,32
    3502:	d33c                	sw	a5,96(a4)
    }

    addr->USI_INTR_CLR = intr_state;
    3504:	4792                	lw	a5,4(sp)
}
    3506:	40f2                	lw	ra,28(sp)
    3508:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    350a:	d33c                	sw	a5,96(a4)
}
    350c:	44d2                	lw	s1,20(sp)
    350e:	6105                	addi	sp,sp,32
    3510:	8082                	ret
        uint32_t remain_txdata  = usart_priv->tx_total_num - usart_priv->tx_cnt;
    3512:	538c                	lw	a1,32(a5)
    3514:	40b685b3          	sub	a1,a3,a1
        uint32_t txdata_num = (remain_txdata > (USI_TX_MAX_FIFO - 1)) ? (USI_TX_MAX_FIFO - 1) : remain_txdata;
    3518:	46bd                	li	a3,15
    351a:	00b6f363          	bgeu	a3,a1,3520 <wj_usi_usart_irqhandler+0x10e>
    351e:	45bd                	li	a1,15
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3520:	03800693          	li	a3,56
    3524:	02d406b3          	mul	a3,s0,a3
    3528:	4602                	lw	a2,0(sp)
        volatile uint32_t i = 0u;
    352a:	c802                	sw	zero,16(sp)
        for (i = 0; i < txdata_num; i++) {
    352c:	c802                	sw	zero,16(sp)
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    352e:	96b2                	add	a3,a3,a2
        for (i = 0; i < txdata_num; i++) {
    3530:	4642                	lw	a2,16(sp)
    3532:	00b66563          	bltu	a2,a1,353c <wj_usi_usart_irqhandler+0x12a>
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    3536:	4689                	li	a3,2
    3538:	d334                	sw	a3,96(a4)
    353a:	b7a1                	j	3482 <wj_usi_usart_irqhandler+0x70>
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    353c:	4e90                	lw	a2,24(a3)
    353e:	00064503          	lbu	a0,0(a2)
            usart_priv->tx_buf++;
    3542:	0605                	addi	a2,a2,1
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3544:	c708                	sw	a0,8(a4)
            usart_priv->tx_cnt++;
    3546:	5288                	lw	a0,32(a3)
            usart_priv->tx_buf++;
    3548:	ce90                	sw	a2,24(a3)
            usart_priv->tx_cnt++;
    354a:	0505                	addi	a0,a0,1
    354c:	d288                	sw	a0,32(a3)
        for (i = 0; i < txdata_num; i++) {
    354e:	4642                	lw	a2,16(sp)
    3550:	0605                	addi	a2,a2,1
    3552:	c832                	sw	a2,16(sp)
    3554:	bff1                	j	3530 <wj_usi_usart_irqhandler+0x11e>
    if (usart_priv->cb_event) {
    3556:	03800793          	li	a5,56
    355a:	02f407b3          	mul	a5,s0,a5
    355e:	4682                	lw	a3,0(sp)
    3560:	97b6                	add	a5,a5,a3
    3562:	4794                	lw	a3,8(a5)
    3564:	c691                	beqz	a3,3570 <wj_usi_usart_irqhandler+0x15e>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    3566:	5bc8                	lw	a0,52(a5)
    3568:	45b9                	li	a1,14
    356a:	c43a                	sw	a4,8(sp)
    356c:	9682                	jalr	a3
    356e:	bfa1                	j	34c6 <wj_usi_usart_irqhandler+0xb4>
        wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3570:	439c                	lw	a5,0(a5)
        addr->USI_EN &= ~USI_RX_FIFO_EN;
    3572:	4394                	lw	a3,0(a5)
    3574:	9add                	andi	a3,a3,-9
    3576:	c394                	sw	a3,0(a5)
        addr->USI_EN |= USI_RX_FIFO_EN;
    3578:	4394                	lw	a3,0(a5)
    357a:	0086e693          	ori	a3,a3,8
    357e:	c394                	sw	a3,0(a5)
    3580:	b7a1                	j	34c8 <wj_usi_usart_irqhandler+0xb6>

00003582 <drv_usi_usart_putchar>:
  \return      error code
*/
int32_t drv_usi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3582:	4118                	lw	a4,0(a0)
    //addr->USI_EN = 0xb;
    //addr->USI_EN = 0xf;
    addr->USI_TX_RX_FIFO = ch;
    3584:	c70c                	sw	a1,8(a4)

    while (!(addr->USI_FIFO_STA & 0x1));
    3586:	475c                	lw	a5,12(a4)
    3588:	8b85                	andi	a5,a5,1
    358a:	dff5                	beqz	a5,3586 <drv_usi_usart_putchar+0x4>

    return 0;
}
    358c:	4501                	li	a0,0
    358e:	8082                	ret

00003590 <drv_usi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event event call back function \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t drv_usi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    3590:	1111                	addi	sp,sp,-28
    3592:	c02e                	sw	a1,0(sp)
    //initialize instace
    uint32_t base;
    uint32_t irq;
    void *handler;

    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    3594:	0074                	addi	a3,sp,12
    3596:	0030                	addi	a2,sp,8
    3598:	004c                	addi	a1,sp,4
{
    359a:	c826                	sw	s1,16(sp)
    359c:	cc06                	sw	ra,24(sp)
    359e:	ca22                	sw	s0,20(sp)
    35a0:	84aa                	mv	s1,a0
    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    35a2:	2269                	jal	372c <target_usi_usart_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    35a4:	4709                	li	a4,2
    35a6:	00a77963          	bgeu	a4,a0,35b8 <drv_usi_usart_initialize+0x28>
        return NULL;
    35aa:	4401                	li	s0,0
    addr->USI_MODE_SEL = USI_MODE_UART;
    drv_irq_register(usart_priv->irq, handler);
    drv_irq_enable(usart_priv->irq);

    return usart_priv;
}
    35ac:	40e2                	lw	ra,24(sp)
    35ae:	8522                	mv	a0,s0
    35b0:	4452                	lw	s0,20(sp)
    35b2:	44c2                	lw	s1,16(sp)
    35b4:	0171                	addi	sp,sp,28
    35b6:	8082                	ret
    ret = drv_usi_initialize(idx);
    35b8:	8526                	mv	a0,s1
    35ba:	f50ff0ef          	jal	ra,2d0a <drv_usi_initialize>
    if (ret < 0) {
    35be:	fe0546e3          	bltz	a0,35aa <drv_usi_usart_initialize+0x1a>
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35c2:	03800413          	li	s0,56
    35c6:	02848733          	mul	a4,s1,s0
    usart_priv->irq = irq;
    35ca:	47a2                	lw	a5,8(sp)
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35cc:	20002437          	lui	s0,0x20002
    35d0:	8f440413          	addi	s0,s0,-1804 # 200018f4 <usi_usart_instance>
    usart_priv->base = base;
    35d4:	4512                	lw	a0,4(sp)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    35d6:	45c1                	li	a1,16
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35d8:	943a                	add	s0,s0,a4
    usart_priv->irq = irq;
    35da:	c05c                	sw	a5,4(s0)
    usart_priv->cb_event = cb_event;
    35dc:	4782                	lw	a5,0(sp)
    usart_priv->base = base;
    35de:	c008                	sw	a0,0(s0)
    usart_priv->idx = idx;
    35e0:	d844                	sw	s1,52(s0)
    usart_priv->cb_event = cb_event;
    35e2:	c41c                	sw	a5,8(s0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    35e4:	6785                	lui	a5,0x1
    35e6:	f9878793          	addi	a5,a5,-104 # f98 <__divdf3+0xee>
    addr->USI_EN = 0x0;
    35ea:	00052023          	sw	zero,0(a0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    35ee:	cd7c                	sw	a5,92(a0)
    addr->USI_INTR_EN = WJ_UART_INT_ENABLE_DEFAUL;
    35f0:	c93c                	sw	a5,80(a0)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    35f2:	c02a                	sw	a0,0(sp)
    35f4:	e9cff0ef          	jal	ra,2c90 <wj_usi_set_rxfifo_th>
    addr->USI_MODE_SEL = USI_MODE_UART;
    35f8:	4502                	lw	a0,0(sp)
    drv_irq_register(usart_priv->irq, handler);
    35fa:	45b2                	lw	a1,12(sp)
    addr->USI_MODE_SEL = USI_MODE_UART;
    35fc:	00052223          	sw	zero,4(a0)
    drv_irq_register(usart_priv->irq, handler);
    3600:	4048                	lw	a0,4(s0)
    3602:	e7eff0ef          	jal	ra,2c80 <drv_irq_register>
    drv_irq_enable(usart_priv->irq);
    3606:	4048                	lw	a0,4(s0)
    3608:	e5cff0ef          	jal	ra,2c64 <drv_irq_enable>
    return usart_priv;
    360c:	b745                	j	35ac <drv_usi_usart_initialize+0x1c>

0000360e <drv_usi_usart_config>:
                             uint32_t baud,
                             usart_mode_e mode,
                             usart_parity_e parity,
                             usart_stop_bits_e stopbits,
                             usart_data_bits_e bits)
{
    360e:	1111                	addi	sp,sp,-28
    3610:	c826                	sw	s1,16(sp)
    int32_t ret;
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3612:	4104                	lw	s1,0(a0)
{
    3614:	ca22                	sw	s0,20(sp)
    3616:	cc06                	sw	ra,24(sp)

    addr->USI_EN = 0x0;
    3618:	0004a023          	sw	zero,0(s1)
{
    361c:	842a                	mv	s0,a0
    361e:	c032                	sw	a2,0(sp)
    3620:	c636                	sw	a3,12(sp)
    3622:	c23a                	sw	a4,4(sp)
    3624:	c43e                	sw	a5,8(sp)
    /* control the data_bit of the usart*/
    ret = drv_usi_usart_config_baudrate(handle, baud);
    3626:	31b1                	jal	3272 <drv_usi_usart_config_baudrate>

    if (ret < 0) {
    3628:	02054a63          	bltz	a0,365c <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control the parity of the usart*/
    ret = drv_usi_usart_config_parity(handle, parity);
    362c:	46b2                	lw	a3,12(sp)
    362e:	8522                	mv	a0,s0
    3630:	85b6                	mv	a1,a3
    3632:	316d                	jal	32dc <drv_usi_usart_config_parity>

    if (ret < 0) {
    3634:	02054463          	bltz	a0,365c <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control mode of the usart*/
    ret = drv_usi_usart_config_mode(handle, mode);
    3638:	4582                	lw	a1,0(sp)
    363a:	8522                	mv	a0,s0
    363c:	39ad                	jal	32b6 <drv_usi_usart_config_mode>

    if (ret < 0) {
    363e:	00054f63          	bltz	a0,365c <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control the stopbit of the usart*/
    ret = drv_usi_usart_config_stopbits(handle, stopbits);
    3642:	4592                	lw	a1,4(sp)
    3644:	8522                	mv	a0,s0
    3646:	39e5                	jal	333e <drv_usi_usart_config_stopbits>

    if (ret < 0) {
    3648:	00054a63          	bltz	a0,365c <drv_usi_usart_config+0x4e>
        return ret;
    }

    ret = drv_usi_usart_config_databits(handle, bits);
    364c:	45a2                	lw	a1,8(sp)
    364e:	8522                	mv	a0,s0
    3650:	33b9                	jal	339e <drv_usi_usart_config_databits>

    if (ret < 0) {
    3652:	00054563          	bltz	a0,365c <drv_usi_usart_config+0x4e>
        return ret;
    }

    addr->USI_EN = 0xf;
    3656:	47bd                	li	a5,15
    3658:	c09c                	sw	a5,0(s1)
    return 0;
    365a:	4501                	li	a0,0
}
    365c:	40e2                	lw	ra,24(sp)
    365e:	4452                	lw	s0,20(sp)
    3660:	44c2                	lw	s1,16(sp)
    3662:	0171                	addi	sp,sp,28
    3664:	8082                	ret

00003666 <csi_usart_putchar>:
  \param[in]   ch  the input character
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    return drv_usi_usart_putchar(handle, ch);
    3666:	bf31                	j	3582 <drv_usi_usart_putchar>

00003668 <csi_usart_initialize>:
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    return drv_usi_usart_initialize(idx, cb_event);
    3668:	b725                	j	3590 <drv_usi_usart_initialize>

0000366a <csi_usart_config>:
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    return drv_usi_usart_config(handle, baud, mode, parity, stopbits, bits);
    366a:	b755                	j	360e <drv_usi_usart_config>

0000366c <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_timer_count()) {
    366c:	47bd                	li	a5,15
    366e:	04a7c263          	blt	a5,a0,36b2 <target_get_timer+0x46>
        return -1;
    }

    if (base != NULL) {
    3672:	00058b63          	beqz	a1,3688 <target_get_timer+0x1c>
        *base = sg_timer_config[idx].base;
    3676:	47b1                	li	a5,12
    3678:	02f50733          	mul	a4,a0,a5
    367c:	679d                	lui	a5,0x7
    367e:	6c878793          	addi	a5,a5,1736 # 76c8 <sg_timer_config>
    3682:	97ba                	add	a5,a5,a4
    3684:	439c                	lw	a5,0(a5)
    3686:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3688:	ca11                	beqz	a2,369c <target_get_timer+0x30>
        *irq = sg_timer_config[idx].irq;
    368a:	47b1                	li	a5,12
    368c:	02f50733          	mul	a4,a0,a5
    3690:	679d                	lui	a5,0x7
    3692:	6c878793          	addi	a5,a5,1736 # 76c8 <sg_timer_config>
    3696:	97ba                	add	a5,a5,a4
    3698:	43dc                	lw	a5,4(a5)
    369a:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    369c:	ce81                	beqz	a3,36b4 <target_get_timer+0x48>
        *handler = sg_timer_config[idx].handler;
    369e:	47b1                	li	a5,12
    36a0:	02f50733          	mul	a4,a0,a5
    36a4:	679d                	lui	a5,0x7
    36a6:	6c878793          	addi	a5,a5,1736 # 76c8 <sg_timer_config>
    36aa:	97ba                	add	a5,a5,a4
    36ac:	479c                	lw	a5,8(a5)
    36ae:	c29c                	sw	a5,0(a3)
    36b0:	8082                	ret
        return -1;
    36b2:	557d                	li	a0,-1
    }

    return idx;
}
    36b4:	8082                	ret

000036b6 <target_gpio_port_init>:
    int32_t    gpio_pin;
    uint32_t cfg_idx;
} gpio_pin_map_t;

int32_t target_gpio_port_init(port_name_e port, uint32_t *base, uint32_t *irq, void **handler, uint32_t *pin_num)
{
    36b6:	87aa                	mv	a5,a0
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
        return -1;
    36b8:	557d                	li	a0,-1
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
    36ba:	c595                	beqz	a1,36e6 <target_gpio_port_init+0x30>
    36bc:	02060563          	beqz	a2,36e6 <target_gpio_port_init+0x30>
    36c0:	02068363          	beqz	a3,36e6 <target_gpio_port_init+0x30>
    36c4:	02070163          	beqz	a4,36e6 <target_gpio_port_init+0x30>
    }

    if (sg_gpio_config[0].port == port) {
    36c8:	00079f63          	bnez	a5,36e6 <target_gpio_port_init+0x30>
        if (base != NULL) {
            *base = sg_gpio_config[0].base;
    36cc:	600187b7          	lui	a5,0x60018
    36d0:	c19c                	sw	a5,0(a1)
        }

        if (irq != NULL) {
            *irq = sg_gpio_config[0].irq;
    36d2:	47c1                	li	a5,16
    36d4:	c21c                	sw	a5,0(a2)
        }

        if (pin_num != NULL) {
            *pin_num = sg_gpio_config[0].pin_num;
    36d6:	47fd                	li	a5,31
    36d8:	c31c                	sw	a5,0(a4)
        }

        if (handler != NULL) {
            *handler = (void *)GPIO0_IRQHandler;
    36da:	6791                	lui	a5,0x4
    36dc:	cac78793          	addi	a5,a5,-852 # 3cac <GPIO0_IRQHandler>
    36e0:	c29c                	sw	a5,0(a3)
        }

        return 0;
    36e2:	4501                	li	a0,0
    36e4:	8082                	ret
    }

    return -1;
}
    36e6:	8082                	ret

000036e8 <target_gpio_pin_init>:

int32_t target_gpio_pin_init(int32_t gpio_pin, uint32_t *port_idx)
{
    *port_idx = 0;
    36e8:	0005a023          	sw	zero,0(a1)

    if (gpio_pin >= PA0 && gpio_pin <= PA31) {
    36ec:	47fd                	li	a5,31
    36ee:	00a7f363          	bgeu	a5,a0,36f4 <target_gpio_pin_init+0xc>
        return gpio_pin;
    }

    return -1;
    36f2:	557d                	li	a0,-1
}
    36f4:	8082                	ret

000036f6 <target_usi_init>:
    {WJ_USI2_BASE, USI2_IRQn, USI2_IRQHandler},
};

int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_USI_NUM) {
    36f6:	4789                	li	a5,2
    36f8:	02a7c863          	blt	a5,a0,3728 <target_usi_init+0x32>
        return -1;
    }

    if (base != NULL) {
    36fc:	00058b63          	beqz	a1,3712 <target_usi_init+0x1c>
        *base = sg_usi_config[idx].base;
    3700:	47b1                	li	a5,12
    3702:	02f50733          	mul	a4,a0,a5
    3706:	679d                	lui	a5,0x7
    3708:	78878793          	addi	a5,a5,1928 # 7788 <sg_usi_config>
    370c:	97ba                	add	a5,a5,a4
    370e:	439c                	lw	a5,0(a5)
    3710:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3712:	ce01                	beqz	a2,372a <target_usi_init+0x34>
        *irq = sg_usi_config[idx].irq;
    3714:	47b1                	li	a5,12
    3716:	02f50733          	mul	a4,a0,a5
    371a:	679d                	lui	a5,0x7
    371c:	78878793          	addi	a5,a5,1928 # 7788 <sg_usi_config>
    3720:	97ba                	add	a5,a5,a4
    3722:	43dc                	lw	a5,4(a5)
    3724:	c21c                	sw	a5,0(a2)
    3726:	8082                	ret
        return -1;
    3728:	557d                	li	a0,-1
    }

    return idx;
}
    372a:	8082                	ret

0000372c <target_usi_usart_init>:

int32_t target_usi_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_SPI_NUM) {
    372c:	4789                	li	a5,2
    372e:	04a7c263          	blt	a5,a0,3772 <target_usi_usart_init+0x46>
        return -1;
    }

    if (base != NULL) {
    3732:	00058b63          	beqz	a1,3748 <target_usi_usart_init+0x1c>
        *base = sg_usi_config[idx].base;
    3736:	47b1                	li	a5,12
    3738:	02f50733          	mul	a4,a0,a5
    373c:	679d                	lui	a5,0x7
    373e:	78878793          	addi	a5,a5,1928 # 7788 <sg_usi_config>
    3742:	97ba                	add	a5,a5,a4
    3744:	439c                	lw	a5,0(a5)
    3746:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3748:	ca11                	beqz	a2,375c <target_usi_usart_init+0x30>
        *irq = sg_usi_config[idx].irq;
    374a:	47b1                	li	a5,12
    374c:	02f50733          	mul	a4,a0,a5
    3750:	679d                	lui	a5,0x7
    3752:	78878793          	addi	a5,a5,1928 # 7788 <sg_usi_config>
    3756:	97ba                	add	a5,a5,a4
    3758:	43dc                	lw	a5,4(a5)
    375a:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    375c:	ce81                	beqz	a3,3774 <target_usi_usart_init+0x48>
        *handler = sg_usi_config[idx].handler;
    375e:	47b1                	li	a5,12
    3760:	02f50733          	mul	a4,a0,a5
    3764:	679d                	lui	a5,0x7
    3766:	78878793          	addi	a5,a5,1928 # 7788 <sg_usi_config>
    376a:	97ba                	add	a5,a5,a4
    376c:	479c                	lw	a5,8(a5)
    376e:	c29c                	sw	a5,0(a3)
    3770:	8082                	ret
        return -1;
    3772:	557d                	li	a0,-1
    }

    return idx;
}
    3774:	8082                	ret

00003776 <gpio_set_direction>:
    void *port,
    gpio_direction_e direction
)
{
    wj_oip_gpio_priv_t *gpio_priv = port;
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3776:	4118                	lw	a4,0(a0)

    if (direction == GPIO_DIRECTION_INPUT) {
    3778:	e989                	bnez	a1,378a <gpio_set_direction+0x14>
        gpio_reg->SWPORT_DDR &= (~gpio_priv->mask);
    377a:	495c                	lw	a5,20(a0)
    377c:	4354                	lw	a3,4(a4)
    377e:	fff7c793          	not	a5,a5
    3782:	8ff5                	and	a5,a5,a3
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    3784:	c35c                	sw	a5,4(a4)
    } else {
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    }

    return 0;
    3786:	4501                	li	a0,0
    3788:	8082                	ret
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
    378a:	4785                	li	a5,1
    378c:	00f59663          	bne	a1,a5,3798 <gpio_set_direction+0x22>
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    3790:	435c                	lw	a5,4(a4)
    3792:	4954                	lw	a3,20(a0)
    3794:	8fd5                	or	a5,a5,a3
    3796:	b7fd                	j	3784 <gpio_set_direction+0xe>
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    3798:	81010537          	lui	a0,0x81010
    379c:	08750513          	addi	a0,a0,135 # 81010087 <__heap_end+0x60fe0087>
}
    37a0:	8082                	ret

000037a2 <gpio_irq_disable>:
{
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = pin;
    uint32_t offset = gpio_pin_priv->idx;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    37a2:	00054783          	lbu	a5,0(a0)

    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    37a6:	4771                	li	a4,28
    uint32_t offset = gpio_pin_priv->idx;
    37a8:	00154603          	lbu	a2,1(a0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    37ac:	02e78733          	mul	a4,a5,a4
    37b0:	200027b7          	lui	a5,0x20002
    37b4:	99c78793          	addi	a5,a5,-1636 # 2000199c <gpio_handle>
    37b8:	97ba                	add	a5,a5,a4
    37ba:	4398                	lw	a4,0(a5)
    uint32_t val = gpio_control_reg->INTEN;
    val &= ~(1 << offset);
    37bc:	4785                	li	a5,1
    37be:	00c797b3          	sll	a5,a5,a2
    uint32_t val = gpio_control_reg->INTEN;
    37c2:	5b14                	lw	a3,48(a4)
    val &= ~(1 << offset);
    37c4:	fff7c793          	not	a5,a5
    37c8:	8ff5                	and	a5,a5,a3
    gpio_control_reg->INTEN = val;
    37ca:	db1c                	sw	a5,48(a4)
}
    37cc:	8082                	ret

000037ce <wj_oip_gpio_irqhandler>:

void wj_oip_gpio_irqhandler(int idx)
{
    if (idx >= CONFIG_GPIO_NUM) {
    37ce:	06a04e63          	bgtz	a0,384a <wj_oip_gpio_irqhandler+0x7c>
        return;
    }

    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    37d2:	46f1                	li	a3,28
    37d4:	02d50533          	mul	a0,a0,a3
    37d8:	20002737          	lui	a4,0x20002
    37dc:	99c70793          	addi	a5,a4,-1636 # 2000199c <gpio_handle>
{
    37e0:	1141                	addi	sp,sp,-16
    37e2:	c422                	sw	s0,8(sp)
    37e4:	20002437          	lui	s0,0x20002
    37e8:	c226                	sw	s1,4(sp)
    37ea:	c606                	sw	ra,12(sp)
    37ec:	9b840413          	addi	s0,s0,-1608 # 200019b8 <gpio_pin_handle>

    uint32_t value = gpio_control_reg->INTSTATUS;
    37f0:	4481                	li	s1,0
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    37f2:	953e                	add	a0,a0,a5
    37f4:	411c                	lw	a5,0(a0)
    uint32_t value = gpio_control_reg->INTSTATUS;
    37f6:	99c70713          	addi	a4,a4,-1636
    37fa:	43b0                	lw	a2,64(a5)
    uint8_t i;

    /* find the interrput pin */
    for (i = 0; i < 32; i++) {
        if (value & (1U << i)) {
    37fc:	4685                	li	a3,1
    37fe:	009696b3          	sll	a3,a3,s1
    3802:	00c6f7b3          	and	a5,a3,a2
    3806:	c79d                	beqz	a5,3834 <wj_oip_gpio_irqhandler+0x66>
                for (j = 0; j < idx; j++) {
                    pin_idx += gpio_handle[j].pin_num;
                }
            }

            if (pin_idx >= CONFIG_GPIO_PIN_NUM) {
    3808:	47fd                	li	a5,31
    380a:	02f48b63          	beq	s1,a5,3840 <wj_oip_gpio_irqhandler+0x72>
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    380e:	00044783          	lbu	a5,0(s0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    3812:	45f1                	li	a1,28
    3814:	02b787b3          	mul	a5,a5,a1
    3818:	97ba                	add	a5,a5,a4
    381a:	439c                	lw	a5,0(a5)
    gpio_control_reg->PORTA_EOI = idx;
    381c:	c7f4                	sw	a3,76(a5)
            wj_oip_gpio_pin_priv_t *gpio_pin_priv = (wj_oip_gpio_pin_priv_t *)&gpio_pin_handle[pin_idx];

            gpio_irq_clear(gpio_pin_priv, (1 << i));  //clear the gpio interrupt

            /* execute the callback function */
            if ((gpio_event_cb_t)(gpio_pin_priv->cb)) {
    381e:	405c                	lw	a5,4(s0)
    3820:	cb91                	beqz	a5,3834 <wj_oip_gpio_irqhandler+0x66>
                ((gpio_event_cb_t)(gpio_pin_priv->cb))(gpio_pin_priv->offset);
    3822:	00244503          	lbu	a0,2(s0)
    3826:	c032                	sw	a2,0(sp)
    3828:	9782                	jalr	a5
    382a:	4602                	lw	a2,0(sp)
    382c:	200027b7          	lui	a5,0x20002
    3830:	99c78713          	addi	a4,a5,-1636 # 2000199c <gpio_handle>
    for (i = 0; i < 32; i++) {
    3834:	0485                	addi	s1,s1,1
    3836:	02000793          	li	a5,32
    383a:	0421                	addi	s0,s0,8
    383c:	fcf490e3          	bne	s1,a5,37fc <wj_oip_gpio_irqhandler+0x2e>
            }
        }
    }
}
    3840:	40b2                	lw	ra,12(sp)
    3842:	4422                	lw	s0,8(sp)
    3844:	4492                	lw	s1,4(sp)
    3846:	0141                	addi	sp,sp,16
    3848:	8082                	ret
    384a:	8082                	ret

0000384c <csi_gpio_port_initialize>:
                3.get gpio_port_handle
  \param[in]   port      port_name.
  \return      gpio_port_handle
*/
gpio_port_handle_t csi_gpio_port_initialize(int32_t port)
{
    384c:	1111                	addi	sp,sp,-28
    /* obtain the gpio port information */
    uint32_t base = 0u;
    uint32_t pin_num;
    uint32_t irq;
    void *handler;
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    384e:	0058                	addi	a4,sp,4
    3850:	0074                	addi	a3,sp,12
    3852:	0030                	addi	a2,sp,8
    3854:	858a                	mv	a1,sp
{
    3856:	cc06                	sw	ra,24(sp)
    3858:	ca22                	sw	s0,20(sp)
    385a:	c826                	sw	s1,16(sp)
    uint32_t base = 0u;
    385c:	c002                	sw	zero,0(sp)
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    385e:	3da1                	jal	36b6 <target_gpio_port_init>

    if (idx < 0 || idx >= CONFIG_GPIO_NUM) {
    3860:	e905                	bnez	a0,3890 <csi_gpio_port_initialize+0x44>
        return NULL;
    }

    gpio_priv = &gpio_handle[idx];

    gpio_priv->base = base;
    3862:	4782                	lw	a5,0(sp)
    3864:	20002437          	lui	s0,0x20002
    3868:	99c40493          	addi	s1,s0,-1636 # 2000199c <gpio_handle>
    gpio_priv->irq  = irq;
    386c:	4522                	lw	a0,8(sp)

#ifdef CONFIG_LPM
    csi_gpio_power_control(gpio_priv, DRV_POWER_FULL);
#endif

    drv_irq_register(gpio_priv->irq, handler);
    386e:	45b2                	lw	a1,12(sp)
    gpio_priv->base = base;
    3870:	c09c                	sw	a5,0(s1)
    gpio_priv->pin_num  = pin_num;
    3872:	4792                	lw	a5,4(sp)
    gpio_priv->irq  = irq;
    3874:	c0c8                	sw	a0,4(s1)
    gpio_priv->pin_num  = pin_num;
    3876:	c49c                	sw	a5,8(s1)
    drv_irq_register(gpio_priv->irq, handler);
    3878:	c08ff0ef          	jal	ra,2c80 <drv_irq_register>
    drv_irq_enable(gpio_priv->irq);
    387c:	40c8                	lw	a0,4(s1)
    387e:	be6ff0ef          	jal	ra,2c64 <drv_irq_enable>

    return (gpio_port_handle_t)gpio_priv;
    3882:	99c40513          	addi	a0,s0,-1636
}
    3886:	40e2                	lw	ra,24(sp)
    3888:	4452                	lw	s0,20(sp)
    388a:	44c2                	lw	s1,16(sp)
    388c:	0171                	addi	sp,sp,28
    388e:	8082                	ret
        return NULL;
    3890:	4501                	li	a0,0
    3892:	bfd5                	j	3886 <csi_gpio_port_initialize+0x3a>

00003894 <csi_gpio_pin_initialize>:
  \return      gpio_pin_handle
*/
gpio_pin_handle_t csi_gpio_pin_initialize(int32_t gpio_pin, gpio_event_cb_t cb_event)
{

    if (gpio_pin < 0 || gpio_pin >= CONFIG_GPIO_PIN_NUM) {
    3894:	47f9                	li	a5,30
    3896:	00a7f463          	bgeu	a5,a0,389e <csi_gpio_pin_initialize+0xa>
        return NULL;
    389a:	4501                	li	a0,0
    gpio_pin_priv->idx = pin_idx;
    gpio_pin_priv->cb = cb_event;
    gpio_pin_priv->offset = gpio_pin;

    return (gpio_pin_handle_t)gpio_pin_priv;
}
    389c:	8082                	ret
{
    389e:	1141                	addi	sp,sp,-16
    38a0:	c422                	sw	s0,8(sp)
    38a2:	842a                	mv	s0,a0
        csi_gpio_port_initialize(i);
    38a4:	4501                	li	a0,0
{
    38a6:	c606                	sw	ra,12(sp)
    38a8:	c226                	sw	s1,4(sp)
    38aa:	84ae                	mv	s1,a1
        csi_gpio_port_initialize(i);
    38ac:	3745                	jal	384c <csi_gpio_port_initialize>
    int32_t pin_idx = target_gpio_pin_init(gpio_pin, &port_idx);
    38ae:	858a                	mv	a1,sp
    38b0:	8522                	mv	a0,s0
    38b2:	3d1d                	jal	36e8 <target_gpio_pin_init>
    38b4:	872a                	mv	a4,a0
        return NULL;
    38b6:	4501                	li	a0,0
    if (pin_idx < 0) {
    38b8:	02074963          	bltz	a4,38ea <csi_gpio_pin_initialize+0x56>
    for (i = 0; i < port_idx; i++) {
    38bc:	4602                	lw	a2,0(sp)
    38be:	87ba                	mv	a5,a4
    38c0:	c611                	beqz	a2,38cc <csi_gpio_pin_initialize+0x38>
        idx += (gpio_handle[i].pin_num);
    38c2:	200027b7          	lui	a5,0x20002
    38c6:	9a47a783          	lw	a5,-1628(a5) # 200019a4 <gpio_handle+0x8>
    38ca:	97ba                	add	a5,a5,a4
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = &(gpio_pin_handle[idx]);
    38cc:	00379693          	slli	a3,a5,0x3
    38d0:	200027b7          	lui	a5,0x20002
    38d4:	9b878793          	addi	a5,a5,-1608 # 200019b8 <gpio_pin_handle>
    38d8:	00d78533          	add	a0,a5,a3
    gpio_pin_priv->portidx = port_idx;
    38dc:	00c50023          	sb	a2,0(a0)
    gpio_pin_priv->idx = pin_idx;
    38e0:	00e500a3          	sb	a4,1(a0)
    gpio_pin_priv->cb = cb_event;
    38e4:	c144                	sw	s1,4(a0)
    gpio_pin_priv->offset = gpio_pin;
    38e6:	00850123          	sb	s0,2(a0)
}
    38ea:	40b2                	lw	ra,12(sp)
    38ec:	4422                	lw	s0,8(sp)
    38ee:	4492                	lw	s1,4(sp)
    38f0:	0141                	addi	sp,sp,16
    38f2:	8082                	ret

000038f4 <csi_gpio_pin_config_mode>:
  \param[in]   mode      \ref gpio_mode_e
  \return      error code
*/
int32_t csi_gpio_pin_config_mode(gpio_pin_handle_t handle,
                                 gpio_mode_e mode)
{
    38f4:	862e                	mv	a2,a1
    GPIO_NULL_PARAM_CHK(handle);
    38f6:	c511                	beqz	a0,3902 <csi_gpio_pin_config_mode+0xe>
    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    uint8_t offset = gpio_pin_priv->idx;

    int32_t ret = drv_pin_config_mode(gpio_pin_priv->portidx, offset, mode);
    38f8:	00154583          	lbu	a1,1(a0)
    38fc:	00054503          	lbu	a0,0(a0)
    3900:	a131                	j	3d0c <drv_pin_config_mode>

    return ret;
}
    3902:	81010537          	lui	a0,0x81010
    3906:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    390a:	8082                	ret

0000390c <csi_gpio_pin_config_direction>:
  \param[in]   dir       \ref gpio_direction_e
  \return      error code
*/
int32_t csi_gpio_pin_config_direction(gpio_pin_handle_t handle,
                                      gpio_direction_e dir)
{
    390c:	872a                	mv	a4,a0
    GPIO_NULL_PARAM_CHK(handle);
    390e:	c11d                	beqz	a0,3934 <csi_gpio_pin_config_direction+0x28>

    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *gpio_priv = &gpio_handle[gpio_pin_priv->portidx];
    3910:	00054503          	lbu	a0,0(a0)

    gpio_priv->dir = dir;
    3914:	47f1                	li	a5,28
    3916:	02f50533          	mul	a0,a0,a5
    391a:	200027b7          	lui	a5,0x20002
    391e:	99c78793          	addi	a5,a5,-1636 # 2000199c <gpio_handle>
    3922:	953e                	add	a0,a0,a5
    3924:	c90c                	sw	a1,16(a0)
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    3926:	00174703          	lbu	a4,1(a4)
    392a:	4785                	li	a5,1
    392c:	00e797b3          	sll	a5,a5,a4
    3930:	c95c                	sw	a5,20(a0)

    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    3932:	b591                	j	3776 <gpio_set_direction>
    if (ret) {
        return ret;
    }

    return 0;
}
    3934:	81010537          	lui	a0,0x81010
    3938:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    393c:	8082                	ret

0000393e <csi_gpio_pin_write>:
  \param[in]   value     the value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value)
{
    GPIO_NULL_PARAM_CHK(handle);
    393e:	cd05                	beqz	a0,3976 <csi_gpio_pin_write+0x38>

    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    3940:	00054703          	lbu	a4,0(a0)

    uint8_t offset = gpio_pin_priv->idx;
    uint32_t port_value = value << offset;

    port_handle->value = port_value;
    3944:	46f1                	li	a3,28
    uint32_t port_value = value << offset;
    3946:	00154603          	lbu	a2,1(a0)
    port_handle->value = port_value;
    394a:	02d706b3          	mul	a3,a4,a3
    394e:	20002737          	lui	a4,0x20002
    3952:	99c70713          	addi	a4,a4,-1636 # 2000199c <gpio_handle>
    uint32_t port_value = value << offset;
    3956:	00c595b3          	sll	a1,a1,a2
    gpio_write(port_handle, (1 << offset));
    395a:	4785                	li	a5,1
    395c:	00c797b3          	sll	a5,a5,a2
    value &= ~(mask);
    3960:	fff7c793          	not	a5,a5

    return 0;
    3964:	4501                	li	a0,0
    port_handle->value = port_value;
    3966:	9736                	add	a4,a4,a3
    3968:	cf0c                	sw	a1,24(a4)
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    396a:	4318                	lw	a4,0(a4)
    uint32_t value = gpio_reg->SWPORT_DR;
    396c:	4314                	lw	a3,0(a4)
    value &= ~(mask);
    396e:	8ff5                	and	a5,a5,a3
    value |= gpio_priv->value;
    3970:	8ddd                	or	a1,a1,a5
    gpio_reg->SWPORT_DR = value;
    3972:	c30c                	sw	a1,0(a4)
    return 0;
    3974:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3976:	81010537          	lui	a0,0x81010
    397a:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>

}
    397e:	8082                	ret

00003980 <csi_gpio_pin_read>:
  \param[out]  value     buf to store the pin value
  \return      error code
*/
int32_t csi_gpio_pin_read(gpio_pin_handle_t handle, bool *value)
{
    GPIO_NULL_PARAM_CHK(handle);
    3980:	cd0d                	beqz	a0,39ba <csi_gpio_pin_read+0x3a>
    GPIO_NULL_PARAM_CHK(value);
    3982:	02058c63          	beqz	a1,39ba <csi_gpio_pin_read+0x3a>
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;
    uint32_t port_value;
    uint8_t offset = gpio_pin_priv->idx;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    3986:	00054783          	lbu	a5,0(a0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_priv->base + 0x30);
    398a:	4771                	li	a4,28
    398c:	02e78733          	mul	a4,a5,a4
    3990:	200027b7          	lui	a5,0x20002
    3994:	99c78793          	addi	a5,a5,-1636 # 2000199c <gpio_handle>
    3998:	97ba                	add	a5,a5,a4
    399a:	439c                	lw	a5,0(a5)

    gpio_read(port_handle, &port_value);
    *value = (port_value & (1 << offset)) >> offset;
    399c:	00154703          	lbu	a4,1(a0)

    return 0;
    39a0:	4501                	li	a0,0
    *value = gpio_control_reg->EXT_PORTA;
    39a2:	4bb4                	lw	a3,80(a5)
    *value = (port_value & (1 << offset)) >> offset;
    39a4:	4785                	li	a5,1
    39a6:	00e797b3          	sll	a5,a5,a4
    39aa:	8ff5                	and	a5,a5,a3
    39ac:	00e7d7b3          	srl	a5,a5,a4
    39b0:	00f037b3          	snez	a5,a5
    39b4:	00f58023          	sb	a5,0(a1)
    return 0;
    39b8:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    39ba:	81010537          	lui	a0,0x81010
    39be:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
}
    39c2:	8082                	ret

000039c4 <csi_gpio_pin_set_irq>:
  \param[in]   enable    the enable flag
  \return      error code
*/
int32_t csi_gpio_pin_set_irq(gpio_pin_handle_t handle, gpio_irq_mode_e mode, bool enable)
{
    GPIO_NULL_PARAM_CHK(handle);
    39c4:	c951                	beqz	a0,3a58 <csi_gpio_pin_set_irq+0x94>

    uint32_t ret = 0;

    if (enable) {
    39c6:	08060263          	beqz	a2,3a4a <csi_gpio_pin_set_irq+0x86>
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    39ca:	00054783          	lbu	a5,0(a0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    39ce:	46f1                	li	a3,28
    uint32_t offset = gpio_pin_priv->idx;
    39d0:	00154703          	lbu	a4,1(a0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    39d4:	02d786b3          	mul	a3,a5,a3
    39d8:	200027b7          	lui	a5,0x20002
    39dc:	99c78793          	addi	a5,a5,-1636 # 2000199c <gpio_handle>
    39e0:	97b6                	add	a5,a5,a3
    39e2:	4390                	lw	a2,0(a5)
    uint32_t mask = 1 << offset;
    39e4:	4685                	li	a3,1
    39e6:	00e69733          	sll	a4,a3,a4
    39ea:	4691                	li	a3,4
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    39ec:	03060793          	addi	a5,a2,48
    switch (irq_mode) {
    39f0:	00b6e963          	bltu	a3,a1,3a02 <csi_gpio_pin_set_irq+0x3e>
    39f4:	669d                	lui	a3,0x7
    39f6:	7ac68693          	addi	a3,a3,1964 # 77ac <sg_usi_config+0x24>
    39fa:	058a                	slli	a1,a1,0x2
    39fc:	95b6                	add	a1,a1,a3
    39fe:	4194                	lw	a3,0(a1)
    3a00:	8682                	jr	a3
    uint32_t mask = 1 << offset;
    3a02:	81010537          	lui	a0,0x81010
    3a06:	08850513          	addi	a0,a0,136 # 81010088 <__heap_end+0x60fe0088>
    3a0a:	8082                	ret
            gpio_control_reg->INTTYPE_LEVEL |= mask;
    3a0c:	4794                	lw	a3,8(a5)
    3a0e:	8ed9                	or	a3,a3,a4
            gpio_control_reg->INTTYPE_LEVEL &= (~mask);
    3a10:	c794                	sw	a3,8(a5)
            gpio_control_reg->INT_POLARITY |= mask;
    3a12:	47d4                	lw	a3,12(a5)
    3a14:	8ed9                	or	a3,a3,a4
    3a16:	a801                	j	3a26 <csi_gpio_pin_set_irq+0x62>
            gpio_control_reg->INTTYPE_LEVEL |= mask;
    3a18:	4794                	lw	a3,8(a5)
    3a1a:	8ed9                	or	a3,a3,a4
    3a1c:	c794                	sw	a3,8(a5)
            gpio_control_reg->INT_POLARITY &= (~mask);
    3a1e:	47cc                	lw	a1,12(a5)
    3a20:	fff74693          	not	a3,a4
            gpio_control_reg->INT_POLARITY &= (~mask);
    3a24:	8eed                	and	a3,a3,a1
            gpio_control_reg->INT_POLARITY |= mask;
    3a26:	c7d4                	sw	a3,12(a5)
    uint32_t val = gpio_control_reg->INTEN;
    3a28:	5a1c                	lw	a5,48(a2)
    } else {
        gpio_irq_disable(handle);

    }

    return ret;
    3a2a:	4501                	li	a0,0
    val |= (1 << offset);
    3a2c:	8f5d                	or	a4,a4,a5
    gpio_control_reg->INTEN = val;
    3a2e:	da18                	sw	a4,48(a2)
}
    3a30:	8082                	ret
            gpio_control_reg->INTTYPE_LEVEL &= (~mask);
    3a32:	478c                	lw	a1,8(a5)
    3a34:	fff74693          	not	a3,a4
    3a38:	8df5                	and	a1,a1,a3
    3a3a:	c78c                	sw	a1,8(a5)
            gpio_control_reg->INT_POLARITY &= (~mask);
    3a3c:	47cc                	lw	a1,12(a5)
    3a3e:	b7dd                	j	3a24 <csi_gpio_pin_set_irq+0x60>
            gpio_control_reg->INTTYPE_LEVEL &= (~mask);
    3a40:	478c                	lw	a1,8(a5)
    3a42:	fff74693          	not	a3,a4
    3a46:	8eed                	and	a3,a3,a1
    3a48:	b7e1                	j	3a10 <csi_gpio_pin_set_irq+0x4c>
{
    3a4a:	1151                	addi	sp,sp,-12
    3a4c:	c406                	sw	ra,8(sp)
        gpio_irq_disable(handle);
    3a4e:	3b91                	jal	37a2 <gpio_irq_disable>

}
    3a50:	40a2                	lw	ra,8(sp)
    return ret;
    3a52:	4501                	li	a0,0
}
    3a54:	0131                	addi	sp,sp,12
    3a56:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3a58:	81010537          	lui	a0,0x81010
    3a5c:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    3a60:	8082                	ret
            return ERR_GPIO(DRV_ERROR_UNSUPPORTED);
    3a62:	81010537          	lui	a0,0x81010
    3a66:	08350513          	addi	a0,a0,131 # 81010083 <__heap_end+0x60fe0083>
}
    3a6a:	8082                	ret

00003a6c <wj_oip_timer_irqhandler>:
}

void wj_oip_timer_irqhandler(int idx)
{
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->timeout_flag = 1;
    3a6c:	47e1                	li	a5,24
    3a6e:	02f50733          	mul	a4,a0,a5
    3a72:	200027b7          	lui	a5,0x20002
    3a76:	ab078793          	addi	a5,a5,-1360 # 20001ab0 <timer_instance>
    3a7a:	97ba                	add	a5,a5,a4
    3a7c:	4705                	li	a4,1
    3a7e:	cbd8                	sw	a4,20(a5)

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3a80:	43d8                	lw	a4,4(a5)

    addr->TxEOI;

    if (timer_priv->cb_event) {
    3a82:	47dc                	lw	a5,12(a5)
    addr->TxEOI;
    3a84:	4758                	lw	a4,12(a4)
    if (timer_priv->cb_event) {
    3a86:	c399                	beqz	a5,3a8c <wj_oip_timer_irqhandler+0x20>
        return timer_priv->cb_event(idx, TIMER_EVENT_TIMEOUT);
    3a88:	4581                	li	a1,0
    3a8a:	8782                	jr	a5
    }

}
    3a8c:	8082                	ret

00003a8e <csi_timer_initialize>:
  \param[in]   idx  instance timer index
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    3a8e:	1111                	addi	sp,sp,-28
    3a90:	cc06                	sw	ra,24(sp)
    3a92:	ca22                	sw	s0,20(sp)
    3a94:	c826                	sw	s1,16(sp)
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    3a96:	47bd                	li	a5,15
    3a98:	00a7f963          	bgeu	a5,a0,3aaa <csi_timer_initialize+0x1c>
        return NULL;
    3a9c:	4401                	li	s0,0
        drv_irq_register(timer_priv->irq, handler);
        drv_irq_enable(timer_priv->irq);
    }

    return (timer_handle_t)timer_priv;
}
    3a9e:	40e2                	lw	ra,24(sp)
    3aa0:	8522                	mv	a0,s0
    3aa2:	4452                	lw	s0,20(sp)
    3aa4:	44c2                	lw	s1,16(sp)
    3aa6:	0171                	addi	sp,sp,28
    3aa8:	8082                	ret
    3aaa:	84ae                	mv	s1,a1
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    3aac:	0074                	addi	a3,sp,12
    3aae:	0030                	addi	a2,sp,8
    3ab0:	004c                	addi	a1,sp,4
    3ab2:	c02a                	sw	a0,0(sp)
    uint32_t base = 0u;
    3ab4:	c202                	sw	zero,4(sp)
    uint32_t irq = 0u;
    3ab6:	c402                	sw	zero,8(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    3ab8:	3e55                	jal	366c <target_get_timer>
    if (real_idx != idx) {
    3aba:	4702                	lw	a4,0(sp)
    3abc:	fea710e3          	bne	a4,a0,3a9c <csi_timer_initialize+0xe>
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    3ac0:	4461                	li	s0,24
    3ac2:	028707b3          	mul	a5,a4,s0
    3ac6:	20002437          	lui	s0,0x20002
    3aca:	ab040413          	addi	s0,s0,-1360 # 20001ab0 <timer_instance>
    timer_priv->irq  = irq;
    3ace:	46a2                	lw	a3,8(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ad0:	4501                	li	a0,0
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    3ad2:	943e                	add	s0,s0,a5
    timer_priv->base = base;
    3ad4:	4792                	lw	a5,4(sp)
    timer_priv->irq  = irq;
    3ad6:	c414                	sw	a3,8(s0)
    timer_priv->idx = idx;
    3ad8:	00e40023          	sb	a4,0(s0)
    timer_priv->base = base;
    3adc:	c05c                	sw	a5,4(s0)
    3ade:	c03e                	sw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ae0:	2c35                	jal	3d1c <drv_get_timer_freq>
    3ae2:	577d                	li	a4,-1
    3ae4:	02a75733          	divu	a4,a4,a0
    3ae8:	000f4537          	lui	a0,0xf4
    3aec:	24050513          	addi	a0,a0,576 # f4240 <__ctor_end__+0xeb9e0>
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3af0:	4782                	lw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3af2:	02a70733          	mul	a4,a4,a0
    3af6:	c818                	sw	a4,16(s0)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3af8:	4798                	lw	a4,8(a5)
    3afa:	01e77693          	andi	a3,a4,30
    3afe:	0087c703          	lbu	a4,8(a5)
    3b02:	9b01                	andi	a4,a4,-32
    3b04:	8f55                	or	a4,a4,a3
    3b06:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_INTMASK;
    3b0a:	4798                	lw	a4,8(a5)
    3b0c:	8b7d                	andi	a4,a4,31
    3b0e:	00476693          	ori	a3,a4,4
    3b12:	0087c703          	lbu	a4,8(a5)
    3b16:	9b01                	andi	a4,a4,-32
    3b18:	8f55                	or	a4,a4,a3
    3b1a:	00e78423          	sb	a4,8(a5)
    timer_priv->cb_event = cb_event;
    3b1e:	c444                	sw	s1,12(s0)
    if (cb_event != NULL) {
    3b20:	dcbd                	beqz	s1,3a9e <csi_timer_initialize+0x10>
        drv_irq_register(timer_priv->irq, handler);
    3b22:	4408                	lw	a0,8(s0)
    3b24:	45b2                	lw	a1,12(sp)
    3b26:	95aff0ef          	jal	ra,2c80 <drv_irq_register>
        drv_irq_enable(timer_priv->irq);
    3b2a:	4408                	lw	a0,8(s0)
    3b2c:	938ff0ef          	jal	ra,2c64 <drv_irq_enable>
    3b30:	b7bd                	j	3a9e <csi_timer_initialize+0x10>

00003b32 <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b32:	c511                	beqz	a0,3b3e <csi_timer_config+0xc>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3b34:	415c                	lw	a5,4(a0)

    switch (mode) {
    3b36:	c989                	beqz	a1,3b48 <csi_timer_config+0x16>
    3b38:	4705                	li	a4,1
    3b3a:	02e58c63          	beq	a1,a4,3b72 <csi_timer_config+0x40>
    TIMER_NULL_PARAM_CHK(handle);
    3b3e:	81070537          	lui	a0,0x81070
    3b42:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
    }

    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);

    return 0;
}
    3b46:	8082                	ret
            addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_MODE;
    3b48:	4798                	lw	a4,8(a5)
    3b4a:	01d77693          	andi	a3,a4,29
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b4e:	0087c703          	lbu	a4,8(a5)
    return 0;
    3b52:	4501                	li	a0,0
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b54:	9b01                	andi	a4,a4,-32
    3b56:	8f55                	or	a4,a4,a3
    3b58:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);
    3b5c:	4798                	lw	a4,8(a5)
    3b5e:	8b7d                	andi	a4,a4,31
    3b60:	01076693          	ori	a3,a4,16
    3b64:	0087c703          	lbu	a4,8(a5)
    3b68:	9b01                	andi	a4,a4,-32
    3b6a:	8f55                	or	a4,a4,a3
    3b6c:	00e78423          	sb	a4,8(a5)
    return 0;
    3b70:	8082                	ret
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b72:	4798                	lw	a4,8(a5)
    3b74:	8b7d                	andi	a4,a4,31
    3b76:	00276693          	ori	a3,a4,2
    3b7a:	bfd1                	j	3b4e <csi_timer_config+0x1c>

00003b7c <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b7c:	c501                	beqz	a0,3b84 <csi_timer_set_timeout+0x8>

    wj_oip_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
    3b7e:	c90c                	sw	a1,16(a0)
    return 0;
    3b80:	4501                	li	a0,0
    3b82:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3b84:	81070537          	lui	a0,0x81070
    3b88:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3b8c:	8082                	ret

00003b8e <csi_timer_start>:
  \return      error code
*/

int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b8e:	c545                	beqz	a0,3c36 <csi_timer_start+0xa8>
{
    3b90:	1141                	addi	sp,sp,-16
    3b92:	c606                	sw	ra,12(sp)
    3b94:	c422                	sw	s0,8(sp)
    3b96:	c226                	sw	s1,4(sp)
    3b98:	842a                	mv	s0,a0

    wj_oip_timer_priv_t *timer_priv = handle;

    timer_priv->timeout_flag = 0;
    3b9a:	00052a23          	sw	zero,20(a0)

    uint32_t min_us = drv_get_timer_freq(timer_priv->idx) / 1000000;
    3b9e:	00054503          	lbu	a0,0(a0)
    3ba2:	000f44b7          	lui	s1,0xf4
    3ba6:	24048493          	addi	s1,s1,576 # f4240 <__ctor_end__+0xeb9e0>
    3baa:	2a8d                	jal	3d1c <drv_get_timer_freq>
    3bac:	029544b3          	div	s1,a0,s1
    uint32_t load;

    if (((timer_priv->timeout * drv_get_timer_freq(timer_priv->idx)) / 1000000) > 0xffffffff) {
    3bb0:	00044503          	lbu	a0,0(s0)
    3bb4:	22a5                	jal	3d1c <drv_get_timer_freq>
        return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    if (min_us) {
    3bb6:	481c                	lw	a5,16(s0)
        load = (uint32_t)(timer_priv->timeout * min_us);
    3bb8:	02f48533          	mul	a0,s1,a5
    if (min_us) {
    3bbc:	e08d                	bnez	s1,3bde <csi_timer_start+0x50>
    } else {
        load = (uint32_t)(((uint64_t)(timer_priv->timeout) * drv_get_timer_freq(timer_priv->idx)) / 1000000);
    3bbe:	00044503          	lbu	a0,0(s0)
    3bc2:	c03e                	sw	a5,0(sp)
    3bc4:	2aa1                	jal	3d1c <drv_get_timer_freq>
    3bc6:	4782                	lw	a5,0(sp)
    3bc8:	000f4637          	lui	a2,0xf4
    3bcc:	24060613          	addi	a2,a2,576 # f4240 <__ctor_end__+0xeb9e0>
    3bd0:	4681                	li	a3,0
    3bd2:	02f525b3          	mulhsu	a1,a0,a5
    3bd6:	02a78533          	mul	a0,a5,a0
    3bda:	e1cfc0ef          	jal	ra,1f6 <__udivdi3>
    }

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);

    if (timer_priv->timeout == 0) {
    3bde:	4818                	lw	a4,16(s0)
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3be0:	405c                	lw	a5,4(s0)
    if (timer_priv->timeout == 0) {
    3be2:	e729                	bnez	a4,3c2c <csi_timer_start+0x9e>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    3be4:	577d                	li	a4,-1
    3be6:	c398                	sw	a4,0(a5)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3be8:	4798                	lw	a4,8(a5)
    }

#endif

    return 0;
}
    3bea:	40b2                	lw	ra,12(sp)
    3bec:	4422                	lw	s0,8(sp)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bee:	01e77693          	andi	a3,a4,30
    3bf2:	0087c703          	lbu	a4,8(a5)
}
    3bf6:	4492                	lw	s1,4(sp)
    return 0;
    3bf8:	4501                	li	a0,0
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bfa:	9b01                	andi	a4,a4,-32
    3bfc:	8f55                	or	a4,a4,a3
    3bfe:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    3c02:	4798                	lw	a4,8(a5)
    3c04:	8b7d                	andi	a4,a4,31
    3c06:	00176693          	ori	a3,a4,1
    3c0a:	0087c703          	lbu	a4,8(a5)
    3c0e:	9b01                	andi	a4,a4,-32
    3c10:	8f55                	or	a4,a4,a3
    3c12:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    3c16:	4798                	lw	a4,8(a5)
    3c18:	01b77693          	andi	a3,a4,27
    3c1c:	0087c703          	lbu	a4,8(a5)
    3c20:	9b01                	andi	a4,a4,-32
    3c22:	8f55                	or	a4,a4,a3
    3c24:	00e78423          	sb	a4,8(a5)
}
    3c28:	0141                	addi	sp,sp,16
    3c2a:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    3c2c:	4798                	lw	a4,8(a5)
    3c2e:	8b75                	andi	a4,a4,29
    3c30:	db55                	beqz	a4,3be4 <csi_timer_start+0x56>
            addr->TxLoadCount = load;                           /* load time(us) */
    3c32:	c388                	sw	a0,0(a5)
    3c34:	bf55                	j	3be8 <csi_timer_start+0x5a>
    TIMER_NULL_PARAM_CHK(handle);
    3c36:	81070537          	lui	a0,0x81070
    3c3a:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3c3e:	8082                	ret

00003c40 <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    3c40:	c901                	beqz	a0,3c50 <csi_timer_get_current_value+0x10>
    TIMER_NULL_PARAM_CHK(value);
    3c42:	00058763          	beqz	a1,3c50 <csi_timer_get_current_value+0x10>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3c46:	415c                	lw	a5,4(a0)

    *value = addr->TxCurrentValue;
    return 0;
    3c48:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    3c4a:	43dc                	lw	a5,4(a5)
    3c4c:	c19c                	sw	a5,0(a1)
    return 0;
    3c4e:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3c50:	81070537          	lui	a0,0x81070
    3c54:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3c58:	8082                	ret

00003c5a <TIM0_IRQHandler>:
}

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(0);
    3c5a:	4501                	li	a0,0
    3c5c:	bd01                	j	3a6c <wj_oip_timer_irqhandler>

00003c5e <TIM1_IRQHandler>:
}

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(1);
    3c5e:	4505                	li	a0,1
    3c60:	b531                	j	3a6c <wj_oip_timer_irqhandler>

00003c62 <TIM2_IRQHandler>:
    CSI_INTRPT_EXIT();
}
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(2);
    3c62:	4509                	li	a0,2
    3c64:	b521                	j	3a6c <wj_oip_timer_irqhandler>

00003c66 <TIM3_IRQHandler>:
}

ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(3);
    3c66:	450d                	li	a0,3
    3c68:	b511                	j	3a6c <wj_oip_timer_irqhandler>

00003c6a <TIM4_IRQHandler>:
}

ATTRIBUTE_ISR void TIM4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(4);
    3c6a:	4511                	li	a0,4
    3c6c:	b501                	j	3a6c <wj_oip_timer_irqhandler>

00003c6e <TIM5_IRQHandler>:
}

ATTRIBUTE_ISR void TIM5_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(5);
    3c6e:	4515                	li	a0,5
    3c70:	bbf5                	j	3a6c <wj_oip_timer_irqhandler>

00003c72 <TIM6_IRQHandler>:
}

ATTRIBUTE_ISR void TIM6_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(6);
    3c72:	4519                	li	a0,6
    3c74:	bbe5                	j	3a6c <wj_oip_timer_irqhandler>

00003c76 <TIM7_IRQHandler>:
}

ATTRIBUTE_ISR void TIM7_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(7);
    3c76:	451d                	li	a0,7
    3c78:	bbd5                	j	3a6c <wj_oip_timer_irqhandler>

00003c7a <TIM8_IRQHandler>:
}

ATTRIBUTE_ISR void TIM8_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(8);
    3c7a:	4521                	li	a0,8
    3c7c:	bbc5                	j	3a6c <wj_oip_timer_irqhandler>

00003c7e <TIM9_IRQHandler>:
}

ATTRIBUTE_ISR void TIM9_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(9);
    3c7e:	4525                	li	a0,9
    3c80:	b3f5                	j	3a6c <wj_oip_timer_irqhandler>

00003c82 <TIM10_IRQHandler>:
}

ATTRIBUTE_ISR void TIM10_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(10);
    3c82:	4529                	li	a0,10
    3c84:	b3e5                	j	3a6c <wj_oip_timer_irqhandler>

00003c86 <TIM11_IRQHandler>:
}

ATTRIBUTE_ISR void TIM11_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(11);
    3c86:	452d                	li	a0,11
    3c88:	b3d5                	j	3a6c <wj_oip_timer_irqhandler>

00003c8a <TIM12_IRQHandler>:
}

ATTRIBUTE_ISR void TIM12_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(12);
    3c8a:	4531                	li	a0,12
    3c8c:	b3c5                	j	3a6c <wj_oip_timer_irqhandler>

00003c8e <TIM13_IRQHandler>:
}

ATTRIBUTE_ISR void TIM13_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(13);
    3c8e:	4535                	li	a0,13
    3c90:	bbf1                	j	3a6c <wj_oip_timer_irqhandler>

00003c92 <TIM14_IRQHandler>:
}

ATTRIBUTE_ISR void TIM14_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(14);
    3c92:	4539                	li	a0,14
    3c94:	bbe1                	j	3a6c <wj_oip_timer_irqhandler>

00003c96 <TIM15_IRQHandler>:
}

ATTRIBUTE_ISR void TIM15_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(15);
    3c96:	453d                	li	a0,15
    3c98:	bbd1                	j	3a6c <wj_oip_timer_irqhandler>

00003c9a <USI0_IRQHandler>:
}

ATTRIBUTE_ISR void USI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(0);
    3c9a:	4501                	li	a0,0
    3c9c:	842ff06f          	j	2cde <wj_usi_irqhandler>

00003ca0 <USI1_IRQHandler>:
}

ATTRIBUTE_ISR void USI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(1);
    3ca0:	4505                	li	a0,1
    3ca2:	83cff06f          	j	2cde <wj_usi_irqhandler>

00003ca6 <USI2_IRQHandler>:
}

ATTRIBUTE_ISR void USI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(2);
    3ca6:	4509                	li	a0,2
    3ca8:	836ff06f          	j	2cde <wj_usi_irqhandler>

00003cac <GPIO0_IRQHandler>:
}

ATTRIBUTE_ISR void GPIO0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_gpio_irqhandler(0);
    3cac:	4501                	li	a0,0
    3cae:	b605                	j	37ce <wj_oip_gpio_irqhandler>

00003cb0 <mdelay>:
    }
}

void mdelay(uint32_t ms)
{
    if (ms == 0) {
    3cb0:	04050b63          	beqz	a0,3d06 <mdelay+0x56>
{
    3cb4:	1141                	addi	sp,sp,-16
    3cb6:	c422                	sw	s0,8(sp)
    3cb8:	c606                	sw	ra,12(sp)
    3cba:	c226                	sw	s1,4(sp)
    3cbc:	fff50413          	addi	s0,a0,-1
  \brief   get CORE timer reload value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_load(void)
{
    return CORET->LOAD;
    3cc0:	e000e6b7          	lui	a3,0xe000e
    3cc4:	4ac4                	lw	s1,20(a3)
  \brief   get CORE timer counter value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_value(void)
{
    return CORET->VAL;
    3cc6:	4e98                	lw	a4,24(a3)
    3cc8:	c03a                	sw	a4,0(sp)
    uint32_t cnt = (drv_get_sys_freq() / 1000);
    3cca:	20b1                	jal	3d16 <drv_get_sys_freq>
    3ccc:	3e800793          	li	a5,1000
    3cd0:	02f54533          	div	a0,a0,a5
            if (load - cur + start > cnt) {
    3cd4:	4702                	lw	a4,0(sp)
    3cd6:	e000e6b7          	lui	a3,0xe000e
    3cda:	94ba                	add	s1,s1,a4
    3cdc:	4e9c                	lw	a5,24(a3)
        if (start > cur) {
    3cde:	00e7ff63          	bgeu	a5,a4,3cfc <mdelay+0x4c>
            if (start - cur >= cnt) {
    3ce2:	40f707b3          	sub	a5,a4,a5
    3ce6:	fea7ebe3          	bltu	a5,a0,3cdc <mdelay+0x2c>
    3cea:	147d                	addi	s0,s0,-1
        return;
    }

    while (ms--) {
    3cec:	57fd                	li	a5,-1
    3cee:	fcf41be3          	bne	s0,a5,3cc4 <mdelay+0x14>
        _mdelay();
    }
}
    3cf2:	40b2                	lw	ra,12(sp)
    3cf4:	4422                	lw	s0,8(sp)
    3cf6:	4492                	lw	s1,4(sp)
    3cf8:	0141                	addi	sp,sp,16
    3cfa:	8082                	ret
            if (load - cur + start > cnt) {
    3cfc:	40f487b3          	sub	a5,s1,a5
    3d00:	fcf57ee3          	bgeu	a0,a5,3cdc <mdelay+0x2c>
    3d04:	b7dd                	j	3cea <mdelay+0x3a>
    3d06:	8082                	ret

00003d08 <drv_pinmux_config>:
#include <drv_gpio.h>

int32_t drv_pinmux_config(pin_name_e pin, pin_func_e pin_func)
{
    return 0;
}
    3d08:	4501                	li	a0,0
    3d0a:	8082                	ret

00003d0c <drv_pin_config_mode>:

int32_t drv_pin_config_mode(port_name_e port, uint8_t offset, gpio_mode_e pin_mode)
{
    return 0;
}
    3d0c:	4501                	li	a0,0
    3d0e:	8082                	ret

00003d10 <drv_get_usi_freq>:
    3d10:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3d14:	8082                	ret

00003d16 <drv_get_sys_freq>:
}

int32_t drv_get_sys_freq(void)
{
    return g_system_clock;
}
    3d16:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3d1a:	8082                	ret

00003d1c <drv_get_timer_freq>:
    3d1c:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3d20:	8082                	ret

00003d22 <SystemInit>:
  */
void SystemInit(void)
{
    int i;

    CLIC->CLICCFG = 0x4UL;
    3d22:	e000e737          	lui	a4,0xe000e
{
    3d26:	1151                	addi	sp,sp,-12
    CLIC->CLICCFG = 0x4UL;
    3d28:	10070713          	addi	a4,a4,256 # e000e100 <__heap_end+0xbffde100>
{
    3d2c:	c222                	sw	s0,4(sp)
    CLIC->CLICCFG = 0x4UL;
    3d2e:	7ff70793          	addi	a5,a4,2047
    3d32:	4691                	li	a3,4
{
    3d34:	c406                	sw	ra,8(sp)
    CLIC->CLICCFG = 0x4UL;
    3d36:	30d780a3          	sb	a3,769(a5)

    for (i = 0; i < 12; i++) {
        CLIC->INTIP[i] = 0;
    3d3a:	e000e437          	lui	s0,0xe000e
    for (i = 0; i < 12; i++) {
    3d3e:	4781                	li	a5,0
    3d40:	46b1                	li	a3,12
        CLIC->INTIP[i] = 0;
    3d42:	00f70633          	add	a2,a4,a5
    3d46:	00060023          	sb	zero,0(a2)
    for (i = 0; i < 12; i++) {
    3d4a:	0785                	addi	a5,a5,1
    3d4c:	fed79be3          	bne	a5,a3,3d42 <SystemInit+0x20>
    }

    drv_irq_enable(Machine_Software_IRQn);
    3d50:	450d                	li	a0,3
    3d52:	f13fe0ef          	jal	ra,2c64 <drv_irq_enable>
  \details Enables IRQ interrupts by setting the IE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_irq(void)
{
    __ASM volatile("csrs mstatus, 8");
    3d56:	30046073          	csrsi	mstatus,8
    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    3d5a:	3f75                	jal	3d16 <drv_get_sys_freq>
    3d5c:	06400793          	li	a5,100
    3d60:	02f54533          	div	a0,a0,a5
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
    3d64:	010007b7          	lui	a5,0x1000
    3d68:	157d                	addi	a0,a0,-1
    3d6a:	00f57763          	bgeu	a0,a5,3d78 <SystemInit+0x56>
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
    3d6e:	c848                	sw	a0,20(s0)
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    3d70:	00042c23          	sw	zero,24(s0) # e000e018 <__heap_end+0xbffde018>
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
    3d74:	479d                	li	a5,7
    3d76:	c81c                	sw	a5,16(s0)
#ifdef CONFIG_KERNEL_NONE
    _system_init_for_baremetal();
#else
    _system_init_for_kernel();
#endif
}
    3d78:	4412                	lw	s0,4(sp)
    3d7a:	40a2                	lw	ra,8(sp)
    3d7c:	0131                	addi	sp,sp,12
    mm_heap_initialize();
    3d7e:	a469                	j	4008 <mm_heap_initialize>

00003d80 <trap_c>:
#include <csi_core.h>

void (*trap_c_callback)(void);

void trap_c(uint32_t *regs)
{
    3d80:	1131                	addi	sp,sp,-20
    3d82:	c622                	sw	s0,12(sp)
    3d84:	c806                	sw	ra,16(sp)
    3d86:	c426                	sw	s1,8(sp)
    3d88:	842a                	mv	s0,a0
 */
__ALWAYS_STATIC_INLINE uint32_t __get_MCAUSE(void)
{
    uint32_t result;

    __ASM volatile("csrr %0, mcause" : "=r"(result));
    3d8a:	342025f3          	csrr	a1,mcause
    int i;
    uint32_t vec = 0;

    vec = __get_MCAUSE() & 0x3FF;

    printf("CPU Exception: NO.%d", vec);
    3d8e:	651d                	lui	a0,0x7
    3d90:	3ff5f593          	andi	a1,a1,1023
    3d94:	7c050513          	addi	a0,a0,1984 # 77c0 <sg_usi_config+0x38>
    3d98:	2d1020ef          	jal	ra,6868 <printf>
    printf("\n");
    3d9c:	4529                	li	a0,10
    3d9e:	3e1020ef          	jal	ra,697e <putchar>

    for (i = 0; i < 15; i++) {
    3da2:	87a2                	mv	a5,s0
    3da4:	4481                	li	s1,0
        printf("x%d: %08x\t", i + 1, regs[i]);
    3da6:	4390                	lw	a2,0(a5)
    3da8:	c226                	sw	s1,4(sp)
    3daa:	c03e                	sw	a5,0(sp)
    3dac:	0485                	addi	s1,s1,1
    3dae:	679d                	lui	a5,0x7
    3db0:	7d878513          	addi	a0,a5,2008 # 77d8 <sg_usi_config+0x50>
    3db4:	85a6                	mv	a1,s1
    3db6:	2b3020ef          	jal	ra,6868 <printf>

        if ((i % 4) == 3) {
    3dba:	4712                	lw	a4,4(sp)
    3dbc:	468d                	li	a3,3
    3dbe:	4782                	lw	a5,0(sp)
    3dc0:	8b0d                	andi	a4,a4,3
    3dc2:	00d71663          	bne	a4,a3,3dce <trap_c+0x4e>
            printf("\n");
    3dc6:	4529                	li	a0,10
    3dc8:	3b7020ef          	jal	ra,697e <putchar>
    3dcc:	4782                	lw	a5,0(sp)
    for (i = 0; i < 15; i++) {
    3dce:	473d                	li	a4,15
    3dd0:	0791                	addi	a5,a5,4
    3dd2:	fce49ae3          	bne	s1,a4,3da6 <trap_c+0x26>
        }
    }

    printf("\n");
    3dd6:	4529                	li	a0,10
    3dd8:	3a7020ef          	jal	ra,697e <putchar>
    printf("mepc   : %08x\n", regs[15]);
    3ddc:	5c4c                	lw	a1,60(s0)
    3dde:	651d                	lui	a0,0x7
    3de0:	7e450513          	addi	a0,a0,2020 # 77e4 <sg_usi_config+0x5c>
    3de4:	285020ef          	jal	ra,6868 <printf>
    printf("mstatus: %08x\n", regs[16]);
    3de8:	402c                	lw	a1,64(s0)
    3dea:	651d                	lui	a0,0x7
    3dec:	7f450513          	addi	a0,a0,2036 # 77f4 <sg_usi_config+0x6c>
    3df0:	279020ef          	jal	ra,6868 <printf>

    if (trap_c_callback) {
    3df4:	0141a783          	lw	a5,20(gp) # 200004fc <trap_c_callback>
    3df8:	c391                	beqz	a5,3dfc <trap_c+0x7c>
        trap_c_callback();
    3dfa:	9782                	jalr	a5
    }

    while (1);
    3dfc:	a001                	j	3dfc <trap_c+0x7c>

00003dfe <timer_cb_fun>:
static unsigned int Timer_LoopCount;    /* Count unit is 10 seconds */
static uint8_t timer_count_rise = 0;    /*1: timer cont increasing, 0: timer cont diminishing*/

static void timer_cb_fun(int32_t idx, timer_event_e event)
{
    if (TIMER_EVENT_TIMEOUT == event) {
    3dfe:	00059763          	bnez	a1,3e0c <timer_cb_fun+0xe>
        Timer_LoopCount++;
    3e02:	02018793          	addi	a5,gp,32 # 20000508 <Timer_LoopCount>
    3e06:	4398                	lw	a4,0(a5)
    3e08:	0705                	addi	a4,a4,1
    3e0a:	c398                	sw	a4,0(a5)
    }
}
    3e0c:	8082                	ret

00003e0e <clock_timer_init>:

    return (unsigned long long)(Timer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv - 1;
}

int clock_timer_init(void)
{
    3e0e:	1131                	addi	sp,sp,-20
    if (CLOCK_GETTIME_USE_TIMER_ID > CONFIG_TIMER_NUM) {
        return EPERM;
    }

    uint32_t timer_loadtimer;
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3e10:	6591                	lui	a1,0x4
{
    3e12:	c622                	sw	s0,12(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3e14:	dfe58593          	addi	a1,a1,-514 # 3dfe <timer_cb_fun>
    3e18:	4501                	li	a0,0
{
    3e1a:	c806                	sw	ra,16(sp)
    3e1c:	c426                	sw	s1,8(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3e1e:	02818413          	addi	s0,gp,40 # 20000510 <timer_handle>
    3e22:	31b5                	jal	3a8e <csi_timer_initialize>
    3e24:	c008                	sw	a0,0(s0)

    if (timer_handle == NULL) {
    3e26:	e901                	bnez	a0,3e36 <clock_timer_init+0x28>
        return -1;
    3e28:	54fd                	li	s1,-1
    if (cv2 > cv1) {
        timer_count_rise = 1;
    }

    return 0;
}
    3e2a:	40c2                	lw	ra,16(sp)
    3e2c:	4432                	lw	s0,12(sp)
    3e2e:	8526                	mv	a0,s1
    3e30:	44a2                	lw	s1,8(sp)
    3e32:	0151                	addi	sp,sp,20
    3e34:	8082                	ret
    APB_FREQ = drv_get_timer_freq(CLOCK_GETTIME_USE_TIMER_ID);
    3e36:	4501                	li	a0,0
    3e38:	35d5                	jal	3d1c <drv_get_timer_freq>
    3e3a:	00a1ac23          	sw	a0,24(gp) # 20000500 <APB_FREQ>
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e3e:	000f47b7          	lui	a5,0xf4
    3e42:	24078793          	addi	a5,a5,576 # f4240 <__ctor_end__+0xeb9e0>
    3e46:	02f55533          	divu	a0,a0,a5
    3e4a:	009894b7          	lui	s1,0x989
    3e4e:	68048493          	addi	s1,s1,1664 # 989680 <__ctor_end__+0x980e20>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3e52:	4585                	li	a1,1
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e54:	02950533          	mul	a0,a0,s1
    3e58:	00a1ae23          	sw	a0,28(gp) # 20000504 <TIMER_LOADCOUNT>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3e5c:	4008                	lw	a0,0(s0)
    3e5e:	39d1                	jal	3b32 <csi_timer_config>
    if (ret != 0) {
    3e60:	f561                	bnez	a0,3e28 <clock_timer_init+0x1a>
    ret = csi_timer_set_timeout(timer_handle, timer_loadtimer);
    3e62:	4008                	lw	a0,0(s0)
    3e64:	85a6                	mv	a1,s1
    3e66:	3b19                	jal	3b7c <csi_timer_set_timeout>
    3e68:	84aa                	mv	s1,a0
    if (ret != 0) {
    3e6a:	fd5d                	bnez	a0,3e28 <clock_timer_init+0x1a>
    csi_timer_get_current_value(timer_handle, &cv1);
    3e6c:	4008                	lw	a0,0(s0)
    3e6e:	858a                	mv	a1,sp
    3e70:	3bc1                	jal	3c40 <csi_timer_get_current_value>
    csi_timer_get_current_value(timer_handle, &cv2);
    3e72:	4008                	lw	a0,0(s0)
    3e74:	004c                	addi	a1,sp,4
    3e76:	33e9                	jal	3c40 <csi_timer_get_current_value>
    if (cv2 > cv1) {
    3e78:	4712                	lw	a4,4(sp)
    3e7a:	4782                	lw	a5,0(sp)
    3e7c:	fae7f7e3          	bgeu	a5,a4,3e2a <clock_timer_init+0x1c>
        timer_count_rise = 1;
    3e80:	4705                	li	a4,1
    3e82:	02e18223          	sb	a4,36(gp) # 2000050c <timer_count_rise>
    3e86:	b755                	j	3e2a <clock_timer_init+0x1c>

00003e88 <clock_timer_start>:
}

int clock_timer_start(void)
{
    int ret = -1;
    Timer_LoopCount = 0;
    3e88:	0201a023          	sw	zero,32(gp) # 20000508 <Timer_LoopCount>

    ret = csi_timer_start(timer_handle);
    3e8c:	0281a503          	lw	a0,40(gp) # 20000510 <timer_handle>
{
    3e90:	1151                	addi	sp,sp,-12
    3e92:	c406                	sw	ra,8(sp)
    ret = csi_timer_start(timer_handle);
    3e94:	39ed                	jal	3b8e <csi_timer_start>
        (ts_begin.tv_sec * 1000000000 + ts_begin.tv_nsec);
    printf("clock_gettime() timing deviation is +%llu ns\n", error_margin_ns);
#endif

    return 0;
}
    3e96:	40a2                	lw	ra,8(sp)
    if (ret != 0) {
    3e98:	00a03533          	snez	a0,a0
}
    3e9c:	40a00533          	neg	a0,a0
    3ea0:	0131                	addi	sp,sp,12
    3ea2:	8082                	ret

00003ea4 <_init>:
extern int __ctor_start__;

typedef void (*func_ptr) (void);

CPP_WEAK void _init(void)
{
    3ea4:	1151                	addi	sp,sp,-12
    3ea6:	c222                	sw	s0,4(sp)
    3ea8:	c026                	sw	s1,0(sp)
    3eaa:	6425                	lui	s0,0x9
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3eac:	64a5                	lui	s1,0x9
{
    3eae:	c406                	sw	ra,8(sp)
    3eb0:	86040413          	addi	s0,s0,-1952 # 8860 <__ctor_end__>
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3eb4:	86048493          	addi	s1,s1,-1952 # 8860 <__ctor_end__>
    3eb8:	1471                	addi	s0,s0,-4
    3eba:	00947763          	bgeu	s0,s1,3ec8 <_init+0x24>
        (*p) ();
    }
}
    3ebe:	40a2                	lw	ra,8(sp)
    3ec0:	4412                	lw	s0,4(sp)
    3ec2:	4482                	lw	s1,0(sp)
    3ec4:	0131                	addi	sp,sp,12
    3ec6:	8082                	ret
        (*p) ();
    3ec8:	401c                	lw	a5,0(s0)
    3eca:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3ecc:	b7f5                	j	3eb8 <_init+0x14>

00003ece <_fini>:

CPP_WEAK void _fini(void)
{
    3ece:	1151                	addi	sp,sp,-12
    3ed0:	c222                	sw	s0,4(sp)
    3ed2:	c026                	sw	s1,0(sp)
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ed4:	6425                	lui	s0,0x9
    3ed6:	64a5                	lui	s1,0x9
{
    3ed8:	c406                	sw	ra,8(sp)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3eda:	86040413          	addi	s0,s0,-1952 # 8860 <__ctor_end__>
    3ede:	85c48493          	addi	s1,s1,-1956 # 885c <pad_line+0x71c>
    3ee2:	0084f763          	bgeu	s1,s0,3ef0 <_fini+0x22>
        (*p) ();
    }
}
    3ee6:	40a2                	lw	ra,8(sp)
    3ee8:	4412                	lw	s0,4(sp)
    3eea:	4482                	lw	s1,0(sp)
    3eec:	0131                	addi	sp,sp,12
    3eee:	8082                	ret
        (*p) ();
    3ef0:	401c                	lw	a5,0(s0)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ef2:	0411                	addi	s0,s0,4
        (*p) ();
    3ef4:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ef6:	b7f5                	j	3ee2 <_fini+0x14>

00003ef8 <fputc>:
{
    return 0;
}

int fputc(int ch, FILE *stream)
{
    3ef8:	1151                	addi	sp,sp,-12
    3efa:	c026                	sw	s1,0(sp)
    3efc:	84aa                	mv	s1,a0
    (void)stream;

    if (console_handle == NULL) {
    3efe:	02c1a503          	lw	a0,44(gp) # 20000514 <console_handle>
{
    3f02:	c406                	sw	ra,8(sp)
    3f04:	c222                	sw	s0,4(sp)
    if (console_handle == NULL) {
    3f06:	c505                	beqz	a0,3f2e <fputc+0x36>
    3f08:	02c18413          	addi	s0,gp,44 # 20000514 <console_handle>
        return -1;
    }

    if (ch == '\n') {
    3f0c:	47a9                	li	a5,10
    3f0e:	00f49563          	bne	s1,a5,3f18 <fputc+0x20>
        csi_usart_putchar(console_handle, '\r');
    3f12:	45b5                	li	a1,13
    3f14:	f52ff0ef          	jal	ra,3666 <csi_usart_putchar>
    }

    csi_usart_putchar(console_handle, ch);
    3f18:	4008                	lw	a0,0(s0)
    3f1a:	0ff4f593          	andi	a1,s1,255
    3f1e:	f48ff0ef          	jal	ra,3666 <csi_usart_putchar>

    return 0;
    3f22:	4501                	li	a0,0
}
    3f24:	40a2                	lw	ra,8(sp)
    3f26:	4412                	lw	s0,4(sp)
    3f28:	4482                	lw	s1,0(sp)
    3f2a:	0131                	addi	sp,sp,12
    3f2c:	8082                	ret
        return -1;
    3f2e:	557d                	li	a0,-1
    3f30:	bfd5                	j	3f24 <fputc+0x2c>

00003f32 <os_critical_enter>:
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_suspend();
#endif

    return 0;
}
    3f32:	4501                	li	a0,0
    3f34:	8082                	ret

00003f36 <os_critical_exit>:
    3f36:	4501                	li	a0,0
    3f38:	8082                	ret

00003f3a <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    3f3a:	1151                	addi	sp,sp,-12
    3f3c:	c026                	sw	s1,0(sp)
    3f3e:	84aa                	mv	s1,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    3f40:	4188                	lw	a0,0(a1)
{
    3f42:	c222                	sw	s0,4(sp)
    3f44:	c406                	sw	ra,8(sp)
    3f46:	842e                	mv	s0,a1
  int ndx = mm_size2ndx(node->size);
    3f48:	20cd                	jal	402a <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    3f4a:	0505                	addi	a0,a0,1
    3f4c:	0512                	slli	a0,a0,0x4
    3f4e:	00850713          	addi	a4,a0,8
    3f52:	9726                	add	a4,a4,s1
    3f54:	94aa                	add	s1,s1,a0
    3f56:	489c                	lw	a5,16(s1)
    3f58:	c791                	beqz	a5,3f64 <mm_addfreechunk+0x2a>
       next && next->size && next->size < node->size;
    3f5a:	4394                	lw	a3,0(a5)
    3f5c:	c681                	beqz	a3,3f64 <mm_addfreechunk+0x2a>
    3f5e:	4010                	lw	a2,0(s0)
    3f60:	00c6ec63          	bltu	a3,a2,3f78 <mm_addfreechunk+0x3e>
       prev = next, next = next->flink);

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    3f64:	c700                	sw	s0,8(a4)
  node->blink = prev;
    3f66:	c458                	sw	a4,12(s0)
  node->flink = next;
    3f68:	c41c                	sw	a5,8(s0)

  if (next)
    3f6a:	c391                	beqz	a5,3f6e <mm_addfreechunk+0x34>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    3f6c:	c7c0                	sw	s0,12(a5)
    }
}
    3f6e:	40a2                	lw	ra,8(sp)
    3f70:	4412                	lw	s0,4(sp)
    3f72:	4482                	lw	s1,0(sp)
    3f74:	0131                	addi	sp,sp,12
    3f76:	8082                	ret
       prev = next, next = next->flink);
    3f78:	873e                	mv	a4,a5
    3f7a:	479c                	lw	a5,8(a5)
    3f7c:	bff1                	j	3f58 <mm_addfreechunk+0x1e>

00003f7e <mm_addregion>:

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3f7e:	00f58713          	addi	a4,a1,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3f82:	962e                	add	a2,a2,a1

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    3f84:	454c                	lw	a1,12(a0)
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3f86:	9b41                	andi	a4,a4,-16
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3f88:	9a41                	andi	a2,a2,-16
  heapsize = heapend - heapbase;
    3f8a:	40e607b3          	sub	a5,a2,a4
  heap->mm_heapsize += heapsize;
    3f8e:	95be                	add	a1,a1,a5
    3f90:	c54c                	sw	a1,12(a0)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    3f92:	c918                	sw	a4,16(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3f94:	4321                	li	t1,8
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3f96:	800002b7          	lui	t0,0x80000

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3f9a:	17c1                	addi	a5,a5,-16
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3f9c:	00572223          	sw	t0,4(a4)
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3fa0:	c71c                	sw	a5,8(a4)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3fa2:	00672023          	sw	t1,0(a4)
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    3fa6:	00672623          	sw	t1,12(a4)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    3faa:	00870593          	addi	a1,a4,8

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    3fae:	ff860713          	addi	a4,a2,-8
    3fb2:	c958                	sw	a4,20(a0)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    3fb4:	fe662c23          	sw	t1,-8(a2)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3fb8:	0057e7b3          	or	a5,a5,t0
    3fbc:	c35c                	sw	a5,4(a4)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    3fbe:	bfb5                	j	3f3a <mm_addfreechunk>

00003fc0 <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    3fc0:	1141                	addi	sp,sp,-16
    3fc2:	c422                	sw	s0,8(sp)
    3fc4:	c226                	sw	s1,4(sp)
    3fc6:	c606                	sw	ra,12(sp)
    3fc8:	842a                	mv	s0,a0
    3fca:	c032                	sw	a2,0(sp)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    3fcc:	00052623          	sw	zero,12(a0)
{
    3fd0:	84ae                	mv	s1,a1
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    3fd2:	13000613          	li	a2,304
    3fd6:	4581                	li	a1,0
    3fd8:	0561                	addi	a0,a0,24
    3fda:	ad2fe0ef          	jal	ra,22ac <memset>
  for (i = 1; i < MM_NNODES; i++)
    3fde:	4702                	lw	a4,0(sp)
    3fe0:	02840793          	addi	a5,s0,40
    3fe4:	14840693          	addi	a3,s0,328
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3fe8:	ff078613          	addi	a2,a5,-16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    3fec:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3ff0:	c7d0                	sw	a2,12(a5)
  for (i = 1; i < MM_NNODES; i++)
    3ff2:	07c1                	addi	a5,a5,16
    3ff4:	fed79ae3          	bne	a5,a3,3fe8 <mm_initialize+0x28>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    3ff8:	8522                	mv	a0,s0
}
    3ffa:	4422                	lw	s0,8(sp)
    3ffc:	40b2                	lw	ra,12(sp)
  mm_addregion(heap, heapstart, heapsize);
    3ffe:	85a6                	mv	a1,s1
}
    4000:	4492                	lw	s1,4(sp)
  mm_addregion(heap, heapstart, heapsize);
    4002:	863a                	mv	a2,a4
}
    4004:	0141                	addi	sp,sp,16
  mm_addregion(heap, heapstart, heapsize);
    4006:	bfa5                	j	3f7e <mm_addregion>

00004008 <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    4008:	200025b7          	lui	a1,0x20002
    400c:	200307b7          	lui	a5,0x20030
    4010:	29058613          	addi	a2,a1,656 # 20002290 <__bss_end__>
    4014:	00078793          	mv	a5,a5
    4018:	20002537          	lui	a0,0x20002
    401c:	40c78633          	sub	a2,a5,a2
    4020:	29058593          	addi	a1,a1,656
    4024:	cf050513          	addi	a0,a0,-784 # 20001cf0 <g_mmheap>
    4028:	bf61                	j	3fc0 <mm_initialize>

0000402a <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
    402a:	004007b7          	lui	a5,0x400
    402e:	00f57c63          	bgeu	a0,a5,4046 <mm_size2ndx+0x1c>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
    4032:	00455793          	srli	a5,a0,0x4
  while (size > 1)
    4036:	4705                	li	a4,1
  int ndx = 0;
    4038:	4501                	li	a0,0
  while (size > 1)
    403a:	00f76363          	bltu	a4,a5,4040 <mm_size2ndx+0x16>
    403e:	8082                	ret
    {
      ndx++;
    4040:	0505                	addi	a0,a0,1
      size >>= 1;
    4042:	8385                	srli	a5,a5,0x1
    4044:	bfdd                	j	403a <mm_size2ndx+0x10>
       return MM_NNODES-1;
    4046:	4549                	li	a0,18
    }

  return ndx;
}
    4048:	8082                	ret

0000404a <sd_test>:
{
	UINT bw;
	FRESULT fr;


	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */
    404a:	65a1                	lui	a1,0x8
    404c:	20002537          	lui	a0,0x20002
{
    4050:	1141                	addi	sp,sp,-16
	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */
    4052:	4601                	li	a2,0
    4054:	82c58593          	addi	a1,a1,-2004 # 782c <sg_usi_config+0xa4>
    4058:	e3850513          	addi	a0,a0,-456 # 20001e38 <FatFs>
{
    405c:	c422                	sw	s0,8(sp)
    405e:	c606                	sw	ra,12(sp)
	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */
    4060:	4bc010ef          	jal	ra,551c <f_mount>

	fr = f_open(&Fil, "newfile.txt", FA_WRITE | FA_CREATE_ALWAYS);	/* Create a file */
    4064:	20002437          	lui	s0,0x20002
    4068:	65a1                	lui	a1,0x8
    406a:	4629                	li	a2,10
    406c:	80458593          	addi	a1,a1,-2044 # 7804 <sg_usi_config+0x7c>
    4070:	06840513          	addi	a0,s0,104 # 20002068 <Fil>
    4074:	4fa010ef          	jal	ra,556e <f_open>
	if (fr == FR_OK) {
    4078:	e905                	bnez	a0,40a8 <sd_test+0x5e>
		f_write(&Fil, "It works!\r\n", 11, &bw);	/* Write data to the file */
    407a:	65a1                	lui	a1,0x8
    407c:	868a                	mv	a3,sp
    407e:	462d                	li	a2,11
    4080:	81058593          	addi	a1,a1,-2032 # 7810 <sg_usi_config+0x88>
    4084:	06840513          	addi	a0,s0,104
    4088:	706010ef          	jal	ra,578e <f_write>
		fr = f_close(&Fil);							/* Close the file */
    408c:	06840513          	addi	a0,s0,104
    4090:	19b010ef          	jal	ra,5a2a <f_close>
		if (fr == FR_OK && bw == 11) {		
    4094:	e911                	bnez	a0,40a8 <sd_test+0x5e>
    4096:	4702                	lw	a4,0(sp)
    4098:	47ad                	li	a5,11
    409a:	00f71763          	bne	a4,a5,40a8 <sd_test+0x5e>
			printf("sd card success\r\n");
    409e:	6521                	lui	a0,0x8
    40a0:	81c50513          	addi	a0,a0,-2020 # 781c <sg_usi_config+0x94>
    40a4:	0f1020ef          	jal	ra,6994 <puts>
		}
	}
    40a8:	40b2                	lw	ra,12(sp)
    40aa:	4422                	lw	s0,8(sp)
    40ac:	0141                	addi	sp,sp,16
    40ae:	8082                	ret

000040b0 <main>:
{
    40b0:	1151                	addi	sp,sp,-12
    40b2:	c222                	sw	s0,4(sp)
    printf("Hello World!\n");
    40b4:	6421                	lui	s0,0x8
    40b6:	83040513          	addi	a0,s0,-2000 # 7830 <sg_usi_config+0xa8>
{
    40ba:	c406                	sw	ra,8(sp)
    printf("Hello World!\n");
    40bc:	0d9020ef          	jal	ra,6994 <puts>
    key_gpio_intr(PA8);
    40c0:	4521                	li	a0,8
    40c2:	2871                	jal	415e <key_gpio_intr>
    LED_Init();
    40c4:	206d                	jal	416e <LED_Init>
    OLED_SHOW();
    40c6:	578000ef          	jal	ra,463e <OLED_SHOW>
    sd_test();
    40ca:	3741                	jal	404a <sd_test>
        LED_ON();
    40cc:	2239                	jal	41da <LED_ON>
        mdelay(500);
    40ce:	1f400513          	li	a0,500
    40d2:	3ef9                	jal	3cb0 <mdelay>
		printf("Hello World!\n");
    40d4:	83040513          	addi	a0,s0,-2000
    40d8:	0bd020ef          	jal	ra,6994 <puts>
        LED_OFF();
    40dc:	2215                	jal	4200 <LED_OFF>
        mdelay(500);
    40de:	1f400513          	li	a0,500
    40e2:	36f9                	jal	3cb0 <mdelay>
    while(1)
    40e4:	b7e5                	j	40cc <main+0x1c>

000040e6 <gpio_interrupt_handler>:
#include "drv_gpio.h"
#include "key.h"

gpio_pin_handle_t pin = NULL;
static void gpio_interrupt_handler(int32_t idx)
{
    40e6:	1151                	addi	sp,sp,-12
    printf("gpio interrupt is triggled\n");
    40e8:	6521                	lui	a0,0x8
{
    40ea:	c222                	sw	s0,4(sp)
    printf("gpio interrupt is triggled\n");
    40ec:	84050513          	addi	a0,a0,-1984 # 7840 <sg_usi_config+0xb8>
{
    40f0:	c406                	sw	ra,8(sp)
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 0);
    40f2:	03018413          	addi	s0,gp,48 # 20000518 <pin>
    printf("gpio interrupt is triggled\n");
    40f6:	09f020ef          	jal	ra,6994 <puts>
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 0);
    40fa:	4008                	lw	a0,0(s0)
    40fc:	4601                	li	a2,0
    40fe:	4585                	li	a1,1
    4100:	8c5ff0ef          	jal	ra,39c4 <csi_gpio_pin_set_irq>
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    4104:	4008                	lw	a0,0(s0)
}
    4106:	4412                	lw	s0,4(sp)
    4108:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    410a:	4605                	li	a2,1
    410c:	4585                	li	a1,1
}
    410e:	0131                	addi	sp,sp,12
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    4110:	8b5ff06f          	j	39c4 <csi_gpio_pin_set_irq>

00004114 <example_pin_gpio_init>:

void example_pin_gpio_init(void)
{
    drv_pinmux_config(EXAMPLE_GPIO_PIN, EXAMPLE_GPIO_PIN_FUNC);
    4114:	4581                	li	a1,0
    4116:	4505                	li	a0,1
    4118:	bec5                	j	3d08 <drv_pinmux_config>

0000411a <gpio_falling_edge_interrupt>:
}

void gpio_falling_edge_interrupt(pin_name_e gpio_pin)
{
    411a:	1151                	addi	sp,sp,-12
    411c:	c406                	sw	ra,8(sp)
    411e:	c222                	sw	s0,4(sp)
    4120:	842a                	mv	s0,a0
    

    example_pin_gpio_init();
    4122:	3fcd                	jal	4114 <example_pin_gpio_init>

    printf("press the center button will triggle the gpio interrupt \n");
    4124:	6521                	lui	a0,0x8
    4126:	85c50513          	addi	a0,a0,-1956 # 785c <sg_usi_config+0xd4>
    412a:	06b020ef          	jal	ra,6994 <puts>
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);
    412e:	6591                	lui	a1,0x4
    4130:	0e658593          	addi	a1,a1,230 # 40e6 <gpio_interrupt_handler>
    4134:	8522                	mv	a0,s0
    4136:	f5eff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    413a:	03018413          	addi	s0,gp,48 # 20000518 <pin>

    csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    413e:	4581                	li	a1,0
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);
    4140:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    4142:	fb2ff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    4146:	4008                	lw	a0,0(s0)
    4148:	4581                	li	a1,0
    414a:	fc2ff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    414e:	4008                	lw	a0,0(s0)
}
    4150:	4412                	lw	s0,4(sp)
    4152:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    4154:	4605                	li	a2,1
    4156:	4585                	li	a1,1
}
    4158:	0131                	addi	sp,sp,12
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    415a:	86bff06f          	j	39c4 <csi_gpio_pin_set_irq>

0000415e <key_gpio_intr>:

RETURN: NULL

*****************************************************************************/
int key_gpio_intr(pin_name_e gpio_pin)
{
    415e:	1151                	addi	sp,sp,-12
    4160:	c406                	sw	ra,8(sp)
    gpio_falling_edge_interrupt(gpio_pin);
    4162:	3f65                	jal	411a <gpio_falling_edge_interrupt>
    return 0;
}
    4164:	40a2                	lw	ra,8(sp)
    4166:	4501                	li	a0,0
    4168:	0131                	addi	sp,sp,12
    416a:	8082                	ret

0000416c <gpio_interrupt_handler>:
extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}
    416c:	8082                	ret

0000416e <LED_Init>:

void LED_Init()
{	
    416e:	1151                	addi	sp,sp,-12
    4170:	c026                	sw	s1,0(sp)
	int32_t ret;		
																					
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    4172:	6491                	lui	s1,0x4
    4174:	16c48593          	addi	a1,s1,364 # 416c <gpio_interrupt_handler>
    4178:	4501                	li	a0,0
{	
    417a:	c406                	sw	ra,8(sp)
    417c:	c222                	sw	s0,4(sp)
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    417e:	f16ff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    4182:	03418413          	addi	s0,gp,52 # 2000051c <led1_pin_handle_t>
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    4186:	4581                	li	a1,0
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    4188:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    418a:	f6aff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led1_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    418e:	4008                	lw	a0,0(s0)
    4190:	4585                	li	a1,1
    4192:	f7aff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>

    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    4196:	16c48593          	addi	a1,s1,364
    419a:	4505                	li	a0,1
    419c:	ef8ff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    41a0:	03818413          	addi	s0,gp,56 # 20000520 <led2_pin_handle_t>
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    41a4:	4581                	li	a1,0
    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    41a6:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    41a8:	f4cff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led2_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    41ac:	4008                	lw	a0,0(s0)
    41ae:	4585                	li	a1,1
    41b0:	f5cff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>

    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    41b4:	16c48593          	addi	a1,s1,364
    41b8:	4509                	li	a0,2
    41ba:	edaff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    41be:	03c18413          	addi	s0,gp,60 # 20000524 <led3_pin_handle_t>
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    41c2:	4581                	li	a1,0
    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    41c4:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    41c6:	f2eff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    41ca:	4008                	lw	a0,0(s0)
}
    41cc:	4412                	lw	s0,4(sp)
    41ce:	40a2                	lw	ra,8(sp)
    41d0:	4482                	lw	s1,0(sp)
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    41d2:	4585                	li	a1,1
}
    41d4:	0131                	addi	sp,sp,12
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    41d6:	f36ff06f          	j	390c <csi_gpio_pin_config_direction>

000041da <LED_ON>:

void LED_ON()
{
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    41da:	0341a503          	lw	a0,52(gp) # 2000051c <led1_pin_handle_t>
{
    41de:	1151                	addi	sp,sp,-12
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    41e0:	4585                	li	a1,1
{
    41e2:	c406                	sw	ra,8(sp)
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    41e4:	f5aff0ef          	jal	ra,393e <csi_gpio_pin_write>
    csi_gpio_pin_write(led2_pin_handle_t,1);	
    41e8:	0381a503          	lw	a0,56(gp) # 20000520 <led2_pin_handle_t>
    41ec:	4585                	li	a1,1
    41ee:	f50ff0ef          	jal	ra,393e <csi_gpio_pin_write>
    csi_gpio_pin_write(led3_pin_handle_t,1);	
}
    41f2:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(led3_pin_handle_t,1);	
    41f4:	03c1a503          	lw	a0,60(gp) # 20000524 <led3_pin_handle_t>
    41f8:	4585                	li	a1,1
}
    41fa:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(led3_pin_handle_t,1);	
    41fc:	f42ff06f          	j	393e <csi_gpio_pin_write>

00004200 <LED_OFF>:

void LED_OFF()
{
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    4200:	0341a503          	lw	a0,52(gp) # 2000051c <led1_pin_handle_t>
{
    4204:	1151                	addi	sp,sp,-12
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    4206:	4581                	li	a1,0
{
    4208:	c406                	sw	ra,8(sp)
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    420a:	f34ff0ef          	jal	ra,393e <csi_gpio_pin_write>
    csi_gpio_pin_write(led2_pin_handle_t,0);	
    420e:	0381a503          	lw	a0,56(gp) # 20000520 <led2_pin_handle_t>
    4212:	4581                	li	a1,0
    4214:	f2aff0ef          	jal	ra,393e <csi_gpio_pin_write>
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    4218:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    421a:	03c1a503          	lw	a0,60(gp) # 20000524 <led3_pin_handle_t>
    421e:	4581                	li	a1,0
    4220:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    4222:	f1cff06f          	j	393e <csi_gpio_pin_write>

00004226 <gpio_interrupt_handler>:
extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}
    4226:	8082                	ret

00004228 <OLED_WR_Byte>:
		}
}


void OLED_WR_Byte(char dat,char cmd)
{	
    4228:	1141                	addi	sp,sp,-16
    422a:	c422                	sw	s0,8(sp)
    422c:	842a                	mv	s0,a0
	char i;			  
	if(cmd)
	  OLED_DC_Set();
    422e:	0401a503          	lw	a0,64(gp) # 20000528 <OLED_dc_pin_handle_t>
    4232:	04018793          	addi	a5,gp,64 # 20000528 <OLED_dc_pin_handle_t>
{	
    4236:	c606                	sw	ra,12(sp)
    4238:	c226                	sw	s1,4(sp)
    423a:	c03e                	sw	a5,0(sp)
	if(cmd)
    423c:	c191                	beqz	a1,4240 <OLED_WR_Byte+0x18>
	  OLED_DC_Set();
    423e:	4585                	li	a1,1
	else 
	  OLED_DC_Clr();		  
    4240:	efeff0ef          	jal	ra,393e <csi_gpio_pin_write>
{	
    4244:	44a1                	li	s1,8
	for(i=0;i<8;i++)
	{			  
		OLED_SCL_Clr();
    4246:	0481a503          	lw	a0,72(gp) # 20000530 <OLED_scl_pin_handle_t>
    424a:	4581                	li	a1,0
    424c:	ef2ff0ef          	jal	ra,393e <csi_gpio_pin_write>
		if(dat&0x80)
    4250:	01841713          	slli	a4,s0,0x18
    4254:	8761                	srai	a4,a4,0x18
    4256:	04c18793          	addi	a5,gp,76 # 20000534 <OLED_sda_pin_handle_t>
		{
		 OLED_SDA_Set();
    425a:	4585                	li	a1,1
		if(dat&0x80)
    425c:	00074363          	bltz	a4,4262 <OLED_WR_Byte+0x3a>
		}
		else
		{
		 OLED_SDA_Clr();
    4260:	4581                	li	a1,0
    4262:	4388                	lw	a0,0(a5)
	for(i=0;i<8;i++)
    4264:	14fd                	addi	s1,s1,-1
		}
	  OLED_SCL_Set();
		dat<<=1;   
    4266:	0406                	slli	s0,s0,0x1
		 OLED_SDA_Clr();
    4268:	ed6ff0ef          	jal	ra,393e <csi_gpio_pin_write>
	  OLED_SCL_Set();
    426c:	04818793          	addi	a5,gp,72 # 20000530 <OLED_scl_pin_handle_t>
    4270:	4388                	lw	a0,0(a5)
    4272:	4585                	li	a1,1
	for(i=0;i<8;i++)
    4274:	0ff4f493          	andi	s1,s1,255
	  OLED_SCL_Set();
    4278:	ec6ff0ef          	jal	ra,393e <csi_gpio_pin_write>
		dat<<=1;   
    427c:	0ff47413          	andi	s0,s0,255
	for(i=0;i<8;i++)
    4280:	f0f9                	bnez	s1,4246 <OLED_WR_Byte+0x1e>
	}				 		  
	OLED_DC_Set();   	  
    4282:	4782                	lw	a5,0(sp)
} 
    4284:	4422                	lw	s0,8(sp)
    4286:	40b2                	lw	ra,12(sp)
    4288:	4492                	lw	s1,4(sp)
	OLED_DC_Set();   	  
    428a:	4388                	lw	a0,0(a5)
    428c:	4585                	li	a1,1
} 
    428e:	0141                	addi	sp,sp,16
	OLED_DC_Set();   	  
    4290:	eaeff06f          	j	393e <csi_gpio_pin_write>

00004294 <OLED_ColorTurn>:
	if(i==0)
    4294:	e509                	bnez	a0,429e <OLED_ColorTurn+0xa>
			OLED_WR_Byte(0xA6,OLED_CMD);//正常显示
    4296:	4581                	li	a1,0
    4298:	0a600513          	li	a0,166
			OLED_WR_Byte(0xA7,OLED_CMD);//反色显示
    429c:	b771                	j	4228 <OLED_WR_Byte>
	if(i==1)
    429e:	4785                	li	a5,1
    42a0:	00f51663          	bne	a0,a5,42ac <OLED_ColorTurn+0x18>
			OLED_WR_Byte(0xA7,OLED_CMD);//反色显示
    42a4:	4581                	li	a1,0
    42a6:	0a700513          	li	a0,167
    42aa:	bfcd                	j	429c <OLED_ColorTurn+0x8>
}
    42ac:	8082                	ret

000042ae <OLED_DisplayTurn.part.0>:
void OLED_DisplayTurn(char i)
    42ae:	1151                	addi	sp,sp,-12
			OLED_WR_Byte(0xC0,OLED_CMD);//反转显示
    42b0:	4581                	li	a1,0
    42b2:	0c000513          	li	a0,192
void OLED_DisplayTurn(char i)
    42b6:	c406                	sw	ra,8(sp)
			OLED_WR_Byte(0xC0,OLED_CMD);//反转显示
    42b8:	3f85                	jal	4228 <OLED_WR_Byte>
}
    42ba:	40a2                	lw	ra,8(sp)
			OLED_WR_Byte(0xA0,OLED_CMD);
    42bc:	4581                	li	a1,0
    42be:	0a000513          	li	a0,160
}
    42c2:	0131                	addi	sp,sp,12
			OLED_WR_Byte(0xA0,OLED_CMD);
    42c4:	b795                	j	4228 <OLED_WR_Byte>

000042c6 <OLED_Set_Pos>:

//坐标设置

void OLED_Set_Pos(char x, char y) 
{
    42c6:	1151                	addi	sp,sp,-12
    42c8:	c222                	sw	s0,4(sp)
    42ca:	842a                	mv	s0,a0
	OLED_WR_Byte(0xb0+y,OLED_CMD);
    42cc:	fb058513          	addi	a0,a1,-80
    42d0:	0ff57513          	andi	a0,a0,255
    42d4:	4581                	li	a1,0
{
    42d6:	c406                	sw	ra,8(sp)
	OLED_WR_Byte(0xb0+y,OLED_CMD);
    42d8:	3f81                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
    42da:	00445513          	srli	a0,s0,0x4
    42de:	4581                	li	a1,0
    42e0:	01056513          	ori	a0,a0,16
    42e4:	3791                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte((x&0x0f),OLED_CMD);
    42e6:	00f47513          	andi	a0,s0,15
}   	  
    42ea:	4412                	lw	s0,4(sp)
    42ec:	40a2                	lw	ra,8(sp)
	OLED_WR_Byte((x&0x0f),OLED_CMD);
    42ee:	4581                	li	a1,0
}   	  
    42f0:	0131                	addi	sp,sp,12
	OLED_WR_Byte((x&0x0f),OLED_CMD);
    42f2:	bf1d                	j	4228 <OLED_WR_Byte>

000042f4 <OLED_Clear>:
	OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
	OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
}		   			 
//清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!	  
void OLED_Clear(void)  
{  
    42f4:	1151                	addi	sp,sp,-12
    42f6:	c222                	sw	s0,4(sp)
    42f8:	c406                	sw	ra,8(sp)
    42fa:	c026                	sw	s1,0(sp)
    42fc:	0b000413          	li	s0,176
	char i,n;		    
	for(i=0;i<4;i++)  
	{  
		OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
    4300:	4581                	li	a1,0
    4302:	8522                	mv	a0,s0
    4304:	3715                	jal	4228 <OLED_WR_Byte>
		OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
    4306:	4581                	li	a1,0
    4308:	4501                	li	a0,0
    430a:	3f39                	jal	4228 <OLED_WR_Byte>
		OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址   
    430c:	4581                	li	a1,0
    430e:	4541                	li	a0,16
    4310:	3f21                	jal	4228 <OLED_WR_Byte>
    4312:	08000493          	li	s1,128
		for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA); 
    4316:	14fd                	addi	s1,s1,-1
    4318:	4585                	li	a1,1
    431a:	4501                	li	a0,0
    431c:	0ff4f493          	andi	s1,s1,255
    4320:	3721                	jal	4228 <OLED_WR_Byte>
    4322:	f8f5                	bnez	s1,4316 <OLED_Clear+0x22>
	for(i=0;i<4;i++)  
    4324:	0405                	addi	s0,s0,1
    4326:	0ff47413          	andi	s0,s0,255
    432a:	0b400793          	li	a5,180
    432e:	fcf419e3          	bne	s0,a5,4300 <OLED_Clear+0xc>
	} //更新显示
}
    4332:	40a2                	lw	ra,8(sp)
    4334:	4412                	lw	s0,4(sp)
    4336:	4482                	lw	s1,0(sp)
    4338:	0131                	addi	sp,sp,12
    433a:	8082                	ret

0000433c <OLED_ShowChar>:
//在指定位置显示一个字符,包括部分字符
//x:0~127
//y:0~63				 
//sizey:选择字体 6x8  8x16
void OLED_ShowChar(char x,char y,char chr,char sizey)
{      	
    433c:	fd810113          	addi	sp,sp,-40
	char c=0,sizex=sizey/2;
    4340:	0016d793          	srli	a5,a3,0x1
	u16 i=0,size1;
	if(sizey==8)size1=6;
    4344:	4719                	li	a4,6
{      	
    4346:	d022                	sw	s0,32(sp)
    4348:	ce26                	sw	s1,28(sp)
	char c=0,sizex=sizey/2;
    434a:	c63e                	sw	a5,12(sp)
{      	
    434c:	d206                	sw	ra,36(sp)
    434e:	c42a                	sw	a0,8(sp)
    4350:	c02e                	sw	a1,0(sp)
	if(sizey==8)size1=6;
    4352:	47a1                	li	a5,8
    4354:	c23a                	sw	a4,4(sp)
{      	
    4356:	84b2                	mv	s1,a2
    4358:	8436                	mv	s0,a3
	if(sizey==8)size1=6;
    435a:	00f68e63          	beq	a3,a5,4376 <OLED_ShowChar+0x3a>
	else size1=(sizey/8+((sizey%8)?1:0))*(sizey/2);
    435e:	0076f793          	andi	a5,a3,7
    4362:	0036d713          	srli	a4,a3,0x3
    4366:	00f037b3          	snez	a5,a5
    436a:	97ba                	add	a5,a5,a4
    436c:	0016d713          	srli	a4,a3,0x1
    4370:	02e787b3          	mul	a5,a5,a4
    4374:	c23e                	sw	a5,4(sp)
	c=chr-' ';//得到偏移后的值
	OLED_Set_Pos(x,y);
    4376:	4582                	lw	a1,0(sp)
    4378:	4522                	lw	a0,8(sp)
    437a:	37b1                	jal	42c6 <OLED_Set_Pos>
	c=chr-' ';//得到偏移后的值
    437c:	fe048613          	addi	a2,s1,-32
    4380:	0ff67613          	andi	a2,a2,255
    4384:	4799                	li	a5,6
    4386:	02f607b3          	mul	a5,a2,a5
	for(i=0;i<size1;i++)
    438a:	4481                	li	s1,0
    438c:	ca3e                	sw	a5,20(sp)
    438e:	00461793          	slli	a5,a2,0x4
    4392:	c83e                	sw	a5,16(sp)
    4394:	4792                	lw	a5,4(sp)
    4396:	00f49863          	bne	s1,a5,43a6 <OLED_ShowChar+0x6a>
		if(sizey==8) OLED_WR_Byte(asc2_0806[c][i],OLED_DATA);//6X8字号
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
//		else if(sizey==xx) OLED_WR_Byte(asc2_xxxx[c][i],OLED_DATA);//用户添加字号
		else return;
	}
}
    439a:	5092                	lw	ra,36(sp)
    439c:	5402                	lw	s0,32(sp)
    439e:	44f2                	lw	s1,28(sp)
    43a0:	02810113          	addi	sp,sp,40
    43a4:	8082                	ret
		if(i%sizex==0&&sizey!=8) OLED_Set_Pos(x,y++);
    43a6:	47b2                	lw	a5,12(sp)
    43a8:	02f4f733          	remu	a4,s1,a5
    43ac:	eb0d                	bnez	a4,43de <OLED_ShowChar+0xa2>
    43ae:	4721                	li	a4,8
    43b0:	02e40a63          	beq	s0,a4,43e4 <OLED_ShowChar+0xa8>
    43b4:	4782                	lw	a5,0(sp)
    43b6:	4522                	lw	a0,8(sp)
    43b8:	00178713          	addi	a4,a5,1 # 400001 <__ctor_end__+0x3f77a1>
    43bc:	0ff77713          	andi	a4,a4,255
    43c0:	85be                	mv	a1,a5
    43c2:	cc3a                	sw	a4,24(sp)
    43c4:	3709                	jal	42c6 <OLED_Set_Pos>
    43c6:	4762                	lw	a4,24(sp)
    43c8:	c03a                	sw	a4,0(sp)
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
    43ca:	4741                	li	a4,16
    43cc:	fce417e3          	bne	s0,a4,439a <OLED_ShowChar+0x5e>
    43d0:	67a1                	lui	a5,0x8
    43d2:	aec78713          	addi	a4,a5,-1300 # 7aec <asc2_1608>
    43d6:	47c2                	lw	a5,16(sp)
    43d8:	00f48633          	add	a2,s1,a5
    43dc:	a811                	j	43f0 <OLED_ShowChar+0xb4>
		if(sizey==8) OLED_WR_Byte(asc2_0806[c][i],OLED_DATA);//6X8字号
    43de:	4721                	li	a4,8
    43e0:	fee415e3          	bne	s0,a4,43ca <OLED_ShowChar+0x8e>
    43e4:	47d2                	lw	a5,20(sp)
    43e6:	6621                	lui	a2,0x8
    43e8:	8c460613          	addi	a2,a2,-1852 # 78c4 <asc2_0806>
    43ec:	00f48733          	add	a4,s1,a5
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
    43f0:	9732                	add	a4,a4,a2
    43f2:	00074503          	lbu	a0,0(a4)
    43f6:	4585                	li	a1,1
	for(i=0;i<size1;i++)
    43f8:	0485                	addi	s1,s1,1
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
    43fa:	353d                	jal	4228 <OLED_WR_Byte>
	for(i=0;i<size1;i++)
    43fc:	bf61                	j	4394 <OLED_ShowChar+0x58>

000043fe <OLED_ShowString>:
	 	OLED_ShowChar(x+(sizey/2+m)*t,y,temp+'0',sizey);
	}
} 
//显示一个字符号串
void OLED_ShowString(char x,char y,char *chr,char sizey)
{
    43fe:	1111                	addi	sp,sp,-28
    4400:	ca22                	sw	s0,20(sp)
    4402:	c826                	sw	s1,16(sp)
    4404:	cc06                	sw	ra,24(sp)
    4406:	842a                	mv	s0,a0
    4408:	87b2                	mv	a5,a2
	char j=0;
	while (chr[j]!='\0')
	{		
		OLED_ShowChar(x,y,chr[j++],sizey);
		if(sizey==8)x+=6;
		else x+=sizey/2;
    440a:	0016d713          	srli	a4,a3,0x1
	char j=0;
    440e:	4481                	li	s1,0
	while (chr[j]!='\0')
    4410:	00978633          	add	a2,a5,s1
    4414:	00064603          	lbu	a2,0(a2)
    4418:	e611                	bnez	a2,4424 <OLED_ShowString+0x26>
	}
}
    441a:	40e2                	lw	ra,24(sp)
    441c:	4452                	lw	s0,20(sp)
    441e:	44c2                	lw	s1,16(sp)
    4420:	0171                	addi	sp,sp,28
    4422:	8082                	ret
		OLED_ShowChar(x,y,chr[j++],sizey);
    4424:	8522                	mv	a0,s0
    4426:	c63e                	sw	a5,12(sp)
    4428:	c43a                	sw	a4,8(sp)
    442a:	c236                	sw	a3,4(sp)
    442c:	c02e                	sw	a1,0(sp)
    442e:	3739                	jal	433c <OLED_ShowChar>
		if(sizey==8)x+=6;
    4430:	4692                	lw	a3,4(sp)
		OLED_ShowChar(x,y,chr[j++],sizey);
    4432:	0485                	addi	s1,s1,1
		if(sizey==8)x+=6;
    4434:	4621                	li	a2,8
    4436:	4582                	lw	a1,0(sp)
    4438:	4722                	lw	a4,8(sp)
    443a:	47b2                	lw	a5,12(sp)
		OLED_ShowChar(x,y,chr[j++],sizey);
    443c:	0ff4f493          	andi	s1,s1,255
		if(sizey==8)x+=6;
    4440:	00c69663          	bne	a3,a2,444c <OLED_ShowString+0x4e>
    4444:	0419                	addi	s0,s0,6
		else x+=sizey/2;
    4446:	0ff47413          	andi	s0,s0,255
    444a:	b7d9                	j	4410 <OLED_ShowString+0x12>
    444c:	943a                	add	s0,s0,a4
    444e:	bfe5                	j	4446 <OLED_ShowString+0x48>

00004450 <OLED_Init>:
	printf("OLED_SPI_INIT \n");																   
    4450:	6521                	lui	a0,0x8


//refer to nexys video refference to see the power on sequence...
//初始化				    
void OLED_Init(void)
{   
    4452:	1151                	addi	sp,sp,-12
	printf("OLED_SPI_INIT \n");																   
    4454:	89850513          	addi	a0,a0,-1896 # 7898 <sg_usi_config+0x110>
{   
    4458:	c406                	sw	ra,8(sp)
    445a:	c222                	sw	s0,4(sp)
    445c:	c026                	sw	s1,0(sp)
	printf("OLED_SPI_INIT \n");																   
    445e:	536020ef          	jal	ra,6994 <puts>
    OLED_vdd_pin_handle_t = csi_gpio_pin_initialize(PA26, gpio_interrupt_handler);         //                         				            PA26
    4462:	6491                	lui	s1,0x4
    4464:	22648593          	addi	a1,s1,550 # 4226 <gpio_interrupt_handler>
    4468:	4569                	li	a0,26
    446a:	c2aff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    446e:	05418713          	addi	a4,gp,84 # 2000053c <OLED_vdd_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_vdd_pin_handle_t, GPIO_MODE_PULLNONE);
    4472:	4581                	li	a1,0
    OLED_vdd_pin_handle_t = csi_gpio_pin_initialize(PA26, gpio_interrupt_handler);         //                         				            PA26
    4474:	c308                	sw	a0,0(a4)
    csi_gpio_pin_config_mode(OLED_vdd_pin_handle_t, GPIO_MODE_PULLNONE);
    4476:	c7eff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_vdd_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    447a:	05418713          	addi	a4,gp,84 # 2000053c <OLED_vdd_pin_handle_t>
    447e:	4308                	lw	a0,0(a4)
    4480:	4585                	li	a1,1
    4482:	c8aff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    OLED_vbat_pin_handle_t = csi_gpio_pin_initialize(PA25, gpio_interrupt_handler);        //                         				            PA25    
    4486:	22648593          	addi	a1,s1,550
    448a:	4565                	li	a0,25
    448c:	c08ff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    4490:	05018793          	addi	a5,gp,80 # 20000538 <OLED_vbat_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_vbat_pin_handle_t, GPIO_MODE_PULLNONE);
    4494:	4581                	li	a1,0
    OLED_vbat_pin_handle_t = csi_gpio_pin_initialize(PA25, gpio_interrupt_handler);        //                         				            PA25    
    4496:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(OLED_vbat_pin_handle_t, GPIO_MODE_PULLNONE);
    4498:	c5cff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_vbat_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    449c:	05018693          	addi	a3,gp,80 # 20000538 <OLED_vbat_pin_handle_t>
    44a0:	4288                	lw	a0,0(a3)
    44a2:	4585                	li	a1,1
    OLED_res_pin_handle_t = csi_gpio_pin_initialize(PA22, gpio_interrupt_handler);         //                         				            PA22
    44a4:	04418413          	addi	s0,gp,68 # 2000052c <OLED_res_pin_handle_t>
    csi_gpio_pin_config_direction(OLED_vbat_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    44a8:	c64ff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    OLED_res_pin_handle_t = csi_gpio_pin_initialize(PA22, gpio_interrupt_handler);         //                         				            PA22
    44ac:	22648593          	addi	a1,s1,550
    44b0:	4559                	li	a0,22
    44b2:	be2ff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    csi_gpio_pin_config_mode(OLED_res_pin_handle_t, GPIO_MODE_PULLNONE);
    44b6:	4581                	li	a1,0
    OLED_res_pin_handle_t = csi_gpio_pin_initialize(PA22, gpio_interrupt_handler);         //                         				            PA22
    44b8:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(OLED_res_pin_handle_t, GPIO_MODE_PULLNONE);
    44ba:	c3aff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_res_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    44be:	4008                	lw	a0,0(s0)
    44c0:	4585                	li	a1,1
    44c2:	c4aff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    OLED_scl_pin_handle_t = csi_gpio_pin_initialize(PA23, gpio_interrupt_handler);        //                                                    PA23
    44c6:	22648593          	addi	a1,s1,550
    44ca:	455d                	li	a0,23
    44cc:	bc8ff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    44d0:	04818693          	addi	a3,gp,72 # 20000530 <OLED_scl_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_scl_pin_handle_t, GPIO_MODE_PULLNONE);
    44d4:	4581                	li	a1,0
    OLED_scl_pin_handle_t = csi_gpio_pin_initialize(PA23, gpio_interrupt_handler);        //                                                    PA23
    44d6:	c288                	sw	a0,0(a3)
    csi_gpio_pin_config_mode(OLED_scl_pin_handle_t, GPIO_MODE_PULLNONE);
    44d8:	c1cff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_scl_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    44dc:	04818693          	addi	a3,gp,72 # 20000530 <OLED_scl_pin_handle_t>
    44e0:	4288                	lw	a0,0(a3)
    44e2:	4585                	li	a1,1
    44e4:	c28ff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    OLED_dc_pin_handle_t = csi_gpio_pin_initialize(PA21, gpio_interrupt_handler);         //                                                    PA21                                                
    44e8:	22648593          	addi	a1,s1,550
    44ec:	4555                	li	a0,21
    44ee:	ba6ff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    44f2:	04018693          	addi	a3,gp,64 # 20000528 <OLED_dc_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_dc_pin_handle_t, GPIO_MODE_PULLNONE);
    44f6:	4581                	li	a1,0
    OLED_dc_pin_handle_t = csi_gpio_pin_initialize(PA21, gpio_interrupt_handler);         //                                                    PA21                                                
    44f8:	c288                	sw	a0,0(a3)
    csi_gpio_pin_config_mode(OLED_dc_pin_handle_t, GPIO_MODE_PULLNONE);
    44fa:	bfaff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_dc_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    44fe:	04018693          	addi	a3,gp,64 # 20000528 <OLED_dc_pin_handle_t>
    4502:	4288                	lw	a0,0(a3)
    4504:	4585                	li	a1,1
    4506:	c06ff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    OLED_sda_pin_handle_t = csi_gpio_pin_initialize(PA24, gpio_interrupt_handler);        //                                                    PA24
    450a:	22648593          	addi	a1,s1,550
    450e:	4561                	li	a0,24
    4510:	b84ff0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    4514:	04c18493          	addi	s1,gp,76 # 20000534 <OLED_sda_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_sda_pin_handle_t, GPIO_MODE_PULLNONE);
    4518:	4581                	li	a1,0
    OLED_sda_pin_handle_t = csi_gpio_pin_initialize(PA24, gpio_interrupt_handler);        //                                                    PA24
    451a:	c088                	sw	a0,0(s1)
    csi_gpio_pin_config_mode(OLED_sda_pin_handle_t, GPIO_MODE_PULLNONE);
    451c:	bd8ff0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_sda_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4520:	4088                	lw	a0,0(s1)
    4522:	4585                	li	a1,1
    4524:	be8ff0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    oled_pin_init();
    OLED_VDD_Clr();
    4528:	05418793          	addi	a5,gp,84 # 2000053c <OLED_vdd_pin_handle_t>
    452c:	4388                	lw	a0,0(a5)
    452e:	4581                	li	a1,0
    4530:	c0eff0ef          	jal	ra,393e <csi_gpio_pin_write>
    mdelay(1);
    4534:	4505                	li	a0,1
    4536:	f7aff0ef          	jal	ra,3cb0 <mdelay>
	OLED_RES_Clr();
    453a:	4008                	lw	a0,0(s0)
    453c:	4581                	li	a1,0
    453e:	c00ff0ef          	jal	ra,393e <csi_gpio_pin_write>
    mdelay(200);
    4542:	0c800513          	li	a0,200
    4546:	f6aff0ef          	jal	ra,3cb0 <mdelay>
	OLED_RES_Set();
    454a:	4008                	lw	a0,0(s0)
    454c:	4585                	li	a1,1
    454e:	bf0ff0ef          	jal	ra,393e <csi_gpio_pin_write>
	
	OLED_WR_Byte(0xAE,OLED_CMD); /*display off*/
    4552:	4581                	li	a1,0
    4554:	0ae00513          	li	a0,174
    4558:	39c1                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x00,OLED_CMD); /*set lower column address*/ 
    455a:	4581                	li	a1,0
    455c:	4501                	li	a0,0
    455e:	31e9                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x10,OLED_CMD); /*set higher column address*/
    4560:	4581                	li	a1,0
    4562:	4541                	li	a0,16
    4564:	31d1                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x00,OLED_CMD); /*set display start line*/ 
    4566:	4581                	li	a1,0
    4568:	4501                	li	a0,0
    456a:	397d                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xB0,OLED_CMD); /*set page address*/ 
    456c:	4581                	li	a1,0
    456e:	0b000513          	li	a0,176
    4572:	395d                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x81,OLED_CMD); /*contract control*/ 
    4574:	4581                	li	a1,0
    4576:	08100513          	li	a0,129
    457a:	317d                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xff,OLED_CMD); /*128*/ 
    457c:	4581                	li	a1,0
    457e:	0ff00513          	li	a0,255
    4582:	315d                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xA1,OLED_CMD); /*set segment remap*/ 
    4584:	4581                	li	a1,0
    4586:	0a100513          	li	a0,161
    458a:	3979                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xA6,OLED_CMD); /*normal / reverse*/ 
    458c:	4581                	li	a1,0
    458e:	0a600513          	li	a0,166
    4592:	3959                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xA8,OLED_CMD); /*multiplex ratio*/ 
    4594:	4581                	li	a1,0
    4596:	0a800513          	li	a0,168
    459a:	3179                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x1F,OLED_CMD); /*duty = 1/32*/ 
    459c:	4581                	li	a1,0
    459e:	457d                	li	a0,31
    45a0:	3161                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xC8,OLED_CMD); /*Com scan direction*/ 
    45a2:	4581                	li	a1,0
    45a4:	0c800513          	li	a0,200
    45a8:	3141                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xD3,OLED_CMD); /*set display offset*/ 
    45aa:	4581                	li	a1,0
    45ac:	0d300513          	li	a0,211
    45b0:	39a5                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x00,OLED_CMD); 
    45b2:	4581                	li	a1,0
    45b4:	4501                	li	a0,0
    45b6:	398d                	jal	4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xD5,OLED_CMD); /*set osc division*/ 
    45b8:	4581                	li	a1,0
    45ba:	0d500513          	li	a0,213
    45be:	c6bff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x80,OLED_CMD); 
    45c2:	4581                	li	a1,0
    45c4:	08000513          	li	a0,128
    45c8:	c61ff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xD9,OLED_CMD); /*set pre-charge period*/ 
    45cc:	4581                	li	a1,0
    45ce:	0d900513          	li	a0,217
    45d2:	c57ff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x1f,OLED_CMD); 
    45d6:	4581                	li	a1,0
    45d8:	457d                	li	a0,31
    45da:	c4fff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xDA,OLED_CMD); /*set COM pins*/ 
    45de:	4581                	li	a1,0
    45e0:	0da00513          	li	a0,218
    45e4:	c45ff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x00,OLED_CMD); 
    45e8:	4581                	li	a1,0
    45ea:	4501                	li	a0,0
    45ec:	c3dff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0xdb,OLED_CMD); /*set vcomh*/ 
    45f0:	4581                	li	a1,0
    45f2:	0db00513          	li	a0,219
    45f6:	c33ff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x40,OLED_CMD); 
    45fa:	4581                	li	a1,0
    45fc:	04000513          	li	a0,64
    4600:	c29ff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x8d,OLED_CMD); /*set charge pump enable*/ 
    4604:	4581                	li	a1,0
    4606:	08d00513          	li	a0,141
    460a:	c1fff0ef          	jal	ra,4228 <OLED_WR_Byte>
	OLED_WR_Byte(0x14,OLED_CMD);
    460e:	4581                	li	a1,0
    4610:	4551                	li	a0,20
    4612:	c17ff0ef          	jal	ra,4228 <OLED_WR_Byte>

    OLED_VBAT_Clr();
    4616:	05018793          	addi	a5,gp,80 # 20000538 <OLED_vbat_pin_handle_t>
    461a:	4388                	lw	a0,0(a5)
    461c:	4581                	li	a1,0
    461e:	b20ff0ef          	jal	ra,393e <csi_gpio_pin_write>
    mdelay(100);
    4622:	06400513          	li	a0,100
    4626:	e8aff0ef          	jal	ra,3cb0 <mdelay>
	OLED_Clear();
    462a:	31e9                	jal	42f4 <OLED_Clear>
	OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
}
    462c:	4412                	lw	s0,4(sp)
    462e:	40a2                	lw	ra,8(sp)
    4630:	4482                	lw	s1,0(sp)
	OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
    4632:	4581                	li	a1,0
    4634:	0af00513          	li	a0,175
}
    4638:	0131                	addi	sp,sp,12
	OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
    463a:	befff06f          	j	4228 <OLED_WR_Byte>

0000463e <OLED_SHOW>:
		OLED_Clear();
	}
}

void OLED_SHOW()
{
    463e:	1151                	addi	sp,sp,-12
    4640:	c406                	sw	ra,8(sp)
	OLED_Init();//初始化OLED 
    4642:	3539                	jal	4450 <OLED_Init>
	OLED_ColorTurn(0);//0正常显示，1 反色显示
    4644:	4501                	li	a0,0
    4646:	c4fff0ef          	jal	ra,4294 <OLED_ColorTurn>
	if(i==1)
    464a:	c65ff0ef          	jal	ra,42ae <OLED_DisplayTurn.part.0>
    OLED_DisplayTurn(1);//0正常显示 1 屏幕翻转显示	
	OLED_Clear();
    464e:	ca7ff0ef          	jal	ra,42f4 <OLED_Clear>
	// OLED_ShowChinese(36,0,2,16);//园
	// OLED_ShowChinese(54,0,3,16);//电
	// OLED_ShowChinese(72,0,4,16);//子
	// OLED_ShowChinese(90,0,5,16);//科
	// OLED_ShowChinese(108,0,6,16);//技
	OLED_ShowString(0,0,"Welcome to use",16);
    4652:	6621                	lui	a2,0x8
    4654:	46c1                	li	a3,16
    4656:	8a860613          	addi	a2,a2,-1880 # 78a8 <sg_usi_config+0x120>
    465a:	4581                	li	a1,0
    465c:	4501                	li	a0,0
    465e:	3345                	jal	43fe <OLED_ShowString>
	OLED_ShowString(16,2,"WujianSoC",16);
    4660:	40a2                	lw	ra,8(sp)
	OLED_ShowString(16,2,"WujianSoC",16);
    4662:	6621                	lui	a2,0x8
    4664:	46c1                	li	a3,16
    4666:	8b860613          	addi	a2,a2,-1864 # 78b8 <sg_usi_config+0x130>
    466a:	4589                	li	a1,2
    466c:	4541                	li	a0,16
    466e:	0131                	addi	sp,sp,12
	OLED_ShowString(16,2,"WujianSoC",16);
    4670:	b379                	j	43fe <OLED_ShowString>

00004672 <ld_dword>:
	DWORD rv;

	rv = ptr[3];
	rv = rv << 8 | ptr[2];
	rv = rv << 8 | ptr[1];
	rv = rv << 8 | ptr[0];
    4672:	00154783          	lbu	a5,1(a0)
    4676:	00054703          	lbu	a4,0(a0)
    467a:	07a2                	slli	a5,a5,0x8
    467c:	8f5d                	or	a4,a4,a5
    467e:	00254783          	lbu	a5,2(a0)
    4682:	00354503          	lbu	a0,3(a0)
    4686:	07c2                	slli	a5,a5,0x10
    4688:	8fd9                	or	a5,a5,a4
    468a:	0562                	slli	a0,a0,0x18
	return rv;
}
    468c:	8d5d                	or	a0,a0,a5
    468e:	8082                	ret

00004690 <mem_set>:


/* Fill memory block */
static void mem_set (void* dst, int val, UINT cnt)
{
	BYTE *d = (BYTE*)dst;
    4690:	962a                	add	a2,a2,a0

	do {
		*d++ = (BYTE)val;
    4692:	0505                	addi	a0,a0,1
    4694:	feb50fa3          	sb	a1,-1(a0)
	} while (--cnt);
    4698:	fec51de3          	bne	a0,a2,4692 <mem_set+0x2>
}
    469c:	8082                	ret

0000469e <clst2sect>:
	FATFS* fs,		/* Filesystem object */
	DWORD clst		/* Cluster# to be converted */
)
{
	clst -= 2;		/* Cluster number is origin from 2 */
	if (clst >= fs->n_fatent - 2) return 0;		/* Is it invalid cluster number? */
    469e:	4958                	lw	a4,20(a0)
	clst -= 2;		/* Cluster number is origin from 2 */
    46a0:	ffe58793          	addi	a5,a1,-2
	if (clst >= fs->n_fatent - 2) return 0;		/* Is it invalid cluster number? */
    46a4:	1779                	addi	a4,a4,-2
    46a6:	00e7f963          	bgeu	a5,a4,46b8 <clst2sect+0x1a>
	return fs->database + (LBA_t)fs->csize * clst;	/* Start sector number of the cluster */
    46aa:	00a55583          	lhu	a1,10(a0)
    46ae:	5508                	lw	a0,40(a0)
    46b0:	02f585b3          	mul	a1,a1,a5
    46b4:	952e                	add	a0,a0,a1
    46b6:	8082                	ret
	if (clst >= fs->n_fatent - 2) return 0;		/* Is it invalid cluster number? */
    46b8:	4501                	li	a0,0
}
    46ba:	8082                	ret

000046bc <st_clust>:
	*ptr++ = (BYTE)val; val >>= 8;
    46bc:	01061793          	slli	a5,a2,0x10
    46c0:	83c1                	srli	a5,a5,0x10
    46c2:	83a1                	srli	a5,a5,0x8
	*ptr++ = (BYTE)val;
    46c4:	00f58da3          	sb	a5,27(a1)
	*ptr++ = (BYTE)val; val >>= 8;
    46c8:	00c58d23          	sb	a2,26(a1)
	BYTE* dir,	/* Pointer to the key entry */
	DWORD cl	/* Value to be set */
)
{
	st_word(dir + DIR_FstClusLO, (WORD)cl);
	if (fs->fs_type == FS_FAT32) {
    46cc:	00054703          	lbu	a4,0(a0)
    46d0:	478d                	li	a5,3
    46d2:	00f71863          	bne	a4,a5,46e2 <st_clust+0x26>
		st_word(dir + DIR_FstClusHI, (WORD)(cl >> 16));
    46d6:	8241                	srli	a2,a2,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    46d8:	00c58a23          	sb	a2,20(a1)
    46dc:	8221                	srli	a2,a2,0x8
	*ptr++ = (BYTE)val;
    46de:	00c58aa3          	sb	a2,21(a1)
	}
}
    46e2:	8082                	ret

000046e4 <get_ldnumber>:
#if FF_STR_VOLUME_ID		/* Find string volume ID */
	const char *sp;
	char c;
#endif

	tt = tp = *path;
    46e4:	4118                	lw	a4,0(a0)
{
    46e6:	86aa                	mv	a3,a0
	if (!tp) return vol;	/* Invalid path name? */
    46e8:	c30d                	beqz	a4,470a <get_ldnumber+0x26>
    46ea:	87ba                	mv	a5,a4
	do tc = *tt++; while ((UINT)tc >= (FF_USE_LFN ? ' ' : '!') && tc != ':');	/* Find a colon in the path */
    46ec:	02000513          	li	a0,32
    46f0:	03a00593          	li	a1,58
    46f4:	0007c603          	lbu	a2,0(a5)
    46f8:	0785                	addi	a5,a5,1
    46fa:	02c57263          	bgeu	a0,a2,471e <get_ldnumber+0x3a>
    46fe:	feb61be3          	bne	a2,a1,46f4 <get_ldnumber+0x10>

	if (tc == ':') {	/* DOS/Windows style volume ID? */
		i = FF_VOLUMES;
		if (IsDigit(*tp) && tp + 2 == tt) {	/* Is there a numeric volume ID + colon? */
    4702:	00270613          	addi	a2,a4,2
    4706:	00c78463          	beq	a5,a2,470e <get_ldnumber+0x2a>
	if (!tp) return vol;	/* Invalid path name? */
    470a:	557d                	li	a0,-1
	vol = CurrVol;	/* Default drive is current drive */
#else
	vol = 0;		/* Default drive is 0 */
#endif
	return vol;		/* Return the default drive */
}
    470c:	8082                	ret
		if (i < FF_VOLUMES) {	/* If a volume ID is found, get the drive number and strip it */
    470e:	00074603          	lbu	a2,0(a4)
    4712:	03000713          	li	a4,48
	if (!tp) return vol;	/* Invalid path name? */
    4716:	557d                	li	a0,-1
		if (i < FF_VOLUMES) {	/* If a volume ID is found, get the drive number and strip it */
    4718:	fee61ae3          	bne	a2,a4,470c <get_ldnumber+0x28>
			*path = tt;		/* Snip the drive prefix off */
    471c:	c29c                	sw	a5,0(a3)
	return vol;		/* Return the default drive */
    471e:	4501                	li	a0,0
    4720:	8082                	ret

00004722 <validate>:

static FRESULT validate (	/* Returns FR_OK or FR_INVALID_OBJECT */
	FFOBJID* obj,			/* Pointer to the FFOBJID, the 1st member in the FIL/DIR object, to check validity */
	FATFS** rfs				/* Pointer to pointer to the owner filesystem object to return */
)
{
    4722:	1151                	addi	sp,sp,-12
    4724:	c026                	sw	s1,0(sp)
    4726:	c406                	sw	ra,8(sp)
    4728:	c222                	sw	s0,4(sp)
    472a:	84ae                	mv	s1,a1
	FRESULT res = FR_INVALID_OBJECT;


	if (obj && obj->fs && obj->fs->fs_type && obj->id == obj->fs->id) {	/* Test if the object is valid */
    472c:	e909                	bnez	a0,473e <validate+0x1c>
	FRESULT res = FR_INVALID_OBJECT;
    472e:	4525                	li	a0,9
		if (!(disk_status(obj->fs->pdrv) & STA_NOINIT)) { /* Test if the phsical drive is kept initialized */
			res = FR_OK;
		}
#endif
	}
	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
    4730:	4781                	li	a5,0
	return res;
}
    4732:	40a2                	lw	ra,8(sp)
    4734:	4412                	lw	s0,4(sp)
	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
    4736:	c09c                	sw	a5,0(s1)
}
    4738:	4482                	lw	s1,0(sp)
    473a:	0131                	addi	sp,sp,12
    473c:	8082                	ret
	if (obj && obj->fs && obj->fs->fs_type && obj->id == obj->fs->id) {	/* Test if the object is valid */
    473e:	411c                	lw	a5,0(a0)
    4740:	842a                	mv	s0,a0
    4742:	d7f5                	beqz	a5,472e <validate+0xc>
    4744:	0007c703          	lbu	a4,0(a5)
    4748:	d37d                	beqz	a4,472e <validate+0xc>
    474a:	00455683          	lhu	a3,4(a0)
    474e:	0067d703          	lhu	a4,6(a5)
    4752:	fce69ee3          	bne	a3,a4,472e <validate+0xc>
		if (!(disk_status(obj->fs->pdrv) & STA_NOINIT)) { /* Test if the phsical drive is kept initialized */
    4756:	0017c503          	lbu	a0,1(a5)
    475a:	107010ef          	jal	ra,6060 <disk_status>
    475e:	8905                	andi	a0,a0,1
    4760:	f579                	bnez	a0,472e <validate+0xc>
	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
    4762:	401c                	lw	a5,0(s0)
    4764:	b7f9                	j	4732 <validate+0x10>

00004766 <mem_cpy.part.0>:
static void mem_cpy (void* dst, const void* src, UINT cnt)
    4766:	4781                	li	a5,0
			*d++ = *s++;
    4768:	00f58733          	add	a4,a1,a5
    476c:	00074683          	lbu	a3,0(a4)
    4770:	00f50733          	add	a4,a0,a5
		} while (--cnt);
    4774:	0785                	addi	a5,a5,1
			*d++ = *s++;
    4776:	00d70023          	sb	a3,0(a4)
		} while (--cnt);
    477a:	fef617e3          	bne	a2,a5,4768 <mem_cpy.part.0+0x2>
}
    477e:	8082                	ret

00004780 <sync_window>:
{
    4780:	1141                	addi	sp,sp,-16
    4782:	c606                	sw	ra,12(sp)
    4784:	c422                	sw	s0,8(sp)
    4786:	c226                	sw	s1,4(sp)
	if (fs->wflag) {	/* Is the disk access window dirty? */
    4788:	00354783          	lbu	a5,3(a0)
    478c:	eb81                	bnez	a5,479c <sync_window+0x1c>
	FRESULT res = FR_OK;
    478e:	4481                	li	s1,0
}
    4790:	40b2                	lw	ra,12(sp)
    4792:	4422                	lw	s0,8(sp)
    4794:	8526                	mv	a0,s1
    4796:	4492                	lw	s1,4(sp)
    4798:	0141                	addi	sp,sp,16
    479a:	8082                	ret
		if (disk_write(fs->pdrv, fs->win, fs->winsect, 1) == RES_OK) {	/* Write it back into the volume */
    479c:	03050593          	addi	a1,a0,48
    47a0:	5550                	lw	a2,44(a0)
    47a2:	842a                	mv	s0,a0
    47a4:	00154503          	lbu	a0,1(a0)
    47a8:	4685                	li	a3,1
    47aa:	c02e                	sw	a1,0(sp)
    47ac:	23d010ef          	jal	ra,61e8 <disk_write>
    47b0:	84aa                	mv	s1,a0
    47b2:	e51d                	bnez	a0,47e0 <sync_window+0x60>
			if (fs->winsect - fs->fatbase < fs->fsize) {	/* Is it in the 1st FAT? */
    47b4:	5450                	lw	a2,44(s0)
    47b6:	501c                	lw	a5,32(s0)
    47b8:	4c18                	lw	a4,24(s0)
			fs->wflag = 0;	/* Clear window dirty flag */
    47ba:	000401a3          	sb	zero,3(s0)
			if (fs->winsect - fs->fatbase < fs->fsize) {	/* Is it in the 1st FAT? */
    47be:	40f607b3          	sub	a5,a2,a5
    47c2:	fce7f6e3          	bgeu	a5,a4,478e <sync_window+0xe>
				if (fs->n_fats == 2) disk_write(fs->pdrv, fs->win, fs->winsect + fs->fsize, 1);	/* Reflect it to 2nd FAT if needed */
    47c6:	00244683          	lbu	a3,2(s0)
    47ca:	4789                	li	a5,2
    47cc:	4582                	lw	a1,0(sp)
    47ce:	fcf690e3          	bne	a3,a5,478e <sync_window+0xe>
    47d2:	00144503          	lbu	a0,1(s0)
    47d6:	4685                	li	a3,1
    47d8:	963a                	add	a2,a2,a4
    47da:	20f010ef          	jal	ra,61e8 <disk_write>
    47de:	bf4d                	j	4790 <sync_window+0x10>
			res = FR_DISK_ERR;
    47e0:	4485                	li	s1,1
	return res;
    47e2:	b77d                	j	4790 <sync_window+0x10>

000047e4 <move_window>:
	if (sect != fs->winsect) {	/* Window offset changed? */
    47e4:	555c                	lw	a5,44(a0)
    47e6:	02b78b63          	beq	a5,a1,481c <move_window+0x38>
{
    47ea:	1151                	addi	sp,sp,-12
    47ec:	c222                	sw	s0,4(sp)
    47ee:	c026                	sw	s1,0(sp)
    47f0:	c406                	sw	ra,8(sp)
    47f2:	842a                	mv	s0,a0
    47f4:	84ae                	mv	s1,a1
		res = sync_window(fs);		/* Flush the window */
    47f6:	3769                	jal	4780 <sync_window>
		if (res == FR_OK) {			/* Fill sector window with new data */
    47f8:	ed09                	bnez	a0,4812 <move_window+0x2e>
			if (disk_read(fs->pdrv, fs->win, sect, 1) != RES_OK) {
    47fa:	00144503          	lbu	a0,1(s0)
    47fe:	4685                	li	a3,1
    4800:	8626                	mv	a2,s1
    4802:	03040593          	addi	a1,s0,48
    4806:	16f010ef          	jal	ra,6174 <disk_read>
    480a:	c119                	beqz	a0,4810 <move_window+0x2c>
				res = FR_DISK_ERR;
    480c:	4505                	li	a0,1
				sect = (LBA_t)0 - 1;	/* Invalidate window if read data is not valid */
    480e:	54fd                	li	s1,-1
			fs->winsect = sect;
    4810:	d444                	sw	s1,44(s0)
}
    4812:	40a2                	lw	ra,8(sp)
    4814:	4412                	lw	s0,4(sp)
    4816:	4482                	lw	s1,0(sp)
    4818:	0131                	addi	sp,sp,12
    481a:	8082                	ret
	FRESULT res = FR_OK;
    481c:	4501                	li	a0,0
}
    481e:	8082                	ret

00004820 <check_fs>:
{
    4820:	1151                	addi	sp,sp,-12
    4822:	c222                	sw	s0,4(sp)
    4824:	c406                	sw	ra,8(sp)
	fs->wflag = 0; fs->winsect = (LBA_t)0 - 1;		/* Invaidate window */
    4826:	57fd                	li	a5,-1
    4828:	000501a3          	sb	zero,3(a0)
    482c:	d55c                	sw	a5,44(a0)
{
    482e:	842a                	mv	s0,a0
	if (move_window(fs, sect) != FR_OK) return 4;	/* Load the boot sector */
    4830:	3f55                	jal	47e4 <move_window>
    4832:	e179                	bnez	a0,48f8 <check_fs+0xd8>
	rv = ptr[1];
    4834:	22f44703          	lbu	a4,559(s0)
    4838:	22e44783          	lbu	a5,558(s0)
	if (b == 0xEB || b == 0xE9 || b == 0xE8) {	/* Valid JumpBoot code? (short jump, near jump or near call) */
    483c:	0eb00693          	li	a3,235
    4840:	0722                	slli	a4,a4,0x8
    4842:	8f5d                	or	a4,a4,a5
	b = fs->win[BS_JmpBoot];
    4844:	03044783          	lbu	a5,48(s0)
	if (b == 0xEB || b == 0xE9 || b == 0xE8) {	/* Valid JumpBoot code? (short jump, near jump or near call) */
    4848:	00d78863          	beq	a5,a3,4858 <check_fs+0x38>
    484c:	07e1                	addi	a5,a5,24
    484e:	0ff7f793          	andi	a5,a5,255
    4852:	4685                	li	a3,1
    4854:	08f6e563          	bltu	a3,a5,48de <check_fs+0xbe>
		if (sign == 0xAA55 && !mem_cmp(fs->win + BS_FilSysType32, "FAT32   ", 8)) return 0;	/* It is an FAT32 VBR */
    4858:	67ad                	lui	a5,0xb
    485a:	a5578793          	addi	a5,a5,-1451 # aa55 <__ctor_end__+0x21f5>
    485e:	02f71563          	bne	a4,a5,4888 <check_fs+0x68>
	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
    4862:	67a1                	lui	a5,0x8
		if (sign == 0xAA55 && !mem_cmp(fs->win + BS_FilSysType32, "FAT32   ", 8)) return 0;	/* It is an FAT32 VBR */
    4864:	08240613          	addi	a2,s0,130
	int r = 0;
    4868:	08a40593          	addi	a1,s0,138
	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
    486c:	0dc78793          	addi	a5,a5,220 # 80dc <asc2_1608+0x5f0>
		r = *d++ - *s++;
    4870:	00064683          	lbu	a3,0(a2)
    4874:	0007c303          	lbu	t1,0(a5)
    4878:	0605                	addi	a2,a2,1
    487a:	0785                	addi	a5,a5,1
    487c:	406686b3          	sub	a3,a3,t1
	} while (--cnt && r == 0);
    4880:	06c58763          	beq	a1,a2,48ee <check_fs+0xce>
    4884:	fe0686e3          	beqz	a3,4870 <check_fs+0x50>
	rv = ptr[1];
    4888:	03c44783          	lbu	a5,60(s0)
    488c:	03b44683          	lbu	a3,59(s0)
    4890:	07a2                	slli	a5,a5,0x8
    4892:	8fd5                	or	a5,a5,a3
		if ((w & (w - 1)) == 0 && w >= FF_MIN_SS && w <= FF_MAX_SS) {	/* Properness of sector size */
    4894:	fff78693          	addi	a3,a5,-1
    4898:	8efd                	and	a3,a3,a5
    489a:	e2b1                	bnez	a3,48de <check_fs+0xbe>
    489c:	20000693          	li	a3,512
    48a0:	02d79f63          	bne	a5,a3,48de <check_fs+0xbe>
			b = fs->win[BPB_SecPerClus];
    48a4:	03d44683          	lbu	a3,61(s0)
			if (b != 0 && (b & (b - 1)) == 0						/* Properness of cluster size */
    48a8:	ca9d                	beqz	a3,48de <check_fs+0xbe>
    48aa:	fff68793          	addi	a5,a3,-1 # e000dfff <__heap_end+0xbffddfff>
    48ae:	8ff5                	and	a5,a5,a3
    48b0:	e79d                	bnez	a5,48de <check_fs+0xbe>
			&& (fs->win[BPB_NumFATs] == 1 || fs->win[BPB_NumFATs] == 2)	/* Properness of number of FATs */
    48b2:	04044783          	lbu	a5,64(s0)
    48b6:	4685                	li	a3,1
    48b8:	17fd                	addi	a5,a5,-1
    48ba:	0ff7f793          	andi	a5,a5,255
    48be:	02f6e063          	bltu	a3,a5,48de <check_fs+0xbe>
			&& ld_word(fs->win + BPB_RootEntCnt) != 0				/* Properness of root entry count */
    48c2:	04244783          	lbu	a5,66(s0)
    48c6:	04144683          	lbu	a3,65(s0)
    48ca:	07a2                	slli	a5,a5,0x8
    48cc:	8fd5                	or	a5,a5,a3
    48ce:	cb81                	beqz	a5,48de <check_fs+0xbe>
			&& ld_word(fs->win + BPB_FATSz16) != 0) {				/* Properness of FAT size */
    48d0:	04744783          	lbu	a5,71(s0)
    48d4:	04644683          	lbu	a3,70(s0)
    48d8:	07a2                	slli	a5,a5,0x8
    48da:	8fd5                	or	a5,a5,a3
    48dc:	eb91                	bnez	a5,48f0 <check_fs+0xd0>
	return sign == 0xAA55 ? 2 : 3;	/* Not an FAT VBR (valid or invalid BS) */
    48de:	67ad                	lui	a5,0xb
    48e0:	a5578793          	addi	a5,a5,-1451 # aa55 <__ctor_end__+0x21f5>
    48e4:	4509                	li	a0,2
    48e6:	00f70563          	beq	a4,a5,48f0 <check_fs+0xd0>
    48ea:	450d                	li	a0,3
    48ec:	a011                	j	48f0 <check_fs+0xd0>
		if (sign == 0xAA55 && !mem_cmp(fs->win + BS_FilSysType32, "FAT32   ", 8)) return 0;	/* It is an FAT32 VBR */
    48ee:	fec9                	bnez	a3,4888 <check_fs+0x68>
}
    48f0:	40a2                	lw	ra,8(sp)
    48f2:	4412                	lw	s0,4(sp)
    48f4:	0131                	addi	sp,sp,12
    48f6:	8082                	ret
	if (move_window(fs, sect) != FR_OK) return 4;	/* Load the boot sector */
    48f8:	4511                	li	a0,4
    48fa:	bfdd                	j	48f0 <check_fs+0xd0>

000048fc <put_fat>:
{
    48fc:	1121                	addi	sp,sp,-24
    48fe:	c626                	sw	s1,12(sp)
    4900:	ca06                	sw	ra,20(sp)
    4902:	c822                	sw	s0,16(sp)
	if (clst >= 2 && clst < fs->n_fatent) {	/* Check if in valid range */
    4904:	4485                	li	s1,1
	FRESULT res = FR_INT_ERR;
    4906:	4709                	li	a4,2
	if (clst >= 2 && clst < fs->n_fatent) {	/* Check if in valid range */
    4908:	0ab4f763          	bgeu	s1,a1,49b6 <put_fat+0xba>
    490c:	8432                	mv	s0,a2
    490e:	4950                	lw	a2,20(a0)
	FRESULT res = FR_INT_ERR;
    4910:	4709                	li	a4,2
	if (clst >= 2 && clst < fs->n_fatent) {	/* Check if in valid range */
    4912:	0ac5f263          	bgeu	a1,a2,49b6 <put_fat+0xba>
		switch (fs->fs_type) {
    4916:	00054603          	lbu	a2,0(a0)
    491a:	0ae60d63          	beq	a2,a4,49d4 <put_fat+0xd8>
    491e:	470d                	li	a4,3
    4920:	0ee60563          	beq	a2,a4,4a0a <put_fat+0x10e>
    4924:	4709                	li	a4,2
    4926:	08961863          	bne	a2,s1,49b6 <put_fat+0xba>
			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
    492a:	5118                	lw	a4,32(a0)
			bc = (UINT)clst; bc += bc / 2;	/* bc: byte offset of the entry */
    492c:	0015d493          	srli	s1,a1,0x1
    4930:	94ae                	add	s1,s1,a1
    4932:	c22e                	sw	a1,4(sp)
			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
    4934:	0094d593          	srli	a1,s1,0x9
    4938:	95ba                	add	a1,a1,a4
    493a:	c02a                	sw	a0,0(sp)
    493c:	3565                	jal	47e4 <move_window>
    493e:	872a                	mv	a4,a0
			if (res != FR_OK) break;
    4940:	e93d                	bnez	a0,49b6 <put_fat+0xba>
			p = fs->win + bc++ % SS(fs);
    4942:	4682                	lw	a3,0(sp)
			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;		/* Update 1st byte */
    4944:	4792                	lw	a5,4(sp)
			p = fs->win + bc++ % SS(fs);
    4946:	00148313          	addi	t1,s1,1
    494a:	03068613          	addi	a2,a3,48
    494e:	1ff4f493          	andi	s1,s1,511
    4952:	009605b3          	add	a1,a2,s1
			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;		/* Update 1st byte */
    4956:	0017f493          	andi	s1,a5,1
    495a:	0ff47793          	andi	a5,s0,255
    495e:	cc89                	beqz	s1,4978 <put_fat+0x7c>
    4960:	0005c783          	lbu	a5,0(a1)
    4964:	6505                	lui	a0,0x1
    4966:	1541                	addi	a0,a0,-16
    4968:	00f7f713          	andi	a4,a5,15
    496c:	00441793          	slli	a5,s0,0x4
    4970:	8fe9                	and	a5,a5,a0
    4972:	8fd9                	or	a5,a5,a4
    4974:	0ff7f793          	andi	a5,a5,255
    4978:	00f58023          	sb	a5,0(a1)
			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
    497c:	528c                	lw	a1,32(a3)
			fs->wflag = 1;
    497e:	4785                	li	a5,1
    4980:	00f681a3          	sb	a5,3(a3)
			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
    4984:	00935793          	srli	a5,t1,0x9
    4988:	95be                	add	a1,a1,a5
    498a:	8536                	mv	a0,a3
    498c:	c432                	sw	a2,8(sp)
    498e:	c21a                	sw	t1,4(sp)
    4990:	c036                	sw	a3,0(sp)
    4992:	3d89                	jal	47e4 <move_window>
    4994:	872a                	mv	a4,a0
			if (res != FR_OK) break;
    4996:	e105                	bnez	a0,49b6 <put_fat+0xba>
			p = fs->win + bc % SS(fs);
    4998:	4312                	lw	t1,4(sp)
    499a:	4622                	lw	a2,8(sp)
			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));	/* Update 2nd byte */
    499c:	4682                	lw	a3,0(sp)
			p = fs->win + bc % SS(fs);
    499e:	1ff37313          	andi	t1,t1,511
    49a2:	961a                	add	a2,a2,t1
			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));	/* Update 2nd byte */
    49a4:	cc99                	beqz	s1,49c2 <put_fat+0xc6>
    49a6:	8011                	srli	s0,s0,0x4
    49a8:	0ff47413          	andi	s0,s0,255
    49ac:	00860023          	sb	s0,0(a2)
			fs->wflag = 1;
    49b0:	4785                	li	a5,1
    49b2:	00f681a3          	sb	a5,3(a3)
}
    49b6:	40d2                	lw	ra,20(sp)
    49b8:	4442                	lw	s0,16(sp)
    49ba:	44b2                	lw	s1,12(sp)
    49bc:	853a                	mv	a0,a4
    49be:	0161                	addi	sp,sp,24
    49c0:	8082                	ret
			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));	/* Update 2nd byte */
    49c2:	00064783          	lbu	a5,0(a2)
    49c6:	8021                	srli	s0,s0,0x8
    49c8:	00f47593          	andi	a1,s0,15
    49cc:	0f07f413          	andi	s0,a5,240
    49d0:	8c4d                	or	s0,s0,a1
    49d2:	bfe9                	j	49ac <put_fat+0xb0>
			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)));
    49d4:	0085d713          	srli	a4,a1,0x8
    49d8:	c22e                	sw	a1,4(sp)
    49da:	510c                	lw	a1,32(a0)
    49dc:	c02a                	sw	a0,0(sp)
    49de:	95ba                	add	a1,a1,a4
    49e0:	3511                	jal	47e4 <move_window>
    49e2:	872a                	mv	a4,a0
			if (res != FR_OK) break;
    49e4:	f969                	bnez	a0,49b6 <put_fat+0xba>
			st_word(fs->win + clst * 2 % SS(fs), (WORD)val);	/* Simple WORD array */
    49e6:	4792                	lw	a5,4(sp)
    49e8:	4682                	lw	a3,0(sp)
    49ea:	0786                	slli	a5,a5,0x1
    49ec:	03068613          	addi	a2,a3,48
    49f0:	1fe7f793          	andi	a5,a5,510
    49f4:	97b2                	add	a5,a5,a2
	*ptr++ = (BYTE)val; val >>= 8;
    49f6:	00878023          	sb	s0,0(a5)
    49fa:	0442                	slli	s0,s0,0x10
    49fc:	8041                	srli	s0,s0,0x10
    49fe:	8021                	srli	s0,s0,0x8
	*ptr++ = (BYTE)val;
    4a00:	008780a3          	sb	s0,1(a5)
			fs->wflag = 1;
    4a04:	009681a3          	sb	s1,3(a3)
			break;
    4a08:	b77d                	j	49b6 <put_fat+0xba>
			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
    4a0a:	0075d713          	srli	a4,a1,0x7
    4a0e:	c22e                	sw	a1,4(sp)
    4a10:	510c                	lw	a1,32(a0)
    4a12:	c02a                	sw	a0,0(sp)
    4a14:	95ba                	add	a1,a1,a4
    4a16:	33f9                	jal	47e4 <move_window>
			if (res != FR_OK) break;
    4a18:	4682                	lw	a3,0(sp)
    4a1a:	4792                	lw	a5,4(sp)
			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
    4a1c:	872a                	mv	a4,a0
			if (res != FR_OK) break;
    4a1e:	fd41                	bnez	a0,49b6 <put_fat+0xba>
				val = (val & 0x0FFFFFFF) | (ld_dword(fs->win + clst * 4 % SS(fs)) & 0xF0000000);
    4a20:	078a                	slli	a5,a5,0x2
    4a22:	03068613          	addi	a2,a3,48
    4a26:	1fc7f793          	andi	a5,a5,508
    4a2a:	97b2                	add	a5,a5,a2
    4a2c:	c42a                	sw	a0,8(sp)
    4a2e:	853e                	mv	a0,a5
    4a30:	c236                	sw	a3,4(sp)
    4a32:	c03e                	sw	a5,0(sp)
    4a34:	c3fff0ef          	jal	ra,4672 <ld_dword>
    4a38:	f0000637          	lui	a2,0xf0000
    4a3c:	0412                	slli	s0,s0,0x4
	*ptr++ = (BYTE)val; val >>= 8;
    4a3e:	4782                	lw	a5,0(sp)
				val = (val & 0x0FFFFFFF) | (ld_dword(fs->win + clst * 4 % SS(fs)) & 0xF0000000);
    4a40:	8d71                	and	a0,a0,a2
    4a42:	8011                	srli	s0,s0,0x4
    4a44:	8c49                	or	s0,s0,a0
	*ptr++ = (BYTE)val; val >>= 8;
    4a46:	00845613          	srli	a2,s0,0x8
			fs->wflag = 1;
    4a4a:	4692                	lw	a3,4(sp)
	*ptr++ = (BYTE)val; val >>= 8;
    4a4c:	00878023          	sb	s0,0(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    4a50:	00c780a3          	sb	a2,1(a5)
    4a54:	01045613          	srli	a2,s0,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    4a58:	8061                	srli	s0,s0,0x18
    4a5a:	00c78123          	sb	a2,2(a5)
	*ptr++ = (BYTE)val;
    4a5e:	008781a3          	sb	s0,3(a5)
			break;
    4a62:	4722                	lw	a4,8(sp)
			fs->wflag = 1;
    4a64:	009681a3          	sb	s1,3(a3)
			break;
    4a68:	b7b9                	j	49b6 <put_fat+0xba>

00004a6a <dir_clear>:
{
    4a6a:	1131                	addi	sp,sp,-20
    4a6c:	c622                	sw	s0,12(sp)
    4a6e:	c806                	sw	ra,16(sp)
    4a70:	c426                	sw	s1,8(sp)
    4a72:	842a                	mv	s0,a0
    4a74:	c02e                	sw	a1,0(sp)
	if (sync_window(fs) != FR_OK) return FR_DISK_ERR;	/* Flush disk access window */
    4a76:	d0bff0ef          	jal	ra,4780 <sync_window>
    4a7a:	e939                	bnez	a0,4ad0 <dir_clear+0x66>
	sect = clst2sect(fs, clst);		/* Top of the cluster */
    4a7c:	4582                	lw	a1,0(sp)
    4a7e:	84aa                	mv	s1,a0
    4a80:	8522                	mv	a0,s0
    4a82:	c1dff0ef          	jal	ra,469e <clst2sect>
	mem_set(fs->win, 0, sizeof fs->win);	/* Clear window buffer */
    4a86:	03040793          	addi	a5,s0,48
	sect = clst2sect(fs, clst);		/* Top of the cluster */
    4a8a:	c02a                	sw	a0,0(sp)
	fs->winsect = sect;				/* Set window to top of the cluster */
    4a8c:	d448                	sw	a0,44(s0)
	mem_set(fs->win, 0, sizeof fs->win);	/* Clear window buffer */
    4a8e:	20000613          	li	a2,512
    4a92:	4581                	li	a1,0
    4a94:	853e                	mv	a0,a5
    4a96:	c23e                	sw	a5,4(sp)
    4a98:	bf9ff0ef          	jal	ra,4690 <mem_set>
		for (n = 0; n < fs->csize && disk_write(fs->pdrv, ibuf, sect + n, szb) == RES_OK; n += szb) ;	/* Fill the cluster with 0 */
    4a9c:	00a45703          	lhu	a4,10(s0)
    4aa0:	00e4ec63          	bltu	s1,a4,4ab8 <dir_clear+0x4e>
	return (n == fs->csize) ? FR_OK : FR_DISK_ERR;
    4aa4:	00a45503          	lhu	a0,10(s0)
    4aa8:	8d05                	sub	a0,a0,s1
    4aaa:	00a03533          	snez	a0,a0
}
    4aae:	40c2                	lw	ra,16(sp)
    4ab0:	4432                	lw	s0,12(sp)
    4ab2:	44a2                	lw	s1,8(sp)
    4ab4:	0151                	addi	sp,sp,20
    4ab6:	8082                	ret
		for (n = 0; n < fs->csize && disk_write(fs->pdrv, ibuf, sect + n, szb) == RES_OK; n += szb) ;	/* Fill the cluster with 0 */
    4ab8:	4782                	lw	a5,0(sp)
    4aba:	4592                	lw	a1,4(sp)
    4abc:	00144503          	lbu	a0,1(s0)
    4ac0:	4685                	li	a3,1
    4ac2:	00978633          	add	a2,a5,s1
    4ac6:	722010ef          	jal	ra,61e8 <disk_write>
    4aca:	fd69                	bnez	a0,4aa4 <dir_clear+0x3a>
    4acc:	0485                	addi	s1,s1,1
    4ace:	b7f9                	j	4a9c <dir_clear+0x32>
	if (sync_window(fs) != FR_OK) return FR_DISK_ERR;	/* Flush disk access window */
    4ad0:	4505                	li	a0,1
    4ad2:	bff1                	j	4aae <dir_clear+0x44>

00004ad4 <mount_volume>:
{
    4ad4:	fd410113          	addi	sp,sp,-44
    4ad8:	d026                	sw	s1,32(sp)
    4ada:	d406                	sw	ra,40(sp)
    4adc:	d222                	sw	s0,36(sp)
	*rfs = 0;
    4ade:	0005a023          	sw	zero,0(a1)
{
    4ae2:	84ae                	mv	s1,a1
    4ae4:	c032                	sw	a2,0(sp)
	vol = get_ldnumber(path);
    4ae6:	bffff0ef          	jal	ra,46e4 <get_ldnumber>
	if (vol < 0) return FR_INVALID_DRIVE;
    4aea:	2c054563          	bltz	a0,4db4 <mount_volume+0x2e0>
	fs = FatFs[vol];					/* Get pointer to the filesystem object */
    4aee:	00251713          	slli	a4,a0,0x2
    4af2:	05818693          	addi	a3,gp,88 # 20000540 <FatFs>
    4af6:	9736                	add	a4,a4,a3
    4af8:	4300                	lw	s0,0(a4)
    4afa:	87aa                	mv	a5,a0
	if (!fs) return FR_NOT_ENABLED;		/* Is the filesystem object available? */
    4afc:	4531                	li	a0,12
    4afe:	c41d                	beqz	s0,4b2c <mount_volume+0x58>
	*rfs = fs;							/* Return pointer to the filesystem object */
    4b00:	c080                	sw	s0,0(s1)
	mode &= (BYTE)~FA_READ;				/* Desired access mode, write access or not */
    4b02:	4602                	lw	a2,0(sp)
	if (fs->fs_type != 0) {				/* If the volume has been mounted */
    4b04:	00044703          	lbu	a4,0(s0)
	mode &= (BYTE)~FA_READ;				/* Desired access mode, write access or not */
    4b08:	0fe67493          	andi	s1,a2,254
	if (fs->fs_type != 0) {				/* If the volume has been mounted */
    4b0c:	c715                	beqz	a4,4b38 <mount_volume+0x64>
		stat = disk_status(fs->pdrv);
    4b0e:	00144503          	lbu	a0,1(s0)
    4b12:	c03e                	sw	a5,0(sp)
    4b14:	54c010ef          	jal	ra,6060 <disk_status>
		if (!(stat & STA_NOINIT)) {		/* and the physical drive is kept initialized */
    4b18:	00157693          	andi	a3,a0,1
    4b1c:	4782                	lw	a5,0(sp)
		stat = disk_status(fs->pdrv);
    4b1e:	872a                	mv	a4,a0
		if (!(stat & STA_NOINIT)) {		/* and the physical drive is kept initialized */
    4b20:	ee81                	bnez	a3,4b38 <mount_volume+0x64>
			return FR_OK;				/* The filesystem object is already valid */
    4b22:	4501                	li	a0,0
			if (!FF_FS_READONLY && mode && (stat & STA_PROTECT)) {	/* Check write protection if needed */
    4b24:	c481                	beqz	s1,4b2c <mount_volume+0x58>
    4b26:	8b11                	andi	a4,a4,4
    4b28:	c311                	beqz	a4,4b2c <mount_volume+0x58>
				return FR_WRITE_PROTECTED;
    4b2a:	4529                	li	a0,10
}
    4b2c:	50a2                	lw	ra,40(sp)
    4b2e:	5412                	lw	s0,36(sp)
    4b30:	5482                	lw	s1,32(sp)
    4b32:	02c10113          	addi	sp,sp,44
    4b36:	8082                	ret
	fs->pdrv = LD2PD(vol);				/* Volume hosting physical drive */
    4b38:	0ff7f513          	andi	a0,a5,255
	fs->fs_type = 0;					/* Clear the filesystem object */
    4b3c:	00040023          	sb	zero,0(s0)
	fs->pdrv = LD2PD(vol);				/* Volume hosting physical drive */
    4b40:	00a400a3          	sb	a0,1(s0)
	stat = disk_initialize(fs->pdrv);	/* Initialize the physical drive */
    4b44:	528010ef          	jal	ra,606c <disk_initialize>
	if (stat & STA_NOINIT) { 			/* Check if the initialization succeeded */
    4b48:	00157713          	andi	a4,a0,1
	stat = disk_initialize(fs->pdrv);	/* Initialize the physical drive */
    4b4c:	87aa                	mv	a5,a0
		return FR_NOT_READY;			/* Failed to initialize due to no medium or hard error */
    4b4e:	450d                	li	a0,3
	if (stat & STA_NOINIT) { 			/* Check if the initialization succeeded */
    4b50:	ff71                	bnez	a4,4b2c <mount_volume+0x58>
	if (!FF_FS_READONLY && mode && (stat & STA_PROTECT)) { /* Check disk write protection if needed */
    4b52:	00048463          	beqz	s1,4b5a <mount_volume+0x86>
    4b56:	8b91                	andi	a5,a5,4
    4b58:	fbe9                	bnez	a5,4b2a <mount_volume+0x56>
	fmt = check_fs(fs, 0);				/* Load sector 0 and check if it is an FAT VBR as SFD */
    4b5a:	4581                	li	a1,0
    4b5c:	8522                	mv	a0,s0
    4b5e:	cc3ff0ef          	jal	ra,4820 <check_fs>
	if (fmt != 2 && (fmt >= 3 || part == 0)) return fmt;	/* Returns if it is a FAT VBR as auto scan, not a BS or disk error */
    4b62:	4709                	li	a4,2
	fmt = check_fs(fs, 0);				/* Load sector 0 and check if it is an FAT VBR as SFD */
    4b64:	87aa                	mv	a5,a0
	if (fmt != 2 && (fmt >= 3 || part == 0)) return fmt;	/* Returns if it is a FAT VBR as auto scan, not a BS or disk error */
    4b66:	04e51c63          	bne	a0,a4,4bbe <mount_volume+0xea>
    4b6a:	0804                	addi	s1,sp,16
    4b6c:	1f640793          	addi	a5,s0,502
    4b70:	23640693          	addi	a3,s0,566
    4b74:	8726                	mv	a4,s1
		mbr_pt[i] = ld_dword(fs->win + MBR_Table + i * SZ_PTE + PTE_StLba);
    4b76:	853e                	mv	a0,a5
    4b78:	c436                	sw	a3,8(sp)
    4b7a:	c23a                	sw	a4,4(sp)
    4b7c:	c03e                	sw	a5,0(sp)
    4b7e:	af5ff0ef          	jal	ra,4672 <ld_dword>
    4b82:	4712                	lw	a4,4(sp)
	for (i = 0; i < 4; i++) {		/* Load partition offset in the MBR */
    4b84:	4782                	lw	a5,0(sp)
    4b86:	46a2                	lw	a3,8(sp)
		mbr_pt[i] = ld_dword(fs->win + MBR_Table + i * SZ_PTE + PTE_StLba);
    4b88:	c308                	sw	a0,0(a4)
	for (i = 0; i < 4; i++) {		/* Load partition offset in the MBR */
    4b8a:	07c1                	addi	a5,a5,16
    4b8c:	0711                	addi	a4,a4,4
    4b8e:	fed794e3          	bne	a5,a3,4b76 <mount_volume+0xa2>
    4b92:	01048713          	addi	a4,s1,16
		fmt = mbr_pt[i] ? check_fs(fs, mbr_pt[i]) : 3;	/* Check if the partition is FAT */
    4b96:	408c                	lw	a1,0(s1)
    4b98:	478d                	li	a5,3
    4b9a:	c991                	beqz	a1,4bae <mount_volume+0xda>
    4b9c:	8522                	mv	a0,s0
    4b9e:	c03a                	sw	a4,0(sp)
    4ba0:	c81ff0ef          	jal	ra,4820 <check_fs>
	} while (part == 0 && fmt >= 2 && ++i < 4);
    4ba4:	4685                	li	a3,1
    4ba6:	4702                	lw	a4,0(sp)
		fmt = mbr_pt[i] ? check_fs(fs, mbr_pt[i]) : 3;	/* Check if the partition is FAT */
    4ba8:	87aa                	mv	a5,a0
	} while (part == 0 && fmt >= 2 && ++i < 4);
    4baa:	02a6f363          	bgeu	a3,a0,4bd0 <mount_volume+0xfc>
    4bae:	0491                	addi	s1,s1,4
    4bb0:	fe9713e3          	bne	a4,s1,4b96 <mount_volume+0xc2>
	if (fmt == 4) return FR_DISK_ERR;		/* An error occured in the disk I/O layer */
    4bb4:	4711                	li	a4,4
    4bb6:	4505                	li	a0,1
    4bb8:	00e79a63          	bne	a5,a4,4bcc <mount_volume+0xf8>
    4bbc:	bf85                	j	4b2c <mount_volume+0x58>
    4bbe:	4711                	li	a4,4
    4bc0:	4505                	li	a0,1
    4bc2:	f6e785e3          	beq	a5,a4,4b2c <mount_volume+0x58>
	if (fmt >= 2) return FR_NO_FILESYSTEM;	/* No FAT volume is found */
    4bc6:	4705                	li	a4,1
    4bc8:	00f77463          	bgeu	a4,a5,4bd0 <mount_volume+0xfc>
    4bcc:	4535                	li	a0,13
    4bce:	bfb9                	j	4b2c <mount_volume+0x58>
		if (ld_word(fs->win + BPB_BytsPerSec) != SS(fs)) return FR_NO_FILESYSTEM;	/* (BPB_BytsPerSec must be equal to the physical sector size) */
    4bd0:	03c44783          	lbu	a5,60(s0)
    4bd4:	03b44703          	lbu	a4,59(s0)
    4bd8:	07a2                	slli	a5,a5,0x8
    4bda:	8fd9                	or	a5,a5,a4
    4bdc:	20000713          	li	a4,512
    4be0:	fee796e3          	bne	a5,a4,4bcc <mount_volume+0xf8>
		fasize = ld_word(fs->win + BPB_FATSz16);		/* Number of sectors per FAT */
    4be4:	04744703          	lbu	a4,71(s0)
    4be8:	04644503          	lbu	a0,70(s0)
    4bec:	0722                	slli	a4,a4,0x8
    4bee:	8f49                	or	a4,a4,a0
		if (fasize == 0) fasize = ld_dword(fs->win + BPB_FATSz32);
    4bf0:	e711                	bnez	a4,4bfc <mount_volume+0x128>
    4bf2:	05440513          	addi	a0,s0,84
    4bf6:	a7dff0ef          	jal	ra,4672 <ld_dword>
    4bfa:	872a                	mv	a4,a0
		fs->n_fats = fs->win[BPB_NumFATs];				/* Number of FATs */
    4bfc:	04044283          	lbu	t0,64(s0)
		fs->fsize = fasize;
    4c00:	cc18                	sw	a4,24(s0)
		if (fs->n_fats != 1 && fs->n_fats != 2) return FR_NO_FILESYSTEM;	/* (Must be 1 or 2) */
    4c02:	4685                	li	a3,1
    4c04:	fff28793          	addi	a5,t0,-1 # 7fffffff <__heap_end+0x5ffcffff>
		fs->n_fats = fs->win[BPB_NumFATs];				/* Number of FATs */
    4c08:	00540123          	sb	t0,2(s0)
		if (fs->n_fats != 1 && fs->n_fats != 2) return FR_NO_FILESYSTEM;	/* (Must be 1 or 2) */
    4c0c:	0ff7f793          	andi	a5,a5,255
	bsect = fs->winsect;					/* Volume location */
    4c10:	544c                	lw	a1,44(s0)
		if (fs->n_fats != 1 && fs->n_fats != 2) return FR_NO_FILESYSTEM;	/* (Must be 1 or 2) */
    4c12:	faf6ede3          	bltu	a3,a5,4bcc <mount_volume+0xf8>
		fs->csize = fs->win[BPB_SecPerClus];			/* Cluster size */
    4c16:	03d44483          	lbu	s1,61(s0)
    4c1a:	01049793          	slli	a5,s1,0x10
    4c1e:	83c1                	srli	a5,a5,0x10
    4c20:	00f41523          	sh	a5,10(s0)
		if (fs->csize == 0 || (fs->csize & (fs->csize - 1))) return FR_NO_FILESYSTEM;	/* (Must be power of 2) */
    4c24:	d7c5                	beqz	a5,4bcc <mount_volume+0xf8>
    4c26:	fff48793          	addi	a5,s1,-1
    4c2a:	8fe5                	and	a5,a5,s1
    4c2c:	f3c5                	bnez	a5,4bcc <mount_volume+0xf8>
	rv = ptr[1];
    4c2e:	04244683          	lbu	a3,66(s0)
    4c32:	04144783          	lbu	a5,65(s0)
    4c36:	06a2                	slli	a3,a3,0x8
    4c38:	8edd                	or	a3,a3,a5
		fs->n_rootdir = ld_word(fs->win + BPB_RootEntCnt);	/* Number of root directory entries */
    4c3a:	00d41423          	sh	a3,8(s0)
		if (fs->n_rootdir % (SS(fs) / SZDIRE)) return FR_NO_FILESYSTEM;	/* (Must be sector aligned) */
    4c3e:	00f6f793          	andi	a5,a3,15
    4c42:	f7c9                	bnez	a5,4bcc <mount_volume+0xf8>
		tsect = ld_word(fs->win + BPB_TotSec16);		/* Number of sectors on the volume */
    4c44:	04444503          	lbu	a0,68(s0)
    4c48:	04344783          	lbu	a5,67(s0)
    4c4c:	0522                	slli	a0,a0,0x8
    4c4e:	8d5d                	or	a0,a0,a5
		if (tsect == 0) tsect = ld_dword(fs->win + BPB_TotSec32);
    4c50:	ed09                	bnez	a0,4c6a <mount_volume+0x196>
    4c52:	05040513          	addi	a0,s0,80
    4c56:	c62e                	sw	a1,12(sp)
    4c58:	c43a                	sw	a4,8(sp)
    4c5a:	c236                	sw	a3,4(sp)
    4c5c:	c016                	sw	t0,0(sp)
    4c5e:	a15ff0ef          	jal	ra,4672 <ld_dword>
    4c62:	45b2                	lw	a1,12(sp)
    4c64:	4722                	lw	a4,8(sp)
    4c66:	4692                	lw	a3,4(sp)
    4c68:	4282                	lw	t0,0(sp)
	rv = ptr[1];
    4c6a:	03f44603          	lbu	a2,63(s0)
    4c6e:	03e44783          	lbu	a5,62(s0)
    4c72:	0622                	slli	a2,a2,0x8
    4c74:	8e5d                	or	a2,a2,a5
		if (nrsv == 0) return FR_NO_FILESYSTEM;			/* (Must not be 0) */
    4c76:	da39                	beqz	a2,4bcc <mount_volume+0xf8>
		fasize *= fs->n_fats;							/* Number of sectors for FAT area */
    4c78:	02e282b3          	mul	t0,t0,a4
		sysect = nrsv + fasize + fs->n_rootdir / (SS(fs) / SZDIRE);	/* RSV + FAT + DIR */
    4c7c:	0046d313          	srli	t1,a3,0x4
    4c80:	9332                	add	t1,t1,a2
    4c82:	9316                	add	t1,t1,t0
		if (tsect < sysect) return FR_NO_FILESYSTEM;	/* (Invalid volume size) */
    4c84:	f46564e3          	bltu	a0,t1,4bcc <mount_volume+0xf8>
		nclst = (tsect - sysect) / fs->csize;			/* Number of clusters */
    4c88:	40650533          	sub	a0,a0,t1
    4c8c:	029557b3          	divu	a5,a0,s1
		if (nclst == 0) return FR_NO_FILESYSTEM;		/* (Invalid volume size) */
    4c90:	f2956ee3          	bltu	a0,s1,4bcc <mount_volume+0xf8>
		if (nclst <= MAX_FAT32) fmt = FS_FAT32;
    4c94:	10000537          	lui	a0,0x10000
    4c98:	1555                	addi	a0,a0,-11
    4c9a:	f2f569e3          	bltu	a0,a5,4bcc <mount_volume+0xf8>
		if (nclst <= MAX_FAT16) fmt = FS_FAT16;
    4c9e:	6541                	lui	a0,0x10
    4ca0:	1555                	addi	a0,a0,-11
    4ca2:	10f57b63          	bgeu	a0,a5,4db8 <mount_volume+0x2e4>
		if (nclst <= MAX_FAT32) fmt = FS_FAT32;
    4ca6:	448d                	li	s1,3
		fs->n_fatent = nclst + 2;						/* Number of FAT entries */
    4ca8:	0789                	addi	a5,a5,2
		fs->fatbase = bsect + nrsv; 					/* FAT start sector */
    4caa:	962e                	add	a2,a2,a1
		fs->database = bsect + sysect;					/* Data start sector */
    4cac:	932e                	add	t1,t1,a1
		fs->n_fatent = nclst + 2;						/* Number of FAT entries */
    4cae:	c85c                	sw	a5,20(s0)
		fs->volbase = bsect;							/* Volume start sector */
    4cb0:	cc4c                	sw	a1,28(s0)
		fs->fatbase = bsect + nrsv; 					/* FAT start sector */
    4cb2:	d010                	sw	a2,32(s0)
		fs->database = bsect + sysect;					/* Data start sector */
    4cb4:	02642423          	sw	t1,40(s0)
		if (fmt == FS_FAT32) {
    4cb8:	450d                	li	a0,3
    4cba:	0ca49e63          	bne	s1,a0,4d96 <mount_volume+0x2c2>
	rv = rv << 8 | ptr[0];
    4cbe:	05b44603          	lbu	a2,91(s0)
    4cc2:	05a44503          	lbu	a0,90(s0)
    4cc6:	c42e                	sw	a1,8(sp)
    4cc8:	0622                	slli	a2,a2,0x8
    4cca:	8e49                	or	a2,a2,a0
    4ccc:	c23a                	sw	a4,4(sp)
    4cce:	c03e                	sw	a5,0(sp)
			if (ld_word(fs->win + BPB_FSVer32) != 0) return FR_NO_FILESYSTEM;	/* (Must be FAT32 revision 0.0) */
    4cd0:	8ed1                	or	a3,a3,a2
    4cd2:	ee069de3          	bnez	a3,4bcc <mount_volume+0xf8>
			fs->dirbase = ld_dword(fs->win + BPB_RootClus32);	/* Root directory start cluster */
    4cd6:	05c40513          	addi	a0,s0,92
    4cda:	999ff0ef          	jal	ra,4672 <ld_dword>
			szbfat = fs->n_fatent * 4;					/* (Needed FAT size) */
    4cde:	4782                	lw	a5,0(sp)
    4ce0:	4712                	lw	a4,4(sp)
    4ce2:	45a2                	lw	a1,8(sp)
			fs->dirbase = ld_dword(fs->win + BPB_RootClus32);	/* Root directory start cluster */
    4ce4:	d048                	sw	a0,36(s0)
			szbfat = fs->n_fatent * 4;					/* (Needed FAT size) */
    4ce6:	078a                	slli	a5,a5,0x2
		if (fs->fsize < (szbfat + (SS(fs) - 1)) / SS(fs)) return FR_NO_FILESYSTEM;	/* (BPB_FATSz must not be less than the size needed) */
    4ce8:	1ff78793          	addi	a5,a5,511
    4cec:	83a5                	srli	a5,a5,0x9
    4cee:	ecf76fe3          	bltu	a4,a5,4bcc <mount_volume+0xf8>
		fs->last_clst = fs->free_clst = 0xFFFFFFFF;		/* Initialize cluster allocation information */
    4cf2:	57fd                	li	a5,-1
    4cf4:	c81c                	sw	a5,16(s0)
    4cf6:	c45c                	sw	a5,12(s0)
		fs->fsi_flag = 0x80;
    4cf8:	f8000793          	li	a5,-128
    4cfc:	00f40223          	sb	a5,4(s0)
		if (fmt == FS_FAT32				/* Allow to update FSInfo only if BPB_FSInfo32 == 1 */
    4d00:	478d                	li	a5,3
    4d02:	06f49b63          	bne	s1,a5,4d78 <mount_volume+0x2a4>
			&& ld_word(fs->win + BPB_FSInfo32) == 1
    4d06:	06144783          	lbu	a5,97(s0)
    4d0a:	06044703          	lbu	a4,96(s0)
    4d0e:	07a2                	slli	a5,a5,0x8
    4d10:	8fd9                	or	a5,a5,a4
    4d12:	4705                	li	a4,1
    4d14:	06e79263          	bne	a5,a4,4d78 <mount_volume+0x2a4>
			&& move_window(fs, bsect + 1) == FR_OK)
    4d18:	0585                	addi	a1,a1,1
    4d1a:	8522                	mv	a0,s0
    4d1c:	ac9ff0ef          	jal	ra,47e4 <move_window>
    4d20:	ed21                	bnez	a0,4d78 <mount_volume+0x2a4>
			if (ld_word(fs->win + BS_55AA) == 0xAA55	/* Load FSInfo data if available */
    4d22:	22f44783          	lbu	a5,559(s0)
    4d26:	22e44703          	lbu	a4,558(s0)
			fs->fsi_flag = 0;
    4d2a:	00040223          	sb	zero,4(s0)
			if (ld_word(fs->win + BS_55AA) == 0xAA55	/* Load FSInfo data if available */
    4d2e:	07a2                	slli	a5,a5,0x8
    4d30:	8fd9                	or	a5,a5,a4
    4d32:	672d                	lui	a4,0xb
    4d34:	a5570713          	addi	a4,a4,-1451 # aa55 <__ctor_end__+0x21f5>
    4d38:	04e79063          	bne	a5,a4,4d78 <mount_volume+0x2a4>
				&& ld_dword(fs->win + FSI_LeadSig) == 0x41615252
    4d3c:	03040513          	addi	a0,s0,48
    4d40:	933ff0ef          	jal	ra,4672 <ld_dword>
    4d44:	416157b7          	lui	a5,0x41615
    4d48:	25278793          	addi	a5,a5,594 # 41615252 <__heap_end+0x215e5252>
    4d4c:	02f51663          	bne	a0,a5,4d78 <mount_volume+0x2a4>
				&& ld_dword(fs->win + FSI_StrucSig) == 0x61417272)
    4d50:	21440513          	addi	a0,s0,532
    4d54:	91fff0ef          	jal	ra,4672 <ld_dword>
    4d58:	614177b7          	lui	a5,0x61417
    4d5c:	27278793          	addi	a5,a5,626 # 61417272 <__heap_end+0x413e7272>
    4d60:	00f51c63          	bne	a0,a5,4d78 <mount_volume+0x2a4>
				fs->free_clst = ld_dword(fs->win + FSI_Free_Count);
    4d64:	21840513          	addi	a0,s0,536
    4d68:	90bff0ef          	jal	ra,4672 <ld_dword>
    4d6c:	c808                	sw	a0,16(s0)
				fs->last_clst = ld_dword(fs->win + FSI_Nxt_Free);
    4d6e:	21c40513          	addi	a0,s0,540
    4d72:	901ff0ef          	jal	ra,4672 <ld_dword>
    4d76:	c448                	sw	a0,12(s0)
	fs->id = ++Fsid;		/* Volume mount ID */
    4d78:	05c18713          	addi	a4,gp,92 # 20000544 <Fsid>
    4d7c:	00075783          	lhu	a5,0(a4)
	fs->fs_type = (BYTE)fmt;/* FAT sub-type */
    4d80:	00940023          	sb	s1,0(s0)
	return FR_OK;
    4d84:	4501                	li	a0,0
	fs->id = ++Fsid;		/* Volume mount ID */
    4d86:	0785                	addi	a5,a5,1
    4d88:	07c2                	slli	a5,a5,0x10
    4d8a:	83c1                	srli	a5,a5,0x10
    4d8c:	00f71023          	sh	a5,0(a4)
    4d90:	00f41323          	sh	a5,6(s0)
	return FR_OK;
    4d94:	bb61                	j	4b2c <mount_volume+0x58>
			if (fs->n_rootdir == 0)	return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must not be 0) */
    4d96:	e2068be3          	beqz	a3,4bcc <mount_volume+0xf8>
			fs->dirbase = fs->fatbase + fasize;			/* Root directory start sector */
    4d9a:	9616                	add	a2,a2,t0
    4d9c:	d050                	sw	a2,36(s0)
				fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
    4d9e:	4689                	li	a3,2
    4da0:	00d49463          	bne	s1,a3,4da8 <mount_volume+0x2d4>
    4da4:	0786                	slli	a5,a5,0x1
    4da6:	b789                	j	4ce8 <mount_volume+0x214>
    4da8:	02a78533          	mul	a0,a5,a0
    4dac:	8b85                	andi	a5,a5,1
    4dae:	8105                	srli	a0,a0,0x1
    4db0:	97aa                	add	a5,a5,a0
    4db2:	bf1d                	j	4ce8 <mount_volume+0x214>
	if (vol < 0) return FR_INVALID_DRIVE;
    4db4:	452d                	li	a0,11
    4db6:	bb9d                	j	4b2c <mount_volume+0x58>
		if (nclst <= MAX_FAT12) fmt = FS_FAT12;
    4db8:	6485                	lui	s1,0x1
    4dba:	14d5                	addi	s1,s1,-11
    4dbc:	00f4b4b3          	sltu	s1,s1,a5
    4dc0:	0485                	addi	s1,s1,1
    4dc2:	b5dd                	j	4ca8 <mount_volume+0x1d4>

00004dc4 <ld_clust.isra.0>:
	cl = ld_word(dir + DIR_FstClusLO);
    4dc4:	01b5c783          	lbu	a5,27(a1)
    4dc8:	01a5c703          	lbu	a4,26(a1)
    4dcc:	07a2                	slli	a5,a5,0x8
    4dce:	8fd9                	or	a5,a5,a4
	if (fs->fs_type == FS_FAT32) {
    4dd0:	470d                	li	a4,3
    4dd2:	00e51a63          	bne	a0,a4,4de6 <ld_clust.isra.0+0x22>
		cl |= (DWORD)ld_word(dir + DIR_FstClusHI) << 16;
    4dd6:	0155c703          	lbu	a4,21(a1)
    4dda:	0145c683          	lbu	a3,20(a1)
    4dde:	0722                	slli	a4,a4,0x8
    4de0:	8f55                	or	a4,a4,a3
    4de2:	0742                	slli	a4,a4,0x10
    4de4:	8fd9                	or	a5,a5,a4
}
    4de6:	853e                	mv	a0,a5
    4de8:	8082                	ret

00004dea <get_fat.isra.0>:
	if (clst < 2 || clst >= fs->n_fatent) {	/* Check if in valid range */
    4dea:	4785                	li	a5,1
    4dec:	0cb7fd63          	bgeu	a5,a1,4ec6 <get_fat.isra.0+0xdc>
    4df0:	4958                	lw	a4,20(a0)
static DWORD get_fat (		/* 0xFFFFFFFF:Disk error, 1:Internal error, 2..0x7FFFFFFF:Cluster status */
    4df2:	1131                	addi	sp,sp,-20
    4df4:	c622                	sw	s0,12(sp)
    4df6:	c426                	sw	s1,8(sp)
    4df8:	c806                	sw	ra,16(sp)
    4dfa:	84aa                	mv	s1,a0
    4dfc:	842e                	mv	s0,a1
	if (clst < 2 || clst >= fs->n_fatent) {	/* Check if in valid range */
    4dfe:	02e5f963          	bgeu	a1,a4,4e30 <get_fat.isra.0+0x46>
		switch (fs->fs_type) {
    4e02:	00054703          	lbu	a4,0(a0) # 10000 <__ctor_end__+0x77a0>
    4e06:	4689                	li	a3,2
    4e08:	06d70b63          	beq	a4,a3,4e7e <get_fat.isra.0+0x94>
    4e0c:	468d                	li	a3,3
    4e0e:	08d70a63          	beq	a4,a3,4ea2 <get_fat.isra.0+0xb8>
    4e12:	00f71f63          	bne	a4,a5,4e30 <get_fat.isra.0+0x46>
			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
    4e16:	5118                	lw	a4,32(a0)
			bc = (UINT)clst; bc += bc / 2;
    4e18:	0015d793          	srli	a5,a1,0x1
    4e1c:	97ae                	add	a5,a5,a1
			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
    4e1e:	0097d593          	srli	a1,a5,0x9
    4e22:	95ba                	add	a1,a1,a4
    4e24:	c03e                	sw	a5,0(sp)
    4e26:	9bfff0ef          	jal	ra,47e4 <move_window>
    4e2a:	4782                	lw	a5,0(sp)
    4e2c:	c901                	beqz	a0,4e3c <get_fat.isra.0+0x52>
		val = 0xFFFFFFFF;	/* Default value falls on disk error */
    4e2e:	57fd                	li	a5,-1
}
    4e30:	40c2                	lw	ra,16(sp)
    4e32:	4432                	lw	s0,12(sp)
    4e34:	44a2                	lw	s1,8(sp)
    4e36:	853e                	mv	a0,a5
    4e38:	0151                	addi	sp,sp,20
    4e3a:	8082                	ret
			wc = fs->win[bc++ % SS(fs)];		/* Get 1st byte of the entry */
    4e3c:	00178713          	addi	a4,a5,1
    4e40:	1ff7f793          	andi	a5,a5,511
    4e44:	97a6                	add	a5,a5,s1
    4e46:	0307c683          	lbu	a3,48(a5)
			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
    4e4a:	509c                	lw	a5,32(s1)
    4e4c:	00975593          	srli	a1,a4,0x9
    4e50:	8526                	mv	a0,s1
    4e52:	95be                	add	a1,a1,a5
			wc = fs->win[bc++ % SS(fs)];		/* Get 1st byte of the entry */
    4e54:	c236                	sw	a3,4(sp)
			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
    4e56:	c03a                	sw	a4,0(sp)
    4e58:	98dff0ef          	jal	ra,47e4 <move_window>
    4e5c:	f969                	bnez	a0,4e2e <get_fat.isra.0+0x44>
			wc |= fs->win[bc % SS(fs)] << 8;	/* Merge 2nd byte of the entry */
    4e5e:	4702                	lw	a4,0(sp)
    4e60:	4692                	lw	a3,4(sp)
			val = (clst & 1) ? (wc >> 4) : (wc & 0xFFF);	/* Adjust bit position */
    4e62:	8805                	andi	s0,s0,1
			wc |= fs->win[bc % SS(fs)] << 8;	/* Merge 2nd byte of the entry */
    4e64:	1ff77713          	andi	a4,a4,511
    4e68:	94ba                	add	s1,s1,a4
    4e6a:	0304c783          	lbu	a5,48(s1) # 1030 <__divdf3+0x186>
    4e6e:	07a2                	slli	a5,a5,0x8
    4e70:	8fd5                	or	a5,a5,a3
			val = (clst & 1) ? (wc >> 4) : (wc & 0xFFF);	/* Adjust bit position */
    4e72:	c019                	beqz	s0,4e78 <get_fat.isra.0+0x8e>
			val = ld_dword(fs->win + clst * 4 % SS(fs)) & 0x0FFFFFFF;	/* Simple DWORD array but mask out upper 4 bits */
    4e74:	8391                	srli	a5,a5,0x4
			break;
    4e76:	bf6d                	j	4e30 <get_fat.isra.0+0x46>
			val = (clst & 1) ? (wc >> 4) : (wc & 0xFFF);	/* Adjust bit position */
    4e78:	07d2                	slli	a5,a5,0x14
    4e7a:	83d1                	srli	a5,a5,0x14
    4e7c:	bf55                	j	4e30 <get_fat.isra.0+0x46>
			if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 2))) != FR_OK) break;
    4e7e:	0085d793          	srli	a5,a1,0x8
    4e82:	510c                	lw	a1,32(a0)
    4e84:	95be                	add	a1,a1,a5
    4e86:	95fff0ef          	jal	ra,47e4 <move_window>
    4e8a:	f155                	bnez	a0,4e2e <get_fat.isra.0+0x44>
			val = ld_word(fs->win + clst * 2 % SS(fs));		/* Simple WORD array */
    4e8c:	0406                	slli	s0,s0,0x1
    4e8e:	1fe47413          	andi	s0,s0,510
    4e92:	94a2                	add	s1,s1,s0
    4e94:	0314c783          	lbu	a5,49(s1)
    4e98:	0304c503          	lbu	a0,48(s1)
    4e9c:	07a2                	slli	a5,a5,0x8
    4e9e:	8fc9                	or	a5,a5,a0
			break;
    4ea0:	bf41                	j	4e30 <get_fat.isra.0+0x46>
			if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4))) != FR_OK) break;
    4ea2:	0075d793          	srli	a5,a1,0x7
    4ea6:	510c                	lw	a1,32(a0)
    4ea8:	95be                	add	a1,a1,a5
    4eaa:	93bff0ef          	jal	ra,47e4 <move_window>
    4eae:	f141                	bnez	a0,4e2e <get_fat.isra.0+0x44>
			val = ld_dword(fs->win + clst * 4 % SS(fs)) & 0x0FFFFFFF;	/* Simple DWORD array but mask out upper 4 bits */
    4eb0:	040a                	slli	s0,s0,0x2
    4eb2:	03048513          	addi	a0,s1,48
    4eb6:	1fc47413          	andi	s0,s0,508
    4eba:	9522                	add	a0,a0,s0
    4ebc:	fb6ff0ef          	jal	ra,4672 <ld_dword>
    4ec0:	00451793          	slli	a5,a0,0x4
    4ec4:	bf45                	j	4e74 <get_fat.isra.0+0x8a>
		val = 1;	/* Internal error */
    4ec6:	4785                	li	a5,1
}
    4ec8:	853e                	mv	a0,a5
    4eca:	8082                	ret

00004ecc <remove_chain.isra.0>:
static FRESULT remove_chain (	/* FR_OK(0):succeeded, !=0:error */
    4ecc:	1141                	addi	sp,sp,-16
    4ece:	c422                	sw	s0,8(sp)
    4ed0:	c606                	sw	ra,12(sp)
    4ed2:	c226                	sw	s1,4(sp)
	if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Check if in valid range */
    4ed4:	4785                	li	a5,1
static FRESULT remove_chain (	/* FR_OK(0):succeeded, !=0:error */
    4ed6:	842e                	mv	s0,a1
	if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Check if in valid range */
    4ed8:	06b7f563          	bgeu	a5,a1,4f42 <remove_chain.isra.0+0x76>
    4edc:	495c                	lw	a5,20(a0)
    4ede:	84aa                	mv	s1,a0
    4ee0:	06f5f163          	bgeu	a1,a5,4f42 <remove_chain.isra.0+0x76>
    4ee4:	85b2                	mv	a1,a2
	if (pclst != 0 && (!FF_FS_EXFAT || fs->fs_type != FS_EXFAT || obj->stat != 2)) {
    4ee6:	c609                	beqz	a2,4ef0 <remove_chain.isra.0+0x24>
		res = put_fat(fs, pclst, 0xFFFFFFFF);
    4ee8:	567d                	li	a2,-1
    4eea:	a13ff0ef          	jal	ra,48fc <put_fat>
		if (res != FR_OK) return res;
    4eee:	e909                	bnez	a0,4f00 <remove_chain.isra.0+0x34>
		nxt = get_fat(obj, clst);			/* Get cluster status */
    4ef0:	85a2                	mv	a1,s0
    4ef2:	8526                	mv	a0,s1
    4ef4:	c022                	sw	s0,0(sp)
    4ef6:	3dd5                	jal	4dea <get_fat.isra.0>
		if (nxt == 0) break;				/* Empty cluster? */
    4ef8:	4582                	lw	a1,0(sp)
    4efa:	842a                	mv	s0,a0
    4efc:	e519                	bnez	a0,4f0a <remove_chain.isra.0+0x3e>
	return FR_OK;
    4efe:	4501                	li	a0,0
}
    4f00:	40b2                	lw	ra,12(sp)
    4f02:	4422                	lw	s0,8(sp)
    4f04:	4492                	lw	s1,4(sp)
    4f06:	0141                	addi	sp,sp,16
    4f08:	8082                	ret
		if (nxt == 1) return FR_INT_ERR;	/* Internal error? */
    4f0a:	4785                	li	a5,1
    4f0c:	02f50b63          	beq	a0,a5,4f42 <remove_chain.isra.0+0x76>
		if (nxt == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error? */
    4f10:	57fd                	li	a5,-1
    4f12:	02f50a63          	beq	a0,a5,4f46 <remove_chain.isra.0+0x7a>
			res = put_fat(fs, clst, 0);		/* Mark the cluster 'free' on the FAT */
    4f16:	4601                	li	a2,0
    4f18:	8526                	mv	a0,s1
    4f1a:	9e3ff0ef          	jal	ra,48fc <put_fat>
			if (res != FR_OK) return res;
    4f1e:	f16d                	bnez	a0,4f00 <remove_chain.isra.0+0x34>
		if (fs->free_clst < fs->n_fatent - 2) {	/* Update FSINFO */
    4f20:	48d8                	lw	a4,20(s1)
    4f22:	489c                	lw	a5,16(s1)
    4f24:	ffe70693          	addi	a3,a4,-2
    4f28:	00d7fa63          	bgeu	a5,a3,4f3c <remove_chain.isra.0+0x70>
			fs->free_clst++;
    4f2c:	0785                	addi	a5,a5,1
    4f2e:	c89c                	sw	a5,16(s1)
			fs->fsi_flag |= 1;
    4f30:	0044c783          	lbu	a5,4(s1)
    4f34:	0017e793          	ori	a5,a5,1
    4f38:	00f48223          	sb	a5,4(s1)
	} while (clst < fs->n_fatent);	/* Repeat while not the last link */
    4f3c:	fae46ae3          	bltu	s0,a4,4ef0 <remove_chain.isra.0+0x24>
    4f40:	bf7d                	j	4efe <remove_chain.isra.0+0x32>
	if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Check if in valid range */
    4f42:	4509                	li	a0,2
    4f44:	bf75                	j	4f00 <remove_chain.isra.0+0x34>
		if (nxt == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error? */
    4f46:	4505                	li	a0,1
    4f48:	bf65                	j	4f00 <remove_chain.isra.0+0x34>

00004f4a <create_chain.isra.0>:
static DWORD create_chain (	/* 0:No free cluster, 1:Internal error, 0xFFFFFFFF:Disk error, >=2:New cluster# */
    4f4a:	1131                	addi	sp,sp,-20
    4f4c:	c426                	sw	s1,8(sp)
    4f4e:	c806                	sw	ra,16(sp)
    4f50:	c622                	sw	s0,12(sp)
    4f52:	c02e                	sw	a1,0(sp)
    4f54:	84aa                	mv	s1,a0
	if (clst == 0) {	/* Create a new chain */
    4f56:	e981                	bnez	a1,4f66 <create_chain.isra.0+0x1c>
		scl = fs->last_clst;				/* Suggested cluster to start to find */
    4f58:	4558                	lw	a4,12(a0)
		if (scl == 0 || scl >= fs->n_fatent) scl = 1;
    4f5a:	c701                	beqz	a4,4f62 <create_chain.isra.0+0x18>
    4f5c:	4954                	lw	a3,20(a0)
    4f5e:	02d76763          	bltu	a4,a3,4f8c <create_chain.isra.0+0x42>
    4f62:	4705                	li	a4,1
    4f64:	a025                	j	4f8c <create_chain.isra.0+0x42>
		cs = get_fat(obj, clst);			/* Check the cluster status */
    4f66:	3551                	jal	4dea <get_fat.isra.0>
		if (cs < 2) return 1;				/* Test for insanity */
    4f68:	4705                	li	a4,1
    4f6a:	842a                	mv	s0,a0
    4f6c:	00a76963          	bltu	a4,a0,4f7e <create_chain.isra.0+0x34>
    4f70:	4405                	li	s0,1
}
    4f72:	40c2                	lw	ra,16(sp)
    4f74:	8522                	mv	a0,s0
    4f76:	4432                	lw	s0,12(sp)
    4f78:	44a2                	lw	s1,8(sp)
    4f7a:	0151                	addi	sp,sp,20
    4f7c:	8082                	ret
		if (cs == 0xFFFFFFFF) return cs;	/* Test for disk error */
    4f7e:	577d                	li	a4,-1
    4f80:	0ae50f63          	beq	a0,a4,503e <create_chain.isra.0+0xf4>
		if (cs < fs->n_fatent) return cs;	/* It is already followed by next cluster */
    4f84:	48d8                	lw	a4,20(s1)
    4f86:	fee566e3          	bltu	a0,a4,4f72 <create_chain.isra.0+0x28>
    4f8a:	4702                	lw	a4,0(sp)
	if (fs->free_clst == 0) return 0;		/* No free cluster */
    4f8c:	4894                	lw	a3,16(s1)
    4f8e:	e299                	bnez	a3,4f94 <create_chain.isra.0+0x4a>
    4f90:	4401                	li	s0,0
    4f92:	b7c5                	j	4f72 <create_chain.isra.0+0x28>
		if (scl == clst) {						/* Stretching an existing chain? */
    4f94:	4782                	lw	a5,0(sp)
    4f96:	02e79c63          	bne	a5,a4,4fce <create_chain.isra.0+0x84>
			if (ncl >= fs->n_fatent) ncl = 2;
    4f9a:	48d4                	lw	a3,20(s1)
			ncl = scl + 1;						/* Test if next cluster is free */
    4f9c:	00178413          	addi	s0,a5,1
			if (ncl >= fs->n_fatent) ncl = 2;
    4fa0:	00d46363          	bltu	s0,a3,4fa6 <create_chain.isra.0+0x5c>
    4fa4:	4409                	li	s0,2
    4fa6:	85a2                	mv	a1,s0
    4fa8:	8526                	mv	a0,s1
    4faa:	c23a                	sw	a4,4(sp)
			cs = get_fat(obj, ncl);				/* Get next cluster status */
    4fac:	e3fff0ef          	jal	ra,4dea <get_fat.isra.0>
			if (cs == 1 || cs == 0xFFFFFFFF) return cs;	/* Test for error */
    4fb0:	4605                	li	a2,1
    4fb2:	fac50fe3          	beq	a0,a2,4f70 <create_chain.isra.0+0x26>
    4fb6:	56fd                	li	a3,-1
    4fb8:	08d50363          	beq	a0,a3,503e <create_chain.isra.0+0xf4>
			if (cs != 0) {						/* Not free? */
    4fbc:	4712                	lw	a4,4(sp)
    4fbe:	c129                	beqz	a0,5000 <create_chain.isra.0+0xb6>
				cs = fs->last_clst;				/* Start at suggested cluster if it is valid */
    4fc0:	44d4                	lw	a3,12(s1)
				if (cs >= 2 && cs < fs->n_fatent) scl = cs;
    4fc2:	00d67663          	bgeu	a2,a3,4fce <create_chain.isra.0+0x84>
    4fc6:	48d0                	lw	a2,20(s1)
    4fc8:	00c6f363          	bgeu	a3,a2,4fce <create_chain.isra.0+0x84>
    4fcc:	8736                	mv	a4,a3
    4fce:	843a                	mv	s0,a4
				if (ncl >= fs->n_fatent) {		/* Check wrap-around */
    4fd0:	48d4                	lw	a3,20(s1)
				ncl++;							/* Next cluster */
    4fd2:	0405                	addi	s0,s0,1
				if (ncl >= fs->n_fatent) {		/* Check wrap-around */
    4fd4:	00d46663          	bltu	s0,a3,4fe0 <create_chain.isra.0+0x96>
					if (ncl > scl) return 0;	/* No free cluster found? */
    4fd8:	4685                	li	a3,1
    4fda:	fae6fbe3          	bgeu	a3,a4,4f90 <create_chain.isra.0+0x46>
					ncl = 2;
    4fde:	4409                	li	s0,2
    4fe0:	85a2                	mv	a1,s0
    4fe2:	8526                	mv	a0,s1
    4fe4:	c23a                	sw	a4,4(sp)
				cs = get_fat(obj, ncl);			/* Get the cluster status */
    4fe6:	e05ff0ef          	jal	ra,4dea <get_fat.isra.0>
				if (cs == 0) break;				/* Found a free cluster? */
    4fea:	cd01                	beqz	a0,5002 <create_chain.isra.0+0xb8>
				if (cs == 1 || cs == 0xFFFFFFFF) return cs;	/* Test for error */
    4fec:	4685                	li	a3,1
    4fee:	f8d501e3          	beq	a0,a3,4f70 <create_chain.isra.0+0x26>
    4ff2:	56fd                	li	a3,-1
    4ff4:	04d50563          	beq	a0,a3,503e <create_chain.isra.0+0xf4>
				if (ncl == scl) return 0;		/* No free cluster found? */
    4ff8:	4712                	lw	a4,4(sp)
    4ffa:	fc871be3          	bne	a4,s0,4fd0 <create_chain.isra.0+0x86>
    4ffe:	bf49                	j	4f90 <create_chain.isra.0+0x46>
		if (ncl == 0) {	/* The new cluster cannot be contiguous and find another fragment */
    5000:	d479                	beqz	s0,4fce <create_chain.isra.0+0x84>
		res = put_fat(fs, ncl, 0xFFFFFFFF);		/* Mark the new cluster 'EOC' */
    5002:	567d                	li	a2,-1
    5004:	85a2                	mv	a1,s0
    5006:	8526                	mv	a0,s1
    5008:	8f5ff0ef          	jal	ra,48fc <put_fat>
		if (res == FR_OK && clst != 0) {
    500c:	e515                	bnez	a0,5038 <create_chain.isra.0+0xee>
    500e:	4782                	lw	a5,0(sp)
    5010:	ef91                	bnez	a5,502c <create_chain.isra.0+0xe2>
		if (fs->free_clst <= fs->n_fatent - 2) fs->free_clst--;
    5012:	48d4                	lw	a3,20(s1)
    5014:	4898                	lw	a4,16(s1)
		fs->last_clst = ncl;
    5016:	c4c0                	sw	s0,12(s1)
		if (fs->free_clst <= fs->n_fatent - 2) fs->free_clst--;
    5018:	16f9                	addi	a3,a3,-2
    501a:	02e6f463          	bgeu	a3,a4,5042 <create_chain.isra.0+0xf8>
		fs->fsi_flag |= 1;
    501e:	0044c703          	lbu	a4,4(s1)
    5022:	00176713          	ori	a4,a4,1
    5026:	00e48223          	sb	a4,4(s1)
    502a:	b7a1                	j	4f72 <create_chain.isra.0+0x28>
			res = put_fat(fs, clst, ncl);		/* Link it from the previous one if needed */
    502c:	4582                	lw	a1,0(sp)
    502e:	8622                	mv	a2,s0
    5030:	8526                	mv	a0,s1
    5032:	8cbff0ef          	jal	ra,48fc <put_fat>
	if (res == FR_OK) {			/* Update FSINFO if function succeeded. */
    5036:	dd71                	beqz	a0,5012 <create_chain.isra.0+0xc8>
		ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;	/* Failed. Generate error status */
    5038:	4785                	li	a5,1
    503a:	f2f51be3          	bne	a0,a5,4f70 <create_chain.isra.0+0x26>
    503e:	547d                	li	s0,-1
    5040:	bf0d                	j	4f72 <create_chain.isra.0+0x28>
		if (fs->free_clst <= fs->n_fatent - 2) fs->free_clst--;
    5042:	177d                	addi	a4,a4,-1
    5044:	c898                	sw	a4,16(s1)
    5046:	bfe1                	j	501e <create_chain.isra.0+0xd4>

00005048 <dir_sdi.constprop.0>:
static FRESULT dir_sdi (	/* FR_OK(0):succeeded, !=0:error */
    5048:	1141                	addi	sp,sp,-16
	clst = dp->obj.sclust;		/* Table start cluster (0:root) */
    504a:	450c                	lw	a1,8(a0)
static FRESULT dir_sdi (	/* FR_OK(0):succeeded, !=0:error */
    504c:	c422                	sw	s0,8(sp)
    504e:	c226                	sw	s1,4(sp)
    5050:	c606                	sw	ra,12(sp)
	dp->dptr = ofs;				/* Set current offset */
    5052:	00052823          	sw	zero,16(a0)
	FATFS *fs = dp->obj.fs;
    5056:	4104                	lw	s1,0(a0)
static FRESULT dir_sdi (	/* FR_OK(0):succeeded, !=0:error */
    5058:	842a                	mv	s0,a0
	if (clst == 0 && fs->fs_type >= FS_FAT32) {	/* Replace cluster# 0 with root cluster# */
    505a:	ed85                	bnez	a1,5092 <dir_sdi.constprop.0+0x4a>
    505c:	0004c703          	lbu	a4,0(s1)
    5060:	4789                	li	a5,2
    5062:	00e7f463          	bgeu	a5,a4,506a <dir_sdi.constprop.0+0x22>
		clst = (DWORD)fs->dirbase;
    5066:	50dc                	lw	a5,36(s1)
	if (clst == 0) {	/* Static table (root-directory on the FAT volume) */
    5068:	e785                	bnez	a5,5090 <dir_sdi.constprop.0+0x48>
		if (ofs / SZDIRE >= fs->n_rootdir) return FR_INT_ERR;	/* Is index out of range? */
    506a:	0084d783          	lhu	a5,8(s1)
    506e:	e799                	bnez	a5,507c <dir_sdi.constprop.0+0x34>
    5070:	4509                	li	a0,2
}
    5072:	40b2                	lw	ra,12(sp)
    5074:	4422                	lw	s0,8(sp)
    5076:	4492                	lw	s1,4(sp)
    5078:	0141                	addi	sp,sp,16
    507a:	8082                	ret
		dp->sect = fs->dirbase;
    507c:	50dc                	lw	a5,36(s1)
    507e:	cc1c                	sw	a5,24(s0)
	if (dp->sect == 0) return FR_INT_ERR;
    5080:	4c1c                	lw	a5,24(s0)
	dp->clust = clst;					/* Current cluster# */
    5082:	c84c                	sw	a1,20(s0)
	if (dp->sect == 0) return FR_INT_ERR;
    5084:	d7f5                	beqz	a5,5070 <dir_sdi.constprop.0+0x28>
	dp->dir = fs->win + (ofs % SS(fs));	/* Pointer to the entry in the win[] */
    5086:	03048493          	addi	s1,s1,48
    508a:	cc44                	sw	s1,28(s0)
	return FR_OK;
    508c:	4501                	li	a0,0
    508e:	b7d5                	j	5072 <dir_sdi.constprop.0+0x2a>
    5090:	85be                	mv	a1,a5
		csz = (DWORD)fs->csize * SS(fs);	/* Bytes per cluster */
    5092:	00a4d783          	lhu	a5,10(s1)
		while (ofs >= csz) {				/* Follow cluster chain */
    5096:	ef99                	bnez	a5,50b4 <dir_sdi.constprop.0+0x6c>
			clst = get_fat(&dp->obj, clst);				/* Get next cluster */
    5098:	4008                	lw	a0,0(s0)
    509a:	d51ff0ef          	jal	ra,4dea <get_fat.isra.0>
			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    509e:	57fd                	li	a5,-1
			clst = get_fat(&dp->obj, clst);				/* Get next cluster */
    50a0:	85aa                	mv	a1,a0
			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    50a2:	02f50063          	beq	a0,a5,50c2 <dir_sdi.constprop.0+0x7a>
			if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Reached to end of table or internal error */
    50a6:	4785                	li	a5,1
    50a8:	fca7f4e3          	bgeu	a5,a0,5070 <dir_sdi.constprop.0+0x28>
    50ac:	48dc                	lw	a5,20(s1)
    50ae:	fef565e3          	bltu	a0,a5,5098 <dir_sdi.constprop.0+0x50>
    50b2:	bf7d                	j	5070 <dir_sdi.constprop.0+0x28>
		dp->sect = clst2sect(fs, clst);
    50b4:	8526                	mv	a0,s1
    50b6:	c02e                	sw	a1,0(sp)
    50b8:	de6ff0ef          	jal	ra,469e <clst2sect>
    50bc:	4582                	lw	a1,0(sp)
    50be:	cc08                	sw	a0,24(s0)
    50c0:	b7c1                	j	5080 <dir_sdi.constprop.0+0x38>
			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    50c2:	4505                	li	a0,1
    50c4:	b77d                	j	5072 <dir_sdi.constprop.0+0x2a>

000050c6 <dir_next>:
	ofs = dp->dptr + SZDIRE;	/* Next entry */
    50c6:	491c                	lw	a5,16(a0)
{
    50c8:	1121                	addi	sp,sp,-24
    50ca:	c822                	sw	s0,16(sp)
	ofs = dp->dptr + SZDIRE;	/* Next entry */
    50cc:	02078793          	addi	a5,a5,32
{
    50d0:	c626                	sw	s1,12(sp)
    50d2:	ca06                	sw	ra,20(sp)
	ofs = dp->dptr + SZDIRE;	/* Next entry */
    50d4:	c03e                	sw	a5,0(sp)
	if (ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR)) dp->sect = 0;	/* Disable it if the offset reached the max value */
    50d6:	002006b7          	lui	a3,0x200
	FATFS *fs = dp->obj.fs;
    50da:	4100                	lw	s0,0(a0)
{
    50dc:	84aa                	mv	s1,a0
    50de:	862e                	mv	a2,a1
	if (ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR)) dp->sect = 0;	/* Disable it if the offset reached the max value */
    50e0:	00d7e463          	bltu	a5,a3,50e8 <dir_next+0x22>
    50e4:	00052c23          	sw	zero,24(a0)
	if (dp->sect == 0) return FR_NO_FILE;	/* Report EOT if it has been disabled */
    50e8:	4c94                	lw	a3,24(s1)
    50ea:	4511                	li	a0,4
    50ec:	c685                	beqz	a3,5114 <dir_next+0x4e>
	if (ofs % SS(fs) == 0) {	/* Sector changed? */
    50ee:	4782                	lw	a5,0(sp)
    50f0:	1ff7f793          	andi	a5,a5,511
    50f4:	c23e                	sw	a5,4(sp)
    50f6:	ebc9                	bnez	a5,5188 <dir_next+0xc2>
		if (dp->clust == 0) {	/* Static table */
    50f8:	48cc                	lw	a1,20(s1)
		dp->sect++;				/* Next sector */
    50fa:	0685                	addi	a3,a3,1
    50fc:	cc94                	sw	a3,24(s1)
		if (dp->clust == 0) {	/* Static table */
    50fe:	e185                	bnez	a1,511e <dir_next+0x58>
			if (ofs / SZDIRE >= fs->n_rootdir) {	/* Report EOT if it reached end of static table */
    5100:	4782                	lw	a5,0(sp)
    5102:	00845603          	lhu	a2,8(s0)
    5106:	0057d693          	srli	a3,a5,0x5
    510a:	06c6ef63          	bltu	a3,a2,5188 <dir_next+0xc2>
				dp->sect = 0; return FR_NO_FILE;
    510e:	0004ac23          	sw	zero,24(s1)
    5112:	4511                	li	a0,4
}
    5114:	40d2                	lw	ra,20(sp)
    5116:	4442                	lw	s0,16(sp)
    5118:	44b2                	lw	s1,12(sp)
    511a:	0161                	addi	sp,sp,24
    511c:	8082                	ret
			if ((ofs / SS(fs) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
    511e:	00a45683          	lhu	a3,10(s0)
    5122:	4782                	lw	a5,0(sp)
    5124:	16fd                	addi	a3,a3,-1
    5126:	0097d513          	srli	a0,a5,0x9
    512a:	8ee9                	and	a3,a3,a0
    512c:	eeb1                	bnez	a3,5188 <dir_next+0xc2>
				clst = get_fat(&dp->obj, dp->clust);		/* Get next cluster */
    512e:	8522                	mv	a0,s0
    5130:	c432                	sw	a2,8(sp)
    5132:	cb9ff0ef          	jal	ra,4dea <get_fat.isra.0>
				if (clst <= 1) return FR_INT_ERR;			/* Internal error */
    5136:	4685                	li	a3,1
    5138:	4622                	lw	a2,8(sp)
				clst = get_fat(&dp->obj, dp->clust);		/* Get next cluster */
    513a:	85aa                	mv	a1,a0
				if (clst <= 1) return FR_INT_ERR;			/* Internal error */
    513c:	00a6e463          	bltu	a3,a0,5144 <dir_next+0x7e>
    5140:	4509                	li	a0,2
    5142:	bfc9                	j	5114 <dir_next+0x4e>
				if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    5144:	557d                	li	a0,-1
    5146:	00a59463          	bne	a1,a0,514e <dir_next+0x88>
    514a:	4505                	li	a0,1
    514c:	b7e1                	j	5114 <dir_next+0x4e>
				if (clst >= fs->n_fatent) {					/* It reached end of dynamic table */
    514e:	4848                	lw	a0,20(s0)
    5150:	02a5e763          	bltu	a1,a0,517e <dir_next+0xb8>
					if (!stretch) {								/* If no stretch, report EOT */
    5154:	fa060de3          	beqz	a2,510e <dir_next+0x48>
					clst = create_chain(&dp->obj, dp->clust);	/* Allocate a cluster */
    5158:	48cc                	lw	a1,20(s1)
    515a:	4088                	lw	a0,0(s1)
    515c:	defff0ef          	jal	ra,4f4a <create_chain.isra.0>
    5160:	85aa                	mv	a1,a0
					if (clst == 0) return FR_DENIED;			/* No free cluster */
    5162:	451d                	li	a0,7
    5164:	d9c5                	beqz	a1,5114 <dir_next+0x4e>
					if (clst == 1) return FR_INT_ERR;			/* Internal error */
    5166:	4685                	li	a3,1
    5168:	fcd58ce3          	beq	a1,a3,5140 <dir_next+0x7a>
					if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    516c:	56fd                	li	a3,-1
    516e:	fcd58ee3          	beq	a1,a3,514a <dir_next+0x84>
					if (dir_clear(fs, clst) != FR_OK) return FR_DISK_ERR;	/* Clean up the stretched table */
    5172:	8522                	mv	a0,s0
    5174:	c42e                	sw	a1,8(sp)
    5176:	8f5ff0ef          	jal	ra,4a6a <dir_clear>
    517a:	45a2                	lw	a1,8(sp)
    517c:	f579                	bnez	a0,514a <dir_next+0x84>
				dp->clust = clst;		/* Initialize data for new cluster */
    517e:	c8cc                	sw	a1,20(s1)
				dp->sect = clst2sect(fs, clst);
    5180:	8522                	mv	a0,s0
    5182:	d1cff0ef          	jal	ra,469e <clst2sect>
    5186:	cc88                	sw	a0,24(s1)
	dp->dptr = ofs;						/* Current entry */
    5188:	4782                	lw	a5,0(sp)
	dp->dir = fs->win + ofs % SS(fs);	/* Pointer to the entry in the win[] */
    518a:	03040713          	addi	a4,s0,48
	return FR_OK;
    518e:	4501                	li	a0,0
	dp->dptr = ofs;						/* Current entry */
    5190:	c89c                	sw	a5,16(s1)
	dp->dir = fs->win + ofs % SS(fs);	/* Pointer to the entry in the win[] */
    5192:	4792                	lw	a5,4(sp)
    5194:	97ba                	add	a5,a5,a4
    5196:	ccdc                	sw	a5,28(s1)
	return FR_OK;
    5198:	bfb5                	j	5114 <dir_next+0x4e>

0000519a <dir_register>:
	FATFS *fs = dp->obj.fs;
    519a:	411c                	lw	a5,0(a0)
{
    519c:	1141                	addi	sp,sp,-16
    519e:	c422                	sw	s0,8(sp)
    51a0:	c226                	sw	s1,4(sp)
    51a2:	c606                	sw	ra,12(sp)
    51a4:	84aa                	mv	s1,a0
	FATFS *fs = dp->obj.fs;
    51a6:	c03e                	sw	a5,0(sp)
	res = dir_sdi(dp, 0);
    51a8:	3545                	jal	5048 <dir_sdi.constprop.0>
    51aa:	842a                	mv	s0,a0
	if (res == FR_OK) {
    51ac:	e125                	bnez	a0,520c <dir_register+0x72>
			res = move_window(fs, dp->sect);
    51ae:	4c8c                	lw	a1,24(s1)
    51b0:	4502                	lw	a0,0(sp)
    51b2:	e32ff0ef          	jal	ra,47e4 <move_window>
    51b6:	842a                	mv	s0,a0
			if (res != FR_OK) break;
    51b8:	e931                	bnez	a0,520c <dir_register+0x72>
			if (dp->dir[DIR_Name] == DDEM || dp->dir[DIR_Name] == 0) {	/* Is the entry free? */
    51ba:	4cd8                	lw	a4,28(s1)
    51bc:	0e500693          	li	a3,229
    51c0:	00074703          	lbu	a4,0(a4)
    51c4:	02d71e63          	bne	a4,a3,5200 <dir_register+0x66>
		res = move_window(fs, dp->sect);
    51c8:	4c8c                	lw	a1,24(s1)
    51ca:	4502                	lw	a0,0(sp)
    51cc:	e18ff0ef          	jal	ra,47e4 <move_window>
    51d0:	842a                	mv	s0,a0
		if (res == FR_OK) {
    51d2:	e10d                	bnez	a0,51f4 <dir_register+0x5a>
			mem_set(dp->dir, 0, SZDIRE);	/* Clean the entry */
    51d4:	4cc8                	lw	a0,28(s1)
    51d6:	02000613          	li	a2,32
    51da:	4581                	li	a1,0
    51dc:	cb4ff0ef          	jal	ra,4690 <mem_set>
	if (cnt != 0) {
    51e0:	4cc8                	lw	a0,28(s1)
    51e2:	462d                	li	a2,11
    51e4:	02048593          	addi	a1,s1,32
    51e8:	d7eff0ef          	jal	ra,4766 <mem_cpy.part.0>
			fs->wflag = 1;
    51ec:	4702                	lw	a4,0(sp)
    51ee:	4785                	li	a5,1
    51f0:	00f701a3          	sb	a5,3(a4)
}
    51f4:	40b2                	lw	ra,12(sp)
    51f6:	8522                	mv	a0,s0
    51f8:	4422                	lw	s0,8(sp)
    51fa:	4492                	lw	s1,4(sp)
    51fc:	0141                	addi	sp,sp,16
    51fe:	8082                	ret
			if (dp->dir[DIR_Name] == DDEM || dp->dir[DIR_Name] == 0) {	/* Is the entry free? */
    5200:	d761                	beqz	a4,51c8 <dir_register+0x2e>
			res = dir_next(dp, 1);	/* Next entry with table stretch enabled */
    5202:	4585                	li	a1,1
    5204:	8526                	mv	a0,s1
    5206:	35c1                	jal	50c6 <dir_next>
    5208:	842a                	mv	s0,a0
		} while (res == FR_OK);
    520a:	d155                	beqz	a0,51ae <dir_register+0x14>
	if (res == FR_NO_FILE) res = FR_DENIED;	/* No directory entry to allocate */
    520c:	4791                	li	a5,4
    520e:	fef413e3          	bne	s0,a5,51f4 <dir_register+0x5a>
    5212:	441d                	li	s0,7
    5214:	b7c5                	j	51f4 <dir_register+0x5a>

00005216 <follow_path>:
	FATFS *fs = dp->obj.fs;
    5216:	411c                	lw	a5,0(a0)
{
    5218:	1131                	addi	sp,sp,-20
    521a:	c622                	sw	s0,12(sp)
    521c:	c426                	sw	s1,8(sp)
    521e:	c806                	sw	ra,16(sp)
    5220:	842a                	mv	s0,a0
    5222:	84ae                	mv	s1,a1
	FATFS *fs = dp->obj.fs;
    5224:	c23e                	sw	a5,4(sp)
		while (*path == '/' || *path == '\\') path++;	/* Strip heading separator */
    5226:	02f00613          	li	a2,47
    522a:	05c00693          	li	a3,92
    522e:	0004c703          	lbu	a4,0(s1)
    5232:	02c70663          	beq	a4,a2,525e <follow_path+0x48>
    5236:	02d70463          	beq	a4,a3,525e <follow_path+0x48>
		dp->obj.sclust = 0;					/* Start from root directory */
    523a:	00042423          	sw	zero,8(s0)
	if ((UINT)*path < ' ') {				/* Null path name is the origin directory itself */
    523e:	0004c683          	lbu	a3,0(s1)
    5242:	477d                	li	a4,31
    5244:	10d76063          	bltu	a4,a3,5344 <follow_path+0x12e>
		dp->fn[NSFLAG] = NS_NONAME;
    5248:	f8000713          	li	a4,-128
    524c:	02e405a3          	sb	a4,43(s0)
		res = dir_sdi(dp, 0);
    5250:	8522                	mv	a0,s0
}
    5252:	4432                	lw	s0,12(sp)
    5254:	40c2                	lw	ra,16(sp)
    5256:	44a2                	lw	s1,8(sp)
    5258:	0151                	addi	sp,sp,20
		res = dir_sdi(dp, 0);
    525a:	defff06f          	j	5048 <dir_sdi.constprop.0>
		while (*path == '/' || *path == '\\') path++;	/* Strip heading separator */
    525e:	0485                	addi	s1,s1,1
    5260:	b7f9                	j	522e <follow_path+0x18>
		if (c == '/' || c == '\\') {	/* Break if a separator is found */
    5262:	05c00293          	li	t0,92
    5266:	10570963          	beq	a4,t0,5378 <follow_path+0x162>
		if (c == '.' || i >= ni) {		/* End of body or field overflow? */
    526a:	02e00293          	li	t0,46
    526e:	1a570363          	beq	a4,t0,5414 <follow_path+0x1fe>
    5272:	06a6ff63          	bgeu	a3,a0,52f0 <follow_path+0xda>
	if (c >= DbcTbl[0]) {
    5276:	08000293          	li	t0,128
    527a:	06e2fd63          	bgeu	t0,a4,52f4 <follow_path+0xde>
		if (c <= DbcTbl[1]) return 1;
    527e:	09f00293          	li	t0,159
    5282:	00e2f963          	bgeu	t0,a4,5294 <follow_path+0x7e>
		if (c >= DbcTbl[2] && c <= DbcTbl[3]) return 1;
    5286:	02070293          	addi	t0,a4,32
    528a:	0ff2f293          	andi	t0,t0,255
    528e:	43f1                	li	t2,28
    5290:	0653e263          	bltu	t2,t0,52f4 <follow_path+0xde>
			d = (BYTE)p[si++];			/* Get 2nd byte */
    5294:	9626                	add	a2,a2,s1
    5296:	00258293          	addi	t0,a1,2
    529a:	00064583          	lbu	a1,0(a2) # f0000000 <__heap_end+0xcffd0000>
	if (c >= DbcTbl[4]) {
    529e:	03f00613          	li	a2,63
    52a2:	04b67763          	bgeu	a2,a1,52f0 <follow_path+0xda>
		if (c <= DbcTbl[5]) return 1;
    52a6:	07e00613          	li	a2,126
    52aa:	00b67863          	bgeu	a2,a1,52ba <follow_path+0xa4>
		if (c >= DbcTbl[6] && c <= DbcTbl[7]) return 1;
    52ae:	0805c613          	xori	a2,a1,128
    52b2:	07c00393          	li	t2,124
    52b6:	02c3ed63          	bltu	t2,a2,52f0 <follow_path+0xda>
			if (!dbc_2nd(d) || i >= ni - 1) return FR_INVALID_NAME;	/* Reject invalid DBC */
    52ba:	fff50613          	addi	a2,a0,-1
    52be:	02c6f963          	bgeu	a3,a2,52f0 <follow_path+0xda>
			sfn[i++] = c;
    52c2:	4382                	lw	t2,0(sp)
    52c4:	00168613          	addi	a2,a3,1 # 200001 <__ctor_end__+0x1f77a1>
    52c8:	93b6                	add	t2,t2,a3
    52ca:	00e38023          	sb	a4,0(t2) # 10000000 <__ctor_end__+0xfff77a0>
			sfn[i++] = d;
    52ce:	4702                	lw	a4,0(sp)
    52d0:	0689                	addi	a3,a3,2
    52d2:	963a                	add	a2,a2,a4
    52d4:	00b60023          	sb	a1,0(a2)
			d = (BYTE)p[si++];			/* Get 2nd byte */
    52d8:	8616                	mv	a2,t0
			i = 8; ni = 11;				/* Enter file extension field */
    52da:	85b2                	mv	a1,a2
    52dc:	a061                	j	5364 <follow_path+0x14e>
			while (p[si] == '/' || p[si] == '\\') si++;	/* Skip duplicated separator if exist */
    52de:	0605                	addi	a2,a2,1
    52e0:	a045                	j	5380 <follow_path+0x16a>
	while (*str && *str != chr) str++;
    52e2:	0585                	addi	a1,a1,1
    52e4:	0005c283          	lbu	t0,0(a1)
    52e8:	12028c63          	beqz	t0,5420 <follow_path+0x20a>
    52ec:	fe571be3          	bne	a4,t0,52e2 <follow_path+0xcc>
			if (ni == 11 || c != '.') return FR_INVALID_NAME;	/* Field overflow or invalid dot? */
    52f0:	4519                	li	a0,6
	return res;
    52f2:	a005                	j	5312 <follow_path+0xfc>
    52f4:	65a1                	lui	a1,0x8
    52f6:	0e858593          	addi	a1,a1,232 # 80e8 <asc2_1608+0x5fc>
    52fa:	b7ed                	j	52e4 <follow_path+0xce>
		if (!(dp->dir[DIR_Attr] & AM_VOL) && !mem_cmp(dp->dir, dp->fn, 11)) break;	/* Is it a valid entry? */
    52fc:	10069563          	bnez	a3,5406 <follow_path+0x1f0>
			ns = dp->fn[NSFLAG];
    5300:	02b44703          	lbu	a4,43(s0)
			if (res != FR_OK) {				/* Failed to find the object */
    5304:	cd11                	beqz	a0,5320 <follow_path+0x10a>
				if (res == FR_NO_FILE) {	/* Object is not found */
    5306:	4791                	li	a5,4
    5308:	00f51563          	bne	a0,a5,5312 <follow_path+0xfc>
						if (!(ns & NS_LAST)) res = FR_NO_PATH;	/* Adjust error code if not last segment */
    530c:	8b11                	andi	a4,a4,4
    530e:	10070163          	beqz	a4,5410 <follow_path+0x1fa>
}
    5312:	40c2                	lw	ra,16(sp)
    5314:	4432                	lw	s0,12(sp)
    5316:	44a2                	lw	s1,8(sp)
    5318:	0151                	addi	sp,sp,20
    531a:	8082                	ret
		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
    531c:	4511                	li	a0,4
    531e:	b7cd                	j	5300 <follow_path+0xea>
			if (ns & NS_LAST) break;			/* Last segment matched. Function completed. */
    5320:	8b11                	andi	a4,a4,4
    5322:	fb65                	bnez	a4,5312 <follow_path+0xfc>
			if (!(dp->obj.attr & AM_DIR)) {		/* It is not a sub-directory and cannot follow */
    5324:	00644703          	lbu	a4,6(s0)
    5328:	8b41                	andi	a4,a4,16
    532a:	c37d                	beqz	a4,5410 <follow_path+0x1fa>
				dp->obj.sclust = ld_clust(fs, fs->win + dp->dptr % SS(fs));	/* Open next directory */
    532c:	4792                	lw	a5,4(sp)
    532e:	4818                	lw	a4,16(s0)
    5330:	0007c503          	lbu	a0,0(a5)
    5334:	03078593          	addi	a1,a5,48
    5338:	1ff77713          	andi	a4,a4,511
    533c:	95ba                	add	a1,a1,a4
    533e:	a87ff0ef          	jal	ra,4dc4 <ld_clust.isra.0>
    5342:	c408                	sw	a0,8(s0)
	p = *path; sfn = dp->fn;
    5344:	02040793          	addi	a5,s0,32
	mem_set(sfn, ' ', 11);
    5348:	853e                	mv	a0,a5
    534a:	02000593          	li	a1,32
    534e:	462d                	li	a2,11
	p = *path; sfn = dp->fn;
    5350:	c03e                	sw	a5,0(sp)
	mem_set(sfn, ' ', 11);
    5352:	b3eff0ef          	jal	ra,4690 <mem_set>
	si = i = 0; ni = 8;
    5356:	4681                	li	a3,0
    5358:	4581                	li	a1,0
    535a:	4521                	li	a0,8
		if (c <= ' ') break; 			/* Break if end of the path name */
    535c:	02000793          	li	a5,32
		if (c == '/' || c == '\\') {	/* Break if a separator is found */
    5360:	02f00313          	li	t1,47
		c = (BYTE)p[si++];				/* Get a byte */
    5364:	00b48733          	add	a4,s1,a1
    5368:	00074703          	lbu	a4,0(a4)
    536c:	00158613          	addi	a2,a1,1
		if (c <= ' ') break; 			/* Break if end of the path name */
    5370:	02e7f063          	bgeu	a5,a4,5390 <follow_path+0x17a>
		if (c == '/' || c == '\\') {	/* Break if a separator is found */
    5374:	ee6717e3          	bne	a4,t1,5262 <follow_path+0x4c>
			while (p[si] == '/' || p[si] == '\\') si++;	/* Skip duplicated separator if exist */
    5378:	02f00293          	li	t0,47
    537c:	05c00513          	li	a0,92
    5380:	00c485b3          	add	a1,s1,a2
    5384:	0005c583          	lbu	a1,0(a1)
    5388:	f4558be3          	beq	a1,t0,52de <follow_path+0xc8>
    538c:	f4a589e3          	beq	a1,a0,52de <follow_path+0xc8>
	*path = p + si;						/* Return pointer to the next segment */
    5390:	94b2                	add	s1,s1,a2
	if (i == 0) return FR_INVALID_NAME;	/* Reject nul string */
    5392:	deb9                	beqz	a3,52f0 <follow_path+0xda>
	if (sfn[0] == DDEM) sfn[0] = RDDEM;	/* If the first character collides with DDEM, replace it with RDDEM */
    5394:	02044603          	lbu	a2,32(s0)
    5398:	0e500693          	li	a3,229
    539c:	00d61563          	bne	a2,a3,53a6 <follow_path+0x190>
    53a0:	4695                	li	a3,5
    53a2:	02d40023          	sb	a3,32(s0)
	sfn[NSFLAG] = (c <= ' ') ? NS_LAST : 0;		/* Set last segment flag if end of the path */
    53a6:	02000613          	li	a2,32
    53aa:	4691                	li	a3,4
    53ac:	00e67363          	bgeu	a2,a4,53b2 <follow_path+0x19c>
    53b0:	4681                	li	a3,0
	FATFS *fs = dp->obj.fs;
    53b2:	401c                	lw	a5,0(s0)
	sfn[NSFLAG] = (c <= ' ') ? NS_LAST : 0;		/* Set last segment flag if end of the path */
    53b4:	02d405a3          	sb	a3,43(s0)
	res = dir_sdi(dp, 0);			/* Rewind directory object */
    53b8:	8522                	mv	a0,s0
	FATFS *fs = dp->obj.fs;
    53ba:	c03e                	sw	a5,0(sp)
	res = dir_sdi(dp, 0);			/* Rewind directory object */
    53bc:	c8dff0ef          	jal	ra,5048 <dir_sdi.constprop.0>
	if (res != FR_OK) return res;
    53c0:	f121                	bnez	a0,5300 <follow_path+0xea>
		res = move_window(fs, dp->sect);
    53c2:	4c0c                	lw	a1,24(s0)
    53c4:	4502                	lw	a0,0(sp)
    53c6:	c1eff0ef          	jal	ra,47e4 <move_window>
		if (res != FR_OK) break;
    53ca:	f91d                	bnez	a0,5300 <follow_path+0xea>
		c = dp->dir[DIR_Name];
    53cc:	4c50                	lw	a2,28(s0)
		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
    53ce:	00064703          	lbu	a4,0(a2)
    53d2:	d729                	beqz	a4,531c <follow_path+0x106>
		dp->obj.attr = dp->dir[DIR_Attr] & AM_MASK;
    53d4:	00b64703          	lbu	a4,11(a2)
    53d8:	03f77713          	andi	a4,a4,63
    53dc:	00e40323          	sb	a4,6(s0)
		if (!(dp->dir[DIR_Attr] & AM_VOL) && !mem_cmp(dp->dir, dp->fn, 11)) break;	/* Is it a valid entry? */
    53e0:	00b64703          	lbu	a4,11(a2)
    53e4:	8b21                	andi	a4,a4,8
    53e6:	e305                	bnez	a4,5406 <follow_path+0x1f0>
	} while (--cnt && r == 0);
    53e8:	45a9                	li	a1,10
		r = *d++ - *s++;
    53ea:	00e606b3          	add	a3,a2,a4
    53ee:	00e402b3          	add	t0,s0,a4
    53f2:	0006c683          	lbu	a3,0(a3)
    53f6:	0202c283          	lbu	t0,32(t0)
    53fa:	405686b3          	sub	a3,a3,t0
	} while (--cnt && r == 0);
    53fe:	eeb70fe3          	beq	a4,a1,52fc <follow_path+0xe6>
    5402:	0705                	addi	a4,a4,1
    5404:	d2fd                	beqz	a3,53ea <follow_path+0x1d4>
		res = dir_next(dp, 0);	/* Next entry */
    5406:	4581                	li	a1,0
    5408:	8522                	mv	a0,s0
    540a:	cbdff0ef          	jal	ra,50c6 <dir_next>
	} while (res == FR_OK);
    540e:	bf4d                	j	53c0 <follow_path+0x1aa>
						if (!(ns & NS_LAST)) res = FR_NO_PATH;	/* Adjust error code if not last segment */
    5410:	4515                	li	a0,5
    5412:	b701                	j	5312 <follow_path+0xfc>
			if (ni == 11 || c != '.') return FR_INVALID_NAME;	/* Field overflow or invalid dot? */
    5414:	472d                	li	a4,11
    5416:	ece50de3          	beq	a0,a4,52f0 <follow_path+0xda>
			i = 8; ni = 11;				/* Enter file extension field */
    541a:	46a1                	li	a3,8
    541c:	452d                	li	a0,11
    541e:	bd75                	j	52da <follow_path+0xc4>
			if (IsLower(c)) c -= 0x20;	/* To upper */
    5420:	f9f70593          	addi	a1,a4,-97
    5424:	0ff5f593          	andi	a1,a1,255
    5428:	42e5                	li	t0,25
    542a:	00b2e563          	bltu	t0,a1,5434 <follow_path+0x21e>
    542e:	1701                	addi	a4,a4,-32
    5430:	0ff77713          	andi	a4,a4,255
			sfn[i++] = c;
    5434:	4582                	lw	a1,0(sp)
    5436:	95b6                	add	a1,a1,a3
    5438:	00e58023          	sb	a4,0(a1)
    543c:	0685                	addi	a3,a3,1
    543e:	bd71                	j	52da <follow_path+0xc4>

00005440 <sync_fs>:
{
    5440:	1151                	addi	sp,sp,-12
    5442:	c222                	sw	s0,4(sp)
    5444:	c406                	sw	ra,8(sp)
    5446:	c026                	sw	s1,0(sp)
    5448:	842a                	mv	s0,a0
	res = sync_window(fs);
    544a:	b36ff0ef          	jal	ra,4780 <sync_window>
	if (res == FR_OK) {
    544e:	e171                	bnez	a0,5512 <sync_fs+0xd2>
		if (fs->fs_type == FS_FAT32 && fs->fsi_flag == 1) {	/* FAT32: Update FSInfo sector if needed */
    5450:	00044703          	lbu	a4,0(s0)
    5454:	478d                	li	a5,3
    5456:	0af71663          	bne	a4,a5,5502 <sync_fs+0xc2>
    545a:	00444703          	lbu	a4,4(s0)
    545e:	4785                	li	a5,1
    5460:	0af71163          	bne	a4,a5,5502 <sync_fs+0xc2>
			mem_set(fs->win, 0, sizeof fs->win);
    5464:	03040493          	addi	s1,s0,48
    5468:	20000613          	li	a2,512
    546c:	4581                	li	a1,0
    546e:	8526                	mv	a0,s1
    5470:	a20ff0ef          	jal	ra,4690 <mem_set>
	*ptr++ = (BYTE)val; val >>= 8;
    5474:	05500793          	li	a5,85
    5478:	22f40723          	sb	a5,558(s0)
	*ptr++ = (BYTE)val;
    547c:	faa00793          	li	a5,-86
    5480:	22f407a3          	sb	a5,559(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    5484:	05200793          	li	a5,82
    5488:	02f40823          	sb	a5,48(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    548c:	02f408a3          	sb	a5,49(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    5490:	06100793          	li	a5,97
    5494:	02f40923          	sb	a5,50(s0)
	*ptr++ = (BYTE)val;
    5498:	20f40ba3          	sb	a5,535(s0)
			st_dword(fs->win + FSI_Free_Count, fs->free_clst);	/* Number of free clusters */
    549c:	481c                	lw	a5,16(s0)
	*ptr++ = (BYTE)val;
    549e:	04100713          	li	a4,65
    54a2:	02e409a3          	sb	a4,51(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54a6:	20e40b23          	sb	a4,534(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54aa:	0087d713          	srli	a4,a5,0x8
    54ae:	20f40c23          	sb	a5,536(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54b2:	20e40ca3          	sb	a4,537(s0)
    54b6:	0107d713          	srli	a4,a5,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    54ba:	83e1                	srli	a5,a5,0x18
	*ptr++ = (BYTE)val;
    54bc:	20f40da3          	sb	a5,539(s0)
			st_dword(fs->win + FSI_Nxt_Free, fs->last_clst);	/* Last allocated culuster */
    54c0:	445c                	lw	a5,12(s0)
			fs->winsect = fs->volbase + 1;						/* Write it into the FSInfo sector (Next to VBR) */
    54c2:	4c50                	lw	a2,28(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54c4:	20e40d23          	sb	a4,538(s0)
			disk_write(fs->pdrv, fs->win, fs->winsect, 1);
    54c8:	00144503          	lbu	a0,1(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54cc:	0087d713          	srli	a4,a5,0x8
    54d0:	07200693          	li	a3,114
    54d4:	20f40e23          	sb	a5,540(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54d8:	20e40ea3          	sb	a4,541(s0)
			fs->winsect = fs->volbase + 1;						/* Write it into the FSInfo sector (Next to VBR) */
    54dc:	0605                	addi	a2,a2,1
	*ptr++ = (BYTE)val; val >>= 8;
    54de:	0107d713          	srli	a4,a5,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    54e2:	83e1                	srli	a5,a5,0x18
	*ptr++ = (BYTE)val; val >>= 8;
    54e4:	20d40a23          	sb	a3,532(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54e8:	20d40aa3          	sb	a3,533(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54ec:	20e40f23          	sb	a4,542(s0)
	*ptr++ = (BYTE)val;
    54f0:	20f40fa3          	sb	a5,543(s0)
			fs->winsect = fs->volbase + 1;						/* Write it into the FSInfo sector (Next to VBR) */
    54f4:	d450                	sw	a2,44(s0)
			disk_write(fs->pdrv, fs->win, fs->winsect, 1);
    54f6:	4685                	li	a3,1
    54f8:	85a6                	mv	a1,s1
    54fa:	4ef000ef          	jal	ra,61e8 <disk_write>
			fs->fsi_flag = 0;
    54fe:	00040223          	sb	zero,4(s0)
		if (disk_ioctl(fs->pdrv, CTRL_SYNC, 0) != RES_OK) res = FR_DISK_ERR;
    5502:	00144503          	lbu	a0,1(s0)
    5506:	4601                	li	a2,0
    5508:	4581                	li	a1,0
    550a:	575000ef          	jal	ra,627e <disk_ioctl>
    550e:	00a03533          	snez	a0,a0
}
    5512:	40a2                	lw	ra,8(sp)
    5514:	4412                	lw	s0,4(sp)
    5516:	4482                	lw	s1,0(sp)
    5518:	0131                	addi	sp,sp,12
    551a:	8082                	ret

0000551c <f_mount>:
FRESULT f_mount (
	FATFS* fs,			/* Pointer to the filesystem object (NULL:unmount)*/
	const TCHAR* path,	/* Logical drive number to be mounted/unmounted */
	BYTE opt			/* Mode option 0:Do not mount (delayed mount), 1:Mount immediately */
)
{
    551c:	1121                	addi	sp,sp,-24
    551e:	c22a                	sw	a0,4(sp)
	FRESULT res;
	const TCHAR *rp = path;


	/* Get logical drive number */
	vol = get_ldnumber(&rp);
    5520:	0028                	addi	a0,sp,8
{
    5522:	c822                	sw	s0,16(sp)
    5524:	ca06                	sw	ra,20(sp)
    5526:	c02e                	sw	a1,0(sp)
    5528:	8432                	mv	s0,a2
	const TCHAR *rp = path;
    552a:	c42e                	sw	a1,8(sp)
	vol = get_ldnumber(&rp);
    552c:	9b8ff0ef          	jal	ra,46e4 <get_ldnumber>
	if (vol < 0) return FR_INVALID_DRIVE;
    5530:	02054d63          	bltz	a0,556a <f_mount+0x4e>
	cfs = FatFs[vol];					/* Pointer to fs object */
    5534:	05818713          	addi	a4,gp,88 # 20000540 <FatFs>
    5538:	050a                	slli	a0,a0,0x2
    553a:	972a                	add	a4,a4,a0
    553c:	4318                	lw	a4,0(a4)

	if (cfs) {
    553e:	05818793          	addi	a5,gp,88 # 20000540 <FatFs>
    5542:	c319                	beqz	a4,5548 <f_mount+0x2c>
		clear_lock(cfs);
#endif
#if FF_FS_REENTRANT						/* Discard sync object of the current volume */
		if (!ff_del_syncobj(cfs->sobj)) return FR_INT_ERR;
#endif
		cfs->fs_type = 0;				/* Clear old fs object */
    5544:	00070023          	sb	zero,0(a4)
	}

	if (fs) {
    5548:	4712                	lw	a4,4(sp)
    554a:	c319                	beqz	a4,5550 <f_mount+0x34>
		fs->fs_type = 0;				/* Clear new fs object */
    554c:	00070023          	sb	zero,0(a4)
#if FF_FS_REENTRANT						/* Create sync object for the new volume */
		if (!ff_cre_syncobj((BYTE)vol, &fs->sobj)) return FR_INT_ERR;
#endif
	}
	FatFs[vol] = fs;					/* Register new fs object */
    5550:	953e                	add	a0,a0,a5
    5552:	c118                	sw	a4,0(a0)

	if (opt == 0) return FR_OK;			/* Do not mount now, it will be mounted later */
    5554:	4501                	li	a0,0
    5556:	c411                	beqz	s0,5562 <f_mount+0x46>

	res = mount_volume(&path, &fs, 0);	/* Force mounted the volume */
    5558:	4601                	li	a2,0
    555a:	004c                	addi	a1,sp,4
    555c:	850a                	mv	a0,sp
    555e:	d76ff0ef          	jal	ra,4ad4 <mount_volume>
	LEAVE_FF(fs, res);
}
    5562:	40d2                	lw	ra,20(sp)
    5564:	4442                	lw	s0,16(sp)
    5566:	0161                	addi	sp,sp,24
    5568:	8082                	ret
	if (vol < 0) return FR_INVALID_DRIVE;
    556a:	452d                	li	a0,11
    556c:	bfdd                	j	5562 <f_mount+0x46>

0000556e <f_open>:
FRESULT f_open (
	FIL* fp,			/* Pointer to the blank file object */
	const TCHAR* path,	/* Pointer to the file name */
	BYTE mode			/* Access mode and file open mode flags */
)
{
    556e:	715d                	addi	sp,sp,-80
    5570:	c686                	sw	ra,76(sp)
    5572:	c4a2                	sw	s0,72(sp)
    5574:	c2a6                	sw	s1,68(sp)
    5576:	c82e                	sw	a1,16(sp)
	FSIZE_t ofs;
#endif
	DEF_NAMBUF


	if (!fp) return FR_INVALID_OBJECT;
    5578:	20050863          	beqz	a0,5788 <f_open+0x21a>

	/* Get logical drive number */
	mode &= FF_FS_READONLY ? FA_READ : FA_READ | FA_WRITE | FA_CREATE_ALWAYS | FA_CREATE_NEW | FA_OPEN_ALWAYS | FA_OPEN_APPEND;
    557c:	03f67493          	andi	s1,a2,63
    5580:	c232                	sw	a2,4(sp)
    5582:	842a                	mv	s0,a0
	res = mount_volume(&path, &fs, mode);
    5584:	8626                	mv	a2,s1
    5586:	084c                	addi	a1,sp,20
    5588:	0808                	addi	a0,sp,16
    558a:	d4aff0ef          	jal	ra,4ad4 <mount_volume>
    558e:	c02a                	sw	a0,0(sp)
	if (res == FR_OK) {
    5590:	ed0d                	bnez	a0,55ca <f_open+0x5c>
		dj.obj.fs = fs;
    5592:	47d2                	lw	a5,20(sp)
		INIT_NAMBUF(fs);
		res = follow_path(&dj, path);	/* Follow the file path */
    5594:	45c2                	lw	a1,16(sp)
    5596:	0828                	addi	a0,sp,24
		dj.obj.fs = fs;
    5598:	cc3e                	sw	a5,24(sp)
		res = follow_path(&dj, path);	/* Follow the file path */
    559a:	c7dff0ef          	jal	ra,5216 <follow_path>
#if !FF_FS_READONLY	/* Read/Write configuration */
		if (res == FR_OK) {
    559e:	4692                	lw	a3,4(sp)
    55a0:	e511                	bnez	a0,55ac <f_open+0x3e>
			if (dj.fn[NSFLAG] & NS_NONAME) {	/* Origin directory itself? */
    55a2:	04310783          	lb	a5,67(sp)
    55a6:	0007d363          	bgez	a5,55ac <f_open+0x3e>
				res = FR_INVALID_NAME;
    55aa:	4519                	li	a0,6
				res = chk_lock(&dj, (mode & ~FA_READ) ? 1 : 0);		/* Check if the file can be used */
			}
#endif
		}
		/* Create or Open a file */
		if (mode & (FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW)) {
    55ac:	01c6f793          	andi	a5,a3,28
    55b0:	18078963          	beqz	a5,5742 <f_open+0x1d4>
			if (res != FR_OK) {					/* No file, create new */
    55b4:	02050463          	beqz	a0,55dc <f_open+0x6e>
				if (res == FR_NO_FILE) {		/* There is no file to open, create a new entry */
    55b8:	4791                	li	a5,4
    55ba:	00f51863          	bne	a0,a5,55ca <f_open+0x5c>
#if FF_FS_LOCK != 0
					res = enq_lock() ? dir_register(&dj) : FR_TOO_MANY_OPEN_FILES;
#else
					res = dir_register(&dj);
    55be:	0828                	addi	a0,sp,24
    55c0:	bdbff0ef          	jal	ra,519a <dir_register>
#endif
				}
				mode |= FA_CREATE_ALWAYS;		/* File is created */
    55c4:	0084e493          	ori	s1,s1,8
					res = FR_DENIED;
				} else {
					if (mode & FA_CREATE_NEW) res = FR_EXIST;	/* Cannot create as new file */
				}
			}
			if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {	/* Truncate the file if overwrite mode */
    55c8:	c515                	beqz	a0,55f4 <f_open+0x86>
		}

		FREE_NAMBUF();
	}

	if (res != FR_OK) fp->obj.fs = 0;	/* Invalidate file object on error */
    55ca:	00042023          	sw	zero,0(s0)
    55ce:	c02a                	sw	a0,0(sp)

	LEAVE_FF(fs, res);
}
    55d0:	40b6                	lw	ra,76(sp)
    55d2:	4426                	lw	s0,72(sp)
    55d4:	4502                	lw	a0,0(sp)
    55d6:	4496                	lw	s1,68(sp)
    55d8:	6161                	addi	sp,sp,80
    55da:	8082                	ret
				if (dj.obj.attr & (AM_RDO | AM_DIR)) {	/* Cannot overwrite it (R/O or DIR) */
    55dc:	01e14783          	lbu	a5,30(sp)
    55e0:	8bc5                	andi	a5,a5,17
    55e2:	16079c63          	bnez	a5,575a <f_open+0x1ec>
					if (mode & FA_CREATE_NEW) res = FR_EXIST;	/* Cannot create as new file */
    55e6:	0046f793          	andi	a5,a3,4
    55ea:	18079b63          	bnez	a5,5780 <f_open+0x212>
			if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {	/* Truncate the file if overwrite mode */
    55ee:	0086f613          	andi	a2,a3,8
    55f2:	ce41                	beqz	a2,568a <f_open+0x11c>
					st_dword(dj.dir + DIR_CrtTime, tm);
    55f4:	57d2                	lw	a5,52(sp)
	*ptr++ = (BYTE)val; val >>= 8;
    55f6:	02100693          	li	a3,33
	*ptr++ = (BYTE)val;
    55fa:	05000713          	li	a4,80
	*ptr++ = (BYTE)val; val >>= 8;
    55fe:	00d78823          	sb	a3,16(a5)
	*ptr++ = (BYTE)val;
    5602:	00e788a3          	sb	a4,17(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    5606:	00078723          	sb	zero,14(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    560a:	000787a3          	sb	zero,15(a5)
					st_dword(dj.dir + DIR_ModTime, tm);
    560e:	57d2                	lw	a5,52(sp)
	*ptr++ = (BYTE)val; val >>= 8;
    5610:	00d78c23          	sb	a3,24(a5)
	*ptr++ = (BYTE)val;
    5614:	00e78ca3          	sb	a4,25(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    5618:	00078b23          	sb	zero,22(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    561c:	00078ba3          	sb	zero,23(a5)
					cl = ld_clust(fs, dj.dir);			/* Get current cluster chain */
    5620:	47d2                	lw	a5,20(sp)
    5622:	55d2                	lw	a1,52(sp)
    5624:	0007c503          	lbu	a0,0(a5)
    5628:	c62e                	sw	a1,12(sp)
    562a:	c43e                	sw	a5,8(sp)
    562c:	f98ff0ef          	jal	ra,4dc4 <ld_clust.isra.0>
					dj.dir[DIR_Attr] = AM_ARC;			/* Reset attribute */
    5630:	45b2                	lw	a1,12(sp)
    5632:	02000713          	li	a4,32
					st_clust(fs, dj.dir, 0);			/* Reset file allocation info */
    5636:	47a2                	lw	a5,8(sp)
					dj.dir[DIR_Attr] = AM_ARC;			/* Reset attribute */
    5638:	00e585a3          	sb	a4,11(a1)
					st_clust(fs, dj.dir, 0);			/* Reset file allocation info */
    563c:	55d2                	lw	a1,52(sp)
					cl = ld_clust(fs, dj.dir);			/* Get current cluster chain */
    563e:	c22a                	sw	a0,4(sp)
					st_clust(fs, dj.dir, 0);			/* Reset file allocation info */
    5640:	4601                	li	a2,0
    5642:	853e                	mv	a0,a5
    5644:	878ff0ef          	jal	ra,46bc <st_clust>
					st_dword(dj.dir + DIR_FileSize, 0);
    5648:	57d2                	lw	a5,52(sp)
					fs->wflag = 1;
    564a:	4705                	li	a4,1
	*ptr++ = (BYTE)val; val >>= 8;
    564c:	00078e23          	sb	zero,28(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    5650:	00078ea3          	sb	zero,29(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    5654:	00078f23          	sb	zero,30(a5)
	*ptr++ = (BYTE)val;
    5658:	00078fa3          	sb	zero,31(a5)
					fs->wflag = 1;
    565c:	47d2                	lw	a5,20(sp)
    565e:	00e781a3          	sb	a4,3(a5)
					if (cl != 0) {						/* Remove the cluster chain if exist */
    5662:	4712                	lw	a4,4(sp)
    5664:	c31d                	beqz	a4,568a <f_open+0x11c>
						sc = fs->winsect;
    5666:	57dc                	lw	a5,44(a5)
						res = remove_chain(&dj.obj, cl, 0);
    5668:	4562                	lw	a0,24(sp)
    566a:	4601                	li	a2,0
    566c:	85ba                	mv	a1,a4
						sc = fs->winsect;
    566e:	c43e                	sw	a5,8(sp)
						res = remove_chain(&dj.obj, cl, 0);
    5670:	85dff0ef          	jal	ra,4ecc <remove_chain.isra.0>
						if (res == FR_OK) {
    5674:	47a2                	lw	a5,8(sp)
    5676:	f931                	bnez	a0,55ca <f_open+0x5c>
							res = move_window(fs, sc);
    5678:	4552                	lw	a0,20(sp)
    567a:	85be                	mv	a1,a5
    567c:	968ff0ef          	jal	ra,47e4 <move_window>
							fs->last_clst = cl - 1;		/* Reuse the cluster hole */
    5680:	4792                	lw	a5,4(sp)
    5682:	4752                	lw	a4,20(sp)
    5684:	17fd                	addi	a5,a5,-1
    5686:	c75c                	sw	a5,12(a4)
		if (res == FR_OK) {
    5688:	f129                	bnez	a0,55ca <f_open+0x5c>
			if (mode & FA_CREATE_ALWAYS) mode |= FA_MODIFIED;	/* Set file change flag if created or overwritten */
    568a:	0084f793          	andi	a5,s1,8
    568e:	c399                	beqz	a5,5694 <f_open+0x126>
    5690:	0404e493          	ori	s1,s1,64
			fp->dir_sect = fs->winsect;			/* Pointer to the directory entry */
    5694:	47d2                	lw	a5,20(sp)
			fp->dir_ptr = dj.dir;
    5696:	55d2                	lw	a1,52(sp)
			fp->dir_sect = fs->winsect;			/* Pointer to the directory entry */
    5698:	57d8                	lw	a4,44(a5)
			fp->dir_ptr = dj.dir;
    569a:	d04c                	sw	a1,36(s0)
				fp->obj.sclust = ld_clust(fs, dj.dir);					/* Get object allocation info */
    569c:	c23e                	sw	a5,4(sp)
			fp->dir_sect = fs->winsect;			/* Pointer to the directory entry */
    569e:	d018                	sw	a4,32(s0)
				fp->obj.sclust = ld_clust(fs, dj.dir);					/* Get object allocation info */
    56a0:	0007c503          	lbu	a0,0(a5)
    56a4:	c42e                	sw	a1,8(sp)
    56a6:	f1eff0ef          	jal	ra,4dc4 <ld_clust.isra.0>
				fp->obj.objsize = ld_dword(dj.dir + DIR_FileSize);
    56aa:	45a2                	lw	a1,8(sp)
				fp->obj.sclust = ld_clust(fs, dj.dir);					/* Get object allocation info */
    56ac:	c408                	sw	a0,8(s0)
				fp->obj.objsize = ld_dword(dj.dir + DIR_FileSize);
    56ae:	01c58513          	addi	a0,a1,28
    56b2:	fc1fe0ef          	jal	ra,4672 <ld_dword>
			fp->obj.fs = fs;	 	/* Validate the file object */
    56b6:	4792                	lw	a5,4(sp)
				fp->obj.objsize = ld_dword(dj.dir + DIR_FileSize);
    56b8:	c448                	sw	a0,12(s0)
			mem_set(fp->buf, 0, sizeof fp->buf);	/* Clear sector buffer */
    56ba:	20000613          	li	a2,512
			fp->obj.fs = fs;	 	/* Validate the file object */
    56be:	c01c                	sw	a5,0(s0)
			fp->obj.id = fs->id;
    56c0:	0067d783          	lhu	a5,6(a5)
			mem_set(fp->buf, 0, sizeof fp->buf);	/* Clear sector buffer */
    56c4:	4581                	li	a1,0
			fp->flag = mode;		/* Set file access mode */
    56c6:	00940823          	sb	s1,16(s0)
			fp->obj.id = fs->id;
    56ca:	00f41223          	sh	a5,4(s0)
			mem_set(fp->buf, 0, sizeof fp->buf);	/* Clear sector buffer */
    56ce:	02840793          	addi	a5,s0,40
			fp->err = 0;			/* Clear error flag */
    56d2:	000408a3          	sb	zero,17(s0)
			fp->sect = 0;			/* Invalidate current data sector */
    56d6:	00042e23          	sw	zero,28(s0)
			fp->fptr = 0;			/* Set file pointer top of the file */
    56da:	00042a23          	sw	zero,20(s0)
			mem_set(fp->buf, 0, sizeof fp->buf);	/* Clear sector buffer */
    56de:	853e                	mv	a0,a5
			if ((mode & FA_SEEKEND) && fp->obj.objsize > 0) {	/* Seek to end of file if FA_OPEN_APPEND is specified */
    56e0:	0204f493          	andi	s1,s1,32
			mem_set(fp->buf, 0, sizeof fp->buf);	/* Clear sector buffer */
    56e4:	c23e                	sw	a5,4(sp)
    56e6:	fabfe0ef          	jal	ra,4690 <mem_set>
			if ((mode & FA_SEEKEND) && fp->obj.objsize > 0) {	/* Seek to end of file if FA_OPEN_APPEND is specified */
    56ea:	ee0483e3          	beqz	s1,55d0 <f_open+0x62>
    56ee:	4444                	lw	s1,12(s0)
    56f0:	ee0480e3          	beqz	s1,55d0 <f_open+0x62>
				bcs = (DWORD)fs->csize * SS(fs);	/* Cluster size in byte */
    56f4:	47d2                	lw	a5,20(sp)
				clst = fp->obj.sclust;				/* Follow the cluster chain */
    56f6:	440c                	lw	a1,8(s0)
				fp->fptr = fp->obj.objsize;			/* Offset to seek */
    56f8:	c844                	sw	s1,20(s0)
				bcs = (DWORD)fs->csize * SS(fs);	/* Cluster size in byte */
    56fa:	00a7d783          	lhu	a5,10(a5)
    56fe:	07a6                	slli	a5,a5,0x9
				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
    5700:	0497ef63          	bltu	a5,s1,575e <f_open+0x1f0>
    5704:	4501                	li	a0,0
				fp->clust = clst;
    5706:	cc0c                	sw	a1,24(s0)
				if (res == FR_OK && ofs % SS(fs)) {	/* Fill sector buffer if not on the sector boundary */
    5708:	ec0511e3          	bnez	a0,55ca <f_open+0x5c>
    570c:	1ff4f793          	andi	a5,s1,511
    5710:	ec0780e3          	beqz	a5,55d0 <f_open+0x62>
					sc = clst2sect(fs, clst);
    5714:	47d2                	lw	a5,20(sp)
    5716:	853e                	mv	a0,a5
    5718:	c43e                	sw	a5,8(sp)
    571a:	f85fe0ef          	jal	ra,469e <clst2sect>
    571e:	862a                	mv	a2,a0
					if (sc == 0) {
    5720:	47a2                	lw	a5,8(sp)
						res = FR_INT_ERR;
    5722:	4509                	li	a0,2
					if (sc == 0) {
    5724:	ea0603e3          	beqz	a2,55ca <f_open+0x5c>
						fp->sect = sc + (DWORD)(ofs / SS(fs));
    5728:	80a5                	srli	s1,s1,0x9
    572a:	9626                	add	a2,a2,s1
    572c:	cc50                	sw	a2,28(s0)
						if (disk_read(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) res = FR_DISK_ERR;
    572e:	4592                	lw	a1,4(sp)
    5730:	0017c503          	lbu	a0,1(a5)
    5734:	4685                	li	a3,1
    5736:	23f000ef          	jal	ra,6174 <disk_read>
    573a:	e8050be3          	beqz	a0,55d0 <f_open+0x62>
    573e:	4505                	li	a0,1
    5740:	b569                	j	55ca <f_open+0x5c>
			if (res == FR_OK) {					/* Is the object exsiting? */
    5742:	e80514e3          	bnez	a0,55ca <f_open+0x5c>
				if (dj.obj.attr & AM_DIR) {		/* File open against a directory */
    5746:	01e14783          	lbu	a5,30(sp)
    574a:	0107f713          	andi	a4,a5,16
    574e:	eb1d                	bnez	a4,5784 <f_open+0x216>
					if ((mode & FA_WRITE) && (dj.obj.attr & AM_RDO)) { /* Write mode open against R/O file */
    5750:	0026f613          	andi	a2,a3,2
    5754:	da1d                	beqz	a2,568a <f_open+0x11c>
    5756:	8b85                	andi	a5,a5,1
    5758:	db8d                	beqz	a5,568a <f_open+0x11c>
					res = FR_DENIED;
    575a:	451d                	li	a0,7
    575c:	b5bd                	j	55ca <f_open+0x5c>
					clst = get_fat(&fp->obj, clst);
    575e:	4008                	lw	a0,0(s0)
    5760:	c43e                	sw	a5,8(sp)
    5762:	e88ff0ef          	jal	ra,4dea <get_fat.isra.0>
				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
    5766:	47a2                	lw	a5,8(sp)
					if (clst <= 1) res = FR_INT_ERR;
    5768:	4705                	li	a4,1
					clst = get_fat(&fp->obj, clst);
    576a:	85aa                	mv	a1,a0
				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
    576c:	8c9d                	sub	s1,s1,a5
					if (clst <= 1) res = FR_INT_ERR;
    576e:	00a77763          	bgeu	a4,a0,577c <f_open+0x20e>
				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
    5772:	577d                	li	a4,-1
    5774:	f8e516e3          	bne	a0,a4,5700 <f_open+0x192>
					if (clst == 0xFFFFFFFF) res = FR_DISK_ERR;
    5778:	4505                	li	a0,1
    577a:	b771                	j	5706 <f_open+0x198>
					if (clst <= 1) res = FR_INT_ERR;
    577c:	4509                	li	a0,2
    577e:	b761                	j	5706 <f_open+0x198>
					if (mode & FA_CREATE_NEW) res = FR_EXIST;	/* Cannot create as new file */
    5780:	4521                	li	a0,8
    5782:	b5a1                	j	55ca <f_open+0x5c>
					res = FR_NO_FILE;
    5784:	4511                	li	a0,4
    5786:	b591                	j	55ca <f_open+0x5c>
	if (!fp) return FR_INVALID_OBJECT;
    5788:	47a5                	li	a5,9
    578a:	c03e                	sw	a5,0(sp)
    578c:	b591                	j	55d0 <f_open+0x62>

0000578e <f_write>:
	FIL* fp,			/* Pointer to the file object */
	const void* buff,	/* Pointer to the data to be written */
	UINT btw,			/* Number of bytes to write */
	UINT* bw			/* Pointer to number of bytes written */
)
{
    578e:	fd810113          	addi	sp,sp,-40
    5792:	d022                	sw	s0,32(sp)
    5794:	ce26                	sw	s1,28(sp)
    5796:	d206                	sw	ra,36(sp)
    5798:	c22e                	sw	a1,4(sp)
	LBA_t sect;
	UINT wcnt, cc, csect;
	const BYTE *wbuff = (const BYTE*)buff;


	*bw = 0;	/* Clear write byte counter */
    579a:	0006a023          	sw	zero,0(a3)
	res = validate(&fp->obj, &fs);			/* Check validity of the file object */
    579e:	082c                	addi	a1,sp,24
{
    57a0:	84aa                	mv	s1,a0
    57a2:	8432                	mv	s0,a2
    57a4:	c836                	sw	a3,16(sp)
	res = validate(&fp->obj, &fs);			/* Check validity of the file object */
    57a6:	f7dfe0ef          	jal	ra,4722 <validate>
    57aa:	c02a                	sw	a0,0(sp)
	if (res != FR_OK || (res = (FRESULT)fp->err) != FR_OK) LEAVE_FF(fs, res);	/* Check validity */
    57ac:	ed2d                	bnez	a0,5826 <f_write+0x98>
    57ae:	0114c783          	lbu	a5,17(s1)
    57b2:	c03e                	sw	a5,0(sp)
    57b4:	ebad                	bnez	a5,5826 <f_write+0x98>
	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
    57b6:	0104c703          	lbu	a4,16(s1)
    57ba:	8b09                	andi	a4,a4,2
    57bc:	1a070163          	beqz	a4,595e <f_write+0x1d0>

	/* Check fptr wrap-around (file size cannot reach 4 GiB at FAT volume) */
	if ((!FF_FS_EXFAT || fs->fs_type != FS_EXFAT) && (DWORD)(fp->fptr + btw) < (DWORD)fp->fptr) {
    57c0:	48d8                	lw	a4,20(s1)
    57c2:	008706b3          	add	a3,a4,s0
    57c6:	00e6f463          	bgeu	a3,a4,57ce <f_write+0x40>
		btw = (UINT)(0xFFFFFFFF - (DWORD)fp->fptr);
    57ca:	fff74413          	not	s0,a4
#if FF_FS_TINY
		if (move_window(fs, fp->sect) != FR_OK) ABORT(fs, FR_DISK_ERR);	/* Move sector window */
		mem_cpy(fs->win + fp->fptr % SS(fs), wbuff, wcnt);	/* Fit data to the sector */
		fs->wflag = 1;
#else
		mem_cpy(fp->buf + fp->fptr % SS(fs), wbuff, wcnt);	/* Fit data to the sector */
    57ce:	02848793          	addi	a5,s1,40
    57d2:	c63e                	sw	a5,12(sp)
	for ( ;  btw;							/* Repeat until all data written */
    57d4:	c039                	beqz	s0,581a <f_write+0x8c>
		if (fp->fptr % SS(fs) == 0) {		/* On the sector boundary? */
    57d6:	48d8                	lw	a4,20(s1)
    57d8:	1ff77693          	andi	a3,a4,511
    57dc:	14069963          	bnez	a3,592e <f_write+0x1a0>
			csect = (UINT)(fp->fptr / SS(fs)) & (fs->csize - 1);	/* Sector offset in the cluster */
    57e0:	46e2                	lw	a3,24(sp)
    57e2:	00975613          	srli	a2,a4,0x9
    57e6:	00a6d683          	lhu	a3,10(a3)
    57ea:	16fd                	addi	a3,a3,-1
    57ec:	00c6f7b3          	and	a5,a3,a2
    57f0:	c43e                	sw	a5,8(sp)
			if (csect == 0) {				/* On the cluster boundary? */
    57f2:	efa9                	bnez	a5,584c <f_write+0xbe>
				if (fp->fptr == 0) {		/* On the top of the file? */
    57f4:	00071e63          	bnez	a4,5810 <f_write+0x82>
					clst = fp->obj.sclust;	/* Follow from the origin */
    57f8:	4488                	lw	a0,8(s1)
						clst = create_chain(&fp->obj, 0);	/* create a new cluster chain */
    57fa:	4581                	li	a1,0
					if (clst == 0) {		/* If no cluster is allocated, */
    57fc:	c919                	beqz	a0,5812 <f_write+0x84>
				if (clst == 1) ABORT(fs, FR_INT_ERR);
    57fe:	4705                	li	a4,1
    5800:	02e51a63          	bne	a0,a4,5834 <f_write+0xa6>
    5804:	4709                	li	a4,2
    5806:	00e488a3          	sb	a4,17(s1)
    580a:	4789                	li	a5,2
	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
    580c:	c03e                	sw	a5,0(sp)
    580e:	a821                	j	5826 <f_write+0x98>
						clst = create_chain(&fp->obj, fp->clust);	/* Follow or stretch cluster chain on the FAT */
    5810:	4c8c                	lw	a1,24(s1)
    5812:	4088                	lw	a0,0(s1)
    5814:	f36ff0ef          	jal	ra,4f4a <create_chain.isra.0>
				if (clst == 0) break;		/* Could not allocate a new cluster (disk full) */
    5818:	f17d                	bnez	a0,57fe <f_write+0x70>
		fp->flag |= FA_DIRTY;
#endif
	}

	fp->flag |= FA_MODIFIED;				/* Set file change flag */
    581a:	0104c703          	lbu	a4,16(s1)
    581e:	04076713          	ori	a4,a4,64
    5822:	00e48823          	sb	a4,16(s1)

	LEAVE_FF(fs, FR_OK);
}
    5826:	5092                	lw	ra,36(sp)
    5828:	5402                	lw	s0,32(sp)
    582a:	4502                	lw	a0,0(sp)
    582c:	44f2                	lw	s1,28(sp)
    582e:	02810113          	addi	sp,sp,40
    5832:	8082                	ret
				if (clst == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
    5834:	577d                	li	a4,-1
    5836:	00e51763          	bne	a0,a4,5844 <f_write+0xb6>
    583a:	4705                	li	a4,1
    583c:	00e488a3          	sb	a4,17(s1)
    5840:	4785                	li	a5,1
    5842:	b7e9                	j	580c <f_write+0x7e>
				if (fp->obj.sclust == 0) fp->obj.sclust = clst;	/* Set start cluster if the first write */
    5844:	4498                	lw	a4,8(s1)
				fp->clust = clst;			/* Update current cluster */
    5846:	cc88                	sw	a0,24(s1)
				if (fp->obj.sclust == 0) fp->obj.sclust = clst;	/* Set start cluster if the first write */
    5848:	e311                	bnez	a4,584c <f_write+0xbe>
    584a:	c488                	sw	a0,8(s1)
			if (fp->flag & FA_DIRTY) {		/* Write-back sector cache */
    584c:	01048703          	lb	a4,16(s1)
    5850:	02075163          	bgez	a4,5872 <f_write+0xe4>
				if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);
    5854:	4762                	lw	a4,24(sp)
    5856:	4cd0                	lw	a2,28(s1)
    5858:	45b2                	lw	a1,12(sp)
    585a:	00174503          	lbu	a0,1(a4)
    585e:	4685                	li	a3,1
    5860:	189000ef          	jal	ra,61e8 <disk_write>
    5864:	f979                	bnez	a0,583a <f_write+0xac>
				fp->flag &= (BYTE)~FA_DIRTY;
    5866:	0104c703          	lbu	a4,16(s1)
    586a:	07f77713          	andi	a4,a4,127
    586e:	00e48823          	sb	a4,16(s1)
			sect = clst2sect(fs, fp->clust);	/* Get current sector */
    5872:	4762                	lw	a4,24(sp)
    5874:	4c8c                	lw	a1,24(s1)
    5876:	853a                	mv	a0,a4
    5878:	ca3a                	sw	a4,20(sp)
    587a:	e25fe0ef          	jal	ra,469e <clst2sect>
			if (sect == 0) ABORT(fs, FR_INT_ERR);
    587e:	d159                	beqz	a0,5804 <f_write+0x76>
			sect += csect;
    5880:	47a2                	lw	a5,8(sp)
			if (cc > 0) {					/* Write maximum contiguous sectors directly */
    5882:	1ff00693          	li	a3,511
    5886:	4752                	lw	a4,20(sp)
			sect += csect;
    5888:	00a78633          	add	a2,a5,a0
			if (cc > 0) {					/* Write maximum contiguous sectors directly */
    588c:	0686ff63          	bgeu	a3,s0,590a <f_write+0x17c>
				if (csect + cc > fs->csize) {	/* Clip at cluster boundary */
    5890:	00a75583          	lhu	a1,10(a4)
			cc = btw / SS(fs);				/* When remaining bytes >= sector size, */
    5894:	00945693          	srli	a3,s0,0x9
				if (csect + cc > fs->csize) {	/* Clip at cluster boundary */
    5898:	00d78533          	add	a0,a5,a3
    589c:	00a5f463          	bgeu	a1,a0,58a4 <f_write+0x116>
					cc = fs->csize - csect;
    58a0:	40f586b3          	sub	a3,a1,a5
				if (disk_write(fs->pdrv, wbuff, sect, cc) != RES_OK) ABORT(fs, FR_DISK_ERR);
    58a4:	4592                	lw	a1,4(sp)
    58a6:	00174503          	lbu	a0,1(a4)
    58aa:	ca36                	sw	a3,20(sp)
    58ac:	c432                	sw	a2,8(sp)
    58ae:	13b000ef          	jal	ra,61e8 <disk_write>
    58b2:	f541                	bnez	a0,583a <f_write+0xac>
				if (fp->sect - sect < cc) { /* Refill sector cache if it gets invalidated by the direct write */
    58b4:	4ccc                	lw	a1,28(s1)
    58b6:	4622                	lw	a2,8(sp)
    58b8:	46d2                	lw	a3,20(sp)
    58ba:	40c58633          	sub	a2,a1,a2
    58be:	02d67363          	bgeu	a2,a3,58e4 <f_write+0x156>
    58c2:	4792                	lw	a5,4(sp)
    58c4:	4532                	lw	a0,12(sp)
					mem_cpy(fp->buf, wbuff + ((fp->sect - sect) * SS(fs)), SS(fs));
    58c6:	00961593          	slli	a1,a2,0x9
    58ca:	95be                	add	a1,a1,a5
    58cc:	20000613          	li	a2,512
    58d0:	c436                	sw	a3,8(sp)
	if (cnt != 0) {
    58d2:	e95fe0ef          	jal	ra,4766 <mem_cpy.part.0>
					fp->flag &= (BYTE)~FA_DIRTY;
    58d6:	0104c703          	lbu	a4,16(s1)
    58da:	46a2                	lw	a3,8(sp)
    58dc:	07f77713          	andi	a4,a4,127
    58e0:	00e48823          	sb	a4,16(s1)
				wcnt = SS(fs) * cc;		/* Number of bytes transferred */
    58e4:	00969613          	slli	a2,a3,0x9
		btw -= wcnt, *bw += wcnt, wbuff += wcnt, fp->fptr += wcnt, fp->obj.objsize = (fp->fptr > fp->obj.objsize) ? fp->fptr : fp->obj.objsize) {
    58e8:	47c2                	lw	a5,16(sp)
    58ea:	8c11                	sub	s0,s0,a2
    58ec:	4398                	lw	a4,0(a5)
    58ee:	9732                	add	a4,a4,a2
    58f0:	c398                	sw	a4,0(a5)
    58f2:	48d4                	lw	a3,20(s1)
    58f4:	4792                	lw	a5,4(sp)
    58f6:	44d8                	lw	a4,12(s1)
    58f8:	97b2                	add	a5,a5,a2
    58fa:	9636                	add	a2,a2,a3
    58fc:	c23e                	sw	a5,4(sp)
    58fe:	c8d0                	sw	a2,20(s1)
    5900:	00c77363          	bgeu	a4,a2,5906 <f_write+0x178>
    5904:	8732                	mv	a4,a2
    5906:	c4d8                	sw	a4,12(s1)
    5908:	b5f1                	j	57d4 <f_write+0x46>
			if (fp->sect != sect && 		/* Fill sector cache with file data */
    590a:	4cd4                	lw	a3,28(s1)
    590c:	02c68063          	beq	a3,a2,592c <f_write+0x19e>
    5910:	44cc                	lw	a1,12(s1)
    5912:	48d4                	lw	a3,20(s1)
    5914:	00b6fc63          	bgeu	a3,a1,592c <f_write+0x19e>
				disk_read(fs->pdrv, fp->buf, sect, 1) != RES_OK) {
    5918:	45b2                	lw	a1,12(sp)
    591a:	00174503          	lbu	a0,1(a4)
    591e:	4685                	li	a3,1
    5920:	c432                	sw	a2,8(sp)
    5922:	053000ef          	jal	ra,6174 <disk_read>
				fp->fptr < fp->obj.objsize &&
    5926:	4622                	lw	a2,8(sp)
    5928:	f00519e3          	bnez	a0,583a <f_write+0xac>
			fp->sect = sect;
    592c:	ccd0                	sw	a2,28(s1)
		wcnt = SS(fs) - (UINT)fp->fptr % SS(fs);	/* Number of bytes remains in the sector */
    592e:	48c8                	lw	a0,20(s1)
    5930:	20000713          	li	a4,512
    5934:	8622                	mv	a2,s0
    5936:	1ff57513          	andi	a0,a0,511
    593a:	8f09                	sub	a4,a4,a0
		if (wcnt > btw) wcnt = btw;					/* Clip it by btw if needed */
    593c:	00877363          	bgeu	a4,s0,5942 <f_write+0x1b4>
    5940:	863a                	mv	a2,a4
	if (cnt != 0) {
    5942:	47b2                	lw	a5,12(sp)
    5944:	4592                	lw	a1,4(sp)
    5946:	c432                	sw	a2,8(sp)
    5948:	953e                	add	a0,a0,a5
    594a:	e1dfe0ef          	jal	ra,4766 <mem_cpy.part.0>
		fp->flag |= FA_DIRTY;
    594e:	0104c703          	lbu	a4,16(s1)
    5952:	4622                	lw	a2,8(sp)
    5954:	f8076713          	ori	a4,a4,-128
    5958:	00e48823          	sb	a4,16(s1)
    595c:	b771                	j	58e8 <f_write+0x15a>
	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
    595e:	479d                	li	a5,7
    5960:	b575                	j	580c <f_write+0x7e>

00005962 <f_sync>:
/*-----------------------------------------------------------------------*/

FRESULT f_sync (
	FIL* fp		/* Pointer to the file object */
)
{
    5962:	1141                	addi	sp,sp,-16
	FATFS *fs;
	DWORD tm;
	BYTE *dir;


	res = validate(&fp->obj, &fs);	/* Check validity of the file object */
    5964:	858a                	mv	a1,sp
{
    5966:	c422                	sw	s0,8(sp)
    5968:	c606                	sw	ra,12(sp)
    596a:	c226                	sw	s1,4(sp)
    596c:	842a                	mv	s0,a0
	res = validate(&fp->obj, &fs);	/* Check validity of the file object */
    596e:	db5fe0ef          	jal	ra,4722 <validate>
	if (res == FR_OK) {
    5972:	e55d                	bnez	a0,5a20 <f_sync+0xbe>
		if (fp->flag & FA_MODIFIED) {	/* Is there any change to the file? */
    5974:	01044783          	lbu	a5,16(s0)
    5978:	0407f713          	andi	a4,a5,64
    597c:	c355                	beqz	a4,5a20 <f_sync+0xbe>
#if !FF_FS_TINY
			if (fp->flag & FA_DIRTY) {	/* Write-back cached data if needed */
    597e:	07e2                	slli	a5,a5,0x18
    5980:	87e1                	srai	a5,a5,0x18
    5982:	0207d463          	bgez	a5,59aa <f_sync+0x48>
				if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) LEAVE_FF(fs, FR_DISK_ERR);
    5986:	4782                	lw	a5,0(sp)
    5988:	4c50                	lw	a2,28(s0)
    598a:	4685                	li	a3,1
    598c:	0017c503          	lbu	a0,1(a5)
    5990:	02840593          	addi	a1,s0,40
    5994:	055000ef          	jal	ra,61e8 <disk_write>
    5998:	87aa                	mv	a5,a0
    599a:	4505                	li	a0,1
    599c:	e3d1                	bnez	a5,5a20 <f_sync+0xbe>
				fp->flag &= (BYTE)~FA_DIRTY;
    599e:	01044783          	lbu	a5,16(s0)
    59a2:	07f7f793          	andi	a5,a5,127
    59a6:	00f40823          	sb	a5,16(s0)
					FREE_NAMBUF();
				}
			} else
#endif
			{
				res = move_window(fs, fp->dir_sect);
    59aa:	500c                	lw	a1,32(s0)
    59ac:	4502                	lw	a0,0(sp)
    59ae:	e37fe0ef          	jal	ra,47e4 <move_window>
				if (res == FR_OK) {
    59b2:	e53d                	bnez	a0,5a20 <f_sync+0xbe>
					dir = fp->dir_ptr;
    59b4:	5044                	lw	s1,36(s0)
					dir[DIR_Attr] |= AM_ARC;						/* Set archive attribute to indicate that the file has been changed */
    59b6:	00b4c783          	lbu	a5,11(s1)
					st_clust(fp->obj.fs, dir, fp->obj.sclust);		/* Update file allocation information  */
    59ba:	85a6                	mv	a1,s1
					dir[DIR_Attr] |= AM_ARC;						/* Set archive attribute to indicate that the file has been changed */
    59bc:	0207e793          	ori	a5,a5,32
    59c0:	00f485a3          	sb	a5,11(s1)
					st_clust(fp->obj.fs, dir, fp->obj.sclust);		/* Update file allocation information  */
    59c4:	4410                	lw	a2,8(s0)
    59c6:	4008                	lw	a0,0(s0)
    59c8:	cf5fe0ef          	jal	ra,46bc <st_clust>
					st_dword(dir + DIR_FileSize, (DWORD)fp->obj.objsize);	/* Update file size */
    59cc:	445c                	lw	a5,12(s0)
					st_dword(dir + DIR_ModTime, tm);				/* Update modified time */
					st_word(dir + DIR_LstAccDate, 0);
					fs->wflag = 1;
    59ce:	4502                	lw	a0,0(sp)
	*ptr++ = (BYTE)val; val >>= 8;
    59d0:	00048b23          	sb	zero,22(s1)
    59d4:	0087d713          	srli	a4,a5,0x8
    59d8:	00f48e23          	sb	a5,28(s1)
	*ptr++ = (BYTE)val; val >>= 8;
    59dc:	00e48ea3          	sb	a4,29(s1)
    59e0:	0107d713          	srli	a4,a5,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    59e4:	83e1                	srli	a5,a5,0x18
	*ptr++ = (BYTE)val;
    59e6:	00f48fa3          	sb	a5,31(s1)
	*ptr++ = (BYTE)val; val >>= 8;
    59ea:	02100793          	li	a5,33
    59ee:	00f48c23          	sb	a5,24(s1)
	*ptr++ = (BYTE)val;
    59f2:	05000793          	li	a5,80
    59f6:	00f48ca3          	sb	a5,25(s1)
	*ptr++ = (BYTE)val; val >>= 8;
    59fa:	00e48f23          	sb	a4,30(s1)
					fs->wflag = 1;
    59fe:	4785                	li	a5,1
	*ptr++ = (BYTE)val; val >>= 8;
    5a00:	00048ba3          	sb	zero,23(s1)
	*ptr++ = (BYTE)val; val >>= 8;
    5a04:	00048923          	sb	zero,18(s1)
	*ptr++ = (BYTE)val;
    5a08:	000489a3          	sb	zero,19(s1)
					fs->wflag = 1;
    5a0c:	00f501a3          	sb	a5,3(a0)
					res = sync_fs(fs);					/* Restore it to the directory */
    5a10:	a31ff0ef          	jal	ra,5440 <sync_fs>
					fp->flag &= (BYTE)~FA_MODIFIED;
    5a14:	01044783          	lbu	a5,16(s0)
    5a18:	fbf7f793          	andi	a5,a5,-65
    5a1c:	00f40823          	sb	a5,16(s0)
			}
		}
	}

	LEAVE_FF(fs, res);
}
    5a20:	40b2                	lw	ra,12(sp)
    5a22:	4422                	lw	s0,8(sp)
    5a24:	4492                	lw	s1,4(sp)
    5a26:	0141                	addi	sp,sp,16
    5a28:	8082                	ret

00005a2a <f_close>:
/*-----------------------------------------------------------------------*/

FRESULT f_close (
	FIL* fp		/* Pointer to the file object to be closed */
)
{
    5a2a:	1141                	addi	sp,sp,-16
    5a2c:	c422                	sw	s0,8(sp)
    5a2e:	c606                	sw	ra,12(sp)
    5a30:	842a                	mv	s0,a0
	FRESULT res;
	FATFS *fs;

#if !FF_FS_READONLY
	res = f_sync(fp);					/* Flush cached data */
    5a32:	f31ff0ef          	jal	ra,5962 <f_sync>
	if (res == FR_OK)
    5a36:	e901                	bnez	a0,5a46 <f_close+0x1c>
#endif
	{
		res = validate(&fp->obj, &fs);	/* Lock volume */
    5a38:	858a                	mv	a1,sp
    5a3a:	8522                	mv	a0,s0
    5a3c:	ce7fe0ef          	jal	ra,4722 <validate>
		if (res == FR_OK) {
    5a40:	e119                	bnez	a0,5a46 <f_close+0x1c>
#if FF_FS_LOCK != 0
			res = dec_lock(fp->obj.lockid);		/* Decrement file open counter */
			if (res == FR_OK) fp->obj.fs = 0;	/* Invalidate file object */
#else
			fp->obj.fs = 0;	/* Invalidate file object */
    5a42:	00042023          	sw	zero,0(s0)
			unlock_fs(fs, FR_OK);		/* Unlock volume */
#endif
		}
	}
	return res;
}
    5a46:	40b2                	lw	ra,12(sp)
    5a48:	4422                	lw	s0,8(sp)
    5a4a:	0141                	addi	sp,sp,16
    5a4c:	8082                	ret

00005a4e <gpio_interrupt_handler>:
extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}
    5a4e:	8082                	ret

00005a50 <xmit_mmc>:
static
void xmit_mmc (
	const BYTE* buff,	/* Data to be sent */
	UINT bc				/* Number of bytes to send */
)
{
    5a50:	1121                	addi	sp,sp,-24
    5a52:	00b507b3          	add	a5,a0,a1
    5a56:	ca06                	sw	ra,20(sp)
    5a58:	c822                	sw	s0,16(sp)
    5a5a:	c626                	sw	s1,12(sp)
    5a5c:	c22a                	sw	a0,4(sp)
    5a5e:	c43e                	sw	a5,8(sp)
	BYTE d;
    
	do {
		d = *buff++;	/* Get a byte to be sent */
    5a60:	4792                	lw	a5,4(sp)
		if (d & 0x80) DI_H(); else DI_L();	/* bit7 */
    5a62:	06c1a503          	lw	a0,108(gp) # 20000554 <sd_di_pin_handle_t>
		d = *buff++;	/* Get a byte to be sent */
    5a66:	0785                	addi	a5,a5,1
    5a68:	c23e                	sw	a5,4(sp)
    5a6a:	fff7c783          	lbu	a5,-1(a5)
    5a6e:	06c18493          	addi	s1,gp,108 # 20000554 <sd_di_pin_handle_t>
		if (d & 0x80) DI_H(); else DI_L();	/* bit7 */
    5a72:	4585                	li	a1,1
		d = *buff++;	/* Get a byte to be sent */
    5a74:	c03e                	sw	a5,0(sp)
		if (d & 0x80) DI_H(); else DI_L();	/* bit7 */
    5a76:	00010783          	lb	a5,0(sp)
    5a7a:	0007c363          	bltz	a5,5a80 <xmit_mmc+0x30>
    5a7e:	4581                	li	a1,0
    5a80:	ebffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		CK_H(); CK_L();
    5a84:	06418793          	addi	a5,gp,100 # 2000054c <sd_clk_pin_handle_t>
    5a88:	4388                	lw	a0,0(a5)
    5a8a:	4585                	li	a1,1
    5a8c:	eb3fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5a90:	06418793          	addi	a5,gp,100 # 2000054c <sd_clk_pin_handle_t>
    5a94:	4388                	lw	a0,0(a5)
    5a96:	4581                	li	a1,0
    5a98:	06418413          	addi	s0,gp,100 # 2000054c <sd_clk_pin_handle_t>
    5a9c:	ea3fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		if (d & 0x40) DI_H(); else DI_L();	/* bit6 */
    5aa0:	4782                	lw	a5,0(sp)
    5aa2:	4585                	li	a1,1
    5aa4:	0407f793          	andi	a5,a5,64
    5aa8:	e391                	bnez	a5,5aac <xmit_mmc+0x5c>
    5aaa:	4581                	li	a1,0
    5aac:	4088                	lw	a0,0(s1)
    5aae:	e91fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		CK_H(); CK_L();
    5ab2:	4008                	lw	a0,0(s0)
    5ab4:	4585                	li	a1,1
    5ab6:	e89fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5aba:	4008                	lw	a0,0(s0)
    5abc:	4581                	li	a1,0
    5abe:	e81fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		if (d & 0x20) DI_H(); else DI_L();	/* bit5 */
    5ac2:	4782                	lw	a5,0(sp)
    5ac4:	4585                	li	a1,1
    5ac6:	0207f793          	andi	a5,a5,32
    5aca:	e391                	bnez	a5,5ace <xmit_mmc+0x7e>
    5acc:	4581                	li	a1,0
    5ace:	4088                	lw	a0,0(s1)
    5ad0:	e6ffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		CK_H(); CK_L();
    5ad4:	4008                	lw	a0,0(s0)
    5ad6:	4585                	li	a1,1
    5ad8:	e67fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5adc:	4008                	lw	a0,0(s0)
    5ade:	4581                	li	a1,0
    5ae0:	e5ffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		if (d & 0x10) DI_H(); else DI_L();	/* bit4 */
    5ae4:	4782                	lw	a5,0(sp)
    5ae6:	4585                	li	a1,1
    5ae8:	8bc1                	andi	a5,a5,16
    5aea:	e391                	bnez	a5,5aee <xmit_mmc+0x9e>
    5aec:	4581                	li	a1,0
    5aee:	4088                	lw	a0,0(s1)
    5af0:	e4ffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		CK_H(); CK_L();
    5af4:	4008                	lw	a0,0(s0)
    5af6:	4585                	li	a1,1
    5af8:	e47fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5afc:	4008                	lw	a0,0(s0)
    5afe:	4581                	li	a1,0
    5b00:	e3ffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		if (d & 0x08) DI_H(); else DI_L();	/* bit3 */
    5b04:	4782                	lw	a5,0(sp)
    5b06:	4585                	li	a1,1
    5b08:	8ba1                	andi	a5,a5,8
    5b0a:	e391                	bnez	a5,5b0e <xmit_mmc+0xbe>
    5b0c:	4581                	li	a1,0
    5b0e:	4088                	lw	a0,0(s1)
    5b10:	e2ffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b14:	4008                	lw	a0,0(s0)
    5b16:	4585                	li	a1,1
    5b18:	e27fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5b1c:	4008                	lw	a0,0(s0)
    5b1e:	4581                	li	a1,0
    5b20:	e1ffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		if (d & 0x04) DI_H(); else DI_L();	/* bit2 */
    5b24:	4782                	lw	a5,0(sp)
    5b26:	4585                	li	a1,1
    5b28:	8b91                	andi	a5,a5,4
    5b2a:	e391                	bnez	a5,5b2e <xmit_mmc+0xde>
    5b2c:	4581                	li	a1,0
    5b2e:	4088                	lw	a0,0(s1)
    5b30:	e0ffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b34:	4008                	lw	a0,0(s0)
    5b36:	4585                	li	a1,1
    5b38:	e07fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5b3c:	4008                	lw	a0,0(s0)
    5b3e:	4581                	li	a1,0
    5b40:	dfffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		if (d & 0x02) DI_H(); else DI_L();	/* bit1 */
    5b44:	4782                	lw	a5,0(sp)
    5b46:	4585                	li	a1,1
    5b48:	8b89                	andi	a5,a5,2
    5b4a:	e391                	bnez	a5,5b4e <xmit_mmc+0xfe>
    5b4c:	4581                	li	a1,0
    5b4e:	4088                	lw	a0,0(s1)
    5b50:	deffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b54:	4008                	lw	a0,0(s0)
    5b56:	4585                	li	a1,1
    5b58:	de7fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5b5c:	4008                	lw	a0,0(s0)
    5b5e:	4581                	li	a1,0
    5b60:	ddffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		if (d & 0x01) DI_H(); else DI_L();	/* bit0 */
    5b64:	4782                	lw	a5,0(sp)
    5b66:	4585                	li	a1,1
    5b68:	8b85                	andi	a5,a5,1
    5b6a:	e391                	bnez	a5,5b6e <xmit_mmc+0x11e>
    5b6c:	4581                	li	a1,0
    5b6e:	4088                	lw	a0,0(s1)
    5b70:	dcffd0ef          	jal	ra,393e <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b74:	4008                	lw	a0,0(s0)
    5b76:	4585                	li	a1,1
    5b78:	dc7fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5b7c:	4008                	lw	a0,0(s0)
    5b7e:	4581                	li	a1,0
    5b80:	dbffd0ef          	jal	ra,393e <csi_gpio_pin_write>
	} while (--bc);
    5b84:	4792                	lw	a5,4(sp)
    5b86:	4722                	lw	a4,8(sp)
    5b88:	ece79ce3          	bne	a5,a4,5a60 <xmit_mmc+0x10>
}
    5b8c:	40d2                	lw	ra,20(sp)
    5b8e:	4442                	lw	s0,16(sp)
    5b90:	44b2                	lw	s1,12(sp)
    5b92:	0161                	addi	sp,sp,24
    5b94:	8082                	ret

00005b96 <soft_spi_init>:
{	
    5b96:	1141                	addi	sp,sp,-16
    5b98:	c226                	sw	s1,4(sp)
    sd_cd_pin_handle_t = csi_gpio_pin_initialize(PA18, gpio_interrupt_handler);        //sd_cd_pin_handle_t PA18 				PA18	    PA18
    5b9a:	6499                	lui	s1,0x6
    5b9c:	a4e48593          	addi	a1,s1,-1458 # 5a4e <gpio_interrupt_handler>
    5ba0:	4549                	li	a0,18
{	
    5ba2:	c606                	sw	ra,12(sp)
    5ba4:	c422                	sw	s0,8(sp)
    sd_cd_pin_handle_t = csi_gpio_pin_initialize(PA18, gpio_interrupt_handler);        //sd_cd_pin_handle_t PA18 				PA18	    PA18
    5ba6:	ceffd0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    5baa:	06018413          	addi	s0,gp,96 # 20000548 <sd_cd_pin_handle_t>
    csi_gpio_pin_config_mode(sd_cd_pin_handle_t, GPIO_MODE_PULLNONE);
    5bae:	4581                	li	a1,0
    sd_cd_pin_handle_t = csi_gpio_pin_initialize(PA18, gpio_interrupt_handler);        //sd_cd_pin_handle_t PA18 				PA18	    PA18
    5bb0:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(sd_cd_pin_handle_t, GPIO_MODE_PULLNONE);
    5bb2:	d43fd0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_cd_pin_handle_t, GPIO_DIRECTION_INPUT);
    5bb6:	4008                	lw	a0,0(s0)
    5bb8:	4581                	li	a1,0
    5bba:	d53fd0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    sd_cs_pin_handle_t = csi_gpio_pin_initialize(PA19, gpio_interrupt_handler);        //sd_cs_pin_handle_t PA19 				PA27        PA19
    5bbe:	a4e48593          	addi	a1,s1,-1458
    5bc2:	454d                	li	a0,19
    5bc4:	cd1fd0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    5bc8:	06818413          	addi	s0,gp,104 # 20000550 <sd_cs_pin_handle_t>
    csi_gpio_pin_config_mode(sd_cs_pin_handle_t, GPIO_MODE_PULLNONE);
    5bcc:	4581                	li	a1,0
    sd_cs_pin_handle_t = csi_gpio_pin_initialize(PA19, gpio_interrupt_handler);        //sd_cs_pin_handle_t PA19 				PA27        PA19
    5bce:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(sd_cs_pin_handle_t, GPIO_MODE_PULLNONE);
    5bd0:	d25fd0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_cs_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    5bd4:	4008                	lw	a0,0(s0)
    5bd6:	4585                	li	a1,1
    5bd8:	d35fd0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    sd_clk_pin_handle_t = csi_gpio_pin_initialize(PA6, gpio_interrupt_handler);        //                         				            PA6
    5bdc:	a4e48593          	addi	a1,s1,-1458
    5be0:	4519                	li	a0,6
    5be2:	cb3fd0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    5be6:	06418793          	addi	a5,gp,100 # 2000054c <sd_clk_pin_handle_t>
    csi_gpio_pin_config_mode(sd_clk_pin_handle_t, GPIO_MODE_PULLNONE);
    5bea:	4581                	li	a1,0
    sd_clk_pin_handle_t = csi_gpio_pin_initialize(PA6, gpio_interrupt_handler);        //                         				            PA6
    5bec:	c03e                	sw	a5,0(sp)
    5bee:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(sd_clk_pin_handle_t, GPIO_MODE_PULLNONE);
    5bf0:	d05fd0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_clk_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    5bf4:	4782                	lw	a5,0(sp)
    5bf6:	4585                	li	a1,1
    5bf8:	4388                	lw	a0,0(a5)
    5bfa:	d13fd0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    sd_di_pin_handle_t = csi_gpio_pin_initialize(PA5, gpio_interrupt_handler);        //                         				            PA5    
    5bfe:	a4e48593          	addi	a1,s1,-1458
    5c02:	4515                	li	a0,5
    5c04:	c91fd0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    5c08:	06c18793          	addi	a5,gp,108 # 20000554 <sd_di_pin_handle_t>
    csi_gpio_pin_config_mode(sd_di_pin_handle_t, GPIO_MODE_PULLNONE);
    5c0c:	4581                	li	a1,0
    sd_di_pin_handle_t = csi_gpio_pin_initialize(PA5, gpio_interrupt_handler);        //                         				            PA5    
    5c0e:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(sd_di_pin_handle_t, GPIO_MODE_PULLNONE);
    5c10:	ce5fd0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_di_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    5c14:	06c18793          	addi	a5,gp,108 # 20000554 <sd_di_pin_handle_t>
    5c18:	4388                	lw	a0,0(a5)
    5c1a:	4585                	li	a1,1
    5c1c:	cf1fd0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    sd_do_pin_handle_t = csi_gpio_pin_initialize(PA7, gpio_interrupt_handler);        //                         				            PA7
    5c20:	a4e48593          	addi	a1,s1,-1458
    5c24:	451d                	li	a0,7
    5c26:	c6ffd0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    5c2a:	07018793          	addi	a5,gp,112 # 20000558 <sd_do_pin_handle_t>
    csi_gpio_pin_config_mode(sd_do_pin_handle_t, GPIO_MODE_PULLNONE);
    5c2e:	4581                	li	a1,0
    sd_do_pin_handle_t = csi_gpio_pin_initialize(PA7, gpio_interrupt_handler);        //                         				            PA7
    5c30:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(sd_do_pin_handle_t, GPIO_MODE_PULLNONE);
    5c32:	cc3fd0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_do_pin_handle_t, GPIO_DIRECTION_INPUT);
    5c36:	07018793          	addi	a5,gp,112 # 20000558 <sd_do_pin_handle_t>
    5c3a:	4388                	lw	a0,0(a5)
    5c3c:	4581                	li	a1,0
    5c3e:	ccffd0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    sd_rst_pin_handle_t = csi_gpio_pin_initialize(PA20, gpio_interrupt_handler);      //PA20                         			PA20	    PA20
    5c42:	a4e48593          	addi	a1,s1,-1458
    5c46:	4551                	li	a0,20
    5c48:	c4dfd0ef          	jal	ra,3894 <csi_gpio_pin_initialize>
    5c4c:	07418493          	addi	s1,gp,116 # 2000055c <sd_rst_pin_handle_t>
    csi_gpio_pin_config_mode(sd_rst_pin_handle_t, GPIO_MODE_PULLNONE);
    5c50:	4581                	li	a1,0
    sd_rst_pin_handle_t = csi_gpio_pin_initialize(PA20, gpio_interrupt_handler);      //PA20                         			PA20	    PA20
    5c52:	c088                	sw	a0,0(s1)
    csi_gpio_pin_config_mode(sd_rst_pin_handle_t, GPIO_MODE_PULLNONE);
    5c54:	ca1fd0ef          	jal	ra,38f4 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_rst_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    5c58:	4088                	lw	a0,0(s1)
    5c5a:	4585                	li	a1,1
    5c5c:	cb1fd0ef          	jal	ra,390c <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(sd_cs_pin_handle_t,1);											//set cs high
    5c60:	4008                	lw	a0,0(s0)
    5c62:	4585                	li	a1,1
    5c64:	cdbfd0ef          	jal	ra,393e <csi_gpio_pin_write>
	csi_gpio_pin_write(sd_rst_pin_handle_t,0);											//set rst low to power on the card
    5c68:	4088                	lw	a0,0(s1)
    5c6a:	4581                	li	a1,0
    5c6c:	cd3fd0ef          	jal	ra,393e <csi_gpio_pin_write>
	csi_gpio_pin_write(sd_clk_pin_handle_t,0);											//set sclk low 
    5c70:	4782                	lw	a5,0(sp)
    5c72:	4581                	li	a1,0
    5c74:	4388                	lw	a0,0(a5)
    5c76:	cc9fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    CS_H();
    5c7a:	4008                	lw	a0,0(s0)
    5c7c:	4585                	li	a1,1
    5c7e:	cc1fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    CK_L();
    5c82:	4782                	lw	a5,0(sp)
}
    5c84:	4422                	lw	s0,8(sp)
    5c86:	40b2                	lw	ra,12(sp)
    5c88:	4492                	lw	s1,4(sp)
    CK_L();
    5c8a:	4388                	lw	a0,0(a5)
    5c8c:	4581                	li	a1,0
}
    5c8e:	0141                	addi	sp,sp,16
    CK_L();
    5c90:	caffd06f          	j	393e <csi_gpio_pin_write>

00005c94 <rcvr_mmc>:
static
void rcvr_mmc (
	BYTE *buff,	/* Pointer to read buffer */
	UINT bc		/* Number of bytes to receive */
)
{
    5c94:	1111                	addi	sp,sp,-28
    5c96:	c02a                	sw	a0,0(sp)
	BYTE r;
    bool get_temp = 0;

	DI_H();	/* Send 0xFF */
    5c98:	06c1a503          	lw	a0,108(gp) # 20000554 <sd_di_pin_handle_t>
{
    5c9c:	ca22                	sw	s0,20(sp)
    5c9e:	842e                	mv	s0,a1
	DI_H();	/* Send 0xFF */
    5ca0:	4585                	li	a1,1
{
    5ca2:	cc06                	sw	ra,24(sp)
    5ca4:	c826                	sw	s1,16(sp)
    bool get_temp = 0;
    5ca6:	000107a3          	sb	zero,15(sp)
	DI_H();	/* Send 0xFF */
    5caa:	c95fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5cae:	4782                	lw	a5,0(sp)
    5cb0:	97a2                	add	a5,a5,s0
    5cb2:	c23e                	sw	a5,4(sp)

	do {
		r = 0;
        csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5cb4:	07018713          	addi	a4,gp,112 # 20000558 <sd_do_pin_handle_t>
    5cb8:	4308                	lw	a0,0(a4)
    5cba:	00f10593          	addi	a1,sp,15
    5cbe:	cc3fd0ef          	jal	ra,3980 <csi_gpio_pin_read>
        if (get_temp) r++;	/* bit7 */
		CK_H(); CK_L();
    5cc2:	06418793          	addi	a5,gp,100 # 2000054c <sd_clk_pin_handle_t>
    5cc6:	4388                	lw	a0,0(a5)
    5cc8:	4585                	li	a1,1
		r = 0;
    5cca:	00f14483          	lbu	s1,15(sp)
		CK_H(); CK_L();
    5cce:	c71fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5cd2:	06418793          	addi	a5,gp,100 # 2000054c <sd_clk_pin_handle_t>
    5cd6:	4388                	lw	a0,0(a5)
    5cd8:	4581                	li	a1,0
    5cda:	06418413          	addi	s0,gp,100 # 2000054c <sd_clk_pin_handle_t>
    5cde:	c61fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5ce2:	00149793          	slli	a5,s1,0x1
    5ce6:	07018713          	addi	a4,gp,112 # 20000558 <sd_do_pin_handle_t>
    5cea:	4308                	lw	a0,0(a4)
    5cec:	0ff7f793          	andi	a5,a5,255
    5cf0:	00f10593          	addi	a1,sp,15
    5cf4:	c43e                	sw	a5,8(sp)
    5cf6:	c8bfd0ef          	jal	ra,3980 <csi_gpio_pin_read>
        if (get_temp) r++;	/* bit6 */
    5cfa:	00f14703          	lbu	a4,15(sp)
    5cfe:	47a2                	lw	a5,8(sp)
    5d00:	07018493          	addi	s1,gp,112 # 20000558 <sd_do_pin_handle_t>
    5d04:	c701                	beqz	a4,5d0c <rcvr_mmc+0x78>
    5d06:	0785                	addi	a5,a5,1
    5d08:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5d0c:	4008                	lw	a0,0(s0)
    5d0e:	4585                	li	a1,1
    5d10:	c43e                	sw	a5,8(sp)
    5d12:	c2dfd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5d16:	4008                	lw	a0,0(s0)
    5d18:	4581                	li	a1,0
    5d1a:	c25fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5d1e:	47a2                	lw	a5,8(sp)
    5d20:	4088                	lw	a0,0(s1)
    5d22:	00f10593          	addi	a1,sp,15
    5d26:	0786                	slli	a5,a5,0x1
    5d28:	0ff7f793          	andi	a5,a5,255
    5d2c:	c43e                	sw	a5,8(sp)
    5d2e:	c53fd0ef          	jal	ra,3980 <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit5 */
    5d32:	00f14703          	lbu	a4,15(sp)
    5d36:	47a2                	lw	a5,8(sp)
    5d38:	c701                	beqz	a4,5d40 <rcvr_mmc+0xac>
    5d3a:	0785                	addi	a5,a5,1
    5d3c:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5d40:	4008                	lw	a0,0(s0)
    5d42:	4585                	li	a1,1
    5d44:	c43e                	sw	a5,8(sp)
    5d46:	bf9fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5d4a:	4008                	lw	a0,0(s0)
    5d4c:	4581                	li	a1,0
    5d4e:	bf1fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5d52:	47a2                	lw	a5,8(sp)
    5d54:	4088                	lw	a0,0(s1)
    5d56:	00f10593          	addi	a1,sp,15
    5d5a:	0786                	slli	a5,a5,0x1
    5d5c:	0ff7f793          	andi	a5,a5,255
    5d60:	c43e                	sw	a5,8(sp)
    5d62:	c1ffd0ef          	jal	ra,3980 <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit4 */
    5d66:	00f14703          	lbu	a4,15(sp)
    5d6a:	47a2                	lw	a5,8(sp)
    5d6c:	c701                	beqz	a4,5d74 <rcvr_mmc+0xe0>
    5d6e:	0785                	addi	a5,a5,1
    5d70:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5d74:	4008                	lw	a0,0(s0)
    5d76:	4585                	li	a1,1
    5d78:	c43e                	sw	a5,8(sp)
    5d7a:	bc5fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5d7e:	4008                	lw	a0,0(s0)
    5d80:	4581                	li	a1,0
    5d82:	bbdfd0ef          	jal	ra,393e <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5d86:	47a2                	lw	a5,8(sp)
    5d88:	4088                	lw	a0,0(s1)
    5d8a:	00f10593          	addi	a1,sp,15
    5d8e:	0786                	slli	a5,a5,0x1
    5d90:	0ff7f793          	andi	a5,a5,255
    5d94:	c43e                	sw	a5,8(sp)
    5d96:	bebfd0ef          	jal	ra,3980 <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit3 */
    5d9a:	00f14703          	lbu	a4,15(sp)
    5d9e:	47a2                	lw	a5,8(sp)
    5da0:	c701                	beqz	a4,5da8 <rcvr_mmc+0x114>
    5da2:	0785                	addi	a5,a5,1
    5da4:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5da8:	4008                	lw	a0,0(s0)
    5daa:	4585                	li	a1,1
    5dac:	c43e                	sw	a5,8(sp)
    5dae:	b91fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5db2:	4008                	lw	a0,0(s0)
    5db4:	4581                	li	a1,0
    5db6:	b89fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5dba:	47a2                	lw	a5,8(sp)
    5dbc:	4088                	lw	a0,0(s1)
    5dbe:	00f10593          	addi	a1,sp,15
    5dc2:	0786                	slli	a5,a5,0x1
    5dc4:	0ff7f793          	andi	a5,a5,255
    5dc8:	c43e                	sw	a5,8(sp)
    5dca:	bb7fd0ef          	jal	ra,3980 <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit2 */
    5dce:	00f14703          	lbu	a4,15(sp)
    5dd2:	47a2                	lw	a5,8(sp)
    5dd4:	c701                	beqz	a4,5ddc <rcvr_mmc+0x148>
    5dd6:	0785                	addi	a5,a5,1
    5dd8:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5ddc:	4008                	lw	a0,0(s0)
    5dde:	4585                	li	a1,1
    5de0:	c43e                	sw	a5,8(sp)
    5de2:	b5dfd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5de6:	4008                	lw	a0,0(s0)
    5de8:	4581                	li	a1,0
    5dea:	b55fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5dee:	47a2                	lw	a5,8(sp)
    5df0:	4088                	lw	a0,0(s1)
    5df2:	00f10593          	addi	a1,sp,15
    5df6:	0786                	slli	a5,a5,0x1
    5df8:	0ff7f793          	andi	a5,a5,255
    5dfc:	c43e                	sw	a5,8(sp)
    5dfe:	b83fd0ef          	jal	ra,3980 <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit1 */
    5e02:	00f14703          	lbu	a4,15(sp)
    5e06:	47a2                	lw	a5,8(sp)
    5e08:	c701                	beqz	a4,5e10 <rcvr_mmc+0x17c>
    5e0a:	0785                	addi	a5,a5,1
    5e0c:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5e10:	4008                	lw	a0,0(s0)
    5e12:	4585                	li	a1,1
    5e14:	c43e                	sw	a5,8(sp)
    5e16:	b29fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5e1a:	4008                	lw	a0,0(s0)
    5e1c:	4581                	li	a1,0
    5e1e:	b21fd0ef          	jal	ra,393e <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5e22:	47a2                	lw	a5,8(sp)
    5e24:	4088                	lw	a0,0(s1)
    5e26:	00f10593          	addi	a1,sp,15
    5e2a:	0786                	slli	a5,a5,0x1
    5e2c:	0ff7f793          	andi	a5,a5,255
    5e30:	c43e                	sw	a5,8(sp)
    5e32:	b4ffd0ef          	jal	ra,3980 <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit0 */
    5e36:	00f14703          	lbu	a4,15(sp)
    5e3a:	47a2                	lw	a5,8(sp)
    5e3c:	c701                	beqz	a4,5e44 <rcvr_mmc+0x1b0>
    5e3e:	0785                	addi	a5,a5,1
    5e40:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5e44:	4008                	lw	a0,0(s0)
    5e46:	4585                	li	a1,1
    5e48:	c43e                	sw	a5,8(sp)
    5e4a:	af5fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    5e4e:	4008                	lw	a0,0(s0)
    5e50:	4581                	li	a1,0
    5e52:	aedfd0ef          	jal	ra,393e <csi_gpio_pin_write>
		*buff++ = r;			/* Store a received byte */
    5e56:	4782                	lw	a5,0(sp)
    5e58:	0785                	addi	a5,a5,1
    5e5a:	873e                	mv	a4,a5
    5e5c:	c03e                	sw	a5,0(sp)
    5e5e:	47a2                	lw	a5,8(sp)
    5e60:	fef70fa3          	sb	a5,-1(a4)
	} while (--bc);
    5e64:	4792                	lw	a5,4(sp)
    5e66:	e4e797e3          	bne	a5,a4,5cb4 <rcvr_mmc+0x20>
}
    5e6a:	40e2                	lw	ra,24(sp)
    5e6c:	4452                	lw	s0,20(sp)
    5e6e:	44c2                	lw	s1,16(sp)
    5e70:	0171                	addi	sp,sp,28
    5e72:	8082                	ret

00005e74 <wait_ready>:
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static
int wait_ready (void)	/* 1:OK, 0:Timeout */
{
    5e74:	1141                	addi	sp,sp,-16
    5e76:	c422                	sw	s0,8(sp)
	BYTE d;
	UINT tmr;


	for (tmr = 5000; tmr; tmr--) {	/* Wait for ready in timeout of 500ms */
    5e78:	6405                	lui	s0,0x1
{
    5e7a:	c606                	sw	ra,12(sp)
	for (tmr = 5000; tmr; tmr--) {	/* Wait for ready in timeout of 500ms */
    5e7c:	38840413          	addi	s0,s0,904 # 1388 <__divdf3+0x4de>
		rcvr_mmc(&d, 1);
    5e80:	4585                	li	a1,1
    5e82:	00310513          	addi	a0,sp,3
    5e86:	e0fff0ef          	jal	ra,5c94 <rcvr_mmc>
		if (d == 0xFF) break;
    5e8a:	00314703          	lbu	a4,3(sp)
    5e8e:	0ff00793          	li	a5,255
    5e92:	00f70463          	beq	a4,a5,5e9a <wait_ready+0x26>
	for (tmr = 5000; tmr; tmr--) {	/* Wait for ready in timeout of 500ms */
    5e96:	147d                	addi	s0,s0,-1
    5e98:	f465                	bnez	s0,5e80 <wait_ready+0xc>
		dly_us(100);
	}

	return tmr ? 1 : 0;
}
    5e9a:	40b2                	lw	ra,12(sp)
    5e9c:	00803533          	snez	a0,s0
    5ea0:	4422                	lw	s0,8(sp)
    5ea2:	0141                	addi	sp,sp,16
    5ea4:	8082                	ret

00005ea6 <deselect>:
static
void deselect (void)
{
	BYTE d;

	CS_H();				/* Set CS# high */
    5ea6:	0681a503          	lw	a0,104(gp) # 20000550 <sd_cs_pin_handle_t>
{
    5eaa:	1141                	addi	sp,sp,-16
	CS_H();				/* Set CS# high */
    5eac:	4585                	li	a1,1
{
    5eae:	c606                	sw	ra,12(sp)
	CS_H();				/* Set CS# high */
    5eb0:	a8ffd0ef          	jal	ra,393e <csi_gpio_pin_write>
	rcvr_mmc(&d, 1);	/* Dummy clock (force DO hi-z for multiple slave SPI) */
    5eb4:	00310513          	addi	a0,sp,3
    5eb8:	4585                	li	a1,1
    5eba:	ddbff0ef          	jal	ra,5c94 <rcvr_mmc>
}
    5ebe:	40b2                	lw	ra,12(sp)
    5ec0:	0141                	addi	sp,sp,16
    5ec2:	8082                	ret

00005ec4 <my_select>:
static
int my_select (void)	/* 1:OK, 0:Timeout */
{
	BYTE d;

	CS_L();				/* Set CS# low */
    5ec4:	0681a503          	lw	a0,104(gp) # 20000550 <sd_cs_pin_handle_t>
{
    5ec8:	1131                	addi	sp,sp,-20
	CS_L();				/* Set CS# low */
    5eca:	4581                	li	a1,0
{
    5ecc:	c806                	sw	ra,16(sp)
	CS_L();				/* Set CS# low */
    5ece:	a71fd0ef          	jal	ra,393e <csi_gpio_pin_write>
	rcvr_mmc(&d, 1);	/* Dummy clock (force DO enabled) */
    5ed2:	4585                	li	a1,1
    5ed4:	00710513          	addi	a0,sp,7
    5ed8:	dbdff0ef          	jal	ra,5c94 <rcvr_mmc>
	if (wait_ready()) return 1;	/* Wait for card ready */
    5edc:	f99ff0ef          	jal	ra,5e74 <wait_ready>
    5ee0:	c02a                	sw	a0,0(sp)
    5ee2:	e519                	bnez	a0,5ef0 <my_select+0x2c>

	deselect();
    5ee4:	fc3ff0ef          	jal	ra,5ea6 <deselect>
	return 0;			/* Failed */
    5ee8:	4502                	lw	a0,0(sp)
}
    5eea:	40c2                	lw	ra,16(sp)
    5eec:	0151                	addi	sp,sp,20
    5eee:	8082                	ret
	if (wait_ready()) return 1;	/* Wait for card ready */
    5ef0:	4505                	li	a0,1
    5ef2:	bfe5                	j	5eea <my_select+0x26>

00005ef4 <send_cmd>:
static
BYTE send_cmd (		/* Returns command response (bit7==1:Send failed)*/
	BYTE cmd,		/* Command byte */
	DWORD arg		/* Argument */
)
{
    5ef4:	1121                	addi	sp,sp,-24
	BYTE n, d, buf[6];


	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
    5ef6:	01851793          	slli	a5,a0,0x18
{
    5efa:	c822                	sw	s0,16(sp)
    5efc:	c626                	sw	s1,12(sp)
    5efe:	ca06                	sw	ra,20(sp)
	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
    5f00:	87e1                	srai	a5,a5,0x18
{
    5f02:	842a                	mv	s0,a0
    5f04:	84ae                	mv	s1,a1
	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
    5f06:	0007db63          	bgez	a5,5f1c <send_cmd+0x28>
		cmd &= 0x7F;
		n = send_cmd(CMD55, 0);
    5f0a:	4581                	li	a1,0
    5f0c:	03700513          	li	a0,55
    5f10:	37d5                	jal	5ef4 <send_cmd>
		if (n > 1) return n;
    5f12:	4785                	li	a5,1
    5f14:	08a7ea63          	bltu	a5,a0,5fa8 <send_cmd+0xb4>
		cmd &= 0x7F;
    5f18:	07f47413          	andi	s0,s0,127
	}

	/* Select the card and wait for ready except to stop multiple block read */
	if (cmd != CMD12) {
    5f1c:	47b1                	li	a5,12
    5f1e:	06f41d63          	bne	s0,a5,5f98 <send_cmd+0xa4>
		deselect();
		if (!my_select()) return 0xFF;
	}

	/* Send a command packet */
	buf[0] = 0x40 | cmd;			/* Start + Command index */
    5f22:	04046793          	ori	a5,s0,64
    5f26:	00f10223          	sb	a5,4(sp)
	buf[1] = (BYTE)(arg >> 24);		/* Argument[31..24] */
    5f2a:	0184d793          	srli	a5,s1,0x18
    5f2e:	00f102a3          	sb	a5,5(sp)
	buf[2] = (BYTE)(arg >> 16);		/* Argument[23..16] */
    5f32:	0104d793          	srli	a5,s1,0x10
    5f36:	00f10323          	sb	a5,6(sp)
	buf[3] = (BYTE)(arg >> 8);		/* Argument[15..8] */
    5f3a:	0084d793          	srli	a5,s1,0x8
    5f3e:	00f103a3          	sb	a5,7(sp)
	buf[4] = (BYTE)arg;				/* Argument[7..0] */
    5f42:	00910423          	sb	s1,8(sp)
	n = 0x01;						/* Dummy CRC + Stop */
	if (cmd == CMD0) n = 0x95;		/* (valid CRC for CMD0(0)) */
    5f46:	09500793          	li	a5,149
    5f4a:	c419                	beqz	s0,5f58 <send_cmd+0x64>
	if (cmd == CMD8) n = 0x87;		/* (valid CRC for CMD8(0x1AA)) */
    5f4c:	4721                	li	a4,8
	n = 0x01;						/* Dummy CRC + Stop */
    5f4e:	4785                	li	a5,1
	if (cmd == CMD8) n = 0x87;		/* (valid CRC for CMD8(0x1AA)) */
    5f50:	00e41463          	bne	s0,a4,5f58 <send_cmd+0x64>
    5f54:	08700793          	li	a5,135
	buf[5] = n;
	xmit_mmc(buf, 6);
    5f58:	4599                	li	a1,6
    5f5a:	0048                	addi	a0,sp,4
	buf[5] = n;
    5f5c:	00f104a3          	sb	a5,9(sp)
	xmit_mmc(buf, 6);
    5f60:	af1ff0ef          	jal	ra,5a50 <xmit_mmc>

	/* Receive command response */
	if (cmd == CMD12) rcvr_mmc(&d, 1);	/* Skip a stuff byte when stop reading */
    5f64:	47b1                	li	a5,12
    5f66:	00f41763          	bne	s0,a5,5f74 <send_cmd+0x80>
    5f6a:	4585                	li	a1,1
    5f6c:	00310513          	addi	a0,sp,3
    5f70:	d25ff0ef          	jal	ra,5c94 <rcvr_mmc>
	if (cmd == CMD8) n = 0x87;		/* (valid CRC for CMD8(0x1AA)) */
    5f74:	4429                	li	s0,10
	n = 10;								/* Wait for a valid response in timeout of 10 attempts */
	do
		rcvr_mmc(&d, 1);
    5f76:	00310513          	addi	a0,sp,3
    5f7a:	4585                	li	a1,1
    5f7c:	d19ff0ef          	jal	ra,5c94 <rcvr_mmc>
	while ((d & 0x80) && --n);
    5f80:	00314503          	lbu	a0,3(sp)
    5f84:	01851793          	slli	a5,a0,0x18
    5f88:	87e1                	srai	a5,a5,0x18
    5f8a:	0007df63          	bgez	a5,5fa8 <send_cmd+0xb4>
    5f8e:	147d                	addi	s0,s0,-1
    5f90:	0ff47413          	andi	s0,s0,255
    5f94:	f06d                	bnez	s0,5f76 <send_cmd+0x82>
    5f96:	a809                	j	5fa8 <send_cmd+0xb4>
		deselect();
    5f98:	f0fff0ef          	jal	ra,5ea6 <deselect>
		if (!my_select()) return 0xFF;
    5f9c:	f29ff0ef          	jal	ra,5ec4 <my_select>
    5fa0:	87aa                	mv	a5,a0
    5fa2:	0ff00513          	li	a0,255
    5fa6:	ffb5                	bnez	a5,5f22 <send_cmd+0x2e>

	return d;			/* Return with the response value */
}
    5fa8:	40d2                	lw	ra,20(sp)
    5faa:	4442                	lw	s0,16(sp)
    5fac:	44b2                	lw	s1,12(sp)
    5fae:	0161                	addi	sp,sp,24
    5fb0:	8082                	ret

00005fb2 <rcvr_datablock>:
{
    5fb2:	1131                	addi	sp,sp,-20
    5fb4:	c622                	sw	s0,12(sp)
    5fb6:	c426                	sw	s1,8(sp)
    5fb8:	c806                	sw	ra,16(sp)
    5fba:	842a                	mv	s0,a0
    5fbc:	84ae                	mv	s1,a1
    5fbe:	3e800793          	li	a5,1000
		rcvr_mmc(d, 1);
    5fc2:	4585                	li	a1,1
    5fc4:	0048                	addi	a0,sp,4
    5fc6:	c03e                	sw	a5,0(sp)
    5fc8:	ccdff0ef          	jal	ra,5c94 <rcvr_mmc>
		if (d[0] != 0xFF) break;
    5fcc:	00414703          	lbu	a4,4(sp)
    5fd0:	0ff00693          	li	a3,255
    5fd4:	00d71b63          	bne	a4,a3,5fea <rcvr_datablock+0x38>
	for (tmr = 1000; tmr; tmr--) {	/* Wait for data packet in timeout of 100ms */
    5fd8:	4782                	lw	a5,0(sp)
    5fda:	17fd                	addi	a5,a5,-1
    5fdc:	f3fd                	bnez	a5,5fc2 <rcvr_datablock+0x10>
	if (d[0] != 0xFE) return 0;		/* If not valid data token, return with error */
    5fde:	4501                	li	a0,0
}
    5fe0:	40c2                	lw	ra,16(sp)
    5fe2:	4432                	lw	s0,12(sp)
    5fe4:	44a2                	lw	s1,8(sp)
    5fe6:	0151                	addi	sp,sp,20
    5fe8:	8082                	ret
	if (d[0] != 0xFE) return 0;		/* If not valid data token, return with error */
    5fea:	0fe00793          	li	a5,254
    5fee:	4501                	li	a0,0
    5ff0:	fef718e3          	bne	a4,a5,5fe0 <rcvr_datablock+0x2e>
	rcvr_mmc(buff, btr);			/* Receive the data block into buffer */
    5ff4:	85a6                	mv	a1,s1
    5ff6:	8522                	mv	a0,s0
    5ff8:	c9dff0ef          	jal	ra,5c94 <rcvr_mmc>
	rcvr_mmc(d, 2);					/* Discard CRC */
    5ffc:	0048                	addi	a0,sp,4
    5ffe:	4589                	li	a1,2
    6000:	c95ff0ef          	jal	ra,5c94 <rcvr_mmc>
	return 1;						/* Return with success */
    6004:	4505                	li	a0,1
    6006:	bfe9                	j	5fe0 <rcvr_datablock+0x2e>

00006008 <xmit_datablock>:
{
    6008:	1141                	addi	sp,sp,-16
    600a:	c422                	sw	s0,8(sp)
    600c:	c226                	sw	s1,4(sp)
    600e:	c606                	sw	ra,12(sp)
    6010:	84aa                	mv	s1,a0
    6012:	842e                	mv	s0,a1
	if (!wait_ready()) return 0;
    6014:	e61ff0ef          	jal	ra,5e74 <wait_ready>
    6018:	cd1d                	beqz	a0,6056 <xmit_datablock+0x4e>
	xmit_mmc(d, 1);				/* Xmit a token */
    601a:	850a                	mv	a0,sp
    601c:	4585                	li	a1,1
	d[0] = token;
    601e:	00810023          	sb	s0,0(sp)
	xmit_mmc(d, 1);				/* Xmit a token */
    6022:	a2fff0ef          	jal	ra,5a50 <xmit_mmc>
	if (token != 0xFD) {		/* Is it data token? */
    6026:	0fd00793          	li	a5,253
	return 1;
    602a:	4505                	li	a0,1
	if (token != 0xFD) {		/* Is it data token? */
    602c:	02f40563          	beq	s0,a5,6056 <xmit_datablock+0x4e>
		xmit_mmc(buff, 512);	/* Xmit the 512 byte data block to MMC */
    6030:	20000593          	li	a1,512
    6034:	8526                	mv	a0,s1
    6036:	a1bff0ef          	jal	ra,5a50 <xmit_mmc>
		rcvr_mmc(d, 2);			/* Xmit dummy CRC (0xFF,0xFF) */
    603a:	4589                	li	a1,2
    603c:	850a                	mv	a0,sp
    603e:	c57ff0ef          	jal	ra,5c94 <rcvr_mmc>
		rcvr_mmc(d, 1);			/* Receive data response */
    6042:	850a                	mv	a0,sp
    6044:	4585                	li	a1,1
    6046:	c4fff0ef          	jal	ra,5c94 <rcvr_mmc>
		if ((d[0] & 0x1F) != 0x05)	/* If not accepted, return with error */
    604a:	00014503          	lbu	a0,0(sp)
    604e:	897d                	andi	a0,a0,31
    6050:	156d                	addi	a0,a0,-5
    6052:	00153513          	seqz	a0,a0
}
    6056:	40b2                	lw	ra,12(sp)
    6058:	4422                	lw	s0,8(sp)
    605a:	4492                	lw	s1,4(sp)
    605c:	0141                	addi	sp,sp,16
    605e:	8082                	ret

00006060 <disk_status>:

DSTATUS disk_status (
	BYTE drv			/* Drive number (always 0) */
)
{
	if (drv) return STA_NOINIT;
    6060:	e501                	bnez	a0,6068 <disk_status+0x8>

	return Stat;
    6062:	0081c503          	lbu	a0,8(gp) # 200004f0 <Stat>
    6066:	8082                	ret
	if (drv) return STA_NOINIT;
    6068:	4505                	li	a0,1
}
    606a:	8082                	ret

0000606c <disk_initialize>:
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
	BYTE drv		/* Physical drive nmuber (0) */
)
{
    606c:	1131                	addi	sp,sp,-20
    606e:	c622                	sw	s0,12(sp)
    6070:	c806                	sw	ra,16(sp)
    6072:	c426                	sw	s1,8(sp)
	BYTE n, ty, cmd, buf[4];
	UINT tmr;
	DSTATUS s;


	if (drv) return RES_NOTRDY;
    6074:	440d                	li	s0,3
    6076:	0e051263          	bnez	a0,615a <disk_initialize+0xee>

    
	dly_us(10000);			/* 10ms */
    soft_spi_init();
    607a:	b1dff0ef          	jal	ra,5b96 <soft_spi_init>
    CS_H();
    607e:	0681a503          	lw	a0,104(gp) # 20000550 <sd_cs_pin_handle_t>
    6082:	4585                	li	a1,1
    CK_L();	
    6084:	4429                	li	s0,10
    CS_H();
    6086:	8b9fd0ef          	jal	ra,393e <csi_gpio_pin_write>
    CK_L();	
    608a:	0641a503          	lw	a0,100(gp) # 2000054c <sd_clk_pin_handle_t>
    608e:	4581                	li	a1,0
    6090:	8affd0ef          	jal	ra,393e <csi_gpio_pin_write>

	for (n = 10; n; n--) rcvr_mmc(buf, 1);	/* Apply 80 dummy clocks and the card gets ready to receive command */
    6094:	147d                	addi	s0,s0,-1
    6096:	4585                	li	a1,1
    6098:	0048                	addi	a0,sp,4
    609a:	0ff47413          	andi	s0,s0,255
    609e:	bf7ff0ef          	jal	ra,5c94 <rcvr_mmc>
    60a2:	f86d                	bnez	s0,6094 <disk_initialize+0x28>

	ty = 0;
	if (send_cmd(CMD0, 0) == 1) {			/* Enter Idle state */
    60a4:	4581                	li	a1,0
    60a6:	4501                	li	a0,0
    60a8:	e4dff0ef          	jal	ra,5ef4 <send_cmd>
    60ac:	4785                	li	a5,1
    60ae:	842a                	mv	s0,a0
    60b0:	04f51363          	bne	a0,a5,60f6 <disk_initialize+0x8a>
		if (send_cmd(CMD8, 0x1AA) == 1) {	/* SDv2? */
    60b4:	1aa00593          	li	a1,426
    60b8:	4521                	li	a0,8
    60ba:	e3bff0ef          	jal	ra,5ef4 <send_cmd>
    60be:	84aa                	mv	s1,a0
    60c0:	02851d63          	bne	a0,s0,60fa <disk_initialize+0x8e>
			rcvr_mmc(buf, 4);							/* Get trailing return value of R7 resp */
    60c4:	4591                	li	a1,4
    60c6:	0048                	addi	a0,sp,4
    60c8:	bcdff0ef          	jal	ra,5c94 <rcvr_mmc>
			if (buf[2] == 0x01 && buf[3] == 0xAA) {		/* The card can work at vdd range of 2.7-3.6V */
    60cc:	00614783          	lbu	a5,6(sp)
    60d0:	02979363          	bne	a5,s1,60f6 <disk_initialize+0x8a>
    60d4:	00714703          	lbu	a4,7(sp)
    60d8:	0aa00793          	li	a5,170
    60dc:	00f71d63          	bne	a4,a5,60f6 <disk_initialize+0x8a>
    60e0:	3e800413          	li	s0,1000
				for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state (ACMD41 with HCS bit) */
					if (send_cmd(ACMD41, 1UL << 30) == 0) break;
    60e4:	400005b7          	lui	a1,0x40000
    60e8:	0a900513          	li	a0,169
    60ec:	e09ff0ef          	jal	ra,5ef4 <send_cmd>
    60f0:	cd05                	beqz	a0,6128 <disk_initialize+0xbc>
				for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state (ACMD41 with HCS bit) */
    60f2:	147d                	addi	s0,s0,-1
    60f4:	f865                	bnez	s0,60e4 <disk_initialize+0x78>
			for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state */
				if (send_cmd(cmd, 0) == 0) break;
				dly_us(1000);
			}
			if (!tmr || send_cmd(CMD16, 512) != 0)	/* Set R/W block length to 512 */
				ty = 0;
    60f6:	4401                	li	s0,0
    60f8:	a889                	j	614a <disk_initialize+0xde>
			if (send_cmd(ACMD41, 0) <= 1) 	{
    60fa:	4581                	li	a1,0
    60fc:	0a900513          	li	a0,169
    6100:	df5ff0ef          	jal	ra,5ef4 <send_cmd>
				ty = CT_MMC3; cmd = CMD1;	/* MMCv3 */
    6104:	4785                	li	a5,1
			if (send_cmd(ACMD41, 0) <= 1) 	{
    6106:	00a46563          	bltu	s0,a0,6110 <disk_initialize+0xa4>
				ty = CT_SDC2; cmd = ACMD41;	/* SDv1 */
    610a:	0a900793          	li	a5,169
    610e:	4421                	li	s0,8
				ty = CT_MMC3; cmd = CMD1;	/* MMCv3 */
    6110:	3e800493          	li	s1,1000
				if (send_cmd(cmd, 0) == 0) break;
    6114:	4581                	li	a1,0
    6116:	853e                	mv	a0,a5
    6118:	c03e                	sw	a5,0(sp)
    611a:	ddbff0ef          	jal	ra,5ef4 <send_cmd>
    611e:	c521                	beqz	a0,6166 <disk_initialize+0xfa>
			for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state */
    6120:	14fd                	addi	s1,s1,-1
    6122:	4782                	lw	a5,0(sp)
    6124:	f8e5                	bnez	s1,6114 <disk_initialize+0xa8>
    6126:	bfc1                	j	60f6 <disk_initialize+0x8a>
				if (tmr && send_cmd(CMD58, 0) == 0) {	/* Check CCS bit in the OCR */
    6128:	4581                	li	a1,0
    612a:	03a00513          	li	a0,58
    612e:	dc7ff0ef          	jal	ra,5ef4 <send_cmd>
    6132:	f171                	bnez	a0,60f6 <disk_initialize+0x8a>
					rcvr_mmc(buf, 4);
    6134:	4591                	li	a1,4
    6136:	0048                	addi	a0,sp,4
    6138:	b5dff0ef          	jal	ra,5c94 <rcvr_mmc>
					ty = (buf[0] & 0x40) ? CT_SDC2 | CT_BLOCK : CT_SDC2;	/* SDv2+ */
    613c:	00414783          	lbu	a5,4(sp)
    6140:	4461                	li	s0,24
    6142:	0407f793          	andi	a5,a5,64
    6146:	e391                	bnez	a5,614a <disk_initialize+0xde>
    6148:	4421                	li	s0,8
		}
	}
	CardType = ty;
    614a:	04818f23          	sb	s0,94(gp) # 20000546 <CardType>
	s = ty ? 0 : STA_NOINIT;
    614e:	00143413          	seqz	s0,s0
	Stat = s;
    6152:	00818423          	sb	s0,8(gp) # 200004f0 <Stat>

	deselect();
    6156:	d51ff0ef          	jal	ra,5ea6 <deselect>

	return s;
}
    615a:	40c2                	lw	ra,16(sp)
    615c:	8522                	mv	a0,s0
    615e:	4432                	lw	s0,12(sp)
    6160:	44a2                	lw	s1,8(sp)
    6162:	0151                	addi	sp,sp,20
    6164:	8082                	ret
			if (!tmr || send_cmd(CMD16, 512) != 0)	/* Set R/W block length to 512 */
    6166:	20000593          	li	a1,512
    616a:	4541                	li	a0,16
    616c:	d89ff0ef          	jal	ra,5ef4 <send_cmd>
    6170:	f159                	bnez	a0,60f6 <disk_initialize+0x8a>
    6172:	bfe1                	j	614a <disk_initialize+0xde>

00006174 <disk_read>:
{
	BYTE cmd;
	DWORD sect = (DWORD)sector;


	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;
    6174:	0081c703          	lbu	a4,8(gp) # 200004f0 <Stat>
    6178:	8b05                	andi	a4,a4,1
    617a:	8d59                	or	a0,a0,a4
    617c:	e525                	bnez	a0,61e4 <disk_read+0x70>
	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert LBA to byte address if needed */
    617e:	05e1c703          	lbu	a4,94(gp) # 20000546 <CardType>
{
    6182:	1141                	addi	sp,sp,-16
    6184:	c422                	sw	s0,8(sp)
    6186:	c606                	sw	ra,12(sp)
    6188:	c226                	sw	s1,4(sp)
	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert LBA to byte address if needed */
    618a:	8b41                	andi	a4,a4,16
    618c:	87ae                	mv	a5,a1
    618e:	8436                	mv	s0,a3
    6190:	85b2                	mv	a1,a2
    6192:	e319                	bnez	a4,6198 <disk_read+0x24>
    6194:	00961593          	slli	a1,a2,0x9

	cmd = count > 1 ? CMD18 : CMD17;			/*  READ_MULTIPLE_BLOCK : READ_SINGLE_BLOCK */
    6198:	4485                	li	s1,1
    619a:	0084b4b3          	sltu	s1,s1,s0
    619e:	04c5                	addi	s1,s1,17
	if (send_cmd(cmd, sect) == 0) {
    61a0:	8526                	mv	a0,s1
    61a2:	c03e                	sw	a5,0(sp)
    61a4:	d51ff0ef          	jal	ra,5ef4 <send_cmd>
    61a8:	4782                	lw	a5,0(sp)
    61aa:	e505                	bnez	a0,61d2 <disk_read+0x5e>
		do {
			if (!rcvr_datablock(buff, 512)) break;
    61ac:	20000593          	li	a1,512
    61b0:	853e                	mv	a0,a5
    61b2:	c03e                	sw	a5,0(sp)
    61b4:	dffff0ef          	jal	ra,5fb2 <rcvr_datablock>
    61b8:	c511                	beqz	a0,61c4 <disk_read+0x50>
			buff += 512;
    61ba:	4782                	lw	a5,0(sp)
		} while (--count);
    61bc:	147d                	addi	s0,s0,-1
			buff += 512;
    61be:	20078793          	addi	a5,a5,512
		} while (--count);
    61c2:	f46d                	bnez	s0,61ac <disk_read+0x38>
		if (cmd == CMD18) send_cmd(CMD12, 0);	/* STOP_TRANSMISSION */
    61c4:	47c9                	li	a5,18
    61c6:	00f49663          	bne	s1,a5,61d2 <disk_read+0x5e>
    61ca:	4581                	li	a1,0
    61cc:	4531                	li	a0,12
    61ce:	d27ff0ef          	jal	ra,5ef4 <send_cmd>
	}
	deselect();
    61d2:	cd5ff0ef          	jal	ra,5ea6 <deselect>

	return count ? RES_ERROR : RES_OK;
}
    61d6:	40b2                	lw	ra,12(sp)
	return count ? RES_ERROR : RES_OK;
    61d8:	00803533          	snez	a0,s0
}
    61dc:	4422                	lw	s0,8(sp)
    61de:	4492                	lw	s1,4(sp)
    61e0:	0141                	addi	sp,sp,16
    61e2:	8082                	ret
	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;
    61e4:	450d                	li	a0,3
}
    61e6:	8082                	ret

000061e8 <disk_write>:
)
{
	DWORD sect = (DWORD)sector;


	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;
    61e8:	0081c783          	lbu	a5,8(gp) # 200004f0 <Stat>
    61ec:	8b85                	andi	a5,a5,1
    61ee:	8d5d                	or	a0,a0,a5
    61f0:	e549                	bnez	a0,627a <disk_write+0x92>
	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert LBA to byte address if needed */
    61f2:	05e1c783          	lbu	a5,94(gp) # 20000546 <CardType>
{
    61f6:	1141                	addi	sp,sp,-16
    61f8:	c422                	sw	s0,8(sp)
    61fa:	c226                	sw	s1,4(sp)
    61fc:	c606                	sw	ra,12(sp)
	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert LBA to byte address if needed */
    61fe:	0107f713          	andi	a4,a5,16
    6202:	84ae                	mv	s1,a1
    6204:	8436                	mv	s0,a3
    6206:	e311                	bnez	a4,620a <disk_write+0x22>
    6208:	0626                	slli	a2,a2,0x9

	if (count == 1) {	/* Single block write */
    620a:	4705                	li	a4,1
    620c:	02e41763          	bne	s0,a4,623a <disk_write+0x52>
		if ((send_cmd(CMD24, sect) == 0)	/* WRITE_BLOCK */
    6210:	85b2                	mv	a1,a2
    6212:	4561                	li	a0,24
    6214:	ce1ff0ef          	jal	ra,5ef4 <send_cmd>
    6218:	ed39                	bnez	a0,6276 <disk_write+0x8e>
			&& xmit_datablock(buff, 0xFE))
    621a:	0fe00593          	li	a1,254
    621e:	8526                	mv	a0,s1
    6220:	de9ff0ef          	jal	ra,6008 <xmit_datablock>
    6224:	00153413          	seqz	s0,a0
			} while (--count);
			if (!xmit_datablock(0, 0xFD))	/* STOP_TRAN token */
				count = 1;
		}
	}
	deselect();
    6228:	c7fff0ef          	jal	ra,5ea6 <deselect>

	return count ? RES_ERROR : RES_OK;
}
    622c:	40b2                	lw	ra,12(sp)
	return count ? RES_ERROR : RES_OK;
    622e:	00803533          	snez	a0,s0
}
    6232:	4422                	lw	s0,8(sp)
    6234:	4492                	lw	s1,4(sp)
    6236:	0141                	addi	sp,sp,16
    6238:	8082                	ret
		if (CardType & CT_SDC) send_cmd(ACMD23, count);
    623a:	8bb1                	andi	a5,a5,12
    623c:	cb81                	beqz	a5,624c <disk_write+0x64>
    623e:	85a2                	mv	a1,s0
    6240:	09700513          	li	a0,151
    6244:	c032                	sw	a2,0(sp)
    6246:	cafff0ef          	jal	ra,5ef4 <send_cmd>
    624a:	4602                	lw	a2,0(sp)
		if (send_cmd(CMD25, sect) == 0) {	/* WRITE_MULTIPLE_BLOCK */
    624c:	85b2                	mv	a1,a2
    624e:	4565                	li	a0,25
    6250:	ca5ff0ef          	jal	ra,5ef4 <send_cmd>
    6254:	f971                	bnez	a0,6228 <disk_write+0x40>
				if (!xmit_datablock(buff, 0xFC)) break;
    6256:	0fc00593          	li	a1,252
    625a:	8526                	mv	a0,s1
    625c:	dadff0ef          	jal	ra,6008 <xmit_datablock>
    6260:	c509                	beqz	a0,626a <disk_write+0x82>
			} while (--count);
    6262:	147d                	addi	s0,s0,-1
				buff += 512;
    6264:	20048493          	addi	s1,s1,512
			} while (--count);
    6268:	f47d                	bnez	s0,6256 <disk_write+0x6e>
			if (!xmit_datablock(0, 0xFD))	/* STOP_TRAN token */
    626a:	0fd00593          	li	a1,253
    626e:	4501                	li	a0,0
    6270:	d99ff0ef          	jal	ra,6008 <xmit_datablock>
    6274:	f955                	bnez	a0,6228 <disk_write+0x40>
				count = 1;
    6276:	4405                	li	s0,1
    6278:	bf45                	j	6228 <disk_write+0x40>
	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;
    627a:	450d                	li	a0,3
}
    627c:	8082                	ret

0000627e <disk_ioctl>:
	DRESULT res;
	BYTE n, csd[16];
	DWORD cs;


	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;	/* Check if card is in the socket */
    627e:	0081c783          	lbu	a5,8(gp) # 200004f0 <Stat>
    6282:	8b85                	andi	a5,a5,1
    6284:	8d5d                	or	a0,a0,a5
    6286:	ed45                	bnez	a0,633e <disk_ioctl+0xc0>
{
    6288:	1101                	addi	sp,sp,-32
    628a:	cc22                	sw	s0,24(sp)
    628c:	ca26                	sw	s1,20(sp)
    628e:	ce06                	sw	ra,28(sp)

	res = RES_ERROR;
	switch (ctrl) {
    6290:	4785                	li	a5,1
    6292:	84ae                	mv	s1,a1
    6294:	8432                	mv	s0,a2
    6296:	02f58463          	beq	a1,a5,62be <disk_ioctl+0x40>
    629a:	478d                	li	a5,3
    629c:	08f58e63          	beq	a1,a5,6338 <disk_ioctl+0xba>
    62a0:	4511                	li	a0,4
    62a2:	e589                	bnez	a1,62ac <disk_ioctl+0x2e>
		case CTRL_SYNC :		/* Make sure that no pending write process */
			if (my_select()) res = RES_OK;
    62a4:	c21ff0ef          	jal	ra,5ec4 <my_select>
    62a8:	00153513          	seqz	a0,a0
    62ac:	c02a                	sw	a0,0(sp)

		default:
			res = RES_PARERR;
	}

	deselect();
    62ae:	bf9ff0ef          	jal	ra,5ea6 <deselect>

	return res;
}
    62b2:	40f2                	lw	ra,28(sp)
    62b4:	4462                	lw	s0,24(sp)
	return res;
    62b6:	4502                	lw	a0,0(sp)
}
    62b8:	44d2                	lw	s1,20(sp)
    62ba:	6105                	addi	sp,sp,32
    62bc:	8082                	ret
			if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
    62be:	4581                	li	a1,0
    62c0:	4525                	li	a0,9
    62c2:	c33ff0ef          	jal	ra,5ef4 <send_cmd>
    62c6:	c119                	beqz	a0,62cc <disk_ioctl+0x4e>
	res = RES_ERROR;
    62c8:	4505                	li	a0,1
    62ca:	b7cd                	j	62ac <disk_ioctl+0x2e>
			if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
    62cc:	45c1                	li	a1,16
    62ce:	0048                	addi	a0,sp,4
    62d0:	ce3ff0ef          	jal	ra,5fb2 <rcvr_datablock>
    62d4:	d975                	beqz	a0,62c8 <disk_ioctl+0x4a>
				if ((csd[0] >> 6) == 1) {	/* SDC ver 2.00 */
    62d6:	00414603          	lbu	a2,4(sp)
					cs = csd[9] + ((WORD)csd[8] << 8) + ((DWORD)(csd[7] & 63) << 16) + 1;
    62da:	00d14683          	lbu	a3,13(sp)
    62de:	00c14783          	lbu	a5,12(sp)
				if ((csd[0] >> 6) == 1) {	/* SDC ver 2.00 */
    62e2:	8219                	srli	a2,a2,0x6
					cs = csd[9] + ((WORD)csd[8] << 8) + ((DWORD)(csd[7] & 63) << 16) + 1;
    62e4:	00b14703          	lbu	a4,11(sp)
				if ((csd[0] >> 6) == 1) {	/* SDC ver 2.00 */
    62e8:	00961e63          	bne	a2,s1,6304 <disk_ioctl+0x86>
					cs = csd[9] + ((WORD)csd[8] << 8) + ((DWORD)(csd[7] & 63) << 16) + 1;
    62ec:	0742                	slli	a4,a4,0x10
    62ee:	003f0637          	lui	a2,0x3f0
    62f2:	8f71                	and	a4,a4,a2
    62f4:	07a2                	slli	a5,a5,0x8
    62f6:	0705                	addi	a4,a4,1
    62f8:	97b6                	add	a5,a5,a3
    62fa:	97ba                	add	a5,a5,a4
					*(LBA_t*)buff = cs << 10;
    62fc:	07aa                	slli	a5,a5,0xa
			*(DWORD*)buff = 128;
    62fe:	c01c                	sw	a5,0(s0)
			res = RES_OK;
    6300:	4501                	li	a0,0
			break;
    6302:	b76d                	j	62ac <disk_ioctl+0x2e>
					cs = (csd[8] >> 6) + ((WORD)csd[7] << 2) + ((WORD)(csd[6] & 3) << 10) + 1;
    6304:	070a                	slli	a4,a4,0x2
    6306:	8399                	srli	a5,a5,0x6
    6308:	97ba                	add	a5,a5,a4
    630a:	00a14703          	lbu	a4,10(sp)
    630e:	6605                	lui	a2,0x1
    6310:	c0060613          	addi	a2,a2,-1024 # c00 <__adddf3+0x34c>
    6314:	072a                	slli	a4,a4,0xa
    6316:	8f71                	and	a4,a4,a2
    6318:	97ba                	add	a5,a5,a4
					n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
    631a:	00e14603          	lbu	a2,14(sp)
    631e:	00914703          	lbu	a4,9(sp)
    6322:	0686                	slli	a3,a3,0x1
    6324:	821d                	srli	a2,a2,0x7
    6326:	8b3d                	andi	a4,a4,15
    6328:	9732                	add	a4,a4,a2
    632a:	8a99                	andi	a3,a3,6
					*(LBA_t*)buff = cs << (n - 9);
    632c:	96ba                	add	a3,a3,a4
					cs = (csd[8] >> 6) + ((WORD)csd[7] << 2) + ((WORD)(csd[6] & 3) << 10) + 1;
    632e:	0785                	addi	a5,a5,1
					*(LBA_t*)buff = cs << (n - 9);
    6330:	16e5                	addi	a3,a3,-7
    6332:	00d797b3          	sll	a5,a5,a3
    6336:	b7e1                	j	62fe <disk_ioctl+0x80>
			*(DWORD*)buff = 128;
    6338:	08000793          	li	a5,128
    633c:	b7c9                	j	62fe <disk_ioctl+0x80>
	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;	/* Check if card is in the socket */
    633e:	450d                	li	a0,3
}
    6340:	8082                	ret

00006342 <copystring>:
    6342:	4781                	li	a5,0
    6344:	470d                	li	a4,3
    6346:	00b7c463          	blt	a5,a1,634e <copystring+0xc>
    634a:	853e                	mv	a0,a5
    634c:	8082                	ret
    634e:	00f606b3          	add	a3,a2,a5
    6352:	0006c303          	lbu	t1,0(a3)
    6356:	00f506b3          	add	a3,a0,a5
    635a:	0785                	addi	a5,a5,1
    635c:	00668023          	sb	t1,0(a3)
    6360:	fee793e3          	bne	a5,a4,6346 <copystring+0x4>
    6364:	feb7d3e3          	bge	a5,a1,634a <copystring+0x8>
    6368:	000501a3          	sb	zero,3(a0)
    636c:	4791                	li	a5,4
    636e:	bff1                	j	634a <copystring+0x8>

00006370 <__dtostr>:
    6370:	fa810113          	addi	sp,sp,-88
    6374:	c8a2                	sw	s0,80(sp)
    6376:	ca86                	sw	ra,84(sp)
    6378:	c6a6                	sw	s1,76(sp)
    637a:	d02a                	sw	a0,32(sp)
    637c:	c42e                	sw	a1,8(sp)
    637e:	c032                	sw	a2,0(sp)
    6380:	8436                	mv	s0,a3
    6382:	d43a                	sw	a4,40(sp)
    6384:	c23e                	sw	a5,4(sp)
    6386:	2edd                	jal	677c <__isinf>
    6388:	cd09                	beqz	a0,63a2 <__dtostr+0x32>
    638a:	6621                	lui	a2,0x8
    638c:	13060613          	addi	a2,a2,304 # 8130 <asc2_1608+0x644>
    6390:	85a2                	mv	a1,s0
    6392:	4446                	lw	s0,80(sp)
    6394:	4502                	lw	a0,0(sp)
    6396:	40d6                	lw	ra,84(sp)
    6398:	44b6                	lw	s1,76(sp)
    639a:	05810113          	addi	sp,sp,88
    639e:	fa5ff06f          	j	6342 <copystring>
    63a2:	5702                	lw	a4,32(sp)
    63a4:	47a2                	lw	a5,8(sp)
    63a6:	853a                	mv	a0,a4
    63a8:	85be                	mv	a1,a5
    63aa:	2b15                	jal	68de <__isnan>
    63ac:	d22a                	sw	a0,36(sp)
    63ae:	c509                	beqz	a0,63b8 <__dtostr+0x48>
    63b0:	6621                	lui	a2,0x8
    63b2:	13460613          	addi	a2,a2,308 # 8134 <asc2_1608+0x648>
    63b6:	bfe9                	j	6390 <__dtostr+0x20>
    63b8:	5702                	lw	a4,32(sp)
    63ba:	47a2                	lw	a5,8(sp)
    63bc:	4601                	li	a2,0
    63be:	4681                	li	a3,0
    63c0:	853a                	mv	a0,a4
    63c2:	85be                	mv	a1,a5
    63c4:	878fb0ef          	jal	ra,143c <__eqdf2>
    63c8:	e925                	bnez	a0,6438 <__dtostr+0xc8>
    63ca:	4792                	lw	a5,4(sp)
    63cc:	3a078363          	beqz	a5,6772 <__dtostr+0x402>
    63d0:	0789                	addi	a5,a5,2
    63d2:	02f46163          	bltu	s0,a5,63f4 <__dtostr+0x84>
    63d6:	cb85                	beqz	a5,6406 <__dtostr+0x96>
    63d8:	4722                	lw	a4,8(sp)
    63da:	04075c63          	bgez	a4,6432 <__dtostr+0xc2>
    63de:	4682                	lw	a3,0(sp)
    63e0:	02d00713          	li	a4,45
    63e4:	00e68023          	sb	a4,0(a3)
    63e8:	00178713          	addi	a4,a5,1
    63ec:	4785                	li	a5,1
    63ee:	03000693          	li	a3,48
    63f2:	a801                	j	6402 <__dtostr+0x92>
    63f4:	47a1                	li	a5,8
    63f6:	b7cd                	j	63d8 <__dtostr+0x68>
    63f8:	4602                	lw	a2,0(sp)
    63fa:	963e                	add	a2,a2,a5
    63fc:	00d60023          	sb	a3,0(a2)
    6400:	0785                	addi	a5,a5,1
    6402:	fee7ebe3          	bltu	a5,a4,63f8 <__dtostr+0x88>
    6406:	4702                	lw	a4,0(sp)
    6408:	03000693          	li	a3,48
    640c:	00074603          	lbu	a2,0(a4)
    6410:	4705                	li	a4,1
    6412:	00d60363          	beq	a2,a3,6418 <__dtostr+0xa8>
    6416:	4709                	li	a4,2
    6418:	4682                	lw	a3,0(sp)
    641a:	9736                	add	a4,a4,a3
    641c:	02e00693          	li	a3,46
    6420:	00d70023          	sb	a3,0(a4)
    6424:	4702                	lw	a4,0(sp)
    6426:	00f704b3          	add	s1,a4,a5
    642a:	00048023          	sb	zero,0(s1)
    642e:	d23e                	sw	a5,36(sp)
    6430:	a459                	j	66b6 <__dtostr+0x346>
    6432:	873e                	mv	a4,a5
    6434:	4781                	li	a5,0
    6436:	bf65                	j	63ee <__dtostr+0x7e>
    6438:	5702                	lw	a4,32(sp)
    643a:	47a2                	lw	a5,8(sp)
    643c:	4601                	li	a2,0
    643e:	4681                	li	a3,0
    6440:	853a                	mv	a0,a4
    6442:	85be                	mv	a1,a5
    6444:	92afb0ef          	jal	ra,156e <__ledf2>
    6448:	16055f63          	bgez	a0,65c6 <__dtostr+0x256>
    644c:	47a2                	lw	a5,8(sp)
    644e:	4702                	lw	a4,0(sp)
    6450:	800002b7          	lui	t0,0x80000
    6454:	00f2c2b3          	xor	t0,t0,a5
    6458:	02d00793          	li	a5,45
    645c:	00f70023          	sb	a5,0(a4)
    6460:	147d                	addi	s0,s0,-1
    6462:	00170493          	addi	s1,a4,1
    6466:	67a1                	lui	a5,0x8
    6468:	0f87a503          	lw	a0,248(a5) # 80f8 <asc2_1608+0x60c>
    646c:	0fc7a583          	lw	a1,252(a5)
    6470:	67a1                	lui	a5,0x8
    6472:	1087a703          	lw	a4,264(a5) # 8108 <asc2_1608+0x61c>
    6476:	10c7a783          	lw	a5,268(a5)
    647a:	4381                	li	t2,0
    647c:	4692                	lw	a3,4(sp)
    647e:	14d39763          	bne	t2,a3,65cc <__dtostr+0x25c>
    6482:	5702                	lw	a4,32(sp)
    6484:	862a                	mv	a2,a0
    6486:	86ae                	mv	a3,a1
    6488:	853a                	mv	a0,a4
    648a:	8596                	mv	a1,t0
    648c:	c28fa0ef          	jal	ra,8b4 <__adddf3>
    6490:	67a1                	lui	a5,0x8
    6492:	1107a603          	lw	a2,272(a5) # 8110 <asc2_1608+0x624>
    6496:	1147a683          	lw	a3,276(a5)
    649a:	c82a                	sw	a0,16(sp)
    649c:	ca2e                	sw	a1,20(sp)
    649e:	8d0fb0ef          	jal	ra,156e <__ledf2>
    64a2:	00055863          	bgez	a0,64b2 <__dtostr+0x142>
    64a6:	03000793          	li	a5,48
    64aa:	00f48023          	sb	a5,0(s1)
    64ae:	147d                	addi	s0,s0,-1
    64b0:	0485                	addi	s1,s1,1
    64b2:	47a2                	lw	a5,8(sp)
    64b4:	0147d513          	srli	a0,a5,0x14
    64b8:	7ff57513          	andi	a0,a0,2047
    64bc:	c0150513          	addi	a0,a0,-1023
    64c0:	c5dfb0ef          	jal	ra,211c <__floatsidf>
    64c4:	67a1                	lui	a5,0x8
    64c6:	1187a603          	lw	a2,280(a5) # 8118 <asc2_1608+0x62c>
    64ca:	11c7a683          	lw	a3,284(a5)
    64ce:	956fb0ef          	jal	ra,1624 <__muldf3>
    64d2:	be7fb0ef          	jal	ra,20b8 <__fixdfsi>
    64d6:	00150793          	addi	a5,a0,1
    64da:	cc3e                	sw	a5,24(sp)
    64dc:	22f05763          	blez	a5,670a <__dtostr+0x39a>
    64e0:	66a1                	lui	a3,0x8
    64e2:	1206a603          	lw	a2,288(a3) # 8120 <asc2_1608+0x634>
    64e6:	82be                	mv	t0,a5
    64e8:	1246a683          	lw	a3,292(a3)
    64ec:	67a1                	lui	a5,0x8
    64ee:	1007a703          	lw	a4,256(a5) # 8100 <asc2_1608+0x614>
    64f2:	1047a783          	lw	a5,260(a5)
    64f6:	43a9                	li	t2,10
    64f8:	d632                	sw	a2,44(sp)
    64fa:	d836                	sw	a3,48(sp)
    64fc:	0e53e663          	bltu	t2,t0,65e8 <__dtostr+0x278>
    6500:	66a1                	lui	a3,0x8
    6502:	1006a603          	lw	a2,256(a3) # 8100 <asc2_1608+0x614>
    6506:	1046a683          	lw	a3,260(a3)
    650a:	4385                	li	t2,1
    650c:	d632                	sw	a2,44(sp)
    650e:	d836                	sw	a3,48(sp)
    6510:	0e729963          	bne	t0,t2,6602 <__dtostr+0x292>
    6514:	4685                	li	a3,1
    6516:	d636                	sw	a3,44(sp)
    6518:	66a1                	lui	a3,0x8
    651a:	1286a603          	lw	a2,296(a3) # 8128 <asc2_1608+0x63c>
    651e:	12c6a683          	lw	a3,300(a3)
    6522:	da32                	sw	a2,52(sp)
    6524:	dc36                	sw	a3,56(sp)
    6526:	66a1                	lui	a3,0x8
    6528:	1006a603          	lw	a2,256(a3) # 8100 <asc2_1608+0x614>
    652c:	1046a683          	lw	a3,260(a3)
    6530:	de32                	sw	a2,60(sp)
    6532:	c0b6                	sw	a3,64(sp)
    6534:	5652                	lw	a2,52(sp)
    6536:	56e2                	lw	a3,56(sp)
    6538:	853a                	mv	a0,a4
    653a:	85be                	mv	a1,a5
    653c:	c2ba                	sw	a4,68(sp)
    653e:	c4be                	sw	a5,72(sp)
    6540:	f79fa0ef          	jal	ra,14b8 <__gedf2>
    6544:	4716                	lw	a4,68(sp)
    6546:	47a6                	lw	a5,72(sp)
    6548:	0ca04a63          	bgtz	a0,661c <__dtostr+0x2ac>
    654c:	4682                	lw	a3,0(sp)
    654e:	00d49a63          	bne	s1,a3,6562 <__dtostr+0x1f2>
    6552:	16040263          	beqz	s0,66b6 <__dtostr+0x346>
    6556:	03000693          	li	a3,48
    655a:	00d48023          	sb	a3,0(s1)
    655e:	147d                	addi	s0,s0,-1
    6560:	0485                	addi	s1,s1,1
    6562:	4692                	lw	a3,4(sp)
    6564:	ea81                	bnez	a3,6574 <__dtostr+0x204>
    6566:	4682                	lw	a3,0(sp)
    6568:	5622                	lw	a2,40(sp)
    656a:	40d486b3          	sub	a3,s1,a3
    656e:	0685                	addi	a3,a3,1
    6570:	04c6f563          	bgeu	a3,a2,65ba <__dtostr+0x24a>
    6574:	14040163          	beqz	s0,66b6 <__dtostr+0x346>
    6578:	02e00693          	li	a3,46
    657c:	00d48023          	sb	a3,0(s1)
    6580:	4692                	lw	a3,4(sp)
    6582:	147d                	addi	s0,s0,-1
    6584:	00148293          	addi	t0,s1,1
    6588:	ea81                	bnez	a3,6598 <__dtostr+0x228>
    658a:	56a2                	lw	a3,40(sp)
    658c:	4602                	lw	a2,0(sp)
    658e:	0685                	addi	a3,a3,1
    6590:	40c28633          	sub	a2,t0,a2
    6594:	8e91                	sub	a3,a3,a2
    6596:	c236                	sw	a3,4(sp)
    6598:	4692                	lw	a3,4(sp)
    659a:	10d46e63          	bltu	s0,a3,66b6 <__dtostr+0x346>
    659e:	8426                	mv	s0,s1
    65a0:	94b6                	add	s1,s1,a3
    65a2:	66a1                	lui	a3,0x8
    65a4:	1006a603          	lw	a2,256(a3) # 8100 <asc2_1608+0x614>
    65a8:	1046a683          	lw	a3,260(a3)
    65ac:	c432                	sw	a2,8(sp)
    65ae:	c636                	sw	a3,12(sp)
    65b0:	16941363          	bne	s0,s1,6716 <__dtostr+0x3a6>
    65b4:	4792                	lw	a5,4(sp)
    65b6:	00f284b3          	add	s1,t0,a5
    65ba:	4782                	lw	a5,0(sp)
    65bc:	00048023          	sb	zero,0(s1)
    65c0:	40f487b3          	sub	a5,s1,a5
    65c4:	b5ad                	j	642e <__dtostr+0xbe>
    65c6:	4482                	lw	s1,0(sp)
    65c8:	42a2                	lw	t0,8(sp)
    65ca:	bd71                	j	6466 <__dtostr+0xf6>
    65cc:	863a                	mv	a2,a4
    65ce:	86be                	mv	a3,a5
    65d0:	d616                	sw	t0,44(sp)
    65d2:	cc1e                	sw	t2,24(sp)
    65d4:	c83a                	sw	a4,16(sp)
    65d6:	ca3e                	sw	a5,20(sp)
    65d8:	84cfb0ef          	jal	ra,1624 <__muldf3>
    65dc:	43e2                	lw	t2,24(sp)
    65de:	52b2                	lw	t0,44(sp)
    65e0:	4742                	lw	a4,16(sp)
    65e2:	0385                	addi	t2,t2,1
    65e4:	47d2                	lw	a5,20(sp)
    65e6:	bd59                	j	647c <__dtostr+0x10c>
    65e8:	5632                	lw	a2,44(sp)
    65ea:	56c2                	lw	a3,48(sp)
    65ec:	853a                	mv	a0,a4
    65ee:	85be                	mv	a1,a5
    65f0:	da16                	sw	t0,52(sp)
    65f2:	832fb0ef          	jal	ra,1624 <__muldf3>
    65f6:	52d2                	lw	t0,52(sp)
    65f8:	872a                	mv	a4,a0
    65fa:	87ae                	mv	a5,a1
    65fc:	12d9                	addi	t0,t0,-10
    65fe:	43a9                	li	t2,10
    6600:	bdf5                	j	64fc <__dtostr+0x18c>
    6602:	5632                	lw	a2,44(sp)
    6604:	56c2                	lw	a3,48(sp)
    6606:	853a                	mv	a0,a4
    6608:	85be                	mv	a1,a5
    660a:	da16                	sw	t0,52(sp)
    660c:	818fb0ef          	jal	ra,1624 <__muldf3>
    6610:	52d2                	lw	t0,52(sp)
    6612:	872a                	mv	a4,a0
    6614:	87ae                	mv	a5,a1
    6616:	12fd                	addi	t0,t0,-1
    6618:	4385                	li	t2,1
    661a:	bddd                	j	6510 <__dtostr+0x1a0>
    661c:	4542                	lw	a0,16(sp)
    661e:	45d2                	lw	a1,20(sp)
    6620:	863a                	mv	a2,a4
    6622:	86be                	mv	a3,a5
    6624:	c2ba                	sw	a4,68(sp)
    6626:	c4be                	sw	a5,72(sp)
    6628:	883fa0ef          	jal	ra,eaa <__divdf3>
    662c:	a8dfb0ef          	jal	ra,20b8 <__fixdfsi>
    6630:	5632                	lw	a2,44(sp)
    6632:	0ff57693          	andi	a3,a0,255
    6636:	4716                	lw	a4,68(sp)
    6638:	47a6                	lw	a5,72(sp)
    663a:	c211                	beqz	a2,663e <__dtostr+0x2ce>
    663c:	ced5                	beqz	a3,66f8 <__dtostr+0x388>
    663e:	03068693          	addi	a3,a3,48
    6642:	00d48023          	sb	a3,0(s1)
    6646:	0485                	addi	s1,s1,1
    6648:	ec35                	bnez	s0,66c4 <__dtostr+0x354>
    664a:	863a                	mv	a2,a4
    664c:	86be                	mv	a3,a5
    664e:	5702                	lw	a4,32(sp)
    6650:	47a2                	lw	a5,8(sp)
    6652:	853a                	mv	a0,a4
    6654:	85be                	mv	a1,a5
    6656:	855fa0ef          	jal	ra,eaa <__divdf3>
    665a:	4792                	lw	a5,4(sp)
    665c:	5722                	lw	a4,40(sp)
    665e:	4602                	lw	a2,0(sp)
    6660:	4681                	li	a3,0
    6662:	3339                	jal	6370 <__dtostr>
    6664:	c929                	beqz	a0,66b6 <__dtostr+0x346>
    6666:	00a48333          	add	t1,s1,a0
    666a:	06500793          	li	a5,101
    666e:	00f30023          	sb	a5,0(t1)
    6672:	00130493          	addi	s1,t1,1
    6676:	fff54513          	not	a0,a0
    667a:	4711                	li	a4,4
    667c:	4685                	li	a3,1
    667e:	3e800793          	li	a5,1000
    6682:	4629                	li	a2,10
    6684:	45e2                	lw	a1,24(sp)
    6686:	00f5d363          	bge	a1,a5,668c <__dtostr+0x31c>
    668a:	e285                	bnez	a3,66aa <__dtostr+0x33a>
    668c:	c909                	beqz	a0,669e <__dtostr+0x32e>
    668e:	46e2                	lw	a3,24(sp)
    6690:	0485                	addi	s1,s1,1
    6692:	02f6c6b3          	div	a3,a3,a5
    6696:	03068693          	addi	a3,a3,48
    669a:	fed48fa3          	sb	a3,-1(s1)
    669e:	46e2                	lw	a3,24(sp)
    66a0:	157d                	addi	a0,a0,-1
    66a2:	02f6e6b3          	rem	a3,a3,a5
    66a6:	cc36                	sw	a3,24(sp)
    66a8:	4681                	li	a3,0
    66aa:	177d                	addi	a4,a4,-1
    66ac:	02c7c7b3          	div	a5,a5,a2
    66b0:	fb71                	bnez	a4,6684 <__dtostr+0x314>
    66b2:	f00514e3          	bnez	a0,65ba <__dtostr+0x24a>
    66b6:	40d6                	lw	ra,84(sp)
    66b8:	4446                	lw	s0,80(sp)
    66ba:	5512                	lw	a0,36(sp)
    66bc:	44b6                	lw	s1,76(sp)
    66be:	05810113          	addi	sp,sp,88
    66c2:	8082                	ret
    66c4:	0ff57513          	andi	a0,a0,255
    66c8:	d63a                	sw	a4,44(sp)
    66ca:	d83e                	sw	a5,48(sp)
    66cc:	a51fb0ef          	jal	ra,211c <__floatsidf>
    66d0:	5732                	lw	a4,44(sp)
    66d2:	57c2                	lw	a5,48(sp)
    66d4:	147d                	addi	s0,s0,-1
    66d6:	863a                	mv	a2,a4
    66d8:	86be                	mv	a3,a5
    66da:	c2ba                	sw	a4,68(sp)
    66dc:	c4be                	sw	a5,72(sp)
    66de:	f47fa0ef          	jal	ra,1624 <__muldf3>
    66e2:	862a                	mv	a2,a0
    66e4:	86ae                	mv	a3,a1
    66e6:	4542                	lw	a0,16(sp)
    66e8:	45d2                	lw	a1,20(sp)
    66ea:	bc2fb0ef          	jal	ra,1aac <__subdf3>
    66ee:	4716                	lw	a4,68(sp)
    66f0:	47a6                	lw	a5,72(sp)
    66f2:	c82a                	sw	a0,16(sp)
    66f4:	ca2e                	sw	a1,20(sp)
    66f6:	d602                	sw	zero,44(sp)
    66f8:	5672                	lw	a2,60(sp)
    66fa:	4686                	lw	a3,64(sp)
    66fc:	853a                	mv	a0,a4
    66fe:	85be                	mv	a1,a5
    6700:	faafa0ef          	jal	ra,eaa <__divdf3>
    6704:	872a                	mv	a4,a0
    6706:	87ae                	mv	a5,a1
    6708:	b535                	j	6534 <__dtostr+0x1c4>
    670a:	67a1                	lui	a5,0x8
    670c:	1087a703          	lw	a4,264(a5) # 8108 <asc2_1608+0x61c>
    6710:	10c7a783          	lw	a5,268(a5)
    6714:	bd25                	j	654c <__dtostr+0x1dc>
    6716:	4542                	lw	a0,16(sp)
    6718:	45d2                	lw	a1,20(sp)
    671a:	863a                	mv	a2,a4
    671c:	86be                	mv	a3,a5
    671e:	d016                	sw	t0,32(sp)
    6720:	cc3a                	sw	a4,24(sp)
    6722:	ce3e                	sw	a5,28(sp)
    6724:	f86fa0ef          	jal	ra,eaa <__divdf3>
    6728:	991fb0ef          	jal	ra,20b8 <__fixdfsi>
    672c:	03050693          	addi	a3,a0,48
    6730:	00d400a3          	sb	a3,1(s0)
    6734:	0ff57513          	andi	a0,a0,255
    6738:	9e5fb0ef          	jal	ra,211c <__floatsidf>
    673c:	4762                	lw	a4,24(sp)
    673e:	47f2                	lw	a5,28(sp)
    6740:	0405                	addi	s0,s0,1
    6742:	863a                	mv	a2,a4
    6744:	86be                	mv	a3,a5
    6746:	edffa0ef          	jal	ra,1624 <__muldf3>
    674a:	862a                	mv	a2,a0
    674c:	86ae                	mv	a3,a1
    674e:	4542                	lw	a0,16(sp)
    6750:	45d2                	lw	a1,20(sp)
    6752:	b5afb0ef          	jal	ra,1aac <__subdf3>
    6756:	4762                	lw	a4,24(sp)
    6758:	47f2                	lw	a5,28(sp)
    675a:	4622                	lw	a2,8(sp)
    675c:	46b2                	lw	a3,12(sp)
    675e:	c82a                	sw	a0,16(sp)
    6760:	ca2e                	sw	a1,20(sp)
    6762:	853a                	mv	a0,a4
    6764:	85be                	mv	a1,a5
    6766:	f44fa0ef          	jal	ra,eaa <__divdf3>
    676a:	872a                	mv	a4,a0
    676c:	87ae                	mv	a5,a1
    676e:	5282                	lw	t0,32(sp)
    6770:	b581                	j	65b0 <__dtostr+0x240>
    6772:	47a1                	li	a5,8
    6774:	c60402e3          	beqz	s0,63d8 <__dtostr+0x68>
    6778:	4785                	li	a5,1
    677a:	b9b9                	j	63d8 <__dtostr+0x68>

0000677c <__isinf>:
    677c:	e509                	bnez	a0,6786 <__isinf+0xa>
    677e:	7ff007b7          	lui	a5,0x7ff00
    6782:	00f58b63          	beq	a1,a5,6798 <__isinf+0x1c>
    6786:	fff007b7          	lui	a5,0xfff00
    678a:	8fad                	xor	a5,a5,a1
    678c:	8d5d                	or	a0,a0,a5
    678e:	00153513          	seqz	a0,a0
    6792:	40a00533          	neg	a0,a0
    6796:	8082                	ret
    6798:	4505                	li	a0,1
    679a:	8082                	ret

0000679c <__lltostr>:
    679c:	fdc10113          	addi	sp,sp,-36
    67a0:	15fd                	addi	a1,a1,-1
    67a2:	ce22                	sw	s0,28(sp)
    67a4:	d006                	sw	ra,32(sp)
    67a6:	cc26                	sw	s1,24(sp)
    67a8:	95aa                	add	a1,a1,a0
    67aa:	00058023          	sb	zero,0(a1) # 40000000 <__heap_end+0x1ffd0000>
    67ae:	842a                	mv	s0,a0
    67b0:	82b2                	mv	t0,a2
    67b2:	8336                	mv	t1,a3
    67b4:	c709                	beqz	a4,67be <__lltostr+0x22>
    67b6:	02400693          	li	a3,36
    67ba:	00e6d363          	bge	a3,a4,67c0 <__lltostr+0x24>
    67be:	4729                	li	a4,10
    67c0:	0062e6b3          	or	a3,t0,t1
    67c4:	4601                	li	a2,0
    67c6:	e699                	bnez	a3,67d4 <__lltostr+0x38>
    67c8:	03000693          	li	a3,48
    67cc:	fed58fa3          	sb	a3,-1(a1)
    67d0:	4605                	li	a2,1
    67d2:	15fd                	addi	a1,a1,-1
    67d4:	02700693          	li	a3,39
    67d8:	c391                	beqz	a5,67dc <__lltostr+0x40>
    67da:	469d                	li	a3,7
    67dc:	0ff6f793          	andi	a5,a3,255
    67e0:	c23e                	sw	a5,4(sp)
    67e2:	00c587b3          	add	a5,a1,a2
    67e6:	c43e                	sw	a5,8(sp)
    67e8:	41f75793          	srai	a5,a4,0x1f
    67ec:	84ae                	mv	s1,a1
    67ee:	c03e                	sw	a5,0(sp)
    67f0:	47a2                	lw	a5,8(sp)
    67f2:	409786b3          	sub	a3,a5,s1
    67f6:	00947563          	bgeu	s0,s1,6800 <__lltostr+0x64>
    67fa:	0062e633          	or	a2,t0,t1
    67fe:	e205                	bnez	a2,681e <__lltostr+0x82>
    6800:	00168613          	addi	a2,a3,1
    6804:	85a6                	mv	a1,s1
    6806:	8522                	mv	a0,s0
    6808:	c036                	sw	a3,0(sp)
    680a:	9b5fb0ef          	jal	ra,21be <memmove>
    680e:	4682                	lw	a3,0(sp)
    6810:	5082                	lw	ra,32(sp)
    6812:	4472                	lw	s0,28(sp)
    6814:	44e2                	lw	s1,24(sp)
    6816:	8536                	mv	a0,a3
    6818:	02410113          	addi	sp,sp,36
    681c:	8082                	ret
    681e:	4682                	lw	a3,0(sp)
    6820:	863a                	mv	a2,a4
    6822:	8516                	mv	a0,t0
    6824:	859a                	mv	a1,t1
    6826:	ca3a                	sw	a4,20(sp)
    6828:	c816                	sw	t0,16(sp)
    682a:	c61a                	sw	t1,12(sp)
    682c:	d35f90ef          	jal	ra,560 <__umoddi3>
    6830:	03050513          	addi	a0,a0,48
    6834:	0ff57513          	andi	a0,a0,255
    6838:	03900793          	li	a5,57
    683c:	14fd                	addi	s1,s1,-1
    683e:	4332                	lw	t1,12(sp)
    6840:	42c2                	lw	t0,16(sp)
    6842:	4752                	lw	a4,20(sp)
    6844:	00a7ef63          	bltu	a5,a0,6862 <__lltostr+0xc6>
    6848:	4682                	lw	a3,0(sp)
    684a:	00a48023          	sb	a0,0(s1)
    684e:	863a                	mv	a2,a4
    6850:	8516                	mv	a0,t0
    6852:	859a                	mv	a1,t1
    6854:	c63a                	sw	a4,12(sp)
    6856:	9a1f90ef          	jal	ra,1f6 <__udivdi3>
    685a:	82aa                	mv	t0,a0
    685c:	832e                	mv	t1,a1
    685e:	4732                	lw	a4,12(sp)
    6860:	bf41                	j	67f0 <__lltostr+0x54>
    6862:	4792                	lw	a5,4(sp)
    6864:	953e                	add	a0,a0,a5
    6866:	b7cd                	j	6848 <__lltostr+0xac>

00006868 <printf>:
    6868:	fdc10113          	addi	sp,sp,-36
    686c:	c82e                	sw	a1,16(sp)
    686e:	080c                	addi	a1,sp,16
    6870:	c606                	sw	ra,12(sp)
    6872:	ca32                	sw	a2,20(sp)
    6874:	cc36                	sw	a3,24(sp)
    6876:	ce3a                	sw	a4,28(sp)
    6878:	d03e                	sw	a5,32(sp)
    687a:	c02e                	sw	a1,0(sp)
    687c:	2099                	jal	68c2 <vprintf>
    687e:	40b2                	lw	ra,12(sp)
    6880:	02410113          	addi	sp,sp,36
    6884:	8082                	ret

00006886 <putc>:
    6886:	e72fd06f          	j	3ef8 <fputc>

0000688a <__stdio_outs>:
    688a:	1151                	addi	sp,sp,-12
    688c:	c222                	sw	s0,4(sp)
    688e:	c026                	sw	s1,0(sp)
    6890:	842a                	mv	s0,a0
    6892:	84ae                	mv	s1,a1
    6894:	c406                	sw	ra,8(sp)
    6896:	94a2                	add	s1,s1,s0
    6898:	e9afd0ef          	jal	ra,3f32 <os_critical_enter>
    689c:	00941a63          	bne	s0,s1,68b0 <__stdio_outs+0x26>
    68a0:	e96fd0ef          	jal	ra,3f36 <os_critical_exit>
    68a4:	40a2                	lw	ra,8(sp)
    68a6:	4412                	lw	s0,4(sp)
    68a8:	4482                	lw	s1,0(sp)
    68aa:	4505                	li	a0,1
    68ac:	0131                	addi	sp,sp,12
    68ae:	8082                	ret
    68b0:	0001a703          	lw	a4,0(gp) # 200004e8 <_impure_ptr>
    68b4:	00044503          	lbu	a0,0(s0)
    68b8:	0405                	addi	s0,s0,1
    68ba:	470c                	lw	a1,8(a4)
    68bc:	e3cfd0ef          	jal	ra,3ef8 <fputc>
    68c0:	bff1                	j	689c <__stdio_outs+0x12>

000068c2 <vprintf>:
    68c2:	1131                	addi	sp,sp,-20
    68c4:	679d                	lui	a5,0x7
    68c6:	88a78793          	addi	a5,a5,-1910 # 688a <__stdio_outs>
    68ca:	862e                	mv	a2,a1
    68cc:	85aa                	mv	a1,a0
    68ce:	850a                	mv	a0,sp
    68d0:	c806                	sw	ra,16(sp)
    68d2:	c002                	sw	zero,0(sp)
    68d4:	c23e                	sw	a5,4(sp)
    68d6:	2299                	jal	6a1c <__v_printf>
    68d8:	40c2                	lw	ra,16(sp)
    68da:	0151                	addi	sp,sp,20
    68dc:	8082                	ret

000068de <__isnan>:
    68de:	fff80737          	lui	a4,0xfff80
    68e2:	177d                	addi	a4,a4,-1
    68e4:	8f6d                	and	a4,a4,a1
    68e6:	e509                	bnez	a0,68f0 <__isnan+0x12>
    68e8:	7ff007b7          	lui	a5,0x7ff00
    68ec:	00f70963          	beq	a4,a5,68fe <__isnan+0x20>
    68f0:	fff807b7          	lui	a5,0xfff80
    68f4:	8fad                	xor	a5,a5,a1
    68f6:	8fc9                	or	a5,a5,a0
    68f8:	0017b513          	seqz	a0,a5
    68fc:	8082                	ret
    68fe:	4505                	li	a0,1
    6900:	8082                	ret

00006902 <__ltostr>:
    6902:	1151                	addi	sp,sp,-12
    6904:	15fd                	addi	a1,a1,-1
    6906:	c406                	sw	ra,8(sp)
    6908:	c222                	sw	s0,4(sp)
    690a:	95aa                	add	a1,a1,a0
    690c:	00058023          	sb	zero,0(a1)
    6910:	fff68313          	addi	t1,a3,-1
    6914:	02300793          	li	a5,35
    6918:	0067f363          	bgeu	a5,t1,691e <__ltostr+0x1c>
    691c:	46a9                	li	a3,10
    691e:	4781                	li	a5,0
    6920:	e619                	bnez	a2,692e <__ltostr+0x2c>
    6922:	03000793          	li	a5,48
    6926:	fef58fa3          	sb	a5,-1(a1)
    692a:	15fd                	addi	a1,a1,-1
    692c:	4785                	li	a5,1
    692e:	02700313          	li	t1,39
    6932:	c311                	beqz	a4,6936 <__ltostr+0x34>
    6934:	431d                	li	t1,7
    6936:	0ff37713          	andi	a4,t1,255
    693a:	03900293          	li	t0,57
    693e:	00f58333          	add	t1,a1,a5
    6942:	40b30433          	sub	s0,t1,a1
    6946:	00b57363          	bgeu	a0,a1,694c <__ltostr+0x4a>
    694a:	ea11                	bnez	a2,695e <__ltostr+0x5c>
    694c:	00140613          	addi	a2,s0,1
    6950:	86ffb0ef          	jal	ra,21be <memmove>
    6954:	8522                	mv	a0,s0
    6956:	40a2                	lw	ra,8(sp)
    6958:	4412                	lw	s0,4(sp)
    695a:	0131                	addi	sp,sp,12
    695c:	8082                	ret
    695e:	02d677b3          	remu	a5,a2,a3
    6962:	15fd                	addi	a1,a1,-1
    6964:	03078793          	addi	a5,a5,48 # fff80030 <__heap_end+0xdff50030>
    6968:	0ff7f793          	andi	a5,a5,255
    696c:	00f2e763          	bltu	t0,a5,697a <__ltostr+0x78>
    6970:	00f58023          	sb	a5,0(a1)
    6974:	02d65633          	divu	a2,a2,a3
    6978:	b7e9                	j	6942 <__ltostr+0x40>
    697a:	97ba                	add	a5,a5,a4
    697c:	bfd5                	j	6970 <__ltostr+0x6e>

0000697e <putchar>:
    697e:	0001a783          	lw	a5,0(gp) # 200004e8 <_impure_ptr>
    6982:	1151                	addi	sp,sp,-12
    6984:	c406                	sw	ra,8(sp)
    6986:	478c                	lw	a1,8(a5)
    6988:	effff0ef          	jal	ra,6886 <putc>
    698c:	40a2                	lw	ra,8(sp)
    698e:	4501                	li	a0,0
    6990:	0131                	addi	sp,sp,12
    6992:	8082                	ret

00006994 <puts>:
    6994:	1151                	addi	sp,sp,-12
    6996:	c222                	sw	s0,4(sp)
    6998:	c406                	sw	ra,8(sp)
    699a:	842a                	mv	s0,a0
    699c:	00044503          	lbu	a0,0(s0)
    69a0:	55fd                	li	a1,-1
    69a2:	e909                	bnez	a0,69b4 <puts+0x20>
    69a4:	4529                	li	a0,10
    69a6:	d52fd0ef          	jal	ra,3ef8 <fputc>
    69aa:	40a2                	lw	ra,8(sp)
    69ac:	4412                	lw	s0,4(sp)
    69ae:	4501                	li	a0,0
    69b0:	0131                	addi	sp,sp,12
    69b2:	8082                	ret
    69b4:	d44fd0ef          	jal	ra,3ef8 <fputc>
    69b8:	0405                	addi	s0,s0,1
    69ba:	b7cd                	j	699c <puts+0x8>

000069bc <write_pad>:
    69bc:	1131                	addi	sp,sp,-20
    69be:	fd060613          	addi	a2,a2,-48
    69c2:	c426                	sw	s1,8(sp)
    69c4:	00163613          	seqz	a2,a2
    69c8:	64a1                	lui	s1,0x8
    69ca:	0612                	slli	a2,a2,0x4
    69cc:	14048493          	addi	s1,s1,320 # 8140 <pad_line>
    69d0:	c622                	sw	s0,12(sp)
    69d2:	c806                	sw	ra,16(sp)
    69d4:	87aa                	mv	a5,a0
    69d6:	872e                	mv	a4,a1
    69d8:	94b2                	add	s1,s1,a2
    69da:	842e                	mv	s0,a1
    69dc:	463d                	li	a2,15
    69de:	408706b3          	sub	a3,a4,s0
    69e2:	02864263          	blt	a2,s0,6a06 <write_pad+0x4a>
    69e6:	00805a63          	blez	s0,69fa <write_pad+0x3e>
    69ea:	43d8                	lw	a4,4(a5)
    69ec:	4390                	lw	a2,0(a5)
    69ee:	85a2                	mv	a1,s0
    69f0:	8526                	mv	a0,s1
    69f2:	c036                	sw	a3,0(sp)
    69f4:	9702                	jalr	a4
    69f6:	4682                	lw	a3,0(sp)
    69f8:	96a2                	add	a3,a3,s0
    69fa:	40c2                	lw	ra,16(sp)
    69fc:	4432                	lw	s0,12(sp)
    69fe:	44a2                	lw	s1,8(sp)
    6a00:	8536                	mv	a0,a3
    6a02:	0151                	addi	sp,sp,20
    6a04:	8082                	ret
    6a06:	43d4                	lw	a3,4(a5)
    6a08:	4390                	lw	a2,0(a5)
    6a0a:	45c1                	li	a1,16
    6a0c:	8526                	mv	a0,s1
    6a0e:	c23a                	sw	a4,4(sp)
    6a10:	c03e                	sw	a5,0(sp)
    6a12:	9682                	jalr	a3
    6a14:	1441                	addi	s0,s0,-16
    6a16:	4712                	lw	a4,4(sp)
    6a18:	4782                	lw	a5,0(sp)
    6a1a:	b7c9                	j	69dc <write_pad+0x20>

00006a1c <__v_printf>:
    6a1c:	00c1a783          	lw	a5,12(gp) # 200004f4 <errno>
    6a20:	f2810113          	addi	sp,sp,-216
    6a24:	c9a2                	sw	s0,208(sp)
    6a26:	c7a6                	sw	s1,204(sp)
    6a28:	cb86                	sw	ra,212(sp)
    6a2a:	84aa                	mv	s1,a0
    6a2c:	c82e                	sw	a1,16(sp)
    6a2e:	8432                	mv	s0,a2
    6a30:	d83e                	sw	a5,48(sp)
    6a32:	c202                	sw	zero,4(sp)
    6a34:	47c2                	lw	a5,16(sp)
    6a36:	0007c783          	lbu	a5,0(a5)
    6a3a:	68078063          	beqz	a5,70ba <__v_printf+0x69e>
    6a3e:	4701                	li	a4,0
    6a40:	02500613          	li	a2,37
    6a44:	a011                	j	6a48 <__v_printf+0x2c>
    6a46:	0705                	addi	a4,a4,1
    6a48:	47c2                	lw	a5,16(sp)
    6a4a:	97ba                	add	a5,a5,a4
    6a4c:	0007c683          	lbu	a3,0(a5)
    6a50:	74068863          	beqz	a3,71a0 <__v_printf+0x784>
    6a54:	fec699e3          	bne	a3,a2,6a46 <__v_printf+0x2a>
    6a58:	e319                	bnez	a4,6a5e <__v_printf+0x42>
    6a5a:	47c2                	lw	a5,16(sp)
    6a5c:	a01d                	j	6a82 <__v_printf+0x66>
    6a5e:	40d4                	lw	a3,4(s1)
    6a60:	4090                	lw	a2,0(s1)
    6a62:	4542                	lw	a0,16(sp)
    6a64:	85ba                	mv	a1,a4
    6a66:	c43e                	sw	a5,8(sp)
    6a68:	c03a                	sw	a4,0(sp)
    6a6a:	9682                	jalr	a3
    6a6c:	4792                	lw	a5,4(sp)
    6a6e:	4702                	lw	a4,0(sp)
    6a70:	97ba                	add	a5,a5,a4
    6a72:	c23e                	sw	a5,4(sp)
    6a74:	47a2                	lw	a5,8(sp)
    6a76:	02500713          	li	a4,37
    6a7a:	0007c683          	lbu	a3,0(a5)
    6a7e:	72e69463          	bne	a3,a4,71a6 <__v_printf+0x78a>
    6a82:	00178513          	addi	a0,a5,1
    6a86:	02000793          	li	a5,32
    6a8a:	c002                	sw	zero,0(sp)
    6a8c:	c602                	sw	zero,12(sp)
    6a8e:	4701                	li	a4,0
    6a90:	ca02                	sw	zero,20(sp)
    6a92:	ce02                	sw	zero,28(sp)
    6a94:	d602                	sw	zero,44(sp)
    6a96:	d002                	sw	zero,32(sp)
    6a98:	c402                	sw	zero,8(sp)
    6a9a:	cc3e                	sw	a5,24(sp)
    6a9c:	00054303          	lbu	t1,0(a0)
    6aa0:	00150793          	addi	a5,a0,1
    6aa4:	c83e                	sw	a5,16(sp)
    6aa6:	046103a3          	sb	t1,71(sp)
    6aaa:	06300793          	li	a5,99
    6aae:	1cf30963          	beq	t1,a5,6c80 <__v_printf+0x264>
    6ab2:	0c67e863          	bltu	a5,t1,6b82 <__v_printf+0x166>
    6ab6:	02d00793          	li	a5,45
    6aba:	02f30363          	beq	t1,a5,6ae0 <__v_printf+0xc4>
    6abe:	0667e263          	bltu	a5,t1,6b22 <__v_printf+0x106>
    6ac2:	02300793          	li	a5,35
    6ac6:	02f30163          	beq	t1,a5,6ae8 <__v_printf+0xcc>
    6aca:	0267e663          	bltu	a5,t1,6af6 <__v_printf+0xda>
    6ace:	5e030463          	beqz	t1,70b6 <__v_printf+0x69a>
    6ad2:	02000793          	li	a5,32
    6ad6:	f4f31fe3          	bne	t1,a5,6a34 <__v_printf+0x18>
    6ada:	4785                	li	a5,1
    6adc:	d63e                	sw	a5,44(sp)
    6ade:	a019                	j	6ae4 <__v_printf+0xc8>
    6ae0:	4785                	li	a5,1
    6ae2:	d03e                	sw	a5,32(sp)
    6ae4:	4542                	lw	a0,16(sp)
    6ae6:	bf5d                	j	6a9c <__v_printf+0x80>
    6ae8:	0ff00793          	li	a5,255
    6aec:	c43e                	sw	a5,8(sp)
    6aee:	bfdd                	j	6ae4 <__v_printf+0xc8>
    6af0:	4785                	li	a5,1
    6af2:	ce3e                	sw	a5,28(sp)
    6af4:	bfc5                	j	6ae4 <__v_printf+0xc8>
    6af6:	02a00793          	li	a5,42
    6afa:	16f30163          	beq	t1,a5,6c5c <__v_printf+0x240>
    6afe:	02b00793          	li	a5,43
    6b02:	fef307e3          	beq	t1,a5,6af0 <__v_printf+0xd4>
    6b06:	02500793          	li	a5,37
    6b0a:	f2f315e3          	bne	t1,a5,6a34 <__v_printf+0x18>
    6b0e:	40dc                	lw	a5,4(s1)
    6b10:	4090                	lw	a2,0(s1)
    6b12:	4585                	li	a1,1
    6b14:	04710513          	addi	a0,sp,71
    6b18:	9782                	jalr	a5
    6b1a:	4792                	lw	a5,4(sp)
    6b1c:	0785                	addi	a5,a5,1
    6b1e:	c23e                	sw	a5,4(sp)
    6b20:	bf11                	j	6a34 <__v_printf+0x18>
    6b22:	03900793          	li	a5,57
    6b26:	0267ee63          	bltu	a5,t1,6b62 <__v_printf+0x146>
    6b2a:	03000793          	li	a5,48
    6b2e:	0ef37f63          	bgeu	t1,a5,6c2c <__v_printf+0x210>
    6b32:	02e00793          	li	a5,46
    6b36:	eef31fe3          	bne	t1,a5,6a34 <__v_printf+0x18>
    6b3a:	00154683          	lbu	a3,1(a0)
    6b3e:	02a00793          	li	a5,42
    6b42:	12f69163          	bne	a3,a5,6c64 <__v_printf+0x248>
    6b46:	4014                	lw	a3,0(s0)
    6b48:	00440793          	addi	a5,s0,4
    6b4c:	c036                	sw	a3,0(sp)
    6b4e:	0006d363          	bgez	a3,6b54 <__v_printf+0x138>
    6b52:	c002                	sw	zero,0(sp)
    6b54:	00250693          	addi	a3,a0,2
    6b58:	c836                	sw	a3,16(sp)
    6b5a:	843e                	mv	s0,a5
    6b5c:	4785                	li	a5,1
    6b5e:	ca3e                	sw	a5,20(sp)
    6b60:	b751                	j	6ae4 <__v_printf+0xc8>
    6b62:	05800793          	li	a5,88
    6b66:	2af30263          	beq	t1,a5,6e0a <__v_printf+0x3ee>
    6b6a:	06200793          	li	a5,98
    6b6e:	36f30363          	beq	t1,a5,6ed4 <__v_printf+0x4b8>
    6b72:	04c00793          	li	a5,76
    6b76:	eaf31fe3          	bne	t1,a5,6a34 <__v_printf+0x18>
    6b7a:	0705                	addi	a4,a4,1
    6b7c:	0762                	slli	a4,a4,0x18
    6b7e:	8761                	srai	a4,a4,0x18
    6b80:	a091                	j	6bc4 <__v_printf+0x1a8>
    6b82:	06d00793          	li	a5,109
    6b86:	10f30263          	beq	t1,a5,6c8a <__v_printf+0x26e>
    6b8a:	0267ef63          	bltu	a5,t1,6bc8 <__v_printf+0x1ac>
    6b8e:	06700793          	li	a5,103
    6b92:	0067ef63          	bltu	a5,t1,6bb0 <__v_printf+0x194>
    6b96:	06600793          	li	a5,102
    6b9a:	3ef37263          	bgeu	t1,a5,6f7e <__v_printf+0x562>
    6b9e:	06400793          	li	a5,100
    6ba2:	e8f319e3          	bne	t1,a5,6a34 <__v_printf+0x18>
    6ba6:	4529                	li	a0,10
    6ba8:	4781                	li	a5,0
    6baa:	4285                	li	t0,1
    6bac:	4301                	li	t1,0
    6bae:	ac49                	j	6e40 <__v_printf+0x424>
    6bb0:	06900793          	li	a5,105
    6bb4:	fef309e3          	beq	t1,a5,6ba6 <__v_printf+0x18a>
    6bb8:	06f36663          	bltu	t1,a5,6c24 <__v_printf+0x208>
    6bbc:	06c00793          	li	a5,108
    6bc0:	e6f31ae3          	bne	t1,a5,6a34 <__v_printf+0x18>
    6bc4:	0705                	addi	a4,a4,1
    6bc6:	a085                	j	6c26 <__v_printf+0x20a>
    6bc8:	07300793          	li	a5,115
    6bcc:	0ef30163          	beq	t1,a5,6cae <__v_printf+0x292>
    6bd0:	0267ec63          	bltu	a5,t1,6c08 <__v_printf+0x1ec>
    6bd4:	07000793          	li	a5,112
    6bd8:	22f30263          	beq	t1,a5,6dfc <__v_printf+0x3e0>
    6bdc:	07100793          	li	a5,113
    6be0:	f8f30de3          	beq	t1,a5,6b7a <__v_printf+0x15e>
    6be4:	06f00793          	li	a5,111
    6be8:	e4f316e3          	bne	t1,a5,6a34 <__v_printf+0x18>
    6bec:	47a2                	lw	a5,8(sp)
    6bee:	2e078763          	beqz	a5,6edc <__v_printf+0x4c0>
    6bf2:	03000793          	li	a5,48
    6bf6:	04f106a3          	sb	a5,77(sp)
    6bfa:	4785                	li	a5,1
    6bfc:	c43e                	sw	a5,8(sp)
    6bfe:	4521                	li	a0,8
    6c00:	4781                	li	a5,0
    6c02:	4281                	li	t0,0
    6c04:	4305                	li	t1,1
    6c06:	ac2d                	j	6e40 <__v_printf+0x424>
    6c08:	07800793          	li	a5,120
    6c0c:	2cf30263          	beq	t1,a5,6ed0 <__v_printf+0x4b4>
    6c10:	07a00793          	li	a5,122
    6c14:	ecf308e3          	beq	t1,a5,6ae4 <__v_printf+0xc8>
    6c18:	07500793          	li	a5,117
    6c1c:	e0f31ce3          	bne	t1,a5,6a34 <__v_printf+0x18>
    6c20:	4529                	li	a0,10
    6c22:	ac55                	j	6ed6 <__v_printf+0x4ba>
    6c24:	177d                	addi	a4,a4,-1
    6c26:	0762                	slli	a4,a4,0x18
    6c28:	8761                	srai	a4,a4,0x18
    6c2a:	bd6d                	j	6ae4 <__v_printf+0xc8>
    6c2c:	47d2                	lw	a5,20(sp)
    6c2e:	c83a                	sw	a4,16(sp)
    6c30:	48079363          	bnez	a5,70b6 <__v_printf+0x69a>
    6c34:	4629                	li	a2,10
    6c36:	00ac                	addi	a1,sp,72
    6c38:	fe7fb0ef          	jal	ra,2c1e <strtoul>
    6c3c:	04714683          	lbu	a3,71(sp)
    6c40:	c62a                	sw	a0,12(sp)
    6c42:	03000793          	li	a5,48
    6c46:	4742                	lw	a4,16(sp)
    6c48:	00f69763          	bne	a3,a5,6c56 <__v_printf+0x23a>
    6c4c:	5782                	lw	a5,32(sp)
    6c4e:	e781                	bnez	a5,6c56 <__v_printf+0x23a>
    6c50:	03000793          	li	a5,48
    6c54:	cc3e                	sw	a5,24(sp)
    6c56:	47a6                	lw	a5,72(sp)
    6c58:	c83e                	sw	a5,16(sp)
    6c5a:	b569                	j	6ae4 <__v_printf+0xc8>
    6c5c:	401c                	lw	a5,0(s0)
    6c5e:	0411                	addi	s0,s0,4
    6c60:	c63e                	sw	a5,12(sp)
    6c62:	b549                	j	6ae4 <__v_printf+0xc8>
    6c64:	4542                	lw	a0,16(sp)
    6c66:	4629                	li	a2,10
    6c68:	00ac                	addi	a1,sp,72
    6c6a:	ca3a                	sw	a4,20(sp)
    6c6c:	df9fb0ef          	jal	ra,2a64 <strtol>
    6c70:	c02a                	sw	a0,0(sp)
    6c72:	4752                	lw	a4,20(sp)
    6c74:	00055363          	bgez	a0,6c7a <__v_printf+0x25e>
    6c78:	c002                	sw	zero,0(sp)
    6c7a:	47a6                	lw	a5,72(sp)
    6c7c:	c83e                	sw	a5,16(sp)
    6c7e:	bdf9                	j	6b5c <__v_printf+0x140>
    6c80:	401c                	lw	a5,0(s0)
    6c82:	0411                	addi	s0,s0,4
    6c84:	04f103a3          	sb	a5,71(sp)
    6c88:	b559                	j	6b0e <__v_printf+0xf2>
    6c8a:	5542                	lw	a0,48(sp)
    6c8c:	ba7fb0ef          	jal	ra,2832 <strerror>
    6c90:	c4aa                	sw	a0,72(sp)
    6c92:	c42a                	sw	a0,8(sp)
    6c94:	bb9fb0ef          	jal	ra,284c <strlen>
    6c98:	4722                	lw	a4,8(sp)
    6c9a:	40d4                	lw	a3,4(s1)
    6c9c:	4090                	lw	a2,0(s1)
    6c9e:	85aa                	mv	a1,a0
    6ca0:	c02a                	sw	a0,0(sp)
    6ca2:	853a                	mv	a0,a4
    6ca4:	9682                	jalr	a3
    6ca6:	4712                	lw	a4,4(sp)
    6ca8:	4782                	lw	a5,0(sp)
    6caa:	97ba                	add	a5,a5,a4
    6cac:	bd8d                	j	6b1e <__v_printf+0x102>
    6cae:	4018                	lw	a4,0(s0)
    6cb0:	00440793          	addi	a5,s0,4
    6cb4:	c721                	beqz	a4,6cfc <__v_printf+0x2e0>
    6cb6:	c4ba                	sw	a4,72(sp)
    6cb8:	4526                	lw	a0,72(sp)
    6cba:	cc3e                	sw	a5,24(sp)
    6cbc:	b91fb0ef          	jal	ra,284c <strlen>
    6cc0:	4752                	lw	a4,20(sp)
    6cc2:	832a                	mv	t1,a0
    6cc4:	47e2                	lw	a5,24(sp)
    6cc6:	cf1d                	beqz	a4,6d04 <__v_printf+0x2e8>
    6cc8:	4702                	lw	a4,0(sp)
    6cca:	00a77363          	bgeu	a4,a0,6cd0 <__v_printf+0x2b4>
    6cce:	833a                	mv	t1,a4
    6cd0:	843e                	mv	s0,a5
    6cd2:	c002                	sw	zero,0(sp)
    6cd4:	ca02                	sw	zero,20(sp)
    6cd6:	4281                	li	t0,0
    6cd8:	02000793          	li	a5,32
    6cdc:	cc3e                	sw	a5,24(sp)
    6cde:	47b2                	lw	a5,12(sp)
    6ce0:	4702                	lw	a4,0(sp)
    6ce2:	46a6                	lw	a3,72(sp)
    6ce4:	8fd9                	or	a5,a5,a4
    6ce6:	e39d                	bnez	a5,6d0c <__v_printf+0x2f0>
    6ce8:	40dc                	lw	a5,4(s1)
    6cea:	4090                	lw	a2,0(s1)
    6cec:	859a                	mv	a1,t1
    6cee:	8536                	mv	a0,a3
    6cf0:	c01a                	sw	t1,0(sp)
    6cf2:	9782                	jalr	a5
    6cf4:	4792                	lw	a5,4(sp)
    6cf6:	4302                	lw	t1,0(sp)
    6cf8:	979a                	add	a5,a5,t1
    6cfa:	b515                	j	6b1e <__v_printf+0x102>
    6cfc:	6721                	lui	a4,0x8
    6cfe:	13870713          	addi	a4,a4,312 # 8138 <asc2_1608+0x64c>
    6d02:	bf55                	j	6cb6 <__v_printf+0x29a>
    6d04:	843e                	mv	s0,a5
    6d06:	4281                	li	t0,0
    6d08:	c002                	sw	zero,0(sp)
    6d0a:	b7f9                	j	6cd8 <__v_printf+0x2bc>
    6d0c:	44029163          	bnez	t0,714e <__v_printf+0x732>
    6d10:	47a2                	lw	a5,8(sp)
    6d12:	3a078b63          	beqz	a5,70c8 <__v_printf+0x6ac>
    6d16:	47a2                	lw	a5,8(sp)
    6d18:	00f68733          	add	a4,a3,a5
    6d1c:	c4ba                	sw	a4,72(sp)
    6d1e:	4732                	lw	a4,12(sp)
    6d20:	40f30333          	sub	t1,t1,a5
    6d24:	8f1d                	sub	a4,a4,a5
    6d26:	c63a                	sw	a4,12(sp)
    6d28:	5702                	lw	a4,32(sp)
    6d2a:	3a070363          	beqz	a4,70d0 <__v_printf+0x6b4>
    6d2e:	40d8                	lw	a4,4(s1)
    6d30:	4090                	lw	a2,0(s1)
    6d32:	85be                	mv	a1,a5
    6d34:	8536                	mv	a0,a3
    6d36:	ca1a                	sw	t1,20(sp)
    6d38:	c43e                	sw	a5,8(sp)
    6d3a:	9702                	jalr	a4
    6d3c:	4712                	lw	a4,4(sp)
    6d3e:	47a2                	lw	a5,8(sp)
    6d40:	4352                	lw	t1,20(sp)
    6d42:	97ba                	add	a5,a5,a4
    6d44:	c23e                	sw	a5,4(sp)
    6d46:	4782                	lw	a5,0(sp)
    6d48:	03000613          	li	a2,48
    6d4c:	8526                	mv	a0,s1
    6d4e:	406785b3          	sub	a1,a5,t1
    6d52:	ca1a                	sw	t1,20(sp)
    6d54:	c69ff0ef          	jal	ra,69bc <write_pad>
    6d58:	4792                	lw	a5,4(sp)
    6d5a:	4352                	lw	t1,20(sp)
    6d5c:	40d8                	lw	a4,4(s1)
    6d5e:	97aa                	add	a5,a5,a0
    6d60:	4090                	lw	a2,0(s1)
    6d62:	4526                	lw	a0,72(sp)
    6d64:	859a                	mv	a1,t1
    6d66:	c43e                	sw	a5,8(sp)
    6d68:	c21a                	sw	t1,4(sp)
    6d6a:	9702                	jalr	a4
    6d6c:	4312                	lw	t1,4(sp)
    6d6e:	47a2                	lw	a5,8(sp)
    6d70:	4582                	lw	a1,0(sp)
    6d72:	979a                	add	a5,a5,t1
    6d74:	0065f363          	bgeu	a1,t1,6d7a <__v_printf+0x35e>
    6d78:	859a                	mv	a1,t1
    6d7a:	c03e                	sw	a5,0(sp)
    6d7c:	47b2                	lw	a5,12(sp)
    6d7e:	02000613          	li	a2,32
    6d82:	8526                	mv	a0,s1
    6d84:	40b785b3          	sub	a1,a5,a1
    6d88:	c35ff0ef          	jal	ra,69bc <write_pad>
    6d8c:	4782                	lw	a5,0(sp)
    6d8e:	97aa                	add	a5,a5,a0
    6d90:	b379                	j	6b1e <__v_printf+0x102>
    6d92:	c78d                	beqz	a5,6dbc <__v_printf+0x3a0>
    6d94:	4662                	lw	a2,24(sp)
    6d96:	03000713          	li	a4,48
    6d9a:	02e61163          	bne	a2,a4,6dbc <__v_printf+0x3a0>
    6d9e:	40d8                	lw	a4,4(s1)
    6da0:	4090                	lw	a2,0(s1)
    6da2:	85be                	mv	a1,a5
    6da4:	8536                	mv	a0,a3
    6da6:	ca1a                	sw	t1,20(sp)
    6da8:	c43e                	sw	a5,8(sp)
    6daa:	c036                	sw	a3,0(sp)
    6dac:	9702                	jalr	a4
    6dae:	4712                	lw	a4,4(sp)
    6db0:	47a2                	lw	a5,8(sp)
    6db2:	4352                	lw	t1,20(sp)
    6db4:	4682                	lw	a3,0(sp)
    6db6:	97ba                	add	a5,a5,a4
    6db8:	c23e                	sw	a5,4(sp)
    6dba:	4781                	li	a5,0
    6dbc:	c43e                	sw	a5,8(sp)
    6dbe:	47b2                	lw	a5,12(sp)
    6dc0:	4662                	lw	a2,24(sp)
    6dc2:	8526                	mv	a0,s1
    6dc4:	406785b3          	sub	a1,a5,t1
    6dc8:	c01a                	sw	t1,0(sp)
    6dca:	ca36                	sw	a3,20(sp)
    6dcc:	bf1ff0ef          	jal	ra,69bc <write_pad>
    6dd0:	4792                	lw	a5,4(sp)
    6dd2:	4302                	lw	t1,0(sp)
    6dd4:	00a78733          	add	a4,a5,a0
    6dd8:	47a2                	lw	a5,8(sp)
    6dda:	34078e63          	beqz	a5,7136 <__v_printf+0x71a>
    6dde:	46d2                	lw	a3,20(sp)
    6de0:	0044a383          	lw	t2,4(s1)
    6de4:	4090                	lw	a2,0(s1)
    6de6:	85be                	mv	a1,a5
    6de8:	8536                	mv	a0,a3
    6dea:	c41a                	sw	t1,8(sp)
    6dec:	c23a                	sw	a4,4(sp)
    6dee:	c03e                	sw	a5,0(sp)
    6df0:	9382                	jalr	t2
    6df2:	4782                	lw	a5,0(sp)
    6df4:	4712                	lw	a4,4(sp)
    6df6:	4322                	lw	t1,8(sp)
    6df8:	973e                	add	a4,a4,a5
    6dfa:	ae35                	j	7136 <__v_printf+0x71a>
    6dfc:	07800793          	li	a5,120
    6e00:	04f103a3          	sb	a5,71(sp)
    6e04:	4789                	li	a5,2
    6e06:	4705                	li	a4,1
    6e08:	c43e                	sw	a5,8(sp)
    6e0a:	04714783          	lbu	a5,71(sp)
    6e0e:	fa878793          	addi	a5,a5,-88
    6e12:	0017b793          	seqz	a5,a5
    6e16:	46a2                	lw	a3,8(sp)
    6e18:	4301                	li	t1,0
    6e1a:	ce81                	beqz	a3,6e32 <__v_printf+0x416>
    6e1c:	03000693          	li	a3,48
    6e20:	04d106a3          	sb	a3,77(sp)
    6e24:	04714683          	lbu	a3,71(sp)
    6e28:	4309                	li	t1,2
    6e2a:	04d10723          	sb	a3,78(sp)
    6e2e:	4689                	li	a3,2
    6e30:	c436                	sw	a3,8(sp)
    6e32:	46b2                	lw	a3,12(sp)
    6e34:	4602                	lw	a2,0(sp)
    6e36:	00c6f363          	bgeu	a3,a2,6e3c <__v_printf+0x420>
    6e3a:	c632                	sw	a2,12(sp)
    6e3c:	4541                	li	a0,16
    6e3e:	4281                	li	t0,0
    6e40:	04d10693          	addi	a3,sp,77
    6e44:	c4b6                	sw	a3,72(sp)
    6e46:	0ae05a63          	blez	a4,6efa <__v_printf+0x4de>
    6e4a:	4685                	li	a3,1
    6e4c:	08d70c63          	beq	a4,a3,6ee4 <__v_printf+0x4c8>
    6e50:	00840393          	addi	t2,s0,8
    6e54:	4010                	lw	a2,0(s0)
    6e56:	4054                	lw	a3,4(s0)
    6e58:	4581                	li	a1,0
    6e5a:	08028c63          	beqz	t0,6ef2 <__v_printf+0x4d6>
    6e5e:	0006da63          	bgez	a3,6e72 <__v_printf+0x456>
    6e62:	40c00633          	neg	a2,a2
    6e66:	00c03733          	snez	a4,a2
    6e6a:	40d006b3          	neg	a3,a3
    6e6e:	8e99                	sub	a3,a3,a4
    6e70:	4289                	li	t0,2
    6e72:	872a                	mv	a4,a0
    6e74:	04d10513          	addi	a0,sp,77
    6e78:	951a                	add	a0,a0,t1
    6e7a:	07b00593          	li	a1,123
    6e7e:	da1e                	sw	t2,52(sp)
    6e80:	d416                	sw	t0,40(sp)
    6e82:	d21a                	sw	t1,36(sp)
    6e84:	919ff0ef          	jal	ra,679c <__lltostr>
    6e88:	53d2                	lw	t2,52(sp)
    6e8a:	5312                	lw	t1,36(sp)
    6e8c:	52a2                	lw	t0,40(sp)
    6e8e:	841e                	mv	s0,t2
    6e90:	4752                	lw	a4,20(sp)
    6e92:	47a6                	lw	a5,72(sp)
    6e94:	cb5d                	beqz	a4,6f4a <__v_printf+0x52e>
    6e96:	4705                	li	a4,1
    6e98:	0ae51963          	bne	a0,a4,6f4a <__v_printf+0x52e>
    6e9c:	00678733          	add	a4,a5,t1
    6ea0:	00074683          	lbu	a3,0(a4)
    6ea4:	03000713          	li	a4,48
    6ea8:	0ae69163          	bne	a3,a4,6f4a <__v_printf+0x52e>
    6eac:	4702                	lw	a4,0(sp)
    6eae:	c345                	beqz	a4,6f4e <__v_printf+0x532>
    6eb0:	4722                	lw	a4,8(sp)
    6eb2:	c319                	beqz	a4,6eb8 <__v_printf+0x49c>
    6eb4:	c402                	sw	zero,8(sp)
    6eb6:	4301                	li	t1,0
    6eb8:	4709                	li	a4,2
    6eba:	08e29d63          	bne	t0,a4,6f54 <__v_printf+0x538>
    6ebe:	fff78713          	addi	a4,a5,-1
    6ec2:	c4ba                	sw	a4,72(sp)
    6ec4:	02d00713          	li	a4,45
    6ec8:	fee78fa3          	sb	a4,-1(a5)
    6ecc:	0305                	addi	t1,t1,1
    6ece:	bd01                	j	6cde <__v_printf+0x2c2>
    6ed0:	4781                	li	a5,0
    6ed2:	b791                	j	6e16 <__v_printf+0x3fa>
    6ed4:	4509                	li	a0,2
    6ed6:	4781                	li	a5,0
    6ed8:	4281                	li	t0,0
    6eda:	b9c9                	j	6bac <__v_printf+0x190>
    6edc:	4781                	li	a5,0
    6ede:	4281                	li	t0,0
    6ee0:	4521                	li	a0,8
    6ee2:	b1e9                	j	6bac <__v_printf+0x190>
    6ee4:	00440393          	addi	t2,s0,4
    6ee8:	400c                	lw	a1,0(s0)
    6eea:	00029d63          	bnez	t0,6f04 <__v_printf+0x4e8>
    6eee:	4601                	li	a2,0
    6ef0:	4681                	li	a3,0
    6ef2:	4405                	li	s0,1
    6ef4:	f6e44fe3          	blt	s0,a4,6e72 <__v_printf+0x456>
    6ef8:	a01d                	j	6f1e <__v_printf+0x502>
    6efa:	00440393          	addi	t2,s0,4
    6efe:	400c                	lw	a1,0(s0)
    6f00:	00028863          	beqz	t0,6f10 <__v_printf+0x4f4>
    6f04:	4285                	li	t0,1
    6f06:	0005d563          	bgez	a1,6f10 <__v_printf+0x4f4>
    6f0a:	40b005b3          	neg	a1,a1
    6f0e:	4289                	li	t0,2
    6f10:	fc075fe3          	bgez	a4,6eee <__v_printf+0x4d2>
    6f14:	56fd                	li	a3,-1
    6f16:	02d70763          	beq	a4,a3,6f44 <__v_printf+0x528>
    6f1a:	0ff5f593          	andi	a1,a1,255
    6f1e:	873e                	mv	a4,a5
    6f20:	04d10793          	addi	a5,sp,77
    6f24:	86aa                	mv	a3,a0
    6f26:	862e                	mv	a2,a1
    6f28:	00678533          	add	a0,a5,t1
    6f2c:	07b00593          	li	a1,123
    6f30:	da1e                	sw	t2,52(sp)
    6f32:	d416                	sw	t0,40(sp)
    6f34:	d21a                	sw	t1,36(sp)
    6f36:	9cdff0ef          	jal	ra,6902 <__ltostr>
    6f3a:	53d2                	lw	t2,52(sp)
    6f3c:	52a2                	lw	t0,40(sp)
    6f3e:	5312                	lw	t1,36(sp)
    6f40:	841e                	mv	s0,t2
    6f42:	b7b9                	j	6e90 <__v_printf+0x474>
    6f44:	05c2                	slli	a1,a1,0x10
    6f46:	81c1                	srli	a1,a1,0x10
    6f48:	bfd9                	j	6f1e <__v_printf+0x502>
    6f4a:	932a                	add	t1,t1,a0
    6f4c:	b7b5                	j	6eb8 <__v_printf+0x49c>
    6f4e:	4301                	li	t1,0
    6f50:	c402                	sw	zero,8(sp)
    6f52:	b79d                	j	6eb8 <__v_printf+0x49c>
    6f54:	d80285e3          	beqz	t0,6cde <__v_printf+0x2c2>
    6f58:	4772                	lw	a4,28(sp)
    6f5a:	ef19                	bnez	a4,6f78 <__v_printf+0x55c>
    6f5c:	5732                	lw	a4,44(sp)
    6f5e:	4281                	li	t0,0
    6f60:	d6070fe3          	beqz	a4,6cde <__v_printf+0x2c2>
    6f64:	02000713          	li	a4,32
    6f68:	fff78693          	addi	a3,a5,-1
    6f6c:	c4b6                	sw	a3,72(sp)
    6f6e:	fee78fa3          	sb	a4,-1(a5)
    6f72:	0305                	addi	t1,t1,1
    6f74:	4285                	li	t0,1
    6f76:	b3a5                	j	6cde <__v_printf+0x2c2>
    6f78:	02b00713          	li	a4,43
    6f7c:	b7f5                	j	6f68 <__v_printf+0x54c>
    6f7e:	00840793          	addi	a5,s0,8
    6f82:	da3e                	sw	a5,52(sp)
    6f84:	401c                	lw	a5,0(s0)
    6f86:	d23e                	sw	a5,36(sp)
    6f88:	405c                	lw	a5,4(s0)
    6f8a:	d43e                	sw	a5,40(sp)
    6f8c:	04d10793          	addi	a5,sp,77
    6f90:	c4be                	sw	a5,72(sp)
    6f92:	47b2                	lw	a5,12(sp)
    6f94:	e399                	bnez	a5,6f9a <__v_printf+0x57e>
    6f96:	4785                	li	a5,1
    6f98:	c63e                	sw	a5,12(sp)
    6f9a:	47d2                	lw	a5,20(sp)
    6f9c:	e399                	bnez	a5,6fa2 <__v_printf+0x586>
    6f9e:	4799                	li	a5,6
    6fa0:	c03e                	sw	a5,0(sp)
    6fa2:	42f2                	lw	t0,28(sp)
    6fa4:	00029e63          	bnez	t0,6fc0 <__v_printf+0x5a4>
    6fa8:	5712                	lw	a4,36(sp)
    6faa:	57a2                	lw	a5,40(sp)
    6fac:	4601                	li	a2,0
    6fae:	4681                	li	a3,0
    6fb0:	853a                	mv	a0,a4
    6fb2:	85be                	mv	a1,a5
    6fb4:	dc1a                	sw	t1,56(sp)
    6fb6:	db8fa0ef          	jal	ra,156e <__ledf2>
    6fba:	5362                	lw	t1,56(sp)
    6fbc:	01f55293          	srli	t0,a0,0x1f
    6fc0:	5412                	lw	s0,36(sp)
    6fc2:	53a2                	lw	t2,40(sp)
    6fc4:	4782                	lw	a5,0(sp)
    6fc6:	4732                	lw	a4,12(sp)
    6fc8:	07f00693          	li	a3,127
    6fcc:	04d10613          	addi	a2,sp,77
    6fd0:	8522                	mv	a0,s0
    6fd2:	859e                	mv	a1,t2
    6fd4:	c096                	sw	t0,64(sp)
    6fd6:	dc1a                	sw	t1,56(sp)
    6fd8:	b98ff0ef          	jal	ra,6370 <__dtostr>
    6fdc:	47d2                	lw	a5,20(sp)
    6fde:	de2a                	sw	a0,60(sp)
    6fe0:	5362                	lw	t1,56(sp)
    6fe2:	4286                	lw	t0,64(sp)
    6fe4:	cb95                	beqz	a5,7018 <__v_printf+0x5fc>
    6fe6:	4426                	lw	s0,72(sp)
    6fe8:	02e00593          	li	a1,46
    6fec:	dc16                	sw	t0,56(sp)
    6fee:	8522                	mv	a0,s0
    6ff0:	ca1a                	sw	t1,20(sp)
    6ff2:	b68fb0ef          	jal	ra,235a <strchr>
    6ff6:	4352                	lw	t1,20(sp)
    6ff8:	52e2                	lw	t0,56(sp)
    6ffa:	57f2                	lw	a5,60(sp)
    6ffc:	cd49                	beqz	a0,7096 <__v_printf+0x67a>
    6ffe:	4782                	lw	a5,0(sp)
    7000:	e399                	bnez	a5,7006 <__v_printf+0x5ea>
    7002:	47a2                	lw	a5,8(sp)
    7004:	cb81                	beqz	a5,7014 <__v_printf+0x5f8>
    7006:	0505                	addi	a0,a0,1
    7008:	4782                	lw	a5,0(sp)
    700a:	c789                	beqz	a5,7014 <__v_printf+0x5f8>
    700c:	0505                	addi	a0,a0,1
    700e:	00054783          	lbu	a5,0(a0)
    7012:	efb5                	bnez	a5,708e <__v_printf+0x672>
    7014:	00050023          	sb	zero,0(a0)
    7018:	06700793          	li	a5,103
    701c:	04f31a63          	bne	t1,a5,7070 <__v_printf+0x654>
    7020:	4526                	lw	a0,72(sp)
    7022:	02e00593          	li	a1,46
    7026:	c416                	sw	t0,8(sp)
    7028:	b32fb0ef          	jal	ra,235a <strchr>
    702c:	842a                	mv	s0,a0
    702e:	42a2                	lw	t0,8(sp)
    7030:	c121                	beqz	a0,7070 <__v_printf+0x654>
    7032:	06500593          	li	a1,101
    7036:	b24fb0ef          	jal	ra,235a <strchr>
    703a:	42a2                	lw	t0,8(sp)
    703c:	85aa                	mv	a1,a0
    703e:	00044783          	lbu	a5,0(s0)
    7042:	e7b5                	bnez	a5,70ae <__v_printf+0x692>
    7044:	c191                	beqz	a1,7048 <__v_printf+0x62c>
    7046:	842e                	mv	s0,a1
    7048:	03000693          	li	a3,48
    704c:	fff44703          	lbu	a4,-1(s0)
    7050:	fff40513          	addi	a0,s0,-1
    7054:	04d70f63          	beq	a4,a3,70b2 <__v_printf+0x696>
    7058:	02e00693          	li	a3,46
    705c:	00d70363          	beq	a4,a3,7062 <__v_printf+0x646>
    7060:	8522                	mv	a0,s0
    7062:	00050023          	sb	zero,0(a0)
    7066:	c589                	beqz	a1,7070 <__v_printf+0x654>
    7068:	c416                	sw	t0,8(sp)
    706a:	be6fb0ef          	jal	ra,2450 <strcpy>
    706e:	42a2                	lw	t0,8(sp)
    7070:	47f2                	lw	a5,28(sp)
    7072:	10079263          	bnez	a5,7176 <__v_printf+0x75a>
    7076:	57b2                	lw	a5,44(sp)
    7078:	e3e5                	bnez	a5,7158 <__v_printf+0x73c>
    707a:	4526                	lw	a0,72(sp)
    707c:	ce16                	sw	t0,28(sp)
    707e:	fcefb0ef          	jal	ra,284c <strlen>
    7082:	832a                	mv	t1,a0
    7084:	5452                	lw	s0,52(sp)
    7086:	ca02                	sw	zero,20(sp)
    7088:	c402                	sw	zero,8(sp)
    708a:	42f2                	lw	t0,28(sp)
    708c:	b989                	j	6cde <__v_printf+0x2c2>
    708e:	4782                	lw	a5,0(sp)
    7090:	17fd                	addi	a5,a5,-1
    7092:	c03e                	sw	a5,0(sp)
    7094:	bf95                	j	7008 <__v_printf+0x5ec>
    7096:	4722                	lw	a4,8(sp)
    7098:	d341                	beqz	a4,7018 <__v_printf+0x5fc>
    709a:	943e                	add	s0,s0,a5
    709c:	02e00713          	li	a4,46
    70a0:	00e40023          	sb	a4,0(s0)
    70a4:	4526                	lw	a0,72(sp)
    70a6:	953e                	add	a0,a0,a5
    70a8:	000500a3          	sb	zero,1(a0)
    70ac:	b7b5                	j	7018 <__v_printf+0x5fc>
    70ae:	0405                	addi	s0,s0,1
    70b0:	b779                	j	703e <__v_printf+0x622>
    70b2:	842a                	mv	s0,a0
    70b4:	bf61                	j	704c <__v_printf+0x630>
    70b6:	57fd                	li	a5,-1
    70b8:	c23e                	sw	a5,4(sp)
    70ba:	40de                	lw	ra,212(sp)
    70bc:	444e                	lw	s0,208(sp)
    70be:	4512                	lw	a0,4(sp)
    70c0:	44be                	lw	s1,204(sp)
    70c2:	0d810113          	addi	sp,sp,216
    70c6:	8082                	ret
    70c8:	5782                	lw	a5,32(sp)
    70ca:	c6079ee3          	bnez	a5,6d46 <__v_printf+0x32a>
    70ce:	4781                	li	a5,0
    70d0:	4752                	lw	a4,20(sp)
    70d2:	cc0700e3          	beqz	a4,6d92 <__v_printf+0x376>
    70d6:	4582                	lw	a1,0(sp)
    70d8:	0065f363          	bgeu	a1,t1,70de <__v_printf+0x6c2>
    70dc:	859a                	mv	a1,t1
    70de:	ca3e                	sw	a5,20(sp)
    70e0:	47b2                	lw	a5,12(sp)
    70e2:	02000613          	li	a2,32
    70e6:	8526                	mv	a0,s1
    70e8:	40b785b3          	sub	a1,a5,a1
    70ec:	c41a                	sw	t1,8(sp)
    70ee:	cc36                	sw	a3,24(sp)
    70f0:	8cdff0ef          	jal	ra,69bc <write_pad>
    70f4:	4792                	lw	a5,4(sp)
    70f6:	4322                	lw	t1,8(sp)
    70f8:	00f50733          	add	a4,a0,a5
    70fc:	47d2                	lw	a5,20(sp)
    70fe:	cf99                	beqz	a5,711c <__v_printf+0x700>
    7100:	46e2                	lw	a3,24(sp)
    7102:	0044a383          	lw	t2,4(s1)
    7106:	4090                	lw	a2,0(s1)
    7108:	85be                	mv	a1,a5
    710a:	8536                	mv	a0,a3
    710c:	c61a                	sw	t1,12(sp)
    710e:	c43a                	sw	a4,8(sp)
    7110:	c23e                	sw	a5,4(sp)
    7112:	9382                	jalr	t2
    7114:	4792                	lw	a5,4(sp)
    7116:	4722                	lw	a4,8(sp)
    7118:	4332                	lw	t1,12(sp)
    711a:	973e                	add	a4,a4,a5
    711c:	4782                	lw	a5,0(sp)
    711e:	03000613          	li	a2,48
    7122:	8526                	mv	a0,s1
    7124:	406785b3          	sub	a1,a5,t1
    7128:	c23a                	sw	a4,4(sp)
    712a:	c01a                	sw	t1,0(sp)
    712c:	891ff0ef          	jal	ra,69bc <write_pad>
    7130:	4712                	lw	a4,4(sp)
    7132:	4302                	lw	t1,0(sp)
    7134:	972a                	add	a4,a4,a0
    7136:	40dc                	lw	a5,4(s1)
    7138:	4090                	lw	a2,0(s1)
    713a:	4526                	lw	a0,72(sp)
    713c:	859a                	mv	a1,t1
    713e:	c23a                	sw	a4,4(sp)
    7140:	c01a                	sw	t1,0(sp)
    7142:	9782                	jalr	a5
    7144:	4302                	lw	t1,0(sp)
    7146:	4712                	lw	a4,4(sp)
    7148:	006707b3          	add	a5,a4,t1
    714c:	bac9                	j	6b1e <__v_printf+0x102>
    714e:	47a2                	lw	a5,8(sp)
    7150:	bc0793e3          	bnez	a5,6d16 <__v_printf+0x2fa>
    7154:	4785                	li	a5,1
    7156:	b6c9                	j	6d18 <__v_printf+0x2fc>
    7158:	57a2                	lw	a5,40(sp)
    715a:	5712                	lw	a4,36(sp)
    715c:	4601                	li	a2,0
    715e:	85be                	mv	a1,a5
    7160:	4681                	li	a3,0
    7162:	853a                	mv	a0,a4
    7164:	c416                	sw	t0,8(sp)
    7166:	b52fa0ef          	jal	ra,14b8 <__gedf2>
    716a:	02000793          	li	a5,32
    716e:	42a2                	lw	t0,8(sp)
    7170:	02055163          	bgez	a0,7192 <__v_printf+0x776>
    7174:	b719                	j	707a <__v_printf+0x65e>
    7176:	5712                	lw	a4,36(sp)
    7178:	57a2                	lw	a5,40(sp)
    717a:	4601                	li	a2,0
    717c:	4681                	li	a3,0
    717e:	853a                	mv	a0,a4
    7180:	85be                	mv	a1,a5
    7182:	c416                	sw	t0,8(sp)
    7184:	b34fa0ef          	jal	ra,14b8 <__gedf2>
    7188:	42a2                	lw	t0,8(sp)
    718a:	ee0548e3          	bltz	a0,707a <__v_printf+0x65e>
    718e:	02b00793          	li	a5,43
    7192:	4726                	lw	a4,72(sp)
    7194:	fff70693          	addi	a3,a4,-1
    7198:	c4b6                	sw	a3,72(sp)
    719a:	fef70fa3          	sb	a5,-1(a4)
    719e:	bdf1                	j	707a <__v_printf+0x65e>
    71a0:	8a071fe3          	bnez	a4,6a5e <__v_printf+0x42>
    71a4:	47c2                	lw	a5,16(sp)
    71a6:	c83e                	sw	a5,16(sp)
    71a8:	b071                	j	6a34 <__v_printf+0x18>
    71aa:	0000                	unimp
    71ac:	0000                	unimp
	...
