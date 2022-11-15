
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
      24:	50810113          	addi	sp,sp,1288 # 20001528 <g_top_irqstack>

    /* Load data section */
    la      a0, __erodata
      28:	00006517          	auipc	a0,0x6
      2c:	30050513          	addi	a0,a0,768 # 6328 <__ctor_end__>
    la      a1, __data_start__
      30:	b1818593          	addi	a1,gp,-1256 # 20000000 <__Vectors>
    la      a2, __data_end__
      34:	00818613          	addi	a2,gp,8 # 200004f0 <errno>
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
      4c:	00818513          	addi	a0,gp,8 # 200004f0 <errno>
    la      a1, __bss_end__
      50:	20002597          	auipc	a1,0x20002
      54:	e6058593          	addi	a1,a1,-416 # 20001eb0 <__bss_end__>
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
      66:	4a9030ef          	jal	ra,3d0e <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal     board_init
      6a:	4d5020ef          	jal	ra,2d3e <board_init>
#endif

    jal     main
      6e:	036040ef          	jal	ra,40a4 <main>

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
      b0:	b4c28293          	addi	t0,t0,-1204 # 20001bf8 <g_irqvector>
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
     122:	60a28293          	addi	t0,t0,1546 # 20001728 <g_trap_sp>
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
     17c:	3f1030ef          	jal	ra,3d6c <trap_c>


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
     20a:	00005697          	auipc	a3,0x5
     20e:	1fe68693          	addi	a3,a3,510 # 5408 <__clz_tab>
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
     366:	fff70793          	addi	a5,a4,-1 # ffff <__ctor_end__+0x9cd7>
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
     434:	00005597          	auipc	a1,0x5
     438:	fd458593          	addi	a1,a1,-44 # 5408 <__clz_tab>
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
     502:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0x9cd7>
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
     572:	00005697          	auipc	a3,0x5
     576:	e9668693          	addi	a3,a3,-362 # 5408 <__clz_tab>
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
     756:	00005297          	auipc	t0,0x5
     75a:	cb228293          	addi	t0,t0,-846 # 5408 <__clz_tab>
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
     834:	fff40593          	addi	a1,s0,-1 # ffff <__ctor_end__+0x9cd7>
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
     9ae:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f9cb8>
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
     a60:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f9cb8>
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
     bb6:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f9cb8>
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
     bfa:	fff28693          	addi	a3,t0,-1 # ffffff <__ctor_end__+0xff9cd7>
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
     c7a:	fe068293          	addi	t0,a3,-32 # 7fffe0 <__ctor_end__+0x7f9cb8>
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
     f4a:	00004597          	auipc	a1,0x4
     f4e:	44658593          	addi	a1,a1,1094 # 5390 <__srodata>
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
    10d4:	fff30693          	addi	a3,t1,-1 # fffff <__ctor_end__+0xf9cd7>
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
    110a:	fff28393          	addi	t2,t0,-1 # 7fffff <__ctor_end__+0x7f9cd7>
    110e:	00c7e763          	bltu	a5,a2,111c <__divdf3+0x272>
    1112:	0067f563          	bgeu	a5,t1,111c <__divdf3+0x272>
    1116:	ffe28393          	addi	t2,t0,-2
    111a:	97b2                	add	a5,a5,a2
    111c:	06c2                	slli	a3,a3,0x10
    111e:	6441                	lui	s0,0x10
    1120:	0076e6b3          	or	a3,a3,t2
    1124:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0x9cd7>
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
    118c:	fff68393          	addi	t2,a3,-1 # 7fffff <__ctor_end__+0x7f9cd7>
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
    11ee:	fff40693          	addi	a3,s0,-1 # ffff <__ctor_end__+0x9cd7>
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
    12ca:	3ff78793          	addi	a5,a5,1023 # 8003ff <__ctor_end__+0x7fa0d7>
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
    16c4:	00004617          	auipc	a2,0x4
    16c8:	d0860613          	addi	a2,a2,-760 # 53cc <__srodata+0x3c>
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
    186a:	fff60393          	addi	t2,a2,-1 # ffff <__ctor_end__+0x9cd7>
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
    18ae:	fff70413          	addi	s0,a4,-1 # ffff <__ctor_end__+0x9cd7>
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
    1960:	3ff78793          	addi	a5,a5,1023 # 10003ff <__ctor_end__+0xffa0d7>
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
    1b16:	fff28593          	addi	a1,t0,-1 # ffff <__ctor_end__+0x9cd7>
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
    1c6a:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f9cb8>
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
    1ce8:	00450713          	addi	a4,a0,4 # 10004 <__ctor_end__+0x9cdc>
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
    1dc2:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f9cb8>
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
    1e88:	fe058293          	addi	t0,a1,-32 # 7fffe0 <__ctor_end__+0x7f9cb8>
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
    20c0:	fff68793          	addi	a5,a3,-1 # fffff <__ctor_end__+0xf9cd7>
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
    219c:	00003797          	auipc	a5,0x3
    21a0:	26c78793          	addi	a5,a5,620 # 5408 <__clz_tab>
    21a4:	953e                	add	a0,a0,a5
    21a6:	00054503          	lbu	a0,0(a0) # 80000000 <__heap_end+0x5ffd0000>
    21aa:	40a70533          	sub	a0,a4,a0
    21ae:	8082                	ret
    21b0:	01000737          	lui	a4,0x1000
    21b4:	47c1                	li	a5,16
    21b6:	fce56ee3          	bltu	a0,a4,2192 <__clzsi2+0x10>
    21ba:	47e1                	li	a5,24
    21bc:	bfd9                	j	2192 <__clzsi2+0x10>
	...

000021c0 <memcpy>:
    21c0:	00463693          	sltiu	a3,a2,4
    21c4:	82aa                	mv	t0,a0
    21c6:	00c50333          	add	t1,a0,a2
    21ca:	e6a5                	bnez	a3,2232 <memcpy+0x72>
    21cc:	00b546b3          	xor	a3,a0,a1
    21d0:	8a8d                	andi	a3,a3,3
    21d2:	e2a5                	bnez	a3,2232 <memcpy+0x72>
    21d4:	00357693          	andi	a3,a0,3
    21d8:	4391                	li	t2,4
    21da:	e6bd                	bnez	a3,2248 <memcpy+0x88>
    21dc:	ffc37393          	andi	t2,t1,-4
    21e0:	fe038313          	addi	t1,t2,-32 # ffe0 <__ctor_end__+0x9cb8>
    21e4:	02a36a63          	bltu	t1,a0,2218 <memcpy+0x58>
    21e8:	8a7d                	andi	a2,a2,31
    21ea:	0001                	nop
    21ec:	4198                	lw	a4,0(a1)
    21ee:	c118                	sw	a4,0(a0)
    21f0:	41dc                	lw	a5,4(a1)
    21f2:	c15c                	sw	a5,4(a0)
    21f4:	4598                	lw	a4,8(a1)
    21f6:	c518                	sw	a4,8(a0)
    21f8:	45dc                	lw	a5,12(a1)
    21fa:	c55c                	sw	a5,12(a0)
    21fc:	4998                	lw	a4,16(a1)
    21fe:	c918                	sw	a4,16(a0)
    2200:	49dc                	lw	a5,20(a1)
    2202:	c95c                	sw	a5,20(a0)
    2204:	4d98                	lw	a4,24(a1)
    2206:	cd18                	sw	a4,24(a0)
    2208:	4ddc                	lw	a5,28(a1)
    220a:	02058593          	addi	a1,a1,32
    220e:	cd5c                	sw	a5,28(a0)
    2210:	02050513          	addi	a0,a0,32
    2214:	fca37ce3          	bgeu	t1,a0,21ec <memcpy+0x2c>
    2218:	ffc38313          	addi	t1,t2,-4
    221c:	00a36963          	bltu	t1,a0,222e <memcpy+0x6e>
    2220:	8a0d                	andi	a2,a2,3
    2222:	4198                	lw	a4,0(a1)
    2224:	0591                	addi	a1,a1,4
    2226:	c118                	sw	a4,0(a0)
    2228:	0511                	addi	a0,a0,4
    222a:	fea37ce3          	bgeu	t1,a0,2222 <memcpy+0x62>
    222e:	00c50333          	add	t1,a0,a2
    2232:	ca09                	beqz	a2,2244 <memcpy+0x84>
    2234:	00058703          	lb	a4,0(a1)
    2238:	0585                	addi	a1,a1,1
    223a:	00e50023          	sb	a4,0(a0)
    223e:	0505                	addi	a0,a0,1
    2240:	fe656ae3          	bltu	a0,t1,2234 <memcpy+0x74>
    2244:	8516                	mv	a0,t0
    2246:	8082                	ret
    2248:	40d386b3          	sub	a3,t2,a3
    224c:	83b6                	mv	t2,a3
    224e:	00058703          	lb	a4,0(a1)
    2252:	0585                	addi	a1,a1,1
    2254:	16fd                	addi	a3,a3,-1
    2256:	00e50023          	sb	a4,0(a0)
    225a:	0505                	addi	a0,a0,1
    225c:	faed                	bnez	a3,224e <memcpy+0x8e>
    225e:	40760633          	sub	a2,a2,t2
    2262:	00263693          	sltiu	a3,a2,2
    2266:	f6f1                	bnez	a3,2232 <memcpy+0x72>
    2268:	bf95                	j	21dc <memcpy+0x1c>
	...

0000226c <memmove>:
    226c:	02a5f263          	bgeu	a1,a0,2290 <memmove+0x24>
    2270:	00c587b3          	add	a5,a1,a2
    2274:	00f57e63          	bgeu	a0,a5,2290 <memmove+0x24>
    2278:	00c50733          	add	a4,a0,a2
    227c:	c20d                	beqz	a2,229e <memmove+0x32>
    227e:	fff7c683          	lbu	a3,-1(a5)
    2282:	17fd                	addi	a5,a5,-1
    2284:	177d                	addi	a4,a4,-1
    2286:	00d70023          	sb	a3,0(a4) # 1000000 <__ctor_end__+0xff9cd8>
    228a:	fef59ae3          	bne	a1,a5,227e <memmove+0x12>
    228e:	8082                	ret
    2290:	47bd                	li	a5,15
    2292:	00c7e763          	bltu	a5,a2,22a0 <memmove+0x34>
    2296:	87aa                	mv	a5,a0
    2298:	fff60693          	addi	a3,a2,-1
    229c:	ea09                	bnez	a2,22ae <memmove+0x42>
    229e:	8082                	ret
    22a0:	00a5e7b3          	or	a5,a1,a0
    22a4:	8b8d                	andi	a5,a5,3
    22a6:	cf99                	beqz	a5,22c4 <memmove+0x58>
    22a8:	fff60693          	addi	a3,a2,-1
    22ac:	87aa                	mv	a5,a0
    22ae:	0685                	addi	a3,a3,1
    22b0:	96be                	add	a3,a3,a5
    22b2:	0005c703          	lbu	a4,0(a1)
    22b6:	0785                	addi	a5,a5,1
    22b8:	0585                	addi	a1,a1,1
    22ba:	fee78fa3          	sb	a4,-1(a5)
    22be:	fed79ae3          	bne	a5,a3,22b2 <memmove+0x46>
    22c2:	8082                	ret
    22c4:	ff060293          	addi	t0,a2,-16
    22c8:	ff02f293          	andi	t0,t0,-16
    22cc:	02c1                	addi	t0,t0,16
    22ce:	00550333          	add	t1,a0,t0
    22d2:	872e                	mv	a4,a1
    22d4:	87aa                	mv	a5,a0
    22d6:	4314                	lw	a3,0(a4)
    22d8:	0741                	addi	a4,a4,16
    22da:	07c1                	addi	a5,a5,16
    22dc:	fed7a823          	sw	a3,-16(a5)
    22e0:	ff472683          	lw	a3,-12(a4)
    22e4:	fed7aa23          	sw	a3,-12(a5)
    22e8:	ff872683          	lw	a3,-8(a4)
    22ec:	fed7ac23          	sw	a3,-8(a5)
    22f0:	ffc72683          	lw	a3,-4(a4)
    22f4:	fed7ae23          	sw	a3,-4(a5)
    22f8:	fcf31fe3          	bne	t1,a5,22d6 <memmove+0x6a>
    22fc:	00c67713          	andi	a4,a2,12
    2300:	9596                	add	a1,a1,t0
    2302:	00f67313          	andi	t1,a2,15
    2306:	cb21                	beqz	a4,2356 <memmove+0xea>
    2308:	1171                	addi	sp,sp,-4
    230a:	c022                	sw	s0,0(sp)
    230c:	872e                	mv	a4,a1
    230e:	82be                	mv	t0,a5
    2310:	440d                	li	s0,3
    2312:	00072383          	lw	t2,0(a4)
    2316:	0711                	addi	a4,a4,4
    2318:	40e306b3          	sub	a3,t1,a4
    231c:	0072a023          	sw	t2,0(t0) # 800000 <__ctor_end__+0x7f9cd8>
    2320:	96ae                	add	a3,a3,a1
    2322:	0291                	addi	t0,t0,4
    2324:	fed467e3          	bltu	s0,a3,2312 <memmove+0xa6>
    2328:	ffc30713          	addi	a4,t1,-4 # ffffc <__ctor_end__+0xf9cd4>
    232c:	9b71                	andi	a4,a4,-4
    232e:	8a0d                	andi	a2,a2,3
    2330:	0711                	addi	a4,a4,4
    2332:	fff60693          	addi	a3,a2,-1
    2336:	97ba                	add	a5,a5,a4
    2338:	0685                	addi	a3,a3,1
    233a:	95ba                	add	a1,a1,a4
    233c:	96be                	add	a3,a3,a5
    233e:	ca09                	beqz	a2,2350 <memmove+0xe4>
    2340:	0005c703          	lbu	a4,0(a1)
    2344:	0785                	addi	a5,a5,1
    2346:	0585                	addi	a1,a1,1
    2348:	fee78fa3          	sb	a4,-1(a5)
    234c:	fed79ae3          	bne	a5,a3,2340 <memmove+0xd4>
    2350:	4402                	lw	s0,0(sp)
    2352:	0111                	addi	sp,sp,4
    2354:	8082                	ret
    2356:	861a                	mv	a2,t1
    2358:	b781                	j	2298 <memmove+0x2c>
	...

0000235c <memset>:
    235c:	433d                	li	t1,15
    235e:	872a                	mv	a4,a0
    2360:	02c37563          	bgeu	t1,a2,238a <memset+0x2e>
    2364:	00f77793          	andi	a5,a4,15
    2368:	e3c9                	bnez	a5,23ea <memset+0x8e>
    236a:	06059763          	bnez	a1,23d8 <memset+0x7c>
    236e:	ff067693          	andi	a3,a2,-16
    2372:	8a3d                	andi	a2,a2,15
    2374:	96ba                	add	a3,a3,a4
    2376:	c30c                	sw	a1,0(a4)
    2378:	c34c                	sw	a1,4(a4)
    237a:	c70c                	sw	a1,8(a4)
    237c:	c74c                	sw	a1,12(a4)
    237e:	0741                	addi	a4,a4,16
    2380:	fed76be3          	bltu	a4,a3,2376 <memset+0x1a>
    2384:	00061363          	bnez	a2,238a <memset+0x2e>
    2388:	8082                	ret
    238a:	40c306b3          	sub	a3,t1,a2
    238e:	068a                	slli	a3,a3,0x2
    2390:	00000297          	auipc	t0,0x0
    2394:	9696                	add	a3,a3,t0
    2396:	00a68067          	jr	10(a3)
    239a:	00b70723          	sb	a1,14(a4)
    239e:	00b706a3          	sb	a1,13(a4)
    23a2:	00b70623          	sb	a1,12(a4)
    23a6:	00b705a3          	sb	a1,11(a4)
    23aa:	00b70523          	sb	a1,10(a4)
    23ae:	00b704a3          	sb	a1,9(a4)
    23b2:	00b70423          	sb	a1,8(a4)
    23b6:	00b703a3          	sb	a1,7(a4)
    23ba:	00b70323          	sb	a1,6(a4)
    23be:	00b702a3          	sb	a1,5(a4)
    23c2:	00b70223          	sb	a1,4(a4)
    23c6:	00b701a3          	sb	a1,3(a4)
    23ca:	00b70123          	sb	a1,2(a4)
    23ce:	00b700a3          	sb	a1,1(a4)
    23d2:	00b70023          	sb	a1,0(a4)
    23d6:	8082                	ret
    23d8:	0ff5f593          	andi	a1,a1,255
    23dc:	00859693          	slli	a3,a1,0x8
    23e0:	8dd5                	or	a1,a1,a3
    23e2:	01059693          	slli	a3,a1,0x10
    23e6:	8dd5                	or	a1,a1,a3
    23e8:	b759                	j	236e <memset+0x12>
    23ea:	00279693          	slli	a3,a5,0x2
    23ee:	00000297          	auipc	t0,0x0
    23f2:	9696                	add	a3,a3,t0
    23f4:	8286                	mv	t0,ra
    23f6:	fa8680e7          	jalr	-88(a3)
    23fa:	8096                	mv	ra,t0
    23fc:	17c1                	addi	a5,a5,-16
    23fe:	8f1d                	sub	a4,a4,a5
    2400:	963e                	add	a2,a2,a5
    2402:	f8c374e3          	bgeu	t1,a2,238a <memset+0x2e>
    2406:	b795                	j	236a <memset+0xe>
	...

0000240a <srand>:
    240a:	0001a783          	lw	a5,0(gp) # 200004e8 <_impure_ptr>
    240e:	0aa7a423          	sw	a0,168(a5)
    2412:	0a07a623          	sw	zero,172(a5)
    2416:	8082                	ret

00002418 <rand>:
    2418:	0001a583          	lw	a1,0(gp) # 200004e8 <_impure_ptr>
    241c:	4c958637          	lui	a2,0x4c958
    2420:	f2d60613          	addi	a2,a2,-211 # 4c957f2d <__heap_end+0x2c927f2d>
    2424:	0a85a703          	lw	a4,168(a1)
    2428:	0ac5a783          	lw	a5,172(a1)
    242c:	02c70533          	mul	a0,a4,a2
    2430:	00150693          	addi	a3,a0,1
    2434:	00a6b533          	sltu	a0,a3,a0
    2438:	0ad5a423          	sw	a3,168(a1)
    243c:	5851f6b7          	lui	a3,0x5851f
    2440:	42d68693          	addi	a3,a3,1069 # 5851f42d <__heap_end+0x384ef42d>
    2444:	02d706b3          	mul	a3,a4,a3
    2448:	02c787b3          	mul	a5,a5,a2
    244c:	02c73733          	mulhu	a4,a4,a2
    2450:	97b6                	add	a5,a5,a3
    2452:	97ba                	add	a5,a5,a4
    2454:	97aa                	add	a5,a5,a0
    2456:	00179513          	slli	a0,a5,0x1
    245a:	0af5a623          	sw	a5,172(a1)
    245e:	8105                	srli	a0,a0,0x1
    2460:	8082                	ret

00002462 <strchr>:
    2462:	0ff5f693          	andi	a3,a1,255
    2466:	00357793          	andi	a5,a0,3
    246a:	cec9                	beqz	a3,2504 <strchr+0xa2>
    246c:	00078b63          	beqz	a5,2482 <strchr+0x20>
    2470:	00054783          	lbu	a5,0(a0)
    2474:	c7d1                	beqz	a5,2500 <strchr+0x9e>
    2476:	08d78663          	beq	a5,a3,2502 <strchr+0xa0>
    247a:	0505                	addi	a0,a0,1
    247c:	00357793          	andi	a5,a0,3
    2480:	fbe5                	bnez	a5,2470 <strchr+0xe>
    2482:	0ff5f593          	andi	a1,a1,255
    2486:	00859313          	slli	t1,a1,0x8
    248a:	4118                	lw	a4,0(a0)
    248c:	0065e5b3          	or	a1,a1,t1
    2490:	01059313          	slli	t1,a1,0x10
    2494:	00b36333          	or	t1,t1,a1
    2498:	feff0637          	lui	a2,0xfeff0
    249c:	00e345b3          	xor	a1,t1,a4
    24a0:	eff60613          	addi	a2,a2,-257 # fefefeff <__heap_end+0xdefbfeff>
    24a4:	00c587b3          	add	a5,a1,a2
    24a8:	00c702b3          	add	t0,a4,a2
    24ac:	fff5c593          	not	a1,a1
    24b0:	fff74713          	not	a4,a4
    24b4:	8fed                	and	a5,a5,a1
    24b6:	00e2f733          	and	a4,t0,a4
    24ba:	808085b7          	lui	a1,0x80808
    24be:	8fd9                	or	a5,a5,a4
    24c0:	08058593          	addi	a1,a1,128 # 80808080 <__heap_end+0x607d8080>
    24c4:	8fed                	and	a5,a5,a1
    24c6:	e785                	bnez	a5,24ee <strchr+0x8c>
    24c8:	4158                	lw	a4,4(a0)
    24ca:	0511                	addi	a0,a0,4
    24cc:	006742b3          	xor	t0,a4,t1
    24d0:	00c707b3          	add	a5,a4,a2
    24d4:	00c283b3          	add	t2,t0,a2
    24d8:	fff74713          	not	a4,a4
    24dc:	fff2c293          	not	t0,t0
    24e0:	8ff9                	and	a5,a5,a4
    24e2:	0053f2b3          	and	t0,t2,t0
    24e6:	0057e7b3          	or	a5,a5,t0
    24ea:	8fed                	and	a5,a5,a1
    24ec:	dff1                	beqz	a5,24c8 <strchr+0x66>
    24ee:	00054783          	lbu	a5,0(a0)
    24f2:	c799                	beqz	a5,2500 <strchr+0x9e>
    24f4:	06f68163          	beq	a3,a5,2556 <strchr+0xf4>
    24f8:	00154783          	lbu	a5,1(a0)
    24fc:	0505                	addi	a0,a0,1
    24fe:	fbfd                	bnez	a5,24f4 <strchr+0x92>
    2500:	4501                	li	a0,0
    2502:	8082                	ret
    2504:	cb81                	beqz	a5,2514 <strchr+0xb2>
    2506:	00054783          	lbu	a5,0(a0)
    250a:	dfe5                	beqz	a5,2502 <strchr+0xa0>
    250c:	0505                	addi	a0,a0,1
    250e:	00357793          	andi	a5,a0,3
    2512:	fbf5                	bnez	a5,2506 <strchr+0xa4>
    2514:	4118                	lw	a4,0(a0)
    2516:	feff0637          	lui	a2,0xfeff0
    251a:	eff60613          	addi	a2,a2,-257 # fefefeff <__heap_end+0xdefbfeff>
    251e:	00c707b3          	add	a5,a4,a2
    2522:	808086b7          	lui	a3,0x80808
    2526:	fff74713          	not	a4,a4
    252a:	8ff9                	and	a5,a5,a4
    252c:	08068693          	addi	a3,a3,128 # 80808080 <__heap_end+0x607d8080>
    2530:	8ff5                	and	a5,a5,a3
    2532:	eb91                	bnez	a5,2546 <strchr+0xe4>
    2534:	4158                	lw	a4,4(a0)
    2536:	0511                	addi	a0,a0,4
    2538:	00c707b3          	add	a5,a4,a2
    253c:	fff74713          	not	a4,a4
    2540:	8ff9                	and	a5,a5,a4
    2542:	8ff5                	and	a5,a5,a3
    2544:	dbe5                	beqz	a5,2534 <strchr+0xd2>
    2546:	00054783          	lbu	a5,0(a0)
    254a:	dfc5                	beqz	a5,2502 <strchr+0xa0>
    254c:	00154783          	lbu	a5,1(a0)
    2550:	0505                	addi	a0,a0,1
    2552:	ffed                	bnez	a5,254c <strchr+0xea>
    2554:	8082                	ret
    2556:	8082                	ret

00002558 <strcpy>:
    2558:	00b567b3          	or	a5,a0,a1
    255c:	8b8d                	andi	a5,a5,3
    255e:	efb1                	bnez	a5,25ba <strcpy+0x62>
    2560:	4198                	lw	a4,0(a1)
    2562:	7f7f86b7          	lui	a3,0x7f7f8
    2566:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    256a:	00d777b3          	and	a5,a4,a3
    256e:	97b6                	add	a5,a5,a3
    2570:	8fd9                	or	a5,a5,a4
    2572:	8fd5                	or	a5,a5,a3
    2574:	567d                	li	a2,-1
    2576:	04c79b63          	bne	a5,a2,25cc <strcpy+0x74>
    257a:	862a                	mv	a2,a0
    257c:	537d                	li	t1,-1
    257e:	c218                	sw	a4,0(a2)
    2580:	41d8                	lw	a4,4(a1)
    2582:	0591                	addi	a1,a1,4
    2584:	0611                	addi	a2,a2,4
    2586:	00d777b3          	and	a5,a4,a3
    258a:	97b6                	add	a5,a5,a3
    258c:	8fd9                	or	a5,a5,a4
    258e:	8fd5                	or	a5,a5,a3
    2590:	fe6787e3          	beq	a5,t1,257e <strcpy+0x26>
    2594:	0005c783          	lbu	a5,0(a1)
    2598:	0015c703          	lbu	a4,1(a1)
    259c:	0025c683          	lbu	a3,2(a1)
    25a0:	00f60023          	sb	a5,0(a2)
    25a4:	c799                	beqz	a5,25b2 <strcpy+0x5a>
    25a6:	00e600a3          	sb	a4,1(a2)
    25aa:	c701                	beqz	a4,25b2 <strcpy+0x5a>
    25ac:	00d60123          	sb	a3,2(a2)
    25b0:	e291                	bnez	a3,25b4 <strcpy+0x5c>
    25b2:	8082                	ret
    25b4:	000601a3          	sb	zero,3(a2)
    25b8:	8082                	ret
    25ba:	87aa                	mv	a5,a0
    25bc:	0005c703          	lbu	a4,0(a1)
    25c0:	0785                	addi	a5,a5,1
    25c2:	0585                	addi	a1,a1,1
    25c4:	fee78fa3          	sb	a4,-1(a5)
    25c8:	fb75                	bnez	a4,25bc <strcpy+0x64>
    25ca:	8082                	ret
    25cc:	862a                	mv	a2,a0
    25ce:	b7d9                	j	2594 <strcpy+0x3c>
	...

000025d2 <_strerror_r>:
    25d2:	87ae                	mv	a5,a1
    25d4:	08e00713          	li	a4,142
    25d8:	85b2                	mv	a1,a2
    25da:	00f76d63          	bltu	a4,a5,25f4 <_strerror_r+0x22>
    25de:	00003617          	auipc	a2,0x3
    25e2:	f2a60613          	addi	a2,a2,-214 # 5508 <__clz_tab+0x100>
    25e6:	00279313          	slli	t1,a5,0x2
    25ea:	9332                	add	t1,t1,a2
    25ec:	00032703          	lw	a4,0(t1)
    25f0:	9732                	add	a4,a4,a2
    25f2:	8702                	jr	a4
    25f4:	1151                	addi	sp,sp,-12
    25f6:	c406                	sw	ra,8(sp)
    25f8:	32068f63          	beqz	a3,2936 <_strerror_r+0x364>
    25fc:	8636                	mv	a2,a3
    25fe:	853e                	mv	a0,a5
    2600:	2f15                	jal	2d34 <_user_strerror>
    2602:	32050563          	beqz	a0,292c <_strerror_r+0x35a>
    2606:	40a2                	lw	ra,8(sp)
    2608:	0131                	addi	sp,sp,12
    260a:	8082                	ret
    260c:	00004517          	auipc	a0,0x4
    2610:	c8850513          	addi	a0,a0,-888 # 6294 <pad_line+0x68c>
    2614:	8082                	ret
    2616:	00004517          	auipc	a0,0x4
    261a:	c6650513          	addi	a0,a0,-922 # 627c <pad_line+0x674>
    261e:	8082                	ret
    2620:	00004517          	auipc	a0,0x4
    2624:	c1450513          	addi	a0,a0,-1004 # 6234 <pad_line+0x62c>
    2628:	8082                	ret
    262a:	00004517          	auipc	a0,0x4
    262e:	c2250513          	addi	a0,a0,-990 # 624c <pad_line+0x644>
    2632:	8082                	ret
    2634:	00004517          	auipc	a0,0x4
    2638:	80450513          	addi	a0,a0,-2044 # 5e38 <pad_line+0x230>
    263c:	8082                	ret
    263e:	00004517          	auipc	a0,0x4
    2642:	bba50513          	addi	a0,a0,-1094 # 61f8 <pad_line+0x5f0>
    2646:	8082                	ret
    2648:	00004517          	auipc	a0,0x4
    264c:	a2450513          	addi	a0,a0,-1500 # 606c <pad_line+0x464>
    2650:	8082                	ret
    2652:	00004517          	auipc	a0,0x4
    2656:	ca250513          	addi	a0,a0,-862 # 62f4 <pad_line+0x6ec>
    265a:	8082                	ret
    265c:	00003517          	auipc	a0,0x3
    2660:	6a450513          	addi	a0,a0,1700 # 5d00 <pad_line+0xf8>
    2664:	8082                	ret
    2666:	00003517          	auipc	a0,0x3
    266a:	66250513          	addi	a0,a0,1634 # 5cc8 <pad_line+0xc0>
    266e:	8082                	ret
    2670:	00004517          	auipc	a0,0x4
    2674:	bf850513          	addi	a0,a0,-1032 # 6268 <pad_line+0x660>
    2678:	8082                	ret
    267a:	00004517          	auipc	a0,0x4
    267e:	c5250513          	addi	a0,a0,-942 # 62cc <pad_line+0x6c4>
    2682:	8082                	ret
    2684:	00004517          	auipc	a0,0x4
    2688:	94050513          	addi	a0,a0,-1728 # 5fc4 <pad_line+0x3bc>
    268c:	8082                	ret
    268e:	00004517          	auipc	a0,0x4
    2692:	86e50513          	addi	a0,a0,-1938 # 5efc <pad_line+0x2f4>
    2696:	8082                	ret
    2698:	00003517          	auipc	a0,0x3
    269c:	73850513          	addi	a0,a0,1848 # 5dd0 <pad_line+0x1c8>
    26a0:	8082                	ret
    26a2:	00004517          	auipc	a0,0x4
    26a6:	82e50513          	addi	a0,a0,-2002 # 5ed0 <pad_line+0x2c8>
    26aa:	8082                	ret
    26ac:	00003517          	auipc	a0,0x3
    26b0:	71450513          	addi	a0,a0,1812 # 5dc0 <pad_line+0x1b8>
    26b4:	8082                	ret
    26b6:	00004517          	auipc	a0,0x4
    26ba:	c5250513          	addi	a0,a0,-942 # 6308 <pad_line+0x700>
    26be:	8082                	ret
    26c0:	00003517          	auipc	a0,0x3
    26c4:	75450513          	addi	a0,a0,1876 # 5e14 <pad_line+0x20c>
    26c8:	8082                	ret
    26ca:	00004517          	auipc	a0,0x4
    26ce:	91e50513          	addi	a0,a0,-1762 # 5fe8 <pad_line+0x3e0>
    26d2:	8082                	ret
    26d4:	00004517          	auipc	a0,0x4
    26d8:	b3c50513          	addi	a0,a0,-1220 # 6210 <pad_line+0x608>
    26dc:	8082                	ret
    26de:	00004517          	auipc	a0,0x4
    26e2:	b0250513          	addi	a0,a0,-1278 # 61e0 <pad_line+0x5d8>
    26e6:	8082                	ret
    26e8:	00004517          	auipc	a0,0x4
    26ec:	ac850513          	addi	a0,a0,-1336 # 61b0 <pad_line+0x5a8>
    26f0:	8082                	ret
    26f2:	00004517          	auipc	a0,0x4
    26f6:	aa650513          	addi	a0,a0,-1370 # 6198 <pad_line+0x590>
    26fa:	8082                	ret
    26fc:	00004517          	auipc	a0,0x4
    2700:	a7c50513          	addi	a0,a0,-1412 # 6178 <pad_line+0x570>
    2704:	8082                	ret
    2706:	00004517          	auipc	a0,0x4
    270a:	a5250513          	addi	a0,a0,-1454 # 6158 <pad_line+0x550>
    270e:	8082                	ret
    2710:	00004517          	auipc	a0,0x4
    2714:	a1850513          	addi	a0,a0,-1512 # 6128 <pad_line+0x520>
    2718:	8082                	ret
    271a:	00004517          	auipc	a0,0x4
    271e:	9ea50513          	addi	a0,a0,-1558 # 6104 <pad_line+0x4fc>
    2722:	8082                	ret
    2724:	00004517          	auipc	a0,0x4
    2728:	aa050513          	addi	a0,a0,-1376 # 61c4 <pad_line+0x5bc>
    272c:	8082                	ret
    272e:	00004517          	auipc	a0,0x4
    2732:	b7a50513          	addi	a0,a0,-1158 # 62a8 <pad_line+0x6a0>
    2736:	8082                	ret
    2738:	00004517          	auipc	a0,0x4
    273c:	9b450513          	addi	a0,a0,-1612 # 60ec <pad_line+0x4e4>
    2740:	8082                	ret
    2742:	00004517          	auipc	a0,0x4
    2746:	98e50513          	addi	a0,a0,-1650 # 60d0 <pad_line+0x4c8>
    274a:	8082                	ret
    274c:	00004517          	auipc	a0,0x4
    2750:	97050513          	addi	a0,a0,-1680 # 60bc <pad_line+0x4b4>
    2754:	8082                	ret
    2756:	00004517          	auipc	a0,0x4
    275a:	94a50513          	addi	a0,a0,-1718 # 60a0 <pad_line+0x498>
    275e:	8082                	ret
    2760:	00004517          	auipc	a0,0x4
    2764:	93450513          	addi	a0,a0,-1740 # 6094 <pad_line+0x48c>
    2768:	8082                	ret
    276a:	00004517          	auipc	a0,0x4
    276e:	91650513          	addi	a0,a0,-1770 # 6080 <pad_line+0x478>
    2772:	8082                	ret
    2774:	00004517          	auipc	a0,0x4
    2778:	8e850513          	addi	a0,a0,-1816 # 605c <pad_line+0x454>
    277c:	8082                	ret
    277e:	00004517          	auipc	a0,0x4
    2782:	8c650513          	addi	a0,a0,-1850 # 6044 <pad_line+0x43c>
    2786:	8082                	ret
    2788:	00004517          	auipc	a0,0x4
    278c:	8a850513          	addi	a0,a0,-1880 # 6030 <pad_line+0x428>
    2790:	8082                	ret
    2792:	00004517          	auipc	a0,0x4
    2796:	88650513          	addi	a0,a0,-1914 # 6018 <pad_line+0x410>
    279a:	8082                	ret
    279c:	00004517          	auipc	a0,0x4
    27a0:	98450513          	addi	a0,a0,-1660 # 6120 <pad_line+0x518>
    27a4:	8082                	ret
    27a6:	00004517          	auipc	a0,0x4
    27aa:	86250513          	addi	a0,a0,-1950 # 6008 <pad_line+0x400>
    27ae:	8082                	ret
    27b0:	00004517          	auipc	a0,0x4
    27b4:	85050513          	addi	a0,a0,-1968 # 6000 <pad_line+0x3f8>
    27b8:	8082                	ret
    27ba:	00004517          	auipc	a0,0x4
    27be:	82250513          	addi	a0,a0,-2014 # 5fdc <pad_line+0x3d4>
    27c2:	8082                	ret
    27c4:	00003517          	auipc	a0,0x3
    27c8:	7ec50513          	addi	a0,a0,2028 # 5fb0 <pad_line+0x3a8>
    27cc:	8082                	ret
    27ce:	00003517          	auipc	a0,0x3
    27d2:	7c650513          	addi	a0,a0,1990 # 5f94 <pad_line+0x38c>
    27d6:	8082                	ret
    27d8:	00003517          	auipc	a0,0x3
    27dc:	7a850513          	addi	a0,a0,1960 # 5f80 <pad_line+0x378>
    27e0:	8082                	ret
    27e2:	00003517          	auipc	a0,0x3
    27e6:	76e50513          	addi	a0,a0,1902 # 5f50 <pad_line+0x348>
    27ea:	8082                	ret
    27ec:	00003517          	auipc	a0,0x3
    27f0:	75850513          	addi	a0,a0,1880 # 5f44 <pad_line+0x33c>
    27f4:	8082                	ret
    27f6:	00003517          	auipc	a0,0x3
    27fa:	73e50513          	addi	a0,a0,1854 # 5f34 <pad_line+0x32c>
    27fe:	8082                	ret
    2800:	00003517          	auipc	a0,0x3
    2804:	71c50513          	addi	a0,a0,1820 # 5f1c <pad_line+0x314>
    2808:	8082                	ret
    280a:	00003517          	auipc	a0,0x3
    280e:	70250513          	addi	a0,a0,1794 # 5f0c <pad_line+0x304>
    2812:	8082                	ret
    2814:	00003517          	auipc	a0,0x3
    2818:	6d050513          	addi	a0,a0,1744 # 5ee4 <pad_line+0x2dc>
    281c:	8082                	ret
    281e:	00003517          	auipc	a0,0x3
    2822:	6a250513          	addi	a0,a0,1698 # 5ec0 <pad_line+0x2b8>
    2826:	8082                	ret
    2828:	00003517          	auipc	a0,0x3
    282c:	68850513          	addi	a0,a0,1672 # 5eb0 <pad_line+0x2a8>
    2830:	8082                	ret
    2832:	00003517          	auipc	a0,0x3
    2836:	66650513          	addi	a0,a0,1638 # 5e98 <pad_line+0x290>
    283a:	8082                	ret
    283c:	00003517          	auipc	a0,0x3
    2840:	63c50513          	addi	a0,a0,1596 # 5e78 <pad_line+0x270>
    2844:	8082                	ret
    2846:	00003517          	auipc	a0,0x3
    284a:	61250513          	addi	a0,a0,1554 # 5e58 <pad_line+0x250>
    284e:	8082                	ret
    2850:	00003517          	auipc	a0,0x3
    2854:	5b050513          	addi	a0,a0,1456 # 5e00 <pad_line+0x1f8>
    2858:	8082                	ret
    285a:	00003517          	auipc	a0,0x3
    285e:	59650513          	addi	a0,a0,1430 # 5df0 <pad_line+0x1e8>
    2862:	8082                	ret
    2864:	00003517          	auipc	a0,0x3
    2868:	54c50513          	addi	a0,a0,1356 # 5db0 <pad_line+0x1a8>
    286c:	8082                	ret
    286e:	00003517          	auipc	a0,0x3
    2872:	53250513          	addi	a0,a0,1330 # 5da0 <pad_line+0x198>
    2876:	8082                	ret
    2878:	00003517          	auipc	a0,0x3
    287c:	51450513          	addi	a0,a0,1300 # 5d8c <pad_line+0x184>
    2880:	8082                	ret
    2882:	00003517          	auipc	a0,0x3
    2886:	4fe50513          	addi	a0,a0,1278 # 5d80 <pad_line+0x178>
    288a:	8082                	ret
    288c:	00003517          	auipc	a0,0x3
    2890:	4dc50513          	addi	a0,a0,1244 # 5d68 <pad_line+0x160>
    2894:	8082                	ret
    2896:	00003517          	auipc	a0,0x3
    289a:	4c650513          	addi	a0,a0,1222 # 5d5c <pad_line+0x154>
    289e:	8082                	ret
    28a0:	00003517          	auipc	a0,0x3
    28a4:	4a850513          	addi	a0,a0,1192 # 5d48 <pad_line+0x140>
    28a8:	8082                	ret
    28aa:	00003517          	auipc	a0,0x3
    28ae:	48a50513          	addi	a0,a0,1162 # 5d34 <pad_line+0x12c>
    28b2:	8082                	ret
    28b4:	00003517          	auipc	a0,0x3
    28b8:	46c50513          	addi	a0,a0,1132 # 5d20 <pad_line+0x118>
    28bc:	8082                	ret
    28be:	00003517          	auipc	a0,0x3
    28c2:	43650513          	addi	a0,a0,1078 # 5cf4 <pad_line+0xec>
    28c6:	8082                	ret
    28c8:	00003517          	auipc	a0,0x3
    28cc:	41c50513          	addi	a0,a0,1052 # 5ce4 <pad_line+0xdc>
    28d0:	8082                	ret
    28d2:	00003517          	auipc	a0,0x3
    28d6:	3e250513          	addi	a0,a0,994 # 5cb4 <pad_line+0xac>
    28da:	8082                	ret
    28dc:	00003517          	auipc	a0,0x3
    28e0:	3c450513          	addi	a0,a0,964 # 5ca0 <pad_line+0x98>
    28e4:	8082                	ret
    28e6:	00003517          	auipc	a0,0x3
    28ea:	39e50513          	addi	a0,a0,926 # 5c84 <pad_line+0x7c>
    28ee:	8082                	ret
    28f0:	00003517          	auipc	a0,0x3
    28f4:	38850513          	addi	a0,a0,904 # 5c78 <pad_line+0x70>
    28f8:	8082                	ret
    28fa:	00003517          	auipc	a0,0x3
    28fe:	36650513          	addi	a0,a0,870 # 5c60 <pad_line+0x58>
    2902:	8082                	ret
    2904:	00003517          	auipc	a0,0x3
    2908:	34c50513          	addi	a0,a0,844 # 5c50 <pad_line+0x48>
    290c:	8082                	ret
    290e:	00003517          	auipc	a0,0x3
    2912:	32650513          	addi	a0,a0,806 # 5c34 <pad_line+0x2c>
    2916:	8082                	ret
    2918:	00004517          	auipc	a0,0x4
    291c:	a0850513          	addi	a0,a0,-1528 # 6320 <pad_line+0x718>
    2920:	8082                	ret
    2922:	00003517          	auipc	a0,0x3
    2926:	30650513          	addi	a0,a0,774 # 5c28 <pad_line+0x20>
    292a:	8082                	ret
    292c:	00003517          	auipc	a0,0x3
    2930:	08850513          	addi	a0,a0,136 # 59b4 <sg_usi_config+0xac>
    2934:	b9c9                	j	2606 <_strerror_r+0x34>
    2936:	86aa                	mv	a3,a0
    2938:	b1d1                	j	25fc <_strerror_r+0x2a>

0000293a <strerror>:
    293a:	85aa                	mv	a1,a0
    293c:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2940:	4681                	li	a3,0
    2942:	4601                	li	a2,0
    2944:	b179                	j	25d2 <_strerror_r>

00002946 <strerror_l>:
    2946:	85aa                	mv	a1,a0
    2948:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    294c:	4681                	li	a3,0
    294e:	4601                	li	a2,0
    2950:	b149                	j	25d2 <_strerror_r>
	...

00002954 <strlen>:
    2954:	00357793          	andi	a5,a0,3
    2958:	872a                	mv	a4,a0
    295a:	ef9d                	bnez	a5,2998 <strlen+0x44>
    295c:	7f7f86b7          	lui	a3,0x7f7f8
    2960:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    2964:	55fd                	li	a1,-1
    2966:	4310                	lw	a2,0(a4)
    2968:	0711                	addi	a4,a4,4
    296a:	00d677b3          	and	a5,a2,a3
    296e:	97b6                	add	a5,a5,a3
    2970:	8fd1                	or	a5,a5,a2
    2972:	8fd5                	or	a5,a5,a3
    2974:	feb789e3          	beq	a5,a1,2966 <strlen+0x12>
    2978:	ffc74683          	lbu	a3,-4(a4)
    297c:	ffd74603          	lbu	a2,-3(a4)
    2980:	ffe74783          	lbu	a5,-2(a4)
    2984:	8f09                	sub	a4,a4,a0
    2986:	c695                	beqz	a3,29b2 <strlen+0x5e>
    2988:	02060263          	beqz	a2,29ac <strlen+0x58>
    298c:	00f03533          	snez	a0,a5
    2990:	953a                	add	a0,a0,a4
    2992:	1579                	addi	a0,a0,-2
    2994:	8082                	ret
    2996:	d2f9                	beqz	a3,295c <strlen+0x8>
    2998:	00074783          	lbu	a5,0(a4)
    299c:	0705                	addi	a4,a4,1
    299e:	00377693          	andi	a3,a4,3
    29a2:	fbf5                	bnez	a5,2996 <strlen+0x42>
    29a4:	8f09                	sub	a4,a4,a0
    29a6:	fff70513          	addi	a0,a4,-1
    29aa:	8082                	ret
    29ac:	ffd70513          	addi	a0,a4,-3
    29b0:	8082                	ret
    29b2:	ffc70513          	addi	a0,a4,-4
    29b6:	8082                	ret
	...

000029ba <_strtol_l.part.0>:
    29ba:	1111                	addi	sp,sp,-28
    29bc:	c82a                	sw	a0,16(sp)
    29be:	cc22                	sw	s0,24(sp)
    29c0:	ca26                	sw	s1,20(sp)
    29c2:	872e                	mv	a4,a1
    29c4:	c42e                	sw	a1,8(sp)
    29c6:	c032                	sw	a2,0(sp)
    29c8:	00003517          	auipc	a0,0x3
    29cc:	d7d50513          	addi	a0,a0,-643 # 5745 <_ctype_+0x1>
    29d0:	00074783          	lbu	a5,0(a4)
    29d4:	85ba                	mv	a1,a4
    29d6:	0705                	addi	a4,a4,1
    29d8:	00f50633          	add	a2,a0,a5
    29dc:	00064603          	lbu	a2,0(a2)
    29e0:	8a21                	andi	a2,a2,8
    29e2:	f67d                	bnez	a2,29d0 <_strtol_l.part.0+0x16>
    29e4:	02d00613          	li	a2,45
    29e8:	0ec78063          	beq	a5,a2,2ac8 <_strtol_l.part.0+0x10e>
    29ec:	02b00613          	li	a2,43
    29f0:	06c78063          	beq	a5,a2,2a50 <_strtol_l.part.0+0x96>
    29f4:	800004b7          	lui	s1,0x80000
    29f8:	fff4c493          	not	s1,s1
    29fc:	c602                	sw	zero,12(sp)
    29fe:	c2bd                	beqz	a3,2a64 <_strtol_l.part.0+0xaa>
    2a00:	4641                	li	a2,16
    2a02:	8436                	mv	s0,a3
    2a04:	0cc68b63          	beq	a3,a2,2ada <_strtol_l.part.0+0x120>
    2a08:	0284f633          	remu	a2,s1,s0
    2a0c:	4581                	li	a1,0
    2a0e:	4501                	li	a0,0
    2a10:	4325                	li	t1,9
    2a12:	43e5                	li	t2,25
    2a14:	0284d2b3          	divu	t0,s1,s0
    2a18:	c232                	sw	a2,4(sp)
    2a1a:	fd078613          	addi	a2,a5,-48
    2a1e:	00c37863          	bgeu	t1,a2,2a2e <_strtol_l.part.0+0x74>
    2a22:	fbf78613          	addi	a2,a5,-65
    2a26:	04c3e863          	bltu	t2,a2,2a76 <_strtol_l.part.0+0xbc>
    2a2a:	fc978613          	addi	a2,a5,-55
    2a2e:	04d65c63          	bge	a2,a3,2a86 <_strtol_l.part.0+0xcc>
    2a32:	0405c063          	bltz	a1,2a72 <_strtol_l.part.0+0xb8>
    2a36:	55fd                	li	a1,-1
    2a38:	00a2e863          	bltu	t0,a0,2a48 <_strtol_l.part.0+0x8e>
    2a3c:	06a28663          	beq	t0,a0,2aa8 <_strtol_l.part.0+0xee>
    2a40:	4585                	li	a1,1
    2a42:	02850533          	mul	a0,a0,s0
    2a46:	9532                	add	a0,a0,a2
    2a48:	0705                	addi	a4,a4,1
    2a4a:	fff74783          	lbu	a5,-1(a4)
    2a4e:	b7f1                	j	2a1a <_strtol_l.part.0+0x60>
    2a50:	800004b7          	lui	s1,0x80000
    2a54:	c602                	sw	zero,12(sp)
    2a56:	00074783          	lbu	a5,0(a4)
    2a5a:	fff4c493          	not	s1,s1
    2a5e:	00258713          	addi	a4,a1,2
    2a62:	fed9                	bnez	a3,2a00 <_strtol_l.part.0+0x46>
    2a64:	03000693          	li	a3,48
    2a68:	08d78d63          	beq	a5,a3,2b02 <_strtol_l.part.0+0x148>
    2a6c:	4429                	li	s0,10
    2a6e:	46a9                	li	a3,10
    2a70:	bf61                	j	2a08 <_strtol_l.part.0+0x4e>
    2a72:	55fd                	li	a1,-1
    2a74:	bfd1                	j	2a48 <_strtol_l.part.0+0x8e>
    2a76:	f9f78613          	addi	a2,a5,-97
    2a7a:	00c3e663          	bltu	t2,a2,2a86 <_strtol_l.part.0+0xcc>
    2a7e:	fa978613          	addi	a2,a5,-87
    2a82:	fad648e3          	blt	a2,a3,2a32 <_strtol_l.part.0+0x78>
    2a86:	0205c563          	bltz	a1,2ab0 <_strtol_l.part.0+0xf6>
    2a8a:	47b2                	lw	a5,12(sp)
    2a8c:	c399                	beqz	a5,2a92 <_strtol_l.part.0+0xd8>
    2a8e:	40a00533          	neg	a0,a0
    2a92:	4782                	lw	a5,0(sp)
    2a94:	c791                	beqz	a5,2aa0 <_strtol_l.part.0+0xe6>
    2a96:	08059163          	bnez	a1,2b18 <_strtol_l.part.0+0x15e>
    2a9a:	4782                	lw	a5,0(sp)
    2a9c:	4722                	lw	a4,8(sp)
    2a9e:	c398                	sw	a4,0(a5)
    2aa0:	4462                	lw	s0,24(sp)
    2aa2:	44d2                	lw	s1,20(sp)
    2aa4:	0171                	addi	sp,sp,28
    2aa6:	8082                	ret
    2aa8:	4792                	lw	a5,4(sp)
    2aaa:	f8c7cfe3          	blt	a5,a2,2a48 <_strtol_l.part.0+0x8e>
    2aae:	bf49                	j	2a40 <_strtol_l.part.0+0x86>
    2ab0:	46c2                	lw	a3,16(sp)
    2ab2:	02200793          	li	a5,34
    2ab6:	8526                	mv	a0,s1
    2ab8:	c29c                	sw	a5,0(a3)
    2aba:	4782                	lw	a5,0(sp)
    2abc:	d3f5                	beqz	a5,2aa0 <_strtol_l.part.0+0xe6>
    2abe:	fff70793          	addi	a5,a4,-1
    2ac2:	c43e                	sw	a5,8(sp)
    2ac4:	8526                	mv	a0,s1
    2ac6:	bfd1                	j	2a9a <_strtol_l.part.0+0xe0>
    2ac8:	4605                	li	a2,1
    2aca:	00074783          	lbu	a5,0(a4)
    2ace:	800004b7          	lui	s1,0x80000
    2ad2:	00258713          	addi	a4,a1,2
    2ad6:	c632                	sw	a2,12(sp)
    2ad8:	b71d                	j	29fe <_strtol_l.part.0+0x44>
    2ada:	03000613          	li	a2,48
    2ade:	00c79a63          	bne	a5,a2,2af2 <_strtol_l.part.0+0x138>
    2ae2:	00074603          	lbu	a2,0(a4)
    2ae6:	05800593          	li	a1,88
    2aea:	0df67613          	andi	a2,a2,223
    2aee:	00b60463          	beq	a2,a1,2af6 <_strtol_l.part.0+0x13c>
    2af2:	4441                	li	s0,16
    2af4:	bf11                	j	2a08 <_strtol_l.part.0+0x4e>
    2af6:	00174783          	lbu	a5,1(a4)
    2afa:	4441                	li	s0,16
    2afc:	0709                	addi	a4,a4,2
    2afe:	46c1                	li	a3,16
    2b00:	b721                	j	2a08 <_strtol_l.part.0+0x4e>
    2b02:	00074683          	lbu	a3,0(a4)
    2b06:	05800613          	li	a2,88
    2b0a:	0df6f693          	andi	a3,a3,223
    2b0e:	fec684e3          	beq	a3,a2,2af6 <_strtol_l.part.0+0x13c>
    2b12:	4421                	li	s0,8
    2b14:	46a1                	li	a3,8
    2b16:	bdcd                	j	2a08 <_strtol_l.part.0+0x4e>
    2b18:	84aa                	mv	s1,a0
    2b1a:	b755                	j	2abe <_strtol_l.part.0+0x104>

00002b1c <_strtol_r>:
    2b1c:	4705                	li	a4,1
    2b1e:	00e68763          	beq	a3,a4,2b2c <_strtol_r+0x10>
    2b22:	02400713          	li	a4,36
    2b26:	00d76363          	bltu	a4,a3,2b2c <_strtol_r+0x10>
    2b2a:	bd41                	j	29ba <_strtol_l.part.0>
    2b2c:	1151                	addi	sp,sp,-12
    2b2e:	c406                	sw	ra,8(sp)
    2b30:	2421                	jal	2d38 <__errno>
    2b32:	40a2                	lw	ra,8(sp)
    2b34:	47d9                	li	a5,22
    2b36:	c11c                	sw	a5,0(a0)
    2b38:	4501                	li	a0,0
    2b3a:	0131                	addi	sp,sp,12
    2b3c:	8082                	ret

00002b3e <strtol_l>:
    2b3e:	4705                	li	a4,1
    2b40:	00e60d63          	beq	a2,a4,2b5a <strtol_l+0x1c>
    2b44:	02400713          	li	a4,36
    2b48:	00c76963          	bltu	a4,a2,2b5a <strtol_l+0x1c>
    2b4c:	87aa                	mv	a5,a0
    2b4e:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2b52:	86b2                	mv	a3,a2
    2b54:	862e                	mv	a2,a1
    2b56:	85be                	mv	a1,a5
    2b58:	b58d                	j	29ba <_strtol_l.part.0>
    2b5a:	1151                	addi	sp,sp,-12
    2b5c:	c406                	sw	ra,8(sp)
    2b5e:	2ae9                	jal	2d38 <__errno>
    2b60:	40a2                	lw	ra,8(sp)
    2b62:	47d9                	li	a5,22
    2b64:	c11c                	sw	a5,0(a0)
    2b66:	4501                	li	a0,0
    2b68:	0131                	addi	sp,sp,12
    2b6a:	8082                	ret

00002b6c <strtol>:
    2b6c:	4705                	li	a4,1
    2b6e:	00e60d63          	beq	a2,a4,2b88 <strtol+0x1c>
    2b72:	02400713          	li	a4,36
    2b76:	00c76963          	bltu	a4,a2,2b88 <strtol+0x1c>
    2b7a:	87aa                	mv	a5,a0
    2b7c:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2b80:	86b2                	mv	a3,a2
    2b82:	862e                	mv	a2,a1
    2b84:	85be                	mv	a1,a5
    2b86:	bd15                	j	29ba <_strtol_l.part.0>
    2b88:	1151                	addi	sp,sp,-12
    2b8a:	c406                	sw	ra,8(sp)
    2b8c:	2275                	jal	2d38 <__errno>
    2b8e:	40a2                	lw	ra,8(sp)
    2b90:	47d9                	li	a5,22
    2b92:	c11c                	sw	a5,0(a0)
    2b94:	4501                	li	a0,0
    2b96:	0131                	addi	sp,sp,12
    2b98:	8082                	ret

00002b9a <_strtoul_l.constprop.0>:
    2b9a:	1121                	addi	sp,sp,-24
    2b9c:	ca22                	sw	s0,20(sp)
    2b9e:	c826                	sw	s1,16(sp)
    2ba0:	c62a                	sw	a0,12(sp)
    2ba2:	c032                	sw	a2,0(sp)
    2ba4:	872e                	mv	a4,a1
    2ba6:	00003317          	auipc	t1,0x3
    2baa:	b9f30313          	addi	t1,t1,-1121 # 5745 <_ctype_+0x1>
    2bae:	00074783          	lbu	a5,0(a4)
    2bb2:	853a                	mv	a0,a4
    2bb4:	0705                	addi	a4,a4,1
    2bb6:	00f30633          	add	a2,t1,a5
    2bba:	00064603          	lbu	a2,0(a2)
    2bbe:	8a21                	andi	a2,a2,8
    2bc0:	f67d                	bnez	a2,2bae <_strtoul_l.constprop.0+0x14>
    2bc2:	02d00613          	li	a2,45
    2bc6:	0cc78c63          	beq	a5,a2,2c9e <_strtoul_l.constprop.0+0x104>
    2bca:	02b00613          	li	a2,43
    2bce:	c402                	sw	zero,8(sp)
    2bd0:	06c78a63          	beq	a5,a2,2c44 <_strtoul_l.constprop.0+0xaa>
    2bd4:	00068d63          	beqz	a3,2bee <_strtoul_l.constprop.0+0x54>
    2bd8:	4641                	li	a2,16
    2bda:	0cc68963          	beq	a3,a2,2cac <_strtoul_l.constprop.0+0x112>
    2bde:	567d                	li	a2,-1
    2be0:	02d653b3          	divu	t2,a2,a3
    2be4:	84b6                	mv	s1,a3
    2be6:	02d67633          	remu	a2,a2,a3
    2bea:	c232                	sw	a2,4(sp)
    2bec:	a829                	j	2c06 <_strtoul_l.constprop.0+0x6c>
    2bee:	03000693          	li	a3,48
    2bf2:	0ed78463          	beq	a5,a3,2cda <_strtoul_l.constprop.0+0x140>
    2bf6:	4695                	li	a3,5
    2bf8:	1999a3b7          	lui	t2,0x1999a
    2bfc:	c236                	sw	a3,4(sp)
    2bfe:	99938393          	addi	t2,t2,-1639 # 19999999 <__ctor_end__+0x19993671>
    2c02:	44a9                	li	s1,10
    2c04:	46a9                	li	a3,10
    2c06:	4301                	li	t1,0
    2c08:	4501                	li	a0,0
    2c0a:	42a5                	li	t0,9
    2c0c:	4465                	li	s0,25
    2c0e:	fd078613          	addi	a2,a5,-48
    2c12:	00c2f863          	bgeu	t0,a2,2c22 <_strtoul_l.constprop.0+0x88>
    2c16:	fbf78613          	addi	a2,a5,-65
    2c1a:	02c46c63          	bltu	s0,a2,2c52 <_strtoul_l.constprop.0+0xb8>
    2c1e:	fc978613          	addi	a2,a5,-55
    2c22:	04d65063          	bge	a2,a3,2c62 <_strtoul_l.constprop.0+0xc8>
    2c26:	02034463          	bltz	t1,2c4e <_strtoul_l.constprop.0+0xb4>
    2c2a:	537d                	li	t1,-1
    2c2c:	00a3e863          	bltu	t2,a0,2c3c <_strtoul_l.constprop.0+0xa2>
    2c30:	04750963          	beq	a0,t2,2c82 <_strtoul_l.constprop.0+0xe8>
    2c34:	02950533          	mul	a0,a0,s1
    2c38:	4305                	li	t1,1
    2c3a:	9532                	add	a0,a0,a2
    2c3c:	0705                	addi	a4,a4,1
    2c3e:	fff74783          	lbu	a5,-1(a4)
    2c42:	b7f1                	j	2c0e <_strtoul_l.constprop.0+0x74>
    2c44:	00074783          	lbu	a5,0(a4)
    2c48:	00250713          	addi	a4,a0,2
    2c4c:	b761                	j	2bd4 <_strtoul_l.constprop.0+0x3a>
    2c4e:	537d                	li	t1,-1
    2c50:	b7f5                	j	2c3c <_strtoul_l.constprop.0+0xa2>
    2c52:	f9f78613          	addi	a2,a5,-97
    2c56:	00c46663          	bltu	s0,a2,2c62 <_strtoul_l.constprop.0+0xc8>
    2c5a:	fa978613          	addi	a2,a5,-87
    2c5e:	fcd644e3          	blt	a2,a3,2c26 <_strtoul_l.constprop.0+0x8c>
    2c62:	02034463          	bltz	t1,2c8a <_strtoul_l.constprop.0+0xf0>
    2c66:	47a2                	lw	a5,8(sp)
    2c68:	c399                	beqz	a5,2c6e <_strtoul_l.constprop.0+0xd4>
    2c6a:	40a00533          	neg	a0,a0
    2c6e:	4782                	lw	a5,0(sp)
    2c70:	c789                	beqz	a5,2c7a <_strtoul_l.constprop.0+0xe0>
    2c72:	02031363          	bnez	t1,2c98 <_strtoul_l.constprop.0+0xfe>
    2c76:	4782                	lw	a5,0(sp)
    2c78:	c38c                	sw	a1,0(a5)
    2c7a:	4452                	lw	s0,20(sp)
    2c7c:	44c2                	lw	s1,16(sp)
    2c7e:	0161                	addi	sp,sp,24
    2c80:	8082                	ret
    2c82:	4792                	lw	a5,4(sp)
    2c84:	fac7cce3          	blt	a5,a2,2c3c <_strtoul_l.constprop.0+0xa2>
    2c88:	b775                	j	2c34 <_strtoul_l.constprop.0+0x9a>
    2c8a:	46b2                	lw	a3,12(sp)
    2c8c:	02200793          	li	a5,34
    2c90:	557d                	li	a0,-1
    2c92:	c29c                	sw	a5,0(a3)
    2c94:	4782                	lw	a5,0(sp)
    2c96:	d3f5                	beqz	a5,2c7a <_strtoul_l.constprop.0+0xe0>
    2c98:	fff70593          	addi	a1,a4,-1
    2c9c:	bfe9                	j	2c76 <_strtoul_l.constprop.0+0xdc>
    2c9e:	00074783          	lbu	a5,0(a4)
    2ca2:	4705                	li	a4,1
    2ca4:	c43a                	sw	a4,8(sp)
    2ca6:	00250713          	addi	a4,a0,2
    2caa:	b72d                	j	2bd4 <_strtoul_l.constprop.0+0x3a>
    2cac:	03000613          	li	a2,48
    2cb0:	04c79c63          	bne	a5,a2,2d08 <_strtoul_l.constprop.0+0x16e>
    2cb4:	00074603          	lbu	a2,0(a4)
    2cb8:	05800513          	li	a0,88
    2cbc:	0df67613          	andi	a2,a2,223
    2cc0:	02a61d63          	bne	a2,a0,2cfa <_strtoul_l.constprop.0+0x160>
    2cc4:	46bd                	li	a3,15
    2cc6:	100003b7          	lui	t2,0x10000
    2cca:	00174783          	lbu	a5,1(a4)
    2cce:	c236                	sw	a3,4(sp)
    2cd0:	0709                	addi	a4,a4,2
    2cd2:	13fd                	addi	t2,t2,-1
    2cd4:	44c1                	li	s1,16
    2cd6:	46c1                	li	a3,16
    2cd8:	b73d                	j	2c06 <_strtoul_l.constprop.0+0x6c>
    2cda:	00074683          	lbu	a3,0(a4)
    2cde:	05800613          	li	a2,88
    2ce2:	0df6f693          	andi	a3,a3,223
    2ce6:	fcc68fe3          	beq	a3,a2,2cc4 <_strtoul_l.constprop.0+0x12a>
    2cea:	469d                	li	a3,7
    2cec:	200003b7          	lui	t2,0x20000
    2cf0:	c236                	sw	a3,4(sp)
    2cf2:	13fd                	addi	t2,t2,-1
    2cf4:	44a1                	li	s1,8
    2cf6:	46a1                	li	a3,8
    2cf8:	b739                	j	2c06 <_strtoul_l.constprop.0+0x6c>
    2cfa:	53fd                	li	t2,-1
    2cfc:	463d                	li	a2,15
    2cfe:	02d3d3b3          	divu	t2,t2,a3
    2d02:	44c1                	li	s1,16
    2d04:	c232                	sw	a2,4(sp)
    2d06:	b701                	j	2c06 <_strtoul_l.constprop.0+0x6c>
    2d08:	463d                	li	a2,15
    2d0a:	100003b7          	lui	t2,0x10000
    2d0e:	c232                	sw	a2,4(sp)
    2d10:	13fd                	addi	t2,t2,-1
    2d12:	44c1                	li	s1,16
    2d14:	bdcd                	j	2c06 <_strtoul_l.constprop.0+0x6c>

00002d16 <_strtoul_r>:
    2d16:	b551                	j	2b9a <_strtoul_l.constprop.0>

00002d18 <strtoul_l>:
    2d18:	87aa                	mv	a5,a0
    2d1a:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2d1e:	86b2                	mv	a3,a2
    2d20:	862e                	mv	a2,a1
    2d22:	85be                	mv	a1,a5
    2d24:	bd9d                	j	2b9a <_strtoul_l.constprop.0>

00002d26 <strtoul>:
    2d26:	87aa                	mv	a5,a0
    2d28:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2d2c:	86b2                	mv	a3,a2
    2d2e:	862e                	mv	a2,a1
    2d30:	85be                	mv	a1,a5
    2d32:	b5a5                	j	2b9a <_strtoul_l.constprop.0>

00002d34 <_user_strerror>:
    2d34:	4501                	li	a0,0
    2d36:	8082                	ret

00002d38 <__errno>:
    2d38:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2d3c:	8082                	ret

00002d3e <board_init>:

extern int clock_timer_init(void);
extern int clock_timer_start(void);

void board_init(void)
{
    2d3e:	1151                	addi	sp,sp,-12
    2d40:	c406                	sw	ra,8(sp)
    int32_t ret = 0;
    /* init the console*/
    clock_timer_init();
    2d42:	0b8010ef          	jal	ra,3dfa <clock_timer_init>
    clock_timer_start();
    2d46:	12e010ef          	jal	ra,3e74 <clock_timer_start>

    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2d4a:	4581                	li	a1,0
    2d4c:	4501                	li	a0,0
    2d4e:	223000ef          	jal	ra,3770 <csi_usart_initialize>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    if (ret < 0) {
        return;
    }
}
    2d52:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2d54:	02a1a423          	sw	a0,40(gp) # 20000510 <console_handle>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2d58:	65f1                	lui	a1,0x1c
    2d5a:	478d                	li	a5,3
    2d5c:	4701                	li	a4,0
    2d5e:	4681                	li	a3,0
    2d60:	4601                	li	a2,0
    2d62:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x15ed8>
}
    2d66:	0131                	addi	sp,sp,12
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2d68:	20b0006f          	j	3772 <csi_usart_config>

00002d6c <drv_irq_enable>:
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__STATIC_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    CLIC->INTIE[IRQn] |= CLIC_INTIE_IE_Msk;
    2d6c:	e000e7b7          	lui	a5,0xe000e
    2d70:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    2d74:	953e                	add	a0,a0,a5
    2d76:	40054783          	lbu	a5,1024(a0)
    2d7a:	0ff7f793          	andi	a5,a5,255
    2d7e:	0017e793          	ori	a5,a5,1
    2d82:	40f50023          	sb	a5,1024(a0)
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_enable_sirq(irq_num);
#else
    csi_vic_enable_irq(irq_num);
#endif
}
    2d86:	8082                	ret

00002d88 <drv_irq_register>:
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    g_irqvector[irq_num] = irq_handler;
    2d88:	200027b7          	lui	a5,0x20002
    2d8c:	050a                	slli	a0,a0,0x2
    2d8e:	bf878793          	addi	a5,a5,-1032 # 20001bf8 <g_irqvector>
    2d92:	97aa                	add	a5,a5,a0
    2d94:	c38c                	sw	a1,0(a5)
}
    2d96:	8082                	ret

00002d98 <wj_usi_set_rxfifo_th>:

static wj_usi_priv_t usi_instance[CONFIG_USI_NUM];

void wj_usi_set_rxfifo_th(wj_usi_reg_t *addr, uint32_t length)
{
    addr->USI_INTR_CTRL &= ~USI_INTR_CTRL_TH_MODE;
    2d98:	457c                	lw	a5,76(a0)
    2d9a:	7741                	lui	a4,0xffff0
    2d9c:	177d                	addi	a4,a4,-1
    2d9e:	8ff9                	and	a5,a5,a4
    2da0:	c57c                	sw	a5,76(a0)
    addr->USI_INTR_CTRL &= USI_INTR_CTRL_RXFIFO_TH;
    2da2:	457c                	lw	a5,76(a0)
    2da4:	cff7f793          	andi	a5,a5,-769
    2da8:	c57c                	sw	a5,76(a0)

    if (length >= USI_RX_MAX_FIFO) {
    2daa:	47bd                	li	a5,15
    2dac:	00b7f963          	bgeu	a5,a1,2dbe <wj_usi_set_rxfifo_th+0x26>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_12 | USI_INTR_CTRL_TH_MODE;
    2db0:	457c                	lw	a5,76(a0)
    2db2:	6741                	lui	a4,0x10
    2db4:	30070713          	addi	a4,a4,768 # 10300 <__ctor_end__+0x9fd8>
    } else if (length >= USI_RX_MAX_FIFO - 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2db8:	8fd9                	or	a5,a5,a4
    } else {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2dba:	c57c                	sw	a5,76(a0)
    }
}
    2dbc:	8082                	ret
    } else if (length >= USI_RX_MAX_FIFO - 4) {
    2dbe:	47ad                	li	a5,11
    2dc0:	00b7f763          	bgeu	a5,a1,2dce <wj_usi_set_rxfifo_th+0x36>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    2dc4:	6741                	lui	a4,0x10
    2dc6:	457c                	lw	a5,76(a0)
    2dc8:	20070713          	addi	a4,a4,512 # 10200 <__ctor_end__+0x9ed8>
    2dcc:	b7f5                	j	2db8 <wj_usi_set_rxfifo_th+0x20>
    } else if (length >= 4) {
    2dce:	478d                	li	a5,3
    2dd0:	00b7f763          	bgeu	a5,a1,2dde <wj_usi_set_rxfifo_th+0x46>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2dd4:	6741                	lui	a4,0x10
    2dd6:	457c                	lw	a5,76(a0)
    2dd8:	10070713          	addi	a4,a4,256 # 10100 <__ctor_end__+0x9dd8>
    2ddc:	bff1                	j	2db8 <wj_usi_set_rxfifo_th+0x20>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2dde:	457c                	lw	a5,76(a0)
    2de0:	1007e793          	ori	a5,a5,256
    2de4:	bfd9                	j	2dba <wj_usi_set_rxfifo_th+0x22>

00002de6 <wj_usi_irqhandler>:
//            CSI_DRIVER
//------------------------------------------
void wj_usi_irqhandler(int32_t idx)
{
    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usi_priv->base);
    2de6:	200017b7          	lui	a5,0x20001
    2dea:	00351713          	slli	a4,a0,0x3
    2dee:	73078793          	addi	a5,a5,1840 # 20001730 <usi_instance>
    2df2:	97ba                	add	a5,a5,a4
    2df4:	439c                	lw	a5,0(a5)

    switch (addr->USI_MODE_SEL & 0x3) {
    2df6:	4705                	li	a4,1
    2df8:	43dc                	lw	a5,4(a5)
    2dfa:	8b8d                	andi	a5,a5,3
    2dfc:	00e78863          	beq	a5,a4,2e0c <wj_usi_irqhandler+0x26>
    2e00:	4709                	li	a4,2
    2e02:	00e78663          	beq	a5,a4,2e0e <wj_usi_irqhandler+0x28>
    2e06:	00079563          	bnez	a5,2e10 <wj_usi_irqhandler+0x2a>
        case USI_MODE_UART:
#ifndef  CONFIG_CHIP_PANGU
            wj_usi_usart_irqhandler(idx);
    2e0a:	af01                	j	351a <wj_usi_usart_irqhandler>
#endif
            break;

        case USI_MODE_I2C:
            wj_usi_i2c_irqhandler(idx);
    2e0c:	a0a1                	j	2e54 <wj_usi_i2c_irqhandler>
            break;

        case USI_MODE_SPI:
            wj_usi_spi_irqhandler(idx);
    2e0e:	acfd                	j	310c <wj_usi_spi_irqhandler>
            break;

        default:
            return;
    }
}
    2e10:	8082                	ret

00002e12 <drv_usi_initialize>:

int32_t drv_usi_initialize(int32_t idx)
{
    2e12:	1131                	addi	sp,sp,-20
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usi_init(idx, &base, &irq);
    2e14:	0050                	addi	a2,sp,4
    2e16:	858a                	mv	a1,sp
{
    2e18:	c622                	sw	s0,12(sp)
    2e1a:	c806                	sw	ra,16(sp)
    2e1c:	842a                	mv	s0,a0
    uint32_t base = 0u;
    2e1e:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    2e20:	c202                	sw	zero,4(sp)
    int32_t ret = target_usi_init(idx, &base, &irq);
    2e22:	1dd000ef          	jal	ra,37fe <target_usi_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    2e26:	4789                	li	a5,2
    2e28:	02a7e163          	bltu	a5,a0,2e4a <drv_usi_initialize+0x38>
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    usi_priv->base = base;
    2e2c:	4782                	lw	a5,0(sp)
    2e2e:	20001537          	lui	a0,0x20001
    2e32:	040e                	slli	s0,s0,0x3
    2e34:	73050513          	addi	a0,a0,1840 # 20001730 <usi_instance>
    2e38:	9522                	add	a0,a0,s0
    2e3a:	c11c                	sw	a5,0(a0)
    usi_priv->irq  = irq;
    2e3c:	4792                	lw	a5,4(sp)
    2e3e:	c15c                	sw	a5,4(a0)

    return 0;
    2e40:	4501                	li	a0,0
}
    2e42:	40c2                	lw	ra,16(sp)
    2e44:	4432                	lw	s0,12(sp)
    2e46:	0151                	addi	sp,sp,20
    2e48:	8082                	ret
        return ERR_USI(DRV_ERROR_PARAMETER);
    2e4a:	81180537          	lui	a0,0x81180
    2e4e:	08450513          	addi	a0,a0,132 # 81180084 <__heap_end+0x61150084>
    2e52:	bfc5                	j	2e42 <drv_usi_initialize+0x30>

00002e54 <wj_usi_i2c_irqhandler>:

}
void wj_usi_i2c_irqhandler(int32_t idx)
{
    wj_usi_iic_priv_t *iic_priv = &iic_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2e54:	03000713          	li	a4,48
    2e58:	02e50733          	mul	a4,a0,a4
    2e5c:	200017b7          	lui	a5,0x20001
    2e60:	74878693          	addi	a3,a5,1864 # 20001748 <iic_instance>
{
    2e64:	1121                	addi	sp,sp,-24
    2e66:	c822                	sw	s0,16(sp)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;

    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2e68:	6599                	lui	a1,0x6
{
    2e6a:	c626                	sw	s1,12(sp)
    2e6c:	ca06                	sw	ra,20(sp)
    2e6e:	84aa                	mv	s1,a0
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2e70:	74878793          	addi	a5,a5,1864
    2e74:	9736                	add	a4,a4,a3
    2e76:	4300                	lw	s0,0(a4)
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2e78:	4874                	lw	a3,84(s0)
    2e7a:	00e69313          	slli	t1,a3,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2e7e:	8df5                	and	a1,a1,a3
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2e80:	00e35313          	srli	t1,t1,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2e84:	c19d                	beqz	a1,2eaa <wj_usi_i2c_irqhandler+0x56>
        /* If arbitration fault, it indicates either a slave device not
        * responding as expected, or other master which is not supported
        * by this SW.
        */
        iic_priv->status    = IIC_STATE_DONE;
    2e86:	4691                	li	a3,4
    2e88:	d714                	sw	a3,40(a4)
        addr->USI_EN = 0;
    2e8a:	00042023          	sw	zero,0(s0) # 80000 <__ctor_end__+0x79cd8>
        addr->USI_INTR_UNMASK = 0;
    2e8e:	04042e23          	sw	zero,92(s0)
        addr->USI_INTR_EN = 0;
        addr->USI_INTR_CLR = intr_state;

        if (iic_priv->cb_event) {
    2e92:	4718                	lw	a4,8(a4)
        addr->USI_INTR_EN = 0;
    2e94:	04042823          	sw	zero,80(s0)
        addr->USI_INTR_CLR = intr_state;
    2e98:	06642023          	sw	t1,96(s0)
        if (iic_priv->cb_event) {
    2e9c:	cf11                	beqz	a4,2eb8 <wj_usi_i2c_irqhandler+0x64>
            if (iic_priv->cb_event) {
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
            }
        }
    }
}
    2e9e:	4442                	lw	s0,16(sp)
    2ea0:	40d2                	lw	ra,20(sp)
    2ea2:	44b2                	lw	s1,12(sp)
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2ea4:	459d                	li	a1,7
}
    2ea6:	0161                	addi	sp,sp,24
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2ea8:	8702                	jr	a4
    switch (iic_priv->status) {
    2eaa:	5710                	lw	a2,40(a4)
    2eac:	4505                	li	a0,1
    2eae:	02a60663          	beq	a2,a0,2eda <wj_usi_i2c_irqhandler+0x86>
    2eb2:	4589                	li	a1,2
    2eb4:	10b60263          	beq	a2,a1,2fb8 <wj_usi_i2c_irqhandler+0x164>
            if (iic_priv->cb_event) {
    2eb8:	03000713          	li	a4,48
    2ebc:	02e48733          	mul	a4,s1,a4
            addr->USI_INTR_CLR = intr_state;
    2ec0:	06642023          	sw	t1,96(s0)
            addr->USI_INTR_UNMASK = 0;
    2ec4:	04042e23          	sw	zero,92(s0)
            addr->USI_INTR_EN = 0;
    2ec8:	04042823          	sw	zero,80(s0)
            addr->USI_EN = 0;
    2ecc:	00042023          	sw	zero,0(s0)
            if (iic_priv->cb_event) {
    2ed0:	97ba                	add	a5,a5,a4
    2ed2:	479c                	lw	a5,8(a5)
    2ed4:	c7e1                	beqz	a5,2f9c <wj_usi_i2c_irqhandler+0x148>
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2ed6:	4599                	li	a1,6
    2ed8:	a2d9                	j	309e <wj_usi_i2c_irqhandler+0x24a>
    if (intr_stat & USI_INT_TX_EMPTY) {
    2eda:	0026f513          	andi	a0,a3,2
    uint8_t emptyfifo = 0;
    2ede:	4601                	li	a2,0
    if (intr_stat & USI_INT_TX_EMPTY) {
    2ee0:	cd05                	beqz	a0,2f18 <wj_usi_i2c_irqhandler+0xc4>
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2ee2:	5350                	lw	a2,36(a4)
    2ee4:	4b08                	lw	a0,16(a4)
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2ee6:	4458                	lw	a4,12(s0)
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2ee8:	8d11                	sub	a0,a0,a2
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2eea:	8321                	srli	a4,a4,0x8
    2eec:	4641                	li	a2,16
    2eee:	8b7d                	andi	a4,a4,31
    2ef0:	40e60733          	sub	a4,a2,a4
    2ef4:	0ff57613          	andi	a2,a0,255
    2ef8:	00a77963          	bgeu	a4,a0,2f0a <wj_usi_i2c_irqhandler+0xb6>
    2efc:	4458                	lw	a4,12(s0)
    2efe:	4641                	li	a2,16
    2f00:	8321                	srli	a4,a4,0x8
    2f02:	8b7d                	andi	a4,a4,31
    2f04:	8e19                	sub	a2,a2,a4
    2f06:	0ff67613          	andi	a2,a2,255
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2f0a:	03000713          	li	a4,48
    2f0e:	02e48733          	mul	a4,s1,a4
    2f12:	973e                	add	a4,a4,a5
        for (i = 0; i < emptyfifo; i++) {
    2f14:	08c5e963          	bltu	a1,a2,2fa6 <wj_usi_i2c_irqhandler+0x152>
    if (iic_priv->tx_cnt == iic_priv->tx_total_num) {
    2f18:	03000713          	li	a4,48
    2f1c:	02e48733          	mul	a4,s1,a4
    2f20:	973e                	add	a4,a4,a5
    2f22:	534c                	lw	a1,36(a4)
    2f24:	4b18                	lw	a4,16(a4)
    2f26:	00e59963          	bne	a1,a4,2f38 <wj_usi_i2c_irqhandler+0xe4>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2f2a:	5418                	lw	a4,40(s0)
    2f2c:	00276713          	ori	a4,a4,2
    2f30:	d418                	sw	a4,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    2f32:	4838                	lw	a4,80(s0)
    2f34:	9b75                	andi	a4,a4,-3
    2f36:	c838                	sw	a4,80(s0)
    if (intr_stat & USI_INT_I2C_STOP) {
    2f38:	6705                	lui	a4,0x1
    2f3a:	8f75                	and	a4,a4,a3
    2f3c:	cb0d                	beqz	a4,2f6e <wj_usi_i2c_irqhandler+0x11a>
        iic_priv->status  = IIC_STATE_SEND_DONE;
    2f3e:	03000713          	li	a4,48
    2f42:	02e48733          	mul	a4,s1,a4
    2f46:	4595                	li	a1,5
    2f48:	973e                	add	a4,a4,a5
    2f4a:	d70c                	sw	a1,40(a4)
        if (iic_priv->cb_event) {
    2f4c:	4718                	lw	a4,8(a4)
        addr->USI_EN = 0;
    2f4e:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f52:	cf11                	beqz	a4,2f6e <wj_usi_i2c_irqhandler+0x11a>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2f54:	4581                	li	a1,0
    2f56:	8526                	mv	a0,s1
    2f58:	c432                	sw	a2,8(sp)
    2f5a:	c21a                	sw	t1,4(sp)
    2f5c:	c036                	sw	a3,0(sp)
    2f5e:	9702                	jalr	a4
    2f60:	4622                	lw	a2,8(sp)
    2f62:	4312                	lw	t1,4(sp)
    2f64:	4682                	lw	a3,0(sp)
    2f66:	200017b7          	lui	a5,0x20001
    2f6a:	74878793          	addi	a5,a5,1864 # 20001748 <iic_instance>
    iic_priv->tx_cnt += emptyfifo;
    2f6e:	03000713          	li	a4,48
    2f72:	02e48733          	mul	a4,s1,a4
    if (intr_stat & USI_INT_TX_WERR) {
    2f76:	8ac1                	andi	a3,a3,16
    iic_priv->tx_cnt += emptyfifo;
    2f78:	97ba                	add	a5,a5,a4
    2f7a:	53d8                	lw	a4,36(a5)
    2f7c:	963a                	add	a2,a2,a4
    2f7e:	d3d0                	sw	a2,36(a5)
    if (intr_stat & USI_INT_TX_WERR) {
    2f80:	ce81                	beqz	a3,2f98 <wj_usi_i2c_irqhandler+0x144>
        iic_priv->status = IIC_STATE_ERROR;
    2f82:	471d                	li	a4,7
    2f84:	d798                	sw	a4,40(a5)
        if (iic_priv->cb_event) {
    2f86:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2f88:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f8c:	c791                	beqz	a5,2f98 <wj_usi_i2c_irqhandler+0x144>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2f8e:	459d                	li	a1,7
    2f90:	8526                	mv	a0,s1
    2f92:	c01a                	sw	t1,0(sp)
    2f94:	9782                	jalr	a5
    2f96:	4302                	lw	t1,0(sp)
            addr->USI_INTR_CLR = intr_state;
    2f98:	06642023          	sw	t1,96(s0)
}
    2f9c:	40d2                	lw	ra,20(sp)
    2f9e:	4442                	lw	s0,16(sp)
    2fa0:	44b2                	lw	s1,12(sp)
    2fa2:	0161                	addi	sp,sp,24
    2fa4:	8082                	ret
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2fa6:	4f08                	lw	a0,24(a4)
        for (i = 0; i < emptyfifo; i++) {
    2fa8:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = tx_data;
    2faa:	00054283          	lbu	t0,0(a0)
            iic_priv->tx_buf++;
    2fae:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = tx_data;
    2fb0:	00542423          	sw	t0,8(s0)
            iic_priv->tx_buf++;
    2fb4:	cf08                	sw	a0,24(a4)
        for (i = 0; i < emptyfifo; i++) {
    2fb6:	bfb9                	j	2f14 <wj_usi_i2c_irqhandler+0xc0>
    if (intr_stat & USI_INT_RX_THOLD) {
    2fb8:	0206f613          	andi	a2,a3,32
    2fbc:	ca25                	beqz	a2,302c <wj_usi_i2c_irqhandler+0x1d8>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    2fbe:	02000613          	li	a2,32
    2fc2:	d030                	sw	a2,96(s0)
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2fc4:	4450                	lw	a2,12(s0)
    2fc6:	8241                	srli	a2,a2,0x10
    2fc8:	01f67513          	andi	a0,a2,31
        for (i = 0; i < rx_num; i++) {
    2fcc:	4601                	li	a2,0
    2fce:	0ca66e63          	bltu	a2,a0,30aa <wj_usi_i2c_irqhandler+0x256>
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2fd2:	03000613          	li	a2,48
    2fd6:	02c48633          	mul	a2,s1,a2
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2fda:	4458                	lw	a4,12(s0)
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2fdc:	4585                	li	a1,1
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2fde:	8321                	srli	a4,a4,0x8
    2fe0:	8b7d                	andi	a4,a4,31
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2fe2:	963e                	add	a2,a2,a5
    2fe4:	5208                	lw	a0,32(a2)
    2fe6:	4641                	li	a2,16
    2fe8:	8e19                	sub	a2,a2,a4
    2fea:	00a67663          	bgeu	a2,a0,2ff6 <wj_usi_i2c_irqhandler+0x1a2>
    2fee:	45c1                	li	a1,16
    2ff0:	8d99                	sub	a1,a1,a4
    2ff2:	0ff5f593          	andi	a1,a1,255
        if (iic_priv->rx_clk == 0) {
    2ff6:	03000713          	li	a4,48
    2ffa:	02e48733          	mul	a4,s1,a4
    2ffe:	973e                	add	a4,a4,a5
    3000:	5310                	lw	a2,32(a4)
    3002:	ce61                	beqz	a2,30da <wj_usi_i2c_irqhandler+0x286>
        for (i = 0; i < rxfifo; i++) {
    3004:	4601                	li	a2,0
            addr->USI_TX_RX_FIFO = 0x100;
    3006:	10000313          	li	t1,256
        for (i = 0; i < rxfifo; i++) {
    300a:	0ab61f63          	bne	a2,a1,30c8 <wj_usi_i2c_irqhandler+0x274>
        wj_usi_set_rxfifo_th(addr, rxfifo);
    300e:	8522                	mv	a0,s0
    3010:	c236                	sw	a3,4(sp)
    3012:	c02e                	sw	a1,0(sp)
    3014:	3351                	jal	2d98 <wj_usi_set_rxfifo_th>
        if (rxfifo == 0) {
    3016:	4582                	lw	a1,0(sp)
    3018:	200017b7          	lui	a5,0x20001
    301c:	4692                	lw	a3,4(sp)
    301e:	74878793          	addi	a5,a5,1864 # 20001748 <iic_instance>
    3022:	e589                	bnez	a1,302c <wj_usi_i2c_irqhandler+0x1d8>
            addr->USI_INTR_EN |= USI_INT_I2C_STOP;
    3024:	4838                	lw	a4,80(s0)
    3026:	6605                	lui	a2,0x1
    3028:	8f51                	or	a4,a4,a2
    302a:	c838                	sw	a4,80(s0)
    if (iic_priv->rx_cnt == iic_priv->rx_total_num) {
    302c:	03000713          	li	a4,48
    3030:	02e48733          	mul	a4,s1,a4
    3034:	973e                	add	a4,a4,a5
    3036:	4f50                	lw	a2,28(a4)
    3038:	4758                	lw	a4,12(a4)
    303a:	00e61a63          	bne	a2,a4,304e <wj_usi_i2c_irqhandler+0x1fa>
        addr->USI_I2CM_CTRL |= (1 << 1);
    303e:	5418                	lw	a4,40(s0)
    3040:	00276713          	ori	a4,a4,2
    3044:	d418                	sw	a4,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_RX_THOLD;
    3046:	4838                	lw	a4,80(s0)
    3048:	fdf77713          	andi	a4,a4,-33
    304c:	c838                	sw	a4,80(s0)
    if ((intr_stat & USI_INT_RX_WERR) || (intr_stat & USI_INT_RX_RERR)) {
    304e:	3006f713          	andi	a4,a3,768
    3052:	c70d                	beqz	a4,307c <wj_usi_i2c_irqhandler+0x228>
        iic_priv->status = IIC_STATE_ERROR;
    3054:	03000713          	li	a4,48
    3058:	02e48733          	mul	a4,s1,a4
    305c:	461d                	li	a2,7
    305e:	973e                	add	a4,a4,a5
    3060:	d710                	sw	a2,40(a4)
        if (iic_priv->cb_event) {
    3062:	4718                	lw	a4,8(a4)
        addr->USI_EN = 0;
    3064:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    3068:	cb11                	beqz	a4,307c <wj_usi_i2c_irqhandler+0x228>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    306a:	459d                	li	a1,7
    306c:	8526                	mv	a0,s1
    306e:	c036                	sw	a3,0(sp)
    3070:	9702                	jalr	a4
    3072:	4682                	lw	a3,0(sp)
    3074:	200017b7          	lui	a5,0x20001
    3078:	74878793          	addi	a5,a5,1864 # 20001748 <iic_instance>
    if (intr_stat & USI_INT_I2C_STOP) {
    307c:	6705                	lui	a4,0x1
    307e:	8ef9                	and	a3,a3,a4
    3080:	de91                	beqz	a3,2f9c <wj_usi_i2c_irqhandler+0x148>
        addr->USI_INTR_CLR = USI_INT_I2C_STOP;
    3082:	d038                	sw	a4,96(s0)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    3084:	03000713          	li	a4,48
    3088:	02e48733          	mul	a4,s1,a4
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    308c:	4581                	li	a1,0
        iic_priv->status  = IIC_STATE_RECV_DONE;
    308e:	97ba                	add	a5,a5,a4
    3090:	4719                	li	a4,6
    3092:	d798                	sw	a4,40(a5)
        if (iic_priv->cb_event) {
    3094:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    3096:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    309a:	f00781e3          	beqz	a5,2f9c <wj_usi_i2c_irqhandler+0x148>
}
    309e:	4442                	lw	s0,16(sp)
    30a0:	40d2                	lw	ra,20(sp)
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    30a2:	8526                	mv	a0,s1
}
    30a4:	44b2                	lw	s1,12(sp)
    30a6:	0161                	addi	sp,sp,24
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    30a8:	8782                	jr	a5
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    30aa:	00842303          	lw	t1,8(s0)
    30ae:	4b4c                	lw	a1,20(a4)
        for (i = 0; i < rx_num; i++) {
    30b0:	0605                	addi	a2,a2,1
    30b2:	0ff67613          	andi	a2,a2,255
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    30b6:	00658023          	sb	t1,0(a1) # 6000 <pad_line+0x3f8>
            iic_priv->rx_buf++;
    30ba:	4b4c                	lw	a1,20(a4)
    30bc:	0585                	addi	a1,a1,1
    30be:	cb4c                	sw	a1,20(a4)
            iic_priv->rx_cnt++;;
    30c0:	4f4c                	lw	a1,28(a4)
    30c2:	0585                	addi	a1,a1,1
    30c4:	cf4c                	sw	a1,28(a4)
        for (i = 0; i < rx_num; i++) {
    30c6:	b721                	j	2fce <wj_usi_i2c_irqhandler+0x17a>
            addr->USI_TX_RX_FIFO = 0x100;
    30c8:	00642423          	sw	t1,8(s0)
            iic_priv->rx_clk--;
    30cc:	5308                	lw	a0,32(a4)
        for (i = 0; i < rxfifo; i++) {
    30ce:	0605                	addi	a2,a2,1
    30d0:	0ff67613          	andi	a2,a2,255
            iic_priv->rx_clk--;
    30d4:	157d                	addi	a0,a0,-1
    30d6:	d308                	sw	a0,32(a4)
        for (i = 0; i < rxfifo; i++) {
    30d8:	bf0d                	j	300a <wj_usi_i2c_irqhandler+0x1b6>
            rxfifo = 0;
    30da:	4581                	li	a1,0
    30dc:	bf0d                	j	300e <wj_usi_i2c_irqhandler+0x1ba>

000030de <wj_spi_ss_control.isra.0>:
/**
  \brief control ss line depend on controlled Output mode.
*/
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
{
    if (spi_priv->ss_mode == SPI_SS_MASTER_HW_OUTPUT) {
    30de:	4789                	li	a5,2
    30e0:	02f51463          	bne	a0,a5,3108 <wj_spi_ss_control.isra.0+0x2a>
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
    30e4:	1151                	addi	sp,sp,-12
    30e6:	c406                	sw	ra,8(sp)
        if (stat == SPI_SS_INACTIVE) {
    30e8:	e991                	bnez	a1,30fc <wj_spi_ss_control.isra.0+0x1e>
            csi_gpio_pin_write(pgpio_pin_handle, true);
    30ea:	4585                	li	a1,1
        } else if (stat == SPI_SS_ACTIVE) {
            csi_gpio_pin_write(pgpio_pin_handle, false);
    30ec:	00c1a503          	lw	a0,12(gp) # 200004f4 <pgpio_pin_handle>
    30f0:	12b000ef          	jal	ra,3a1a <csi_gpio_pin_write>
        } else {
            return -1;
        }
    }

    return 0;
    30f4:	4501                	li	a0,0
}
    30f6:	40a2                	lw	ra,8(sp)
    30f8:	0131                	addi	sp,sp,12
    30fa:	8082                	ret
        } else if (stat == SPI_SS_ACTIVE) {
    30fc:	4785                	li	a5,1
            return -1;
    30fe:	557d                	li	a0,-1
        } else if (stat == SPI_SS_ACTIVE) {
    3100:	fef59be3          	bne	a1,a5,30f6 <wj_spi_ss_control.isra.0+0x18>
            csi_gpio_pin_write(pgpio_pin_handle, false);
    3104:	4581                	li	a1,0
    3106:	b7dd                	j	30ec <wj_spi_ss_control.isra.0+0xe>
    return 0;
    3108:	4501                	li	a0,0
}
    310a:	8082                	ret

0000310c <wj_usi_spi_irqhandler>:
  \brief       handler the interrupt.
  \param[in]   spi      Pointer to \ref SPI_RESOURCES
*/
void wj_usi_spi_irqhandler(int32_t idx)
{
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    310c:	04c00793          	li	a5,76
    3110:	02f507b3          	mul	a5,a0,a5
{
    3114:	1101                	addi	sp,sp,-32
    3116:	cc22                	sw	s0,24(sp)
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3118:	20001437          	lui	s0,0x20001
    311c:	7d840313          	addi	t1,s0,2008 # 200017d8 <spi_instance>
{
    3120:	ca26                	sw	s1,20(sp)
    3122:	ce06                	sw	ra,28(sp)
    3124:	872a                	mv	a4,a0
    3126:	7d840413          	addi	s0,s0,2008
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    312a:	933e                	add	t1,t1,a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    312c:	00032483          	lw	s1,0(t1)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    3130:	48f0                	lw	a2,84(s1)
    3132:	00e61793          	slli	a5,a2,0xe
    3136:	83b9                	srli	a5,a5,0xe
    3138:	c03e                	sw	a5,0(sp)

    /* deal with receive FIFO full interrupt */
    if (intr_state & USI_INT_SPI_STOP) {
    313a:	000207b7          	lui	a5,0x20
    313e:	8ff1                	and	a5,a5,a2
    3140:	c7c9                	beqz	a5,31ca <wj_usi_spi_irqhandler+0xbe>
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    3142:	44dc                	lw	a5,12(s1)
    uint32_t length = spi_priv->recv_num;
    3144:	01432503          	lw	a0,20(t1)
    uint8_t *pbuffer = spi_priv->recv_buf;
    3148:	01c32583          	lw	a1,28(t1)
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    314c:	83c1                	srli	a5,a5,0x10
    uint32_t rxdata_num = (rxnum > length) ? length : rxnum;
    314e:	8bfd                	andi	a5,a5,31
    3150:	00f57363          	bgeu	a0,a5,3156 <wj_usi_spi_irqhandler+0x4a>
    3154:	87aa                	mv	a5,a0
    for (i = 0; i < rxdata_num; i++) {
    3156:	00f582b3          	add	t0,a1,a5
    315a:	0a559d63          	bne	a1,t0,3214 <wj_usi_spi_irqhandler+0x108>
    length -= rxdata_num;
    315e:	40f502b3          	sub	t0,a0,a5
    if (length <= 0) {
    3162:	0af51f63          	bne	a0,a5,3220 <wj_usi_spi_irqhandler+0x114>
        addr->USI_INTR_EN &= ~USI_INT_SPI_STOP;
    3166:	48bc                	lw	a5,80(s1)
    3168:	7581                	lui	a1,0xfffe0
    316a:	15fd                	addi	a1,a1,-1
    316c:	8fed                	and	a5,a5,a1
    316e:	c8bc                	sw	a5,80(s1)
        spi_priv->status.busy = 0U;
    3170:	04c00793          	li	a5,76
    3174:	02f707b3          	mul	a5,a4,a5
    3178:	c832                	sw	a2,16(sp)
    317a:	c63a                	sw	a4,12(sp)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    317c:	c21a                	sw	t1,4(sp)
        spi_priv->status.busy = 0U;
    317e:	97a2                	add	a5,a5,s0
    3180:	0387c583          	lbu	a1,56(a5) # 20038 <__ctor_end__+0x19d10>
        spi_priv->recv_num = 0;
    3184:	c43e                	sw	a5,8(sp)
        spi_priv->status.busy = 0U;
    3186:	99f9                	andi	a1,a1,-2
    3188:	02b78c23          	sb	a1,56(a5)
        addr->USI_EN = 0x0;
    318c:	0004a023          	sw	zero,0(s1) # 80000000 <__heap_end+0x5ffd0000>
        addr->USI_EN = 0xf;
    3190:	45bd                	li	a1,15
    3192:	c08c                	sw	a1,0(s1)
        addr->USI_EN = 0x0;
    3194:	0004a023          	sw	zero,0(s1)
        spi_priv->recv_num = 0;
    3198:	0007aa23          	sw	zero,20(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    319c:	03434503          	lbu	a0,52(t1)
    31a0:	4581                	li	a1,0
    31a2:	3f35                	jal	30de <wj_spi_ss_control.isra.0>
        if (spi_priv->cb_event) {
    31a4:	47a2                	lw	a5,8(sp)
    31a6:	4312                	lw	t1,4(sp)
    31a8:	4732                	lw	a4,12(sp)
    31aa:	00c7a383          	lw	t2,12(a5)
    31ae:	4642                	lw	a2,16(sp)
    31b0:	00038a63          	beqz	t2,31c4 <wj_usi_spi_irqhandler+0xb8>
            spi_priv->cb_event(spi_priv->idx, SPI_EVENT_RX_COMPLETE);
    31b4:	43a8                	lw	a0,64(a5)
    31b6:	4589                	li	a1,2
    31b8:	c41a                	sw	t1,8(sp)
    31ba:	c232                	sw	a2,4(sp)
    31bc:	9382                	jalr	t2
            return;
    31be:	4612                	lw	a2,4(sp)
    31c0:	4322                	lw	t1,8(sp)
    31c2:	4732                	lw	a4,12(sp)
        wj_spi_intr_rx_full(spi_priv);
        addr->USI_INTR_CLR = USI_INT_SPI_STOP;
    31c4:	000207b7          	lui	a5,0x20
    31c8:	d0bc                	sw	a5,96(s1)
    }

    /* deal with transmit FIFO empty interrupt */
    if (intr_state & USI_INT_TX_EMPTY) {
    31ca:	8a09                	andi	a2,a2,2
    31cc:	10060363          	beqz	a2,32d2 <wj_usi_spi_irqhandler+0x1c6>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    31d0:	04c00793          	li	a5,76
    31d4:	02f707b3          	mul	a5,a4,a5
    31d8:	97a2                	add	a5,a5,s0
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    31da:	5b8c                	lw	a1,48(a5)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    31dc:	4390                	lw	a2,0(a5)
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    31de:	c1d9                	beqz	a1,3264 <wj_usi_spi_irqhandler+0x158>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    31e0:	578c                	lw	a1,40(a5)
    31e2:	47c1                	li	a5,16
    31e4:	00b7f363          	bgeu	a5,a1,31ea <wj_usi_spi_irqhandler+0xde>
    31e8:	45c1                	li	a1,16
    31ea:	04c00793          	li	a5,76
    31ee:	02f707b3          	mul	a5,a4,a5
    31f2:	4281                	li	t0,0
    31f4:	97a2                	add	a5,a5,s0
    31f6:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31f8:	08558563          	beq	a1,t0,3282 <wj_usi_spi_irqhandler+0x176>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31fc:	4f88                	lw	a0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31fe:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3200:	00054383          	lbu	t2,0(a0)
            spi_priv->send_buf++;
    3204:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    3206:	00762423          	sw	t2,8(a2) # 1008 <__divdf3+0x15e>
            spi_priv->send_buf++;
    320a:	cf88                	sw	a0,24(a5)
            spi_priv->send_num--;
    320c:	4b88                	lw	a0,16(a5)
    320e:	157d                	addi	a0,a0,-1
    3210:	cb88                	sw	a0,16(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    3212:	b7dd                	j	31f8 <wj_usi_spi_irqhandler+0xec>
        *pbuffer = addr->USI_TX_RX_FIFO;
    3214:	0084a383          	lw	t2,8(s1)
        pbuffer++;
    3218:	0585                	addi	a1,a1,1
        *pbuffer = addr->USI_TX_RX_FIFO;
    321a:	fe758fa3          	sb	t2,-1(a1) # fffdffff <__heap_end+0xdffaffff>
    for (i = 0; i < rxdata_num; i++) {
    321e:	bf35                	j	315a <wj_usi_spi_irqhandler+0x4e>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3220:	04c00793          	li	a5,76
    3224:	02f707b3          	mul	a5,a4,a5
    3228:	97a2                	add	a5,a5,s0
    322a:	4388                	lw	a0,0(a5)
            addr->USI_SPI_CTRL &= ~WJ_USI_SPI_CTRL_TMODE;
    322c:	04452383          	lw	t2,68(a0)
    3230:	fcf3f393          	andi	t2,t2,-49
    3234:	04752223          	sw	t2,68(a0)
            addr->USI_SPI_CTRL |= WJ_USI_SPI_CTRL_TMODE_RX;
    3238:	04452383          	lw	t2,68(a0)
    323c:	0203e393          	ori	t2,t2,32
    3240:	04752223          	sw	t2,68(a0)
    spi_priv->mode = mode;
    3244:	4509                	li	a0,2
    3246:	db88                	sw	a0,48(a5)
        spi_priv->recv_buf = pbuffer;
    3248:	cfcc                	sw	a1,28(a5)
        spi_priv->recv_num = length;
    324a:	0057aa23          	sw	t0,20(a5) # 20014 <__ctor_end__+0x19cec>
    324e:	bf9d                	j	31c4 <wj_usi_spi_irqhandler+0xb8>
            *spi_priv->recv_buf = addr->USI_TX_RX_FIFO;
    3250:	4608                	lw	a0,8(a2)
    3252:	4fcc                	lw	a1,28(a5)
    3254:	00a58023          	sb	a0,0(a1)
            spi_priv->recv_buf++;
    3258:	4fcc                	lw	a1,28(a5)
    325a:	0585                	addi	a1,a1,1
    325c:	cfcc                	sw	a1,28(a5)
            spi_priv->transfer_num--;
    325e:	53cc                	lw	a1,36(a5)
    3260:	15fd                	addi	a1,a1,-1
    3262:	d3cc                	sw	a1,36(a5)
        while (spi_priv->transfer_num) {
    3264:	53c8                	lw	a0,36(a5)
    3266:	f56d                	bnez	a0,3250 <wj_usi_spi_irqhandler+0x144>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    3268:	578c                	lw	a1,40(a5)
    326a:	47c1                	li	a5,16
    326c:	00b7f363          	bgeu	a5,a1,3272 <wj_usi_spi_irqhandler+0x166>
    3270:	45c1                	li	a1,16
    3272:	04c00793          	li	a5,76
    3276:	02f707b3          	mul	a5,a4,a5
    327a:	97a2                	add	a5,a5,s0
    327c:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    327e:	06b51163          	bne	a0,a1,32e0 <wj_usi_spi_irqhandler+0x1d4>
    if (spi_priv->clk_num == 0) {
    3282:	04c00793          	li	a5,76
    3286:	02f707b3          	mul	a5,a4,a5
    328a:	97a2                	add	a5,a5,s0
    328c:	578c                	lw	a1,40(a5)
    328e:	eda5                	bnez	a1,3306 <wj_usi_spi_irqhandler+0x1fa>
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    3290:	4a2c                	lw	a1,80(a2)
    3292:	c63a                	sw	a4,12(sp)
    3294:	c432                	sw	a2,8(sp)
    3296:	99f5                	andi	a1,a1,-3
    3298:	ca2c                	sw	a1,80(a2)
        spi_priv->status.busy = 0U;
    329a:	0387c583          	lbu	a1,56(a5)
        spi_priv->send_num = 0;
    329e:	0007a823          	sw	zero,16(a5)
    32a2:	c23e                	sw	a5,4(sp)
        spi_priv->status.busy = 0U;
    32a4:	99f9                	andi	a1,a1,-2
    32a6:	02b78c23          	sb	a1,56(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    32aa:	03434503          	lbu	a0,52(t1)
    32ae:	4581                	li	a1,0
    32b0:	353d                	jal	30de <wj_spi_ss_control.isra.0>
        addr->USI_EN = 0x0;
    32b2:	4622                	lw	a2,8(sp)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    32b4:	4792                	lw	a5,4(sp)
        addr->USI_EN = 0xf;
    32b6:	45bd                	li	a1,15
        addr->USI_EN = 0x0;
    32b8:	00062023          	sw	zero,0(a2)
        addr->USI_EN = 0xf;
    32bc:	c20c                	sw	a1,0(a2)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    32be:	5b8c                	lw	a1,48(a5)
    32c0:	47d0                	lw	a2,12(a5)
    32c2:	4732                	lw	a4,12(sp)
    32c4:	ed95                	bnez	a1,3300 <wj_usi_spi_irqhandler+0x1f4>
            if (spi_priv->cb_event) {
    32c6:	04060063          	beqz	a2,3306 <wj_usi_spi_irqhandler+0x1fa>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    32ca:	43a8                	lw	a0,64(a5)
    32cc:	9602                	jalr	a2
        wj_spi_intr_tx_empty(spi_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    32ce:	4789                	li	a5,2
    32d0:	d0bc                	sw	a5,96(s1)
    }

    addr->USI_INTR_CLR = intr_state;
    32d2:	4782                	lw	a5,0(sp)
}
    32d4:	40f2                	lw	ra,28(sp)
    32d6:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    32d8:	d0bc                	sw	a5,96(s1)
}
    32da:	44d2                	lw	s1,20(sp)
    32dc:	6105                	addi	sp,sp,32
    32de:	8082                	ret
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    32e0:	0187a283          	lw	t0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    32e4:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    32e6:	0002c383          	lbu	t2,0(t0) # 23ee <memset+0x92>
            spi_priv->send_buf++;
    32ea:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    32ec:	00762423          	sw	t2,8(a2)
            spi_priv->send_buf++;
    32f0:	0057ac23          	sw	t0,24(a5)
            spi_priv->send_num--;
    32f4:	0107a283          	lw	t0,16(a5)
    32f8:	12fd                	addi	t0,t0,-1
    32fa:	0057a823          	sw	t0,16(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    32fe:	b741                	j	327e <wj_usi_spi_irqhandler+0x172>
            if (spi_priv->cb_event) {
    3300:	c219                	beqz	a2,3306 <wj_usi_spi_irqhandler+0x1fa>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    3302:	4585                	li	a1,1
    3304:	b7d9                	j	32ca <wj_usi_spi_irqhandler+0x1be>
    spi_priv->clk_num -= spi_priv->transfer_num;
    3306:	04c00513          	li	a0,76
    330a:	02a70733          	mul	a4,a4,a0
    330e:	943a                	add	s0,s0,a4
    3310:	541c                	lw	a5,40(s0)
    3312:	5058                	lw	a4,36(s0)
    3314:	8f99                	sub	a5,a5,a4
    3316:	d41c                	sw	a5,40(s0)
    3318:	bf5d                	j	32ce <wj_usi_spi_irqhandler+0x1c2>

0000331a <ck_usart_intr_recv_data>:
  \brief        interrupt service function for receiver data available.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_data(wj_usi_usart_priv_t *usart_priv)
{
    if ((usart_priv->rx_total_num == 0) || (usart_priv->rx_buf == NULL)) {
    331a:	4558                	lw	a4,12(a0)
    331c:	c319                	beqz	a4,3322 <ck_usart_intr_recv_data+0x8>
    331e:	495c                	lw	a5,20(a0)
    3320:	e789                	bnez	a5,332a <ck_usart_intr_recv_data+0x10>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    3322:	451c                	lw	a5,8(a0)
    3324:	45b9                	li	a1,14
        usart_priv->rx_buf = NULL;
        usart_priv->rx_busy = 0;
        usart_priv->rx_total_num = 0;

        if (usart_priv->cb_event) {
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    3326:	5948                	lw	a0,52(a0)
    3328:	8782                	jr	a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    332a:	4110                	lw	a2,0(a0)
    uint32_t rxfifo_num = (addr->USI_FIFO_STA >> 16) & 0xf;
    332c:	465c                	lw	a5,12(a2)
    332e:	83c1                	srli	a5,a5,0x10
    3330:	8bbd                	andi	a5,a5,15
    uint32_t rxdata_num = (rxfifo_num > usart_priv->rx_total_num) ? usart_priv->rx_total_num : rxfifo_num;
    3332:	00f77363          	bgeu	a4,a5,3338 <ck_usart_intr_recv_data+0x1e>
    3336:	87ba                	mv	a5,a4
    for (i = 0; i < rxdata_num; i++) {
    3338:	4701                	li	a4,0
    333a:	02f71363          	bne	a4,a5,3360 <ck_usart_intr_recv_data+0x46>
    if (usart_priv->rx_cnt >= usart_priv->rx_total_num) {
    333e:	4d58                	lw	a4,28(a0)
    3340:	455c                	lw	a5,12(a0)
    3342:	02f76b63          	bltu	a4,a5,3378 <ck_usart_intr_recv_data+0x5e>
        usart_priv->last_rx_num = usart_priv->rx_total_num;
    3346:	d91c                	sw	a5,48(a0)
        if (usart_priv->cb_event) {
    3348:	451c                	lw	a5,8(a0)
        usart_priv->rx_cnt = 0;
    334a:	00052e23          	sw	zero,28(a0)
        usart_priv->rx_buf = NULL;
    334e:	00052a23          	sw	zero,20(a0)
        usart_priv->rx_busy = 0;
    3352:	02052423          	sw	zero,40(a0)
        usart_priv->rx_total_num = 0;
    3356:	00052623          	sw	zero,12(a0)
        if (usart_priv->cb_event) {
    335a:	cf99                	beqz	a5,3378 <ck_usart_intr_recv_data+0x5e>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    335c:	4585                	li	a1,1
    335e:	b7e1                	j	3326 <ck_usart_intr_recv_data+0xc>
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    3360:	460c                	lw	a1,8(a2)
    3362:	4954                	lw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    3364:	0705                	addi	a4,a4,1
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    3366:	00b68023          	sb	a1,0(a3)
        usart_priv->rx_cnt++;
    336a:	4d54                	lw	a3,28(a0)
    336c:	0685                	addi	a3,a3,1
    336e:	cd54                	sw	a3,28(a0)
        usart_priv->rx_buf++;
    3370:	4954                	lw	a3,20(a0)
    3372:	0685                	addi	a3,a3,1
    3374:	c954                	sw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    3376:	b7d1                	j	333a <ck_usart_intr_recv_data+0x20>
        }
    }
}
    3378:	8082                	ret

0000337a <drv_usi_usart_config_baudrate>:
{
    337a:	1151                	addi	sp,sp,-12
    337c:	c222                	sw	s0,4(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    337e:	4100                	lw	s0,0(a0)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3380:	5948                	lw	a0,52(a0)
{
    3382:	c026                	sw	s1,0(sp)
    3384:	c406                	sw	ra,8(sp)
    addr->USI_EN = 0x0;
    3386:	00042023          	sw	zero,0(s0)
{
    338a:	84ae                	mv	s1,a1
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    338c:	171000ef          	jal	ra,3cfc <drv_get_usi_freq>
    3390:	4729                	li	a4,10
    3392:	02e50533          	mul	a0,a0,a4
    3396:	029555b3          	divu	a1,a0,s1
    339a:	8191                	srli	a1,a1,0x4
        divisor = (divisor / 10);
    339c:	02e5d7b3          	divu	a5,a1,a4
    if ((divisor % 10) >= 5) {
    33a0:	02e5f5b3          	remu	a1,a1,a4
    33a4:	4711                	li	a4,4
    33a6:	00b76363          	bltu	a4,a1,33ac <drv_usi_usart_config_baudrate+0x32>
        divisor = divisor / 10 - 1;
    33aa:	17fd                	addi	a5,a5,-1
    addr->USI_CLK_DIV0 = divisor;
    33ac:	c81c                	sw	a5,16(s0)
    addr->USI_EN = 0xf;
    33ae:	47bd                	li	a5,15
}
    33b0:	40a2                	lw	ra,8(sp)
    addr->USI_EN = 0xf;
    33b2:	c01c                	sw	a5,0(s0)
}
    33b4:	4412                	lw	s0,4(sp)
    33b6:	4482                	lw	s1,0(sp)
    33b8:	4501                	li	a0,0
    33ba:	0131                	addi	sp,sp,12
    33bc:	8082                	ret

000033be <drv_usi_usart_config_mode>:
    USART_NULL_PARAM_CHK(handle);
    33be:	cd11                	beqz	a0,33da <drv_usi_usart_config_mode+0x1c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    33c0:	411c                	lw	a5,0(a0)
        addr->USI_EN = 0xf;
    33c2:	473d                	li	a4,15
    addr->USI_EN = 0x0;
    33c4:	0007a023          	sw	zero,0(a5)
        addr->USI_EN = 0xf;
    33c8:	c398                	sw	a4,0(a5)
    if (mode == USART_MODE_ASYNCHRONOUS) {
    33ca:	e199                	bnez	a1,33d0 <drv_usi_usart_config_mode+0x12>
        return 0;
    33cc:	4501                	li	a0,0
    33ce:	8082                	ret
    return ERR_USART(USART_ERROR_MODE);
    33d0:	81020537          	lui	a0,0x81020
    33d4:	08650513          	addi	a0,a0,134 # 81020086 <__heap_end+0x60ff0086>
    33d8:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    33da:	81020537          	lui	a0,0x81020
    33de:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    33e2:	8082                	ret

000033e4 <drv_usi_usart_config_parity>:
    USART_NULL_PARAM_CHK(handle);
    33e4:	c539                	beqz	a0,3432 <drv_usi_usart_config_parity+0x4e>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    33e6:	411c                	lw	a5,0(a0)
    switch (parity) {
    33e8:	4705                	li	a4,1
    addr->USI_EN = 0x0;
    33ea:	0007a023          	sw	zero,0(a5)
    switch (parity) {
    33ee:	02e58763          	beq	a1,a4,341c <drv_usi_usart_config_parity+0x38>
    33f2:	4709                	li	a4,2
    33f4:	00e58b63          	beq	a1,a4,340a <drv_usi_usart_config_parity+0x26>
    33f8:	04059263          	bnez	a1,343c <drv_usi_usart_config_parity+0x58>
            addr->USI_UART_CTRL &= ~CTRL_PARITY_ENABLE;
    33fc:	4f98                	lw	a4,24(a5)
    33fe:	9b3d                	andi	a4,a4,-17
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    3400:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    3402:	473d                	li	a4,15
    3404:	c398                	sw	a4,0(a5)
    return 0;
    3406:	4501                	li	a0,0
    3408:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    340a:	4f98                	lw	a4,24(a5)
    340c:	8b3d                	andi	a4,a4,15
    340e:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    3410:	4f98                	lw	a4,24(a5)
    3412:	01076713          	ori	a4,a4,16
    3416:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ODD;
    3418:	4f98                	lw	a4,24(a5)
    341a:	b7dd                	j	3400 <drv_usi_usart_config_parity+0x1c>
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    341c:	4f98                	lw	a4,24(a5)
    341e:	8b3d                	andi	a4,a4,15
    3420:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    3422:	4f98                	lw	a4,24(a5)
    3424:	01076713          	ori	a4,a4,16
    3428:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    342a:	4f98                	lw	a4,24(a5)
    342c:	02076713          	ori	a4,a4,32
    3430:	bfc1                	j	3400 <drv_usi_usart_config_parity+0x1c>
    USART_NULL_PARAM_CHK(handle);
    3432:	81020537          	lui	a0,0x81020
    3436:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
    343a:	8082                	ret
    switch (parity) {
    343c:	81020537          	lui	a0,0x81020
    3440:	08950513          	addi	a0,a0,137 # 81020089 <__heap_end+0x60ff0089>
}
    3444:	8082                	ret

00003446 <drv_usi_usart_config_stopbits>:
    USART_NULL_PARAM_CHK(handle);
    3446:	c531                	beqz	a0,3492 <drv_usi_usart_config_stopbits+0x4c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3448:	411c                	lw	a5,0(a0)
    switch (stopbit) {
    344a:	4705                	li	a4,1
    addr->USI_EN = 0x0;
    344c:	0007a023          	sw	zero,0(a5)
    switch (stopbit) {
    3450:	02e58963          	beq	a1,a4,3482 <drv_usi_usart_config_stopbits+0x3c>
    3454:	4709                	li	a4,2
    3456:	00e58e63          	beq	a1,a4,3472 <drv_usi_usart_config_stopbits+0x2c>
    345a:	04059163          	bnez	a1,349c <drv_usi_usart_config_stopbits+0x56>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    345e:	4f98                	lw	a4,24(a5)
    3460:	03377713          	andi	a4,a4,51
    3464:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1;
    3466:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3468:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    346a:	473d                	li	a4,15
    346c:	c398                	sw	a4,0(a5)
    return 0;
    346e:	4501                	li	a0,0
    3470:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3472:	4f98                	lw	a4,24(a5)
    3474:	03377713          	andi	a4,a4,51
    3478:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1_5;
    347a:	4f98                	lw	a4,24(a5)
    347c:	00476713          	ori	a4,a4,4
    3480:	b7e5                	j	3468 <drv_usi_usart_config_stopbits+0x22>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3482:	4f98                	lw	a4,24(a5)
    3484:	03377713          	andi	a4,a4,51
    3488:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    348a:	4f98                	lw	a4,24(a5)
    348c:	00876713          	ori	a4,a4,8
    3490:	bfe1                	j	3468 <drv_usi_usart_config_stopbits+0x22>
    USART_NULL_PARAM_CHK(handle);
    3492:	81020537          	lui	a0,0x81020
    3496:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
    349a:	8082                	ret
    switch (stopbit) {
    349c:	81020537          	lui	a0,0x81020
    34a0:	08a50513          	addi	a0,a0,138 # 8102008a <__heap_end+0x60ff008a>
}
    34a4:	8082                	ret

000034a6 <drv_usi_usart_config_databits>:
    USART_NULL_PARAM_CHK(handle);
    34a6:	c52d                	beqz	a0,3510 <drv_usi_usart_config_databits+0x6a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    34a8:	411c                	lw	a5,0(a0)
    switch (databits) {
    34aa:	4709                	li	a4,2
    addr->USI_EN = 0x0;
    34ac:	0007a023          	sw	zero,0(a5)
    switch (databits) {
    34b0:	04e58063          	beq	a1,a4,34f0 <drv_usi_usart_config_databits+0x4a>
    34b4:	00b76e63          	bltu	a4,a1,34d0 <drv_usi_usart_config_databits+0x2a>
    34b8:	02059463          	bnez	a1,34e0 <drv_usi_usart_config_databits+0x3a>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    34bc:	4f98                	lw	a4,24(a5)
    34be:	03c77713          	andi	a4,a4,60
    34c2:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_5;
    34c4:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    34c6:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    34c8:	473d                	li	a4,15
    34ca:	c398                	sw	a4,0(a5)
    return 0;
    34cc:	4501                	li	a0,0
    34ce:	8082                	ret
    switch (databits) {
    34d0:	470d                	li	a4,3
    34d2:	02e58763          	beq	a1,a4,3500 <drv_usi_usart_config_databits+0x5a>
    34d6:	81020537          	lui	a0,0x81020
    34da:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60ff0088>
    34de:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    34e0:	4f98                	lw	a4,24(a5)
    34e2:	03c77713          	andi	a4,a4,60
    34e6:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_6;
    34e8:	4f98                	lw	a4,24(a5)
    34ea:	00176713          	ori	a4,a4,1
    34ee:	bfe1                	j	34c6 <drv_usi_usart_config_databits+0x20>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    34f0:	4f98                	lw	a4,24(a5)
    34f2:	03c77713          	andi	a4,a4,60
    34f6:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_7;
    34f8:	4f98                	lw	a4,24(a5)
    34fa:	00276713          	ori	a4,a4,2
    34fe:	b7e1                	j	34c6 <drv_usi_usart_config_databits+0x20>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    3500:	4f98                	lw	a4,24(a5)
    3502:	03c77713          	andi	a4,a4,60
    3506:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    3508:	4f98                	lw	a4,24(a5)
    350a:	00376713          	ori	a4,a4,3
    350e:	bf65                	j	34c6 <drv_usi_usart_config_databits+0x20>
    USART_NULL_PARAM_CHK(handle);
    3510:	81020537          	lui	a0,0x81020
    3514:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3518:	8082                	ret

0000351a <wj_usi_usart_irqhandler>:
    }
}

void wj_usi_usart_irqhandler(int idx)
{
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    351a:	03800793          	li	a5,56
    351e:	02f507b3          	mul	a5,a0,a5
    3522:	200026b7          	lui	a3,0x20002
    3526:	8bc68713          	addi	a4,a3,-1860 # 200018bc <usi_usart_instance>
{
    352a:	1101                	addi	sp,sp,-32
    352c:	ca26                	sw	s1,20(sp)
    352e:	8bc68693          	addi	a3,a3,-1860
    3532:	cc22                	sw	s0,24(sp)
    3534:	ce06                	sw	ra,28(sp)
    3536:	c036                	sw	a3,0(sp)
    3538:	842a                	mv	s0,a0
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    353a:	97ba                	add	a5,a5,a4
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    353c:	4398                	lw	a4,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    353e:	4b64                	lw	s1,84(a4)
    3540:	00e49613          	slli	a2,s1,0xe
    3544:	8239                	srli	a2,a2,0xe
    3546:	c232                	sw	a2,4(sp)

    if (intr_state & USI_INT_TX_EMPTY) {
    3548:	0024f613          	andi	a2,s1,2
    354c:	c229                	beqz	a2,358e <wj_usi_usart_irqhandler+0x74>
    if (usart_priv->tx_total_num == 0) {
    354e:	4b94                	lw	a3,16(a5)
    3550:	ce8d                	beqz	a3,358a <wj_usi_usart_irqhandler+0x70>
    if (usart_priv->tx_cnt >= usart_priv->tx_total_num) {
    3552:	5390                	lw	a2,32(a5)
    3554:	0cd66363          	bltu	a2,a3,361a <wj_usi_usart_irqhandler+0x100>
        addr->USI_INTR_EN &= (~USI_INT_TX_EMPTY);
    3558:	4b30                	lw	a2,80(a4)
    355a:	9a75                	andi	a2,a2,-3
    355c:	cb30                	sw	a2,80(a4)
        addr->USI_INTR_EN |= USI_INT_UART_STOP;
    355e:	4b30                	lw	a2,80(a4)
    3560:	40066613          	ori	a2,a2,1024
    3564:	cb30                	sw	a2,80(a4)
        usart_priv->last_tx_num = usart_priv->tx_total_num;
    3566:	d7d4                	sw	a3,44(a5)
        if (usart_priv->cb_event) {
    3568:	4794                	lw	a3,8(a5)
        usart_priv->tx_cnt = 0;
    356a:	0207a023          	sw	zero,32(a5)
        usart_priv->tx_busy = 0;
    356e:	0207a223          	sw	zero,36(a5)
        usart_priv->tx_buf = NULL;
    3572:	0007ac23          	sw	zero,24(a5)
        usart_priv->tx_total_num = 0;
    3576:	0007a823          	sw	zero,16(a5)
        if (usart_priv->cb_event) {
    357a:	ca81                	beqz	a3,358a <wj_usi_usart_irqhandler+0x70>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_SEND_COMPLETE);
    357c:	5bc8                	lw	a0,52(a5)
    357e:	4581                	li	a1,0
    3580:	c63a                	sw	a4,12(sp)
    3582:	c43e                	sw	a5,8(sp)
    3584:	9682                	jalr	a3
    3586:	47a2                	lw	a5,8(sp)
    3588:	4732                	lw	a4,12(sp)
        ck_usart_intr_threshold_empty(usart_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    358a:	4689                	li	a3,2
    358c:	d334                	sw	a3,96(a4)
    }

    if (intr_state & USI_INT_RX_THOLD) {
    358e:	0204f693          	andi	a3,s1,32
    3592:	ca91                	beqz	a3,35a6 <wj_usi_usart_irqhandler+0x8c>
        ck_usart_intr_recv_data(usart_priv);
    3594:	853e                	mv	a0,a5
    3596:	c63a                	sw	a4,12(sp)
    3598:	c43e                	sw	a5,8(sp)
    359a:	3341                	jal	331a <ck_usart_intr_recv_data>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    359c:	4732                	lw	a4,12(sp)
    359e:	47a2                	lw	a5,8(sp)
    35a0:	02000693          	li	a3,32
    35a4:	d334                	sw	a3,96(a4)
    }

    if (intr_state & USI_INT_UART_STOP) {
    35a6:	4004f693          	andi	a3,s1,1024
    35aa:	c695                	beqz	a3,35d6 <wj_usi_usart_irqhandler+0xbc>
        if (USI_FIFO_STA_RX_NUM(addr) > 0) {
    35ac:	4754                	lw	a3,12(a4)
    35ae:	82c1                	srli	a3,a3,0x10
    35b0:	8afd                	andi	a3,a3,31
    35b2:	ce99                	beqz	a3,35d0 <wj_usi_usart_irqhandler+0xb6>
    if ((usart_priv->rx_total_num != 0) && (usart_priv->rx_buf != NULL)) {
    35b4:	03800693          	li	a3,56
    35b8:	02d406b3          	mul	a3,s0,a3
    35bc:	4602                	lw	a2,0(sp)
    35be:	96b2                	add	a3,a3,a2
    35c0:	46d0                	lw	a2,12(a3)
    35c2:	ce51                	beqz	a2,365e <wj_usi_usart_irqhandler+0x144>
    35c4:	4ad4                	lw	a3,20(a3)
    35c6:	cec1                	beqz	a3,365e <wj_usi_usart_irqhandler+0x144>
        ck_usart_intr_recv_data(usart_priv);
    35c8:	853e                	mv	a0,a5
    35ca:	c43a                	sw	a4,8(sp)
    35cc:	33b9                	jal	331a <ck_usart_intr_recv_data>
        return;
    35ce:	4722                	lw	a4,8(sp)
            ck_usart_intr_char_timeout(usart_priv);     //receive small data
        }

        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    35d0:	02000793          	li	a5,32
    35d4:	d33c                	sw	a5,96(a4)
    }

    if (intr_state & USI_INT_UART_PERR) {
    35d6:	80ad                	srli	s1,s1,0xb
    35d8:	8885                	andi	s1,s1,1
    35da:	c88d                	beqz	s1,360c <wj_usi_usart_irqhandler+0xf2>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    35dc:	03800513          	li	a0,56
    35e0:	02a40433          	mul	s0,s0,a0
    35e4:	4782                	lw	a5,0(sp)
    35e6:	943e                	add	s0,s0,a5
    35e8:	401c                	lw	a5,0(s0)
    addr->USI_EN &= ~USI_RX_FIFO_EN;
    35ea:	4394                	lw	a3,0(a5)
    35ec:	9add                	andi	a3,a3,-9
    35ee:	c394                	sw	a3,0(a5)
    addr->USI_EN |= USI_RX_FIFO_EN;
    35f0:	4394                	lw	a3,0(a5)
    35f2:	0086e693          	ori	a3,a3,8
    35f6:	c394                	sw	a3,0(a5)
    if (usart_priv->cb_event) {
    35f8:	441c                	lw	a5,8(s0)
    35fa:	c791                	beqz	a5,3606 <wj_usi_usart_irqhandler+0xec>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RX_PARITY_ERROR);
    35fc:	5848                	lw	a0,52(s0)
    35fe:	45a5                	li	a1,9
    3600:	c03a                	sw	a4,0(sp)
    3602:	9782                	jalr	a5
    3604:	4702                	lw	a4,0(sp)
        ck_usart_intr_recv_line(usart_priv);
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    3606:	02000793          	li	a5,32
    360a:	d33c                	sw	a5,96(a4)
    }

    addr->USI_INTR_CLR = intr_state;
    360c:	4792                	lw	a5,4(sp)
}
    360e:	40f2                	lw	ra,28(sp)
    3610:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    3612:	d33c                	sw	a5,96(a4)
}
    3614:	44d2                	lw	s1,20(sp)
    3616:	6105                	addi	sp,sp,32
    3618:	8082                	ret
        uint32_t remain_txdata  = usart_priv->tx_total_num - usart_priv->tx_cnt;
    361a:	538c                	lw	a1,32(a5)
    361c:	40b685b3          	sub	a1,a3,a1
        uint32_t txdata_num = (remain_txdata > (USI_TX_MAX_FIFO - 1)) ? (USI_TX_MAX_FIFO - 1) : remain_txdata;
    3620:	46bd                	li	a3,15
    3622:	00b6f363          	bgeu	a3,a1,3628 <wj_usi_usart_irqhandler+0x10e>
    3626:	45bd                	li	a1,15
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3628:	03800693          	li	a3,56
    362c:	02d406b3          	mul	a3,s0,a3
    3630:	4602                	lw	a2,0(sp)
        volatile uint32_t i = 0u;
    3632:	c802                	sw	zero,16(sp)
        for (i = 0; i < txdata_num; i++) {
    3634:	c802                	sw	zero,16(sp)
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3636:	96b2                	add	a3,a3,a2
        for (i = 0; i < txdata_num; i++) {
    3638:	4642                	lw	a2,16(sp)
    363a:	00b66563          	bltu	a2,a1,3644 <wj_usi_usart_irqhandler+0x12a>
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    363e:	4689                	li	a3,2
    3640:	d334                	sw	a3,96(a4)
    3642:	b7a1                	j	358a <wj_usi_usart_irqhandler+0x70>
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3644:	4e90                	lw	a2,24(a3)
    3646:	00064503          	lbu	a0,0(a2)
            usart_priv->tx_buf++;
    364a:	0605                	addi	a2,a2,1
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    364c:	c708                	sw	a0,8(a4)
            usart_priv->tx_cnt++;
    364e:	5288                	lw	a0,32(a3)
            usart_priv->tx_buf++;
    3650:	ce90                	sw	a2,24(a3)
            usart_priv->tx_cnt++;
    3652:	0505                	addi	a0,a0,1
    3654:	d288                	sw	a0,32(a3)
        for (i = 0; i < txdata_num; i++) {
    3656:	4642                	lw	a2,16(sp)
    3658:	0605                	addi	a2,a2,1
    365a:	c832                	sw	a2,16(sp)
    365c:	bff1                	j	3638 <wj_usi_usart_irqhandler+0x11e>
    if (usart_priv->cb_event) {
    365e:	03800793          	li	a5,56
    3662:	02f407b3          	mul	a5,s0,a5
    3666:	4682                	lw	a3,0(sp)
    3668:	97b6                	add	a5,a5,a3
    366a:	4794                	lw	a3,8(a5)
    366c:	c691                	beqz	a3,3678 <wj_usi_usart_irqhandler+0x15e>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    366e:	5bc8                	lw	a0,52(a5)
    3670:	45b9                	li	a1,14
    3672:	c43a                	sw	a4,8(sp)
    3674:	9682                	jalr	a3
    3676:	bfa1                	j	35ce <wj_usi_usart_irqhandler+0xb4>
        wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3678:	439c                	lw	a5,0(a5)
        addr->USI_EN &= ~USI_RX_FIFO_EN;
    367a:	4394                	lw	a3,0(a5)
    367c:	9add                	andi	a3,a3,-9
    367e:	c394                	sw	a3,0(a5)
        addr->USI_EN |= USI_RX_FIFO_EN;
    3680:	4394                	lw	a3,0(a5)
    3682:	0086e693          	ori	a3,a3,8
    3686:	c394                	sw	a3,0(a5)
    3688:	b7a1                	j	35d0 <wj_usi_usart_irqhandler+0xb6>

0000368a <drv_usi_usart_putchar>:
  \return      error code
*/
int32_t drv_usi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    368a:	4118                	lw	a4,0(a0)
    //addr->USI_EN = 0xb;
    //addr->USI_EN = 0xf;
    addr->USI_TX_RX_FIFO = ch;
    368c:	c70c                	sw	a1,8(a4)

    while (!(addr->USI_FIFO_STA & 0x1));
    368e:	475c                	lw	a5,12(a4)
    3690:	8b85                	andi	a5,a5,1
    3692:	dff5                	beqz	a5,368e <drv_usi_usart_putchar+0x4>

    return 0;
}
    3694:	4501                	li	a0,0
    3696:	8082                	ret

00003698 <drv_usi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event event call back function \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t drv_usi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    3698:	1111                	addi	sp,sp,-28
    369a:	c02e                	sw	a1,0(sp)
    //initialize instace
    uint32_t base;
    uint32_t irq;
    void *handler;

    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    369c:	0074                	addi	a3,sp,12
    369e:	0030                	addi	a2,sp,8
    36a0:	004c                	addi	a1,sp,4
{
    36a2:	c826                	sw	s1,16(sp)
    36a4:	cc06                	sw	ra,24(sp)
    36a6:	ca22                	sw	s0,20(sp)
    36a8:	84aa                	mv	s1,a0
    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    36aa:	2269                	jal	3834 <target_usi_usart_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    36ac:	4709                	li	a4,2
    36ae:	00a77963          	bgeu	a4,a0,36c0 <drv_usi_usart_initialize+0x28>
        return NULL;
    36b2:	4401                	li	s0,0
    addr->USI_MODE_SEL = USI_MODE_UART;
    drv_irq_register(usart_priv->irq, handler);
    drv_irq_enable(usart_priv->irq);

    return usart_priv;
}
    36b4:	40e2                	lw	ra,24(sp)
    36b6:	8522                	mv	a0,s0
    36b8:	4452                	lw	s0,20(sp)
    36ba:	44c2                	lw	s1,16(sp)
    36bc:	0171                	addi	sp,sp,28
    36be:	8082                	ret
    ret = drv_usi_initialize(idx);
    36c0:	8526                	mv	a0,s1
    36c2:	f50ff0ef          	jal	ra,2e12 <drv_usi_initialize>
    if (ret < 0) {
    36c6:	fe0546e3          	bltz	a0,36b2 <drv_usi_usart_initialize+0x1a>
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    36ca:	03800413          	li	s0,56
    36ce:	02848733          	mul	a4,s1,s0
    usart_priv->irq = irq;
    36d2:	47a2                	lw	a5,8(sp)
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    36d4:	20002437          	lui	s0,0x20002
    36d8:	8bc40413          	addi	s0,s0,-1860 # 200018bc <usi_usart_instance>
    usart_priv->base = base;
    36dc:	4512                	lw	a0,4(sp)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    36de:	45c1                	li	a1,16
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    36e0:	943a                	add	s0,s0,a4
    usart_priv->irq = irq;
    36e2:	c05c                	sw	a5,4(s0)
    usart_priv->cb_event = cb_event;
    36e4:	4782                	lw	a5,0(sp)
    usart_priv->base = base;
    36e6:	c008                	sw	a0,0(s0)
    usart_priv->idx = idx;
    36e8:	d844                	sw	s1,52(s0)
    usart_priv->cb_event = cb_event;
    36ea:	c41c                	sw	a5,8(s0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    36ec:	6785                	lui	a5,0x1
    36ee:	f9878793          	addi	a5,a5,-104 # f98 <__divdf3+0xee>
    addr->USI_EN = 0x0;
    36f2:	00052023          	sw	zero,0(a0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    36f6:	cd7c                	sw	a5,92(a0)
    addr->USI_INTR_EN = WJ_UART_INT_ENABLE_DEFAUL;
    36f8:	c93c                	sw	a5,80(a0)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    36fa:	c02a                	sw	a0,0(sp)
    36fc:	e9cff0ef          	jal	ra,2d98 <wj_usi_set_rxfifo_th>
    addr->USI_MODE_SEL = USI_MODE_UART;
    3700:	4502                	lw	a0,0(sp)
    drv_irq_register(usart_priv->irq, handler);
    3702:	45b2                	lw	a1,12(sp)
    addr->USI_MODE_SEL = USI_MODE_UART;
    3704:	00052223          	sw	zero,4(a0)
    drv_irq_register(usart_priv->irq, handler);
    3708:	4048                	lw	a0,4(s0)
    370a:	e7eff0ef          	jal	ra,2d88 <drv_irq_register>
    drv_irq_enable(usart_priv->irq);
    370e:	4048                	lw	a0,4(s0)
    3710:	e5cff0ef          	jal	ra,2d6c <drv_irq_enable>
    return usart_priv;
    3714:	b745                	j	36b4 <drv_usi_usart_initialize+0x1c>

00003716 <drv_usi_usart_config>:
                             uint32_t baud,
                             usart_mode_e mode,
                             usart_parity_e parity,
                             usart_stop_bits_e stopbits,
                             usart_data_bits_e bits)
{
    3716:	1111                	addi	sp,sp,-28
    3718:	c826                	sw	s1,16(sp)
    int32_t ret;
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    371a:	4104                	lw	s1,0(a0)
{
    371c:	ca22                	sw	s0,20(sp)
    371e:	cc06                	sw	ra,24(sp)

    addr->USI_EN = 0x0;
    3720:	0004a023          	sw	zero,0(s1)
{
    3724:	842a                	mv	s0,a0
    3726:	c032                	sw	a2,0(sp)
    3728:	c636                	sw	a3,12(sp)
    372a:	c23a                	sw	a4,4(sp)
    372c:	c43e                	sw	a5,8(sp)
    /* control the data_bit of the usart*/
    ret = drv_usi_usart_config_baudrate(handle, baud);
    372e:	31b1                	jal	337a <drv_usi_usart_config_baudrate>

    if (ret < 0) {
    3730:	02054a63          	bltz	a0,3764 <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control the parity of the usart*/
    ret = drv_usi_usart_config_parity(handle, parity);
    3734:	46b2                	lw	a3,12(sp)
    3736:	8522                	mv	a0,s0
    3738:	85b6                	mv	a1,a3
    373a:	316d                	jal	33e4 <drv_usi_usart_config_parity>

    if (ret < 0) {
    373c:	02054463          	bltz	a0,3764 <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control mode of the usart*/
    ret = drv_usi_usart_config_mode(handle, mode);
    3740:	4582                	lw	a1,0(sp)
    3742:	8522                	mv	a0,s0
    3744:	39ad                	jal	33be <drv_usi_usart_config_mode>

    if (ret < 0) {
    3746:	00054f63          	bltz	a0,3764 <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control the stopbit of the usart*/
    ret = drv_usi_usart_config_stopbits(handle, stopbits);
    374a:	4592                	lw	a1,4(sp)
    374c:	8522                	mv	a0,s0
    374e:	39e5                	jal	3446 <drv_usi_usart_config_stopbits>

    if (ret < 0) {
    3750:	00054a63          	bltz	a0,3764 <drv_usi_usart_config+0x4e>
        return ret;
    }

    ret = drv_usi_usart_config_databits(handle, bits);
    3754:	45a2                	lw	a1,8(sp)
    3756:	8522                	mv	a0,s0
    3758:	33b9                	jal	34a6 <drv_usi_usart_config_databits>

    if (ret < 0) {
    375a:	00054563          	bltz	a0,3764 <drv_usi_usart_config+0x4e>
        return ret;
    }

    addr->USI_EN = 0xf;
    375e:	47bd                	li	a5,15
    3760:	c09c                	sw	a5,0(s1)
    return 0;
    3762:	4501                	li	a0,0
}
    3764:	40e2                	lw	ra,24(sp)
    3766:	4452                	lw	s0,20(sp)
    3768:	44c2                	lw	s1,16(sp)
    376a:	0171                	addi	sp,sp,28
    376c:	8082                	ret

0000376e <csi_usart_putchar>:
  \param[in]   ch  the input character
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    return drv_usi_usart_putchar(handle, ch);
    376e:	bf31                	j	368a <drv_usi_usart_putchar>

00003770 <csi_usart_initialize>:
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    return drv_usi_usart_initialize(idx, cb_event);
    3770:	b725                	j	3698 <drv_usi_usart_initialize>

00003772 <csi_usart_config>:
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    return drv_usi_usart_config(handle, baud, mode, parity, stopbits, bits);
    3772:	b755                	j	3716 <drv_usi_usart_config>

00003774 <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_timer_count()) {
    3774:	47bd                	li	a5,15
    3776:	04a7c263          	blt	a5,a0,37ba <target_get_timer+0x46>
        return -1;
    }

    if (base != NULL) {
    377a:	00058b63          	beqz	a1,3790 <target_get_timer+0x1c>
        *base = sg_timer_config[idx].base;
    377e:	47b1                	li	a5,12
    3780:	02f50733          	mul	a4,a0,a5
    3784:	6799                	lui	a5,0x6
    3786:	84878793          	addi	a5,a5,-1976 # 5848 <sg_timer_config>
    378a:	97ba                	add	a5,a5,a4
    378c:	439c                	lw	a5,0(a5)
    378e:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3790:	ca11                	beqz	a2,37a4 <target_get_timer+0x30>
        *irq = sg_timer_config[idx].irq;
    3792:	47b1                	li	a5,12
    3794:	02f50733          	mul	a4,a0,a5
    3798:	6799                	lui	a5,0x6
    379a:	84878793          	addi	a5,a5,-1976 # 5848 <sg_timer_config>
    379e:	97ba                	add	a5,a5,a4
    37a0:	43dc                	lw	a5,4(a5)
    37a2:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    37a4:	ce81                	beqz	a3,37bc <target_get_timer+0x48>
        *handler = sg_timer_config[idx].handler;
    37a6:	47b1                	li	a5,12
    37a8:	02f50733          	mul	a4,a0,a5
    37ac:	6799                	lui	a5,0x6
    37ae:	84878793          	addi	a5,a5,-1976 # 5848 <sg_timer_config>
    37b2:	97ba                	add	a5,a5,a4
    37b4:	479c                	lw	a5,8(a5)
    37b6:	c29c                	sw	a5,0(a3)
    37b8:	8082                	ret
        return -1;
    37ba:	557d                	li	a0,-1
    }

    return idx;
}
    37bc:	8082                	ret

000037be <target_gpio_port_init>:
    int32_t    gpio_pin;
    uint32_t cfg_idx;
} gpio_pin_map_t;

int32_t target_gpio_port_init(port_name_e port, uint32_t *base, uint32_t *irq, void **handler, uint32_t *pin_num)
{
    37be:	87aa                	mv	a5,a0
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
        return -1;
    37c0:	557d                	li	a0,-1
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
    37c2:	c595                	beqz	a1,37ee <target_gpio_port_init+0x30>
    37c4:	02060563          	beqz	a2,37ee <target_gpio_port_init+0x30>
    37c8:	02068363          	beqz	a3,37ee <target_gpio_port_init+0x30>
    37cc:	02070163          	beqz	a4,37ee <target_gpio_port_init+0x30>
    }

    if (sg_gpio_config[0].port == port) {
    37d0:	00079f63          	bnez	a5,37ee <target_gpio_port_init+0x30>
        if (base != NULL) {
            *base = sg_gpio_config[0].base;
    37d4:	600187b7          	lui	a5,0x60018
    37d8:	c19c                	sw	a5,0(a1)
        }

        if (irq != NULL) {
            *irq = sg_gpio_config[0].irq;
    37da:	47c1                	li	a5,16
    37dc:	c21c                	sw	a5,0(a2)
        }

        if (pin_num != NULL) {
            *pin_num = sg_gpio_config[0].pin_num;
    37de:	47fd                	li	a5,31
    37e0:	c31c                	sw	a5,0(a4)
        }

        if (handler != NULL) {
            *handler = (void *)GPIO0_IRQHandler;
    37e2:	6791                	lui	a5,0x4
    37e4:	c9c78793          	addi	a5,a5,-868 # 3c9c <GPIO0_IRQHandler>
    37e8:	c29c                	sw	a5,0(a3)
        }

        return 0;
    37ea:	4501                	li	a0,0
    37ec:	8082                	ret
    }

    return -1;
}
    37ee:	8082                	ret

000037f0 <target_gpio_pin_init>:

int32_t target_gpio_pin_init(int32_t gpio_pin, uint32_t *port_idx)
{
    *port_idx = 0;
    37f0:	0005a023          	sw	zero,0(a1)

    if (gpio_pin >= PA0 && gpio_pin <= PA31) {
    37f4:	47fd                	li	a5,31
    37f6:	00a7f363          	bgeu	a5,a0,37fc <target_gpio_pin_init+0xc>
        return gpio_pin;
    }

    return -1;
    37fa:	557d                	li	a0,-1
}
    37fc:	8082                	ret

000037fe <target_usi_init>:
    {WJ_USI2_BASE, USI2_IRQn, USI2_IRQHandler},
};

int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_USI_NUM) {
    37fe:	4789                	li	a5,2
    3800:	02a7c863          	blt	a5,a0,3830 <target_usi_init+0x32>
        return -1;
    }

    if (base != NULL) {
    3804:	00058b63          	beqz	a1,381a <target_usi_init+0x1c>
        *base = sg_usi_config[idx].base;
    3808:	47b1                	li	a5,12
    380a:	02f50733          	mul	a4,a0,a5
    380e:	6799                	lui	a5,0x6
    3810:	90878793          	addi	a5,a5,-1784 # 5908 <sg_usi_config>
    3814:	97ba                	add	a5,a5,a4
    3816:	439c                	lw	a5,0(a5)
    3818:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    381a:	ce01                	beqz	a2,3832 <target_usi_init+0x34>
        *irq = sg_usi_config[idx].irq;
    381c:	47b1                	li	a5,12
    381e:	02f50733          	mul	a4,a0,a5
    3822:	6799                	lui	a5,0x6
    3824:	90878793          	addi	a5,a5,-1784 # 5908 <sg_usi_config>
    3828:	97ba                	add	a5,a5,a4
    382a:	43dc                	lw	a5,4(a5)
    382c:	c21c                	sw	a5,0(a2)
    382e:	8082                	ret
        return -1;
    3830:	557d                	li	a0,-1
    }

    return idx;
}
    3832:	8082                	ret

00003834 <target_usi_usart_init>:

int32_t target_usi_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_SPI_NUM) {
    3834:	4789                	li	a5,2
    3836:	04a7c263          	blt	a5,a0,387a <target_usi_usart_init+0x46>
        return -1;
    }

    if (base != NULL) {
    383a:	00058b63          	beqz	a1,3850 <target_usi_usart_init+0x1c>
        *base = sg_usi_config[idx].base;
    383e:	47b1                	li	a5,12
    3840:	02f50733          	mul	a4,a0,a5
    3844:	6799                	lui	a5,0x6
    3846:	90878793          	addi	a5,a5,-1784 # 5908 <sg_usi_config>
    384a:	97ba                	add	a5,a5,a4
    384c:	439c                	lw	a5,0(a5)
    384e:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3850:	ca11                	beqz	a2,3864 <target_usi_usart_init+0x30>
        *irq = sg_usi_config[idx].irq;
    3852:	47b1                	li	a5,12
    3854:	02f50733          	mul	a4,a0,a5
    3858:	6799                	lui	a5,0x6
    385a:	90878793          	addi	a5,a5,-1784 # 5908 <sg_usi_config>
    385e:	97ba                	add	a5,a5,a4
    3860:	43dc                	lw	a5,4(a5)
    3862:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    3864:	ce81                	beqz	a3,387c <target_usi_usart_init+0x48>
        *handler = sg_usi_config[idx].handler;
    3866:	47b1                	li	a5,12
    3868:	02f50733          	mul	a4,a0,a5
    386c:	6799                	lui	a5,0x6
    386e:	90878793          	addi	a5,a5,-1784 # 5908 <sg_usi_config>
    3872:	97ba                	add	a5,a5,a4
    3874:	479c                	lw	a5,8(a5)
    3876:	c29c                	sw	a5,0(a3)
    3878:	8082                	ret
        return -1;
    387a:	557d                	li	a0,-1
    }

    return idx;
}
    387c:	8082                	ret

0000387e <gpio_set_direction>:
    void *port,
    gpio_direction_e direction
)
{
    wj_oip_gpio_priv_t *gpio_priv = port;
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    387e:	4118                	lw	a4,0(a0)

    if (direction == GPIO_DIRECTION_INPUT) {
    3880:	e989                	bnez	a1,3892 <gpio_set_direction+0x14>
        gpio_reg->SWPORT_DDR &= (~gpio_priv->mask);
    3882:	495c                	lw	a5,20(a0)
    3884:	4354                	lw	a3,4(a4)
    3886:	fff7c793          	not	a5,a5
    388a:	8ff5                	and	a5,a5,a3
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    388c:	c35c                	sw	a5,4(a4)
    } else {
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    }

    return 0;
    388e:	4501                	li	a0,0
    3890:	8082                	ret
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
    3892:	4785                	li	a5,1
    3894:	00f59663          	bne	a1,a5,38a0 <gpio_set_direction+0x22>
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    3898:	435c                	lw	a5,4(a4)
    389a:	4954                	lw	a3,20(a0)
    389c:	8fd5                	or	a5,a5,a3
    389e:	b7fd                	j	388c <gpio_set_direction+0xe>
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    38a0:	81010537          	lui	a0,0x81010
    38a4:	08750513          	addi	a0,a0,135 # 81010087 <__heap_end+0x60fe0087>
}
    38a8:	8082                	ret

000038aa <wj_oip_gpio_irqhandler>:
    gpio_control_reg->INTEN = val;
}

void wj_oip_gpio_irqhandler(int idx)
{
    if (idx >= CONFIG_GPIO_NUM) {
    38aa:	06a04e63          	bgtz	a0,3926 <wj_oip_gpio_irqhandler+0x7c>
        return;
    }

    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    38ae:	46f1                	li	a3,28
    38b0:	02d50533          	mul	a0,a0,a3
    38b4:	20002737          	lui	a4,0x20002
    38b8:	96470793          	addi	a5,a4,-1692 # 20001964 <gpio_handle>
{
    38bc:	1141                	addi	sp,sp,-16
    38be:	c422                	sw	s0,8(sp)
    38c0:	20002437          	lui	s0,0x20002
    38c4:	c226                	sw	s1,4(sp)
    38c6:	c606                	sw	ra,12(sp)
    38c8:	98040413          	addi	s0,s0,-1664 # 20001980 <gpio_pin_handle>

    uint32_t value = gpio_control_reg->INTSTATUS;
    38cc:	4481                	li	s1,0
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    38ce:	953e                	add	a0,a0,a5
    38d0:	411c                	lw	a5,0(a0)
    uint32_t value = gpio_control_reg->INTSTATUS;
    38d2:	96470713          	addi	a4,a4,-1692
    38d6:	43b0                	lw	a2,64(a5)
    uint8_t i;

    /* find the interrput pin */
    for (i = 0; i < 32; i++) {
        if (value & (1U << i)) {
    38d8:	4685                	li	a3,1
    38da:	009696b3          	sll	a3,a3,s1
    38de:	00c6f7b3          	and	a5,a3,a2
    38e2:	c79d                	beqz	a5,3910 <wj_oip_gpio_irqhandler+0x66>
                for (j = 0; j < idx; j++) {
                    pin_idx += gpio_handle[j].pin_num;
                }
            }

            if (pin_idx >= CONFIG_GPIO_PIN_NUM) {
    38e4:	47fd                	li	a5,31
    38e6:	02f48b63          	beq	s1,a5,391c <wj_oip_gpio_irqhandler+0x72>
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    38ea:	00044783          	lbu	a5,0(s0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    38ee:	45f1                	li	a1,28
    38f0:	02b787b3          	mul	a5,a5,a1
    38f4:	97ba                	add	a5,a5,a4
    38f6:	439c                	lw	a5,0(a5)
    gpio_control_reg->PORTA_EOI = idx;
    38f8:	c7f4                	sw	a3,76(a5)
            wj_oip_gpio_pin_priv_t *gpio_pin_priv = (wj_oip_gpio_pin_priv_t *)&gpio_pin_handle[pin_idx];

            gpio_irq_clear(gpio_pin_priv, (1 << i));  //clear the gpio interrupt

            /* execute the callback function */
            if ((gpio_event_cb_t)(gpio_pin_priv->cb)) {
    38fa:	405c                	lw	a5,4(s0)
    38fc:	cb91                	beqz	a5,3910 <wj_oip_gpio_irqhandler+0x66>
                ((gpio_event_cb_t)(gpio_pin_priv->cb))(gpio_pin_priv->offset);
    38fe:	00244503          	lbu	a0,2(s0)
    3902:	c032                	sw	a2,0(sp)
    3904:	9782                	jalr	a5
    3906:	4602                	lw	a2,0(sp)
    3908:	200027b7          	lui	a5,0x20002
    390c:	96478713          	addi	a4,a5,-1692 # 20001964 <gpio_handle>
    for (i = 0; i < 32; i++) {
    3910:	0485                	addi	s1,s1,1
    3912:	02000793          	li	a5,32
    3916:	0421                	addi	s0,s0,8
    3918:	fcf490e3          	bne	s1,a5,38d8 <wj_oip_gpio_irqhandler+0x2e>
            }
        }
    }
}
    391c:	40b2                	lw	ra,12(sp)
    391e:	4422                	lw	s0,8(sp)
    3920:	4492                	lw	s1,4(sp)
    3922:	0141                	addi	sp,sp,16
    3924:	8082                	ret
    3926:	8082                	ret

00003928 <csi_gpio_port_initialize>:
                3.get gpio_port_handle
  \param[in]   port      port_name.
  \return      gpio_port_handle
*/
gpio_port_handle_t csi_gpio_port_initialize(int32_t port)
{
    3928:	1111                	addi	sp,sp,-28
    /* obtain the gpio port information */
    uint32_t base = 0u;
    uint32_t pin_num;
    uint32_t irq;
    void *handler;
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    392a:	0058                	addi	a4,sp,4
    392c:	0074                	addi	a3,sp,12
    392e:	0030                	addi	a2,sp,8
    3930:	858a                	mv	a1,sp
{
    3932:	cc06                	sw	ra,24(sp)
    3934:	ca22                	sw	s0,20(sp)
    3936:	c826                	sw	s1,16(sp)
    uint32_t base = 0u;
    3938:	c002                	sw	zero,0(sp)
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    393a:	3551                	jal	37be <target_gpio_port_init>

    if (idx < 0 || idx >= CONFIG_GPIO_NUM) {
    393c:	e905                	bnez	a0,396c <csi_gpio_port_initialize+0x44>
        return NULL;
    }

    gpio_priv = &gpio_handle[idx];

    gpio_priv->base = base;
    393e:	4782                	lw	a5,0(sp)
    3940:	20002437          	lui	s0,0x20002
    3944:	96440493          	addi	s1,s0,-1692 # 20001964 <gpio_handle>
    gpio_priv->irq  = irq;
    3948:	4522                	lw	a0,8(sp)

#ifdef CONFIG_LPM
    csi_gpio_power_control(gpio_priv, DRV_POWER_FULL);
#endif

    drv_irq_register(gpio_priv->irq, handler);
    394a:	45b2                	lw	a1,12(sp)
    gpio_priv->base = base;
    394c:	c09c                	sw	a5,0(s1)
    gpio_priv->pin_num  = pin_num;
    394e:	4792                	lw	a5,4(sp)
    gpio_priv->irq  = irq;
    3950:	c0c8                	sw	a0,4(s1)
    gpio_priv->pin_num  = pin_num;
    3952:	c49c                	sw	a5,8(s1)
    drv_irq_register(gpio_priv->irq, handler);
    3954:	c34ff0ef          	jal	ra,2d88 <drv_irq_register>
    drv_irq_enable(gpio_priv->irq);
    3958:	40c8                	lw	a0,4(s1)
    395a:	c12ff0ef          	jal	ra,2d6c <drv_irq_enable>

    return (gpio_port_handle_t)gpio_priv;
    395e:	96440513          	addi	a0,s0,-1692
}
    3962:	40e2                	lw	ra,24(sp)
    3964:	4452                	lw	s0,20(sp)
    3966:	44c2                	lw	s1,16(sp)
    3968:	0171                	addi	sp,sp,28
    396a:	8082                	ret
        return NULL;
    396c:	4501                	li	a0,0
    396e:	bfd5                	j	3962 <csi_gpio_port_initialize+0x3a>

00003970 <csi_gpio_pin_initialize>:
  \return      gpio_pin_handle
*/
gpio_pin_handle_t csi_gpio_pin_initialize(int32_t gpio_pin, gpio_event_cb_t cb_event)
{

    if (gpio_pin < 0 || gpio_pin >= CONFIG_GPIO_PIN_NUM) {
    3970:	47f9                	li	a5,30
    3972:	00a7f463          	bgeu	a5,a0,397a <csi_gpio_pin_initialize+0xa>
        return NULL;
    3976:	4501                	li	a0,0
    gpio_pin_priv->idx = pin_idx;
    gpio_pin_priv->cb = cb_event;
    gpio_pin_priv->offset = gpio_pin;

    return (gpio_pin_handle_t)gpio_pin_priv;
}
    3978:	8082                	ret
{
    397a:	1141                	addi	sp,sp,-16
    397c:	c422                	sw	s0,8(sp)
    397e:	842a                	mv	s0,a0
        csi_gpio_port_initialize(i);
    3980:	4501                	li	a0,0
{
    3982:	c606                	sw	ra,12(sp)
    3984:	c226                	sw	s1,4(sp)
    3986:	84ae                	mv	s1,a1
        csi_gpio_port_initialize(i);
    3988:	3745                	jal	3928 <csi_gpio_port_initialize>
    int32_t pin_idx = target_gpio_pin_init(gpio_pin, &port_idx);
    398a:	858a                	mv	a1,sp
    398c:	8522                	mv	a0,s0
    398e:	358d                	jal	37f0 <target_gpio_pin_init>
    3990:	872a                	mv	a4,a0
        return NULL;
    3992:	4501                	li	a0,0
    if (pin_idx < 0) {
    3994:	02074963          	bltz	a4,39c6 <csi_gpio_pin_initialize+0x56>
    for (i = 0; i < port_idx; i++) {
    3998:	4602                	lw	a2,0(sp)
    399a:	87ba                	mv	a5,a4
    399c:	c611                	beqz	a2,39a8 <csi_gpio_pin_initialize+0x38>
        idx += (gpio_handle[i].pin_num);
    399e:	200027b7          	lui	a5,0x20002
    39a2:	96c7a783          	lw	a5,-1684(a5) # 2000196c <gpio_handle+0x8>
    39a6:	97ba                	add	a5,a5,a4
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = &(gpio_pin_handle[idx]);
    39a8:	00379693          	slli	a3,a5,0x3
    39ac:	200027b7          	lui	a5,0x20002
    39b0:	98078793          	addi	a5,a5,-1664 # 20001980 <gpio_pin_handle>
    39b4:	00d78533          	add	a0,a5,a3
    gpio_pin_priv->portidx = port_idx;
    39b8:	00c50023          	sb	a2,0(a0)
    gpio_pin_priv->idx = pin_idx;
    39bc:	00e500a3          	sb	a4,1(a0)
    gpio_pin_priv->cb = cb_event;
    39c0:	c144                	sw	s1,4(a0)
    gpio_pin_priv->offset = gpio_pin;
    39c2:	00850123          	sb	s0,2(a0)
}
    39c6:	40b2                	lw	ra,12(sp)
    39c8:	4422                	lw	s0,8(sp)
    39ca:	4492                	lw	s1,4(sp)
    39cc:	0141                	addi	sp,sp,16
    39ce:	8082                	ret

000039d0 <csi_gpio_pin_config_mode>:
  \param[in]   mode      \ref gpio_mode_e
  \return      error code
*/
int32_t csi_gpio_pin_config_mode(gpio_pin_handle_t handle,
                                 gpio_mode_e mode)
{
    39d0:	862e                	mv	a2,a1
    GPIO_NULL_PARAM_CHK(handle);
    39d2:	c511                	beqz	a0,39de <csi_gpio_pin_config_mode+0xe>
    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    uint8_t offset = gpio_pin_priv->idx;

    int32_t ret = drv_pin_config_mode(gpio_pin_priv->portidx, offset, mode);
    39d4:	00154583          	lbu	a1,1(a0)
    39d8:	00054503          	lbu	a0,0(a0)
    39dc:	ae31                	j	3cf8 <drv_pin_config_mode>

    return ret;
}
    39de:	81010537          	lui	a0,0x81010
    39e2:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    39e6:	8082                	ret

000039e8 <csi_gpio_pin_config_direction>:
  \param[in]   dir       \ref gpio_direction_e
  \return      error code
*/
int32_t csi_gpio_pin_config_direction(gpio_pin_handle_t handle,
                                      gpio_direction_e dir)
{
    39e8:	872a                	mv	a4,a0
    GPIO_NULL_PARAM_CHK(handle);
    39ea:	c11d                	beqz	a0,3a10 <csi_gpio_pin_config_direction+0x28>

    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *gpio_priv = &gpio_handle[gpio_pin_priv->portidx];
    39ec:	00054503          	lbu	a0,0(a0)

    gpio_priv->dir = dir;
    39f0:	47f1                	li	a5,28
    39f2:	02f50533          	mul	a0,a0,a5
    39f6:	200027b7          	lui	a5,0x20002
    39fa:	96478793          	addi	a5,a5,-1692 # 20001964 <gpio_handle>
    39fe:	953e                	add	a0,a0,a5
    3a00:	c90c                	sw	a1,16(a0)
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    3a02:	00174703          	lbu	a4,1(a4)
    3a06:	4785                	li	a5,1
    3a08:	00e797b3          	sll	a5,a5,a4
    3a0c:	c95c                	sw	a5,20(a0)

    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    3a0e:	bd85                	j	387e <gpio_set_direction>
    if (ret) {
        return ret;
    }

    return 0;
}
    3a10:	81010537          	lui	a0,0x81010
    3a14:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    3a18:	8082                	ret

00003a1a <csi_gpio_pin_write>:
  \param[in]   value     the value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value)
{
    GPIO_NULL_PARAM_CHK(handle);
    3a1a:	cd05                	beqz	a0,3a52 <csi_gpio_pin_write+0x38>

    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    3a1c:	00054703          	lbu	a4,0(a0)

    uint8_t offset = gpio_pin_priv->idx;
    uint32_t port_value = value << offset;

    port_handle->value = port_value;
    3a20:	46f1                	li	a3,28
    uint32_t port_value = value << offset;
    3a22:	00154603          	lbu	a2,1(a0)
    port_handle->value = port_value;
    3a26:	02d706b3          	mul	a3,a4,a3
    3a2a:	20002737          	lui	a4,0x20002
    3a2e:	96470713          	addi	a4,a4,-1692 # 20001964 <gpio_handle>
    uint32_t port_value = value << offset;
    3a32:	00c595b3          	sll	a1,a1,a2
    gpio_write(port_handle, (1 << offset));
    3a36:	4785                	li	a5,1
    3a38:	00c797b3          	sll	a5,a5,a2
    value &= ~(mask);
    3a3c:	fff7c793          	not	a5,a5

    return 0;
    3a40:	4501                	li	a0,0
    port_handle->value = port_value;
    3a42:	9736                	add	a4,a4,a3
    3a44:	cf0c                	sw	a1,24(a4)
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3a46:	4318                	lw	a4,0(a4)
    uint32_t value = gpio_reg->SWPORT_DR;
    3a48:	4314                	lw	a3,0(a4)
    value &= ~(mask);
    3a4a:	8ff5                	and	a5,a5,a3
    value |= gpio_priv->value;
    3a4c:	8ddd                	or	a1,a1,a5
    gpio_reg->SWPORT_DR = value;
    3a4e:	c30c                	sw	a1,0(a4)
    return 0;
    3a50:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3a52:	81010537          	lui	a0,0x81010
    3a56:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>

}
    3a5a:	8082                	ret

00003a5c <wj_oip_timer_irqhandler>:
}

void wj_oip_timer_irqhandler(int idx)
{
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->timeout_flag = 1;
    3a5c:	47e1                	li	a5,24
    3a5e:	02f50733          	mul	a4,a0,a5
    3a62:	200027b7          	lui	a5,0x20002
    3a66:	a7878793          	addi	a5,a5,-1416 # 20001a78 <timer_instance>
    3a6a:	97ba                	add	a5,a5,a4
    3a6c:	4705                	li	a4,1
    3a6e:	cbd8                	sw	a4,20(a5)

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3a70:	43d8                	lw	a4,4(a5)

    addr->TxEOI;

    if (timer_priv->cb_event) {
    3a72:	47dc                	lw	a5,12(a5)
    addr->TxEOI;
    3a74:	4758                	lw	a4,12(a4)
    if (timer_priv->cb_event) {
    3a76:	c399                	beqz	a5,3a7c <wj_oip_timer_irqhandler+0x20>
        return timer_priv->cb_event(idx, TIMER_EVENT_TIMEOUT);
    3a78:	4581                	li	a1,0
    3a7a:	8782                	jr	a5
    }

}
    3a7c:	8082                	ret

00003a7e <csi_timer_initialize>:
  \param[in]   idx  instance timer index
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    3a7e:	1111                	addi	sp,sp,-28
    3a80:	cc06                	sw	ra,24(sp)
    3a82:	ca22                	sw	s0,20(sp)
    3a84:	c826                	sw	s1,16(sp)
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    3a86:	47bd                	li	a5,15
    3a88:	00a7f963          	bgeu	a5,a0,3a9a <csi_timer_initialize+0x1c>
        return NULL;
    3a8c:	4401                	li	s0,0
        drv_irq_register(timer_priv->irq, handler);
        drv_irq_enable(timer_priv->irq);
    }

    return (timer_handle_t)timer_priv;
}
    3a8e:	40e2                	lw	ra,24(sp)
    3a90:	8522                	mv	a0,s0
    3a92:	4452                	lw	s0,20(sp)
    3a94:	44c2                	lw	s1,16(sp)
    3a96:	0171                	addi	sp,sp,28
    3a98:	8082                	ret
    3a9a:	84ae                	mv	s1,a1
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    3a9c:	0074                	addi	a3,sp,12
    3a9e:	0030                	addi	a2,sp,8
    3aa0:	004c                	addi	a1,sp,4
    3aa2:	c02a                	sw	a0,0(sp)
    uint32_t base = 0u;
    3aa4:	c202                	sw	zero,4(sp)
    uint32_t irq = 0u;
    3aa6:	c402                	sw	zero,8(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    3aa8:	31f1                	jal	3774 <target_get_timer>
    if (real_idx != idx) {
    3aaa:	4702                	lw	a4,0(sp)
    3aac:	fea710e3          	bne	a4,a0,3a8c <csi_timer_initialize+0xe>
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    3ab0:	4461                	li	s0,24
    3ab2:	028707b3          	mul	a5,a4,s0
    3ab6:	20002437          	lui	s0,0x20002
    3aba:	a7840413          	addi	s0,s0,-1416 # 20001a78 <timer_instance>
    timer_priv->irq  = irq;
    3abe:	46a2                	lw	a3,8(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ac0:	4501                	li	a0,0
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    3ac2:	943e                	add	s0,s0,a5
    timer_priv->base = base;
    3ac4:	4792                	lw	a5,4(sp)
    timer_priv->irq  = irq;
    3ac6:	c414                	sw	a3,8(s0)
    timer_priv->idx = idx;
    3ac8:	00e40023          	sb	a4,0(s0)
    timer_priv->base = base;
    3acc:	c05c                	sw	a5,4(s0)
    3ace:	c03e                	sw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ad0:	2c25                	jal	3d08 <drv_get_timer_freq>
    3ad2:	577d                	li	a4,-1
    3ad4:	02a75733          	divu	a4,a4,a0
    3ad8:	000f4537          	lui	a0,0xf4
    3adc:	24050513          	addi	a0,a0,576 # f4240 <__ctor_end__+0xedf18>
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3ae0:	4782                	lw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ae2:	02a70733          	mul	a4,a4,a0
    3ae6:	c818                	sw	a4,16(s0)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3ae8:	4798                	lw	a4,8(a5)
    3aea:	01e77693          	andi	a3,a4,30
    3aee:	0087c703          	lbu	a4,8(a5)
    3af2:	9b01                	andi	a4,a4,-32
    3af4:	8f55                	or	a4,a4,a3
    3af6:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_INTMASK;
    3afa:	4798                	lw	a4,8(a5)
    3afc:	8b7d                	andi	a4,a4,31
    3afe:	00476693          	ori	a3,a4,4
    3b02:	0087c703          	lbu	a4,8(a5)
    3b06:	9b01                	andi	a4,a4,-32
    3b08:	8f55                	or	a4,a4,a3
    3b0a:	00e78423          	sb	a4,8(a5)
    timer_priv->cb_event = cb_event;
    3b0e:	c444                	sw	s1,12(s0)
    if (cb_event != NULL) {
    3b10:	dcbd                	beqz	s1,3a8e <csi_timer_initialize+0x10>
        drv_irq_register(timer_priv->irq, handler);
    3b12:	4408                	lw	a0,8(s0)
    3b14:	45b2                	lw	a1,12(sp)
    3b16:	a72ff0ef          	jal	ra,2d88 <drv_irq_register>
        drv_irq_enable(timer_priv->irq);
    3b1a:	4408                	lw	a0,8(s0)
    3b1c:	a50ff0ef          	jal	ra,2d6c <drv_irq_enable>
    3b20:	b7bd                	j	3a8e <csi_timer_initialize+0x10>

00003b22 <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b22:	c511                	beqz	a0,3b2e <csi_timer_config+0xc>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3b24:	415c                	lw	a5,4(a0)

    switch (mode) {
    3b26:	c989                	beqz	a1,3b38 <csi_timer_config+0x16>
    3b28:	4705                	li	a4,1
    3b2a:	02e58c63          	beq	a1,a4,3b62 <csi_timer_config+0x40>
    TIMER_NULL_PARAM_CHK(handle);
    3b2e:	81070537          	lui	a0,0x81070
    3b32:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
    }

    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);

    return 0;
}
    3b36:	8082                	ret
            addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_MODE;
    3b38:	4798                	lw	a4,8(a5)
    3b3a:	01d77693          	andi	a3,a4,29
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b3e:	0087c703          	lbu	a4,8(a5)
    return 0;
    3b42:	4501                	li	a0,0
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b44:	9b01                	andi	a4,a4,-32
    3b46:	8f55                	or	a4,a4,a3
    3b48:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);
    3b4c:	4798                	lw	a4,8(a5)
    3b4e:	8b7d                	andi	a4,a4,31
    3b50:	01076693          	ori	a3,a4,16
    3b54:	0087c703          	lbu	a4,8(a5)
    3b58:	9b01                	andi	a4,a4,-32
    3b5a:	8f55                	or	a4,a4,a3
    3b5c:	00e78423          	sb	a4,8(a5)
    return 0;
    3b60:	8082                	ret
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b62:	4798                	lw	a4,8(a5)
    3b64:	8b7d                	andi	a4,a4,31
    3b66:	00276693          	ori	a3,a4,2
    3b6a:	bfd1                	j	3b3e <csi_timer_config+0x1c>

00003b6c <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b6c:	c501                	beqz	a0,3b74 <csi_timer_set_timeout+0x8>

    wj_oip_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
    3b6e:	c90c                	sw	a1,16(a0)
    return 0;
    3b70:	4501                	li	a0,0
    3b72:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3b74:	81070537          	lui	a0,0x81070
    3b78:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3b7c:	8082                	ret

00003b7e <csi_timer_start>:
  \return      error code
*/

int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b7e:	c545                	beqz	a0,3c26 <csi_timer_start+0xa8>
{
    3b80:	1141                	addi	sp,sp,-16
    3b82:	c606                	sw	ra,12(sp)
    3b84:	c422                	sw	s0,8(sp)
    3b86:	c226                	sw	s1,4(sp)
    3b88:	842a                	mv	s0,a0

    wj_oip_timer_priv_t *timer_priv = handle;

    timer_priv->timeout_flag = 0;
    3b8a:	00052a23          	sw	zero,20(a0)

    uint32_t min_us = drv_get_timer_freq(timer_priv->idx) / 1000000;
    3b8e:	00054503          	lbu	a0,0(a0)
    3b92:	000f44b7          	lui	s1,0xf4
    3b96:	24048493          	addi	s1,s1,576 # f4240 <__ctor_end__+0xedf18>
    3b9a:	22bd                	jal	3d08 <drv_get_timer_freq>
    3b9c:	029544b3          	div	s1,a0,s1
    uint32_t load;

    if (((timer_priv->timeout * drv_get_timer_freq(timer_priv->idx)) / 1000000) > 0xffffffff) {
    3ba0:	00044503          	lbu	a0,0(s0)
    3ba4:	2295                	jal	3d08 <drv_get_timer_freq>
        return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    if (min_us) {
    3ba6:	481c                	lw	a5,16(s0)
        load = (uint32_t)(timer_priv->timeout * min_us);
    3ba8:	02f48533          	mul	a0,s1,a5
    if (min_us) {
    3bac:	e08d                	bnez	s1,3bce <csi_timer_start+0x50>
    } else {
        load = (uint32_t)(((uint64_t)(timer_priv->timeout) * drv_get_timer_freq(timer_priv->idx)) / 1000000);
    3bae:	00044503          	lbu	a0,0(s0)
    3bb2:	c03e                	sw	a5,0(sp)
    3bb4:	2a91                	jal	3d08 <drv_get_timer_freq>
    3bb6:	4782                	lw	a5,0(sp)
    3bb8:	000f4637          	lui	a2,0xf4
    3bbc:	24060613          	addi	a2,a2,576 # f4240 <__ctor_end__+0xedf18>
    3bc0:	4681                	li	a3,0
    3bc2:	02f525b3          	mulhsu	a1,a0,a5
    3bc6:	02a78533          	mul	a0,a5,a0
    3bca:	e2cfc0ef          	jal	ra,1f6 <__udivdi3>
    }

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);

    if (timer_priv->timeout == 0) {
    3bce:	4818                	lw	a4,16(s0)
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3bd0:	405c                	lw	a5,4(s0)
    if (timer_priv->timeout == 0) {
    3bd2:	e729                	bnez	a4,3c1c <csi_timer_start+0x9e>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    3bd4:	577d                	li	a4,-1
    3bd6:	c398                	sw	a4,0(a5)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bd8:	4798                	lw	a4,8(a5)
    }

#endif

    return 0;
}
    3bda:	40b2                	lw	ra,12(sp)
    3bdc:	4422                	lw	s0,8(sp)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bde:	01e77693          	andi	a3,a4,30
    3be2:	0087c703          	lbu	a4,8(a5)
}
    3be6:	4492                	lw	s1,4(sp)
    return 0;
    3be8:	4501                	li	a0,0
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bea:	9b01                	andi	a4,a4,-32
    3bec:	8f55                	or	a4,a4,a3
    3bee:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    3bf2:	4798                	lw	a4,8(a5)
    3bf4:	8b7d                	andi	a4,a4,31
    3bf6:	00176693          	ori	a3,a4,1
    3bfa:	0087c703          	lbu	a4,8(a5)
    3bfe:	9b01                	andi	a4,a4,-32
    3c00:	8f55                	or	a4,a4,a3
    3c02:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    3c06:	4798                	lw	a4,8(a5)
    3c08:	01b77693          	andi	a3,a4,27
    3c0c:	0087c703          	lbu	a4,8(a5)
    3c10:	9b01                	andi	a4,a4,-32
    3c12:	8f55                	or	a4,a4,a3
    3c14:	00e78423          	sb	a4,8(a5)
}
    3c18:	0141                	addi	sp,sp,16
    3c1a:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    3c1c:	4798                	lw	a4,8(a5)
    3c1e:	8b75                	andi	a4,a4,29
    3c20:	db55                	beqz	a4,3bd4 <csi_timer_start+0x56>
            addr->TxLoadCount = load;                           /* load time(us) */
    3c22:	c388                	sw	a0,0(a5)
    3c24:	bf55                	j	3bd8 <csi_timer_start+0x5a>
    TIMER_NULL_PARAM_CHK(handle);
    3c26:	81070537          	lui	a0,0x81070
    3c2a:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3c2e:	8082                	ret

00003c30 <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    3c30:	c901                	beqz	a0,3c40 <csi_timer_get_current_value+0x10>
    TIMER_NULL_PARAM_CHK(value);
    3c32:	00058763          	beqz	a1,3c40 <csi_timer_get_current_value+0x10>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3c36:	415c                	lw	a5,4(a0)

    *value = addr->TxCurrentValue;
    return 0;
    3c38:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    3c3a:	43dc                	lw	a5,4(a5)
    3c3c:	c19c                	sw	a5,0(a1)
    return 0;
    3c3e:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3c40:	81070537          	lui	a0,0x81070
    3c44:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3c48:	8082                	ret

00003c4a <TIM0_IRQHandler>:
}

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(0);
    3c4a:	4501                	li	a0,0
    3c4c:	bd01                	j	3a5c <wj_oip_timer_irqhandler>

00003c4e <TIM1_IRQHandler>:
}

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(1);
    3c4e:	4505                	li	a0,1
    3c50:	b531                	j	3a5c <wj_oip_timer_irqhandler>

00003c52 <TIM2_IRQHandler>:
    CSI_INTRPT_EXIT();
}
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(2);
    3c52:	4509                	li	a0,2
    3c54:	b521                	j	3a5c <wj_oip_timer_irqhandler>

00003c56 <TIM3_IRQHandler>:
}

ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(3);
    3c56:	450d                	li	a0,3
    3c58:	b511                	j	3a5c <wj_oip_timer_irqhandler>

00003c5a <TIM4_IRQHandler>:
}

ATTRIBUTE_ISR void TIM4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(4);
    3c5a:	4511                	li	a0,4
    3c5c:	b501                	j	3a5c <wj_oip_timer_irqhandler>

00003c5e <TIM5_IRQHandler>:
}

ATTRIBUTE_ISR void TIM5_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(5);
    3c5e:	4515                	li	a0,5
    3c60:	bbf5                	j	3a5c <wj_oip_timer_irqhandler>

00003c62 <TIM6_IRQHandler>:
}

ATTRIBUTE_ISR void TIM6_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(6);
    3c62:	4519                	li	a0,6
    3c64:	bbe5                	j	3a5c <wj_oip_timer_irqhandler>

00003c66 <TIM7_IRQHandler>:
}

ATTRIBUTE_ISR void TIM7_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(7);
    3c66:	451d                	li	a0,7
    3c68:	bbd5                	j	3a5c <wj_oip_timer_irqhandler>

00003c6a <TIM8_IRQHandler>:
}

ATTRIBUTE_ISR void TIM8_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(8);
    3c6a:	4521                	li	a0,8
    3c6c:	bbc5                	j	3a5c <wj_oip_timer_irqhandler>

00003c6e <TIM9_IRQHandler>:
}

ATTRIBUTE_ISR void TIM9_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(9);
    3c6e:	4525                	li	a0,9
    3c70:	b3f5                	j	3a5c <wj_oip_timer_irqhandler>

00003c72 <TIM10_IRQHandler>:
}

ATTRIBUTE_ISR void TIM10_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(10);
    3c72:	4529                	li	a0,10
    3c74:	b3e5                	j	3a5c <wj_oip_timer_irqhandler>

00003c76 <TIM11_IRQHandler>:
}

ATTRIBUTE_ISR void TIM11_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(11);
    3c76:	452d                	li	a0,11
    3c78:	b3d5                	j	3a5c <wj_oip_timer_irqhandler>

00003c7a <TIM12_IRQHandler>:
}

ATTRIBUTE_ISR void TIM12_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(12);
    3c7a:	4531                	li	a0,12
    3c7c:	b3c5                	j	3a5c <wj_oip_timer_irqhandler>

00003c7e <TIM13_IRQHandler>:
}

ATTRIBUTE_ISR void TIM13_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(13);
    3c7e:	4535                	li	a0,13
    3c80:	bbf1                	j	3a5c <wj_oip_timer_irqhandler>

00003c82 <TIM14_IRQHandler>:
}

ATTRIBUTE_ISR void TIM14_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(14);
    3c82:	4539                	li	a0,14
    3c84:	bbe1                	j	3a5c <wj_oip_timer_irqhandler>

00003c86 <TIM15_IRQHandler>:
}

ATTRIBUTE_ISR void TIM15_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(15);
    3c86:	453d                	li	a0,15
    3c88:	bbd1                	j	3a5c <wj_oip_timer_irqhandler>

00003c8a <USI0_IRQHandler>:
}

ATTRIBUTE_ISR void USI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(0);
    3c8a:	4501                	li	a0,0
    3c8c:	95aff06f          	j	2de6 <wj_usi_irqhandler>

00003c90 <USI1_IRQHandler>:
}

ATTRIBUTE_ISR void USI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(1);
    3c90:	4505                	li	a0,1
    3c92:	954ff06f          	j	2de6 <wj_usi_irqhandler>

00003c96 <USI2_IRQHandler>:
}

ATTRIBUTE_ISR void USI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(2);
    3c96:	4509                	li	a0,2
    3c98:	94eff06f          	j	2de6 <wj_usi_irqhandler>

00003c9c <GPIO0_IRQHandler>:
}

ATTRIBUTE_ISR void GPIO0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_gpio_irqhandler(0);
    3c9c:	4501                	li	a0,0
    3c9e:	b131                	j	38aa <wj_oip_gpio_irqhandler>

00003ca0 <mdelay>:
    }
}

void mdelay(uint32_t ms)
{
    if (ms == 0) {
    3ca0:	04050b63          	beqz	a0,3cf6 <mdelay+0x56>
{
    3ca4:	1141                	addi	sp,sp,-16
    3ca6:	c422                	sw	s0,8(sp)
    3ca8:	c606                	sw	ra,12(sp)
    3caa:	c226                	sw	s1,4(sp)
    3cac:	fff50413          	addi	s0,a0,-1
  \brief   get CORE timer reload value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_load(void)
{
    return CORET->LOAD;
    3cb0:	e000e6b7          	lui	a3,0xe000e
    3cb4:	4ac4                	lw	s1,20(a3)
  \brief   get CORE timer counter value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_value(void)
{
    return CORET->VAL;
    3cb6:	4e98                	lw	a4,24(a3)
    3cb8:	c03a                	sw	a4,0(sp)
    uint32_t cnt = (drv_get_sys_freq() / 1000);
    3cba:	20a1                	jal	3d02 <drv_get_sys_freq>
    3cbc:	3e800793          	li	a5,1000
    3cc0:	02f54533          	div	a0,a0,a5
            if (load - cur + start > cnt) {
    3cc4:	4702                	lw	a4,0(sp)
    3cc6:	e000e6b7          	lui	a3,0xe000e
    3cca:	94ba                	add	s1,s1,a4
    3ccc:	4e9c                	lw	a5,24(a3)
        if (start > cur) {
    3cce:	00e7ff63          	bgeu	a5,a4,3cec <mdelay+0x4c>
            if (start - cur >= cnt) {
    3cd2:	40f707b3          	sub	a5,a4,a5
    3cd6:	fea7ebe3          	bltu	a5,a0,3ccc <mdelay+0x2c>
    3cda:	147d                	addi	s0,s0,-1
        return;
    }

    while (ms--) {
    3cdc:	57fd                	li	a5,-1
    3cde:	fcf41be3          	bne	s0,a5,3cb4 <mdelay+0x14>
        _mdelay();
    }
}
    3ce2:	40b2                	lw	ra,12(sp)
    3ce4:	4422                	lw	s0,8(sp)
    3ce6:	4492                	lw	s1,4(sp)
    3ce8:	0141                	addi	sp,sp,16
    3cea:	8082                	ret
            if (load - cur + start > cnt) {
    3cec:	40f487b3          	sub	a5,s1,a5
    3cf0:	fcf57ee3          	bgeu	a0,a5,3ccc <mdelay+0x2c>
    3cf4:	b7dd                	j	3cda <mdelay+0x3a>
    3cf6:	8082                	ret

00003cf8 <drv_pin_config_mode>:
}

int32_t drv_pin_config_mode(port_name_e port, uint8_t offset, gpio_mode_e pin_mode)
{
    return 0;
}
    3cf8:	4501                	li	a0,0
    3cfa:	8082                	ret

00003cfc <drv_get_usi_freq>:
    3cfc:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3d00:	8082                	ret

00003d02 <drv_get_sys_freq>:
}

int32_t drv_get_sys_freq(void)
{
    return g_system_clock;
}
    3d02:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3d06:	8082                	ret

00003d08 <drv_get_timer_freq>:
    3d08:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3d0c:	8082                	ret

00003d0e <SystemInit>:
  */
void SystemInit(void)
{
    int i;

    CLIC->CLICCFG = 0x4UL;
    3d0e:	e000e737          	lui	a4,0xe000e
{
    3d12:	1151                	addi	sp,sp,-12
    CLIC->CLICCFG = 0x4UL;
    3d14:	10070713          	addi	a4,a4,256 # e000e100 <__heap_end+0xbffde100>
{
    3d18:	c222                	sw	s0,4(sp)
    CLIC->CLICCFG = 0x4UL;
    3d1a:	7ff70793          	addi	a5,a4,2047
    3d1e:	4691                	li	a3,4
{
    3d20:	c406                	sw	ra,8(sp)
    CLIC->CLICCFG = 0x4UL;
    3d22:	30d780a3          	sb	a3,769(a5)

    for (i = 0; i < 12; i++) {
        CLIC->INTIP[i] = 0;
    3d26:	e000e437          	lui	s0,0xe000e
    for (i = 0; i < 12; i++) {
    3d2a:	4781                	li	a5,0
    3d2c:	46b1                	li	a3,12
        CLIC->INTIP[i] = 0;
    3d2e:	00f70633          	add	a2,a4,a5
    3d32:	00060023          	sb	zero,0(a2)
    for (i = 0; i < 12; i++) {
    3d36:	0785                	addi	a5,a5,1
    3d38:	fed79be3          	bne	a5,a3,3d2e <SystemInit+0x20>
    }

    drv_irq_enable(Machine_Software_IRQn);
    3d3c:	450d                	li	a0,3
    3d3e:	82eff0ef          	jal	ra,2d6c <drv_irq_enable>
  \details Enables IRQ interrupts by setting the IE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_irq(void)
{
    __ASM volatile("csrs mstatus, 8");
    3d42:	30046073          	csrsi	mstatus,8
    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    3d46:	3f75                	jal	3d02 <drv_get_sys_freq>
    3d48:	06400793          	li	a5,100
    3d4c:	02f54533          	div	a0,a0,a5
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
    3d50:	010007b7          	lui	a5,0x1000
    3d54:	157d                	addi	a0,a0,-1
    3d56:	00f57763          	bgeu	a0,a5,3d64 <SystemInit+0x56>
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
    3d5a:	c848                	sw	a0,20(s0)
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    3d5c:	00042c23          	sw	zero,24(s0) # e000e018 <__heap_end+0xbffde018>
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
    3d60:	479d                	li	a5,7
    3d62:	c81c                	sw	a5,16(s0)
#ifdef CONFIG_KERNEL_NONE
    _system_init_for_baremetal();
#else
    _system_init_for_kernel();
#endif
}
    3d64:	4412                	lw	s0,4(sp)
    3d66:	40a2                	lw	ra,8(sp)
    3d68:	0131                	addi	sp,sp,12
    mm_heap_initialize();
    3d6a:	a469                	j	3ff4 <mm_heap_initialize>

00003d6c <trap_c>:
#include <csi_core.h>

void (*trap_c_callback)(void);

void trap_c(uint32_t *regs)
{
    3d6c:	1131                	addi	sp,sp,-20
    3d6e:	c622                	sw	s0,12(sp)
    3d70:	c806                	sw	ra,16(sp)
    3d72:	c426                	sw	s1,8(sp)
    3d74:	842a                	mv	s0,a0
 */
__ALWAYS_STATIC_INLINE uint32_t __get_MCAUSE(void)
{
    uint32_t result;

    __ASM volatile("csrr %0, mcause" : "=r"(result));
    3d76:	342025f3          	csrr	a1,mcause
    int i;
    uint32_t vec = 0;

    vec = __get_MCAUSE() & 0x3FF;

    printf("CPU Exception: NO.%d", vec);
    3d7a:	6519                	lui	a0,0x6
    3d7c:	3ff5f593          	andi	a1,a1,1023
    3d80:	92c50513          	addi	a0,a0,-1748 # 592c <sg_usi_config+0x24>
    3d84:	493000ef          	jal	ra,4a16 <printf>
    printf("\n");
    3d88:	4529                	li	a0,10
    3d8a:	5a3000ef          	jal	ra,4b2c <putchar>

    for (i = 0; i < 15; i++) {
    3d8e:	87a2                	mv	a5,s0
    3d90:	4481                	li	s1,0
        printf("x%d: %08x\t", i + 1, regs[i]);
    3d92:	4390                	lw	a2,0(a5)
    3d94:	c226                	sw	s1,4(sp)
    3d96:	c03e                	sw	a5,0(sp)
    3d98:	0485                	addi	s1,s1,1
    3d9a:	6799                	lui	a5,0x6
    3d9c:	94478513          	addi	a0,a5,-1724 # 5944 <sg_usi_config+0x3c>
    3da0:	85a6                	mv	a1,s1
    3da2:	475000ef          	jal	ra,4a16 <printf>

        if ((i % 4) == 3) {
    3da6:	4712                	lw	a4,4(sp)
    3da8:	468d                	li	a3,3
    3daa:	4782                	lw	a5,0(sp)
    3dac:	8b0d                	andi	a4,a4,3
    3dae:	00d71663          	bne	a4,a3,3dba <trap_c+0x4e>
            printf("\n");
    3db2:	4529                	li	a0,10
    3db4:	579000ef          	jal	ra,4b2c <putchar>
    3db8:	4782                	lw	a5,0(sp)
    for (i = 0; i < 15; i++) {
    3dba:	473d                	li	a4,15
    3dbc:	0791                	addi	a5,a5,4
    3dbe:	fce49ae3          	bne	s1,a4,3d92 <trap_c+0x26>
        }
    }

    printf("\n");
    3dc2:	4529                	li	a0,10
    3dc4:	569000ef          	jal	ra,4b2c <putchar>
    printf("mepc   : %08x\n", regs[15]);
    3dc8:	5c4c                	lw	a1,60(s0)
    3dca:	6519                	lui	a0,0x6
    3dcc:	95050513          	addi	a0,a0,-1712 # 5950 <sg_usi_config+0x48>
    3dd0:	447000ef          	jal	ra,4a16 <printf>
    printf("mstatus: %08x\n", regs[16]);
    3dd4:	402c                	lw	a1,64(s0)
    3dd6:	6519                	lui	a0,0x6
    3dd8:	96050513          	addi	a0,a0,-1696 # 5960 <sg_usi_config+0x58>
    3ddc:	43b000ef          	jal	ra,4a16 <printf>

    if (trap_c_callback) {
    3de0:	0101a783          	lw	a5,16(gp) # 200004f8 <trap_c_callback>
    3de4:	c391                	beqz	a5,3de8 <trap_c+0x7c>
        trap_c_callback();
    3de6:	9782                	jalr	a5
    }

    while (1);
    3de8:	a001                	j	3de8 <trap_c+0x7c>

00003dea <timer_cb_fun>:
static unsigned int Timer_LoopCount;    /* Count unit is 10 seconds */
static uint8_t timer_count_rise = 0;    /*1: timer cont increasing, 0: timer cont diminishing*/

static void timer_cb_fun(int32_t idx, timer_event_e event)
{
    if (TIMER_EVENT_TIMEOUT == event) {
    3dea:	00059763          	bnez	a1,3df8 <timer_cb_fun+0xe>
        Timer_LoopCount++;
    3dee:	01c18793          	addi	a5,gp,28 # 20000504 <Timer_LoopCount>
    3df2:	4398                	lw	a4,0(a5)
    3df4:	0705                	addi	a4,a4,1
    3df6:	c398                	sw	a4,0(a5)
    }
}
    3df8:	8082                	ret

00003dfa <clock_timer_init>:

    return (unsigned long long)(Timer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv - 1;
}

int clock_timer_init(void)
{
    3dfa:	1131                	addi	sp,sp,-20
    if (CLOCK_GETTIME_USE_TIMER_ID > CONFIG_TIMER_NUM) {
        return EPERM;
    }

    uint32_t timer_loadtimer;
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3dfc:	6591                	lui	a1,0x4
{
    3dfe:	c622                	sw	s0,12(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3e00:	dea58593          	addi	a1,a1,-534 # 3dea <timer_cb_fun>
    3e04:	4501                	li	a0,0
{
    3e06:	c806                	sw	ra,16(sp)
    3e08:	c426                	sw	s1,8(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3e0a:	02418413          	addi	s0,gp,36 # 2000050c <timer_handle>
    3e0e:	3985                	jal	3a7e <csi_timer_initialize>
    3e10:	c008                	sw	a0,0(s0)

    if (timer_handle == NULL) {
    3e12:	e901                	bnez	a0,3e22 <clock_timer_init+0x28>
        return -1;
    3e14:	54fd                	li	s1,-1
    if (cv2 > cv1) {
        timer_count_rise = 1;
    }

    return 0;
}
    3e16:	40c2                	lw	ra,16(sp)
    3e18:	4432                	lw	s0,12(sp)
    3e1a:	8526                	mv	a0,s1
    3e1c:	44a2                	lw	s1,8(sp)
    3e1e:	0151                	addi	sp,sp,20
    3e20:	8082                	ret
    APB_FREQ = drv_get_timer_freq(CLOCK_GETTIME_USE_TIMER_ID);
    3e22:	4501                	li	a0,0
    3e24:	35d5                	jal	3d08 <drv_get_timer_freq>
    3e26:	00a1aa23          	sw	a0,20(gp) # 200004fc <APB_FREQ>
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e2a:	000f47b7          	lui	a5,0xf4
    3e2e:	24078793          	addi	a5,a5,576 # f4240 <__ctor_end__+0xedf18>
    3e32:	02f55533          	divu	a0,a0,a5
    3e36:	009894b7          	lui	s1,0x989
    3e3a:	68048493          	addi	s1,s1,1664 # 989680 <__ctor_end__+0x983358>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3e3e:	4585                	li	a1,1
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e40:	02950533          	mul	a0,a0,s1
    3e44:	00a1ac23          	sw	a0,24(gp) # 20000500 <TIMER_LOADCOUNT>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3e48:	4008                	lw	a0,0(s0)
    3e4a:	39e1                	jal	3b22 <csi_timer_config>
    if (ret != 0) {
    3e4c:	f561                	bnez	a0,3e14 <clock_timer_init+0x1a>
    ret = csi_timer_set_timeout(timer_handle, timer_loadtimer);
    3e4e:	4008                	lw	a0,0(s0)
    3e50:	85a6                	mv	a1,s1
    3e52:	3b29                	jal	3b6c <csi_timer_set_timeout>
    3e54:	84aa                	mv	s1,a0
    if (ret != 0) {
    3e56:	fd5d                	bnez	a0,3e14 <clock_timer_init+0x1a>
    csi_timer_get_current_value(timer_handle, &cv1);
    3e58:	4008                	lw	a0,0(s0)
    3e5a:	858a                	mv	a1,sp
    3e5c:	3bd1                	jal	3c30 <csi_timer_get_current_value>
    csi_timer_get_current_value(timer_handle, &cv2);
    3e5e:	4008                	lw	a0,0(s0)
    3e60:	004c                	addi	a1,sp,4
    3e62:	33f9                	jal	3c30 <csi_timer_get_current_value>
    if (cv2 > cv1) {
    3e64:	4712                	lw	a4,4(sp)
    3e66:	4782                	lw	a5,0(sp)
    3e68:	fae7f7e3          	bgeu	a5,a4,3e16 <clock_timer_init+0x1c>
        timer_count_rise = 1;
    3e6c:	4705                	li	a4,1
    3e6e:	02e18023          	sb	a4,32(gp) # 20000508 <timer_count_rise>
    3e72:	b755                	j	3e16 <clock_timer_init+0x1c>

00003e74 <clock_timer_start>:
}

int clock_timer_start(void)
{
    int ret = -1;
    Timer_LoopCount = 0;
    3e74:	0001ae23          	sw	zero,28(gp) # 20000504 <Timer_LoopCount>

    ret = csi_timer_start(timer_handle);
    3e78:	0241a503          	lw	a0,36(gp) # 2000050c <timer_handle>
{
    3e7c:	1151                	addi	sp,sp,-12
    3e7e:	c406                	sw	ra,8(sp)
    ret = csi_timer_start(timer_handle);
    3e80:	39fd                	jal	3b7e <csi_timer_start>
        (ts_begin.tv_sec * 1000000000 + ts_begin.tv_nsec);
    printf("clock_gettime() timing deviation is +%llu ns\n", error_margin_ns);
#endif

    return 0;
}
    3e82:	40a2                	lw	ra,8(sp)
    if (ret != 0) {
    3e84:	00a03533          	snez	a0,a0
}
    3e88:	40a00533          	neg	a0,a0
    3e8c:	0131                	addi	sp,sp,12
    3e8e:	8082                	ret

00003e90 <_init>:
extern int __ctor_start__;

typedef void (*func_ptr) (void);

CPP_WEAK void _init(void)
{
    3e90:	1151                	addi	sp,sp,-12
    3e92:	c222                	sw	s0,4(sp)
    3e94:	c026                	sw	s1,0(sp)
    3e96:	6419                	lui	s0,0x6
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3e98:	6499                	lui	s1,0x6
{
    3e9a:	c406                	sw	ra,8(sp)
    3e9c:	32840413          	addi	s0,s0,808 # 6328 <__ctor_end__>
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3ea0:	32848493          	addi	s1,s1,808 # 6328 <__ctor_end__>
    3ea4:	1471                	addi	s0,s0,-4
    3ea6:	00947763          	bgeu	s0,s1,3eb4 <_init+0x24>
        (*p) ();
    }
}
    3eaa:	40a2                	lw	ra,8(sp)
    3eac:	4412                	lw	s0,4(sp)
    3eae:	4482                	lw	s1,0(sp)
    3eb0:	0131                	addi	sp,sp,12
    3eb2:	8082                	ret
        (*p) ();
    3eb4:	401c                	lw	a5,0(s0)
    3eb6:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3eb8:	b7f5                	j	3ea4 <_init+0x14>

00003eba <_fini>:

CPP_WEAK void _fini(void)
{
    3eba:	1151                	addi	sp,sp,-12
    3ebc:	c222                	sw	s0,4(sp)
    3ebe:	c026                	sw	s1,0(sp)
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ec0:	6419                	lui	s0,0x6
    3ec2:	6499                	lui	s1,0x6
{
    3ec4:	c406                	sw	ra,8(sp)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ec6:	32840413          	addi	s0,s0,808 # 6328 <__ctor_end__>
    3eca:	32448493          	addi	s1,s1,804 # 6324 <pad_line+0x71c>
    3ece:	0084f763          	bgeu	s1,s0,3edc <_fini+0x22>
        (*p) ();
    }
}
    3ed2:	40a2                	lw	ra,8(sp)
    3ed4:	4412                	lw	s0,4(sp)
    3ed6:	4482                	lw	s1,0(sp)
    3ed8:	0131                	addi	sp,sp,12
    3eda:	8082                	ret
        (*p) ();
    3edc:	401c                	lw	a5,0(s0)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ede:	0411                	addi	s0,s0,4
        (*p) ();
    3ee0:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ee2:	b7f5                	j	3ece <_fini+0x14>

00003ee4 <fputc>:
{
    return 0;
}

int fputc(int ch, FILE *stream)
{
    3ee4:	1151                	addi	sp,sp,-12
    3ee6:	c026                	sw	s1,0(sp)
    3ee8:	84aa                	mv	s1,a0
    (void)stream;

    if (console_handle == NULL) {
    3eea:	0281a503          	lw	a0,40(gp) # 20000510 <console_handle>
{
    3eee:	c406                	sw	ra,8(sp)
    3ef0:	c222                	sw	s0,4(sp)
    if (console_handle == NULL) {
    3ef2:	c505                	beqz	a0,3f1a <fputc+0x36>
    3ef4:	02818413          	addi	s0,gp,40 # 20000510 <console_handle>
        return -1;
    }

    if (ch == '\n') {
    3ef8:	47a9                	li	a5,10
    3efa:	00f49563          	bne	s1,a5,3f04 <fputc+0x20>
        csi_usart_putchar(console_handle, '\r');
    3efe:	45b5                	li	a1,13
    3f00:	86fff0ef          	jal	ra,376e <csi_usart_putchar>
    }

    csi_usart_putchar(console_handle, ch);
    3f04:	4008                	lw	a0,0(s0)
    3f06:	0ff4f593          	andi	a1,s1,255
    3f0a:	865ff0ef          	jal	ra,376e <csi_usart_putchar>

    return 0;
    3f0e:	4501                	li	a0,0
}
    3f10:	40a2                	lw	ra,8(sp)
    3f12:	4412                	lw	s0,4(sp)
    3f14:	4482                	lw	s1,0(sp)
    3f16:	0131                	addi	sp,sp,12
    3f18:	8082                	ret
        return -1;
    3f1a:	557d                	li	a0,-1
    3f1c:	bfd5                	j	3f10 <fputc+0x2c>

00003f1e <os_critical_enter>:
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_suspend();
#endif

    return 0;
}
    3f1e:	4501                	li	a0,0
    3f20:	8082                	ret

00003f22 <os_critical_exit>:
    3f22:	4501                	li	a0,0
    3f24:	8082                	ret

00003f26 <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    3f26:	1151                	addi	sp,sp,-12
    3f28:	c026                	sw	s1,0(sp)
    3f2a:	84aa                	mv	s1,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    3f2c:	4188                	lw	a0,0(a1)
{
    3f2e:	c222                	sw	s0,4(sp)
    3f30:	c406                	sw	ra,8(sp)
    3f32:	842e                	mv	s0,a1
  int ndx = mm_size2ndx(node->size);
    3f34:	20cd                	jal	4016 <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    3f36:	0505                	addi	a0,a0,1
    3f38:	0512                	slli	a0,a0,0x4
    3f3a:	00850713          	addi	a4,a0,8
    3f3e:	9726                	add	a4,a4,s1
    3f40:	94aa                	add	s1,s1,a0
    3f42:	489c                	lw	a5,16(s1)
    3f44:	c791                	beqz	a5,3f50 <mm_addfreechunk+0x2a>
       next && next->size && next->size < node->size;
    3f46:	4394                	lw	a3,0(a5)
    3f48:	c681                	beqz	a3,3f50 <mm_addfreechunk+0x2a>
    3f4a:	4010                	lw	a2,0(s0)
    3f4c:	00c6ec63          	bltu	a3,a2,3f64 <mm_addfreechunk+0x3e>
       prev = next, next = next->flink);

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    3f50:	c700                	sw	s0,8(a4)
  node->blink = prev;
    3f52:	c458                	sw	a4,12(s0)
  node->flink = next;
    3f54:	c41c                	sw	a5,8(s0)

  if (next)
    3f56:	c391                	beqz	a5,3f5a <mm_addfreechunk+0x34>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    3f58:	c7c0                	sw	s0,12(a5)
    }
}
    3f5a:	40a2                	lw	ra,8(sp)
    3f5c:	4412                	lw	s0,4(sp)
    3f5e:	4482                	lw	s1,0(sp)
    3f60:	0131                	addi	sp,sp,12
    3f62:	8082                	ret
       prev = next, next = next->flink);
    3f64:	873e                	mv	a4,a5
    3f66:	479c                	lw	a5,8(a5)
    3f68:	bff1                	j	3f44 <mm_addfreechunk+0x1e>

00003f6a <mm_addregion>:

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3f6a:	00f58713          	addi	a4,a1,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3f6e:	962e                	add	a2,a2,a1

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    3f70:	454c                	lw	a1,12(a0)
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3f72:	9b41                	andi	a4,a4,-16
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3f74:	9a41                	andi	a2,a2,-16
  heapsize = heapend - heapbase;
    3f76:	40e607b3          	sub	a5,a2,a4
  heap->mm_heapsize += heapsize;
    3f7a:	95be                	add	a1,a1,a5
    3f7c:	c54c                	sw	a1,12(a0)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    3f7e:	c918                	sw	a4,16(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3f80:	4321                	li	t1,8
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3f82:	800002b7          	lui	t0,0x80000

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3f86:	17c1                	addi	a5,a5,-16
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3f88:	00572223          	sw	t0,4(a4)
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3f8c:	c71c                	sw	a5,8(a4)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3f8e:	00672023          	sw	t1,0(a4)
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    3f92:	00672623          	sw	t1,12(a4)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    3f96:	00870593          	addi	a1,a4,8

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    3f9a:	ff860713          	addi	a4,a2,-8
    3f9e:	c958                	sw	a4,20(a0)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    3fa0:	fe662c23          	sw	t1,-8(a2)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3fa4:	0057e7b3          	or	a5,a5,t0
    3fa8:	c35c                	sw	a5,4(a4)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    3faa:	bfb5                	j	3f26 <mm_addfreechunk>

00003fac <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    3fac:	1141                	addi	sp,sp,-16
    3fae:	c422                	sw	s0,8(sp)
    3fb0:	c226                	sw	s1,4(sp)
    3fb2:	c606                	sw	ra,12(sp)
    3fb4:	842a                	mv	s0,a0
    3fb6:	c032                	sw	a2,0(sp)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    3fb8:	00052623          	sw	zero,12(a0)
{
    3fbc:	84ae                	mv	s1,a1
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    3fbe:	13000613          	li	a2,304
    3fc2:	4581                	li	a1,0
    3fc4:	0561                	addi	a0,a0,24
    3fc6:	b96fe0ef          	jal	ra,235c <memset>
  for (i = 1; i < MM_NNODES; i++)
    3fca:	4702                	lw	a4,0(sp)
    3fcc:	02840793          	addi	a5,s0,40
    3fd0:	14840693          	addi	a3,s0,328
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3fd4:	ff078613          	addi	a2,a5,-16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    3fd8:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3fdc:	c7d0                	sw	a2,12(a5)
  for (i = 1; i < MM_NNODES; i++)
    3fde:	07c1                	addi	a5,a5,16
    3fe0:	fed79ae3          	bne	a5,a3,3fd4 <mm_initialize+0x28>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    3fe4:	8522                	mv	a0,s0
}
    3fe6:	4422                	lw	s0,8(sp)
    3fe8:	40b2                	lw	ra,12(sp)
  mm_addregion(heap, heapstart, heapsize);
    3fea:	85a6                	mv	a1,s1
}
    3fec:	4492                	lw	s1,4(sp)
  mm_addregion(heap, heapstart, heapsize);
    3fee:	863a                	mv	a2,a4
}
    3ff0:	0141                	addi	sp,sp,16
  mm_addregion(heap, heapstart, heapsize);
    3ff2:	bfa5                	j	3f6a <mm_addregion>

00003ff4 <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    3ff4:	200025b7          	lui	a1,0x20002
    3ff8:	200307b7          	lui	a5,0x20030
    3ffc:	eb058613          	addi	a2,a1,-336 # 20001eb0 <__bss_end__>
    4000:	00078793          	mv	a5,a5
    4004:	20002537          	lui	a0,0x20002
    4008:	40c78633          	sub	a2,a5,a2
    400c:	eb058593          	addi	a1,a1,-336
    4010:	cb850513          	addi	a0,a0,-840 # 20001cb8 <g_mmheap>
    4014:	bf61                	j	3fac <mm_initialize>

00004016 <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
    4016:	004007b7          	lui	a5,0x400
    401a:	00f57c63          	bgeu	a0,a5,4032 <mm_size2ndx+0x1c>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
    401e:	00455793          	srli	a5,a0,0x4
  while (size > 1)
    4022:	4705                	li	a4,1
  int ndx = 0;
    4024:	4501                	li	a0,0
  while (size > 1)
    4026:	00f76363          	bltu	a4,a5,402c <mm_size2ndx+0x16>
    402a:	8082                	ret
    {
      ndx++;
    402c:	0505                	addi	a0,a0,1
      size >>= 1;
    402e:	8385                	srli	a5,a5,0x1
    4030:	bfdd                	j	4026 <mm_size2ndx+0x10>
       return MM_NNODES-1;
    4032:	4549                	li	a0,18
    }

  return ndx;
}
    4034:	8082                	ret

00004036 <write_128>:
}

/*
 * @brief Function to write a byte array as 16 integers to the serial line
 */
void write_128(uint8_t* out){
    4036:	fc810113          	addi	sp,sp,-56
    403a:	da06                	sw	ra,52(sp)
//    printf("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\r\n",
//           out[ 0],out[ 1],out[ 2],out[ 3],
//           out[ 4],out[ 5],out[ 6],out[ 7],
//           out[ 8],out[ 9],out[10],out[11],
//           out[12],out[13],out[14],out[15]);
	    printf("%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x\r\n",
    403c:	00f54783          	lbu	a5,15(a0)
    4040:	d43e                	sw	a5,40(sp)
    4042:	00e54783          	lbu	a5,14(a0)
    4046:	d23e                	sw	a5,36(sp)
    4048:	00d54783          	lbu	a5,13(a0)
    404c:	d03e                	sw	a5,32(sp)
    404e:	00c54783          	lbu	a5,12(a0)
    4052:	ce3e                	sw	a5,28(sp)
    4054:	00b54783          	lbu	a5,11(a0)
    4058:	cc3e                	sw	a5,24(sp)
    405a:	00a54783          	lbu	a5,10(a0)
    405e:	ca3e                	sw	a5,20(sp)
    4060:	00954783          	lbu	a5,9(a0)
    4064:	c83e                	sw	a5,16(sp)
    4066:	00854783          	lbu	a5,8(a0)
    406a:	c63e                	sw	a5,12(sp)
    406c:	00754783          	lbu	a5,7(a0)
    4070:	c43e                	sw	a5,8(sp)
    4072:	00654783          	lbu	a5,6(a0)
    4076:	c23e                	sw	a5,4(sp)
    4078:	00554783          	lbu	a5,5(a0)
    407c:	c03e                	sw	a5,0(sp)
    407e:	00454783          	lbu	a5,4(a0)
    4082:	00354703          	lbu	a4,3(a0)
    4086:	00254683          	lbu	a3,2(a0)
    408a:	00154603          	lbu	a2,1(a0)
    408e:	00054583          	lbu	a1,0(a0)
    4092:	6519                	lui	a0,0x6
    4094:	97050513          	addi	a0,a0,-1680 # 5970 <sg_usi_config+0x68>
    4098:	17f000ef          	jal	ra,4a16 <printf>
           out[ 0],out[ 1],out[ 2],out[ 3],
           out[ 4],out[ 5],out[ 6],out[ 7],
           out[ 8],out[ 9],out[10],out[11],
           out[12],out[13],out[14],out[15]);
}
    409c:	50d2                	lw	ra,52(sp)
    409e:	03810113          	addi	sp,sp,56
    40a2:	8082                	ret

000040a4 <main>:


int main(void)
{
    40a4:	fc410113          	addi	sp,sp,-60
    40a8:	d826                	sw	s1,48(sp)
    40aa:	dc06                	sw	ra,56(sp)
    40ac:	da22                	sw	s0,52(sp)
	
	uint32_t loop_num=1;
	uint8_t key[16] = {0};
    40ae:	c002                	sw	zero,0(sp)
    40b0:	c202                	sw	zero,4(sp)
    40b2:	c402                	sw	zero,8(sp)
    40b4:	c602                	sw	zero,12(sp)
    uint8_t in[16] = {0};
    40b6:	c802                	sw	zero,16(sp)
    40b8:	ca02                	sw	zero,20(sp)
    40ba:	cc02                	sw	zero,24(sp)
    40bc:	ce02                	sw	zero,28(sp)
    uint8_t out[16] = {0};
    40be:	d002                	sw	zero,32(sp)
    40c0:	d202                	sw	zero,36(sp)
    40c2:	d402                	sw	zero,40(sp)
    40c4:	d602                	sw	zero,44(sp)
			LED_ON();
			mdelay(1000);
			for(i=0;i<loop_num;i++){
				for(i=0;i<16;i++)
				in[i] = rand()%256;
				printf("plaintext:");
    40c6:	6499                	lui	s1,0x6
	LED_Init();
    40c8:	2e8d                	jal	443a <LED_Init>
			LED_ON();
    40ca:	2ef1                	jal	44a6 <LED_ON>
			mdelay(1000);
    40cc:	3e800513          	li	a0,1000
    40d0:	3ec1                	jal	3ca0 <mdelay>
				for(i=0;i<16;i++)
    40d2:	4401                	li	s0,0
				in[i] = rand()%256;
    40d4:	b44fe0ef          	jal	ra,2418 <rand>
    40d8:	10000713          	li	a4,256
    40dc:	02e56533          	rem	a0,a0,a4
    40e0:	081c                	addi	a5,sp,16
    40e2:	97a2                	add	a5,a5,s0
				for(i=0;i<16;i++)
    40e4:	0405                	addi	s0,s0,1
				in[i] = rand()%256;
    40e6:	00a78023          	sb	a0,0(a5) # 400000 <__ctor_end__+0x3f9cd8>
				for(i=0;i<16;i++)
    40ea:	47c1                	li	a5,16
    40ec:	fef414e3          	bne	s0,a5,40d4 <main+0x30>
				printf("plaintext:");
    40f0:	9a448513          	addi	a0,s1,-1628 # 59a4 <sg_usi_config+0x9c>
    40f4:	123000ef          	jal	ra,4a16 <printf>
				write_128(in);
    40f8:	0808                	addi	a0,sp,16
    40fa:	3f35                	jal	4036 <write_128>
				for(i=0;i<16;i++)
    40fc:	4401                	li	s0,0
				key[i] = rand()%256;
    40fe:	b1afe0ef          	jal	ra,2418 <rand>
    4102:	10000713          	li	a4,256
    4106:	02e56533          	rem	a0,a0,a4
    410a:	008107b3          	add	a5,sp,s0
				for(i=0;i<16;i++)
    410e:	0405                	addi	s0,s0,1
				key[i] = rand()%256;
    4110:	00a78023          	sb	a0,0(a5)
				for(i=0;i<16;i++)
    4114:	47c1                	li	a5,16
    4116:	fef414e3          	bne	s0,a5,40fe <main+0x5a>
				printf("key:");
    411a:	6519                	lui	a0,0x6
    411c:	9b050513          	addi	a0,a0,-1616 # 59b0 <sg_usi_config+0xa8>
    4120:	0f7000ef          	jal	ra,4a16 <printf>
				write_128(key);
    4124:	850a                	mv	a0,sp
    4126:	3f01                	jal	4036 <write_128>
				AES128_ECB_encrypt(in,key,out);
    4128:	1010                	addi	a2,sp,32
    412a:	858a                	mv	a1,sp
    412c:	0808                	addi	a0,sp,16
    412e:	24d5                	jal	4412 <AES128_ECB_encrypt>
				printf("Crypt:");
    4130:	6519                	lui	a0,0x6
    4132:	9b850513          	addi	a0,a0,-1608 # 59b8 <sg_usi_config+0xb0>
    4136:	0e1000ef          	jal	ra,4a16 <printf>
				write_128(out);
    413a:	1008                	addi	a0,sp,32
    413c:	3ded                	jal	4036 <write_128>
			}
			LED_OFF();
    413e:	2679                	jal	44cc <LED_OFF>
			mdelay(1000);
    4140:	3e800513          	li	a0,1000
    4144:	3eb1                	jal	3ca0 <mdelay>
	{	   
    4146:	b751                	j	40ca <main+0x26>

00004148 <KeyExpansion>:
{
  uint32_t i, j, k;
  uint8_t tempa[4]; // Used for the column/row operations
  
  // The first round key is the key itself.
  for(i = 0; i < Nk; ++i)
    4148:	02c1a703          	lw	a4,44(gp) # 20000514 <Key>
{
    414c:	1141                	addi	sp,sp,-16
    414e:	200027b7          	lui	a5,0x20002
    4152:	c422                	sw	s0,8(sp)
    4154:	c606                	sw	ra,12(sp)
    4156:	e0078413          	addi	s0,a5,-512 # 20001e00 <RoundKey>
    415a:	c226                	sw	s1,4(sp)
    415c:	01070693          	addi	a3,a4,16
  {
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
    4160:	e0078793          	addi	a5,a5,-512
    4164:	00074603          	lbu	a2,0(a4)
  for(i = 0; i < Nk; ++i)
    4168:	0711                	addi	a4,a4,4
    416a:	0791                	addi	a5,a5,4
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
    416c:	fec78e23          	sb	a2,-4(a5)
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
    4170:	ffd74603          	lbu	a2,-3(a4)
    4174:	fec78ea3          	sb	a2,-3(a5)
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
    4178:	ffe74603          	lbu	a2,-2(a4)
    417c:	fec78f23          	sb	a2,-2(a5)
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
    4180:	fff74603          	lbu	a2,-1(a4)
    4184:	fec78fa3          	sb	a2,-1(a5)
  for(i = 0; i < Nk; ++i)
    4188:	fcd71ee3          	bne	a4,a3,4164 <KeyExpansion+0x1c>
    418c:	4491                	li	s1,4
  // All other round keys are found from the previous round keys.
  for(; (i < (Nb * (Nr + 1))); ++i)
  {
    for(j = 0; j < 4; ++j)
    {
      tempa[j]=RoundKey[(i-1) * 4 + j];
    418e:	4611                	li	a2,4
    4190:	00c40593          	addi	a1,s0,12
    4194:	850a                	mv	a0,sp
    4196:	82afe0ef          	jal	ra,21c0 <memcpy>
    }
    if (i % Nk == 0)
    419a:	0034f793          	andi	a5,s1,3
    419e:	6699                	lui	a3,0x6
    41a0:	eba1                	bnez	a5,41f0 <KeyExpansion+0xa8>
      // Function RotWord()
      {
        k = tempa[0];
        tempa[0] = tempa[1];
        tempa[1] = tempa[2];
        tempa[2] = tempa[3];
    41a2:	00314703          	lbu	a4,3(sp)
        k = tempa[0];
    41a6:	00014503          	lbu	a0,0(sp)
  return sbox[num];
    41aa:	00114603          	lbu	a2,1(sp)
    41ae:	00214583          	lbu	a1,2(sp)
    41b2:	ac068793          	addi	a5,a3,-1344 # 5ac0 <sbox>
    41b6:	973e                	add	a4,a4,a5

      // Function Subword()
      {
        tempa[0] = getSBoxValue(tempa[0]);
        tempa[1] = getSBoxValue(tempa[1]);
        tempa[2] = getSBoxValue(tempa[2]);
    41b8:	00074703          	lbu	a4,0(a4)
  return sbox[num];
    41bc:	963e                	add	a2,a2,a5
    41be:	95be                	add	a1,a1,a5
    41c0:	97aa                	add	a5,a5,a0
        tempa[3] = getSBoxValue(tempa[3]);
    41c2:	0007c783          	lbu	a5,0(a5)
        tempa[2] = getSBoxValue(tempa[2]);
    41c6:	00e10123          	sb	a4,2(sp)
      }

      tempa[0] =  tempa[0] ^ Rcon[i/Nk];
    41ca:	6719                	lui	a4,0x6
        tempa[3] = getSBoxValue(tempa[3]);
    41cc:	00f101a3          	sb	a5,3(sp)
      tempa[0] =  tempa[0] ^ Rcon[i/Nk];
    41d0:	9c070713          	addi	a4,a4,-1600 # 59c0 <Rcon>
    41d4:	0024d793          	srli	a5,s1,0x2
    41d8:	97ba                	add	a5,a5,a4
  return sbox[num];
    41da:	00064603          	lbu	a2,0(a2)
      tempa[0] =  tempa[0] ^ Rcon[i/Nk];
    41de:	0007c783          	lbu	a5,0(a5)
        tempa[1] = getSBoxValue(tempa[1]);
    41e2:	0005c583          	lbu	a1,0(a1)
      tempa[0] =  tempa[0] ^ Rcon[i/Nk];
    41e6:	8fb1                	xor	a5,a5,a2
        tempa[1] = getSBoxValue(tempa[1]);
    41e8:	00b100a3          	sb	a1,1(sp)
      tempa[0] =  tempa[0] ^ Rcon[i/Nk];
    41ec:	00f10023          	sb	a5,0(sp)
        tempa[1] = getSBoxValue(tempa[1]);
        tempa[2] = getSBoxValue(tempa[2]);
        tempa[3] = getSBoxValue(tempa[3]);
      }
    }
    RoundKey[i * 4 + 0] = RoundKey[(i - Nk) * 4 + 0] ^ tempa[0];
    41f0:	00044783          	lbu	a5,0(s0)
    41f4:	00014703          	lbu	a4,0(sp)
  for(; (i < (Nb * (Nr + 1))); ++i)
    41f8:	0485                	addi	s1,s1,1
    41fa:	0411                	addi	s0,s0,4
    RoundKey[i * 4 + 0] = RoundKey[(i - Nk) * 4 + 0] ^ tempa[0];
    41fc:	8fb9                	xor	a5,a5,a4
    41fe:	00f40623          	sb	a5,12(s0)
    RoundKey[i * 4 + 1] = RoundKey[(i - Nk) * 4 + 1] ^ tempa[1];
    4202:	00114703          	lbu	a4,1(sp)
    4206:	ffd44783          	lbu	a5,-3(s0)
    420a:	8fb9                	xor	a5,a5,a4
    420c:	00f406a3          	sb	a5,13(s0)
    RoundKey[i * 4 + 2] = RoundKey[(i - Nk) * 4 + 2] ^ tempa[2];
    4210:	00214703          	lbu	a4,2(sp)
    4214:	ffe44783          	lbu	a5,-2(s0)
    4218:	8fb9                	xor	a5,a5,a4
    421a:	00f40723          	sb	a5,14(s0)
    RoundKey[i * 4 + 3] = RoundKey[(i - Nk) * 4 + 3] ^ tempa[3];
    421e:	00314703          	lbu	a4,3(sp)
    4222:	fff44783          	lbu	a5,-1(s0)
    4226:	8fb9                	xor	a5,a5,a4
    4228:	00f407a3          	sb	a5,15(s0)
  for(; (i < (Nb * (Nr + 1))); ++i)
    422c:	02c00793          	li	a5,44
    4230:	f4f49fe3          	bne	s1,a5,418e <KeyExpansion+0x46>
  }
}
    4234:	40b2                	lw	ra,12(sp)
    4236:	4422                	lw	s0,8(sp)
    4238:	4492                	lw	s1,4(sp)
    423a:	0141                	addi	sp,sp,16
    423c:	8082                	ret

0000423e <AddRoundKey>:
// This function adds the round key to state.
// The round key is added to the state by an XOR function.
static void AddRoundKey(uint8_t round)
{
  uint8_t i,j;
  for(i=0;i<4;++i)
    423e:	0301a783          	lw	a5,48(gp) # 20000518 <state>
{
    4242:	1171                	addi	sp,sp,-4
  {
    for(j = 0; j < 4; ++j)
    {
      (*state)[i][j] ^= RoundKey[round * Nb * 4 + i * Nb + j];
    4244:	20002637          	lui	a2,0x20002
{
    4248:	c022                	sw	s0,0(sp)
    424a:	0512                	slli	a0,a0,0x4
    424c:	01078293          	addi	t0,a5,16
      (*state)[i][j] ^= RoundKey[round * Nb * 4 + i * Nb + j];
    4250:	e0060613          	addi	a2,a2,-512 # 20001e00 <RoundKey>
    for(j = 0; j < 4; ++j)
    4254:	4391                	li	t2,4
{
    4256:	86be                	mv	a3,a5
    4258:	4701                	li	a4,0
      (*state)[i][j] ^= RoundKey[round * Nb * 4 + i * Nb + j];
    425a:	00a60333          	add	t1,a2,a0
    425e:	00e305b3          	add	a1,t1,a4
    4262:	0006c403          	lbu	s0,0(a3)
    4266:	0005c583          	lbu	a1,0(a1)
    for(j = 0; j < 4; ++j)
    426a:	0705                	addi	a4,a4,1
    426c:	0685                	addi	a3,a3,1
      (*state)[i][j] ^= RoundKey[round * Nb * 4 + i * Nb + j];
    426e:	8da1                	xor	a1,a1,s0
    4270:	feb68fa3          	sb	a1,-1(a3)
    for(j = 0; j < 4; ++j)
    4274:	fe7715e3          	bne	a4,t2,425e <AddRoundKey+0x20>
  for(i=0;i<4;++i)
    4278:	0791                	addi	a5,a5,4
    427a:	0511                	addi	a0,a0,4
    427c:	fc579de3          	bne	a5,t0,4256 <AddRoundKey+0x18>
    }
  }
}
    4280:	4402                	lw	s0,0(sp)
    4282:	0111                	addi	sp,sp,4
    4284:	8082                	ret

00004286 <SubBytes>:
// The SubBytes Function Substitutes the values in the
// state matrix with values in an S-box.
static void SubBytes(void)
{
  uint8_t i, j;
  for(i = 0; i < 4; ++i)
    4286:	0301a703          	lw	a4,48(gp) # 20000518 <state>
  return sbox[num];
    428a:	6619                	lui	a2,0x6
    428c:	ac060613          	addi	a2,a2,-1344 # 5ac0 <sbox>
    4290:	00470513          	addi	a0,a4,4
{
    4294:	86ba                	mv	a3,a4
    4296:	4791                	li	a5,4
  return sbox[num];
    4298:	0006c583          	lbu	a1,0(a3)
  {
    for(j = 0; j < 4; ++j)
    429c:	17fd                	addi	a5,a5,-1
    429e:	0ff7f793          	andi	a5,a5,255
  return sbox[num];
    42a2:	95b2                	add	a1,a1,a2
    {
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    42a4:	0005c583          	lbu	a1,0(a1)
    for(j = 0; j < 4; ++j)
    42a8:	0691                	addi	a3,a3,4
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    42aa:	feb68e23          	sb	a1,-4(a3)
    for(j = 0; j < 4; ++j)
    42ae:	f7ed                	bnez	a5,4298 <SubBytes+0x12>
  for(i = 0; i < 4; ++i)
    42b0:	0705                	addi	a4,a4,1
    42b2:	fea711e3          	bne	a4,a0,4294 <SubBytes+0xe>
    }
  }
}
    42b6:	8082                	ret

000042b8 <ShiftRows>:
static void ShiftRows(void)
{
  uint8_t temp;

  // Rotate first row 1 columns to left  
  temp           = (*state)[0][1];
    42b8:	0301a783          	lw	a5,48(gp) # 20000518 <state>
  (*state)[0][1] = (*state)[1][1];
    42bc:	0057c683          	lbu	a3,5(a5)
  temp           = (*state)[0][1];
    42c0:	0017c703          	lbu	a4,1(a5)
  (*state)[0][1] = (*state)[1][1];
    42c4:	00d780a3          	sb	a3,1(a5)
  (*state)[1][1] = (*state)[2][1];
    42c8:	0097c683          	lbu	a3,9(a5)
    42cc:	00d782a3          	sb	a3,5(a5)
  (*state)[2][1] = (*state)[3][1];
    42d0:	00d7c683          	lbu	a3,13(a5)
  (*state)[3][1] = temp;
    42d4:	00e786a3          	sb	a4,13(a5)

  // Rotate second row 2 columns to left  
  temp           = (*state)[0][2];
    42d8:	0027c703          	lbu	a4,2(a5)
  (*state)[2][1] = (*state)[3][1];
    42dc:	00d784a3          	sb	a3,9(a5)
  (*state)[0][2] = (*state)[2][2];
    42e0:	00a7c683          	lbu	a3,10(a5)
  (*state)[2][2] = temp;
    42e4:	00e78523          	sb	a4,10(a5)

  temp       = (*state)[1][2];
    42e8:	0067c703          	lbu	a4,6(a5)
  (*state)[0][2] = (*state)[2][2];
    42ec:	00d78123          	sb	a3,2(a5)
  (*state)[1][2] = (*state)[3][2];
    42f0:	00e7c683          	lbu	a3,14(a5)
  (*state)[3][2] = temp;
    42f4:	00e78723          	sb	a4,14(a5)

  // Rotate third row 3 columns to left
  temp       = (*state)[0][3];
    42f8:	0037c703          	lbu	a4,3(a5)
  (*state)[1][2] = (*state)[3][2];
    42fc:	00d78323          	sb	a3,6(a5)
  (*state)[0][3] = (*state)[3][3];
    4300:	00f7c683          	lbu	a3,15(a5)
    4304:	00d781a3          	sb	a3,3(a5)
  (*state)[3][3] = (*state)[2][3];
    4308:	00b7c683          	lbu	a3,11(a5)
    430c:	00d787a3          	sb	a3,15(a5)
  (*state)[2][3] = (*state)[1][3];
    4310:	0077c683          	lbu	a3,7(a5)
  (*state)[1][3] = temp;
    4314:	00e783a3          	sb	a4,7(a5)
  (*state)[2][3] = (*state)[1][3];
    4318:	00d785a3          	sb	a3,11(a5)
}
    431c:	8082                	ret

0000431e <xtime>:

static uint8_t xtime(uint8_t x)
{
  return ((x<<1) ^ (((x>>7) & 1) * 0x1b));
    431e:	00755793          	srli	a5,a0,0x7
    4322:	476d                	li	a4,27
    4324:	02e787b3          	mul	a5,a5,a4
    4328:	0506                	slli	a0,a0,0x1
    432a:	8d3d                	xor	a0,a0,a5
}
    432c:	0ff57513          	andi	a0,a0,255
    4330:	8082                	ret

00004332 <Cipher>:
}


// Cipher is the main function that encrypts the PlainText.
static void Cipher(void)
{
    4332:	fd410113          	addi	sp,sp,-44
  uint8_t round = 0;

  // Add the First round key to the state before starting the rounds.
  AddRoundKey(0); 
    4336:	4501                	li	a0,0
{
    4338:	d406                	sw	ra,40(sp)
    433a:	d222                	sw	s0,36(sp)
    433c:	d026                	sw	s1,32(sp)
  AddRoundKey(0); 
    433e:	3701                	jal	423e <AddRoundKey>
  
  // There will be Nr rounds.
  // The first Nr-1 rounds are identical.
  // These Nr-1 rounds are executed in the loop below.
  for(round = 1; round < Nr; ++round)
    4340:	4785                	li	a5,1
    4342:	c03e                	sw	a5,0(sp)
  {
    SubBytes();
    4344:	3789                	jal	4286 <SubBytes>
    ShiftRows();
    4346:	3f8d                	jal	42b8 <ShiftRows>
  for(i = 0; i < 4; ++i)
    4348:	0301a403          	lw	s0,48(gp) # 20000518 <state>
    434c:	01040313          	addi	t1,s0,16
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
    4350:	00344603          	lbu	a2,3(s0)
    t   = (*state)[i][0];
    4354:	00044583          	lbu	a1,0(s0)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
    4358:	00144683          	lbu	a3,1(s0)
    435c:	00244703          	lbu	a4,2(s0)
    4360:	ce1a                	sw	t1,28(sp)
    4362:	00d5c533          	xor	a0,a1,a3
    4366:	00c742b3          	xor	t0,a4,a2
    436a:	00a2c4b3          	xor	s1,t0,a0
    436e:	ca32                	sw	a2,20(sp)
    4370:	c816                	sw	t0,16(sp)
    4372:	cc36                	sw	a3,24(sp)
    4374:	c42e                	sw	a1,8(sp)
    4376:	c23a                	sw	a4,4(sp)
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
    4378:	375d                	jal	431e <xtime>
    437a:	45a2                	lw	a1,8(sp)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    437c:	4712                	lw	a4,4(sp)
    437e:	46e2                	lw	a3,24(sp)
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
    4380:	8d2d                	xor	a0,a0,a1
    4382:	8d25                	xor	a0,a0,s1
    4384:	00a40023          	sb	a0,0(s0)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    4388:	00e6c533          	xor	a0,a3,a4
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
    438c:	c62e                	sw	a1,12(sp)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    438e:	c43a                	sw	a4,8(sp)
    4390:	c236                	sw	a3,4(sp)
    4392:	3771                	jal	431e <xtime>
    4394:	4692                	lw	a3,4(sp)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
    4396:	42c2                	lw	t0,16(sp)
  for(i = 0; i < 4; ++i)
    4398:	0411                	addi	s0,s0,4
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    439a:	8ea9                	xor	a3,a3,a0
    439c:	8ea5                	xor	a3,a3,s1
    439e:	fed40ea3          	sb	a3,-3(s0)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
    43a2:	8516                	mv	a0,t0
    43a4:	3fad                	jal	431e <xtime>
    43a6:	4722                	lw	a4,8(sp)
    Tm  = (*state)[i][3] ^ t ;        Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
    43a8:	4652                	lw	a2,20(sp)
    43aa:	45b2                	lw	a1,12(sp)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
    43ac:	8f29                	xor	a4,a4,a0
    43ae:	8f25                	xor	a4,a4,s1
    Tm  = (*state)[i][3] ^ t ;        Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
    43b0:	00c5c533          	xor	a0,a1,a2
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
    43b4:	fee40f23          	sb	a4,-2(s0)
    Tm  = (*state)[i][3] ^ t ;        Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
    43b8:	c232                	sw	a2,4(sp)
    43ba:	3795                	jal	431e <xtime>
    43bc:	4612                	lw	a2,4(sp)
  for(i = 0; i < 4; ++i)
    43be:	4372                	lw	t1,28(sp)
    Tm  = (*state)[i][3] ^ t ;        Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
    43c0:	8e29                	xor	a2,a2,a0
    43c2:	8cb1                	xor	s1,s1,a2
    43c4:	fe940fa3          	sb	s1,-1(s0)
  for(i = 0; i < 4; ++i)
    43c8:	f88314e3          	bne	t1,s0,4350 <Cipher+0x1e>
    MixColumns();
    AddRoundKey(round);
    43cc:	4502                	lw	a0,0(sp)
    43ce:	3d85                	jal	423e <AddRoundKey>
  for(round = 1; round < Nr; ++round)
    43d0:	4782                	lw	a5,0(sp)
    43d2:	00178413          	addi	s0,a5,1
    43d6:	0ff47793          	andi	a5,s0,255
    43da:	c03e                	sw	a5,0(sp)
    43dc:	4702                	lw	a4,0(sp)
    43de:	47a9                	li	a5,10
    43e0:	f6f712e3          	bne	a4,a5,4344 <Cipher+0x12>
  }
  
  // The last round is given below.
  // The MixColumns function is not here in the last round.
  SubBytes();
    43e4:	354d                	jal	4286 <SubBytes>
  ShiftRows();
    43e6:	3dc9                	jal	42b8 <ShiftRows>
  AddRoundKey(Nr);
}
    43e8:	5412                	lw	s0,36(sp)
    43ea:	50a2                	lw	ra,40(sp)
    43ec:	5482                	lw	s1,32(sp)
  AddRoundKey(Nr);
    43ee:	4529                	li	a0,10
}
    43f0:	02c10113          	addi	sp,sp,44
  AddRoundKey(Nr);
    43f4:	b5a9                	j	423e <AddRoundKey>

000043f6 <BlockCopy>:
  InvSubBytes();
  AddRoundKey(0);
}

static void BlockCopy(uint8_t* output, uint8_t* input)
{
    43f6:	4781                	li	a5,0
  uint8_t i;
  for (i=0;i<KEYLEN;++i)
    43f8:	4741                	li	a4,16
  {
    output[i] = input[i];
    43fa:	00f586b3          	add	a3,a1,a5
    43fe:	0006c603          	lbu	a2,0(a3)
    4402:	00f506b3          	add	a3,a0,a5
  for (i=0;i<KEYLEN;++i)
    4406:	0785                	addi	a5,a5,1
    output[i] = input[i];
    4408:	00c68023          	sb	a2,0(a3)
  for (i=0;i<KEYLEN;++i)
    440c:	fee797e3          	bne	a5,a4,43fa <BlockCopy+0x4>
  }
}
    4410:	8082                	ret

00004412 <AES128_ECB_encrypt>:
/*****************************************************************************/
#if defined(ECB) && ECB


void AES128_ECB_encrypt(uint8_t* input, const uint8_t* key, uint8_t* output)
{
    4412:	1151                	addi	sp,sp,-12
    4414:	c026                	sw	s1,0(sp)
    4416:	84ae                	mv	s1,a1
  // Copy input to output, and work in-memory on output
  BlockCopy(output, input);
    4418:	85aa                	mv	a1,a0
    441a:	8532                	mv	a0,a2
{
    441c:	c406                	sw	ra,8(sp)
    441e:	c222                	sw	s0,4(sp)
    4420:	8432                	mv	s0,a2
  BlockCopy(output, input);
    4422:	3fd1                	jal	43f6 <BlockCopy>
  state = (state_t*)output;
    4424:	0281a823          	sw	s0,48(gp) # 20000518 <state>

  Key = key;
    4428:	0291a623          	sw	s1,44(gp) # 20000514 <Key>
//	IO_PC9 = 1;
  KeyExpansion();
    442c:	3b31                	jal	4148 <KeyExpansion>

  // The next function call encrypts the PlainText with the Key using AES algorithm.
  Cipher();
//	IO_PC9 = 0;
}
    442e:	4412                	lw	s0,4(sp)
    4430:	40a2                	lw	ra,8(sp)
    4432:	4482                	lw	s1,0(sp)
    4434:	0131                	addi	sp,sp,12
  Cipher();
    4436:	bdf5                	j	4332 <Cipher>

00004438 <gpio_interrupt_handler>:
extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}
    4438:	8082                	ret

0000443a <LED_Init>:

void LED_Init()
{	
    443a:	1151                	addi	sp,sp,-12
    443c:	c026                	sw	s1,0(sp)
	int32_t ret;		
																					
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    443e:	6491                	lui	s1,0x4
    4440:	43848593          	addi	a1,s1,1080 # 4438 <gpio_interrupt_handler>
    4444:	4501                	li	a0,0
{	
    4446:	c406                	sw	ra,8(sp)
    4448:	c222                	sw	s0,4(sp)
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    444a:	d26ff0ef          	jal	ra,3970 <csi_gpio_pin_initialize>
    444e:	03418413          	addi	s0,gp,52 # 2000051c <led1_pin_handle_t>
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    4452:	4581                	li	a1,0
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    4454:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    4456:	d7aff0ef          	jal	ra,39d0 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led1_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    445a:	4008                	lw	a0,0(s0)
    445c:	4585                	li	a1,1
    445e:	d8aff0ef          	jal	ra,39e8 <csi_gpio_pin_config_direction>

    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    4462:	43848593          	addi	a1,s1,1080
    4466:	4505                	li	a0,1
    4468:	d08ff0ef          	jal	ra,3970 <csi_gpio_pin_initialize>
    446c:	03818413          	addi	s0,gp,56 # 20000520 <led2_pin_handle_t>
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    4470:	4581                	li	a1,0
    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    4472:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    4474:	d5cff0ef          	jal	ra,39d0 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led2_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4478:	4008                	lw	a0,0(s0)
    447a:	4585                	li	a1,1
    447c:	d6cff0ef          	jal	ra,39e8 <csi_gpio_pin_config_direction>

    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    4480:	43848593          	addi	a1,s1,1080
    4484:	4509                	li	a0,2
    4486:	ceaff0ef          	jal	ra,3970 <csi_gpio_pin_initialize>
    448a:	03c18413          	addi	s0,gp,60 # 20000524 <led3_pin_handle_t>
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    448e:	4581                	li	a1,0
    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    4490:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    4492:	d3eff0ef          	jal	ra,39d0 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4496:	4008                	lw	a0,0(s0)
	
//	aes_trigger_t = csi_gpio_pin_initialize(PA, gpio_interrupt_handler);       
//    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
//    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
}
    4498:	4412                	lw	s0,4(sp)
    449a:	40a2                	lw	ra,8(sp)
    449c:	4482                	lw	s1,0(sp)
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    449e:	4585                	li	a1,1
}
    44a0:	0131                	addi	sp,sp,12
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    44a2:	d46ff06f          	j	39e8 <csi_gpio_pin_config_direction>

000044a6 <LED_ON>:

void LED_ON()
{
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    44a6:	0341a503          	lw	a0,52(gp) # 2000051c <led1_pin_handle_t>
{
    44aa:	1151                	addi	sp,sp,-12
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    44ac:	4585                	li	a1,1
{
    44ae:	c406                	sw	ra,8(sp)
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    44b0:	d6aff0ef          	jal	ra,3a1a <csi_gpio_pin_write>
    csi_gpio_pin_write(led2_pin_handle_t,1);	
    44b4:	0381a503          	lw	a0,56(gp) # 20000520 <led2_pin_handle_t>
    44b8:	4585                	li	a1,1
    44ba:	d60ff0ef          	jal	ra,3a1a <csi_gpio_pin_write>
    csi_gpio_pin_write(led3_pin_handle_t,1);	
}
    44be:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(led3_pin_handle_t,1);	
    44c0:	03c1a503          	lw	a0,60(gp) # 20000524 <led3_pin_handle_t>
    44c4:	4585                	li	a1,1
}
    44c6:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(led3_pin_handle_t,1);	
    44c8:	d52ff06f          	j	3a1a <csi_gpio_pin_write>

000044cc <LED_OFF>:

void LED_OFF()
{
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    44cc:	0341a503          	lw	a0,52(gp) # 2000051c <led1_pin_handle_t>
{
    44d0:	1151                	addi	sp,sp,-12
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    44d2:	4581                	li	a1,0
{
    44d4:	c406                	sw	ra,8(sp)
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    44d6:	d44ff0ef          	jal	ra,3a1a <csi_gpio_pin_write>
    csi_gpio_pin_write(led2_pin_handle_t,0);	
    44da:	0381a503          	lw	a0,56(gp) # 20000520 <led2_pin_handle_t>
    44de:	4581                	li	a1,0
    44e0:	d3aff0ef          	jal	ra,3a1a <csi_gpio_pin_write>
    csi_gpio_pin_write(led3_pin_handle_t,0);	
}
    44e4:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    44e6:	03c1a503          	lw	a0,60(gp) # 20000524 <led3_pin_handle_t>
    44ea:	4581                	li	a1,0
}
    44ec:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    44ee:	d2cff06f          	j	3a1a <csi_gpio_pin_write>

000044f2 <copystring>:
    44f2:	4781                	li	a5,0
    44f4:	470d                	li	a4,3
    44f6:	00b7c463          	blt	a5,a1,44fe <copystring+0xc>
    44fa:	853e                	mv	a0,a5
    44fc:	8082                	ret
    44fe:	00f606b3          	add	a3,a2,a5
    4502:	0006c303          	lbu	t1,0(a3)
    4506:	00f506b3          	add	a3,a0,a5
    450a:	0785                	addi	a5,a5,1
    450c:	00668023          	sb	t1,0(a3)
    4510:	fee793e3          	bne	a5,a4,44f6 <copystring+0x4>
    4514:	feb7d3e3          	bge	a5,a1,44fa <copystring+0x8>
    4518:	000501a3          	sb	zero,3(a0)
    451c:	4791                	li	a5,4
    451e:	bff1                	j	44fa <copystring+0x8>

00004520 <__dtostr>:
    4520:	fa810113          	addi	sp,sp,-88
    4524:	c8a2                	sw	s0,80(sp)
    4526:	ca86                	sw	ra,84(sp)
    4528:	c6a6                	sw	s1,76(sp)
    452a:	d02a                	sw	a0,32(sp)
    452c:	c42e                	sw	a1,8(sp)
    452e:	c032                	sw	a2,0(sp)
    4530:	8436                	mv	s0,a3
    4532:	d43a                	sw	a4,40(sp)
    4534:	c23e                	sw	a5,4(sp)
    4536:	2ed5                	jal	492a <__isinf>
    4538:	cd01                	beqz	a0,4550 <__dtostr+0x30>
    453a:	6619                	lui	a2,0x6
    453c:	bf860613          	addi	a2,a2,-1032 # 5bf8 <sbox+0x138>
    4540:	85a2                	mv	a1,s0
    4542:	4446                	lw	s0,80(sp)
    4544:	4502                	lw	a0,0(sp)
    4546:	40d6                	lw	ra,84(sp)
    4548:	44b6                	lw	s1,76(sp)
    454a:	05810113          	addi	sp,sp,88
    454e:	b755                	j	44f2 <copystring>
    4550:	5702                	lw	a4,32(sp)
    4552:	47a2                	lw	a5,8(sp)
    4554:	853a                	mv	a0,a4
    4556:	85be                	mv	a1,a5
    4558:	2b15                	jal	4a8c <__isnan>
    455a:	d22a                	sw	a0,36(sp)
    455c:	c509                	beqz	a0,4566 <__dtostr+0x46>
    455e:	6619                	lui	a2,0x6
    4560:	bfc60613          	addi	a2,a2,-1028 # 5bfc <sbox+0x13c>
    4564:	bff1                	j	4540 <__dtostr+0x20>
    4566:	5702                	lw	a4,32(sp)
    4568:	47a2                	lw	a5,8(sp)
    456a:	4601                	li	a2,0
    456c:	4681                	li	a3,0
    456e:	853a                	mv	a0,a4
    4570:	85be                	mv	a1,a5
    4572:	ecbfc0ef          	jal	ra,143c <__eqdf2>
    4576:	e925                	bnez	a0,45e6 <__dtostr+0xc6>
    4578:	4792                	lw	a5,4(sp)
    457a:	3a078363          	beqz	a5,4920 <__dtostr+0x400>
    457e:	0789                	addi	a5,a5,2
    4580:	02f46163          	bltu	s0,a5,45a2 <__dtostr+0x82>
    4584:	cb85                	beqz	a5,45b4 <__dtostr+0x94>
    4586:	4722                	lw	a4,8(sp)
    4588:	04075c63          	bgez	a4,45e0 <__dtostr+0xc0>
    458c:	4682                	lw	a3,0(sp)
    458e:	02d00713          	li	a4,45
    4592:	00e68023          	sb	a4,0(a3)
    4596:	00178713          	addi	a4,a5,1
    459a:	4785                	li	a5,1
    459c:	03000693          	li	a3,48
    45a0:	a801                	j	45b0 <__dtostr+0x90>
    45a2:	47a1                	li	a5,8
    45a4:	b7cd                	j	4586 <__dtostr+0x66>
    45a6:	4602                	lw	a2,0(sp)
    45a8:	963e                	add	a2,a2,a5
    45aa:	00d60023          	sb	a3,0(a2)
    45ae:	0785                	addi	a5,a5,1
    45b0:	fee7ebe3          	bltu	a5,a4,45a6 <__dtostr+0x86>
    45b4:	4702                	lw	a4,0(sp)
    45b6:	03000693          	li	a3,48
    45ba:	00074603          	lbu	a2,0(a4)
    45be:	4705                	li	a4,1
    45c0:	00d60363          	beq	a2,a3,45c6 <__dtostr+0xa6>
    45c4:	4709                	li	a4,2
    45c6:	4682                	lw	a3,0(sp)
    45c8:	9736                	add	a4,a4,a3
    45ca:	02e00693          	li	a3,46
    45ce:	00d70023          	sb	a3,0(a4)
    45d2:	4702                	lw	a4,0(sp)
    45d4:	00f704b3          	add	s1,a4,a5
    45d8:	00048023          	sb	zero,0(s1)
    45dc:	d23e                	sw	a5,36(sp)
    45de:	a459                	j	4864 <__dtostr+0x344>
    45e0:	873e                	mv	a4,a5
    45e2:	4781                	li	a5,0
    45e4:	bf65                	j	459c <__dtostr+0x7c>
    45e6:	5702                	lw	a4,32(sp)
    45e8:	47a2                	lw	a5,8(sp)
    45ea:	4601                	li	a2,0
    45ec:	4681                	li	a3,0
    45ee:	853a                	mv	a0,a4
    45f0:	85be                	mv	a1,a5
    45f2:	f7dfc0ef          	jal	ra,156e <__ledf2>
    45f6:	16055f63          	bgez	a0,4774 <__dtostr+0x254>
    45fa:	47a2                	lw	a5,8(sp)
    45fc:	4702                	lw	a4,0(sp)
    45fe:	800002b7          	lui	t0,0x80000
    4602:	00f2c2b3          	xor	t0,t0,a5
    4606:	02d00793          	li	a5,45
    460a:	00f70023          	sb	a5,0(a4)
    460e:	147d                	addi	s0,s0,-1
    4610:	00170493          	addi	s1,a4,1
    4614:	6799                	lui	a5,0x6
    4616:	bc07a503          	lw	a0,-1088(a5) # 5bc0 <sbox+0x100>
    461a:	bc47a583          	lw	a1,-1084(a5)
    461e:	6799                	lui	a5,0x6
    4620:	bd07a703          	lw	a4,-1072(a5) # 5bd0 <sbox+0x110>
    4624:	bd47a783          	lw	a5,-1068(a5)
    4628:	4381                	li	t2,0
    462a:	4692                	lw	a3,4(sp)
    462c:	14d39763          	bne	t2,a3,477a <__dtostr+0x25a>
    4630:	5702                	lw	a4,32(sp)
    4632:	862a                	mv	a2,a0
    4634:	86ae                	mv	a3,a1
    4636:	853a                	mv	a0,a4
    4638:	8596                	mv	a1,t0
    463a:	a7afc0ef          	jal	ra,8b4 <__adddf3>
    463e:	6799                	lui	a5,0x6
    4640:	bd87a603          	lw	a2,-1064(a5) # 5bd8 <sbox+0x118>
    4644:	bdc7a683          	lw	a3,-1060(a5)
    4648:	c82a                	sw	a0,16(sp)
    464a:	ca2e                	sw	a1,20(sp)
    464c:	f23fc0ef          	jal	ra,156e <__ledf2>
    4650:	00055863          	bgez	a0,4660 <__dtostr+0x140>
    4654:	03000793          	li	a5,48
    4658:	00f48023          	sb	a5,0(s1)
    465c:	147d                	addi	s0,s0,-1
    465e:	0485                	addi	s1,s1,1
    4660:	47a2                	lw	a5,8(sp)
    4662:	0147d513          	srli	a0,a5,0x14
    4666:	7ff57513          	andi	a0,a0,2047
    466a:	c0150513          	addi	a0,a0,-1023
    466e:	aaffd0ef          	jal	ra,211c <__floatsidf>
    4672:	6799                	lui	a5,0x6
    4674:	be07a603          	lw	a2,-1056(a5) # 5be0 <sbox+0x120>
    4678:	be47a683          	lw	a3,-1052(a5)
    467c:	fa9fc0ef          	jal	ra,1624 <__muldf3>
    4680:	a39fd0ef          	jal	ra,20b8 <__fixdfsi>
    4684:	00150793          	addi	a5,a0,1
    4688:	cc3e                	sw	a5,24(sp)
    468a:	22f05763          	blez	a5,48b8 <__dtostr+0x398>
    468e:	6699                	lui	a3,0x6
    4690:	be86a603          	lw	a2,-1048(a3) # 5be8 <sbox+0x128>
    4694:	82be                	mv	t0,a5
    4696:	bec6a683          	lw	a3,-1044(a3)
    469a:	6799                	lui	a5,0x6
    469c:	bc87a703          	lw	a4,-1080(a5) # 5bc8 <sbox+0x108>
    46a0:	bcc7a783          	lw	a5,-1076(a5)
    46a4:	43a9                	li	t2,10
    46a6:	d632                	sw	a2,44(sp)
    46a8:	d836                	sw	a3,48(sp)
    46aa:	0e53e663          	bltu	t2,t0,4796 <__dtostr+0x276>
    46ae:	6699                	lui	a3,0x6
    46b0:	bc86a603          	lw	a2,-1080(a3) # 5bc8 <sbox+0x108>
    46b4:	bcc6a683          	lw	a3,-1076(a3)
    46b8:	4385                	li	t2,1
    46ba:	d632                	sw	a2,44(sp)
    46bc:	d836                	sw	a3,48(sp)
    46be:	0e729963          	bne	t0,t2,47b0 <__dtostr+0x290>
    46c2:	4685                	li	a3,1
    46c4:	d636                	sw	a3,44(sp)
    46c6:	6699                	lui	a3,0x6
    46c8:	bf06a603          	lw	a2,-1040(a3) # 5bf0 <sbox+0x130>
    46cc:	bf46a683          	lw	a3,-1036(a3)
    46d0:	da32                	sw	a2,52(sp)
    46d2:	dc36                	sw	a3,56(sp)
    46d4:	6699                	lui	a3,0x6
    46d6:	bc86a603          	lw	a2,-1080(a3) # 5bc8 <sbox+0x108>
    46da:	bcc6a683          	lw	a3,-1076(a3)
    46de:	de32                	sw	a2,60(sp)
    46e0:	c0b6                	sw	a3,64(sp)
    46e2:	5652                	lw	a2,52(sp)
    46e4:	56e2                	lw	a3,56(sp)
    46e6:	853a                	mv	a0,a4
    46e8:	85be                	mv	a1,a5
    46ea:	c2ba                	sw	a4,68(sp)
    46ec:	c4be                	sw	a5,72(sp)
    46ee:	dcbfc0ef          	jal	ra,14b8 <__gedf2>
    46f2:	4716                	lw	a4,68(sp)
    46f4:	47a6                	lw	a5,72(sp)
    46f6:	0ca04a63          	bgtz	a0,47ca <__dtostr+0x2aa>
    46fa:	4682                	lw	a3,0(sp)
    46fc:	00d49a63          	bne	s1,a3,4710 <__dtostr+0x1f0>
    4700:	16040263          	beqz	s0,4864 <__dtostr+0x344>
    4704:	03000693          	li	a3,48
    4708:	00d48023          	sb	a3,0(s1)
    470c:	147d                	addi	s0,s0,-1
    470e:	0485                	addi	s1,s1,1
    4710:	4692                	lw	a3,4(sp)
    4712:	ea81                	bnez	a3,4722 <__dtostr+0x202>
    4714:	4682                	lw	a3,0(sp)
    4716:	5622                	lw	a2,40(sp)
    4718:	40d486b3          	sub	a3,s1,a3
    471c:	0685                	addi	a3,a3,1
    471e:	04c6f563          	bgeu	a3,a2,4768 <__dtostr+0x248>
    4722:	14040163          	beqz	s0,4864 <__dtostr+0x344>
    4726:	02e00693          	li	a3,46
    472a:	00d48023          	sb	a3,0(s1)
    472e:	4692                	lw	a3,4(sp)
    4730:	147d                	addi	s0,s0,-1
    4732:	00148293          	addi	t0,s1,1
    4736:	ea81                	bnez	a3,4746 <__dtostr+0x226>
    4738:	56a2                	lw	a3,40(sp)
    473a:	4602                	lw	a2,0(sp)
    473c:	0685                	addi	a3,a3,1
    473e:	40c28633          	sub	a2,t0,a2
    4742:	8e91                	sub	a3,a3,a2
    4744:	c236                	sw	a3,4(sp)
    4746:	4692                	lw	a3,4(sp)
    4748:	10d46e63          	bltu	s0,a3,4864 <__dtostr+0x344>
    474c:	8426                	mv	s0,s1
    474e:	94b6                	add	s1,s1,a3
    4750:	6699                	lui	a3,0x6
    4752:	bc86a603          	lw	a2,-1080(a3) # 5bc8 <sbox+0x108>
    4756:	bcc6a683          	lw	a3,-1076(a3)
    475a:	c432                	sw	a2,8(sp)
    475c:	c636                	sw	a3,12(sp)
    475e:	16941363          	bne	s0,s1,48c4 <__dtostr+0x3a4>
    4762:	4792                	lw	a5,4(sp)
    4764:	00f284b3          	add	s1,t0,a5
    4768:	4782                	lw	a5,0(sp)
    476a:	00048023          	sb	zero,0(s1)
    476e:	40f487b3          	sub	a5,s1,a5
    4772:	b5ad                	j	45dc <__dtostr+0xbc>
    4774:	4482                	lw	s1,0(sp)
    4776:	42a2                	lw	t0,8(sp)
    4778:	bd71                	j	4614 <__dtostr+0xf4>
    477a:	863a                	mv	a2,a4
    477c:	86be                	mv	a3,a5
    477e:	d616                	sw	t0,44(sp)
    4780:	cc1e                	sw	t2,24(sp)
    4782:	c83a                	sw	a4,16(sp)
    4784:	ca3e                	sw	a5,20(sp)
    4786:	e9ffc0ef          	jal	ra,1624 <__muldf3>
    478a:	43e2                	lw	t2,24(sp)
    478c:	52b2                	lw	t0,44(sp)
    478e:	4742                	lw	a4,16(sp)
    4790:	0385                	addi	t2,t2,1
    4792:	47d2                	lw	a5,20(sp)
    4794:	bd59                	j	462a <__dtostr+0x10a>
    4796:	5632                	lw	a2,44(sp)
    4798:	56c2                	lw	a3,48(sp)
    479a:	853a                	mv	a0,a4
    479c:	85be                	mv	a1,a5
    479e:	da16                	sw	t0,52(sp)
    47a0:	e85fc0ef          	jal	ra,1624 <__muldf3>
    47a4:	52d2                	lw	t0,52(sp)
    47a6:	872a                	mv	a4,a0
    47a8:	87ae                	mv	a5,a1
    47aa:	12d9                	addi	t0,t0,-10
    47ac:	43a9                	li	t2,10
    47ae:	bdf5                	j	46aa <__dtostr+0x18a>
    47b0:	5632                	lw	a2,44(sp)
    47b2:	56c2                	lw	a3,48(sp)
    47b4:	853a                	mv	a0,a4
    47b6:	85be                	mv	a1,a5
    47b8:	da16                	sw	t0,52(sp)
    47ba:	e6bfc0ef          	jal	ra,1624 <__muldf3>
    47be:	52d2                	lw	t0,52(sp)
    47c0:	872a                	mv	a4,a0
    47c2:	87ae                	mv	a5,a1
    47c4:	12fd                	addi	t0,t0,-1
    47c6:	4385                	li	t2,1
    47c8:	bddd                	j	46be <__dtostr+0x19e>
    47ca:	4542                	lw	a0,16(sp)
    47cc:	45d2                	lw	a1,20(sp)
    47ce:	863a                	mv	a2,a4
    47d0:	86be                	mv	a3,a5
    47d2:	c2ba                	sw	a4,68(sp)
    47d4:	c4be                	sw	a5,72(sp)
    47d6:	ed4fc0ef          	jal	ra,eaa <__divdf3>
    47da:	8dffd0ef          	jal	ra,20b8 <__fixdfsi>
    47de:	5632                	lw	a2,44(sp)
    47e0:	0ff57693          	andi	a3,a0,255
    47e4:	4716                	lw	a4,68(sp)
    47e6:	47a6                	lw	a5,72(sp)
    47e8:	c211                	beqz	a2,47ec <__dtostr+0x2cc>
    47ea:	ced5                	beqz	a3,48a6 <__dtostr+0x386>
    47ec:	03068693          	addi	a3,a3,48
    47f0:	00d48023          	sb	a3,0(s1)
    47f4:	0485                	addi	s1,s1,1
    47f6:	ec35                	bnez	s0,4872 <__dtostr+0x352>
    47f8:	863a                	mv	a2,a4
    47fa:	86be                	mv	a3,a5
    47fc:	5702                	lw	a4,32(sp)
    47fe:	47a2                	lw	a5,8(sp)
    4800:	853a                	mv	a0,a4
    4802:	85be                	mv	a1,a5
    4804:	ea6fc0ef          	jal	ra,eaa <__divdf3>
    4808:	4792                	lw	a5,4(sp)
    480a:	5722                	lw	a4,40(sp)
    480c:	4602                	lw	a2,0(sp)
    480e:	4681                	li	a3,0
    4810:	3b01                	jal	4520 <__dtostr>
    4812:	c929                	beqz	a0,4864 <__dtostr+0x344>
    4814:	00a48333          	add	t1,s1,a0
    4818:	06500793          	li	a5,101
    481c:	00f30023          	sb	a5,0(t1)
    4820:	00130493          	addi	s1,t1,1
    4824:	fff54513          	not	a0,a0
    4828:	4711                	li	a4,4
    482a:	4685                	li	a3,1
    482c:	3e800793          	li	a5,1000
    4830:	4629                	li	a2,10
    4832:	45e2                	lw	a1,24(sp)
    4834:	00f5d363          	bge	a1,a5,483a <__dtostr+0x31a>
    4838:	e285                	bnez	a3,4858 <__dtostr+0x338>
    483a:	c909                	beqz	a0,484c <__dtostr+0x32c>
    483c:	46e2                	lw	a3,24(sp)
    483e:	0485                	addi	s1,s1,1
    4840:	02f6c6b3          	div	a3,a3,a5
    4844:	03068693          	addi	a3,a3,48
    4848:	fed48fa3          	sb	a3,-1(s1)
    484c:	46e2                	lw	a3,24(sp)
    484e:	157d                	addi	a0,a0,-1
    4850:	02f6e6b3          	rem	a3,a3,a5
    4854:	cc36                	sw	a3,24(sp)
    4856:	4681                	li	a3,0
    4858:	177d                	addi	a4,a4,-1
    485a:	02c7c7b3          	div	a5,a5,a2
    485e:	fb71                	bnez	a4,4832 <__dtostr+0x312>
    4860:	f00514e3          	bnez	a0,4768 <__dtostr+0x248>
    4864:	40d6                	lw	ra,84(sp)
    4866:	4446                	lw	s0,80(sp)
    4868:	5512                	lw	a0,36(sp)
    486a:	44b6                	lw	s1,76(sp)
    486c:	05810113          	addi	sp,sp,88
    4870:	8082                	ret
    4872:	0ff57513          	andi	a0,a0,255
    4876:	d63a                	sw	a4,44(sp)
    4878:	d83e                	sw	a5,48(sp)
    487a:	8a3fd0ef          	jal	ra,211c <__floatsidf>
    487e:	5732                	lw	a4,44(sp)
    4880:	57c2                	lw	a5,48(sp)
    4882:	147d                	addi	s0,s0,-1
    4884:	863a                	mv	a2,a4
    4886:	86be                	mv	a3,a5
    4888:	c2ba                	sw	a4,68(sp)
    488a:	c4be                	sw	a5,72(sp)
    488c:	d99fc0ef          	jal	ra,1624 <__muldf3>
    4890:	862a                	mv	a2,a0
    4892:	86ae                	mv	a3,a1
    4894:	4542                	lw	a0,16(sp)
    4896:	45d2                	lw	a1,20(sp)
    4898:	a14fd0ef          	jal	ra,1aac <__subdf3>
    489c:	4716                	lw	a4,68(sp)
    489e:	47a6                	lw	a5,72(sp)
    48a0:	c82a                	sw	a0,16(sp)
    48a2:	ca2e                	sw	a1,20(sp)
    48a4:	d602                	sw	zero,44(sp)
    48a6:	5672                	lw	a2,60(sp)
    48a8:	4686                	lw	a3,64(sp)
    48aa:	853a                	mv	a0,a4
    48ac:	85be                	mv	a1,a5
    48ae:	dfcfc0ef          	jal	ra,eaa <__divdf3>
    48b2:	872a                	mv	a4,a0
    48b4:	87ae                	mv	a5,a1
    48b6:	b535                	j	46e2 <__dtostr+0x1c2>
    48b8:	6799                	lui	a5,0x6
    48ba:	bd07a703          	lw	a4,-1072(a5) # 5bd0 <sbox+0x110>
    48be:	bd47a783          	lw	a5,-1068(a5)
    48c2:	bd25                	j	46fa <__dtostr+0x1da>
    48c4:	4542                	lw	a0,16(sp)
    48c6:	45d2                	lw	a1,20(sp)
    48c8:	863a                	mv	a2,a4
    48ca:	86be                	mv	a3,a5
    48cc:	d016                	sw	t0,32(sp)
    48ce:	cc3a                	sw	a4,24(sp)
    48d0:	ce3e                	sw	a5,28(sp)
    48d2:	dd8fc0ef          	jal	ra,eaa <__divdf3>
    48d6:	fe2fd0ef          	jal	ra,20b8 <__fixdfsi>
    48da:	03050693          	addi	a3,a0,48
    48de:	00d400a3          	sb	a3,1(s0)
    48e2:	0ff57513          	andi	a0,a0,255
    48e6:	837fd0ef          	jal	ra,211c <__floatsidf>
    48ea:	4762                	lw	a4,24(sp)
    48ec:	47f2                	lw	a5,28(sp)
    48ee:	0405                	addi	s0,s0,1
    48f0:	863a                	mv	a2,a4
    48f2:	86be                	mv	a3,a5
    48f4:	d31fc0ef          	jal	ra,1624 <__muldf3>
    48f8:	862a                	mv	a2,a0
    48fa:	86ae                	mv	a3,a1
    48fc:	4542                	lw	a0,16(sp)
    48fe:	45d2                	lw	a1,20(sp)
    4900:	9acfd0ef          	jal	ra,1aac <__subdf3>
    4904:	4762                	lw	a4,24(sp)
    4906:	47f2                	lw	a5,28(sp)
    4908:	4622                	lw	a2,8(sp)
    490a:	46b2                	lw	a3,12(sp)
    490c:	c82a                	sw	a0,16(sp)
    490e:	ca2e                	sw	a1,20(sp)
    4910:	853a                	mv	a0,a4
    4912:	85be                	mv	a1,a5
    4914:	d96fc0ef          	jal	ra,eaa <__divdf3>
    4918:	872a                	mv	a4,a0
    491a:	87ae                	mv	a5,a1
    491c:	5282                	lw	t0,32(sp)
    491e:	b581                	j	475e <__dtostr+0x23e>
    4920:	47a1                	li	a5,8
    4922:	c60402e3          	beqz	s0,4586 <__dtostr+0x66>
    4926:	4785                	li	a5,1
    4928:	b9b9                	j	4586 <__dtostr+0x66>

0000492a <__isinf>:
    492a:	e509                	bnez	a0,4934 <__isinf+0xa>
    492c:	7ff007b7          	lui	a5,0x7ff00
    4930:	00f58b63          	beq	a1,a5,4946 <__isinf+0x1c>
    4934:	fff007b7          	lui	a5,0xfff00
    4938:	8fad                	xor	a5,a5,a1
    493a:	8d5d                	or	a0,a0,a5
    493c:	00153513          	seqz	a0,a0
    4940:	40a00533          	neg	a0,a0
    4944:	8082                	ret
    4946:	4505                	li	a0,1
    4948:	8082                	ret

0000494a <__lltostr>:
    494a:	fdc10113          	addi	sp,sp,-36
    494e:	15fd                	addi	a1,a1,-1
    4950:	ce22                	sw	s0,28(sp)
    4952:	d006                	sw	ra,32(sp)
    4954:	cc26                	sw	s1,24(sp)
    4956:	95aa                	add	a1,a1,a0
    4958:	00058023          	sb	zero,0(a1)
    495c:	842a                	mv	s0,a0
    495e:	82b2                	mv	t0,a2
    4960:	8336                	mv	t1,a3
    4962:	c709                	beqz	a4,496c <__lltostr+0x22>
    4964:	02400693          	li	a3,36
    4968:	00e6d363          	bge	a3,a4,496e <__lltostr+0x24>
    496c:	4729                	li	a4,10
    496e:	0062e6b3          	or	a3,t0,t1
    4972:	4601                	li	a2,0
    4974:	e699                	bnez	a3,4982 <__lltostr+0x38>
    4976:	03000693          	li	a3,48
    497a:	fed58fa3          	sb	a3,-1(a1)
    497e:	4605                	li	a2,1
    4980:	15fd                	addi	a1,a1,-1
    4982:	02700693          	li	a3,39
    4986:	c391                	beqz	a5,498a <__lltostr+0x40>
    4988:	469d                	li	a3,7
    498a:	0ff6f793          	andi	a5,a3,255
    498e:	c23e                	sw	a5,4(sp)
    4990:	00c587b3          	add	a5,a1,a2
    4994:	c43e                	sw	a5,8(sp)
    4996:	41f75793          	srai	a5,a4,0x1f
    499a:	84ae                	mv	s1,a1
    499c:	c03e                	sw	a5,0(sp)
    499e:	47a2                	lw	a5,8(sp)
    49a0:	409786b3          	sub	a3,a5,s1
    49a4:	00947563          	bgeu	s0,s1,49ae <__lltostr+0x64>
    49a8:	0062e633          	or	a2,t0,t1
    49ac:	e205                	bnez	a2,49cc <__lltostr+0x82>
    49ae:	00168613          	addi	a2,a3,1
    49b2:	85a6                	mv	a1,s1
    49b4:	8522                	mv	a0,s0
    49b6:	c036                	sw	a3,0(sp)
    49b8:	8b5fd0ef          	jal	ra,226c <memmove>
    49bc:	4682                	lw	a3,0(sp)
    49be:	5082                	lw	ra,32(sp)
    49c0:	4472                	lw	s0,28(sp)
    49c2:	44e2                	lw	s1,24(sp)
    49c4:	8536                	mv	a0,a3
    49c6:	02410113          	addi	sp,sp,36
    49ca:	8082                	ret
    49cc:	4682                	lw	a3,0(sp)
    49ce:	863a                	mv	a2,a4
    49d0:	8516                	mv	a0,t0
    49d2:	859a                	mv	a1,t1
    49d4:	ca3a                	sw	a4,20(sp)
    49d6:	c816                	sw	t0,16(sp)
    49d8:	c61a                	sw	t1,12(sp)
    49da:	b87fb0ef          	jal	ra,560 <__umoddi3>
    49de:	03050513          	addi	a0,a0,48
    49e2:	0ff57513          	andi	a0,a0,255
    49e6:	03900793          	li	a5,57
    49ea:	14fd                	addi	s1,s1,-1
    49ec:	4332                	lw	t1,12(sp)
    49ee:	42c2                	lw	t0,16(sp)
    49f0:	4752                	lw	a4,20(sp)
    49f2:	00a7ef63          	bltu	a5,a0,4a10 <__lltostr+0xc6>
    49f6:	4682                	lw	a3,0(sp)
    49f8:	00a48023          	sb	a0,0(s1)
    49fc:	863a                	mv	a2,a4
    49fe:	8516                	mv	a0,t0
    4a00:	859a                	mv	a1,t1
    4a02:	c63a                	sw	a4,12(sp)
    4a04:	ff2fb0ef          	jal	ra,1f6 <__udivdi3>
    4a08:	82aa                	mv	t0,a0
    4a0a:	832e                	mv	t1,a1
    4a0c:	4732                	lw	a4,12(sp)
    4a0e:	bf41                	j	499e <__lltostr+0x54>
    4a10:	4792                	lw	a5,4(sp)
    4a12:	953e                	add	a0,a0,a5
    4a14:	b7cd                	j	49f6 <__lltostr+0xac>

00004a16 <printf>:
    4a16:	fdc10113          	addi	sp,sp,-36
    4a1a:	c82e                	sw	a1,16(sp)
    4a1c:	080c                	addi	a1,sp,16
    4a1e:	c606                	sw	ra,12(sp)
    4a20:	ca32                	sw	a2,20(sp)
    4a22:	cc36                	sw	a3,24(sp)
    4a24:	ce3a                	sw	a4,28(sp)
    4a26:	d03e                	sw	a5,32(sp)
    4a28:	c02e                	sw	a1,0(sp)
    4a2a:	2099                	jal	4a70 <vprintf>
    4a2c:	40b2                	lw	ra,12(sp)
    4a2e:	02410113          	addi	sp,sp,36
    4a32:	8082                	ret

00004a34 <putc>:
    4a34:	cb0ff06f          	j	3ee4 <fputc>

00004a38 <__stdio_outs>:
    4a38:	1151                	addi	sp,sp,-12
    4a3a:	c222                	sw	s0,4(sp)
    4a3c:	c026                	sw	s1,0(sp)
    4a3e:	842a                	mv	s0,a0
    4a40:	84ae                	mv	s1,a1
    4a42:	c406                	sw	ra,8(sp)
    4a44:	94a2                	add	s1,s1,s0
    4a46:	cd8ff0ef          	jal	ra,3f1e <os_critical_enter>
    4a4a:	00941a63          	bne	s0,s1,4a5e <__stdio_outs+0x26>
    4a4e:	cd4ff0ef          	jal	ra,3f22 <os_critical_exit>
    4a52:	40a2                	lw	ra,8(sp)
    4a54:	4412                	lw	s0,4(sp)
    4a56:	4482                	lw	s1,0(sp)
    4a58:	4505                	li	a0,1
    4a5a:	0131                	addi	sp,sp,12
    4a5c:	8082                	ret
    4a5e:	0001a703          	lw	a4,0(gp) # 200004e8 <_impure_ptr>
    4a62:	00044503          	lbu	a0,0(s0)
    4a66:	0405                	addi	s0,s0,1
    4a68:	470c                	lw	a1,8(a4)
    4a6a:	c7aff0ef          	jal	ra,3ee4 <fputc>
    4a6e:	bff1                	j	4a4a <__stdio_outs+0x12>

00004a70 <vprintf>:
    4a70:	1131                	addi	sp,sp,-20
    4a72:	6795                	lui	a5,0x5
    4a74:	a3878793          	addi	a5,a5,-1480 # 4a38 <__stdio_outs>
    4a78:	862e                	mv	a2,a1
    4a7a:	85aa                	mv	a1,a0
    4a7c:	850a                	mv	a0,sp
    4a7e:	c806                	sw	ra,16(sp)
    4a80:	c002                	sw	zero,0(sp)
    4a82:	c23e                	sw	a5,4(sp)
    4a84:	2a31                	jal	4ba0 <__v_printf>
    4a86:	40c2                	lw	ra,16(sp)
    4a88:	0151                	addi	sp,sp,20
    4a8a:	8082                	ret

00004a8c <__isnan>:
    4a8c:	fff80737          	lui	a4,0xfff80
    4a90:	177d                	addi	a4,a4,-1
    4a92:	8f6d                	and	a4,a4,a1
    4a94:	e509                	bnez	a0,4a9e <__isnan+0x12>
    4a96:	7ff007b7          	lui	a5,0x7ff00
    4a9a:	00f70963          	beq	a4,a5,4aac <__isnan+0x20>
    4a9e:	fff807b7          	lui	a5,0xfff80
    4aa2:	8fad                	xor	a5,a5,a1
    4aa4:	8fc9                	or	a5,a5,a0
    4aa6:	0017b513          	seqz	a0,a5
    4aaa:	8082                	ret
    4aac:	4505                	li	a0,1
    4aae:	8082                	ret

00004ab0 <__ltostr>:
    4ab0:	1151                	addi	sp,sp,-12
    4ab2:	15fd                	addi	a1,a1,-1
    4ab4:	c406                	sw	ra,8(sp)
    4ab6:	c222                	sw	s0,4(sp)
    4ab8:	95aa                	add	a1,a1,a0
    4aba:	00058023          	sb	zero,0(a1)
    4abe:	fff68313          	addi	t1,a3,-1
    4ac2:	02300793          	li	a5,35
    4ac6:	0067f363          	bgeu	a5,t1,4acc <__ltostr+0x1c>
    4aca:	46a9                	li	a3,10
    4acc:	4781                	li	a5,0
    4ace:	e619                	bnez	a2,4adc <__ltostr+0x2c>
    4ad0:	03000793          	li	a5,48
    4ad4:	fef58fa3          	sb	a5,-1(a1)
    4ad8:	15fd                	addi	a1,a1,-1
    4ada:	4785                	li	a5,1
    4adc:	02700313          	li	t1,39
    4ae0:	c311                	beqz	a4,4ae4 <__ltostr+0x34>
    4ae2:	431d                	li	t1,7
    4ae4:	0ff37713          	andi	a4,t1,255
    4ae8:	03900293          	li	t0,57
    4aec:	00f58333          	add	t1,a1,a5
    4af0:	40b30433          	sub	s0,t1,a1
    4af4:	00b57363          	bgeu	a0,a1,4afa <__ltostr+0x4a>
    4af8:	ea11                	bnez	a2,4b0c <__ltostr+0x5c>
    4afa:	00140613          	addi	a2,s0,1
    4afe:	f6efd0ef          	jal	ra,226c <memmove>
    4b02:	8522                	mv	a0,s0
    4b04:	40a2                	lw	ra,8(sp)
    4b06:	4412                	lw	s0,4(sp)
    4b08:	0131                	addi	sp,sp,12
    4b0a:	8082                	ret
    4b0c:	02d677b3          	remu	a5,a2,a3
    4b10:	15fd                	addi	a1,a1,-1
    4b12:	03078793          	addi	a5,a5,48 # fff80030 <__heap_end+0xdff50030>
    4b16:	0ff7f793          	andi	a5,a5,255
    4b1a:	00f2e763          	bltu	t0,a5,4b28 <__ltostr+0x78>
    4b1e:	00f58023          	sb	a5,0(a1)
    4b22:	02d65633          	divu	a2,a2,a3
    4b26:	b7e9                	j	4af0 <__ltostr+0x40>
    4b28:	97ba                	add	a5,a5,a4
    4b2a:	bfd5                	j	4b1e <__ltostr+0x6e>

00004b2c <putchar>:
    4b2c:	0001a783          	lw	a5,0(gp) # 200004e8 <_impure_ptr>
    4b30:	1151                	addi	sp,sp,-12
    4b32:	c406                	sw	ra,8(sp)
    4b34:	478c                	lw	a1,8(a5)
    4b36:	3dfd                	jal	4a34 <putc>
    4b38:	40a2                	lw	ra,8(sp)
    4b3a:	4501                	li	a0,0
    4b3c:	0131                	addi	sp,sp,12
    4b3e:	8082                	ret

00004b40 <write_pad>:
    4b40:	1131                	addi	sp,sp,-20
    4b42:	fd060613          	addi	a2,a2,-48
    4b46:	c426                	sw	s1,8(sp)
    4b48:	00163613          	seqz	a2,a2
    4b4c:	6499                	lui	s1,0x6
    4b4e:	0612                	slli	a2,a2,0x4
    4b50:	c0848493          	addi	s1,s1,-1016 # 5c08 <pad_line>
    4b54:	c622                	sw	s0,12(sp)
    4b56:	c806                	sw	ra,16(sp)
    4b58:	87aa                	mv	a5,a0
    4b5a:	872e                	mv	a4,a1
    4b5c:	94b2                	add	s1,s1,a2
    4b5e:	842e                	mv	s0,a1
    4b60:	463d                	li	a2,15
    4b62:	408706b3          	sub	a3,a4,s0
    4b66:	02864263          	blt	a2,s0,4b8a <write_pad+0x4a>
    4b6a:	00805a63          	blez	s0,4b7e <write_pad+0x3e>
    4b6e:	43d8                	lw	a4,4(a5)
    4b70:	4390                	lw	a2,0(a5)
    4b72:	85a2                	mv	a1,s0
    4b74:	8526                	mv	a0,s1
    4b76:	c036                	sw	a3,0(sp)
    4b78:	9702                	jalr	a4
    4b7a:	4682                	lw	a3,0(sp)
    4b7c:	96a2                	add	a3,a3,s0
    4b7e:	40c2                	lw	ra,16(sp)
    4b80:	4432                	lw	s0,12(sp)
    4b82:	44a2                	lw	s1,8(sp)
    4b84:	8536                	mv	a0,a3
    4b86:	0151                	addi	sp,sp,20
    4b88:	8082                	ret
    4b8a:	43d4                	lw	a3,4(a5)
    4b8c:	4390                	lw	a2,0(a5)
    4b8e:	45c1                	li	a1,16
    4b90:	8526                	mv	a0,s1
    4b92:	c23a                	sw	a4,4(sp)
    4b94:	c03e                	sw	a5,0(sp)
    4b96:	9682                	jalr	a3
    4b98:	1441                	addi	s0,s0,-16
    4b9a:	4712                	lw	a4,4(sp)
    4b9c:	4782                	lw	a5,0(sp)
    4b9e:	b7c9                	j	4b60 <write_pad+0x20>

00004ba0 <__v_printf>:
    4ba0:	0081a783          	lw	a5,8(gp) # 200004f0 <errno>
    4ba4:	f2810113          	addi	sp,sp,-216
    4ba8:	c9a2                	sw	s0,208(sp)
    4baa:	c7a6                	sw	s1,204(sp)
    4bac:	cb86                	sw	ra,212(sp)
    4bae:	84aa                	mv	s1,a0
    4bb0:	c82e                	sw	a1,16(sp)
    4bb2:	8432                	mv	s0,a2
    4bb4:	d83e                	sw	a5,48(sp)
    4bb6:	c202                	sw	zero,4(sp)
    4bb8:	47c2                	lw	a5,16(sp)
    4bba:	0007c783          	lbu	a5,0(a5)
    4bbe:	68078063          	beqz	a5,523e <__v_printf+0x69e>
    4bc2:	4701                	li	a4,0
    4bc4:	02500613          	li	a2,37
    4bc8:	a011                	j	4bcc <__v_printf+0x2c>
    4bca:	0705                	addi	a4,a4,1
    4bcc:	47c2                	lw	a5,16(sp)
    4bce:	97ba                	add	a5,a5,a4
    4bd0:	0007c683          	lbu	a3,0(a5)
    4bd4:	74068863          	beqz	a3,5324 <__v_printf+0x784>
    4bd8:	fec699e3          	bne	a3,a2,4bca <__v_printf+0x2a>
    4bdc:	e319                	bnez	a4,4be2 <__v_printf+0x42>
    4bde:	47c2                	lw	a5,16(sp)
    4be0:	a01d                	j	4c06 <__v_printf+0x66>
    4be2:	40d4                	lw	a3,4(s1)
    4be4:	4090                	lw	a2,0(s1)
    4be6:	4542                	lw	a0,16(sp)
    4be8:	85ba                	mv	a1,a4
    4bea:	c43e                	sw	a5,8(sp)
    4bec:	c03a                	sw	a4,0(sp)
    4bee:	9682                	jalr	a3
    4bf0:	4792                	lw	a5,4(sp)
    4bf2:	4702                	lw	a4,0(sp)
    4bf4:	97ba                	add	a5,a5,a4
    4bf6:	c23e                	sw	a5,4(sp)
    4bf8:	47a2                	lw	a5,8(sp)
    4bfa:	02500713          	li	a4,37
    4bfe:	0007c683          	lbu	a3,0(a5)
    4c02:	72e69463          	bne	a3,a4,532a <__v_printf+0x78a>
    4c06:	00178513          	addi	a0,a5,1
    4c0a:	02000793          	li	a5,32
    4c0e:	c002                	sw	zero,0(sp)
    4c10:	c602                	sw	zero,12(sp)
    4c12:	4701                	li	a4,0
    4c14:	ca02                	sw	zero,20(sp)
    4c16:	ce02                	sw	zero,28(sp)
    4c18:	d602                	sw	zero,44(sp)
    4c1a:	d002                	sw	zero,32(sp)
    4c1c:	c402                	sw	zero,8(sp)
    4c1e:	cc3e                	sw	a5,24(sp)
    4c20:	00054303          	lbu	t1,0(a0)
    4c24:	00150793          	addi	a5,a0,1
    4c28:	c83e                	sw	a5,16(sp)
    4c2a:	046103a3          	sb	t1,71(sp)
    4c2e:	06300793          	li	a5,99
    4c32:	1cf30963          	beq	t1,a5,4e04 <__v_printf+0x264>
    4c36:	0c67e863          	bltu	a5,t1,4d06 <__v_printf+0x166>
    4c3a:	02d00793          	li	a5,45
    4c3e:	02f30363          	beq	t1,a5,4c64 <__v_printf+0xc4>
    4c42:	0667e263          	bltu	a5,t1,4ca6 <__v_printf+0x106>
    4c46:	02300793          	li	a5,35
    4c4a:	02f30163          	beq	t1,a5,4c6c <__v_printf+0xcc>
    4c4e:	0267e663          	bltu	a5,t1,4c7a <__v_printf+0xda>
    4c52:	5e030463          	beqz	t1,523a <__v_printf+0x69a>
    4c56:	02000793          	li	a5,32
    4c5a:	f4f31fe3          	bne	t1,a5,4bb8 <__v_printf+0x18>
    4c5e:	4785                	li	a5,1
    4c60:	d63e                	sw	a5,44(sp)
    4c62:	a019                	j	4c68 <__v_printf+0xc8>
    4c64:	4785                	li	a5,1
    4c66:	d03e                	sw	a5,32(sp)
    4c68:	4542                	lw	a0,16(sp)
    4c6a:	bf5d                	j	4c20 <__v_printf+0x80>
    4c6c:	0ff00793          	li	a5,255
    4c70:	c43e                	sw	a5,8(sp)
    4c72:	bfdd                	j	4c68 <__v_printf+0xc8>
    4c74:	4785                	li	a5,1
    4c76:	ce3e                	sw	a5,28(sp)
    4c78:	bfc5                	j	4c68 <__v_printf+0xc8>
    4c7a:	02a00793          	li	a5,42
    4c7e:	16f30163          	beq	t1,a5,4de0 <__v_printf+0x240>
    4c82:	02b00793          	li	a5,43
    4c86:	fef307e3          	beq	t1,a5,4c74 <__v_printf+0xd4>
    4c8a:	02500793          	li	a5,37
    4c8e:	f2f315e3          	bne	t1,a5,4bb8 <__v_printf+0x18>
    4c92:	40dc                	lw	a5,4(s1)
    4c94:	4090                	lw	a2,0(s1)
    4c96:	4585                	li	a1,1
    4c98:	04710513          	addi	a0,sp,71
    4c9c:	9782                	jalr	a5
    4c9e:	4792                	lw	a5,4(sp)
    4ca0:	0785                	addi	a5,a5,1
    4ca2:	c23e                	sw	a5,4(sp)
    4ca4:	bf11                	j	4bb8 <__v_printf+0x18>
    4ca6:	03900793          	li	a5,57
    4caa:	0267ee63          	bltu	a5,t1,4ce6 <__v_printf+0x146>
    4cae:	03000793          	li	a5,48
    4cb2:	0ef37f63          	bgeu	t1,a5,4db0 <__v_printf+0x210>
    4cb6:	02e00793          	li	a5,46
    4cba:	eef31fe3          	bne	t1,a5,4bb8 <__v_printf+0x18>
    4cbe:	00154683          	lbu	a3,1(a0)
    4cc2:	02a00793          	li	a5,42
    4cc6:	12f69163          	bne	a3,a5,4de8 <__v_printf+0x248>
    4cca:	4014                	lw	a3,0(s0)
    4ccc:	00440793          	addi	a5,s0,4
    4cd0:	c036                	sw	a3,0(sp)
    4cd2:	0006d363          	bgez	a3,4cd8 <__v_printf+0x138>
    4cd6:	c002                	sw	zero,0(sp)
    4cd8:	00250693          	addi	a3,a0,2
    4cdc:	c836                	sw	a3,16(sp)
    4cde:	843e                	mv	s0,a5
    4ce0:	4785                	li	a5,1
    4ce2:	ca3e                	sw	a5,20(sp)
    4ce4:	b751                	j	4c68 <__v_printf+0xc8>
    4ce6:	05800793          	li	a5,88
    4cea:	2af30263          	beq	t1,a5,4f8e <__v_printf+0x3ee>
    4cee:	06200793          	li	a5,98
    4cf2:	36f30363          	beq	t1,a5,5058 <__v_printf+0x4b8>
    4cf6:	04c00793          	li	a5,76
    4cfa:	eaf31fe3          	bne	t1,a5,4bb8 <__v_printf+0x18>
    4cfe:	0705                	addi	a4,a4,1
    4d00:	0762                	slli	a4,a4,0x18
    4d02:	8761                	srai	a4,a4,0x18
    4d04:	a091                	j	4d48 <__v_printf+0x1a8>
    4d06:	06d00793          	li	a5,109
    4d0a:	10f30263          	beq	t1,a5,4e0e <__v_printf+0x26e>
    4d0e:	0267ef63          	bltu	a5,t1,4d4c <__v_printf+0x1ac>
    4d12:	06700793          	li	a5,103
    4d16:	0067ef63          	bltu	a5,t1,4d34 <__v_printf+0x194>
    4d1a:	06600793          	li	a5,102
    4d1e:	3ef37263          	bgeu	t1,a5,5102 <__v_printf+0x562>
    4d22:	06400793          	li	a5,100
    4d26:	e8f319e3          	bne	t1,a5,4bb8 <__v_printf+0x18>
    4d2a:	4529                	li	a0,10
    4d2c:	4781                	li	a5,0
    4d2e:	4285                	li	t0,1
    4d30:	4301                	li	t1,0
    4d32:	ac49                	j	4fc4 <__v_printf+0x424>
    4d34:	06900793          	li	a5,105
    4d38:	fef309e3          	beq	t1,a5,4d2a <__v_printf+0x18a>
    4d3c:	06f36663          	bltu	t1,a5,4da8 <__v_printf+0x208>
    4d40:	06c00793          	li	a5,108
    4d44:	e6f31ae3          	bne	t1,a5,4bb8 <__v_printf+0x18>
    4d48:	0705                	addi	a4,a4,1
    4d4a:	a085                	j	4daa <__v_printf+0x20a>
    4d4c:	07300793          	li	a5,115
    4d50:	0ef30163          	beq	t1,a5,4e32 <__v_printf+0x292>
    4d54:	0267ec63          	bltu	a5,t1,4d8c <__v_printf+0x1ec>
    4d58:	07000793          	li	a5,112
    4d5c:	22f30263          	beq	t1,a5,4f80 <__v_printf+0x3e0>
    4d60:	07100793          	li	a5,113
    4d64:	f8f30de3          	beq	t1,a5,4cfe <__v_printf+0x15e>
    4d68:	06f00793          	li	a5,111
    4d6c:	e4f316e3          	bne	t1,a5,4bb8 <__v_printf+0x18>
    4d70:	47a2                	lw	a5,8(sp)
    4d72:	2e078763          	beqz	a5,5060 <__v_printf+0x4c0>
    4d76:	03000793          	li	a5,48
    4d7a:	04f106a3          	sb	a5,77(sp)
    4d7e:	4785                	li	a5,1
    4d80:	c43e                	sw	a5,8(sp)
    4d82:	4521                	li	a0,8
    4d84:	4781                	li	a5,0
    4d86:	4281                	li	t0,0
    4d88:	4305                	li	t1,1
    4d8a:	ac2d                	j	4fc4 <__v_printf+0x424>
    4d8c:	07800793          	li	a5,120
    4d90:	2cf30263          	beq	t1,a5,5054 <__v_printf+0x4b4>
    4d94:	07a00793          	li	a5,122
    4d98:	ecf308e3          	beq	t1,a5,4c68 <__v_printf+0xc8>
    4d9c:	07500793          	li	a5,117
    4da0:	e0f31ce3          	bne	t1,a5,4bb8 <__v_printf+0x18>
    4da4:	4529                	li	a0,10
    4da6:	ac55                	j	505a <__v_printf+0x4ba>
    4da8:	177d                	addi	a4,a4,-1
    4daa:	0762                	slli	a4,a4,0x18
    4dac:	8761                	srai	a4,a4,0x18
    4dae:	bd6d                	j	4c68 <__v_printf+0xc8>
    4db0:	47d2                	lw	a5,20(sp)
    4db2:	c83a                	sw	a4,16(sp)
    4db4:	48079363          	bnez	a5,523a <__v_printf+0x69a>
    4db8:	4629                	li	a2,10
    4dba:	00ac                	addi	a1,sp,72
    4dbc:	f6bfd0ef          	jal	ra,2d26 <strtoul>
    4dc0:	04714683          	lbu	a3,71(sp)
    4dc4:	c62a                	sw	a0,12(sp)
    4dc6:	03000793          	li	a5,48
    4dca:	4742                	lw	a4,16(sp)
    4dcc:	00f69763          	bne	a3,a5,4dda <__v_printf+0x23a>
    4dd0:	5782                	lw	a5,32(sp)
    4dd2:	e781                	bnez	a5,4dda <__v_printf+0x23a>
    4dd4:	03000793          	li	a5,48
    4dd8:	cc3e                	sw	a5,24(sp)
    4dda:	47a6                	lw	a5,72(sp)
    4ddc:	c83e                	sw	a5,16(sp)
    4dde:	b569                	j	4c68 <__v_printf+0xc8>
    4de0:	401c                	lw	a5,0(s0)
    4de2:	0411                	addi	s0,s0,4
    4de4:	c63e                	sw	a5,12(sp)
    4de6:	b549                	j	4c68 <__v_printf+0xc8>
    4de8:	4542                	lw	a0,16(sp)
    4dea:	4629                	li	a2,10
    4dec:	00ac                	addi	a1,sp,72
    4dee:	ca3a                	sw	a4,20(sp)
    4df0:	d7dfd0ef          	jal	ra,2b6c <strtol>
    4df4:	c02a                	sw	a0,0(sp)
    4df6:	4752                	lw	a4,20(sp)
    4df8:	00055363          	bgez	a0,4dfe <__v_printf+0x25e>
    4dfc:	c002                	sw	zero,0(sp)
    4dfe:	47a6                	lw	a5,72(sp)
    4e00:	c83e                	sw	a5,16(sp)
    4e02:	bdf9                	j	4ce0 <__v_printf+0x140>
    4e04:	401c                	lw	a5,0(s0)
    4e06:	0411                	addi	s0,s0,4
    4e08:	04f103a3          	sb	a5,71(sp)
    4e0c:	b559                	j	4c92 <__v_printf+0xf2>
    4e0e:	5542                	lw	a0,48(sp)
    4e10:	b2bfd0ef          	jal	ra,293a <strerror>
    4e14:	c4aa                	sw	a0,72(sp)
    4e16:	c42a                	sw	a0,8(sp)
    4e18:	b3dfd0ef          	jal	ra,2954 <strlen>
    4e1c:	4722                	lw	a4,8(sp)
    4e1e:	40d4                	lw	a3,4(s1)
    4e20:	4090                	lw	a2,0(s1)
    4e22:	85aa                	mv	a1,a0
    4e24:	c02a                	sw	a0,0(sp)
    4e26:	853a                	mv	a0,a4
    4e28:	9682                	jalr	a3
    4e2a:	4712                	lw	a4,4(sp)
    4e2c:	4782                	lw	a5,0(sp)
    4e2e:	97ba                	add	a5,a5,a4
    4e30:	bd8d                	j	4ca2 <__v_printf+0x102>
    4e32:	4018                	lw	a4,0(s0)
    4e34:	00440793          	addi	a5,s0,4
    4e38:	c721                	beqz	a4,4e80 <__v_printf+0x2e0>
    4e3a:	c4ba                	sw	a4,72(sp)
    4e3c:	4526                	lw	a0,72(sp)
    4e3e:	cc3e                	sw	a5,24(sp)
    4e40:	b15fd0ef          	jal	ra,2954 <strlen>
    4e44:	4752                	lw	a4,20(sp)
    4e46:	832a                	mv	t1,a0
    4e48:	47e2                	lw	a5,24(sp)
    4e4a:	cf1d                	beqz	a4,4e88 <__v_printf+0x2e8>
    4e4c:	4702                	lw	a4,0(sp)
    4e4e:	00a77363          	bgeu	a4,a0,4e54 <__v_printf+0x2b4>
    4e52:	833a                	mv	t1,a4
    4e54:	843e                	mv	s0,a5
    4e56:	c002                	sw	zero,0(sp)
    4e58:	ca02                	sw	zero,20(sp)
    4e5a:	4281                	li	t0,0
    4e5c:	02000793          	li	a5,32
    4e60:	cc3e                	sw	a5,24(sp)
    4e62:	47b2                	lw	a5,12(sp)
    4e64:	4702                	lw	a4,0(sp)
    4e66:	46a6                	lw	a3,72(sp)
    4e68:	8fd9                	or	a5,a5,a4
    4e6a:	e39d                	bnez	a5,4e90 <__v_printf+0x2f0>
    4e6c:	40dc                	lw	a5,4(s1)
    4e6e:	4090                	lw	a2,0(s1)
    4e70:	859a                	mv	a1,t1
    4e72:	8536                	mv	a0,a3
    4e74:	c01a                	sw	t1,0(sp)
    4e76:	9782                	jalr	a5
    4e78:	4792                	lw	a5,4(sp)
    4e7a:	4302                	lw	t1,0(sp)
    4e7c:	979a                	add	a5,a5,t1
    4e7e:	b515                	j	4ca2 <__v_printf+0x102>
    4e80:	6719                	lui	a4,0x6
    4e82:	c0070713          	addi	a4,a4,-1024 # 5c00 <sbox+0x140>
    4e86:	bf55                	j	4e3a <__v_printf+0x29a>
    4e88:	843e                	mv	s0,a5
    4e8a:	4281                	li	t0,0
    4e8c:	c002                	sw	zero,0(sp)
    4e8e:	b7f9                	j	4e5c <__v_printf+0x2bc>
    4e90:	44029163          	bnez	t0,52d2 <__v_printf+0x732>
    4e94:	47a2                	lw	a5,8(sp)
    4e96:	3a078b63          	beqz	a5,524c <__v_printf+0x6ac>
    4e9a:	47a2                	lw	a5,8(sp)
    4e9c:	00f68733          	add	a4,a3,a5
    4ea0:	c4ba                	sw	a4,72(sp)
    4ea2:	4732                	lw	a4,12(sp)
    4ea4:	40f30333          	sub	t1,t1,a5
    4ea8:	8f1d                	sub	a4,a4,a5
    4eaa:	c63a                	sw	a4,12(sp)
    4eac:	5702                	lw	a4,32(sp)
    4eae:	3a070363          	beqz	a4,5254 <__v_printf+0x6b4>
    4eb2:	40d8                	lw	a4,4(s1)
    4eb4:	4090                	lw	a2,0(s1)
    4eb6:	85be                	mv	a1,a5
    4eb8:	8536                	mv	a0,a3
    4eba:	ca1a                	sw	t1,20(sp)
    4ebc:	c43e                	sw	a5,8(sp)
    4ebe:	9702                	jalr	a4
    4ec0:	4712                	lw	a4,4(sp)
    4ec2:	47a2                	lw	a5,8(sp)
    4ec4:	4352                	lw	t1,20(sp)
    4ec6:	97ba                	add	a5,a5,a4
    4ec8:	c23e                	sw	a5,4(sp)
    4eca:	4782                	lw	a5,0(sp)
    4ecc:	03000613          	li	a2,48
    4ed0:	8526                	mv	a0,s1
    4ed2:	406785b3          	sub	a1,a5,t1
    4ed6:	ca1a                	sw	t1,20(sp)
    4ed8:	c69ff0ef          	jal	ra,4b40 <write_pad>
    4edc:	4792                	lw	a5,4(sp)
    4ede:	4352                	lw	t1,20(sp)
    4ee0:	40d8                	lw	a4,4(s1)
    4ee2:	97aa                	add	a5,a5,a0
    4ee4:	4090                	lw	a2,0(s1)
    4ee6:	4526                	lw	a0,72(sp)
    4ee8:	859a                	mv	a1,t1
    4eea:	c43e                	sw	a5,8(sp)
    4eec:	c21a                	sw	t1,4(sp)
    4eee:	9702                	jalr	a4
    4ef0:	4312                	lw	t1,4(sp)
    4ef2:	47a2                	lw	a5,8(sp)
    4ef4:	4582                	lw	a1,0(sp)
    4ef6:	979a                	add	a5,a5,t1
    4ef8:	0065f363          	bgeu	a1,t1,4efe <__v_printf+0x35e>
    4efc:	859a                	mv	a1,t1
    4efe:	c03e                	sw	a5,0(sp)
    4f00:	47b2                	lw	a5,12(sp)
    4f02:	02000613          	li	a2,32
    4f06:	8526                	mv	a0,s1
    4f08:	40b785b3          	sub	a1,a5,a1
    4f0c:	c35ff0ef          	jal	ra,4b40 <write_pad>
    4f10:	4782                	lw	a5,0(sp)
    4f12:	97aa                	add	a5,a5,a0
    4f14:	b379                	j	4ca2 <__v_printf+0x102>
    4f16:	c78d                	beqz	a5,4f40 <__v_printf+0x3a0>
    4f18:	4662                	lw	a2,24(sp)
    4f1a:	03000713          	li	a4,48
    4f1e:	02e61163          	bne	a2,a4,4f40 <__v_printf+0x3a0>
    4f22:	40d8                	lw	a4,4(s1)
    4f24:	4090                	lw	a2,0(s1)
    4f26:	85be                	mv	a1,a5
    4f28:	8536                	mv	a0,a3
    4f2a:	ca1a                	sw	t1,20(sp)
    4f2c:	c43e                	sw	a5,8(sp)
    4f2e:	c036                	sw	a3,0(sp)
    4f30:	9702                	jalr	a4
    4f32:	4712                	lw	a4,4(sp)
    4f34:	47a2                	lw	a5,8(sp)
    4f36:	4352                	lw	t1,20(sp)
    4f38:	4682                	lw	a3,0(sp)
    4f3a:	97ba                	add	a5,a5,a4
    4f3c:	c23e                	sw	a5,4(sp)
    4f3e:	4781                	li	a5,0
    4f40:	c43e                	sw	a5,8(sp)
    4f42:	47b2                	lw	a5,12(sp)
    4f44:	4662                	lw	a2,24(sp)
    4f46:	8526                	mv	a0,s1
    4f48:	406785b3          	sub	a1,a5,t1
    4f4c:	c01a                	sw	t1,0(sp)
    4f4e:	ca36                	sw	a3,20(sp)
    4f50:	bf1ff0ef          	jal	ra,4b40 <write_pad>
    4f54:	4792                	lw	a5,4(sp)
    4f56:	4302                	lw	t1,0(sp)
    4f58:	00a78733          	add	a4,a5,a0
    4f5c:	47a2                	lw	a5,8(sp)
    4f5e:	34078e63          	beqz	a5,52ba <__v_printf+0x71a>
    4f62:	46d2                	lw	a3,20(sp)
    4f64:	0044a383          	lw	t2,4(s1)
    4f68:	4090                	lw	a2,0(s1)
    4f6a:	85be                	mv	a1,a5
    4f6c:	8536                	mv	a0,a3
    4f6e:	c41a                	sw	t1,8(sp)
    4f70:	c23a                	sw	a4,4(sp)
    4f72:	c03e                	sw	a5,0(sp)
    4f74:	9382                	jalr	t2
    4f76:	4782                	lw	a5,0(sp)
    4f78:	4712                	lw	a4,4(sp)
    4f7a:	4322                	lw	t1,8(sp)
    4f7c:	973e                	add	a4,a4,a5
    4f7e:	ae35                	j	52ba <__v_printf+0x71a>
    4f80:	07800793          	li	a5,120
    4f84:	04f103a3          	sb	a5,71(sp)
    4f88:	4789                	li	a5,2
    4f8a:	4705                	li	a4,1
    4f8c:	c43e                	sw	a5,8(sp)
    4f8e:	04714783          	lbu	a5,71(sp)
    4f92:	fa878793          	addi	a5,a5,-88
    4f96:	0017b793          	seqz	a5,a5
    4f9a:	46a2                	lw	a3,8(sp)
    4f9c:	4301                	li	t1,0
    4f9e:	ce81                	beqz	a3,4fb6 <__v_printf+0x416>
    4fa0:	03000693          	li	a3,48
    4fa4:	04d106a3          	sb	a3,77(sp)
    4fa8:	04714683          	lbu	a3,71(sp)
    4fac:	4309                	li	t1,2
    4fae:	04d10723          	sb	a3,78(sp)
    4fb2:	4689                	li	a3,2
    4fb4:	c436                	sw	a3,8(sp)
    4fb6:	46b2                	lw	a3,12(sp)
    4fb8:	4602                	lw	a2,0(sp)
    4fba:	00c6f363          	bgeu	a3,a2,4fc0 <__v_printf+0x420>
    4fbe:	c632                	sw	a2,12(sp)
    4fc0:	4541                	li	a0,16
    4fc2:	4281                	li	t0,0
    4fc4:	04d10693          	addi	a3,sp,77
    4fc8:	c4b6                	sw	a3,72(sp)
    4fca:	0ae05a63          	blez	a4,507e <__v_printf+0x4de>
    4fce:	4685                	li	a3,1
    4fd0:	08d70c63          	beq	a4,a3,5068 <__v_printf+0x4c8>
    4fd4:	00840393          	addi	t2,s0,8
    4fd8:	4010                	lw	a2,0(s0)
    4fda:	4054                	lw	a3,4(s0)
    4fdc:	4581                	li	a1,0
    4fde:	08028c63          	beqz	t0,5076 <__v_printf+0x4d6>
    4fe2:	0006da63          	bgez	a3,4ff6 <__v_printf+0x456>
    4fe6:	40c00633          	neg	a2,a2
    4fea:	00c03733          	snez	a4,a2
    4fee:	40d006b3          	neg	a3,a3
    4ff2:	8e99                	sub	a3,a3,a4
    4ff4:	4289                	li	t0,2
    4ff6:	872a                	mv	a4,a0
    4ff8:	04d10513          	addi	a0,sp,77
    4ffc:	951a                	add	a0,a0,t1
    4ffe:	07b00593          	li	a1,123
    5002:	da1e                	sw	t2,52(sp)
    5004:	d416                	sw	t0,40(sp)
    5006:	d21a                	sw	t1,36(sp)
    5008:	943ff0ef          	jal	ra,494a <__lltostr>
    500c:	53d2                	lw	t2,52(sp)
    500e:	5312                	lw	t1,36(sp)
    5010:	52a2                	lw	t0,40(sp)
    5012:	841e                	mv	s0,t2
    5014:	4752                	lw	a4,20(sp)
    5016:	47a6                	lw	a5,72(sp)
    5018:	cb5d                	beqz	a4,50ce <__v_printf+0x52e>
    501a:	4705                	li	a4,1
    501c:	0ae51963          	bne	a0,a4,50ce <__v_printf+0x52e>
    5020:	00678733          	add	a4,a5,t1
    5024:	00074683          	lbu	a3,0(a4)
    5028:	03000713          	li	a4,48
    502c:	0ae69163          	bne	a3,a4,50ce <__v_printf+0x52e>
    5030:	4702                	lw	a4,0(sp)
    5032:	c345                	beqz	a4,50d2 <__v_printf+0x532>
    5034:	4722                	lw	a4,8(sp)
    5036:	c319                	beqz	a4,503c <__v_printf+0x49c>
    5038:	c402                	sw	zero,8(sp)
    503a:	4301                	li	t1,0
    503c:	4709                	li	a4,2
    503e:	08e29d63          	bne	t0,a4,50d8 <__v_printf+0x538>
    5042:	fff78713          	addi	a4,a5,-1
    5046:	c4ba                	sw	a4,72(sp)
    5048:	02d00713          	li	a4,45
    504c:	fee78fa3          	sb	a4,-1(a5)
    5050:	0305                	addi	t1,t1,1
    5052:	bd01                	j	4e62 <__v_printf+0x2c2>
    5054:	4781                	li	a5,0
    5056:	b791                	j	4f9a <__v_printf+0x3fa>
    5058:	4509                	li	a0,2
    505a:	4781                	li	a5,0
    505c:	4281                	li	t0,0
    505e:	b9c9                	j	4d30 <__v_printf+0x190>
    5060:	4781                	li	a5,0
    5062:	4281                	li	t0,0
    5064:	4521                	li	a0,8
    5066:	b1e9                	j	4d30 <__v_printf+0x190>
    5068:	00440393          	addi	t2,s0,4
    506c:	400c                	lw	a1,0(s0)
    506e:	00029d63          	bnez	t0,5088 <__v_printf+0x4e8>
    5072:	4601                	li	a2,0
    5074:	4681                	li	a3,0
    5076:	4405                	li	s0,1
    5078:	f6e44fe3          	blt	s0,a4,4ff6 <__v_printf+0x456>
    507c:	a01d                	j	50a2 <__v_printf+0x502>
    507e:	00440393          	addi	t2,s0,4
    5082:	400c                	lw	a1,0(s0)
    5084:	00028863          	beqz	t0,5094 <__v_printf+0x4f4>
    5088:	4285                	li	t0,1
    508a:	0005d563          	bgez	a1,5094 <__v_printf+0x4f4>
    508e:	40b005b3          	neg	a1,a1
    5092:	4289                	li	t0,2
    5094:	fc075fe3          	bgez	a4,5072 <__v_printf+0x4d2>
    5098:	56fd                	li	a3,-1
    509a:	02d70763          	beq	a4,a3,50c8 <__v_printf+0x528>
    509e:	0ff5f593          	andi	a1,a1,255
    50a2:	873e                	mv	a4,a5
    50a4:	04d10793          	addi	a5,sp,77
    50a8:	86aa                	mv	a3,a0
    50aa:	862e                	mv	a2,a1
    50ac:	00678533          	add	a0,a5,t1
    50b0:	07b00593          	li	a1,123
    50b4:	da1e                	sw	t2,52(sp)
    50b6:	d416                	sw	t0,40(sp)
    50b8:	d21a                	sw	t1,36(sp)
    50ba:	9f7ff0ef          	jal	ra,4ab0 <__ltostr>
    50be:	53d2                	lw	t2,52(sp)
    50c0:	52a2                	lw	t0,40(sp)
    50c2:	5312                	lw	t1,36(sp)
    50c4:	841e                	mv	s0,t2
    50c6:	b7b9                	j	5014 <__v_printf+0x474>
    50c8:	05c2                	slli	a1,a1,0x10
    50ca:	81c1                	srli	a1,a1,0x10
    50cc:	bfd9                	j	50a2 <__v_printf+0x502>
    50ce:	932a                	add	t1,t1,a0
    50d0:	b7b5                	j	503c <__v_printf+0x49c>
    50d2:	4301                	li	t1,0
    50d4:	c402                	sw	zero,8(sp)
    50d6:	b79d                	j	503c <__v_printf+0x49c>
    50d8:	d80285e3          	beqz	t0,4e62 <__v_printf+0x2c2>
    50dc:	4772                	lw	a4,28(sp)
    50de:	ef19                	bnez	a4,50fc <__v_printf+0x55c>
    50e0:	5732                	lw	a4,44(sp)
    50e2:	4281                	li	t0,0
    50e4:	d6070fe3          	beqz	a4,4e62 <__v_printf+0x2c2>
    50e8:	02000713          	li	a4,32
    50ec:	fff78693          	addi	a3,a5,-1
    50f0:	c4b6                	sw	a3,72(sp)
    50f2:	fee78fa3          	sb	a4,-1(a5)
    50f6:	0305                	addi	t1,t1,1
    50f8:	4285                	li	t0,1
    50fa:	b3a5                	j	4e62 <__v_printf+0x2c2>
    50fc:	02b00713          	li	a4,43
    5100:	b7f5                	j	50ec <__v_printf+0x54c>
    5102:	00840793          	addi	a5,s0,8
    5106:	da3e                	sw	a5,52(sp)
    5108:	401c                	lw	a5,0(s0)
    510a:	d23e                	sw	a5,36(sp)
    510c:	405c                	lw	a5,4(s0)
    510e:	d43e                	sw	a5,40(sp)
    5110:	04d10793          	addi	a5,sp,77
    5114:	c4be                	sw	a5,72(sp)
    5116:	47b2                	lw	a5,12(sp)
    5118:	e399                	bnez	a5,511e <__v_printf+0x57e>
    511a:	4785                	li	a5,1
    511c:	c63e                	sw	a5,12(sp)
    511e:	47d2                	lw	a5,20(sp)
    5120:	e399                	bnez	a5,5126 <__v_printf+0x586>
    5122:	4799                	li	a5,6
    5124:	c03e                	sw	a5,0(sp)
    5126:	42f2                	lw	t0,28(sp)
    5128:	00029e63          	bnez	t0,5144 <__v_printf+0x5a4>
    512c:	5712                	lw	a4,36(sp)
    512e:	57a2                	lw	a5,40(sp)
    5130:	4601                	li	a2,0
    5132:	4681                	li	a3,0
    5134:	853a                	mv	a0,a4
    5136:	85be                	mv	a1,a5
    5138:	dc1a                	sw	t1,56(sp)
    513a:	c34fc0ef          	jal	ra,156e <__ledf2>
    513e:	5362                	lw	t1,56(sp)
    5140:	01f55293          	srli	t0,a0,0x1f
    5144:	5412                	lw	s0,36(sp)
    5146:	53a2                	lw	t2,40(sp)
    5148:	4782                	lw	a5,0(sp)
    514a:	4732                	lw	a4,12(sp)
    514c:	07f00693          	li	a3,127
    5150:	04d10613          	addi	a2,sp,77
    5154:	8522                	mv	a0,s0
    5156:	859e                	mv	a1,t2
    5158:	c096                	sw	t0,64(sp)
    515a:	dc1a                	sw	t1,56(sp)
    515c:	bc4ff0ef          	jal	ra,4520 <__dtostr>
    5160:	47d2                	lw	a5,20(sp)
    5162:	de2a                	sw	a0,60(sp)
    5164:	5362                	lw	t1,56(sp)
    5166:	4286                	lw	t0,64(sp)
    5168:	cb95                	beqz	a5,519c <__v_printf+0x5fc>
    516a:	4426                	lw	s0,72(sp)
    516c:	02e00593          	li	a1,46
    5170:	dc16                	sw	t0,56(sp)
    5172:	8522                	mv	a0,s0
    5174:	ca1a                	sw	t1,20(sp)
    5176:	aecfd0ef          	jal	ra,2462 <strchr>
    517a:	4352                	lw	t1,20(sp)
    517c:	52e2                	lw	t0,56(sp)
    517e:	57f2                	lw	a5,60(sp)
    5180:	cd49                	beqz	a0,521a <__v_printf+0x67a>
    5182:	4782                	lw	a5,0(sp)
    5184:	e399                	bnez	a5,518a <__v_printf+0x5ea>
    5186:	47a2                	lw	a5,8(sp)
    5188:	cb81                	beqz	a5,5198 <__v_printf+0x5f8>
    518a:	0505                	addi	a0,a0,1
    518c:	4782                	lw	a5,0(sp)
    518e:	c789                	beqz	a5,5198 <__v_printf+0x5f8>
    5190:	0505                	addi	a0,a0,1
    5192:	00054783          	lbu	a5,0(a0)
    5196:	efb5                	bnez	a5,5212 <__v_printf+0x672>
    5198:	00050023          	sb	zero,0(a0)
    519c:	06700793          	li	a5,103
    51a0:	04f31a63          	bne	t1,a5,51f4 <__v_printf+0x654>
    51a4:	4526                	lw	a0,72(sp)
    51a6:	02e00593          	li	a1,46
    51aa:	c416                	sw	t0,8(sp)
    51ac:	ab6fd0ef          	jal	ra,2462 <strchr>
    51b0:	842a                	mv	s0,a0
    51b2:	42a2                	lw	t0,8(sp)
    51b4:	c121                	beqz	a0,51f4 <__v_printf+0x654>
    51b6:	06500593          	li	a1,101
    51ba:	aa8fd0ef          	jal	ra,2462 <strchr>
    51be:	42a2                	lw	t0,8(sp)
    51c0:	85aa                	mv	a1,a0
    51c2:	00044783          	lbu	a5,0(s0)
    51c6:	e7b5                	bnez	a5,5232 <__v_printf+0x692>
    51c8:	c191                	beqz	a1,51cc <__v_printf+0x62c>
    51ca:	842e                	mv	s0,a1
    51cc:	03000693          	li	a3,48
    51d0:	fff44703          	lbu	a4,-1(s0)
    51d4:	fff40513          	addi	a0,s0,-1
    51d8:	04d70f63          	beq	a4,a3,5236 <__v_printf+0x696>
    51dc:	02e00693          	li	a3,46
    51e0:	00d70363          	beq	a4,a3,51e6 <__v_printf+0x646>
    51e4:	8522                	mv	a0,s0
    51e6:	00050023          	sb	zero,0(a0)
    51ea:	c589                	beqz	a1,51f4 <__v_printf+0x654>
    51ec:	c416                	sw	t0,8(sp)
    51ee:	b6afd0ef          	jal	ra,2558 <strcpy>
    51f2:	42a2                	lw	t0,8(sp)
    51f4:	47f2                	lw	a5,28(sp)
    51f6:	10079263          	bnez	a5,52fa <__v_printf+0x75a>
    51fa:	57b2                	lw	a5,44(sp)
    51fc:	e3e5                	bnez	a5,52dc <__v_printf+0x73c>
    51fe:	4526                	lw	a0,72(sp)
    5200:	ce16                	sw	t0,28(sp)
    5202:	f52fd0ef          	jal	ra,2954 <strlen>
    5206:	832a                	mv	t1,a0
    5208:	5452                	lw	s0,52(sp)
    520a:	ca02                	sw	zero,20(sp)
    520c:	c402                	sw	zero,8(sp)
    520e:	42f2                	lw	t0,28(sp)
    5210:	b989                	j	4e62 <__v_printf+0x2c2>
    5212:	4782                	lw	a5,0(sp)
    5214:	17fd                	addi	a5,a5,-1
    5216:	c03e                	sw	a5,0(sp)
    5218:	bf95                	j	518c <__v_printf+0x5ec>
    521a:	4722                	lw	a4,8(sp)
    521c:	d341                	beqz	a4,519c <__v_printf+0x5fc>
    521e:	943e                	add	s0,s0,a5
    5220:	02e00713          	li	a4,46
    5224:	00e40023          	sb	a4,0(s0)
    5228:	4526                	lw	a0,72(sp)
    522a:	953e                	add	a0,a0,a5
    522c:	000500a3          	sb	zero,1(a0)
    5230:	b7b5                	j	519c <__v_printf+0x5fc>
    5232:	0405                	addi	s0,s0,1
    5234:	b779                	j	51c2 <__v_printf+0x622>
    5236:	842a                	mv	s0,a0
    5238:	bf61                	j	51d0 <__v_printf+0x630>
    523a:	57fd                	li	a5,-1
    523c:	c23e                	sw	a5,4(sp)
    523e:	40de                	lw	ra,212(sp)
    5240:	444e                	lw	s0,208(sp)
    5242:	4512                	lw	a0,4(sp)
    5244:	44be                	lw	s1,204(sp)
    5246:	0d810113          	addi	sp,sp,216
    524a:	8082                	ret
    524c:	5782                	lw	a5,32(sp)
    524e:	c6079ee3          	bnez	a5,4eca <__v_printf+0x32a>
    5252:	4781                	li	a5,0
    5254:	4752                	lw	a4,20(sp)
    5256:	cc0700e3          	beqz	a4,4f16 <__v_printf+0x376>
    525a:	4582                	lw	a1,0(sp)
    525c:	0065f363          	bgeu	a1,t1,5262 <__v_printf+0x6c2>
    5260:	859a                	mv	a1,t1
    5262:	ca3e                	sw	a5,20(sp)
    5264:	47b2                	lw	a5,12(sp)
    5266:	02000613          	li	a2,32
    526a:	8526                	mv	a0,s1
    526c:	40b785b3          	sub	a1,a5,a1
    5270:	c41a                	sw	t1,8(sp)
    5272:	cc36                	sw	a3,24(sp)
    5274:	8cdff0ef          	jal	ra,4b40 <write_pad>
    5278:	4792                	lw	a5,4(sp)
    527a:	4322                	lw	t1,8(sp)
    527c:	00f50733          	add	a4,a0,a5
    5280:	47d2                	lw	a5,20(sp)
    5282:	cf99                	beqz	a5,52a0 <__v_printf+0x700>
    5284:	46e2                	lw	a3,24(sp)
    5286:	0044a383          	lw	t2,4(s1)
    528a:	4090                	lw	a2,0(s1)
    528c:	85be                	mv	a1,a5
    528e:	8536                	mv	a0,a3
    5290:	c61a                	sw	t1,12(sp)
    5292:	c43a                	sw	a4,8(sp)
    5294:	c23e                	sw	a5,4(sp)
    5296:	9382                	jalr	t2
    5298:	4792                	lw	a5,4(sp)
    529a:	4722                	lw	a4,8(sp)
    529c:	4332                	lw	t1,12(sp)
    529e:	973e                	add	a4,a4,a5
    52a0:	4782                	lw	a5,0(sp)
    52a2:	03000613          	li	a2,48
    52a6:	8526                	mv	a0,s1
    52a8:	406785b3          	sub	a1,a5,t1
    52ac:	c23a                	sw	a4,4(sp)
    52ae:	c01a                	sw	t1,0(sp)
    52b0:	891ff0ef          	jal	ra,4b40 <write_pad>
    52b4:	4712                	lw	a4,4(sp)
    52b6:	4302                	lw	t1,0(sp)
    52b8:	972a                	add	a4,a4,a0
    52ba:	40dc                	lw	a5,4(s1)
    52bc:	4090                	lw	a2,0(s1)
    52be:	4526                	lw	a0,72(sp)
    52c0:	859a                	mv	a1,t1
    52c2:	c23a                	sw	a4,4(sp)
    52c4:	c01a                	sw	t1,0(sp)
    52c6:	9782                	jalr	a5
    52c8:	4302                	lw	t1,0(sp)
    52ca:	4712                	lw	a4,4(sp)
    52cc:	006707b3          	add	a5,a4,t1
    52d0:	bac9                	j	4ca2 <__v_printf+0x102>
    52d2:	47a2                	lw	a5,8(sp)
    52d4:	bc0793e3          	bnez	a5,4e9a <__v_printf+0x2fa>
    52d8:	4785                	li	a5,1
    52da:	b6c9                	j	4e9c <__v_printf+0x2fc>
    52dc:	57a2                	lw	a5,40(sp)
    52de:	5712                	lw	a4,36(sp)
    52e0:	4601                	li	a2,0
    52e2:	85be                	mv	a1,a5
    52e4:	4681                	li	a3,0
    52e6:	853a                	mv	a0,a4
    52e8:	c416                	sw	t0,8(sp)
    52ea:	9cefc0ef          	jal	ra,14b8 <__gedf2>
    52ee:	02000793          	li	a5,32
    52f2:	42a2                	lw	t0,8(sp)
    52f4:	02055163          	bgez	a0,5316 <__v_printf+0x776>
    52f8:	b719                	j	51fe <__v_printf+0x65e>
    52fa:	5712                	lw	a4,36(sp)
    52fc:	57a2                	lw	a5,40(sp)
    52fe:	4601                	li	a2,0
    5300:	4681                	li	a3,0
    5302:	853a                	mv	a0,a4
    5304:	85be                	mv	a1,a5
    5306:	c416                	sw	t0,8(sp)
    5308:	9b0fc0ef          	jal	ra,14b8 <__gedf2>
    530c:	42a2                	lw	t0,8(sp)
    530e:	ee0548e3          	bltz	a0,51fe <__v_printf+0x65e>
    5312:	02b00793          	li	a5,43
    5316:	4726                	lw	a4,72(sp)
    5318:	fff70693          	addi	a3,a4,-1
    531c:	c4b6                	sw	a3,72(sp)
    531e:	fef70fa3          	sb	a5,-1(a4)
    5322:	bdf1                	j	51fe <__v_printf+0x65e>
    5324:	8a071fe3          	bnez	a4,4be2 <__v_printf+0x42>
    5328:	47c2                	lw	a5,16(sp)
    532a:	c83e                	sw	a5,16(sp)
    532c:	b071                	j	4bb8 <__v_printf+0x18>
	...
