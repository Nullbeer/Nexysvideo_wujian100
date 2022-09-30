
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
      24:	50010113          	addi	sp,sp,1280 # 20001520 <g_top_irqstack>

    /* Load data section */
    la      a0, __erodata
      28:	00006517          	auipc	a0,0x6
      2c:	27850513          	addi	a0,a0,632 # 62a0 <__ctor_end__>
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
      54:	da858593          	addi	a1,a1,-600 # 20001df8 <__bss_end__>
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
      66:	4a1030ef          	jal	ra,3d06 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal     board_init
      6a:	4cd020ef          	jal	ra,2d36 <board_init>
#endif

    jal     main
      6e:	04a040ef          	jal	ra,40b8 <main>

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
      b0:	b4428293          	addi	t0,t0,-1212 # 20001bf0 <g_irqvector>
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
     122:	60228293          	addi	t0,t0,1538 # 20001720 <g_trap_sp>
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
     17c:	3e9030ef          	jal	ra,3d64 <trap_c>


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
     20e:	1de68693          	addi	a3,a3,478 # 53e8 <__clz_tab>
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
     366:	fff70793          	addi	a5,a4,-1 # ffff <__ctor_end__+0x9d5f>
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
     438:	fb458593          	addi	a1,a1,-76 # 53e8 <__clz_tab>
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
     502:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0x9d5f>
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
     576:	e7668693          	addi	a3,a3,-394 # 53e8 <__clz_tab>
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
     75a:	c9228293          	addi	t0,t0,-878 # 53e8 <__clz_tab>
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
     834:	fff40593          	addi	a1,s0,-1 # ffff <__ctor_end__+0x9d5f>
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
     9ae:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f9d40>
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
     a60:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f9d40>
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
     bb6:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f9d40>
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
     bfa:	fff28693          	addi	a3,t0,-1 # ffffff <__ctor_end__+0xff9d5f>
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
     c7a:	fe068293          	addi	t0,a3,-32 # 7fffe0 <__ctor_end__+0x7f9d40>
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
     f4e:	42658593          	addi	a1,a1,1062 # 5370 <__srodata+0x10>
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
    10d4:	fff30693          	addi	a3,t1,-1 # fffff <__ctor_end__+0xf9d5f>
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
    110a:	fff28393          	addi	t2,t0,-1 # 7fffff <__ctor_end__+0x7f9d5f>
    110e:	00c7e763          	bltu	a5,a2,111c <__divdf3+0x272>
    1112:	0067f563          	bgeu	a5,t1,111c <__divdf3+0x272>
    1116:	ffe28393          	addi	t2,t0,-2
    111a:	97b2                	add	a5,a5,a2
    111c:	06c2                	slli	a3,a3,0x10
    111e:	6441                	lui	s0,0x10
    1120:	0076e6b3          	or	a3,a3,t2
    1124:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0x9d5f>
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
    118c:	fff68393          	addi	t2,a3,-1 # 7fffff <__ctor_end__+0x7f9d5f>
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
    11ee:	fff40693          	addi	a3,s0,-1 # ffff <__ctor_end__+0x9d5f>
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
    12ca:	3ff78793          	addi	a5,a5,1023 # 8003ff <__ctor_end__+0x7fa15f>
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
    16c8:	ce860613          	addi	a2,a2,-792 # 53ac <__srodata+0x4c>
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
    186a:	fff60393          	addi	t2,a2,-1 # ffff <__ctor_end__+0x9d5f>
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
    18ae:	fff70413          	addi	s0,a4,-1 # ffff <__ctor_end__+0x9d5f>
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
    1960:	3ff78793          	addi	a5,a5,1023 # 10003ff <__ctor_end__+0xffa15f>
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
    1b16:	fff28593          	addi	a1,t0,-1 # ffff <__ctor_end__+0x9d5f>
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
    1c6a:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f9d40>
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
    1ce8:	00450713          	addi	a4,a0,4 # 10004 <__ctor_end__+0x9d64>
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
    1dc2:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f9d40>
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
    1e88:	fe058293          	addi	t0,a1,-32 # 7fffe0 <__ctor_end__+0x7f9d40>
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
    20c0:	fff68793          	addi	a5,a3,-1 # fffff <__ctor_end__+0xf9d5f>
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
    21a0:	24c78793          	addi	a5,a5,588 # 53e8 <__clz_tab>
    21a4:	953e                	add	a0,a0,a5
    21a6:	00054503          	lbu	a0,0(a0) # 80000000 <__heap_end+0x5ffd0000>
    21aa:	40a70533          	sub	a0,a4,a0
    21ae:	8082                	ret
    21b0:	01000737          	lui	a4,0x1000
    21b4:	47c1                	li	a5,16
    21b6:	fce56ee3          	bltu	a0,a4,2192 <__clzsi2+0x10>
    21ba:	47e1                	li	a5,24
    21bc:	bfd9                	j	2192 <__clzsi2+0x10>

000021be <memcmp>:
    21be:	478d                	li	a5,3
    21c0:	02c7f063          	bgeu	a5,a2,21e0 <memcmp+0x22>
    21c4:	00b567b3          	or	a5,a0,a1
    21c8:	8b8d                	andi	a5,a5,3
    21ca:	468d                	li	a3,3
    21cc:	ef9d                	bnez	a5,220a <memcmp+0x4c>
    21ce:	4118                	lw	a4,0(a0)
    21d0:	419c                	lw	a5,0(a1)
    21d2:	02f71c63          	bne	a4,a5,220a <memcmp+0x4c>
    21d6:	1671                	addi	a2,a2,-4
    21d8:	0511                	addi	a0,a0,4
    21da:	0591                	addi	a1,a1,4
    21dc:	fec6e9e3          	bltu	a3,a2,21ce <memcmp+0x10>
    21e0:	fff60693          	addi	a3,a2,-1
    21e4:	c20d                	beqz	a2,2206 <memcmp+0x48>
    21e6:	0685                	addi	a3,a3,1
    21e8:	96aa                	add	a3,a3,a0
    21ea:	a019                	j	21f0 <memcmp+0x32>
    21ec:	00d50d63          	beq	a0,a3,2206 <memcmp+0x48>
    21f0:	00054783          	lbu	a5,0(a0)
    21f4:	0005c703          	lbu	a4,0(a1)
    21f8:	0505                	addi	a0,a0,1
    21fa:	0585                	addi	a1,a1,1
    21fc:	fee788e3          	beq	a5,a4,21ec <memcmp+0x2e>
    2200:	40e78533          	sub	a0,a5,a4
    2204:	8082                	ret
    2206:	4501                	li	a0,0
    2208:	8082                	ret
    220a:	fff60693          	addi	a3,a2,-1
    220e:	bfe1                	j	21e6 <memcmp+0x28>

00002210 <memcpy>:
    2210:	00463693          	sltiu	a3,a2,4
    2214:	82aa                	mv	t0,a0
    2216:	00c50333          	add	t1,a0,a2
    221a:	e6a5                	bnez	a3,2282 <memcpy+0x72>
    221c:	00b546b3          	xor	a3,a0,a1
    2220:	8a8d                	andi	a3,a3,3
    2222:	e2a5                	bnez	a3,2282 <memcpy+0x72>
    2224:	00357693          	andi	a3,a0,3
    2228:	4391                	li	t2,4
    222a:	e6bd                	bnez	a3,2298 <memcpy+0x88>
    222c:	ffc37393          	andi	t2,t1,-4
    2230:	fe038313          	addi	t1,t2,-32 # ffe0 <__ctor_end__+0x9d40>
    2234:	02a36a63          	bltu	t1,a0,2268 <memcpy+0x58>
    2238:	8a7d                	andi	a2,a2,31
    223a:	0001                	nop
    223c:	4198                	lw	a4,0(a1)
    223e:	c118                	sw	a4,0(a0)
    2240:	41dc                	lw	a5,4(a1)
    2242:	c15c                	sw	a5,4(a0)
    2244:	4598                	lw	a4,8(a1)
    2246:	c518                	sw	a4,8(a0)
    2248:	45dc                	lw	a5,12(a1)
    224a:	c55c                	sw	a5,12(a0)
    224c:	4998                	lw	a4,16(a1)
    224e:	c918                	sw	a4,16(a0)
    2250:	49dc                	lw	a5,20(a1)
    2252:	c95c                	sw	a5,20(a0)
    2254:	4d98                	lw	a4,24(a1)
    2256:	cd18                	sw	a4,24(a0)
    2258:	4ddc                	lw	a5,28(a1)
    225a:	02058593          	addi	a1,a1,32
    225e:	cd5c                	sw	a5,28(a0)
    2260:	02050513          	addi	a0,a0,32
    2264:	fca37ce3          	bgeu	t1,a0,223c <memcpy+0x2c>
    2268:	ffc38313          	addi	t1,t2,-4
    226c:	00a36963          	bltu	t1,a0,227e <memcpy+0x6e>
    2270:	8a0d                	andi	a2,a2,3
    2272:	4198                	lw	a4,0(a1)
    2274:	0591                	addi	a1,a1,4
    2276:	c118                	sw	a4,0(a0)
    2278:	0511                	addi	a0,a0,4
    227a:	fea37ce3          	bgeu	t1,a0,2272 <memcpy+0x62>
    227e:	00c50333          	add	t1,a0,a2
    2282:	ca09                	beqz	a2,2294 <memcpy+0x84>
    2284:	00058703          	lb	a4,0(a1)
    2288:	0585                	addi	a1,a1,1
    228a:	00e50023          	sb	a4,0(a0)
    228e:	0505                	addi	a0,a0,1
    2290:	fe656ae3          	bltu	a0,t1,2284 <memcpy+0x74>
    2294:	8516                	mv	a0,t0
    2296:	8082                	ret
    2298:	40d386b3          	sub	a3,t2,a3
    229c:	83b6                	mv	t2,a3
    229e:	00058703          	lb	a4,0(a1)
    22a2:	0585                	addi	a1,a1,1
    22a4:	16fd                	addi	a3,a3,-1
    22a6:	00e50023          	sb	a4,0(a0)
    22aa:	0505                	addi	a0,a0,1
    22ac:	faed                	bnez	a3,229e <memcpy+0x8e>
    22ae:	40760633          	sub	a2,a2,t2
    22b2:	00263693          	sltiu	a3,a2,2
    22b6:	f6f1                	bnez	a3,2282 <memcpy+0x72>
    22b8:	bf95                	j	222c <memcpy+0x1c>
	...

000022bc <memmove>:
    22bc:	02a5f263          	bgeu	a1,a0,22e0 <memmove+0x24>
    22c0:	00c587b3          	add	a5,a1,a2
    22c4:	00f57e63          	bgeu	a0,a5,22e0 <memmove+0x24>
    22c8:	00c50733          	add	a4,a0,a2
    22cc:	c20d                	beqz	a2,22ee <memmove+0x32>
    22ce:	fff7c683          	lbu	a3,-1(a5)
    22d2:	17fd                	addi	a5,a5,-1
    22d4:	177d                	addi	a4,a4,-1
    22d6:	00d70023          	sb	a3,0(a4) # 1000000 <__ctor_end__+0xff9d60>
    22da:	fef59ae3          	bne	a1,a5,22ce <memmove+0x12>
    22de:	8082                	ret
    22e0:	47bd                	li	a5,15
    22e2:	00c7e763          	bltu	a5,a2,22f0 <memmove+0x34>
    22e6:	87aa                	mv	a5,a0
    22e8:	fff60693          	addi	a3,a2,-1
    22ec:	ea09                	bnez	a2,22fe <memmove+0x42>
    22ee:	8082                	ret
    22f0:	00a5e7b3          	or	a5,a1,a0
    22f4:	8b8d                	andi	a5,a5,3
    22f6:	cf99                	beqz	a5,2314 <memmove+0x58>
    22f8:	fff60693          	addi	a3,a2,-1
    22fc:	87aa                	mv	a5,a0
    22fe:	0685                	addi	a3,a3,1
    2300:	96be                	add	a3,a3,a5
    2302:	0005c703          	lbu	a4,0(a1)
    2306:	0785                	addi	a5,a5,1
    2308:	0585                	addi	a1,a1,1
    230a:	fee78fa3          	sb	a4,-1(a5)
    230e:	fed79ae3          	bne	a5,a3,2302 <memmove+0x46>
    2312:	8082                	ret
    2314:	ff060293          	addi	t0,a2,-16
    2318:	ff02f293          	andi	t0,t0,-16
    231c:	02c1                	addi	t0,t0,16
    231e:	00550333          	add	t1,a0,t0
    2322:	872e                	mv	a4,a1
    2324:	87aa                	mv	a5,a0
    2326:	4314                	lw	a3,0(a4)
    2328:	0741                	addi	a4,a4,16
    232a:	07c1                	addi	a5,a5,16
    232c:	fed7a823          	sw	a3,-16(a5)
    2330:	ff472683          	lw	a3,-12(a4)
    2334:	fed7aa23          	sw	a3,-12(a5)
    2338:	ff872683          	lw	a3,-8(a4)
    233c:	fed7ac23          	sw	a3,-8(a5)
    2340:	ffc72683          	lw	a3,-4(a4)
    2344:	fed7ae23          	sw	a3,-4(a5)
    2348:	fcf31fe3          	bne	t1,a5,2326 <memmove+0x6a>
    234c:	00c67713          	andi	a4,a2,12
    2350:	9596                	add	a1,a1,t0
    2352:	00f67313          	andi	t1,a2,15
    2356:	cb21                	beqz	a4,23a6 <memmove+0xea>
    2358:	1171                	addi	sp,sp,-4
    235a:	c022                	sw	s0,0(sp)
    235c:	872e                	mv	a4,a1
    235e:	82be                	mv	t0,a5
    2360:	440d                	li	s0,3
    2362:	00072383          	lw	t2,0(a4)
    2366:	0711                	addi	a4,a4,4
    2368:	40e306b3          	sub	a3,t1,a4
    236c:	0072a023          	sw	t2,0(t0) # 800000 <__ctor_end__+0x7f9d60>
    2370:	96ae                	add	a3,a3,a1
    2372:	0291                	addi	t0,t0,4
    2374:	fed467e3          	bltu	s0,a3,2362 <memmove+0xa6>
    2378:	ffc30713          	addi	a4,t1,-4 # ffffc <__ctor_end__+0xf9d5c>
    237c:	9b71                	andi	a4,a4,-4
    237e:	8a0d                	andi	a2,a2,3
    2380:	0711                	addi	a4,a4,4
    2382:	fff60693          	addi	a3,a2,-1
    2386:	97ba                	add	a5,a5,a4
    2388:	0685                	addi	a3,a3,1
    238a:	95ba                	add	a1,a1,a4
    238c:	96be                	add	a3,a3,a5
    238e:	ca09                	beqz	a2,23a0 <memmove+0xe4>
    2390:	0005c703          	lbu	a4,0(a1)
    2394:	0785                	addi	a5,a5,1
    2396:	0585                	addi	a1,a1,1
    2398:	fee78fa3          	sb	a4,-1(a5)
    239c:	fed79ae3          	bne	a5,a3,2390 <memmove+0xd4>
    23a0:	4402                	lw	s0,0(sp)
    23a2:	0111                	addi	sp,sp,4
    23a4:	8082                	ret
    23a6:	861a                	mv	a2,t1
    23a8:	b781                	j	22e8 <memmove+0x2c>
	...

000023ac <memset>:
    23ac:	433d                	li	t1,15
    23ae:	872a                	mv	a4,a0
    23b0:	02c37563          	bgeu	t1,a2,23da <memset+0x2e>
    23b4:	00f77793          	andi	a5,a4,15
    23b8:	e3c9                	bnez	a5,243a <memset+0x8e>
    23ba:	06059763          	bnez	a1,2428 <memset+0x7c>
    23be:	ff067693          	andi	a3,a2,-16
    23c2:	8a3d                	andi	a2,a2,15
    23c4:	96ba                	add	a3,a3,a4
    23c6:	c30c                	sw	a1,0(a4)
    23c8:	c34c                	sw	a1,4(a4)
    23ca:	c70c                	sw	a1,8(a4)
    23cc:	c74c                	sw	a1,12(a4)
    23ce:	0741                	addi	a4,a4,16
    23d0:	fed76be3          	bltu	a4,a3,23c6 <memset+0x1a>
    23d4:	00061363          	bnez	a2,23da <memset+0x2e>
    23d8:	8082                	ret
    23da:	40c306b3          	sub	a3,t1,a2
    23de:	068a                	slli	a3,a3,0x2
    23e0:	00000297          	auipc	t0,0x0
    23e4:	9696                	add	a3,a3,t0
    23e6:	00a68067          	jr	10(a3)
    23ea:	00b70723          	sb	a1,14(a4)
    23ee:	00b706a3          	sb	a1,13(a4)
    23f2:	00b70623          	sb	a1,12(a4)
    23f6:	00b705a3          	sb	a1,11(a4)
    23fa:	00b70523          	sb	a1,10(a4)
    23fe:	00b704a3          	sb	a1,9(a4)
    2402:	00b70423          	sb	a1,8(a4)
    2406:	00b703a3          	sb	a1,7(a4)
    240a:	00b70323          	sb	a1,6(a4)
    240e:	00b702a3          	sb	a1,5(a4)
    2412:	00b70223          	sb	a1,4(a4)
    2416:	00b701a3          	sb	a1,3(a4)
    241a:	00b70123          	sb	a1,2(a4)
    241e:	00b700a3          	sb	a1,1(a4)
    2422:	00b70023          	sb	a1,0(a4)
    2426:	8082                	ret
    2428:	0ff5f593          	andi	a1,a1,255
    242c:	00859693          	slli	a3,a1,0x8
    2430:	8dd5                	or	a1,a1,a3
    2432:	01059693          	slli	a3,a1,0x10
    2436:	8dd5                	or	a1,a1,a3
    2438:	b759                	j	23be <memset+0x12>
    243a:	00279693          	slli	a3,a5,0x2
    243e:	00000297          	auipc	t0,0x0
    2442:	9696                	add	a3,a3,t0
    2444:	8286                	mv	t0,ra
    2446:	fa8680e7          	jalr	-88(a3)
    244a:	8096                	mv	ra,t0
    244c:	17c1                	addi	a5,a5,-16
    244e:	8f1d                	sub	a4,a4,a5
    2450:	963e                	add	a2,a2,a5
    2452:	f8c374e3          	bgeu	t1,a2,23da <memset+0x2e>
    2456:	b795                	j	23ba <memset+0xe>
	...

0000245a <strchr>:
    245a:	0ff5f693          	andi	a3,a1,255
    245e:	00357793          	andi	a5,a0,3
    2462:	cec9                	beqz	a3,24fc <strchr+0xa2>
    2464:	00078b63          	beqz	a5,247a <strchr+0x20>
    2468:	00054783          	lbu	a5,0(a0)
    246c:	c7d1                	beqz	a5,24f8 <strchr+0x9e>
    246e:	08d78663          	beq	a5,a3,24fa <strchr+0xa0>
    2472:	0505                	addi	a0,a0,1
    2474:	00357793          	andi	a5,a0,3
    2478:	fbe5                	bnez	a5,2468 <strchr+0xe>
    247a:	0ff5f593          	andi	a1,a1,255
    247e:	00859313          	slli	t1,a1,0x8
    2482:	4118                	lw	a4,0(a0)
    2484:	0065e5b3          	or	a1,a1,t1
    2488:	01059313          	slli	t1,a1,0x10
    248c:	00b36333          	or	t1,t1,a1
    2490:	feff0637          	lui	a2,0xfeff0
    2494:	00e345b3          	xor	a1,t1,a4
    2498:	eff60613          	addi	a2,a2,-257 # fefefeff <__heap_end+0xdefbfeff>
    249c:	00c587b3          	add	a5,a1,a2
    24a0:	00c702b3          	add	t0,a4,a2
    24a4:	fff5c593          	not	a1,a1
    24a8:	fff74713          	not	a4,a4
    24ac:	8fed                	and	a5,a5,a1
    24ae:	00e2f733          	and	a4,t0,a4
    24b2:	808085b7          	lui	a1,0x80808
    24b6:	8fd9                	or	a5,a5,a4
    24b8:	08058593          	addi	a1,a1,128 # 80808080 <__heap_end+0x607d8080>
    24bc:	8fed                	and	a5,a5,a1
    24be:	e785                	bnez	a5,24e6 <strchr+0x8c>
    24c0:	4158                	lw	a4,4(a0)
    24c2:	0511                	addi	a0,a0,4
    24c4:	006742b3          	xor	t0,a4,t1
    24c8:	00c707b3          	add	a5,a4,a2
    24cc:	00c283b3          	add	t2,t0,a2
    24d0:	fff74713          	not	a4,a4
    24d4:	fff2c293          	not	t0,t0
    24d8:	8ff9                	and	a5,a5,a4
    24da:	0053f2b3          	and	t0,t2,t0
    24de:	0057e7b3          	or	a5,a5,t0
    24e2:	8fed                	and	a5,a5,a1
    24e4:	dff1                	beqz	a5,24c0 <strchr+0x66>
    24e6:	00054783          	lbu	a5,0(a0)
    24ea:	c799                	beqz	a5,24f8 <strchr+0x9e>
    24ec:	06f68163          	beq	a3,a5,254e <strchr+0xf4>
    24f0:	00154783          	lbu	a5,1(a0)
    24f4:	0505                	addi	a0,a0,1
    24f6:	fbfd                	bnez	a5,24ec <strchr+0x92>
    24f8:	4501                	li	a0,0
    24fa:	8082                	ret
    24fc:	cb81                	beqz	a5,250c <strchr+0xb2>
    24fe:	00054783          	lbu	a5,0(a0)
    2502:	dfe5                	beqz	a5,24fa <strchr+0xa0>
    2504:	0505                	addi	a0,a0,1
    2506:	00357793          	andi	a5,a0,3
    250a:	fbf5                	bnez	a5,24fe <strchr+0xa4>
    250c:	4118                	lw	a4,0(a0)
    250e:	feff0637          	lui	a2,0xfeff0
    2512:	eff60613          	addi	a2,a2,-257 # fefefeff <__heap_end+0xdefbfeff>
    2516:	00c707b3          	add	a5,a4,a2
    251a:	808086b7          	lui	a3,0x80808
    251e:	fff74713          	not	a4,a4
    2522:	8ff9                	and	a5,a5,a4
    2524:	08068693          	addi	a3,a3,128 # 80808080 <__heap_end+0x607d8080>
    2528:	8ff5                	and	a5,a5,a3
    252a:	eb91                	bnez	a5,253e <strchr+0xe4>
    252c:	4158                	lw	a4,4(a0)
    252e:	0511                	addi	a0,a0,4
    2530:	00c707b3          	add	a5,a4,a2
    2534:	fff74713          	not	a4,a4
    2538:	8ff9                	and	a5,a5,a4
    253a:	8ff5                	and	a5,a5,a3
    253c:	dbe5                	beqz	a5,252c <strchr+0xd2>
    253e:	00054783          	lbu	a5,0(a0)
    2542:	dfc5                	beqz	a5,24fa <strchr+0xa0>
    2544:	00154783          	lbu	a5,1(a0)
    2548:	0505                	addi	a0,a0,1
    254a:	ffed                	bnez	a5,2544 <strchr+0xea>
    254c:	8082                	ret
    254e:	8082                	ret

00002550 <strcpy>:
    2550:	00b567b3          	or	a5,a0,a1
    2554:	8b8d                	andi	a5,a5,3
    2556:	efb1                	bnez	a5,25b2 <strcpy+0x62>
    2558:	4198                	lw	a4,0(a1)
    255a:	7f7f86b7          	lui	a3,0x7f7f8
    255e:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    2562:	00d777b3          	and	a5,a4,a3
    2566:	97b6                	add	a5,a5,a3
    2568:	8fd9                	or	a5,a5,a4
    256a:	8fd5                	or	a5,a5,a3
    256c:	567d                	li	a2,-1
    256e:	04c79b63          	bne	a5,a2,25c4 <strcpy+0x74>
    2572:	862a                	mv	a2,a0
    2574:	537d                	li	t1,-1
    2576:	c218                	sw	a4,0(a2)
    2578:	41d8                	lw	a4,4(a1)
    257a:	0591                	addi	a1,a1,4
    257c:	0611                	addi	a2,a2,4
    257e:	00d777b3          	and	a5,a4,a3
    2582:	97b6                	add	a5,a5,a3
    2584:	8fd9                	or	a5,a5,a4
    2586:	8fd5                	or	a5,a5,a3
    2588:	fe6787e3          	beq	a5,t1,2576 <strcpy+0x26>
    258c:	0005c783          	lbu	a5,0(a1)
    2590:	0015c703          	lbu	a4,1(a1)
    2594:	0025c683          	lbu	a3,2(a1)
    2598:	00f60023          	sb	a5,0(a2)
    259c:	c799                	beqz	a5,25aa <strcpy+0x5a>
    259e:	00e600a3          	sb	a4,1(a2)
    25a2:	c701                	beqz	a4,25aa <strcpy+0x5a>
    25a4:	00d60123          	sb	a3,2(a2)
    25a8:	e291                	bnez	a3,25ac <strcpy+0x5c>
    25aa:	8082                	ret
    25ac:	000601a3          	sb	zero,3(a2)
    25b0:	8082                	ret
    25b2:	87aa                	mv	a5,a0
    25b4:	0005c703          	lbu	a4,0(a1)
    25b8:	0785                	addi	a5,a5,1
    25ba:	0585                	addi	a1,a1,1
    25bc:	fee78fa3          	sb	a4,-1(a5)
    25c0:	fb75                	bnez	a4,25b4 <strcpy+0x64>
    25c2:	8082                	ret
    25c4:	862a                	mv	a2,a0
    25c6:	b7d9                	j	258c <strcpy+0x3c>
	...

000025ca <_strerror_r>:
    25ca:	87ae                	mv	a5,a1
    25cc:	08e00713          	li	a4,142
    25d0:	85b2                	mv	a1,a2
    25d2:	00f76d63          	bltu	a4,a5,25ec <_strerror_r+0x22>
    25d6:	00003617          	auipc	a2,0x3
    25da:	f1260613          	addi	a2,a2,-238 # 54e8 <__clz_tab+0x100>
    25de:	00279313          	slli	t1,a5,0x2
    25e2:	9332                	add	t1,t1,a2
    25e4:	00032703          	lw	a4,0(t1)
    25e8:	9732                	add	a4,a4,a2
    25ea:	8702                	jr	a4
    25ec:	1151                	addi	sp,sp,-12
    25ee:	c406                	sw	ra,8(sp)
    25f0:	32068f63          	beqz	a3,292e <_strerror_r+0x364>
    25f4:	8636                	mv	a2,a3
    25f6:	853e                	mv	a0,a5
    25f8:	2f15                	jal	2d2c <_user_strerror>
    25fa:	32050563          	beqz	a0,2924 <_strerror_r+0x35a>
    25fe:	40a2                	lw	ra,8(sp)
    2600:	0131                	addi	sp,sp,12
    2602:	8082                	ret
    2604:	00004517          	auipc	a0,0x4
    2608:	c0850513          	addi	a0,a0,-1016 # 620c <pad_line+0x68c>
    260c:	8082                	ret
    260e:	00004517          	auipc	a0,0x4
    2612:	be650513          	addi	a0,a0,-1050 # 61f4 <pad_line+0x674>
    2616:	8082                	ret
    2618:	00004517          	auipc	a0,0x4
    261c:	b9450513          	addi	a0,a0,-1132 # 61ac <pad_line+0x62c>
    2620:	8082                	ret
    2622:	00004517          	auipc	a0,0x4
    2626:	ba250513          	addi	a0,a0,-1118 # 61c4 <pad_line+0x644>
    262a:	8082                	ret
    262c:	00003517          	auipc	a0,0x3
    2630:	78450513          	addi	a0,a0,1924 # 5db0 <pad_line+0x230>
    2634:	8082                	ret
    2636:	00004517          	auipc	a0,0x4
    263a:	b3a50513          	addi	a0,a0,-1222 # 6170 <pad_line+0x5f0>
    263e:	8082                	ret
    2640:	00004517          	auipc	a0,0x4
    2644:	9a450513          	addi	a0,a0,-1628 # 5fe4 <pad_line+0x464>
    2648:	8082                	ret
    264a:	00004517          	auipc	a0,0x4
    264e:	c2250513          	addi	a0,a0,-990 # 626c <pad_line+0x6ec>
    2652:	8082                	ret
    2654:	00003517          	auipc	a0,0x3
    2658:	62450513          	addi	a0,a0,1572 # 5c78 <pad_line+0xf8>
    265c:	8082                	ret
    265e:	00003517          	auipc	a0,0x3
    2662:	5e250513          	addi	a0,a0,1506 # 5c40 <pad_line+0xc0>
    2666:	8082                	ret
    2668:	00004517          	auipc	a0,0x4
    266c:	b7850513          	addi	a0,a0,-1160 # 61e0 <pad_line+0x660>
    2670:	8082                	ret
    2672:	00004517          	auipc	a0,0x4
    2676:	bd250513          	addi	a0,a0,-1070 # 6244 <pad_line+0x6c4>
    267a:	8082                	ret
    267c:	00004517          	auipc	a0,0x4
    2680:	8c050513          	addi	a0,a0,-1856 # 5f3c <pad_line+0x3bc>
    2684:	8082                	ret
    2686:	00003517          	auipc	a0,0x3
    268a:	7ee50513          	addi	a0,a0,2030 # 5e74 <pad_line+0x2f4>
    268e:	8082                	ret
    2690:	00003517          	auipc	a0,0x3
    2694:	6b850513          	addi	a0,a0,1720 # 5d48 <pad_line+0x1c8>
    2698:	8082                	ret
    269a:	00003517          	auipc	a0,0x3
    269e:	7ae50513          	addi	a0,a0,1966 # 5e48 <pad_line+0x2c8>
    26a2:	8082                	ret
    26a4:	00003517          	auipc	a0,0x3
    26a8:	69450513          	addi	a0,a0,1684 # 5d38 <pad_line+0x1b8>
    26ac:	8082                	ret
    26ae:	00004517          	auipc	a0,0x4
    26b2:	bd250513          	addi	a0,a0,-1070 # 6280 <pad_line+0x700>
    26b6:	8082                	ret
    26b8:	00003517          	auipc	a0,0x3
    26bc:	6d450513          	addi	a0,a0,1748 # 5d8c <pad_line+0x20c>
    26c0:	8082                	ret
    26c2:	00004517          	auipc	a0,0x4
    26c6:	89e50513          	addi	a0,a0,-1890 # 5f60 <pad_line+0x3e0>
    26ca:	8082                	ret
    26cc:	00004517          	auipc	a0,0x4
    26d0:	abc50513          	addi	a0,a0,-1348 # 6188 <pad_line+0x608>
    26d4:	8082                	ret
    26d6:	00004517          	auipc	a0,0x4
    26da:	a8250513          	addi	a0,a0,-1406 # 6158 <pad_line+0x5d8>
    26de:	8082                	ret
    26e0:	00004517          	auipc	a0,0x4
    26e4:	a4850513          	addi	a0,a0,-1464 # 6128 <pad_line+0x5a8>
    26e8:	8082                	ret
    26ea:	00004517          	auipc	a0,0x4
    26ee:	a2650513          	addi	a0,a0,-1498 # 6110 <pad_line+0x590>
    26f2:	8082                	ret
    26f4:	00004517          	auipc	a0,0x4
    26f8:	9fc50513          	addi	a0,a0,-1540 # 60f0 <pad_line+0x570>
    26fc:	8082                	ret
    26fe:	00004517          	auipc	a0,0x4
    2702:	9d250513          	addi	a0,a0,-1582 # 60d0 <pad_line+0x550>
    2706:	8082                	ret
    2708:	00004517          	auipc	a0,0x4
    270c:	99850513          	addi	a0,a0,-1640 # 60a0 <pad_line+0x520>
    2710:	8082                	ret
    2712:	00004517          	auipc	a0,0x4
    2716:	96a50513          	addi	a0,a0,-1686 # 607c <pad_line+0x4fc>
    271a:	8082                	ret
    271c:	00004517          	auipc	a0,0x4
    2720:	a2050513          	addi	a0,a0,-1504 # 613c <pad_line+0x5bc>
    2724:	8082                	ret
    2726:	00004517          	auipc	a0,0x4
    272a:	afa50513          	addi	a0,a0,-1286 # 6220 <pad_line+0x6a0>
    272e:	8082                	ret
    2730:	00004517          	auipc	a0,0x4
    2734:	93450513          	addi	a0,a0,-1740 # 6064 <pad_line+0x4e4>
    2738:	8082                	ret
    273a:	00004517          	auipc	a0,0x4
    273e:	90e50513          	addi	a0,a0,-1778 # 6048 <pad_line+0x4c8>
    2742:	8082                	ret
    2744:	00004517          	auipc	a0,0x4
    2748:	8f050513          	addi	a0,a0,-1808 # 6034 <pad_line+0x4b4>
    274c:	8082                	ret
    274e:	00004517          	auipc	a0,0x4
    2752:	8ca50513          	addi	a0,a0,-1846 # 6018 <pad_line+0x498>
    2756:	8082                	ret
    2758:	00004517          	auipc	a0,0x4
    275c:	8b450513          	addi	a0,a0,-1868 # 600c <pad_line+0x48c>
    2760:	8082                	ret
    2762:	00004517          	auipc	a0,0x4
    2766:	89650513          	addi	a0,a0,-1898 # 5ff8 <pad_line+0x478>
    276a:	8082                	ret
    276c:	00004517          	auipc	a0,0x4
    2770:	86850513          	addi	a0,a0,-1944 # 5fd4 <pad_line+0x454>
    2774:	8082                	ret
    2776:	00004517          	auipc	a0,0x4
    277a:	84650513          	addi	a0,a0,-1978 # 5fbc <pad_line+0x43c>
    277e:	8082                	ret
    2780:	00004517          	auipc	a0,0x4
    2784:	82850513          	addi	a0,a0,-2008 # 5fa8 <pad_line+0x428>
    2788:	8082                	ret
    278a:	00004517          	auipc	a0,0x4
    278e:	80650513          	addi	a0,a0,-2042 # 5f90 <pad_line+0x410>
    2792:	8082                	ret
    2794:	00004517          	auipc	a0,0x4
    2798:	90450513          	addi	a0,a0,-1788 # 6098 <pad_line+0x518>
    279c:	8082                	ret
    279e:	00003517          	auipc	a0,0x3
    27a2:	7e250513          	addi	a0,a0,2018 # 5f80 <pad_line+0x400>
    27a6:	8082                	ret
    27a8:	00003517          	auipc	a0,0x3
    27ac:	7d050513          	addi	a0,a0,2000 # 5f78 <pad_line+0x3f8>
    27b0:	8082                	ret
    27b2:	00003517          	auipc	a0,0x3
    27b6:	7a250513          	addi	a0,a0,1954 # 5f54 <pad_line+0x3d4>
    27ba:	8082                	ret
    27bc:	00003517          	auipc	a0,0x3
    27c0:	76c50513          	addi	a0,a0,1900 # 5f28 <pad_line+0x3a8>
    27c4:	8082                	ret
    27c6:	00003517          	auipc	a0,0x3
    27ca:	74650513          	addi	a0,a0,1862 # 5f0c <pad_line+0x38c>
    27ce:	8082                	ret
    27d0:	00003517          	auipc	a0,0x3
    27d4:	72850513          	addi	a0,a0,1832 # 5ef8 <pad_line+0x378>
    27d8:	8082                	ret
    27da:	00003517          	auipc	a0,0x3
    27de:	6ee50513          	addi	a0,a0,1774 # 5ec8 <pad_line+0x348>
    27e2:	8082                	ret
    27e4:	00003517          	auipc	a0,0x3
    27e8:	6d850513          	addi	a0,a0,1752 # 5ebc <pad_line+0x33c>
    27ec:	8082                	ret
    27ee:	00003517          	auipc	a0,0x3
    27f2:	6be50513          	addi	a0,a0,1726 # 5eac <pad_line+0x32c>
    27f6:	8082                	ret
    27f8:	00003517          	auipc	a0,0x3
    27fc:	69c50513          	addi	a0,a0,1692 # 5e94 <pad_line+0x314>
    2800:	8082                	ret
    2802:	00003517          	auipc	a0,0x3
    2806:	68250513          	addi	a0,a0,1666 # 5e84 <pad_line+0x304>
    280a:	8082                	ret
    280c:	00003517          	auipc	a0,0x3
    2810:	65050513          	addi	a0,a0,1616 # 5e5c <pad_line+0x2dc>
    2814:	8082                	ret
    2816:	00003517          	auipc	a0,0x3
    281a:	62250513          	addi	a0,a0,1570 # 5e38 <pad_line+0x2b8>
    281e:	8082                	ret
    2820:	00003517          	auipc	a0,0x3
    2824:	60850513          	addi	a0,a0,1544 # 5e28 <pad_line+0x2a8>
    2828:	8082                	ret
    282a:	00003517          	auipc	a0,0x3
    282e:	5e650513          	addi	a0,a0,1510 # 5e10 <pad_line+0x290>
    2832:	8082                	ret
    2834:	00003517          	auipc	a0,0x3
    2838:	5bc50513          	addi	a0,a0,1468 # 5df0 <pad_line+0x270>
    283c:	8082                	ret
    283e:	00003517          	auipc	a0,0x3
    2842:	59250513          	addi	a0,a0,1426 # 5dd0 <pad_line+0x250>
    2846:	8082                	ret
    2848:	00003517          	auipc	a0,0x3
    284c:	53050513          	addi	a0,a0,1328 # 5d78 <pad_line+0x1f8>
    2850:	8082                	ret
    2852:	00003517          	auipc	a0,0x3
    2856:	51650513          	addi	a0,a0,1302 # 5d68 <pad_line+0x1e8>
    285a:	8082                	ret
    285c:	00003517          	auipc	a0,0x3
    2860:	4cc50513          	addi	a0,a0,1228 # 5d28 <pad_line+0x1a8>
    2864:	8082                	ret
    2866:	00003517          	auipc	a0,0x3
    286a:	4b250513          	addi	a0,a0,1202 # 5d18 <pad_line+0x198>
    286e:	8082                	ret
    2870:	00003517          	auipc	a0,0x3
    2874:	49450513          	addi	a0,a0,1172 # 5d04 <pad_line+0x184>
    2878:	8082                	ret
    287a:	00003517          	auipc	a0,0x3
    287e:	47e50513          	addi	a0,a0,1150 # 5cf8 <pad_line+0x178>
    2882:	8082                	ret
    2884:	00003517          	auipc	a0,0x3
    2888:	45c50513          	addi	a0,a0,1116 # 5ce0 <pad_line+0x160>
    288c:	8082                	ret
    288e:	00003517          	auipc	a0,0x3
    2892:	44650513          	addi	a0,a0,1094 # 5cd4 <pad_line+0x154>
    2896:	8082                	ret
    2898:	00003517          	auipc	a0,0x3
    289c:	42850513          	addi	a0,a0,1064 # 5cc0 <pad_line+0x140>
    28a0:	8082                	ret
    28a2:	00003517          	auipc	a0,0x3
    28a6:	40a50513          	addi	a0,a0,1034 # 5cac <pad_line+0x12c>
    28aa:	8082                	ret
    28ac:	00003517          	auipc	a0,0x3
    28b0:	3ec50513          	addi	a0,a0,1004 # 5c98 <pad_line+0x118>
    28b4:	8082                	ret
    28b6:	00003517          	auipc	a0,0x3
    28ba:	3b650513          	addi	a0,a0,950 # 5c6c <pad_line+0xec>
    28be:	8082                	ret
    28c0:	00003517          	auipc	a0,0x3
    28c4:	39c50513          	addi	a0,a0,924 # 5c5c <pad_line+0xdc>
    28c8:	8082                	ret
    28ca:	00003517          	auipc	a0,0x3
    28ce:	36250513          	addi	a0,a0,866 # 5c2c <pad_line+0xac>
    28d2:	8082                	ret
    28d4:	00003517          	auipc	a0,0x3
    28d8:	34450513          	addi	a0,a0,836 # 5c18 <pad_line+0x98>
    28dc:	8082                	ret
    28de:	00003517          	auipc	a0,0x3
    28e2:	31e50513          	addi	a0,a0,798 # 5bfc <pad_line+0x7c>
    28e6:	8082                	ret
    28e8:	00003517          	auipc	a0,0x3
    28ec:	30850513          	addi	a0,a0,776 # 5bf0 <pad_line+0x70>
    28f0:	8082                	ret
    28f2:	00003517          	auipc	a0,0x3
    28f6:	2e650513          	addi	a0,a0,742 # 5bd8 <pad_line+0x58>
    28fa:	8082                	ret
    28fc:	00003517          	auipc	a0,0x3
    2900:	2cc50513          	addi	a0,a0,716 # 5bc8 <pad_line+0x48>
    2904:	8082                	ret
    2906:	00003517          	auipc	a0,0x3
    290a:	2a650513          	addi	a0,a0,678 # 5bac <pad_line+0x2c>
    290e:	8082                	ret
    2910:	00004517          	auipc	a0,0x4
    2914:	98850513          	addi	a0,a0,-1656 # 6298 <pad_line+0x718>
    2918:	8082                	ret
    291a:	00003517          	auipc	a0,0x3
    291e:	28650513          	addi	a0,a0,646 # 5ba0 <pad_line+0x20>
    2922:	8082                	ret
    2924:	00003517          	auipc	a0,0x3
    2928:	10050513          	addi	a0,a0,256 # 5a24 <sg_usi_config+0x13c>
    292c:	b9c9                	j	25fe <_strerror_r+0x34>
    292e:	86aa                	mv	a3,a0
    2930:	b1d1                	j	25f4 <_strerror_r+0x2a>

00002932 <strerror>:
    2932:	85aa                	mv	a1,a0
    2934:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2938:	4681                	li	a3,0
    293a:	4601                	li	a2,0
    293c:	b179                	j	25ca <_strerror_r>

0000293e <strerror_l>:
    293e:	85aa                	mv	a1,a0
    2940:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2944:	4681                	li	a3,0
    2946:	4601                	li	a2,0
    2948:	b149                	j	25ca <_strerror_r>
	...

0000294c <strlen>:
    294c:	00357793          	andi	a5,a0,3
    2950:	872a                	mv	a4,a0
    2952:	ef9d                	bnez	a5,2990 <strlen+0x44>
    2954:	7f7f86b7          	lui	a3,0x7f7f8
    2958:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__heap_end+0x5f7c7f7f>
    295c:	55fd                	li	a1,-1
    295e:	4310                	lw	a2,0(a4)
    2960:	0711                	addi	a4,a4,4
    2962:	00d677b3          	and	a5,a2,a3
    2966:	97b6                	add	a5,a5,a3
    2968:	8fd1                	or	a5,a5,a2
    296a:	8fd5                	or	a5,a5,a3
    296c:	feb789e3          	beq	a5,a1,295e <strlen+0x12>
    2970:	ffc74683          	lbu	a3,-4(a4)
    2974:	ffd74603          	lbu	a2,-3(a4)
    2978:	ffe74783          	lbu	a5,-2(a4)
    297c:	8f09                	sub	a4,a4,a0
    297e:	c695                	beqz	a3,29aa <strlen+0x5e>
    2980:	02060263          	beqz	a2,29a4 <strlen+0x58>
    2984:	00f03533          	snez	a0,a5
    2988:	953a                	add	a0,a0,a4
    298a:	1579                	addi	a0,a0,-2
    298c:	8082                	ret
    298e:	d2f9                	beqz	a3,2954 <strlen+0x8>
    2990:	00074783          	lbu	a5,0(a4)
    2994:	0705                	addi	a4,a4,1
    2996:	00377693          	andi	a3,a4,3
    299a:	fbf5                	bnez	a5,298e <strlen+0x42>
    299c:	8f09                	sub	a4,a4,a0
    299e:	fff70513          	addi	a0,a4,-1
    29a2:	8082                	ret
    29a4:	ffd70513          	addi	a0,a4,-3
    29a8:	8082                	ret
    29aa:	ffc70513          	addi	a0,a4,-4
    29ae:	8082                	ret
	...

000029b2 <_strtol_l.part.0>:
    29b2:	1111                	addi	sp,sp,-28
    29b4:	c82a                	sw	a0,16(sp)
    29b6:	cc22                	sw	s0,24(sp)
    29b8:	ca26                	sw	s1,20(sp)
    29ba:	872e                	mv	a4,a1
    29bc:	c42e                	sw	a1,8(sp)
    29be:	c032                	sw	a2,0(sp)
    29c0:	00003517          	auipc	a0,0x3
    29c4:	d6550513          	addi	a0,a0,-667 # 5725 <_ctype_+0x1>
    29c8:	00074783          	lbu	a5,0(a4)
    29cc:	85ba                	mv	a1,a4
    29ce:	0705                	addi	a4,a4,1
    29d0:	00f50633          	add	a2,a0,a5
    29d4:	00064603          	lbu	a2,0(a2)
    29d8:	8a21                	andi	a2,a2,8
    29da:	f67d                	bnez	a2,29c8 <_strtol_l.part.0+0x16>
    29dc:	02d00613          	li	a2,45
    29e0:	0ec78063          	beq	a5,a2,2ac0 <_strtol_l.part.0+0x10e>
    29e4:	02b00613          	li	a2,43
    29e8:	06c78063          	beq	a5,a2,2a48 <_strtol_l.part.0+0x96>
    29ec:	800004b7          	lui	s1,0x80000
    29f0:	fff4c493          	not	s1,s1
    29f4:	c602                	sw	zero,12(sp)
    29f6:	c2bd                	beqz	a3,2a5c <_strtol_l.part.0+0xaa>
    29f8:	4641                	li	a2,16
    29fa:	8436                	mv	s0,a3
    29fc:	0cc68b63          	beq	a3,a2,2ad2 <_strtol_l.part.0+0x120>
    2a00:	0284f633          	remu	a2,s1,s0
    2a04:	4581                	li	a1,0
    2a06:	4501                	li	a0,0
    2a08:	4325                	li	t1,9
    2a0a:	43e5                	li	t2,25
    2a0c:	0284d2b3          	divu	t0,s1,s0
    2a10:	c232                	sw	a2,4(sp)
    2a12:	fd078613          	addi	a2,a5,-48
    2a16:	00c37863          	bgeu	t1,a2,2a26 <_strtol_l.part.0+0x74>
    2a1a:	fbf78613          	addi	a2,a5,-65
    2a1e:	04c3e863          	bltu	t2,a2,2a6e <_strtol_l.part.0+0xbc>
    2a22:	fc978613          	addi	a2,a5,-55
    2a26:	04d65c63          	bge	a2,a3,2a7e <_strtol_l.part.0+0xcc>
    2a2a:	0405c063          	bltz	a1,2a6a <_strtol_l.part.0+0xb8>
    2a2e:	55fd                	li	a1,-1
    2a30:	00a2e863          	bltu	t0,a0,2a40 <_strtol_l.part.0+0x8e>
    2a34:	06a28663          	beq	t0,a0,2aa0 <_strtol_l.part.0+0xee>
    2a38:	4585                	li	a1,1
    2a3a:	02850533          	mul	a0,a0,s0
    2a3e:	9532                	add	a0,a0,a2
    2a40:	0705                	addi	a4,a4,1
    2a42:	fff74783          	lbu	a5,-1(a4)
    2a46:	b7f1                	j	2a12 <_strtol_l.part.0+0x60>
    2a48:	800004b7          	lui	s1,0x80000
    2a4c:	c602                	sw	zero,12(sp)
    2a4e:	00074783          	lbu	a5,0(a4)
    2a52:	fff4c493          	not	s1,s1
    2a56:	00258713          	addi	a4,a1,2
    2a5a:	fed9                	bnez	a3,29f8 <_strtol_l.part.0+0x46>
    2a5c:	03000693          	li	a3,48
    2a60:	08d78d63          	beq	a5,a3,2afa <_strtol_l.part.0+0x148>
    2a64:	4429                	li	s0,10
    2a66:	46a9                	li	a3,10
    2a68:	bf61                	j	2a00 <_strtol_l.part.0+0x4e>
    2a6a:	55fd                	li	a1,-1
    2a6c:	bfd1                	j	2a40 <_strtol_l.part.0+0x8e>
    2a6e:	f9f78613          	addi	a2,a5,-97
    2a72:	00c3e663          	bltu	t2,a2,2a7e <_strtol_l.part.0+0xcc>
    2a76:	fa978613          	addi	a2,a5,-87
    2a7a:	fad648e3          	blt	a2,a3,2a2a <_strtol_l.part.0+0x78>
    2a7e:	0205c563          	bltz	a1,2aa8 <_strtol_l.part.0+0xf6>
    2a82:	47b2                	lw	a5,12(sp)
    2a84:	c399                	beqz	a5,2a8a <_strtol_l.part.0+0xd8>
    2a86:	40a00533          	neg	a0,a0
    2a8a:	4782                	lw	a5,0(sp)
    2a8c:	c791                	beqz	a5,2a98 <_strtol_l.part.0+0xe6>
    2a8e:	08059163          	bnez	a1,2b10 <_strtol_l.part.0+0x15e>
    2a92:	4782                	lw	a5,0(sp)
    2a94:	4722                	lw	a4,8(sp)
    2a96:	c398                	sw	a4,0(a5)
    2a98:	4462                	lw	s0,24(sp)
    2a9a:	44d2                	lw	s1,20(sp)
    2a9c:	0171                	addi	sp,sp,28
    2a9e:	8082                	ret
    2aa0:	4792                	lw	a5,4(sp)
    2aa2:	f8c7cfe3          	blt	a5,a2,2a40 <_strtol_l.part.0+0x8e>
    2aa6:	bf49                	j	2a38 <_strtol_l.part.0+0x86>
    2aa8:	46c2                	lw	a3,16(sp)
    2aaa:	02200793          	li	a5,34
    2aae:	8526                	mv	a0,s1
    2ab0:	c29c                	sw	a5,0(a3)
    2ab2:	4782                	lw	a5,0(sp)
    2ab4:	d3f5                	beqz	a5,2a98 <_strtol_l.part.0+0xe6>
    2ab6:	fff70793          	addi	a5,a4,-1
    2aba:	c43e                	sw	a5,8(sp)
    2abc:	8526                	mv	a0,s1
    2abe:	bfd1                	j	2a92 <_strtol_l.part.0+0xe0>
    2ac0:	4605                	li	a2,1
    2ac2:	00074783          	lbu	a5,0(a4)
    2ac6:	800004b7          	lui	s1,0x80000
    2aca:	00258713          	addi	a4,a1,2
    2ace:	c632                	sw	a2,12(sp)
    2ad0:	b71d                	j	29f6 <_strtol_l.part.0+0x44>
    2ad2:	03000613          	li	a2,48
    2ad6:	00c79a63          	bne	a5,a2,2aea <_strtol_l.part.0+0x138>
    2ada:	00074603          	lbu	a2,0(a4)
    2ade:	05800593          	li	a1,88
    2ae2:	0df67613          	andi	a2,a2,223
    2ae6:	00b60463          	beq	a2,a1,2aee <_strtol_l.part.0+0x13c>
    2aea:	4441                	li	s0,16
    2aec:	bf11                	j	2a00 <_strtol_l.part.0+0x4e>
    2aee:	00174783          	lbu	a5,1(a4)
    2af2:	4441                	li	s0,16
    2af4:	0709                	addi	a4,a4,2
    2af6:	46c1                	li	a3,16
    2af8:	b721                	j	2a00 <_strtol_l.part.0+0x4e>
    2afa:	00074683          	lbu	a3,0(a4)
    2afe:	05800613          	li	a2,88
    2b02:	0df6f693          	andi	a3,a3,223
    2b06:	fec684e3          	beq	a3,a2,2aee <_strtol_l.part.0+0x13c>
    2b0a:	4421                	li	s0,8
    2b0c:	46a1                	li	a3,8
    2b0e:	bdcd                	j	2a00 <_strtol_l.part.0+0x4e>
    2b10:	84aa                	mv	s1,a0
    2b12:	b755                	j	2ab6 <_strtol_l.part.0+0x104>

00002b14 <_strtol_r>:
    2b14:	4705                	li	a4,1
    2b16:	00e68763          	beq	a3,a4,2b24 <_strtol_r+0x10>
    2b1a:	02400713          	li	a4,36
    2b1e:	00d76363          	bltu	a4,a3,2b24 <_strtol_r+0x10>
    2b22:	bd41                	j	29b2 <_strtol_l.part.0>
    2b24:	1151                	addi	sp,sp,-12
    2b26:	c406                	sw	ra,8(sp)
    2b28:	2421                	jal	2d30 <__errno>
    2b2a:	40a2                	lw	ra,8(sp)
    2b2c:	47d9                	li	a5,22
    2b2e:	c11c                	sw	a5,0(a0)
    2b30:	4501                	li	a0,0
    2b32:	0131                	addi	sp,sp,12
    2b34:	8082                	ret

00002b36 <strtol_l>:
    2b36:	4705                	li	a4,1
    2b38:	00e60d63          	beq	a2,a4,2b52 <strtol_l+0x1c>
    2b3c:	02400713          	li	a4,36
    2b40:	00c76963          	bltu	a4,a2,2b52 <strtol_l+0x1c>
    2b44:	87aa                	mv	a5,a0
    2b46:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2b4a:	86b2                	mv	a3,a2
    2b4c:	862e                	mv	a2,a1
    2b4e:	85be                	mv	a1,a5
    2b50:	b58d                	j	29b2 <_strtol_l.part.0>
    2b52:	1151                	addi	sp,sp,-12
    2b54:	c406                	sw	ra,8(sp)
    2b56:	2ae9                	jal	2d30 <__errno>
    2b58:	40a2                	lw	ra,8(sp)
    2b5a:	47d9                	li	a5,22
    2b5c:	c11c                	sw	a5,0(a0)
    2b5e:	4501                	li	a0,0
    2b60:	0131                	addi	sp,sp,12
    2b62:	8082                	ret

00002b64 <strtol>:
    2b64:	4705                	li	a4,1
    2b66:	00e60d63          	beq	a2,a4,2b80 <strtol+0x1c>
    2b6a:	02400713          	li	a4,36
    2b6e:	00c76963          	bltu	a4,a2,2b80 <strtol+0x1c>
    2b72:	87aa                	mv	a5,a0
    2b74:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2b78:	86b2                	mv	a3,a2
    2b7a:	862e                	mv	a2,a1
    2b7c:	85be                	mv	a1,a5
    2b7e:	bd15                	j	29b2 <_strtol_l.part.0>
    2b80:	1151                	addi	sp,sp,-12
    2b82:	c406                	sw	ra,8(sp)
    2b84:	2275                	jal	2d30 <__errno>
    2b86:	40a2                	lw	ra,8(sp)
    2b88:	47d9                	li	a5,22
    2b8a:	c11c                	sw	a5,0(a0)
    2b8c:	4501                	li	a0,0
    2b8e:	0131                	addi	sp,sp,12
    2b90:	8082                	ret

00002b92 <_strtoul_l.constprop.0>:
    2b92:	1121                	addi	sp,sp,-24
    2b94:	ca22                	sw	s0,20(sp)
    2b96:	c826                	sw	s1,16(sp)
    2b98:	c62a                	sw	a0,12(sp)
    2b9a:	c032                	sw	a2,0(sp)
    2b9c:	872e                	mv	a4,a1
    2b9e:	00003317          	auipc	t1,0x3
    2ba2:	b8730313          	addi	t1,t1,-1145 # 5725 <_ctype_+0x1>
    2ba6:	00074783          	lbu	a5,0(a4)
    2baa:	853a                	mv	a0,a4
    2bac:	0705                	addi	a4,a4,1
    2bae:	00f30633          	add	a2,t1,a5
    2bb2:	00064603          	lbu	a2,0(a2)
    2bb6:	8a21                	andi	a2,a2,8
    2bb8:	f67d                	bnez	a2,2ba6 <_strtoul_l.constprop.0+0x14>
    2bba:	02d00613          	li	a2,45
    2bbe:	0cc78c63          	beq	a5,a2,2c96 <_strtoul_l.constprop.0+0x104>
    2bc2:	02b00613          	li	a2,43
    2bc6:	c402                	sw	zero,8(sp)
    2bc8:	06c78a63          	beq	a5,a2,2c3c <_strtoul_l.constprop.0+0xaa>
    2bcc:	00068d63          	beqz	a3,2be6 <_strtoul_l.constprop.0+0x54>
    2bd0:	4641                	li	a2,16
    2bd2:	0cc68963          	beq	a3,a2,2ca4 <_strtoul_l.constprop.0+0x112>
    2bd6:	567d                	li	a2,-1
    2bd8:	02d653b3          	divu	t2,a2,a3
    2bdc:	84b6                	mv	s1,a3
    2bde:	02d67633          	remu	a2,a2,a3
    2be2:	c232                	sw	a2,4(sp)
    2be4:	a829                	j	2bfe <_strtoul_l.constprop.0+0x6c>
    2be6:	03000693          	li	a3,48
    2bea:	0ed78463          	beq	a5,a3,2cd2 <_strtoul_l.constprop.0+0x140>
    2bee:	4695                	li	a3,5
    2bf0:	1999a3b7          	lui	t2,0x1999a
    2bf4:	c236                	sw	a3,4(sp)
    2bf6:	99938393          	addi	t2,t2,-1639 # 19999999 <__ctor_end__+0x199936f9>
    2bfa:	44a9                	li	s1,10
    2bfc:	46a9                	li	a3,10
    2bfe:	4301                	li	t1,0
    2c00:	4501                	li	a0,0
    2c02:	42a5                	li	t0,9
    2c04:	4465                	li	s0,25
    2c06:	fd078613          	addi	a2,a5,-48
    2c0a:	00c2f863          	bgeu	t0,a2,2c1a <_strtoul_l.constprop.0+0x88>
    2c0e:	fbf78613          	addi	a2,a5,-65
    2c12:	02c46c63          	bltu	s0,a2,2c4a <_strtoul_l.constprop.0+0xb8>
    2c16:	fc978613          	addi	a2,a5,-55
    2c1a:	04d65063          	bge	a2,a3,2c5a <_strtoul_l.constprop.0+0xc8>
    2c1e:	02034463          	bltz	t1,2c46 <_strtoul_l.constprop.0+0xb4>
    2c22:	537d                	li	t1,-1
    2c24:	00a3e863          	bltu	t2,a0,2c34 <_strtoul_l.constprop.0+0xa2>
    2c28:	04750963          	beq	a0,t2,2c7a <_strtoul_l.constprop.0+0xe8>
    2c2c:	02950533          	mul	a0,a0,s1
    2c30:	4305                	li	t1,1
    2c32:	9532                	add	a0,a0,a2
    2c34:	0705                	addi	a4,a4,1
    2c36:	fff74783          	lbu	a5,-1(a4)
    2c3a:	b7f1                	j	2c06 <_strtoul_l.constprop.0+0x74>
    2c3c:	00074783          	lbu	a5,0(a4)
    2c40:	00250713          	addi	a4,a0,2
    2c44:	b761                	j	2bcc <_strtoul_l.constprop.0+0x3a>
    2c46:	537d                	li	t1,-1
    2c48:	b7f5                	j	2c34 <_strtoul_l.constprop.0+0xa2>
    2c4a:	f9f78613          	addi	a2,a5,-97
    2c4e:	00c46663          	bltu	s0,a2,2c5a <_strtoul_l.constprop.0+0xc8>
    2c52:	fa978613          	addi	a2,a5,-87
    2c56:	fcd644e3          	blt	a2,a3,2c1e <_strtoul_l.constprop.0+0x8c>
    2c5a:	02034463          	bltz	t1,2c82 <_strtoul_l.constprop.0+0xf0>
    2c5e:	47a2                	lw	a5,8(sp)
    2c60:	c399                	beqz	a5,2c66 <_strtoul_l.constprop.0+0xd4>
    2c62:	40a00533          	neg	a0,a0
    2c66:	4782                	lw	a5,0(sp)
    2c68:	c789                	beqz	a5,2c72 <_strtoul_l.constprop.0+0xe0>
    2c6a:	02031363          	bnez	t1,2c90 <_strtoul_l.constprop.0+0xfe>
    2c6e:	4782                	lw	a5,0(sp)
    2c70:	c38c                	sw	a1,0(a5)
    2c72:	4452                	lw	s0,20(sp)
    2c74:	44c2                	lw	s1,16(sp)
    2c76:	0161                	addi	sp,sp,24
    2c78:	8082                	ret
    2c7a:	4792                	lw	a5,4(sp)
    2c7c:	fac7cce3          	blt	a5,a2,2c34 <_strtoul_l.constprop.0+0xa2>
    2c80:	b775                	j	2c2c <_strtoul_l.constprop.0+0x9a>
    2c82:	46b2                	lw	a3,12(sp)
    2c84:	02200793          	li	a5,34
    2c88:	557d                	li	a0,-1
    2c8a:	c29c                	sw	a5,0(a3)
    2c8c:	4782                	lw	a5,0(sp)
    2c8e:	d3f5                	beqz	a5,2c72 <_strtoul_l.constprop.0+0xe0>
    2c90:	fff70593          	addi	a1,a4,-1
    2c94:	bfe9                	j	2c6e <_strtoul_l.constprop.0+0xdc>
    2c96:	00074783          	lbu	a5,0(a4)
    2c9a:	4705                	li	a4,1
    2c9c:	c43a                	sw	a4,8(sp)
    2c9e:	00250713          	addi	a4,a0,2
    2ca2:	b72d                	j	2bcc <_strtoul_l.constprop.0+0x3a>
    2ca4:	03000613          	li	a2,48
    2ca8:	04c79c63          	bne	a5,a2,2d00 <_strtoul_l.constprop.0+0x16e>
    2cac:	00074603          	lbu	a2,0(a4)
    2cb0:	05800513          	li	a0,88
    2cb4:	0df67613          	andi	a2,a2,223
    2cb8:	02a61d63          	bne	a2,a0,2cf2 <_strtoul_l.constprop.0+0x160>
    2cbc:	46bd                	li	a3,15
    2cbe:	100003b7          	lui	t2,0x10000
    2cc2:	00174783          	lbu	a5,1(a4)
    2cc6:	c236                	sw	a3,4(sp)
    2cc8:	0709                	addi	a4,a4,2
    2cca:	13fd                	addi	t2,t2,-1
    2ccc:	44c1                	li	s1,16
    2cce:	46c1                	li	a3,16
    2cd0:	b73d                	j	2bfe <_strtoul_l.constprop.0+0x6c>
    2cd2:	00074683          	lbu	a3,0(a4)
    2cd6:	05800613          	li	a2,88
    2cda:	0df6f693          	andi	a3,a3,223
    2cde:	fcc68fe3          	beq	a3,a2,2cbc <_strtoul_l.constprop.0+0x12a>
    2ce2:	469d                	li	a3,7
    2ce4:	200003b7          	lui	t2,0x20000
    2ce8:	c236                	sw	a3,4(sp)
    2cea:	13fd                	addi	t2,t2,-1
    2cec:	44a1                	li	s1,8
    2cee:	46a1                	li	a3,8
    2cf0:	b739                	j	2bfe <_strtoul_l.constprop.0+0x6c>
    2cf2:	53fd                	li	t2,-1
    2cf4:	463d                	li	a2,15
    2cf6:	02d3d3b3          	divu	t2,t2,a3
    2cfa:	44c1                	li	s1,16
    2cfc:	c232                	sw	a2,4(sp)
    2cfe:	b701                	j	2bfe <_strtoul_l.constprop.0+0x6c>
    2d00:	463d                	li	a2,15
    2d02:	100003b7          	lui	t2,0x10000
    2d06:	c232                	sw	a2,4(sp)
    2d08:	13fd                	addi	t2,t2,-1
    2d0a:	44c1                	li	s1,16
    2d0c:	bdcd                	j	2bfe <_strtoul_l.constprop.0+0x6c>

00002d0e <_strtoul_r>:
    2d0e:	b551                	j	2b92 <_strtoul_l.constprop.0>

00002d10 <strtoul_l>:
    2d10:	87aa                	mv	a5,a0
    2d12:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2d16:	86b2                	mv	a3,a2
    2d18:	862e                	mv	a2,a1
    2d1a:	85be                	mv	a1,a5
    2d1c:	bd9d                	j	2b92 <_strtoul_l.constprop.0>

00002d1e <strtoul>:
    2d1e:	87aa                	mv	a5,a0
    2d20:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2d24:	86b2                	mv	a3,a2
    2d26:	862e                	mv	a2,a1
    2d28:	85be                	mv	a1,a5
    2d2a:	b5a5                	j	2b92 <_strtoul_l.constprop.0>

00002d2c <_user_strerror>:
    2d2c:	4501                	li	a0,0
    2d2e:	8082                	ret

00002d30 <__errno>:
    2d30:	0001a503          	lw	a0,0(gp) # 200004e8 <_impure_ptr>
    2d34:	8082                	ret

00002d36 <board_init>:

extern int clock_timer_init(void);
extern int clock_timer_start(void);

void board_init(void)
{
    2d36:	1151                	addi	sp,sp,-12
    2d38:	c406                	sw	ra,8(sp)
    int32_t ret = 0;
    /* init the console*/
    clock_timer_init();
    2d3a:	0b8010ef          	jal	ra,3df2 <clock_timer_init>
    clock_timer_start();
    2d3e:	12e010ef          	jal	ra,3e6c <clock_timer_start>

    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2d42:	4581                	li	a1,0
    2d44:	4501                	li	a0,0
    2d46:	223000ef          	jal	ra,3768 <csi_usart_initialize>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    if (ret < 0) {
        return;
    }
}
    2d4a:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2d4c:	02a1a423          	sw	a0,40(gp) # 20000510 <console_handle>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2d50:	65f1                	lui	a1,0x1c
    2d52:	478d                	li	a5,3
    2d54:	4701                	li	a4,0
    2d56:	4681                	li	a3,0
    2d58:	4601                	li	a2,0
    2d5a:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x15f60>
}
    2d5e:	0131                	addi	sp,sp,12
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2d60:	20b0006f          	j	376a <csi_usart_config>

00002d64 <drv_irq_enable>:
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__STATIC_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    CLIC->INTIE[IRQn] |= CLIC_INTIE_IE_Msk;
    2d64:	e000e7b7          	lui	a5,0xe000e
    2d68:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    2d6c:	953e                	add	a0,a0,a5
    2d6e:	40054783          	lbu	a5,1024(a0)
    2d72:	0ff7f793          	andi	a5,a5,255
    2d76:	0017e793          	ori	a5,a5,1
    2d7a:	40f50023          	sb	a5,1024(a0)
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_enable_sirq(irq_num);
#else
    csi_vic_enable_irq(irq_num);
#endif
}
    2d7e:	8082                	ret

00002d80 <drv_irq_register>:
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    g_irqvector[irq_num] = irq_handler;
    2d80:	200027b7          	lui	a5,0x20002
    2d84:	050a                	slli	a0,a0,0x2
    2d86:	bf078793          	addi	a5,a5,-1040 # 20001bf0 <g_irqvector>
    2d8a:	97aa                	add	a5,a5,a0
    2d8c:	c38c                	sw	a1,0(a5)
}
    2d8e:	8082                	ret

00002d90 <wj_usi_set_rxfifo_th>:

static wj_usi_priv_t usi_instance[CONFIG_USI_NUM];

void wj_usi_set_rxfifo_th(wj_usi_reg_t *addr, uint32_t length)
{
    addr->USI_INTR_CTRL &= ~USI_INTR_CTRL_TH_MODE;
    2d90:	457c                	lw	a5,76(a0)
    2d92:	7741                	lui	a4,0xffff0
    2d94:	177d                	addi	a4,a4,-1
    2d96:	8ff9                	and	a5,a5,a4
    2d98:	c57c                	sw	a5,76(a0)
    addr->USI_INTR_CTRL &= USI_INTR_CTRL_RXFIFO_TH;
    2d9a:	457c                	lw	a5,76(a0)
    2d9c:	cff7f793          	andi	a5,a5,-769
    2da0:	c57c                	sw	a5,76(a0)

    if (length >= USI_RX_MAX_FIFO) {
    2da2:	47bd                	li	a5,15
    2da4:	00b7f963          	bgeu	a5,a1,2db6 <wj_usi_set_rxfifo_th+0x26>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_12 | USI_INTR_CTRL_TH_MODE;
    2da8:	457c                	lw	a5,76(a0)
    2daa:	6741                	lui	a4,0x10
    2dac:	30070713          	addi	a4,a4,768 # 10300 <__ctor_end__+0xa060>
    } else if (length >= USI_RX_MAX_FIFO - 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2db0:	8fd9                	or	a5,a5,a4
    } else {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2db2:	c57c                	sw	a5,76(a0)
    }
}
    2db4:	8082                	ret
    } else if (length >= USI_RX_MAX_FIFO - 4) {
    2db6:	47ad                	li	a5,11
    2db8:	00b7f763          	bgeu	a5,a1,2dc6 <wj_usi_set_rxfifo_th+0x36>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    2dbc:	6741                	lui	a4,0x10
    2dbe:	457c                	lw	a5,76(a0)
    2dc0:	20070713          	addi	a4,a4,512 # 10200 <__ctor_end__+0x9f60>
    2dc4:	b7f5                	j	2db0 <wj_usi_set_rxfifo_th+0x20>
    } else if (length >= 4) {
    2dc6:	478d                	li	a5,3
    2dc8:	00b7f763          	bgeu	a5,a1,2dd6 <wj_usi_set_rxfifo_th+0x46>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2dcc:	6741                	lui	a4,0x10
    2dce:	457c                	lw	a5,76(a0)
    2dd0:	10070713          	addi	a4,a4,256 # 10100 <__ctor_end__+0x9e60>
    2dd4:	bff1                	j	2db0 <wj_usi_set_rxfifo_th+0x20>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2dd6:	457c                	lw	a5,76(a0)
    2dd8:	1007e793          	ori	a5,a5,256
    2ddc:	bfd9                	j	2db2 <wj_usi_set_rxfifo_th+0x22>

00002dde <wj_usi_irqhandler>:
//            CSI_DRIVER
//------------------------------------------
void wj_usi_irqhandler(int32_t idx)
{
    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usi_priv->base);
    2dde:	200017b7          	lui	a5,0x20001
    2de2:	00351713          	slli	a4,a0,0x3
    2de6:	72878793          	addi	a5,a5,1832 # 20001728 <usi_instance>
    2dea:	97ba                	add	a5,a5,a4
    2dec:	439c                	lw	a5,0(a5)

    switch (addr->USI_MODE_SEL & 0x3) {
    2dee:	4705                	li	a4,1
    2df0:	43dc                	lw	a5,4(a5)
    2df2:	8b8d                	andi	a5,a5,3
    2df4:	00e78863          	beq	a5,a4,2e04 <wj_usi_irqhandler+0x26>
    2df8:	4709                	li	a4,2
    2dfa:	00e78663          	beq	a5,a4,2e06 <wj_usi_irqhandler+0x28>
    2dfe:	00079563          	bnez	a5,2e08 <wj_usi_irqhandler+0x2a>
        case USI_MODE_UART:
#ifndef  CONFIG_CHIP_PANGU
            wj_usi_usart_irqhandler(idx);
    2e02:	af01                	j	3512 <wj_usi_usart_irqhandler>
#endif
            break;

        case USI_MODE_I2C:
            wj_usi_i2c_irqhandler(idx);
    2e04:	a0a1                	j	2e4c <wj_usi_i2c_irqhandler>
            break;

        case USI_MODE_SPI:
            wj_usi_spi_irqhandler(idx);
    2e06:	acfd                	j	3104 <wj_usi_spi_irqhandler>
            break;

        default:
            return;
    }
}
    2e08:	8082                	ret

00002e0a <drv_usi_initialize>:

int32_t drv_usi_initialize(int32_t idx)
{
    2e0a:	1131                	addi	sp,sp,-20
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usi_init(idx, &base, &irq);
    2e0c:	0050                	addi	a2,sp,4
    2e0e:	858a                	mv	a1,sp
{
    2e10:	c622                	sw	s0,12(sp)
    2e12:	c806                	sw	ra,16(sp)
    2e14:	842a                	mv	s0,a0
    uint32_t base = 0u;
    2e16:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    2e18:	c202                	sw	zero,4(sp)
    int32_t ret = target_usi_init(idx, &base, &irq);
    2e1a:	1dd000ef          	jal	ra,37f6 <target_usi_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    2e1e:	4789                	li	a5,2
    2e20:	02a7e163          	bltu	a5,a0,2e42 <drv_usi_initialize+0x38>
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    usi_priv->base = base;
    2e24:	4782                	lw	a5,0(sp)
    2e26:	20001537          	lui	a0,0x20001
    2e2a:	040e                	slli	s0,s0,0x3
    2e2c:	72850513          	addi	a0,a0,1832 # 20001728 <usi_instance>
    2e30:	9522                	add	a0,a0,s0
    2e32:	c11c                	sw	a5,0(a0)
    usi_priv->irq  = irq;
    2e34:	4792                	lw	a5,4(sp)
    2e36:	c15c                	sw	a5,4(a0)

    return 0;
    2e38:	4501                	li	a0,0
}
    2e3a:	40c2                	lw	ra,16(sp)
    2e3c:	4432                	lw	s0,12(sp)
    2e3e:	0151                	addi	sp,sp,20
    2e40:	8082                	ret
        return ERR_USI(DRV_ERROR_PARAMETER);
    2e42:	81180537          	lui	a0,0x81180
    2e46:	08450513          	addi	a0,a0,132 # 81180084 <__heap_end+0x61150084>
    2e4a:	bfc5                	j	2e3a <drv_usi_initialize+0x30>

00002e4c <wj_usi_i2c_irqhandler>:

}
void wj_usi_i2c_irqhandler(int32_t idx)
{
    wj_usi_iic_priv_t *iic_priv = &iic_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2e4c:	03000713          	li	a4,48
    2e50:	02e50733          	mul	a4,a0,a4
    2e54:	200017b7          	lui	a5,0x20001
    2e58:	74078693          	addi	a3,a5,1856 # 20001740 <iic_instance>
{
    2e5c:	1121                	addi	sp,sp,-24
    2e5e:	c822                	sw	s0,16(sp)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;

    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2e60:	6599                	lui	a1,0x6
{
    2e62:	c626                	sw	s1,12(sp)
    2e64:	ca06                	sw	ra,20(sp)
    2e66:	84aa                	mv	s1,a0
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2e68:	74078793          	addi	a5,a5,1856
    2e6c:	9736                	add	a4,a4,a3
    2e6e:	4300                	lw	s0,0(a4)
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2e70:	4874                	lw	a3,84(s0)
    2e72:	00e69313          	slli	t1,a3,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2e76:	8df5                	and	a1,a1,a3
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2e78:	00e35313          	srli	t1,t1,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2e7c:	c19d                	beqz	a1,2ea2 <wj_usi_i2c_irqhandler+0x56>
        /* If arbitration fault, it indicates either a slave device not
        * responding as expected, or other master which is not supported
        * by this SW.
        */
        iic_priv->status    = IIC_STATE_DONE;
    2e7e:	4691                	li	a3,4
    2e80:	d714                	sw	a3,40(a4)
        addr->USI_EN = 0;
    2e82:	00042023          	sw	zero,0(s0) # 80000 <__ctor_end__+0x79d60>
        addr->USI_INTR_UNMASK = 0;
    2e86:	04042e23          	sw	zero,92(s0)
        addr->USI_INTR_EN = 0;
        addr->USI_INTR_CLR = intr_state;

        if (iic_priv->cb_event) {
    2e8a:	4718                	lw	a4,8(a4)
        addr->USI_INTR_EN = 0;
    2e8c:	04042823          	sw	zero,80(s0)
        addr->USI_INTR_CLR = intr_state;
    2e90:	06642023          	sw	t1,96(s0)
        if (iic_priv->cb_event) {
    2e94:	cf11                	beqz	a4,2eb0 <wj_usi_i2c_irqhandler+0x64>
            if (iic_priv->cb_event) {
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
            }
        }
    }
}
    2e96:	4442                	lw	s0,16(sp)
    2e98:	40d2                	lw	ra,20(sp)
    2e9a:	44b2                	lw	s1,12(sp)
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2e9c:	459d                	li	a1,7
}
    2e9e:	0161                	addi	sp,sp,24
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2ea0:	8702                	jr	a4
    switch (iic_priv->status) {
    2ea2:	5710                	lw	a2,40(a4)
    2ea4:	4505                	li	a0,1
    2ea6:	02a60663          	beq	a2,a0,2ed2 <wj_usi_i2c_irqhandler+0x86>
    2eaa:	4589                	li	a1,2
    2eac:	10b60263          	beq	a2,a1,2fb0 <wj_usi_i2c_irqhandler+0x164>
            if (iic_priv->cb_event) {
    2eb0:	03000713          	li	a4,48
    2eb4:	02e48733          	mul	a4,s1,a4
            addr->USI_INTR_CLR = intr_state;
    2eb8:	06642023          	sw	t1,96(s0)
            addr->USI_INTR_UNMASK = 0;
    2ebc:	04042e23          	sw	zero,92(s0)
            addr->USI_INTR_EN = 0;
    2ec0:	04042823          	sw	zero,80(s0)
            addr->USI_EN = 0;
    2ec4:	00042023          	sw	zero,0(s0)
            if (iic_priv->cb_event) {
    2ec8:	97ba                	add	a5,a5,a4
    2eca:	479c                	lw	a5,8(a5)
    2ecc:	c7e1                	beqz	a5,2f94 <wj_usi_i2c_irqhandler+0x148>
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2ece:	4599                	li	a1,6
    2ed0:	a2d9                	j	3096 <wj_usi_i2c_irqhandler+0x24a>
    if (intr_stat & USI_INT_TX_EMPTY) {
    2ed2:	0026f513          	andi	a0,a3,2
    uint8_t emptyfifo = 0;
    2ed6:	4601                	li	a2,0
    if (intr_stat & USI_INT_TX_EMPTY) {
    2ed8:	cd05                	beqz	a0,2f10 <wj_usi_i2c_irqhandler+0xc4>
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2eda:	5350                	lw	a2,36(a4)
    2edc:	4b08                	lw	a0,16(a4)
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2ede:	4458                	lw	a4,12(s0)
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2ee0:	8d11                	sub	a0,a0,a2
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2ee2:	8321                	srli	a4,a4,0x8
    2ee4:	4641                	li	a2,16
    2ee6:	8b7d                	andi	a4,a4,31
    2ee8:	40e60733          	sub	a4,a2,a4
    2eec:	0ff57613          	andi	a2,a0,255
    2ef0:	00a77963          	bgeu	a4,a0,2f02 <wj_usi_i2c_irqhandler+0xb6>
    2ef4:	4458                	lw	a4,12(s0)
    2ef6:	4641                	li	a2,16
    2ef8:	8321                	srli	a4,a4,0x8
    2efa:	8b7d                	andi	a4,a4,31
    2efc:	8e19                	sub	a2,a2,a4
    2efe:	0ff67613          	andi	a2,a2,255
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2f02:	03000713          	li	a4,48
    2f06:	02e48733          	mul	a4,s1,a4
    2f0a:	973e                	add	a4,a4,a5
        for (i = 0; i < emptyfifo; i++) {
    2f0c:	08c5e963          	bltu	a1,a2,2f9e <wj_usi_i2c_irqhandler+0x152>
    if (iic_priv->tx_cnt == iic_priv->tx_total_num) {
    2f10:	03000713          	li	a4,48
    2f14:	02e48733          	mul	a4,s1,a4
    2f18:	973e                	add	a4,a4,a5
    2f1a:	534c                	lw	a1,36(a4)
    2f1c:	4b18                	lw	a4,16(a4)
    2f1e:	00e59963          	bne	a1,a4,2f30 <wj_usi_i2c_irqhandler+0xe4>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2f22:	5418                	lw	a4,40(s0)
    2f24:	00276713          	ori	a4,a4,2
    2f28:	d418                	sw	a4,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    2f2a:	4838                	lw	a4,80(s0)
    2f2c:	9b75                	andi	a4,a4,-3
    2f2e:	c838                	sw	a4,80(s0)
    if (intr_stat & USI_INT_I2C_STOP) {
    2f30:	6705                	lui	a4,0x1
    2f32:	8f75                	and	a4,a4,a3
    2f34:	cb0d                	beqz	a4,2f66 <wj_usi_i2c_irqhandler+0x11a>
        iic_priv->status  = IIC_STATE_SEND_DONE;
    2f36:	03000713          	li	a4,48
    2f3a:	02e48733          	mul	a4,s1,a4
    2f3e:	4595                	li	a1,5
    2f40:	973e                	add	a4,a4,a5
    2f42:	d70c                	sw	a1,40(a4)
        if (iic_priv->cb_event) {
    2f44:	4718                	lw	a4,8(a4)
        addr->USI_EN = 0;
    2f46:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f4a:	cf11                	beqz	a4,2f66 <wj_usi_i2c_irqhandler+0x11a>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2f4c:	4581                	li	a1,0
    2f4e:	8526                	mv	a0,s1
    2f50:	c432                	sw	a2,8(sp)
    2f52:	c21a                	sw	t1,4(sp)
    2f54:	c036                	sw	a3,0(sp)
    2f56:	9702                	jalr	a4
    2f58:	4622                	lw	a2,8(sp)
    2f5a:	4312                	lw	t1,4(sp)
    2f5c:	4682                	lw	a3,0(sp)
    2f5e:	200017b7          	lui	a5,0x20001
    2f62:	74078793          	addi	a5,a5,1856 # 20001740 <iic_instance>
    iic_priv->tx_cnt += emptyfifo;
    2f66:	03000713          	li	a4,48
    2f6a:	02e48733          	mul	a4,s1,a4
    if (intr_stat & USI_INT_TX_WERR) {
    2f6e:	8ac1                	andi	a3,a3,16
    iic_priv->tx_cnt += emptyfifo;
    2f70:	97ba                	add	a5,a5,a4
    2f72:	53d8                	lw	a4,36(a5)
    2f74:	963a                	add	a2,a2,a4
    2f76:	d3d0                	sw	a2,36(a5)
    if (intr_stat & USI_INT_TX_WERR) {
    2f78:	ce81                	beqz	a3,2f90 <wj_usi_i2c_irqhandler+0x144>
        iic_priv->status = IIC_STATE_ERROR;
    2f7a:	471d                	li	a4,7
    2f7c:	d798                	sw	a4,40(a5)
        if (iic_priv->cb_event) {
    2f7e:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2f80:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f84:	c791                	beqz	a5,2f90 <wj_usi_i2c_irqhandler+0x144>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2f86:	459d                	li	a1,7
    2f88:	8526                	mv	a0,s1
    2f8a:	c01a                	sw	t1,0(sp)
    2f8c:	9782                	jalr	a5
    2f8e:	4302                	lw	t1,0(sp)
            addr->USI_INTR_CLR = intr_state;
    2f90:	06642023          	sw	t1,96(s0)
}
    2f94:	40d2                	lw	ra,20(sp)
    2f96:	4442                	lw	s0,16(sp)
    2f98:	44b2                	lw	s1,12(sp)
    2f9a:	0161                	addi	sp,sp,24
    2f9c:	8082                	ret
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2f9e:	4f08                	lw	a0,24(a4)
        for (i = 0; i < emptyfifo; i++) {
    2fa0:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = tx_data;
    2fa2:	00054283          	lbu	t0,0(a0)
            iic_priv->tx_buf++;
    2fa6:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = tx_data;
    2fa8:	00542423          	sw	t0,8(s0)
            iic_priv->tx_buf++;
    2fac:	cf08                	sw	a0,24(a4)
        for (i = 0; i < emptyfifo; i++) {
    2fae:	bfb9                	j	2f0c <wj_usi_i2c_irqhandler+0xc0>
    if (intr_stat & USI_INT_RX_THOLD) {
    2fb0:	0206f613          	andi	a2,a3,32
    2fb4:	ca25                	beqz	a2,3024 <wj_usi_i2c_irqhandler+0x1d8>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    2fb6:	02000613          	li	a2,32
    2fba:	d030                	sw	a2,96(s0)
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2fbc:	4450                	lw	a2,12(s0)
    2fbe:	8241                	srli	a2,a2,0x10
    2fc0:	01f67513          	andi	a0,a2,31
        for (i = 0; i < rx_num; i++) {
    2fc4:	4601                	li	a2,0
    2fc6:	0ca66e63          	bltu	a2,a0,30a2 <wj_usi_i2c_irqhandler+0x256>
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2fca:	03000613          	li	a2,48
    2fce:	02c48633          	mul	a2,s1,a2
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2fd2:	4458                	lw	a4,12(s0)
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2fd4:	4585                	li	a1,1
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2fd6:	8321                	srli	a4,a4,0x8
    2fd8:	8b7d                	andi	a4,a4,31
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2fda:	963e                	add	a2,a2,a5
    2fdc:	5208                	lw	a0,32(a2)
    2fde:	4641                	li	a2,16
    2fe0:	8e19                	sub	a2,a2,a4
    2fe2:	00a67663          	bgeu	a2,a0,2fee <wj_usi_i2c_irqhandler+0x1a2>
    2fe6:	45c1                	li	a1,16
    2fe8:	8d99                	sub	a1,a1,a4
    2fea:	0ff5f593          	andi	a1,a1,255
        if (iic_priv->rx_clk == 0) {
    2fee:	03000713          	li	a4,48
    2ff2:	02e48733          	mul	a4,s1,a4
    2ff6:	973e                	add	a4,a4,a5
    2ff8:	5310                	lw	a2,32(a4)
    2ffa:	ce61                	beqz	a2,30d2 <wj_usi_i2c_irqhandler+0x286>
        for (i = 0; i < rxfifo; i++) {
    2ffc:	4601                	li	a2,0
            addr->USI_TX_RX_FIFO = 0x100;
    2ffe:	10000313          	li	t1,256
        for (i = 0; i < rxfifo; i++) {
    3002:	0ab61f63          	bne	a2,a1,30c0 <wj_usi_i2c_irqhandler+0x274>
        wj_usi_set_rxfifo_th(addr, rxfifo);
    3006:	8522                	mv	a0,s0
    3008:	c236                	sw	a3,4(sp)
    300a:	c02e                	sw	a1,0(sp)
    300c:	3351                	jal	2d90 <wj_usi_set_rxfifo_th>
        if (rxfifo == 0) {
    300e:	4582                	lw	a1,0(sp)
    3010:	200017b7          	lui	a5,0x20001
    3014:	4692                	lw	a3,4(sp)
    3016:	74078793          	addi	a5,a5,1856 # 20001740 <iic_instance>
    301a:	e589                	bnez	a1,3024 <wj_usi_i2c_irqhandler+0x1d8>
            addr->USI_INTR_EN |= USI_INT_I2C_STOP;
    301c:	4838                	lw	a4,80(s0)
    301e:	6605                	lui	a2,0x1
    3020:	8f51                	or	a4,a4,a2
    3022:	c838                	sw	a4,80(s0)
    if (iic_priv->rx_cnt == iic_priv->rx_total_num) {
    3024:	03000713          	li	a4,48
    3028:	02e48733          	mul	a4,s1,a4
    302c:	973e                	add	a4,a4,a5
    302e:	4f50                	lw	a2,28(a4)
    3030:	4758                	lw	a4,12(a4)
    3032:	00e61a63          	bne	a2,a4,3046 <wj_usi_i2c_irqhandler+0x1fa>
        addr->USI_I2CM_CTRL |= (1 << 1);
    3036:	5418                	lw	a4,40(s0)
    3038:	00276713          	ori	a4,a4,2
    303c:	d418                	sw	a4,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_RX_THOLD;
    303e:	4838                	lw	a4,80(s0)
    3040:	fdf77713          	andi	a4,a4,-33
    3044:	c838                	sw	a4,80(s0)
    if ((intr_stat & USI_INT_RX_WERR) || (intr_stat & USI_INT_RX_RERR)) {
    3046:	3006f713          	andi	a4,a3,768
    304a:	c70d                	beqz	a4,3074 <wj_usi_i2c_irqhandler+0x228>
        iic_priv->status = IIC_STATE_ERROR;
    304c:	03000713          	li	a4,48
    3050:	02e48733          	mul	a4,s1,a4
    3054:	461d                	li	a2,7
    3056:	973e                	add	a4,a4,a5
    3058:	d710                	sw	a2,40(a4)
        if (iic_priv->cb_event) {
    305a:	4718                	lw	a4,8(a4)
        addr->USI_EN = 0;
    305c:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    3060:	cb11                	beqz	a4,3074 <wj_usi_i2c_irqhandler+0x228>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    3062:	459d                	li	a1,7
    3064:	8526                	mv	a0,s1
    3066:	c036                	sw	a3,0(sp)
    3068:	9702                	jalr	a4
    306a:	4682                	lw	a3,0(sp)
    306c:	200017b7          	lui	a5,0x20001
    3070:	74078793          	addi	a5,a5,1856 # 20001740 <iic_instance>
    if (intr_stat & USI_INT_I2C_STOP) {
    3074:	6705                	lui	a4,0x1
    3076:	8ef9                	and	a3,a3,a4
    3078:	de91                	beqz	a3,2f94 <wj_usi_i2c_irqhandler+0x148>
        addr->USI_INTR_CLR = USI_INT_I2C_STOP;
    307a:	d038                	sw	a4,96(s0)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    307c:	03000713          	li	a4,48
    3080:	02e48733          	mul	a4,s1,a4
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    3084:	4581                	li	a1,0
        iic_priv->status  = IIC_STATE_RECV_DONE;
    3086:	97ba                	add	a5,a5,a4
    3088:	4719                	li	a4,6
    308a:	d798                	sw	a4,40(a5)
        if (iic_priv->cb_event) {
    308c:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    308e:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    3092:	f00781e3          	beqz	a5,2f94 <wj_usi_i2c_irqhandler+0x148>
}
    3096:	4442                	lw	s0,16(sp)
    3098:	40d2                	lw	ra,20(sp)
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    309a:	8526                	mv	a0,s1
}
    309c:	44b2                	lw	s1,12(sp)
    309e:	0161                	addi	sp,sp,24
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    30a0:	8782                	jr	a5
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    30a2:	00842303          	lw	t1,8(s0)
    30a6:	4b4c                	lw	a1,20(a4)
        for (i = 0; i < rx_num; i++) {
    30a8:	0605                	addi	a2,a2,1
    30aa:	0ff67613          	andi	a2,a2,255
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    30ae:	00658023          	sb	t1,0(a1) # 6000 <pad_line+0x480>
            iic_priv->rx_buf++;
    30b2:	4b4c                	lw	a1,20(a4)
    30b4:	0585                	addi	a1,a1,1
    30b6:	cb4c                	sw	a1,20(a4)
            iic_priv->rx_cnt++;;
    30b8:	4f4c                	lw	a1,28(a4)
    30ba:	0585                	addi	a1,a1,1
    30bc:	cf4c                	sw	a1,28(a4)
        for (i = 0; i < rx_num; i++) {
    30be:	b721                	j	2fc6 <wj_usi_i2c_irqhandler+0x17a>
            addr->USI_TX_RX_FIFO = 0x100;
    30c0:	00642423          	sw	t1,8(s0)
            iic_priv->rx_clk--;
    30c4:	5308                	lw	a0,32(a4)
        for (i = 0; i < rxfifo; i++) {
    30c6:	0605                	addi	a2,a2,1
    30c8:	0ff67613          	andi	a2,a2,255
            iic_priv->rx_clk--;
    30cc:	157d                	addi	a0,a0,-1
    30ce:	d308                	sw	a0,32(a4)
        for (i = 0; i < rxfifo; i++) {
    30d0:	bf0d                	j	3002 <wj_usi_i2c_irqhandler+0x1b6>
            rxfifo = 0;
    30d2:	4581                	li	a1,0
    30d4:	bf0d                	j	3006 <wj_usi_i2c_irqhandler+0x1ba>

000030d6 <wj_spi_ss_control.isra.0>:
/**
  \brief control ss line depend on controlled Output mode.
*/
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
{
    if (spi_priv->ss_mode == SPI_SS_MASTER_HW_OUTPUT) {
    30d6:	4789                	li	a5,2
    30d8:	02f51463          	bne	a0,a5,3100 <wj_spi_ss_control.isra.0+0x2a>
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
    30dc:	1151                	addi	sp,sp,-12
    30de:	c406                	sw	ra,8(sp)
        if (stat == SPI_SS_INACTIVE) {
    30e0:	e991                	bnez	a1,30f4 <wj_spi_ss_control.isra.0+0x1e>
            csi_gpio_pin_write(pgpio_pin_handle, true);
    30e2:	4585                	li	a1,1
        } else if (stat == SPI_SS_ACTIVE) {
            csi_gpio_pin_write(pgpio_pin_handle, false);
    30e4:	00c1a503          	lw	a0,12(gp) # 200004f4 <pgpio_pin_handle>
    30e8:	12b000ef          	jal	ra,3a12 <csi_gpio_pin_write>
        } else {
            return -1;
        }
    }

    return 0;
    30ec:	4501                	li	a0,0
}
    30ee:	40a2                	lw	ra,8(sp)
    30f0:	0131                	addi	sp,sp,12
    30f2:	8082                	ret
        } else if (stat == SPI_SS_ACTIVE) {
    30f4:	4785                	li	a5,1
            return -1;
    30f6:	557d                	li	a0,-1
        } else if (stat == SPI_SS_ACTIVE) {
    30f8:	fef59be3          	bne	a1,a5,30ee <wj_spi_ss_control.isra.0+0x18>
            csi_gpio_pin_write(pgpio_pin_handle, false);
    30fc:	4581                	li	a1,0
    30fe:	b7dd                	j	30e4 <wj_spi_ss_control.isra.0+0xe>
    return 0;
    3100:	4501                	li	a0,0
}
    3102:	8082                	ret

00003104 <wj_usi_spi_irqhandler>:
  \brief       handler the interrupt.
  \param[in]   spi      Pointer to \ref SPI_RESOURCES
*/
void wj_usi_spi_irqhandler(int32_t idx)
{
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3104:	04c00793          	li	a5,76
    3108:	02f507b3          	mul	a5,a0,a5
{
    310c:	1101                	addi	sp,sp,-32
    310e:	cc22                	sw	s0,24(sp)
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3110:	20001437          	lui	s0,0x20001
    3114:	7d040313          	addi	t1,s0,2000 # 200017d0 <spi_instance>
{
    3118:	ca26                	sw	s1,20(sp)
    311a:	ce06                	sw	ra,28(sp)
    311c:	872a                	mv	a4,a0
    311e:	7d040413          	addi	s0,s0,2000
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3122:	933e                	add	t1,t1,a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3124:	00032483          	lw	s1,0(t1)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    3128:	48f0                	lw	a2,84(s1)
    312a:	00e61793          	slli	a5,a2,0xe
    312e:	83b9                	srli	a5,a5,0xe
    3130:	c03e                	sw	a5,0(sp)

    /* deal with receive FIFO full interrupt */
    if (intr_state & USI_INT_SPI_STOP) {
    3132:	000207b7          	lui	a5,0x20
    3136:	8ff1                	and	a5,a5,a2
    3138:	c7c9                	beqz	a5,31c2 <wj_usi_spi_irqhandler+0xbe>
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    313a:	44dc                	lw	a5,12(s1)
    uint32_t length = spi_priv->recv_num;
    313c:	01432503          	lw	a0,20(t1)
    uint8_t *pbuffer = spi_priv->recv_buf;
    3140:	01c32583          	lw	a1,28(t1)
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    3144:	83c1                	srli	a5,a5,0x10
    uint32_t rxdata_num = (rxnum > length) ? length : rxnum;
    3146:	8bfd                	andi	a5,a5,31
    3148:	00f57363          	bgeu	a0,a5,314e <wj_usi_spi_irqhandler+0x4a>
    314c:	87aa                	mv	a5,a0
    for (i = 0; i < rxdata_num; i++) {
    314e:	00f582b3          	add	t0,a1,a5
    3152:	0a559d63          	bne	a1,t0,320c <wj_usi_spi_irqhandler+0x108>
    length -= rxdata_num;
    3156:	40f502b3          	sub	t0,a0,a5
    if (length <= 0) {
    315a:	0af51f63          	bne	a0,a5,3218 <wj_usi_spi_irqhandler+0x114>
        addr->USI_INTR_EN &= ~USI_INT_SPI_STOP;
    315e:	48bc                	lw	a5,80(s1)
    3160:	7581                	lui	a1,0xfffe0
    3162:	15fd                	addi	a1,a1,-1
    3164:	8fed                	and	a5,a5,a1
    3166:	c8bc                	sw	a5,80(s1)
        spi_priv->status.busy = 0U;
    3168:	04c00793          	li	a5,76
    316c:	02f707b3          	mul	a5,a4,a5
    3170:	c832                	sw	a2,16(sp)
    3172:	c63a                	sw	a4,12(sp)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3174:	c21a                	sw	t1,4(sp)
        spi_priv->status.busy = 0U;
    3176:	97a2                	add	a5,a5,s0
    3178:	0387c583          	lbu	a1,56(a5) # 20038 <__ctor_end__+0x19d98>
        spi_priv->recv_num = 0;
    317c:	c43e                	sw	a5,8(sp)
        spi_priv->status.busy = 0U;
    317e:	99f9                	andi	a1,a1,-2
    3180:	02b78c23          	sb	a1,56(a5)
        addr->USI_EN = 0x0;
    3184:	0004a023          	sw	zero,0(s1) # 80000000 <__heap_end+0x5ffd0000>
        addr->USI_EN = 0xf;
    3188:	45bd                	li	a1,15
    318a:	c08c                	sw	a1,0(s1)
        addr->USI_EN = 0x0;
    318c:	0004a023          	sw	zero,0(s1)
        spi_priv->recv_num = 0;
    3190:	0007aa23          	sw	zero,20(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3194:	03434503          	lbu	a0,52(t1)
    3198:	4581                	li	a1,0
    319a:	3f35                	jal	30d6 <wj_spi_ss_control.isra.0>
        if (spi_priv->cb_event) {
    319c:	47a2                	lw	a5,8(sp)
    319e:	4312                	lw	t1,4(sp)
    31a0:	4732                	lw	a4,12(sp)
    31a2:	00c7a383          	lw	t2,12(a5)
    31a6:	4642                	lw	a2,16(sp)
    31a8:	00038a63          	beqz	t2,31bc <wj_usi_spi_irqhandler+0xb8>
            spi_priv->cb_event(spi_priv->idx, SPI_EVENT_RX_COMPLETE);
    31ac:	43a8                	lw	a0,64(a5)
    31ae:	4589                	li	a1,2
    31b0:	c41a                	sw	t1,8(sp)
    31b2:	c232                	sw	a2,4(sp)
    31b4:	9382                	jalr	t2
            return;
    31b6:	4612                	lw	a2,4(sp)
    31b8:	4322                	lw	t1,8(sp)
    31ba:	4732                	lw	a4,12(sp)
        wj_spi_intr_rx_full(spi_priv);
        addr->USI_INTR_CLR = USI_INT_SPI_STOP;
    31bc:	000207b7          	lui	a5,0x20
    31c0:	d0bc                	sw	a5,96(s1)
    }

    /* deal with transmit FIFO empty interrupt */
    if (intr_state & USI_INT_TX_EMPTY) {
    31c2:	8a09                	andi	a2,a2,2
    31c4:	10060363          	beqz	a2,32ca <wj_usi_spi_irqhandler+0x1c6>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    31c8:	04c00793          	li	a5,76
    31cc:	02f707b3          	mul	a5,a4,a5
    31d0:	97a2                	add	a5,a5,s0
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    31d2:	5b8c                	lw	a1,48(a5)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    31d4:	4390                	lw	a2,0(a5)
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    31d6:	c1d9                	beqz	a1,325c <wj_usi_spi_irqhandler+0x158>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    31d8:	578c                	lw	a1,40(a5)
    31da:	47c1                	li	a5,16
    31dc:	00b7f363          	bgeu	a5,a1,31e2 <wj_usi_spi_irqhandler+0xde>
    31e0:	45c1                	li	a1,16
    31e2:	04c00793          	li	a5,76
    31e6:	02f707b3          	mul	a5,a4,a5
    31ea:	4281                	li	t0,0
    31ec:	97a2                	add	a5,a5,s0
    31ee:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31f0:	08558563          	beq	a1,t0,327a <wj_usi_spi_irqhandler+0x176>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31f4:	4f88                	lw	a0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31f6:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31f8:	00054383          	lbu	t2,0(a0)
            spi_priv->send_buf++;
    31fc:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31fe:	00762423          	sw	t2,8(a2) # 1008 <__divdf3+0x15e>
            spi_priv->send_buf++;
    3202:	cf88                	sw	a0,24(a5)
            spi_priv->send_num--;
    3204:	4b88                	lw	a0,16(a5)
    3206:	157d                	addi	a0,a0,-1
    3208:	cb88                	sw	a0,16(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    320a:	b7dd                	j	31f0 <wj_usi_spi_irqhandler+0xec>
        *pbuffer = addr->USI_TX_RX_FIFO;
    320c:	0084a383          	lw	t2,8(s1)
        pbuffer++;
    3210:	0585                	addi	a1,a1,1
        *pbuffer = addr->USI_TX_RX_FIFO;
    3212:	fe758fa3          	sb	t2,-1(a1) # fffdffff <__heap_end+0xdffaffff>
    for (i = 0; i < rxdata_num; i++) {
    3216:	bf35                	j	3152 <wj_usi_spi_irqhandler+0x4e>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3218:	04c00793          	li	a5,76
    321c:	02f707b3          	mul	a5,a4,a5
    3220:	97a2                	add	a5,a5,s0
    3222:	4388                	lw	a0,0(a5)
            addr->USI_SPI_CTRL &= ~WJ_USI_SPI_CTRL_TMODE;
    3224:	04452383          	lw	t2,68(a0)
    3228:	fcf3f393          	andi	t2,t2,-49
    322c:	04752223          	sw	t2,68(a0)
            addr->USI_SPI_CTRL |= WJ_USI_SPI_CTRL_TMODE_RX;
    3230:	04452383          	lw	t2,68(a0)
    3234:	0203e393          	ori	t2,t2,32
    3238:	04752223          	sw	t2,68(a0)
    spi_priv->mode = mode;
    323c:	4509                	li	a0,2
    323e:	db88                	sw	a0,48(a5)
        spi_priv->recv_buf = pbuffer;
    3240:	cfcc                	sw	a1,28(a5)
        spi_priv->recv_num = length;
    3242:	0057aa23          	sw	t0,20(a5) # 20014 <__ctor_end__+0x19d74>
    3246:	bf9d                	j	31bc <wj_usi_spi_irqhandler+0xb8>
            *spi_priv->recv_buf = addr->USI_TX_RX_FIFO;
    3248:	4608                	lw	a0,8(a2)
    324a:	4fcc                	lw	a1,28(a5)
    324c:	00a58023          	sb	a0,0(a1)
            spi_priv->recv_buf++;
    3250:	4fcc                	lw	a1,28(a5)
    3252:	0585                	addi	a1,a1,1
    3254:	cfcc                	sw	a1,28(a5)
            spi_priv->transfer_num--;
    3256:	53cc                	lw	a1,36(a5)
    3258:	15fd                	addi	a1,a1,-1
    325a:	d3cc                	sw	a1,36(a5)
        while (spi_priv->transfer_num) {
    325c:	53c8                	lw	a0,36(a5)
    325e:	f56d                	bnez	a0,3248 <wj_usi_spi_irqhandler+0x144>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    3260:	578c                	lw	a1,40(a5)
    3262:	47c1                	li	a5,16
    3264:	00b7f363          	bgeu	a5,a1,326a <wj_usi_spi_irqhandler+0x166>
    3268:	45c1                	li	a1,16
    326a:	04c00793          	li	a5,76
    326e:	02f707b3          	mul	a5,a4,a5
    3272:	97a2                	add	a5,a5,s0
    3274:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    3276:	06b51163          	bne	a0,a1,32d8 <wj_usi_spi_irqhandler+0x1d4>
    if (spi_priv->clk_num == 0) {
    327a:	04c00793          	li	a5,76
    327e:	02f707b3          	mul	a5,a4,a5
    3282:	97a2                	add	a5,a5,s0
    3284:	578c                	lw	a1,40(a5)
    3286:	eda5                	bnez	a1,32fe <wj_usi_spi_irqhandler+0x1fa>
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    3288:	4a2c                	lw	a1,80(a2)
    328a:	c63a                	sw	a4,12(sp)
    328c:	c432                	sw	a2,8(sp)
    328e:	99f5                	andi	a1,a1,-3
    3290:	ca2c                	sw	a1,80(a2)
        spi_priv->status.busy = 0U;
    3292:	0387c583          	lbu	a1,56(a5)
        spi_priv->send_num = 0;
    3296:	0007a823          	sw	zero,16(a5)
    329a:	c23e                	sw	a5,4(sp)
        spi_priv->status.busy = 0U;
    329c:	99f9                	andi	a1,a1,-2
    329e:	02b78c23          	sb	a1,56(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    32a2:	03434503          	lbu	a0,52(t1)
    32a6:	4581                	li	a1,0
    32a8:	353d                	jal	30d6 <wj_spi_ss_control.isra.0>
        addr->USI_EN = 0x0;
    32aa:	4622                	lw	a2,8(sp)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    32ac:	4792                	lw	a5,4(sp)
        addr->USI_EN = 0xf;
    32ae:	45bd                	li	a1,15
        addr->USI_EN = 0x0;
    32b0:	00062023          	sw	zero,0(a2)
        addr->USI_EN = 0xf;
    32b4:	c20c                	sw	a1,0(a2)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    32b6:	5b8c                	lw	a1,48(a5)
    32b8:	47d0                	lw	a2,12(a5)
    32ba:	4732                	lw	a4,12(sp)
    32bc:	ed95                	bnez	a1,32f8 <wj_usi_spi_irqhandler+0x1f4>
            if (spi_priv->cb_event) {
    32be:	04060063          	beqz	a2,32fe <wj_usi_spi_irqhandler+0x1fa>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    32c2:	43a8                	lw	a0,64(a5)
    32c4:	9602                	jalr	a2
        wj_spi_intr_tx_empty(spi_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    32c6:	4789                	li	a5,2
    32c8:	d0bc                	sw	a5,96(s1)
    }

    addr->USI_INTR_CLR = intr_state;
    32ca:	4782                	lw	a5,0(sp)
}
    32cc:	40f2                	lw	ra,28(sp)
    32ce:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    32d0:	d0bc                	sw	a5,96(s1)
}
    32d2:	44d2                	lw	s1,20(sp)
    32d4:	6105                	addi	sp,sp,32
    32d6:	8082                	ret
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    32d8:	0187a283          	lw	t0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    32dc:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    32de:	0002c383          	lbu	t2,0(t0) # 243e <memset+0x92>
            spi_priv->send_buf++;
    32e2:	0285                	addi	t0,t0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    32e4:	00762423          	sw	t2,8(a2)
            spi_priv->send_buf++;
    32e8:	0057ac23          	sw	t0,24(a5)
            spi_priv->send_num--;
    32ec:	0107a283          	lw	t0,16(a5)
    32f0:	12fd                	addi	t0,t0,-1
    32f2:	0057a823          	sw	t0,16(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    32f6:	b741                	j	3276 <wj_usi_spi_irqhandler+0x172>
            if (spi_priv->cb_event) {
    32f8:	c219                	beqz	a2,32fe <wj_usi_spi_irqhandler+0x1fa>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    32fa:	4585                	li	a1,1
    32fc:	b7d9                	j	32c2 <wj_usi_spi_irqhandler+0x1be>
    spi_priv->clk_num -= spi_priv->transfer_num;
    32fe:	04c00513          	li	a0,76
    3302:	02a70733          	mul	a4,a4,a0
    3306:	943a                	add	s0,s0,a4
    3308:	541c                	lw	a5,40(s0)
    330a:	5058                	lw	a4,36(s0)
    330c:	8f99                	sub	a5,a5,a4
    330e:	d41c                	sw	a5,40(s0)
    3310:	bf5d                	j	32c6 <wj_usi_spi_irqhandler+0x1c2>

00003312 <ck_usart_intr_recv_data>:
  \brief        interrupt service function for receiver data available.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_data(wj_usi_usart_priv_t *usart_priv)
{
    if ((usart_priv->rx_total_num == 0) || (usart_priv->rx_buf == NULL)) {
    3312:	4558                	lw	a4,12(a0)
    3314:	c319                	beqz	a4,331a <ck_usart_intr_recv_data+0x8>
    3316:	495c                	lw	a5,20(a0)
    3318:	e789                	bnez	a5,3322 <ck_usart_intr_recv_data+0x10>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    331a:	451c                	lw	a5,8(a0)
    331c:	45b9                	li	a1,14
        usart_priv->rx_buf = NULL;
        usart_priv->rx_busy = 0;
        usart_priv->rx_total_num = 0;

        if (usart_priv->cb_event) {
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    331e:	5948                	lw	a0,52(a0)
    3320:	8782                	jr	a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3322:	4110                	lw	a2,0(a0)
    uint32_t rxfifo_num = (addr->USI_FIFO_STA >> 16) & 0xf;
    3324:	465c                	lw	a5,12(a2)
    3326:	83c1                	srli	a5,a5,0x10
    3328:	8bbd                	andi	a5,a5,15
    uint32_t rxdata_num = (rxfifo_num > usart_priv->rx_total_num) ? usart_priv->rx_total_num : rxfifo_num;
    332a:	00f77363          	bgeu	a4,a5,3330 <ck_usart_intr_recv_data+0x1e>
    332e:	87ba                	mv	a5,a4
    for (i = 0; i < rxdata_num; i++) {
    3330:	4701                	li	a4,0
    3332:	02f71363          	bne	a4,a5,3358 <ck_usart_intr_recv_data+0x46>
    if (usart_priv->rx_cnt >= usart_priv->rx_total_num) {
    3336:	4d58                	lw	a4,28(a0)
    3338:	455c                	lw	a5,12(a0)
    333a:	02f76b63          	bltu	a4,a5,3370 <ck_usart_intr_recv_data+0x5e>
        usart_priv->last_rx_num = usart_priv->rx_total_num;
    333e:	d91c                	sw	a5,48(a0)
        if (usart_priv->cb_event) {
    3340:	451c                	lw	a5,8(a0)
        usart_priv->rx_cnt = 0;
    3342:	00052e23          	sw	zero,28(a0)
        usart_priv->rx_buf = NULL;
    3346:	00052a23          	sw	zero,20(a0)
        usart_priv->rx_busy = 0;
    334a:	02052423          	sw	zero,40(a0)
        usart_priv->rx_total_num = 0;
    334e:	00052623          	sw	zero,12(a0)
        if (usart_priv->cb_event) {
    3352:	cf99                	beqz	a5,3370 <ck_usart_intr_recv_data+0x5e>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    3354:	4585                	li	a1,1
    3356:	b7e1                	j	331e <ck_usart_intr_recv_data+0xc>
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    3358:	460c                	lw	a1,8(a2)
    335a:	4954                	lw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    335c:	0705                	addi	a4,a4,1
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    335e:	00b68023          	sb	a1,0(a3)
        usart_priv->rx_cnt++;
    3362:	4d54                	lw	a3,28(a0)
    3364:	0685                	addi	a3,a3,1
    3366:	cd54                	sw	a3,28(a0)
        usart_priv->rx_buf++;
    3368:	4954                	lw	a3,20(a0)
    336a:	0685                	addi	a3,a3,1
    336c:	c954                	sw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    336e:	b7d1                	j	3332 <ck_usart_intr_recv_data+0x20>
        }
    }
}
    3370:	8082                	ret

00003372 <drv_usi_usart_config_baudrate>:
{
    3372:	1151                	addi	sp,sp,-12
    3374:	c222                	sw	s0,4(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3376:	4100                	lw	s0,0(a0)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3378:	5948                	lw	a0,52(a0)
{
    337a:	c026                	sw	s1,0(sp)
    337c:	c406                	sw	ra,8(sp)
    addr->USI_EN = 0x0;
    337e:	00042023          	sw	zero,0(s0)
{
    3382:	84ae                	mv	s1,a1
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3384:	171000ef          	jal	ra,3cf4 <drv_get_usi_freq>
    3388:	4729                	li	a4,10
    338a:	02e50533          	mul	a0,a0,a4
    338e:	029555b3          	divu	a1,a0,s1
    3392:	8191                	srli	a1,a1,0x4
        divisor = (divisor / 10);
    3394:	02e5d7b3          	divu	a5,a1,a4
    if ((divisor % 10) >= 5) {
    3398:	02e5f5b3          	remu	a1,a1,a4
    339c:	4711                	li	a4,4
    339e:	00b76363          	bltu	a4,a1,33a4 <drv_usi_usart_config_baudrate+0x32>
        divisor = divisor / 10 - 1;
    33a2:	17fd                	addi	a5,a5,-1
    addr->USI_CLK_DIV0 = divisor;
    33a4:	c81c                	sw	a5,16(s0)
    addr->USI_EN = 0xf;
    33a6:	47bd                	li	a5,15
}
    33a8:	40a2                	lw	ra,8(sp)
    addr->USI_EN = 0xf;
    33aa:	c01c                	sw	a5,0(s0)
}
    33ac:	4412                	lw	s0,4(sp)
    33ae:	4482                	lw	s1,0(sp)
    33b0:	4501                	li	a0,0
    33b2:	0131                	addi	sp,sp,12
    33b4:	8082                	ret

000033b6 <drv_usi_usart_config_mode>:
    USART_NULL_PARAM_CHK(handle);
    33b6:	cd11                	beqz	a0,33d2 <drv_usi_usart_config_mode+0x1c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    33b8:	411c                	lw	a5,0(a0)
        addr->USI_EN = 0xf;
    33ba:	473d                	li	a4,15
    addr->USI_EN = 0x0;
    33bc:	0007a023          	sw	zero,0(a5)
        addr->USI_EN = 0xf;
    33c0:	c398                	sw	a4,0(a5)
    if (mode == USART_MODE_ASYNCHRONOUS) {
    33c2:	e199                	bnez	a1,33c8 <drv_usi_usart_config_mode+0x12>
        return 0;
    33c4:	4501                	li	a0,0
    33c6:	8082                	ret
    return ERR_USART(USART_ERROR_MODE);
    33c8:	81020537          	lui	a0,0x81020
    33cc:	08650513          	addi	a0,a0,134 # 81020086 <__heap_end+0x60ff0086>
    33d0:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    33d2:	81020537          	lui	a0,0x81020
    33d6:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    33da:	8082                	ret

000033dc <drv_usi_usart_config_parity>:
    USART_NULL_PARAM_CHK(handle);
    33dc:	c539                	beqz	a0,342a <drv_usi_usart_config_parity+0x4e>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    33de:	411c                	lw	a5,0(a0)
    switch (parity) {
    33e0:	4705                	li	a4,1
    addr->USI_EN = 0x0;
    33e2:	0007a023          	sw	zero,0(a5)
    switch (parity) {
    33e6:	02e58763          	beq	a1,a4,3414 <drv_usi_usart_config_parity+0x38>
    33ea:	4709                	li	a4,2
    33ec:	00e58b63          	beq	a1,a4,3402 <drv_usi_usart_config_parity+0x26>
    33f0:	04059263          	bnez	a1,3434 <drv_usi_usart_config_parity+0x58>
            addr->USI_UART_CTRL &= ~CTRL_PARITY_ENABLE;
    33f4:	4f98                	lw	a4,24(a5)
    33f6:	9b3d                	andi	a4,a4,-17
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    33f8:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    33fa:	473d                	li	a4,15
    33fc:	c398                	sw	a4,0(a5)
    return 0;
    33fe:	4501                	li	a0,0
    3400:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    3402:	4f98                	lw	a4,24(a5)
    3404:	8b3d                	andi	a4,a4,15
    3406:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    3408:	4f98                	lw	a4,24(a5)
    340a:	01076713          	ori	a4,a4,16
    340e:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ODD;
    3410:	4f98                	lw	a4,24(a5)
    3412:	b7dd                	j	33f8 <drv_usi_usart_config_parity+0x1c>
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    3414:	4f98                	lw	a4,24(a5)
    3416:	8b3d                	andi	a4,a4,15
    3418:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    341a:	4f98                	lw	a4,24(a5)
    341c:	01076713          	ori	a4,a4,16
    3420:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    3422:	4f98                	lw	a4,24(a5)
    3424:	02076713          	ori	a4,a4,32
    3428:	bfc1                	j	33f8 <drv_usi_usart_config_parity+0x1c>
    USART_NULL_PARAM_CHK(handle);
    342a:	81020537          	lui	a0,0x81020
    342e:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
    3432:	8082                	ret
    switch (parity) {
    3434:	81020537          	lui	a0,0x81020
    3438:	08950513          	addi	a0,a0,137 # 81020089 <__heap_end+0x60ff0089>
}
    343c:	8082                	ret

0000343e <drv_usi_usart_config_stopbits>:
    USART_NULL_PARAM_CHK(handle);
    343e:	c531                	beqz	a0,348a <drv_usi_usart_config_stopbits+0x4c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3440:	411c                	lw	a5,0(a0)
    switch (stopbit) {
    3442:	4705                	li	a4,1
    addr->USI_EN = 0x0;
    3444:	0007a023          	sw	zero,0(a5)
    switch (stopbit) {
    3448:	02e58963          	beq	a1,a4,347a <drv_usi_usart_config_stopbits+0x3c>
    344c:	4709                	li	a4,2
    344e:	00e58e63          	beq	a1,a4,346a <drv_usi_usart_config_stopbits+0x2c>
    3452:	04059163          	bnez	a1,3494 <drv_usi_usart_config_stopbits+0x56>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3456:	4f98                	lw	a4,24(a5)
    3458:	03377713          	andi	a4,a4,51
    345c:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1;
    345e:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3460:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    3462:	473d                	li	a4,15
    3464:	c398                	sw	a4,0(a5)
    return 0;
    3466:	4501                	li	a0,0
    3468:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    346a:	4f98                	lw	a4,24(a5)
    346c:	03377713          	andi	a4,a4,51
    3470:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1_5;
    3472:	4f98                	lw	a4,24(a5)
    3474:	00476713          	ori	a4,a4,4
    3478:	b7e5                	j	3460 <drv_usi_usart_config_stopbits+0x22>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    347a:	4f98                	lw	a4,24(a5)
    347c:	03377713          	andi	a4,a4,51
    3480:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3482:	4f98                	lw	a4,24(a5)
    3484:	00876713          	ori	a4,a4,8
    3488:	bfe1                	j	3460 <drv_usi_usart_config_stopbits+0x22>
    USART_NULL_PARAM_CHK(handle);
    348a:	81020537          	lui	a0,0x81020
    348e:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
    3492:	8082                	ret
    switch (stopbit) {
    3494:	81020537          	lui	a0,0x81020
    3498:	08a50513          	addi	a0,a0,138 # 8102008a <__heap_end+0x60ff008a>
}
    349c:	8082                	ret

0000349e <drv_usi_usart_config_databits>:
    USART_NULL_PARAM_CHK(handle);
    349e:	c52d                	beqz	a0,3508 <drv_usi_usart_config_databits+0x6a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    34a0:	411c                	lw	a5,0(a0)
    switch (databits) {
    34a2:	4709                	li	a4,2
    addr->USI_EN = 0x0;
    34a4:	0007a023          	sw	zero,0(a5)
    switch (databits) {
    34a8:	04e58063          	beq	a1,a4,34e8 <drv_usi_usart_config_databits+0x4a>
    34ac:	00b76e63          	bltu	a4,a1,34c8 <drv_usi_usart_config_databits+0x2a>
    34b0:	02059463          	bnez	a1,34d8 <drv_usi_usart_config_databits+0x3a>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    34b4:	4f98                	lw	a4,24(a5)
    34b6:	03c77713          	andi	a4,a4,60
    34ba:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_5;
    34bc:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    34be:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    34c0:	473d                	li	a4,15
    34c2:	c398                	sw	a4,0(a5)
    return 0;
    34c4:	4501                	li	a0,0
    34c6:	8082                	ret
    switch (databits) {
    34c8:	470d                	li	a4,3
    34ca:	02e58763          	beq	a1,a4,34f8 <drv_usi_usart_config_databits+0x5a>
    34ce:	81020537          	lui	a0,0x81020
    34d2:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60ff0088>
    34d6:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    34d8:	4f98                	lw	a4,24(a5)
    34da:	03c77713          	andi	a4,a4,60
    34de:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_6;
    34e0:	4f98                	lw	a4,24(a5)
    34e2:	00176713          	ori	a4,a4,1
    34e6:	bfe1                	j	34be <drv_usi_usart_config_databits+0x20>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    34e8:	4f98                	lw	a4,24(a5)
    34ea:	03c77713          	andi	a4,a4,60
    34ee:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_7;
    34f0:	4f98                	lw	a4,24(a5)
    34f2:	00276713          	ori	a4,a4,2
    34f6:	b7e1                	j	34be <drv_usi_usart_config_databits+0x20>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    34f8:	4f98                	lw	a4,24(a5)
    34fa:	03c77713          	andi	a4,a4,60
    34fe:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    3500:	4f98                	lw	a4,24(a5)
    3502:	00376713          	ori	a4,a4,3
    3506:	bf65                	j	34be <drv_usi_usart_config_databits+0x20>
    USART_NULL_PARAM_CHK(handle);
    3508:	81020537          	lui	a0,0x81020
    350c:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    3510:	8082                	ret

00003512 <wj_usi_usart_irqhandler>:
    }
}

void wj_usi_usart_irqhandler(int idx)
{
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3512:	03800793          	li	a5,56
    3516:	02f507b3          	mul	a5,a0,a5
    351a:	200026b7          	lui	a3,0x20002
    351e:	8b468713          	addi	a4,a3,-1868 # 200018b4 <usi_usart_instance>
{
    3522:	1101                	addi	sp,sp,-32
    3524:	ca26                	sw	s1,20(sp)
    3526:	8b468693          	addi	a3,a3,-1868
    352a:	cc22                	sw	s0,24(sp)
    352c:	ce06                	sw	ra,28(sp)
    352e:	c036                	sw	a3,0(sp)
    3530:	842a                	mv	s0,a0
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3532:	97ba                	add	a5,a5,a4
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3534:	4398                	lw	a4,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    3536:	4b64                	lw	s1,84(a4)
    3538:	00e49613          	slli	a2,s1,0xe
    353c:	8239                	srli	a2,a2,0xe
    353e:	c232                	sw	a2,4(sp)

    if (intr_state & USI_INT_TX_EMPTY) {
    3540:	0024f613          	andi	a2,s1,2
    3544:	c229                	beqz	a2,3586 <wj_usi_usart_irqhandler+0x74>
    if (usart_priv->tx_total_num == 0) {
    3546:	4b94                	lw	a3,16(a5)
    3548:	ce8d                	beqz	a3,3582 <wj_usi_usart_irqhandler+0x70>
    if (usart_priv->tx_cnt >= usart_priv->tx_total_num) {
    354a:	5390                	lw	a2,32(a5)
    354c:	0cd66363          	bltu	a2,a3,3612 <wj_usi_usart_irqhandler+0x100>
        addr->USI_INTR_EN &= (~USI_INT_TX_EMPTY);
    3550:	4b30                	lw	a2,80(a4)
    3552:	9a75                	andi	a2,a2,-3
    3554:	cb30                	sw	a2,80(a4)
        addr->USI_INTR_EN |= USI_INT_UART_STOP;
    3556:	4b30                	lw	a2,80(a4)
    3558:	40066613          	ori	a2,a2,1024
    355c:	cb30                	sw	a2,80(a4)
        usart_priv->last_tx_num = usart_priv->tx_total_num;
    355e:	d7d4                	sw	a3,44(a5)
        if (usart_priv->cb_event) {
    3560:	4794                	lw	a3,8(a5)
        usart_priv->tx_cnt = 0;
    3562:	0207a023          	sw	zero,32(a5)
        usart_priv->tx_busy = 0;
    3566:	0207a223          	sw	zero,36(a5)
        usart_priv->tx_buf = NULL;
    356a:	0007ac23          	sw	zero,24(a5)
        usart_priv->tx_total_num = 0;
    356e:	0007a823          	sw	zero,16(a5)
        if (usart_priv->cb_event) {
    3572:	ca81                	beqz	a3,3582 <wj_usi_usart_irqhandler+0x70>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_SEND_COMPLETE);
    3574:	5bc8                	lw	a0,52(a5)
    3576:	4581                	li	a1,0
    3578:	c63a                	sw	a4,12(sp)
    357a:	c43e                	sw	a5,8(sp)
    357c:	9682                	jalr	a3
    357e:	47a2                	lw	a5,8(sp)
    3580:	4732                	lw	a4,12(sp)
        ck_usart_intr_threshold_empty(usart_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    3582:	4689                	li	a3,2
    3584:	d334                	sw	a3,96(a4)
    }

    if (intr_state & USI_INT_RX_THOLD) {
    3586:	0204f693          	andi	a3,s1,32
    358a:	ca91                	beqz	a3,359e <wj_usi_usart_irqhandler+0x8c>
        ck_usart_intr_recv_data(usart_priv);
    358c:	853e                	mv	a0,a5
    358e:	c63a                	sw	a4,12(sp)
    3590:	c43e                	sw	a5,8(sp)
    3592:	3341                	jal	3312 <ck_usart_intr_recv_data>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    3594:	4732                	lw	a4,12(sp)
    3596:	47a2                	lw	a5,8(sp)
    3598:	02000693          	li	a3,32
    359c:	d334                	sw	a3,96(a4)
    }

    if (intr_state & USI_INT_UART_STOP) {
    359e:	4004f693          	andi	a3,s1,1024
    35a2:	c695                	beqz	a3,35ce <wj_usi_usart_irqhandler+0xbc>
        if (USI_FIFO_STA_RX_NUM(addr) > 0) {
    35a4:	4754                	lw	a3,12(a4)
    35a6:	82c1                	srli	a3,a3,0x10
    35a8:	8afd                	andi	a3,a3,31
    35aa:	ce99                	beqz	a3,35c8 <wj_usi_usart_irqhandler+0xb6>
    if ((usart_priv->rx_total_num != 0) && (usart_priv->rx_buf != NULL)) {
    35ac:	03800693          	li	a3,56
    35b0:	02d406b3          	mul	a3,s0,a3
    35b4:	4602                	lw	a2,0(sp)
    35b6:	96b2                	add	a3,a3,a2
    35b8:	46d0                	lw	a2,12(a3)
    35ba:	ce51                	beqz	a2,3656 <wj_usi_usart_irqhandler+0x144>
    35bc:	4ad4                	lw	a3,20(a3)
    35be:	cec1                	beqz	a3,3656 <wj_usi_usart_irqhandler+0x144>
        ck_usart_intr_recv_data(usart_priv);
    35c0:	853e                	mv	a0,a5
    35c2:	c43a                	sw	a4,8(sp)
    35c4:	33b9                	jal	3312 <ck_usart_intr_recv_data>
        return;
    35c6:	4722                	lw	a4,8(sp)
            ck_usart_intr_char_timeout(usart_priv);     //receive small data
        }

        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    35c8:	02000793          	li	a5,32
    35cc:	d33c                	sw	a5,96(a4)
    }

    if (intr_state & USI_INT_UART_PERR) {
    35ce:	80ad                	srli	s1,s1,0xb
    35d0:	8885                	andi	s1,s1,1
    35d2:	c88d                	beqz	s1,3604 <wj_usi_usart_irqhandler+0xf2>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    35d4:	03800513          	li	a0,56
    35d8:	02a40433          	mul	s0,s0,a0
    35dc:	4782                	lw	a5,0(sp)
    35de:	943e                	add	s0,s0,a5
    35e0:	401c                	lw	a5,0(s0)
    addr->USI_EN &= ~USI_RX_FIFO_EN;
    35e2:	4394                	lw	a3,0(a5)
    35e4:	9add                	andi	a3,a3,-9
    35e6:	c394                	sw	a3,0(a5)
    addr->USI_EN |= USI_RX_FIFO_EN;
    35e8:	4394                	lw	a3,0(a5)
    35ea:	0086e693          	ori	a3,a3,8
    35ee:	c394                	sw	a3,0(a5)
    if (usart_priv->cb_event) {
    35f0:	441c                	lw	a5,8(s0)
    35f2:	c791                	beqz	a5,35fe <wj_usi_usart_irqhandler+0xec>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RX_PARITY_ERROR);
    35f4:	5848                	lw	a0,52(s0)
    35f6:	45a5                	li	a1,9
    35f8:	c03a                	sw	a4,0(sp)
    35fa:	9782                	jalr	a5
    35fc:	4702                	lw	a4,0(sp)
        ck_usart_intr_recv_line(usart_priv);
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    35fe:	02000793          	li	a5,32
    3602:	d33c                	sw	a5,96(a4)
    }

    addr->USI_INTR_CLR = intr_state;
    3604:	4792                	lw	a5,4(sp)
}
    3606:	40f2                	lw	ra,28(sp)
    3608:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    360a:	d33c                	sw	a5,96(a4)
}
    360c:	44d2                	lw	s1,20(sp)
    360e:	6105                	addi	sp,sp,32
    3610:	8082                	ret
        uint32_t remain_txdata  = usart_priv->tx_total_num - usart_priv->tx_cnt;
    3612:	538c                	lw	a1,32(a5)
    3614:	40b685b3          	sub	a1,a3,a1
        uint32_t txdata_num = (remain_txdata > (USI_TX_MAX_FIFO - 1)) ? (USI_TX_MAX_FIFO - 1) : remain_txdata;
    3618:	46bd                	li	a3,15
    361a:	00b6f363          	bgeu	a3,a1,3620 <wj_usi_usart_irqhandler+0x10e>
    361e:	45bd                	li	a1,15
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3620:	03800693          	li	a3,56
    3624:	02d406b3          	mul	a3,s0,a3
    3628:	4602                	lw	a2,0(sp)
        volatile uint32_t i = 0u;
    362a:	c802                	sw	zero,16(sp)
        for (i = 0; i < txdata_num; i++) {
    362c:	c802                	sw	zero,16(sp)
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    362e:	96b2                	add	a3,a3,a2
        for (i = 0; i < txdata_num; i++) {
    3630:	4642                	lw	a2,16(sp)
    3632:	00b66563          	bltu	a2,a1,363c <wj_usi_usart_irqhandler+0x12a>
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    3636:	4689                	li	a3,2
    3638:	d334                	sw	a3,96(a4)
    363a:	b7a1                	j	3582 <wj_usi_usart_irqhandler+0x70>
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    363c:	4e90                	lw	a2,24(a3)
    363e:	00064503          	lbu	a0,0(a2)
            usart_priv->tx_buf++;
    3642:	0605                	addi	a2,a2,1
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3644:	c708                	sw	a0,8(a4)
            usart_priv->tx_cnt++;
    3646:	5288                	lw	a0,32(a3)
            usart_priv->tx_buf++;
    3648:	ce90                	sw	a2,24(a3)
            usart_priv->tx_cnt++;
    364a:	0505                	addi	a0,a0,1
    364c:	d288                	sw	a0,32(a3)
        for (i = 0; i < txdata_num; i++) {
    364e:	4642                	lw	a2,16(sp)
    3650:	0605                	addi	a2,a2,1
    3652:	c832                	sw	a2,16(sp)
    3654:	bff1                	j	3630 <wj_usi_usart_irqhandler+0x11e>
    if (usart_priv->cb_event) {
    3656:	03800793          	li	a5,56
    365a:	02f407b3          	mul	a5,s0,a5
    365e:	4682                	lw	a3,0(sp)
    3660:	97b6                	add	a5,a5,a3
    3662:	4794                	lw	a3,8(a5)
    3664:	c691                	beqz	a3,3670 <wj_usi_usart_irqhandler+0x15e>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    3666:	5bc8                	lw	a0,52(a5)
    3668:	45b9                	li	a1,14
    366a:	c43a                	sw	a4,8(sp)
    366c:	9682                	jalr	a3
    366e:	bfa1                	j	35c6 <wj_usi_usart_irqhandler+0xb4>
        wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3670:	439c                	lw	a5,0(a5)
        addr->USI_EN &= ~USI_RX_FIFO_EN;
    3672:	4394                	lw	a3,0(a5)
    3674:	9add                	andi	a3,a3,-9
    3676:	c394                	sw	a3,0(a5)
        addr->USI_EN |= USI_RX_FIFO_EN;
    3678:	4394                	lw	a3,0(a5)
    367a:	0086e693          	ori	a3,a3,8
    367e:	c394                	sw	a3,0(a5)
    3680:	b7a1                	j	35c8 <wj_usi_usart_irqhandler+0xb6>

00003682 <drv_usi_usart_putchar>:
  \return      error code
*/
int32_t drv_usi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3682:	4118                	lw	a4,0(a0)
    //addr->USI_EN = 0xb;
    //addr->USI_EN = 0xf;
    addr->USI_TX_RX_FIFO = ch;
    3684:	c70c                	sw	a1,8(a4)

    while (!(addr->USI_FIFO_STA & 0x1));
    3686:	475c                	lw	a5,12(a4)
    3688:	8b85                	andi	a5,a5,1
    368a:	dff5                	beqz	a5,3686 <drv_usi_usart_putchar+0x4>

    return 0;
}
    368c:	4501                	li	a0,0
    368e:	8082                	ret

00003690 <drv_usi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event event call back function \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t drv_usi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    3690:	1111                	addi	sp,sp,-28
    3692:	c02e                	sw	a1,0(sp)
    //initialize instace
    uint32_t base;
    uint32_t irq;
    void *handler;

    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    3694:	0074                	addi	a3,sp,12
    3696:	0030                	addi	a2,sp,8
    3698:	004c                	addi	a1,sp,4
{
    369a:	c826                	sw	s1,16(sp)
    369c:	cc06                	sw	ra,24(sp)
    369e:	ca22                	sw	s0,20(sp)
    36a0:	84aa                	mv	s1,a0
    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    36a2:	2269                	jal	382c <target_usi_usart_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    36a4:	4709                	li	a4,2
    36a6:	00a77963          	bgeu	a4,a0,36b8 <drv_usi_usart_initialize+0x28>
        return NULL;
    36aa:	4401                	li	s0,0
    addr->USI_MODE_SEL = USI_MODE_UART;
    drv_irq_register(usart_priv->irq, handler);
    drv_irq_enable(usart_priv->irq);

    return usart_priv;
}
    36ac:	40e2                	lw	ra,24(sp)
    36ae:	8522                	mv	a0,s0
    36b0:	4452                	lw	s0,20(sp)
    36b2:	44c2                	lw	s1,16(sp)
    36b4:	0171                	addi	sp,sp,28
    36b6:	8082                	ret
    ret = drv_usi_initialize(idx);
    36b8:	8526                	mv	a0,s1
    36ba:	f50ff0ef          	jal	ra,2e0a <drv_usi_initialize>
    if (ret < 0) {
    36be:	fe0546e3          	bltz	a0,36aa <drv_usi_usart_initialize+0x1a>
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    36c2:	03800413          	li	s0,56
    36c6:	02848733          	mul	a4,s1,s0
    usart_priv->irq = irq;
    36ca:	47a2                	lw	a5,8(sp)
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    36cc:	20002437          	lui	s0,0x20002
    36d0:	8b440413          	addi	s0,s0,-1868 # 200018b4 <usi_usart_instance>
    usart_priv->base = base;
    36d4:	4512                	lw	a0,4(sp)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    36d6:	45c1                	li	a1,16
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    36d8:	943a                	add	s0,s0,a4
    usart_priv->irq = irq;
    36da:	c05c                	sw	a5,4(s0)
    usart_priv->cb_event = cb_event;
    36dc:	4782                	lw	a5,0(sp)
    usart_priv->base = base;
    36de:	c008                	sw	a0,0(s0)
    usart_priv->idx = idx;
    36e0:	d844                	sw	s1,52(s0)
    usart_priv->cb_event = cb_event;
    36e2:	c41c                	sw	a5,8(s0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    36e4:	6785                	lui	a5,0x1
    36e6:	f9878793          	addi	a5,a5,-104 # f98 <__divdf3+0xee>
    addr->USI_EN = 0x0;
    36ea:	00052023          	sw	zero,0(a0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    36ee:	cd7c                	sw	a5,92(a0)
    addr->USI_INTR_EN = WJ_UART_INT_ENABLE_DEFAUL;
    36f0:	c93c                	sw	a5,80(a0)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    36f2:	c02a                	sw	a0,0(sp)
    36f4:	e9cff0ef          	jal	ra,2d90 <wj_usi_set_rxfifo_th>
    addr->USI_MODE_SEL = USI_MODE_UART;
    36f8:	4502                	lw	a0,0(sp)
    drv_irq_register(usart_priv->irq, handler);
    36fa:	45b2                	lw	a1,12(sp)
    addr->USI_MODE_SEL = USI_MODE_UART;
    36fc:	00052223          	sw	zero,4(a0)
    drv_irq_register(usart_priv->irq, handler);
    3700:	4048                	lw	a0,4(s0)
    3702:	e7eff0ef          	jal	ra,2d80 <drv_irq_register>
    drv_irq_enable(usart_priv->irq);
    3706:	4048                	lw	a0,4(s0)
    3708:	e5cff0ef          	jal	ra,2d64 <drv_irq_enable>
    return usart_priv;
    370c:	b745                	j	36ac <drv_usi_usart_initialize+0x1c>

0000370e <drv_usi_usart_config>:
                             uint32_t baud,
                             usart_mode_e mode,
                             usart_parity_e parity,
                             usart_stop_bits_e stopbits,
                             usart_data_bits_e bits)
{
    370e:	1111                	addi	sp,sp,-28
    3710:	c826                	sw	s1,16(sp)
    int32_t ret;
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3712:	4104                	lw	s1,0(a0)
{
    3714:	ca22                	sw	s0,20(sp)
    3716:	cc06                	sw	ra,24(sp)

    addr->USI_EN = 0x0;
    3718:	0004a023          	sw	zero,0(s1)
{
    371c:	842a                	mv	s0,a0
    371e:	c032                	sw	a2,0(sp)
    3720:	c636                	sw	a3,12(sp)
    3722:	c23a                	sw	a4,4(sp)
    3724:	c43e                	sw	a5,8(sp)
    /* control the data_bit of the usart*/
    ret = drv_usi_usart_config_baudrate(handle, baud);
    3726:	31b1                	jal	3372 <drv_usi_usart_config_baudrate>

    if (ret < 0) {
    3728:	02054a63          	bltz	a0,375c <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control the parity of the usart*/
    ret = drv_usi_usart_config_parity(handle, parity);
    372c:	46b2                	lw	a3,12(sp)
    372e:	8522                	mv	a0,s0
    3730:	85b6                	mv	a1,a3
    3732:	316d                	jal	33dc <drv_usi_usart_config_parity>

    if (ret < 0) {
    3734:	02054463          	bltz	a0,375c <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control mode of the usart*/
    ret = drv_usi_usart_config_mode(handle, mode);
    3738:	4582                	lw	a1,0(sp)
    373a:	8522                	mv	a0,s0
    373c:	39ad                	jal	33b6 <drv_usi_usart_config_mode>

    if (ret < 0) {
    373e:	00054f63          	bltz	a0,375c <drv_usi_usart_config+0x4e>
        return ret;
    }

    /* control the stopbit of the usart*/
    ret = drv_usi_usart_config_stopbits(handle, stopbits);
    3742:	4592                	lw	a1,4(sp)
    3744:	8522                	mv	a0,s0
    3746:	39e5                	jal	343e <drv_usi_usart_config_stopbits>

    if (ret < 0) {
    3748:	00054a63          	bltz	a0,375c <drv_usi_usart_config+0x4e>
        return ret;
    }

    ret = drv_usi_usart_config_databits(handle, bits);
    374c:	45a2                	lw	a1,8(sp)
    374e:	8522                	mv	a0,s0
    3750:	33b9                	jal	349e <drv_usi_usart_config_databits>

    if (ret < 0) {
    3752:	00054563          	bltz	a0,375c <drv_usi_usart_config+0x4e>
        return ret;
    }

    addr->USI_EN = 0xf;
    3756:	47bd                	li	a5,15
    3758:	c09c                	sw	a5,0(s1)
    return 0;
    375a:	4501                	li	a0,0
}
    375c:	40e2                	lw	ra,24(sp)
    375e:	4452                	lw	s0,20(sp)
    3760:	44c2                	lw	s1,16(sp)
    3762:	0171                	addi	sp,sp,28
    3764:	8082                	ret

00003766 <csi_usart_putchar>:
  \param[in]   ch  the input character
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    return drv_usi_usart_putchar(handle, ch);
    3766:	bf31                	j	3682 <drv_usi_usart_putchar>

00003768 <csi_usart_initialize>:
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    return drv_usi_usart_initialize(idx, cb_event);
    3768:	b725                	j	3690 <drv_usi_usart_initialize>

0000376a <csi_usart_config>:
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    return drv_usi_usart_config(handle, baud, mode, parity, stopbits, bits);
    376a:	b755                	j	370e <drv_usi_usart_config>

0000376c <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_timer_count()) {
    376c:	47bd                	li	a5,15
    376e:	04a7c263          	blt	a5,a0,37b2 <target_get_timer+0x46>
        return -1;
    }

    if (base != NULL) {
    3772:	00058b63          	beqz	a1,3788 <target_get_timer+0x1c>
        *base = sg_timer_config[idx].base;
    3776:	47b1                	li	a5,12
    3778:	02f50733          	mul	a4,a0,a5
    377c:	6799                	lui	a5,0x6
    377e:	82878793          	addi	a5,a5,-2008 # 5828 <sg_timer_config>
    3782:	97ba                	add	a5,a5,a4
    3784:	439c                	lw	a5,0(a5)
    3786:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3788:	ca11                	beqz	a2,379c <target_get_timer+0x30>
        *irq = sg_timer_config[idx].irq;
    378a:	47b1                	li	a5,12
    378c:	02f50733          	mul	a4,a0,a5
    3790:	6799                	lui	a5,0x6
    3792:	82878793          	addi	a5,a5,-2008 # 5828 <sg_timer_config>
    3796:	97ba                	add	a5,a5,a4
    3798:	43dc                	lw	a5,4(a5)
    379a:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    379c:	ce81                	beqz	a3,37b4 <target_get_timer+0x48>
        *handler = sg_timer_config[idx].handler;
    379e:	47b1                	li	a5,12
    37a0:	02f50733          	mul	a4,a0,a5
    37a4:	6799                	lui	a5,0x6
    37a6:	82878793          	addi	a5,a5,-2008 # 5828 <sg_timer_config>
    37aa:	97ba                	add	a5,a5,a4
    37ac:	479c                	lw	a5,8(a5)
    37ae:	c29c                	sw	a5,0(a3)
    37b0:	8082                	ret
        return -1;
    37b2:	557d                	li	a0,-1
    }

    return idx;
}
    37b4:	8082                	ret

000037b6 <target_gpio_port_init>:
    int32_t    gpio_pin;
    uint32_t cfg_idx;
} gpio_pin_map_t;

int32_t target_gpio_port_init(port_name_e port, uint32_t *base, uint32_t *irq, void **handler, uint32_t *pin_num)
{
    37b6:	87aa                	mv	a5,a0
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
        return -1;
    37b8:	557d                	li	a0,-1
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
    37ba:	c595                	beqz	a1,37e6 <target_gpio_port_init+0x30>
    37bc:	02060563          	beqz	a2,37e6 <target_gpio_port_init+0x30>
    37c0:	02068363          	beqz	a3,37e6 <target_gpio_port_init+0x30>
    37c4:	02070163          	beqz	a4,37e6 <target_gpio_port_init+0x30>
    }

    if (sg_gpio_config[0].port == port) {
    37c8:	00079f63          	bnez	a5,37e6 <target_gpio_port_init+0x30>
        if (base != NULL) {
            *base = sg_gpio_config[0].base;
    37cc:	600187b7          	lui	a5,0x60018
    37d0:	c19c                	sw	a5,0(a1)
        }

        if (irq != NULL) {
            *irq = sg_gpio_config[0].irq;
    37d2:	47c1                	li	a5,16
    37d4:	c21c                	sw	a5,0(a2)
        }

        if (pin_num != NULL) {
            *pin_num = sg_gpio_config[0].pin_num;
    37d6:	47fd                	li	a5,31
    37d8:	c31c                	sw	a5,0(a4)
        }

        if (handler != NULL) {
            *handler = (void *)GPIO0_IRQHandler;
    37da:	6791                	lui	a5,0x4
    37dc:	c9478793          	addi	a5,a5,-876 # 3c94 <GPIO0_IRQHandler>
    37e0:	c29c                	sw	a5,0(a3)
        }

        return 0;
    37e2:	4501                	li	a0,0
    37e4:	8082                	ret
    }

    return -1;
}
    37e6:	8082                	ret

000037e8 <target_gpio_pin_init>:

int32_t target_gpio_pin_init(int32_t gpio_pin, uint32_t *port_idx)
{
    *port_idx = 0;
    37e8:	0005a023          	sw	zero,0(a1)

    if (gpio_pin >= PA0 && gpio_pin <= PA31) {
    37ec:	47fd                	li	a5,31
    37ee:	00a7f363          	bgeu	a5,a0,37f4 <target_gpio_pin_init+0xc>
        return gpio_pin;
    }

    return -1;
    37f2:	557d                	li	a0,-1
}
    37f4:	8082                	ret

000037f6 <target_usi_init>:
    {WJ_USI2_BASE, USI2_IRQn, USI2_IRQHandler},
};

int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_USI_NUM) {
    37f6:	4789                	li	a5,2
    37f8:	02a7c863          	blt	a5,a0,3828 <target_usi_init+0x32>
        return -1;
    }

    if (base != NULL) {
    37fc:	00058b63          	beqz	a1,3812 <target_usi_init+0x1c>
        *base = sg_usi_config[idx].base;
    3800:	47b1                	li	a5,12
    3802:	02f50733          	mul	a4,a0,a5
    3806:	6799                	lui	a5,0x6
    3808:	8e878793          	addi	a5,a5,-1816 # 58e8 <sg_usi_config>
    380c:	97ba                	add	a5,a5,a4
    380e:	439c                	lw	a5,0(a5)
    3810:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3812:	ce01                	beqz	a2,382a <target_usi_init+0x34>
        *irq = sg_usi_config[idx].irq;
    3814:	47b1                	li	a5,12
    3816:	02f50733          	mul	a4,a0,a5
    381a:	6799                	lui	a5,0x6
    381c:	8e878793          	addi	a5,a5,-1816 # 58e8 <sg_usi_config>
    3820:	97ba                	add	a5,a5,a4
    3822:	43dc                	lw	a5,4(a5)
    3824:	c21c                	sw	a5,0(a2)
    3826:	8082                	ret
        return -1;
    3828:	557d                	li	a0,-1
    }

    return idx;
}
    382a:	8082                	ret

0000382c <target_usi_usart_init>:

int32_t target_usi_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_SPI_NUM) {
    382c:	4789                	li	a5,2
    382e:	04a7c263          	blt	a5,a0,3872 <target_usi_usart_init+0x46>
        return -1;
    }

    if (base != NULL) {
    3832:	00058b63          	beqz	a1,3848 <target_usi_usart_init+0x1c>
        *base = sg_usi_config[idx].base;
    3836:	47b1                	li	a5,12
    3838:	02f50733          	mul	a4,a0,a5
    383c:	6799                	lui	a5,0x6
    383e:	8e878793          	addi	a5,a5,-1816 # 58e8 <sg_usi_config>
    3842:	97ba                	add	a5,a5,a4
    3844:	439c                	lw	a5,0(a5)
    3846:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3848:	ca11                	beqz	a2,385c <target_usi_usart_init+0x30>
        *irq = sg_usi_config[idx].irq;
    384a:	47b1                	li	a5,12
    384c:	02f50733          	mul	a4,a0,a5
    3850:	6799                	lui	a5,0x6
    3852:	8e878793          	addi	a5,a5,-1816 # 58e8 <sg_usi_config>
    3856:	97ba                	add	a5,a5,a4
    3858:	43dc                	lw	a5,4(a5)
    385a:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    385c:	ce81                	beqz	a3,3874 <target_usi_usart_init+0x48>
        *handler = sg_usi_config[idx].handler;
    385e:	47b1                	li	a5,12
    3860:	02f50733          	mul	a4,a0,a5
    3864:	6799                	lui	a5,0x6
    3866:	8e878793          	addi	a5,a5,-1816 # 58e8 <sg_usi_config>
    386a:	97ba                	add	a5,a5,a4
    386c:	479c                	lw	a5,8(a5)
    386e:	c29c                	sw	a5,0(a3)
    3870:	8082                	ret
        return -1;
    3872:	557d                	li	a0,-1
    }

    return idx;
}
    3874:	8082                	ret

00003876 <gpio_set_direction>:
    void *port,
    gpio_direction_e direction
)
{
    wj_oip_gpio_priv_t *gpio_priv = port;
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3876:	4118                	lw	a4,0(a0)

    if (direction == GPIO_DIRECTION_INPUT) {
    3878:	e989                	bnez	a1,388a <gpio_set_direction+0x14>
        gpio_reg->SWPORT_DDR &= (~gpio_priv->mask);
    387a:	495c                	lw	a5,20(a0)
    387c:	4354                	lw	a3,4(a4)
    387e:	fff7c793          	not	a5,a5
    3882:	8ff5                	and	a5,a5,a3
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    3884:	c35c                	sw	a5,4(a4)
    } else {
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    }

    return 0;
    3886:	4501                	li	a0,0
    3888:	8082                	ret
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
    388a:	4785                	li	a5,1
    388c:	00f59663          	bne	a1,a5,3898 <gpio_set_direction+0x22>
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    3890:	435c                	lw	a5,4(a4)
    3892:	4954                	lw	a3,20(a0)
    3894:	8fd5                	or	a5,a5,a3
    3896:	b7fd                	j	3884 <gpio_set_direction+0xe>
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    3898:	81010537          	lui	a0,0x81010
    389c:	08750513          	addi	a0,a0,135 # 81010087 <__heap_end+0x60fe0087>
}
    38a0:	8082                	ret

000038a2 <wj_oip_gpio_irqhandler>:
    gpio_control_reg->INTEN = val;
}

void wj_oip_gpio_irqhandler(int idx)
{
    if (idx >= CONFIG_GPIO_NUM) {
    38a2:	06a04e63          	bgtz	a0,391e <wj_oip_gpio_irqhandler+0x7c>
        return;
    }

    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    38a6:	46f1                	li	a3,28
    38a8:	02d50533          	mul	a0,a0,a3
    38ac:	20002737          	lui	a4,0x20002
    38b0:	95c70793          	addi	a5,a4,-1700 # 2000195c <gpio_handle>
{
    38b4:	1141                	addi	sp,sp,-16
    38b6:	c422                	sw	s0,8(sp)
    38b8:	20002437          	lui	s0,0x20002
    38bc:	c226                	sw	s1,4(sp)
    38be:	c606                	sw	ra,12(sp)
    38c0:	97840413          	addi	s0,s0,-1672 # 20001978 <gpio_pin_handle>

    uint32_t value = gpio_control_reg->INTSTATUS;
    38c4:	4481                	li	s1,0
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    38c6:	953e                	add	a0,a0,a5
    38c8:	411c                	lw	a5,0(a0)
    uint32_t value = gpio_control_reg->INTSTATUS;
    38ca:	95c70713          	addi	a4,a4,-1700
    38ce:	43b0                	lw	a2,64(a5)
    uint8_t i;

    /* find the interrput pin */
    for (i = 0; i < 32; i++) {
        if (value & (1U << i)) {
    38d0:	4685                	li	a3,1
    38d2:	009696b3          	sll	a3,a3,s1
    38d6:	00c6f7b3          	and	a5,a3,a2
    38da:	c79d                	beqz	a5,3908 <wj_oip_gpio_irqhandler+0x66>
                for (j = 0; j < idx; j++) {
                    pin_idx += gpio_handle[j].pin_num;
                }
            }

            if (pin_idx >= CONFIG_GPIO_PIN_NUM) {
    38dc:	47fd                	li	a5,31
    38de:	02f48b63          	beq	s1,a5,3914 <wj_oip_gpio_irqhandler+0x72>
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    38e2:	00044783          	lbu	a5,0(s0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    38e6:	45f1                	li	a1,28
    38e8:	02b787b3          	mul	a5,a5,a1
    38ec:	97ba                	add	a5,a5,a4
    38ee:	439c                	lw	a5,0(a5)
    gpio_control_reg->PORTA_EOI = idx;
    38f0:	c7f4                	sw	a3,76(a5)
            wj_oip_gpio_pin_priv_t *gpio_pin_priv = (wj_oip_gpio_pin_priv_t *)&gpio_pin_handle[pin_idx];

            gpio_irq_clear(gpio_pin_priv, (1 << i));  //clear the gpio interrupt

            /* execute the callback function */
            if ((gpio_event_cb_t)(gpio_pin_priv->cb)) {
    38f2:	405c                	lw	a5,4(s0)
    38f4:	cb91                	beqz	a5,3908 <wj_oip_gpio_irqhandler+0x66>
                ((gpio_event_cb_t)(gpio_pin_priv->cb))(gpio_pin_priv->offset);
    38f6:	00244503          	lbu	a0,2(s0)
    38fa:	c032                	sw	a2,0(sp)
    38fc:	9782                	jalr	a5
    38fe:	4602                	lw	a2,0(sp)
    3900:	200027b7          	lui	a5,0x20002
    3904:	95c78713          	addi	a4,a5,-1700 # 2000195c <gpio_handle>
    for (i = 0; i < 32; i++) {
    3908:	0485                	addi	s1,s1,1
    390a:	02000793          	li	a5,32
    390e:	0421                	addi	s0,s0,8
    3910:	fcf490e3          	bne	s1,a5,38d0 <wj_oip_gpio_irqhandler+0x2e>
            }
        }
    }
}
    3914:	40b2                	lw	ra,12(sp)
    3916:	4422                	lw	s0,8(sp)
    3918:	4492                	lw	s1,4(sp)
    391a:	0141                	addi	sp,sp,16
    391c:	8082                	ret
    391e:	8082                	ret

00003920 <csi_gpio_port_initialize>:
                3.get gpio_port_handle
  \param[in]   port      port_name.
  \return      gpio_port_handle
*/
gpio_port_handle_t csi_gpio_port_initialize(int32_t port)
{
    3920:	1111                	addi	sp,sp,-28
    /* obtain the gpio port information */
    uint32_t base = 0u;
    uint32_t pin_num;
    uint32_t irq;
    void *handler;
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    3922:	0058                	addi	a4,sp,4
    3924:	0074                	addi	a3,sp,12
    3926:	0030                	addi	a2,sp,8
    3928:	858a                	mv	a1,sp
{
    392a:	cc06                	sw	ra,24(sp)
    392c:	ca22                	sw	s0,20(sp)
    392e:	c826                	sw	s1,16(sp)
    uint32_t base = 0u;
    3930:	c002                	sw	zero,0(sp)
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    3932:	3551                	jal	37b6 <target_gpio_port_init>

    if (idx < 0 || idx >= CONFIG_GPIO_NUM) {
    3934:	e905                	bnez	a0,3964 <csi_gpio_port_initialize+0x44>
        return NULL;
    }

    gpio_priv = &gpio_handle[idx];

    gpio_priv->base = base;
    3936:	4782                	lw	a5,0(sp)
    3938:	20002437          	lui	s0,0x20002
    393c:	95c40493          	addi	s1,s0,-1700 # 2000195c <gpio_handle>
    gpio_priv->irq  = irq;
    3940:	4522                	lw	a0,8(sp)

#ifdef CONFIG_LPM
    csi_gpio_power_control(gpio_priv, DRV_POWER_FULL);
#endif

    drv_irq_register(gpio_priv->irq, handler);
    3942:	45b2                	lw	a1,12(sp)
    gpio_priv->base = base;
    3944:	c09c                	sw	a5,0(s1)
    gpio_priv->pin_num  = pin_num;
    3946:	4792                	lw	a5,4(sp)
    gpio_priv->irq  = irq;
    3948:	c0c8                	sw	a0,4(s1)
    gpio_priv->pin_num  = pin_num;
    394a:	c49c                	sw	a5,8(s1)
    drv_irq_register(gpio_priv->irq, handler);
    394c:	c34ff0ef          	jal	ra,2d80 <drv_irq_register>
    drv_irq_enable(gpio_priv->irq);
    3950:	40c8                	lw	a0,4(s1)
    3952:	c12ff0ef          	jal	ra,2d64 <drv_irq_enable>

    return (gpio_port_handle_t)gpio_priv;
    3956:	95c40513          	addi	a0,s0,-1700
}
    395a:	40e2                	lw	ra,24(sp)
    395c:	4452                	lw	s0,20(sp)
    395e:	44c2                	lw	s1,16(sp)
    3960:	0171                	addi	sp,sp,28
    3962:	8082                	ret
        return NULL;
    3964:	4501                	li	a0,0
    3966:	bfd5                	j	395a <csi_gpio_port_initialize+0x3a>

00003968 <csi_gpio_pin_initialize>:
  \return      gpio_pin_handle
*/
gpio_pin_handle_t csi_gpio_pin_initialize(int32_t gpio_pin, gpio_event_cb_t cb_event)
{

    if (gpio_pin < 0 || gpio_pin >= CONFIG_GPIO_PIN_NUM) {
    3968:	47f9                	li	a5,30
    396a:	00a7f463          	bgeu	a5,a0,3972 <csi_gpio_pin_initialize+0xa>
        return NULL;
    396e:	4501                	li	a0,0
    gpio_pin_priv->idx = pin_idx;
    gpio_pin_priv->cb = cb_event;
    gpio_pin_priv->offset = gpio_pin;

    return (gpio_pin_handle_t)gpio_pin_priv;
}
    3970:	8082                	ret
{
    3972:	1141                	addi	sp,sp,-16
    3974:	c422                	sw	s0,8(sp)
    3976:	842a                	mv	s0,a0
        csi_gpio_port_initialize(i);
    3978:	4501                	li	a0,0
{
    397a:	c606                	sw	ra,12(sp)
    397c:	c226                	sw	s1,4(sp)
    397e:	84ae                	mv	s1,a1
        csi_gpio_port_initialize(i);
    3980:	3745                	jal	3920 <csi_gpio_port_initialize>
    int32_t pin_idx = target_gpio_pin_init(gpio_pin, &port_idx);
    3982:	858a                	mv	a1,sp
    3984:	8522                	mv	a0,s0
    3986:	358d                	jal	37e8 <target_gpio_pin_init>
    3988:	872a                	mv	a4,a0
        return NULL;
    398a:	4501                	li	a0,0
    if (pin_idx < 0) {
    398c:	02074963          	bltz	a4,39be <csi_gpio_pin_initialize+0x56>
    for (i = 0; i < port_idx; i++) {
    3990:	4602                	lw	a2,0(sp)
    3992:	87ba                	mv	a5,a4
    3994:	c611                	beqz	a2,39a0 <csi_gpio_pin_initialize+0x38>
        idx += (gpio_handle[i].pin_num);
    3996:	200027b7          	lui	a5,0x20002
    399a:	9647a783          	lw	a5,-1692(a5) # 20001964 <gpio_handle+0x8>
    399e:	97ba                	add	a5,a5,a4
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = &(gpio_pin_handle[idx]);
    39a0:	00379693          	slli	a3,a5,0x3
    39a4:	200027b7          	lui	a5,0x20002
    39a8:	97878793          	addi	a5,a5,-1672 # 20001978 <gpio_pin_handle>
    39ac:	00d78533          	add	a0,a5,a3
    gpio_pin_priv->portidx = port_idx;
    39b0:	00c50023          	sb	a2,0(a0)
    gpio_pin_priv->idx = pin_idx;
    39b4:	00e500a3          	sb	a4,1(a0)
    gpio_pin_priv->cb = cb_event;
    39b8:	c144                	sw	s1,4(a0)
    gpio_pin_priv->offset = gpio_pin;
    39ba:	00850123          	sb	s0,2(a0)
}
    39be:	40b2                	lw	ra,12(sp)
    39c0:	4422                	lw	s0,8(sp)
    39c2:	4492                	lw	s1,4(sp)
    39c4:	0141                	addi	sp,sp,16
    39c6:	8082                	ret

000039c8 <csi_gpio_pin_config_mode>:
  \param[in]   mode      \ref gpio_mode_e
  \return      error code
*/
int32_t csi_gpio_pin_config_mode(gpio_pin_handle_t handle,
                                 gpio_mode_e mode)
{
    39c8:	862e                	mv	a2,a1
    GPIO_NULL_PARAM_CHK(handle);
    39ca:	c511                	beqz	a0,39d6 <csi_gpio_pin_config_mode+0xe>
    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    uint8_t offset = gpio_pin_priv->idx;

    int32_t ret = drv_pin_config_mode(gpio_pin_priv->portidx, offset, mode);
    39cc:	00154583          	lbu	a1,1(a0)
    39d0:	00054503          	lbu	a0,0(a0)
    39d4:	ae31                	j	3cf0 <drv_pin_config_mode>

    return ret;
}
    39d6:	81010537          	lui	a0,0x81010
    39da:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    39de:	8082                	ret

000039e0 <csi_gpio_pin_config_direction>:
  \param[in]   dir       \ref gpio_direction_e
  \return      error code
*/
int32_t csi_gpio_pin_config_direction(gpio_pin_handle_t handle,
                                      gpio_direction_e dir)
{
    39e0:	872a                	mv	a4,a0
    GPIO_NULL_PARAM_CHK(handle);
    39e2:	c11d                	beqz	a0,3a08 <csi_gpio_pin_config_direction+0x28>

    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *gpio_priv = &gpio_handle[gpio_pin_priv->portidx];
    39e4:	00054503          	lbu	a0,0(a0)

    gpio_priv->dir = dir;
    39e8:	47f1                	li	a5,28
    39ea:	02f50533          	mul	a0,a0,a5
    39ee:	200027b7          	lui	a5,0x20002
    39f2:	95c78793          	addi	a5,a5,-1700 # 2000195c <gpio_handle>
    39f6:	953e                	add	a0,a0,a5
    39f8:	c90c                	sw	a1,16(a0)
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    39fa:	00174703          	lbu	a4,1(a4)
    39fe:	4785                	li	a5,1
    3a00:	00e797b3          	sll	a5,a5,a4
    3a04:	c95c                	sw	a5,20(a0)

    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    3a06:	bd85                	j	3876 <gpio_set_direction>
    if (ret) {
        return ret;
    }

    return 0;
}
    3a08:	81010537          	lui	a0,0x81010
    3a0c:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    3a10:	8082                	ret

00003a12 <csi_gpio_pin_write>:
  \param[in]   value     the value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value)
{
    GPIO_NULL_PARAM_CHK(handle);
    3a12:	cd05                	beqz	a0,3a4a <csi_gpio_pin_write+0x38>

    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    3a14:	00054703          	lbu	a4,0(a0)

    uint8_t offset = gpio_pin_priv->idx;
    uint32_t port_value = value << offset;

    port_handle->value = port_value;
    3a18:	46f1                	li	a3,28
    uint32_t port_value = value << offset;
    3a1a:	00154603          	lbu	a2,1(a0)
    port_handle->value = port_value;
    3a1e:	02d706b3          	mul	a3,a4,a3
    3a22:	20002737          	lui	a4,0x20002
    3a26:	95c70713          	addi	a4,a4,-1700 # 2000195c <gpio_handle>
    uint32_t port_value = value << offset;
    3a2a:	00c595b3          	sll	a1,a1,a2
    gpio_write(port_handle, (1 << offset));
    3a2e:	4785                	li	a5,1
    3a30:	00c797b3          	sll	a5,a5,a2
    value &= ~(mask);
    3a34:	fff7c793          	not	a5,a5

    return 0;
    3a38:	4501                	li	a0,0
    port_handle->value = port_value;
    3a3a:	9736                	add	a4,a4,a3
    3a3c:	cf0c                	sw	a1,24(a4)
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3a3e:	4318                	lw	a4,0(a4)
    uint32_t value = gpio_reg->SWPORT_DR;
    3a40:	4314                	lw	a3,0(a4)
    value &= ~(mask);
    3a42:	8ff5                	and	a5,a5,a3
    value |= gpio_priv->value;
    3a44:	8ddd                	or	a1,a1,a5
    gpio_reg->SWPORT_DR = value;
    3a46:	c30c                	sw	a1,0(a4)
    return 0;
    3a48:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3a4a:	81010537          	lui	a0,0x81010
    3a4e:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>

}
    3a52:	8082                	ret

00003a54 <wj_oip_timer_irqhandler>:
}

void wj_oip_timer_irqhandler(int idx)
{
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->timeout_flag = 1;
    3a54:	47e1                	li	a5,24
    3a56:	02f50733          	mul	a4,a0,a5
    3a5a:	200027b7          	lui	a5,0x20002
    3a5e:	a7078793          	addi	a5,a5,-1424 # 20001a70 <timer_instance>
    3a62:	97ba                	add	a5,a5,a4
    3a64:	4705                	li	a4,1
    3a66:	cbd8                	sw	a4,20(a5)

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3a68:	43d8                	lw	a4,4(a5)

    addr->TxEOI;

    if (timer_priv->cb_event) {
    3a6a:	47dc                	lw	a5,12(a5)
    addr->TxEOI;
    3a6c:	4758                	lw	a4,12(a4)
    if (timer_priv->cb_event) {
    3a6e:	c399                	beqz	a5,3a74 <wj_oip_timer_irqhandler+0x20>
        return timer_priv->cb_event(idx, TIMER_EVENT_TIMEOUT);
    3a70:	4581                	li	a1,0
    3a72:	8782                	jr	a5
    }

}
    3a74:	8082                	ret

00003a76 <csi_timer_initialize>:
  \param[in]   idx  instance timer index
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    3a76:	1111                	addi	sp,sp,-28
    3a78:	cc06                	sw	ra,24(sp)
    3a7a:	ca22                	sw	s0,20(sp)
    3a7c:	c826                	sw	s1,16(sp)
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    3a7e:	47bd                	li	a5,15
    3a80:	00a7f963          	bgeu	a5,a0,3a92 <csi_timer_initialize+0x1c>
        return NULL;
    3a84:	4401                	li	s0,0
        drv_irq_register(timer_priv->irq, handler);
        drv_irq_enable(timer_priv->irq);
    }

    return (timer_handle_t)timer_priv;
}
    3a86:	40e2                	lw	ra,24(sp)
    3a88:	8522                	mv	a0,s0
    3a8a:	4452                	lw	s0,20(sp)
    3a8c:	44c2                	lw	s1,16(sp)
    3a8e:	0171                	addi	sp,sp,28
    3a90:	8082                	ret
    3a92:	84ae                	mv	s1,a1
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    3a94:	0074                	addi	a3,sp,12
    3a96:	0030                	addi	a2,sp,8
    3a98:	004c                	addi	a1,sp,4
    3a9a:	c02a                	sw	a0,0(sp)
    uint32_t base = 0u;
    3a9c:	c202                	sw	zero,4(sp)
    uint32_t irq = 0u;
    3a9e:	c402                	sw	zero,8(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    3aa0:	31f1                	jal	376c <target_get_timer>
    if (real_idx != idx) {
    3aa2:	4702                	lw	a4,0(sp)
    3aa4:	fea710e3          	bne	a4,a0,3a84 <csi_timer_initialize+0xe>
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    3aa8:	4461                	li	s0,24
    3aaa:	028707b3          	mul	a5,a4,s0
    3aae:	20002437          	lui	s0,0x20002
    3ab2:	a7040413          	addi	s0,s0,-1424 # 20001a70 <timer_instance>
    timer_priv->irq  = irq;
    3ab6:	46a2                	lw	a3,8(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ab8:	4501                	li	a0,0
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    3aba:	943e                	add	s0,s0,a5
    timer_priv->base = base;
    3abc:	4792                	lw	a5,4(sp)
    timer_priv->irq  = irq;
    3abe:	c414                	sw	a3,8(s0)
    timer_priv->idx = idx;
    3ac0:	00e40023          	sb	a4,0(s0)
    timer_priv->base = base;
    3ac4:	c05c                	sw	a5,4(s0)
    3ac6:	c03e                	sw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ac8:	2c25                	jal	3d00 <drv_get_timer_freq>
    3aca:	577d                	li	a4,-1
    3acc:	02a75733          	divu	a4,a4,a0
    3ad0:	000f4537          	lui	a0,0xf4
    3ad4:	24050513          	addi	a0,a0,576 # f4240 <__ctor_end__+0xedfa0>
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3ad8:	4782                	lw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ada:	02a70733          	mul	a4,a4,a0
    3ade:	c818                	sw	a4,16(s0)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3ae0:	4798                	lw	a4,8(a5)
    3ae2:	01e77693          	andi	a3,a4,30
    3ae6:	0087c703          	lbu	a4,8(a5)
    3aea:	9b01                	andi	a4,a4,-32
    3aec:	8f55                	or	a4,a4,a3
    3aee:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_INTMASK;
    3af2:	4798                	lw	a4,8(a5)
    3af4:	8b7d                	andi	a4,a4,31
    3af6:	00476693          	ori	a3,a4,4
    3afa:	0087c703          	lbu	a4,8(a5)
    3afe:	9b01                	andi	a4,a4,-32
    3b00:	8f55                	or	a4,a4,a3
    3b02:	00e78423          	sb	a4,8(a5)
    timer_priv->cb_event = cb_event;
    3b06:	c444                	sw	s1,12(s0)
    if (cb_event != NULL) {
    3b08:	dcbd                	beqz	s1,3a86 <csi_timer_initialize+0x10>
        drv_irq_register(timer_priv->irq, handler);
    3b0a:	4408                	lw	a0,8(s0)
    3b0c:	45b2                	lw	a1,12(sp)
    3b0e:	a72ff0ef          	jal	ra,2d80 <drv_irq_register>
        drv_irq_enable(timer_priv->irq);
    3b12:	4408                	lw	a0,8(s0)
    3b14:	a50ff0ef          	jal	ra,2d64 <drv_irq_enable>
    3b18:	b7bd                	j	3a86 <csi_timer_initialize+0x10>

00003b1a <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b1a:	c511                	beqz	a0,3b26 <csi_timer_config+0xc>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3b1c:	415c                	lw	a5,4(a0)

    switch (mode) {
    3b1e:	c989                	beqz	a1,3b30 <csi_timer_config+0x16>
    3b20:	4705                	li	a4,1
    3b22:	02e58c63          	beq	a1,a4,3b5a <csi_timer_config+0x40>
    TIMER_NULL_PARAM_CHK(handle);
    3b26:	81070537          	lui	a0,0x81070
    3b2a:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
    }

    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);

    return 0;
}
    3b2e:	8082                	ret
            addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_MODE;
    3b30:	4798                	lw	a4,8(a5)
    3b32:	01d77693          	andi	a3,a4,29
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b36:	0087c703          	lbu	a4,8(a5)
    return 0;
    3b3a:	4501                	li	a0,0
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b3c:	9b01                	andi	a4,a4,-32
    3b3e:	8f55                	or	a4,a4,a3
    3b40:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);
    3b44:	4798                	lw	a4,8(a5)
    3b46:	8b7d                	andi	a4,a4,31
    3b48:	01076693          	ori	a3,a4,16
    3b4c:	0087c703          	lbu	a4,8(a5)
    3b50:	9b01                	andi	a4,a4,-32
    3b52:	8f55                	or	a4,a4,a3
    3b54:	00e78423          	sb	a4,8(a5)
    return 0;
    3b58:	8082                	ret
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b5a:	4798                	lw	a4,8(a5)
    3b5c:	8b7d                	andi	a4,a4,31
    3b5e:	00276693          	ori	a3,a4,2
    3b62:	bfd1                	j	3b36 <csi_timer_config+0x1c>

00003b64 <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b64:	c501                	beqz	a0,3b6c <csi_timer_set_timeout+0x8>

    wj_oip_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
    3b66:	c90c                	sw	a1,16(a0)
    return 0;
    3b68:	4501                	li	a0,0
    3b6a:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3b6c:	81070537          	lui	a0,0x81070
    3b70:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3b74:	8082                	ret

00003b76 <csi_timer_start>:
  \return      error code
*/

int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b76:	c545                	beqz	a0,3c1e <csi_timer_start+0xa8>
{
    3b78:	1141                	addi	sp,sp,-16
    3b7a:	c606                	sw	ra,12(sp)
    3b7c:	c422                	sw	s0,8(sp)
    3b7e:	c226                	sw	s1,4(sp)
    3b80:	842a                	mv	s0,a0

    wj_oip_timer_priv_t *timer_priv = handle;

    timer_priv->timeout_flag = 0;
    3b82:	00052a23          	sw	zero,20(a0)

    uint32_t min_us = drv_get_timer_freq(timer_priv->idx) / 1000000;
    3b86:	00054503          	lbu	a0,0(a0)
    3b8a:	000f44b7          	lui	s1,0xf4
    3b8e:	24048493          	addi	s1,s1,576 # f4240 <__ctor_end__+0xedfa0>
    3b92:	22bd                	jal	3d00 <drv_get_timer_freq>
    3b94:	029544b3          	div	s1,a0,s1
    uint32_t load;

    if (((timer_priv->timeout * drv_get_timer_freq(timer_priv->idx)) / 1000000) > 0xffffffff) {
    3b98:	00044503          	lbu	a0,0(s0)
    3b9c:	2295                	jal	3d00 <drv_get_timer_freq>
        return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    if (min_us) {
    3b9e:	481c                	lw	a5,16(s0)
        load = (uint32_t)(timer_priv->timeout * min_us);
    3ba0:	02f48533          	mul	a0,s1,a5
    if (min_us) {
    3ba4:	e08d                	bnez	s1,3bc6 <csi_timer_start+0x50>
    } else {
        load = (uint32_t)(((uint64_t)(timer_priv->timeout) * drv_get_timer_freq(timer_priv->idx)) / 1000000);
    3ba6:	00044503          	lbu	a0,0(s0)
    3baa:	c03e                	sw	a5,0(sp)
    3bac:	2a91                	jal	3d00 <drv_get_timer_freq>
    3bae:	4782                	lw	a5,0(sp)
    3bb0:	000f4637          	lui	a2,0xf4
    3bb4:	24060613          	addi	a2,a2,576 # f4240 <__ctor_end__+0xedfa0>
    3bb8:	4681                	li	a3,0
    3bba:	02f525b3          	mulhsu	a1,a0,a5
    3bbe:	02a78533          	mul	a0,a5,a0
    3bc2:	e34fc0ef          	jal	ra,1f6 <__udivdi3>
    }

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);

    if (timer_priv->timeout == 0) {
    3bc6:	4818                	lw	a4,16(s0)
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3bc8:	405c                	lw	a5,4(s0)
    if (timer_priv->timeout == 0) {
    3bca:	e729                	bnez	a4,3c14 <csi_timer_start+0x9e>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    3bcc:	577d                	li	a4,-1
    3bce:	c398                	sw	a4,0(a5)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bd0:	4798                	lw	a4,8(a5)
    }

#endif

    return 0;
}
    3bd2:	40b2                	lw	ra,12(sp)
    3bd4:	4422                	lw	s0,8(sp)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bd6:	01e77693          	andi	a3,a4,30
    3bda:	0087c703          	lbu	a4,8(a5)
}
    3bde:	4492                	lw	s1,4(sp)
    return 0;
    3be0:	4501                	li	a0,0
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3be2:	9b01                	andi	a4,a4,-32
    3be4:	8f55                	or	a4,a4,a3
    3be6:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    3bea:	4798                	lw	a4,8(a5)
    3bec:	8b7d                	andi	a4,a4,31
    3bee:	00176693          	ori	a3,a4,1
    3bf2:	0087c703          	lbu	a4,8(a5)
    3bf6:	9b01                	andi	a4,a4,-32
    3bf8:	8f55                	or	a4,a4,a3
    3bfa:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    3bfe:	4798                	lw	a4,8(a5)
    3c00:	01b77693          	andi	a3,a4,27
    3c04:	0087c703          	lbu	a4,8(a5)
    3c08:	9b01                	andi	a4,a4,-32
    3c0a:	8f55                	or	a4,a4,a3
    3c0c:	00e78423          	sb	a4,8(a5)
}
    3c10:	0141                	addi	sp,sp,16
    3c12:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    3c14:	4798                	lw	a4,8(a5)
    3c16:	8b75                	andi	a4,a4,29
    3c18:	db55                	beqz	a4,3bcc <csi_timer_start+0x56>
            addr->TxLoadCount = load;                           /* load time(us) */
    3c1a:	c388                	sw	a0,0(a5)
    3c1c:	bf55                	j	3bd0 <csi_timer_start+0x5a>
    TIMER_NULL_PARAM_CHK(handle);
    3c1e:	81070537          	lui	a0,0x81070
    3c22:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3c26:	8082                	ret

00003c28 <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    3c28:	c901                	beqz	a0,3c38 <csi_timer_get_current_value+0x10>
    TIMER_NULL_PARAM_CHK(value);
    3c2a:	00058763          	beqz	a1,3c38 <csi_timer_get_current_value+0x10>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3c2e:	415c                	lw	a5,4(a0)

    *value = addr->TxCurrentValue;
    return 0;
    3c30:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    3c32:	43dc                	lw	a5,4(a5)
    3c34:	c19c                	sw	a5,0(a1)
    return 0;
    3c36:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3c38:	81070537          	lui	a0,0x81070
    3c3c:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3c40:	8082                	ret

00003c42 <TIM0_IRQHandler>:
}

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(0);
    3c42:	4501                	li	a0,0
    3c44:	bd01                	j	3a54 <wj_oip_timer_irqhandler>

00003c46 <TIM1_IRQHandler>:
}

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(1);
    3c46:	4505                	li	a0,1
    3c48:	b531                	j	3a54 <wj_oip_timer_irqhandler>

00003c4a <TIM2_IRQHandler>:
    CSI_INTRPT_EXIT();
}
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(2);
    3c4a:	4509                	li	a0,2
    3c4c:	b521                	j	3a54 <wj_oip_timer_irqhandler>

00003c4e <TIM3_IRQHandler>:
}

ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(3);
    3c4e:	450d                	li	a0,3
    3c50:	b511                	j	3a54 <wj_oip_timer_irqhandler>

00003c52 <TIM4_IRQHandler>:
}

ATTRIBUTE_ISR void TIM4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(4);
    3c52:	4511                	li	a0,4
    3c54:	b501                	j	3a54 <wj_oip_timer_irqhandler>

00003c56 <TIM5_IRQHandler>:
}

ATTRIBUTE_ISR void TIM5_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(5);
    3c56:	4515                	li	a0,5
    3c58:	bbf5                	j	3a54 <wj_oip_timer_irqhandler>

00003c5a <TIM6_IRQHandler>:
}

ATTRIBUTE_ISR void TIM6_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(6);
    3c5a:	4519                	li	a0,6
    3c5c:	bbe5                	j	3a54 <wj_oip_timer_irqhandler>

00003c5e <TIM7_IRQHandler>:
}

ATTRIBUTE_ISR void TIM7_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(7);
    3c5e:	451d                	li	a0,7
    3c60:	bbd5                	j	3a54 <wj_oip_timer_irqhandler>

00003c62 <TIM8_IRQHandler>:
}

ATTRIBUTE_ISR void TIM8_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(8);
    3c62:	4521                	li	a0,8
    3c64:	bbc5                	j	3a54 <wj_oip_timer_irqhandler>

00003c66 <TIM9_IRQHandler>:
}

ATTRIBUTE_ISR void TIM9_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(9);
    3c66:	4525                	li	a0,9
    3c68:	b3f5                	j	3a54 <wj_oip_timer_irqhandler>

00003c6a <TIM10_IRQHandler>:
}

ATTRIBUTE_ISR void TIM10_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(10);
    3c6a:	4529                	li	a0,10
    3c6c:	b3e5                	j	3a54 <wj_oip_timer_irqhandler>

00003c6e <TIM11_IRQHandler>:
}

ATTRIBUTE_ISR void TIM11_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(11);
    3c6e:	452d                	li	a0,11
    3c70:	b3d5                	j	3a54 <wj_oip_timer_irqhandler>

00003c72 <TIM12_IRQHandler>:
}

ATTRIBUTE_ISR void TIM12_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(12);
    3c72:	4531                	li	a0,12
    3c74:	b3c5                	j	3a54 <wj_oip_timer_irqhandler>

00003c76 <TIM13_IRQHandler>:
}

ATTRIBUTE_ISR void TIM13_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(13);
    3c76:	4535                	li	a0,13
    3c78:	bbf1                	j	3a54 <wj_oip_timer_irqhandler>

00003c7a <TIM14_IRQHandler>:
}

ATTRIBUTE_ISR void TIM14_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(14);
    3c7a:	4539                	li	a0,14
    3c7c:	bbe1                	j	3a54 <wj_oip_timer_irqhandler>

00003c7e <TIM15_IRQHandler>:
}

ATTRIBUTE_ISR void TIM15_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(15);
    3c7e:	453d                	li	a0,15
    3c80:	bbd1                	j	3a54 <wj_oip_timer_irqhandler>

00003c82 <USI0_IRQHandler>:
}

ATTRIBUTE_ISR void USI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(0);
    3c82:	4501                	li	a0,0
    3c84:	95aff06f          	j	2dde <wj_usi_irqhandler>

00003c88 <USI1_IRQHandler>:
}

ATTRIBUTE_ISR void USI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(1);
    3c88:	4505                	li	a0,1
    3c8a:	954ff06f          	j	2dde <wj_usi_irqhandler>

00003c8e <USI2_IRQHandler>:
}

ATTRIBUTE_ISR void USI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(2);
    3c8e:	4509                	li	a0,2
    3c90:	94eff06f          	j	2dde <wj_usi_irqhandler>

00003c94 <GPIO0_IRQHandler>:
}

ATTRIBUTE_ISR void GPIO0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_gpio_irqhandler(0);
    3c94:	4501                	li	a0,0
    3c96:	b131                	j	38a2 <wj_oip_gpio_irqhandler>

00003c98 <mdelay>:
    }
}

void mdelay(uint32_t ms)
{
    if (ms == 0) {
    3c98:	04050b63          	beqz	a0,3cee <mdelay+0x56>
{
    3c9c:	1141                	addi	sp,sp,-16
    3c9e:	c422                	sw	s0,8(sp)
    3ca0:	c606                	sw	ra,12(sp)
    3ca2:	c226                	sw	s1,4(sp)
    3ca4:	fff50413          	addi	s0,a0,-1
  \brief   get CORE timer reload value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_load(void)
{
    return CORET->LOAD;
    3ca8:	e000e6b7          	lui	a3,0xe000e
    3cac:	4ac4                	lw	s1,20(a3)
  \brief   get CORE timer counter value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_value(void)
{
    return CORET->VAL;
    3cae:	4e98                	lw	a4,24(a3)
    3cb0:	c03a                	sw	a4,0(sp)
    uint32_t cnt = (drv_get_sys_freq() / 1000);
    3cb2:	20a1                	jal	3cfa <drv_get_sys_freq>
    3cb4:	3e800793          	li	a5,1000
    3cb8:	02f54533          	div	a0,a0,a5
            if (load - cur + start > cnt) {
    3cbc:	4702                	lw	a4,0(sp)
    3cbe:	e000e6b7          	lui	a3,0xe000e
    3cc2:	94ba                	add	s1,s1,a4
    3cc4:	4e9c                	lw	a5,24(a3)
        if (start > cur) {
    3cc6:	00e7ff63          	bgeu	a5,a4,3ce4 <mdelay+0x4c>
            if (start - cur >= cnt) {
    3cca:	40f707b3          	sub	a5,a4,a5
    3cce:	fea7ebe3          	bltu	a5,a0,3cc4 <mdelay+0x2c>
    3cd2:	147d                	addi	s0,s0,-1
        return;
    }

    while (ms--) {
    3cd4:	57fd                	li	a5,-1
    3cd6:	fcf41be3          	bne	s0,a5,3cac <mdelay+0x14>
        _mdelay();
    }
}
    3cda:	40b2                	lw	ra,12(sp)
    3cdc:	4422                	lw	s0,8(sp)
    3cde:	4492                	lw	s1,4(sp)
    3ce0:	0141                	addi	sp,sp,16
    3ce2:	8082                	ret
            if (load - cur + start > cnt) {
    3ce4:	40f487b3          	sub	a5,s1,a5
    3ce8:	fcf57ee3          	bgeu	a0,a5,3cc4 <mdelay+0x2c>
    3cec:	b7dd                	j	3cd2 <mdelay+0x3a>
    3cee:	8082                	ret

00003cf0 <drv_pin_config_mode>:
}

int32_t drv_pin_config_mode(port_name_e port, uint8_t offset, gpio_mode_e pin_mode)
{
    return 0;
}
    3cf0:	4501                	li	a0,0
    3cf2:	8082                	ret

00003cf4 <drv_get_usi_freq>:
    3cf4:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3cf8:	8082                	ret

00003cfa <drv_get_sys_freq>:
}

int32_t drv_get_sys_freq(void)
{
    return g_system_clock;
}
    3cfa:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3cfe:	8082                	ret

00003d00 <drv_get_timer_freq>:
    3d00:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3d04:	8082                	ret

00003d06 <SystemInit>:
  */
void SystemInit(void)
{
    int i;

    CLIC->CLICCFG = 0x4UL;
    3d06:	e000e737          	lui	a4,0xe000e
{
    3d0a:	1151                	addi	sp,sp,-12
    CLIC->CLICCFG = 0x4UL;
    3d0c:	10070713          	addi	a4,a4,256 # e000e100 <__heap_end+0xbffde100>
{
    3d10:	c222                	sw	s0,4(sp)
    CLIC->CLICCFG = 0x4UL;
    3d12:	7ff70793          	addi	a5,a4,2047
    3d16:	4691                	li	a3,4
{
    3d18:	c406                	sw	ra,8(sp)
    CLIC->CLICCFG = 0x4UL;
    3d1a:	30d780a3          	sb	a3,769(a5)

    for (i = 0; i < 12; i++) {
        CLIC->INTIP[i] = 0;
    3d1e:	e000e437          	lui	s0,0xe000e
    for (i = 0; i < 12; i++) {
    3d22:	4781                	li	a5,0
    3d24:	46b1                	li	a3,12
        CLIC->INTIP[i] = 0;
    3d26:	00f70633          	add	a2,a4,a5
    3d2a:	00060023          	sb	zero,0(a2)
    for (i = 0; i < 12; i++) {
    3d2e:	0785                	addi	a5,a5,1
    3d30:	fed79be3          	bne	a5,a3,3d26 <SystemInit+0x20>
    }

    drv_irq_enable(Machine_Software_IRQn);
    3d34:	450d                	li	a0,3
    3d36:	82eff0ef          	jal	ra,2d64 <drv_irq_enable>
  \details Enables IRQ interrupts by setting the IE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_irq(void)
{
    __ASM volatile("csrs mstatus, 8");
    3d3a:	30046073          	csrsi	mstatus,8
    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    3d3e:	3f75                	jal	3cfa <drv_get_sys_freq>
    3d40:	06400793          	li	a5,100
    3d44:	02f54533          	div	a0,a0,a5
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
    3d48:	010007b7          	lui	a5,0x1000
    3d4c:	157d                	addi	a0,a0,-1
    3d4e:	00f57763          	bgeu	a0,a5,3d5c <SystemInit+0x56>
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
    3d52:	c848                	sw	a0,20(s0)
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    3d54:	00042c23          	sw	zero,24(s0) # e000e018 <__heap_end+0xbffde018>
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
    3d58:	479d                	li	a5,7
    3d5a:	c81c                	sw	a5,16(s0)
#ifdef CONFIG_KERNEL_NONE
    _system_init_for_baremetal();
#else
    _system_init_for_kernel();
#endif
}
    3d5c:	4412                	lw	s0,4(sp)
    3d5e:	40a2                	lw	ra,8(sp)
    3d60:	0131                	addi	sp,sp,12
    mm_heap_initialize();
    3d62:	a469                	j	3fec <mm_heap_initialize>

00003d64 <trap_c>:
#include <csi_core.h>

void (*trap_c_callback)(void);

void trap_c(uint32_t *regs)
{
    3d64:	1131                	addi	sp,sp,-20
    3d66:	c622                	sw	s0,12(sp)
    3d68:	c806                	sw	ra,16(sp)
    3d6a:	c426                	sw	s1,8(sp)
    3d6c:	842a                	mv	s0,a0
 */
__ALWAYS_STATIC_INLINE uint32_t __get_MCAUSE(void)
{
    uint32_t result;

    __ASM volatile("csrr %0, mcause" : "=r"(result));
    3d6e:	342025f3          	csrr	a1,mcause
    int i;
    uint32_t vec = 0;

    vec = __get_MCAUSE() & 0x3FF;

    printf("CPU Exception: NO.%d", vec);
    3d72:	6519                	lui	a0,0x6
    3d74:	3ff5f593          	andi	a1,a1,1023
    3d78:	90c50513          	addi	a0,a0,-1780 # 590c <sg_usi_config+0x24>
    3d7c:	43f000ef          	jal	ra,49ba <printf>
    printf("\n");
    3d80:	4529                	li	a0,10
    3d82:	54f000ef          	jal	ra,4ad0 <putchar>

    for (i = 0; i < 15; i++) {
    3d86:	87a2                	mv	a5,s0
    3d88:	4481                	li	s1,0
        printf("x%d: %08x\t", i + 1, regs[i]);
    3d8a:	4390                	lw	a2,0(a5)
    3d8c:	c226                	sw	s1,4(sp)
    3d8e:	c03e                	sw	a5,0(sp)
    3d90:	0485                	addi	s1,s1,1
    3d92:	6799                	lui	a5,0x6
    3d94:	92478513          	addi	a0,a5,-1756 # 5924 <sg_usi_config+0x3c>
    3d98:	85a6                	mv	a1,s1
    3d9a:	421000ef          	jal	ra,49ba <printf>

        if ((i % 4) == 3) {
    3d9e:	4712                	lw	a4,4(sp)
    3da0:	468d                	li	a3,3
    3da2:	4782                	lw	a5,0(sp)
    3da4:	8b0d                	andi	a4,a4,3
    3da6:	00d71663          	bne	a4,a3,3db2 <trap_c+0x4e>
            printf("\n");
    3daa:	4529                	li	a0,10
    3dac:	525000ef          	jal	ra,4ad0 <putchar>
    3db0:	4782                	lw	a5,0(sp)
    for (i = 0; i < 15; i++) {
    3db2:	473d                	li	a4,15
    3db4:	0791                	addi	a5,a5,4
    3db6:	fce49ae3          	bne	s1,a4,3d8a <trap_c+0x26>
        }
    }

    printf("\n");
    3dba:	4529                	li	a0,10
    3dbc:	515000ef          	jal	ra,4ad0 <putchar>
    printf("mepc   : %08x\n", regs[15]);
    3dc0:	5c4c                	lw	a1,60(s0)
    3dc2:	6519                	lui	a0,0x6
    3dc4:	93050513          	addi	a0,a0,-1744 # 5930 <sg_usi_config+0x48>
    3dc8:	3f3000ef          	jal	ra,49ba <printf>
    printf("mstatus: %08x\n", regs[16]);
    3dcc:	402c                	lw	a1,64(s0)
    3dce:	6519                	lui	a0,0x6
    3dd0:	94050513          	addi	a0,a0,-1728 # 5940 <sg_usi_config+0x58>
    3dd4:	3e7000ef          	jal	ra,49ba <printf>

    if (trap_c_callback) {
    3dd8:	0101a783          	lw	a5,16(gp) # 200004f8 <trap_c_callback>
    3ddc:	c391                	beqz	a5,3de0 <trap_c+0x7c>
        trap_c_callback();
    3dde:	9782                	jalr	a5
    }

    while (1);
    3de0:	a001                	j	3de0 <trap_c+0x7c>

00003de2 <timer_cb_fun>:
static unsigned int Timer_LoopCount;    /* Count unit is 10 seconds */
static uint8_t timer_count_rise = 0;    /*1: timer cont increasing, 0: timer cont diminishing*/

static void timer_cb_fun(int32_t idx, timer_event_e event)
{
    if (TIMER_EVENT_TIMEOUT == event) {
    3de2:	00059763          	bnez	a1,3df0 <timer_cb_fun+0xe>
        Timer_LoopCount++;
    3de6:	01c18793          	addi	a5,gp,28 # 20000504 <Timer_LoopCount>
    3dea:	4398                	lw	a4,0(a5)
    3dec:	0705                	addi	a4,a4,1
    3dee:	c398                	sw	a4,0(a5)
    }
}
    3df0:	8082                	ret

00003df2 <clock_timer_init>:

    return (unsigned long long)(Timer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv - 1;
}

int clock_timer_init(void)
{
    3df2:	1131                	addi	sp,sp,-20
    if (CLOCK_GETTIME_USE_TIMER_ID > CONFIG_TIMER_NUM) {
        return EPERM;
    }

    uint32_t timer_loadtimer;
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3df4:	6591                	lui	a1,0x4
{
    3df6:	c622                	sw	s0,12(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3df8:	de258593          	addi	a1,a1,-542 # 3de2 <timer_cb_fun>
    3dfc:	4501                	li	a0,0
{
    3dfe:	c806                	sw	ra,16(sp)
    3e00:	c426                	sw	s1,8(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3e02:	02418413          	addi	s0,gp,36 # 2000050c <timer_handle>
    3e06:	3985                	jal	3a76 <csi_timer_initialize>
    3e08:	c008                	sw	a0,0(s0)

    if (timer_handle == NULL) {
    3e0a:	e901                	bnez	a0,3e1a <clock_timer_init+0x28>
        return -1;
    3e0c:	54fd                	li	s1,-1
    if (cv2 > cv1) {
        timer_count_rise = 1;
    }

    return 0;
}
    3e0e:	40c2                	lw	ra,16(sp)
    3e10:	4432                	lw	s0,12(sp)
    3e12:	8526                	mv	a0,s1
    3e14:	44a2                	lw	s1,8(sp)
    3e16:	0151                	addi	sp,sp,20
    3e18:	8082                	ret
    APB_FREQ = drv_get_timer_freq(CLOCK_GETTIME_USE_TIMER_ID);
    3e1a:	4501                	li	a0,0
    3e1c:	35d5                	jal	3d00 <drv_get_timer_freq>
    3e1e:	00a1aa23          	sw	a0,20(gp) # 200004fc <APB_FREQ>
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e22:	000f47b7          	lui	a5,0xf4
    3e26:	24078793          	addi	a5,a5,576 # f4240 <__ctor_end__+0xedfa0>
    3e2a:	02f55533          	divu	a0,a0,a5
    3e2e:	009894b7          	lui	s1,0x989
    3e32:	68048493          	addi	s1,s1,1664 # 989680 <__ctor_end__+0x9833e0>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3e36:	4585                	li	a1,1
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e38:	02950533          	mul	a0,a0,s1
    3e3c:	00a1ac23          	sw	a0,24(gp) # 20000500 <TIMER_LOADCOUNT>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3e40:	4008                	lw	a0,0(s0)
    3e42:	39e1                	jal	3b1a <csi_timer_config>
    if (ret != 0) {
    3e44:	f561                	bnez	a0,3e0c <clock_timer_init+0x1a>
    ret = csi_timer_set_timeout(timer_handle, timer_loadtimer);
    3e46:	4008                	lw	a0,0(s0)
    3e48:	85a6                	mv	a1,s1
    3e4a:	3b29                	jal	3b64 <csi_timer_set_timeout>
    3e4c:	84aa                	mv	s1,a0
    if (ret != 0) {
    3e4e:	fd5d                	bnez	a0,3e0c <clock_timer_init+0x1a>
    csi_timer_get_current_value(timer_handle, &cv1);
    3e50:	4008                	lw	a0,0(s0)
    3e52:	858a                	mv	a1,sp
    3e54:	3bd1                	jal	3c28 <csi_timer_get_current_value>
    csi_timer_get_current_value(timer_handle, &cv2);
    3e56:	4008                	lw	a0,0(s0)
    3e58:	004c                	addi	a1,sp,4
    3e5a:	33f9                	jal	3c28 <csi_timer_get_current_value>
    if (cv2 > cv1) {
    3e5c:	4712                	lw	a4,4(sp)
    3e5e:	4782                	lw	a5,0(sp)
    3e60:	fae7f7e3          	bgeu	a5,a4,3e0e <clock_timer_init+0x1c>
        timer_count_rise = 1;
    3e64:	4705                	li	a4,1
    3e66:	02e18023          	sb	a4,32(gp) # 20000508 <timer_count_rise>
    3e6a:	b755                	j	3e0e <clock_timer_init+0x1c>

00003e6c <clock_timer_start>:
}

int clock_timer_start(void)
{
    int ret = -1;
    Timer_LoopCount = 0;
    3e6c:	0001ae23          	sw	zero,28(gp) # 20000504 <Timer_LoopCount>

    ret = csi_timer_start(timer_handle);
    3e70:	0241a503          	lw	a0,36(gp) # 2000050c <timer_handle>
{
    3e74:	1151                	addi	sp,sp,-12
    3e76:	c406                	sw	ra,8(sp)
    ret = csi_timer_start(timer_handle);
    3e78:	39fd                	jal	3b76 <csi_timer_start>
        (ts_begin.tv_sec * 1000000000 + ts_begin.tv_nsec);
    printf("clock_gettime() timing deviation is +%llu ns\n", error_margin_ns);
#endif

    return 0;
}
    3e7a:	40a2                	lw	ra,8(sp)
    if (ret != 0) {
    3e7c:	00a03533          	snez	a0,a0
}
    3e80:	40a00533          	neg	a0,a0
    3e84:	0131                	addi	sp,sp,12
    3e86:	8082                	ret

00003e88 <_init>:
extern int __ctor_start__;

typedef void (*func_ptr) (void);

CPP_WEAK void _init(void)
{
    3e88:	1151                	addi	sp,sp,-12
    3e8a:	c222                	sw	s0,4(sp)
    3e8c:	c026                	sw	s1,0(sp)
    3e8e:	6419                	lui	s0,0x6
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3e90:	6499                	lui	s1,0x6
{
    3e92:	c406                	sw	ra,8(sp)
    3e94:	2a040413          	addi	s0,s0,672 # 62a0 <__ctor_end__>
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3e98:	2a048493          	addi	s1,s1,672 # 62a0 <__ctor_end__>
    3e9c:	1471                	addi	s0,s0,-4
    3e9e:	00947763          	bgeu	s0,s1,3eac <_init+0x24>
        (*p) ();
    }
}
    3ea2:	40a2                	lw	ra,8(sp)
    3ea4:	4412                	lw	s0,4(sp)
    3ea6:	4482                	lw	s1,0(sp)
    3ea8:	0131                	addi	sp,sp,12
    3eaa:	8082                	ret
        (*p) ();
    3eac:	401c                	lw	a5,0(s0)
    3eae:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3eb0:	b7f5                	j	3e9c <_init+0x14>

00003eb2 <_fini>:

CPP_WEAK void _fini(void)
{
    3eb2:	1151                	addi	sp,sp,-12
    3eb4:	c222                	sw	s0,4(sp)
    3eb6:	c026                	sw	s1,0(sp)
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3eb8:	6419                	lui	s0,0x6
    3eba:	6499                	lui	s1,0x6
{
    3ebc:	c406                	sw	ra,8(sp)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ebe:	2a040413          	addi	s0,s0,672 # 62a0 <__ctor_end__>
    3ec2:	29c48493          	addi	s1,s1,668 # 629c <pad_line+0x71c>
    3ec6:	0084f763          	bgeu	s1,s0,3ed4 <_fini+0x22>
        (*p) ();
    }
}
    3eca:	40a2                	lw	ra,8(sp)
    3ecc:	4412                	lw	s0,4(sp)
    3ece:	4482                	lw	s1,0(sp)
    3ed0:	0131                	addi	sp,sp,12
    3ed2:	8082                	ret
        (*p) ();
    3ed4:	401c                	lw	a5,0(s0)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ed6:	0411                	addi	s0,s0,4
        (*p) ();
    3ed8:	9782                	jalr	a5
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3eda:	b7f5                	j	3ec6 <_fini+0x14>

00003edc <fputc>:
{
    return 0;
}

int fputc(int ch, FILE *stream)
{
    3edc:	1151                	addi	sp,sp,-12
    3ede:	c026                	sw	s1,0(sp)
    3ee0:	84aa                	mv	s1,a0
    (void)stream;

    if (console_handle == NULL) {
    3ee2:	0281a503          	lw	a0,40(gp) # 20000510 <console_handle>
{
    3ee6:	c406                	sw	ra,8(sp)
    3ee8:	c222                	sw	s0,4(sp)
    if (console_handle == NULL) {
    3eea:	c505                	beqz	a0,3f12 <fputc+0x36>
    3eec:	02818413          	addi	s0,gp,40 # 20000510 <console_handle>
        return -1;
    }

    if (ch == '\n') {
    3ef0:	47a9                	li	a5,10
    3ef2:	00f49563          	bne	s1,a5,3efc <fputc+0x20>
        csi_usart_putchar(console_handle, '\r');
    3ef6:	45b5                	li	a1,13
    3ef8:	86fff0ef          	jal	ra,3766 <csi_usart_putchar>
    }

    csi_usart_putchar(console_handle, ch);
    3efc:	4008                	lw	a0,0(s0)
    3efe:	0ff4f593          	andi	a1,s1,255
    3f02:	865ff0ef          	jal	ra,3766 <csi_usart_putchar>

    return 0;
    3f06:	4501                	li	a0,0
}
    3f08:	40a2                	lw	ra,8(sp)
    3f0a:	4412                	lw	s0,4(sp)
    3f0c:	4482                	lw	s1,0(sp)
    3f0e:	0131                	addi	sp,sp,12
    3f10:	8082                	ret
        return -1;
    3f12:	557d                	li	a0,-1
    3f14:	bfd5                	j	3f08 <fputc+0x2c>

00003f16 <os_critical_enter>:
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_suspend();
#endif

    return 0;
}
    3f16:	4501                	li	a0,0
    3f18:	8082                	ret

00003f1a <os_critical_exit>:
    3f1a:	4501                	li	a0,0
    3f1c:	8082                	ret

00003f1e <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    3f1e:	1151                	addi	sp,sp,-12
    3f20:	c026                	sw	s1,0(sp)
    3f22:	84aa                	mv	s1,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    3f24:	4188                	lw	a0,0(a1)
{
    3f26:	c222                	sw	s0,4(sp)
    3f28:	c406                	sw	ra,8(sp)
    3f2a:	842e                	mv	s0,a1
  int ndx = mm_size2ndx(node->size);
    3f2c:	20cd                	jal	400e <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    3f2e:	0505                	addi	a0,a0,1
    3f30:	0512                	slli	a0,a0,0x4
    3f32:	00850713          	addi	a4,a0,8
    3f36:	9726                	add	a4,a4,s1
    3f38:	94aa                	add	s1,s1,a0
    3f3a:	489c                	lw	a5,16(s1)
    3f3c:	c791                	beqz	a5,3f48 <mm_addfreechunk+0x2a>
       next && next->size && next->size < node->size;
    3f3e:	4394                	lw	a3,0(a5)
    3f40:	c681                	beqz	a3,3f48 <mm_addfreechunk+0x2a>
    3f42:	4010                	lw	a2,0(s0)
    3f44:	00c6ec63          	bltu	a3,a2,3f5c <mm_addfreechunk+0x3e>
       prev = next, next = next->flink);

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    3f48:	c700                	sw	s0,8(a4)
  node->blink = prev;
    3f4a:	c458                	sw	a4,12(s0)
  node->flink = next;
    3f4c:	c41c                	sw	a5,8(s0)

  if (next)
    3f4e:	c391                	beqz	a5,3f52 <mm_addfreechunk+0x34>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    3f50:	c7c0                	sw	s0,12(a5)
    }
}
    3f52:	40a2                	lw	ra,8(sp)
    3f54:	4412                	lw	s0,4(sp)
    3f56:	4482                	lw	s1,0(sp)
    3f58:	0131                	addi	sp,sp,12
    3f5a:	8082                	ret
       prev = next, next = next->flink);
    3f5c:	873e                	mv	a4,a5
    3f5e:	479c                	lw	a5,8(a5)
    3f60:	bff1                	j	3f3c <mm_addfreechunk+0x1e>

00003f62 <mm_addregion>:

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3f62:	00f58713          	addi	a4,a1,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3f66:	962e                	add	a2,a2,a1

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    3f68:	454c                	lw	a1,12(a0)
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3f6a:	9b41                	andi	a4,a4,-16
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3f6c:	9a41                	andi	a2,a2,-16
  heapsize = heapend - heapbase;
    3f6e:	40e607b3          	sub	a5,a2,a4
  heap->mm_heapsize += heapsize;
    3f72:	95be                	add	a1,a1,a5
    3f74:	c54c                	sw	a1,12(a0)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    3f76:	c918                	sw	a4,16(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3f78:	4321                	li	t1,8
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3f7a:	800002b7          	lui	t0,0x80000

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3f7e:	17c1                	addi	a5,a5,-16
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3f80:	00572223          	sw	t0,4(a4)
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3f84:	c71c                	sw	a5,8(a4)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3f86:	00672023          	sw	t1,0(a4)
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    3f8a:	00672623          	sw	t1,12(a4)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    3f8e:	00870593          	addi	a1,a4,8

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    3f92:	ff860713          	addi	a4,a2,-8
    3f96:	c958                	sw	a4,20(a0)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    3f98:	fe662c23          	sw	t1,-8(a2)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3f9c:	0057e7b3          	or	a5,a5,t0
    3fa0:	c35c                	sw	a5,4(a4)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    3fa2:	bfb5                	j	3f1e <mm_addfreechunk>

00003fa4 <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    3fa4:	1141                	addi	sp,sp,-16
    3fa6:	c422                	sw	s0,8(sp)
    3fa8:	c226                	sw	s1,4(sp)
    3faa:	c606                	sw	ra,12(sp)
    3fac:	842a                	mv	s0,a0
    3fae:	c032                	sw	a2,0(sp)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    3fb0:	00052623          	sw	zero,12(a0)
{
    3fb4:	84ae                	mv	s1,a1
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    3fb6:	13000613          	li	a2,304
    3fba:	4581                	li	a1,0
    3fbc:	0561                	addi	a0,a0,24
    3fbe:	beefe0ef          	jal	ra,23ac <memset>
  for (i = 1; i < MM_NNODES; i++)
    3fc2:	4702                	lw	a4,0(sp)
    3fc4:	02840793          	addi	a5,s0,40
    3fc8:	14840693          	addi	a3,s0,328
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3fcc:	ff078613          	addi	a2,a5,-16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    3fd0:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3fd4:	c7d0                	sw	a2,12(a5)
  for (i = 1; i < MM_NNODES; i++)
    3fd6:	07c1                	addi	a5,a5,16
    3fd8:	fed79ae3          	bne	a5,a3,3fcc <mm_initialize+0x28>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    3fdc:	8522                	mv	a0,s0
}
    3fde:	4422                	lw	s0,8(sp)
    3fe0:	40b2                	lw	ra,12(sp)
  mm_addregion(heap, heapstart, heapsize);
    3fe2:	85a6                	mv	a1,s1
}
    3fe4:	4492                	lw	s1,4(sp)
  mm_addregion(heap, heapstart, heapsize);
    3fe6:	863a                	mv	a2,a4
}
    3fe8:	0141                	addi	sp,sp,16
  mm_addregion(heap, heapstart, heapsize);
    3fea:	bfa5                	j	3f62 <mm_addregion>

00003fec <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    3fec:	200025b7          	lui	a1,0x20002
    3ff0:	200307b7          	lui	a5,0x20030
    3ff4:	df858613          	addi	a2,a1,-520 # 20001df8 <__bss_end__>
    3ff8:	00078793          	mv	a5,a5
    3ffc:	20002537          	lui	a0,0x20002
    4000:	40c78633          	sub	a2,a5,a2
    4004:	df858593          	addi	a1,a1,-520
    4008:	cb050513          	addi	a0,a0,-848 # 20001cb0 <g_mmheap>
    400c:	bf61                	j	3fa4 <mm_initialize>

0000400e <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
    400e:	004007b7          	lui	a5,0x400
    4012:	00f57c63          	bgeu	a0,a5,402a <mm_size2ndx+0x1c>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
    4016:	00455793          	srli	a5,a0,0x4
  while (size > 1)
    401a:	4705                	li	a4,1
  int ndx = 0;
    401c:	4501                	li	a0,0
  while (size > 1)
    401e:	00f76363          	bltu	a4,a5,4024 <mm_size2ndx+0x16>
    4022:	8082                	ret
    {
      ndx++;
    4024:	0505                	addi	a0,a0,1
      size >>= 1;
    4026:	8385                	srli	a5,a5,0x1
    4028:	bfdd                	j	401e <mm_size2ndx+0x10>
       return MM_NNODES-1;
    402a:	4549                	li	a0,18
    }

  return ndx;
}
    402c:	8082                	ret

0000402e <test_encrypt_cbc.isra.0>:
        printf("FAILURE!\n");
	return(1);
    }
}

static int test_encrypt_cbc(void)
    402e:	e9410113          	addi	sp,sp,-364
//    uint8_t out[] = { 0x4f, 0x02, 0x1d, 0xb2, 0x43, 0xbc, 0x63, 0x3d, 0x71, 0x78, 0x18, 0x3a, 0x9f, 0xa0, 0x71, 0xe8,
//                      0xb4, 0xd9, 0xad, 0xa9, 0xad, 0x7d, 0xed, 0xf4, 0xe5, 0xe7, 0x38, 0x76, 0x3f, 0x69, 0x14, 0x5a,
//                      0x57, 0x1b, 0x24, 0x20, 0x12, 0xfb, 0x7a, 0xe0, 0x7f, 0xa9, 0xba, 0xac, 0x3d, 0xf1, 0x02, 0xe0,
//                      0x08, 0xb0, 0xe2, 0x79, 0x88, 0x59, 0x88, 0x81, 0xd9, 0x20, 0xa9, 0xe6, 0x4f, 0x56, 0x15, 0xcd };
//#elif defined(AES128)
    uint8_t key[] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
    4032:	6599                	lui	a1,0x6
    4034:	4641                	li	a2,16
    4036:	97858593          	addi	a1,a1,-1672 # 5978 <sg_usi_config+0x90>
    403a:	850a                	mv	a0,sp
static int test_encrypt_cbc(void)
    403c:	16112423          	sw	ra,360(sp)
    uint8_t key[] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
    4040:	9d0fe0ef          	jal	ra,2210 <memcpy>
    uint8_t out[] = { 0x76, 0x49, 0xab, 0xac, 0x81, 0x19, 0xb2, 0x46, 0xce, 0xe9, 0x8e, 0x9b, 0x12, 0xe9, 0x19, 0x7d,
    4044:	6599                	lui	a1,0x6
    4046:	04000613          	li	a2,64
    404a:	98c58593          	addi	a1,a1,-1652 # 598c <sg_usi_config+0xa4>
    404e:	1008                	addi	a0,sp,32
    4050:	9c0fe0ef          	jal	ra,2210 <memcpy>
                      0x50, 0x86, 0xcb, 0x9b, 0x50, 0x72, 0x19, 0xee, 0x95, 0xdb, 0x11, 0x3a, 0x91, 0x76, 0x78, 0xb2,
                      0x73, 0xbe, 0xd6, 0xb8, 0xe3, 0xc1, 0x74, 0x3b, 0x71, 0x16, 0xe6, 0x9e, 0x22, 0x22, 0x95, 0x16,
                      0x3f, 0xf1, 0xca, 0xa1, 0x68, 0x1f, 0xac, 0x09, 0x12, 0x0e, 0xca, 0x30, 0x75, 0x86, 0xe1, 0xa7 };
//#endif
    uint8_t iv[]  = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f };
    4054:	6595                	lui	a1,0x5
    4056:	4641                	li	a2,16
    4058:	36058593          	addi	a1,a1,864 # 5360 <__srodata>
    405c:	0808                	addi	a0,sp,16
    405e:	9b2fe0ef          	jal	ra,2210 <memcpy>
    uint8_t in[]  = { 0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a,
    4062:	6599                	lui	a1,0x6
    4064:	04000613          	li	a2,64
    4068:	9d058593          	addi	a1,a1,-1584 # 59d0 <sg_usi_config+0xe8>
    406c:	1088                	addi	a0,sp,96
    406e:	9a2fe0ef          	jal	ra,2210 <memcpy>
                      0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, 0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51,
                      0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11, 0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef,
                      0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17, 0xad, 0x2b, 0x41, 0x7b, 0xe6, 0x6c, 0x37, 0x10 };
    struct AES_ctx ctx;

    AES_init_ctx_iv(&ctx, key, iv);
    4072:	0810                	addi	a2,sp,16
    4074:	858a                	mv	a1,sp
    4076:	1108                	addi	a0,sp,160
    4078:	2ce9                	jal	4352 <AES_init_ctx_iv>
    AES_CBC_encrypt_buffer(&ctx, in, 64);
    407a:	04000613          	li	a2,64
    407e:	108c                	addi	a1,sp,96
    4080:	1108                	addi	a0,sp,160
    4082:	2ccd                	jal	4374 <AES_CBC_encrypt_buffer>

    printf("CBC encrypt: ");
    4084:	6519                	lui	a0,0x6
    4086:	95050513          	addi	a0,a0,-1712 # 5950 <sg_usi_config+0x68>
    408a:	131000ef          	jal	ra,49ba <printf>

    if (0 == memcmp((char*) out, (char*) in, 64)) {
    408e:	04000613          	li	a2,64
    4092:	108c                	addi	a1,sp,96
    4094:	1008                	addi	a0,sp,32
    4096:	928fe0ef          	jal	ra,21be <memcmp>
    409a:	e919                	bnez	a0,40b0 <test_encrypt_cbc.isra.0+0x82>
        printf("SUCCESS!\n");
    409c:	6519                	lui	a0,0x6
    409e:	96050513          	addi	a0,a0,-1696 # 5960 <sg_usi_config+0x78>
	return(0);
    } else {
        printf("FAILURE!\n");
    40a2:	243000ef          	jal	ra,4ae4 <puts>
	return(1);
    }
}
    40a6:	16812083          	lw	ra,360(sp)
    40aa:	16c10113          	addi	sp,sp,364
    40ae:	8082                	ret
        printf("FAILURE!\n");
    40b0:	6519                	lui	a0,0x6
    40b2:	96c50513          	addi	a0,a0,-1684 # 596c <sg_usi_config+0x84>
    40b6:	b7f5                	j	40a2 <test_encrypt_cbc.isra.0+0x74>

000040b8 <main>:
{
    40b8:	1151                	addi	sp,sp,-12
    40ba:	c406                	sw	ra,8(sp)
	LED_Init();
    40bc:	260d                	jal	43de <LED_Init>
    printf("\nTesting AES128\n\n");
    40be:	6519                	lui	a0,0x6
    40c0:	a1450513          	addi	a0,a0,-1516 # 5a14 <sg_usi_config+0x12c>
    40c4:	221000ef          	jal	ra,4ae4 <puts>
	LED_ON();
    40c8:	2649                	jal	444a <LED_ON>
	mdelay(100);
    40ca:	06400513          	li	a0,100
    40ce:	36e9                	jal	3c98 <mdelay>
	test_encrypt_cbc() ;
    40d0:	3fb9                	jal	402e <test_encrypt_cbc.isra.0>
	LED_OFF();
    40d2:	2e79                	jal	4470 <LED_OFF>
	mdelay(100);
    40d4:	06400513          	li	a0,100
    40d8:	36c1                	jal	3c98 <mdelay>
while(1)
    40da:	b7fd                	j	40c8 <main+0x10>

000040dc <KeyExpansion>:
*/
#define getSBoxValue(num) (sbox[(num)])

// This function produces Nb(Nr+1) round keys. The round keys are used in each round to decrypt the states. 
static void KeyExpansion(uint8_t* RoundKey, const uint8_t* Key)
{
    40dc:	1171                	addi	sp,sp,-4
    40de:	c022                	sw	s0,0(sp)
    40e0:	01058713          	addi	a4,a1,16
    40e4:	87aa                	mv	a5,a0
  uint8_t tempa[4]; // Used for the column/row operations
  
  // The first round key is the key itself.
  for (i = 0; i < Nk; ++i)
  {
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
    40e6:	0005c683          	lbu	a3,0(a1)
  for (i = 0; i < Nk; ++i)
    40ea:	0591                	addi	a1,a1,4
    40ec:	0791                	addi	a5,a5,4
    RoundKey[(i * 4) + 0] = Key[(i * 4) + 0];
    40ee:	fed78e23          	sb	a3,-4(a5) # 3ffffc <__ctor_end__+0x3f9d5c>
    RoundKey[(i * 4) + 1] = Key[(i * 4) + 1];
    40f2:	ffd5c683          	lbu	a3,-3(a1)
    40f6:	fed78ea3          	sb	a3,-3(a5)
    RoundKey[(i * 4) + 2] = Key[(i * 4) + 2];
    40fa:	ffe5c683          	lbu	a3,-2(a1)
    40fe:	fed78f23          	sb	a3,-2(a5)
    RoundKey[(i * 4) + 3] = Key[(i * 4) + 3];
    4102:	fff5c683          	lbu	a3,-1(a1)
    4106:	fed78fa3          	sb	a3,-1(a5)
  for (i = 0; i < Nk; ++i)
    410a:	fce59ee3          	bne	a1,a4,40e6 <KeyExpansion+0xa>
      // SubWord() is a function that takes a four-byte input word and 
      // applies the S-box to each of the four bytes to produce an output word.

      // Function Subword()
      {
        tempa[0] = getSBoxValue(tempa[0]);
    410e:	6599                	lui	a1,0x6
        tempa[1] = getSBoxValue(tempa[1]);
        tempa[2] = getSBoxValue(tempa[2]);
        tempa[3] = getSBoxValue(tempa[3]);
      }

      tempa[0] = tempa[0] ^ Rcon[i/Nk];
    4110:	6299                	lui	t0,0x6
  for (i = Nk; i < Nb * (Nr + 1); ++i)
    4112:	4311                	li	t1,4
        tempa[0] = getSBoxValue(tempa[0]);
    4114:	a3458593          	addi	a1,a1,-1484 # 5a34 <sbox>
      tempa[0] = tempa[0] ^ Rcon[i/Nk];
    4118:	a2828293          	addi	t0,t0,-1496 # 5a28 <Rcon>
  for (i = Nk; i < Nb * (Nr + 1); ++i)
    411c:	02c00393          	li	t2,44
    if (i % Nk == 0)
    4120:	00337413          	andi	s0,t1,3
      tempa[0]=RoundKey[k + 0];
    4124:	00c54783          	lbu	a5,12(a0)
      tempa[1]=RoundKey[k + 1];
    4128:	00d54683          	lbu	a3,13(a0)
      tempa[2]=RoundKey[k + 2];
    412c:	00e54703          	lbu	a4,14(a0)
      tempa[3]=RoundKey[k + 3];
    4130:	00f54603          	lbu	a2,15(a0)
    if (i % Nk == 0)
    4134:	e01d                	bnez	s0,415a <KeyExpansion+0x7e>
        tempa[0] = getSBoxValue(tempa[0]);
    4136:	96ae                	add	a3,a3,a1
        tempa[1] = getSBoxValue(tempa[1]);
    4138:	972e                	add	a4,a4,a1
        tempa[2] = getSBoxValue(tempa[2]);
    413a:	962e                	add	a2,a2,a1
        tempa[3] = getSBoxValue(tempa[3]);
    413c:	97ae                	add	a5,a5,a1
        tempa[0] = getSBoxValue(tempa[0]);
    413e:	0006c403          	lbu	s0,0(a3) # e000e000 <__heap_end+0xbffde000>
        tempa[1] = getSBoxValue(tempa[1]);
    4142:	00074683          	lbu	a3,0(a4)
        tempa[2] = getSBoxValue(tempa[2]);
    4146:	00064703          	lbu	a4,0(a2)
        tempa[3] = getSBoxValue(tempa[3]);
    414a:	0007c603          	lbu	a2,0(a5)
      tempa[0] = tempa[0] ^ Rcon[i/Nk];
    414e:	00235793          	srli	a5,t1,0x2
    4152:	9796                	add	a5,a5,t0
    4154:	0007c783          	lbu	a5,0(a5)
    4158:	8fa1                	xor	a5,a5,s0
        tempa[3] = getSBoxValue(tempa[3]);
      }
    }
#endif
    j = i * 4; k=(i - Nk) * 4;
    RoundKey[j + 0] = RoundKey[k + 0] ^ tempa[0];
    415a:	00054403          	lbu	s0,0(a0)
  for (i = Nk; i < Nb * (Nr + 1); ++i)
    415e:	0305                	addi	t1,t1,1
    4160:	0511                	addi	a0,a0,4
    RoundKey[j + 0] = RoundKey[k + 0] ^ tempa[0];
    4162:	8fa1                	xor	a5,a5,s0
    4164:	00f50623          	sb	a5,12(a0)
    RoundKey[j + 1] = RoundKey[k + 1] ^ tempa[1];
    4168:	ffd54783          	lbu	a5,-3(a0)
    416c:	8ebd                	xor	a3,a3,a5
    RoundKey[j + 2] = RoundKey[k + 2] ^ tempa[2];
    416e:	ffe54783          	lbu	a5,-2(a0)
    RoundKey[j + 1] = RoundKey[k + 1] ^ tempa[1];
    4172:	00d506a3          	sb	a3,13(a0)
    RoundKey[j + 2] = RoundKey[k + 2] ^ tempa[2];
    4176:	8f3d                	xor	a4,a4,a5
    RoundKey[j + 3] = RoundKey[k + 3] ^ tempa[3];
    4178:	fff54783          	lbu	a5,-1(a0)
    RoundKey[j + 2] = RoundKey[k + 2] ^ tempa[2];
    417c:	00e50723          	sb	a4,14(a0)
    RoundKey[j + 3] = RoundKey[k + 3] ^ tempa[3];
    4180:	8fb1                	xor	a5,a5,a2
    4182:	00f507a3          	sb	a5,15(a0)
  for (i = Nk; i < Nb * (Nr + 1); ++i)
    4186:	f8731de3          	bne	t1,t2,4120 <KeyExpansion+0x44>
  }
}
    418a:	4402                	lw	s0,0(sp)
    418c:	0111                	addi	sp,sp,4
    418e:	8082                	ret

00004190 <AddRoundKey>:
#endif

// This function adds the round key to state.
// The round key is added to the state by an XOR function.
static void AddRoundKey(uint8_t round, state_t* state, const uint8_t* RoundKey)
{
    4190:	1171                	addi	sp,sp,-4
    4192:	c022                	sw	s0,0(sp)
    4194:	0512                	slli	a0,a0,0x4
    4196:	01058293          	addi	t0,a1,16
  uint8_t i,j;
  for (i = 0; i < 4; ++i)
  {
    for (j = 0; j < 4; ++j)
    419a:	4391                	li	t2,4
{
    419c:	872e                	mv	a4,a1
    419e:	4781                	li	a5,0
    {
      (*state)[i][j] ^= RoundKey[(round * Nb * 4) + (i * Nb) + j];
    41a0:	00a60333          	add	t1,a2,a0
    41a4:	00f306b3          	add	a3,t1,a5
    41a8:	00074403          	lbu	s0,0(a4)
    41ac:	0006c683          	lbu	a3,0(a3)
    for (j = 0; j < 4; ++j)
    41b0:	0785                	addi	a5,a5,1
    41b2:	0705                	addi	a4,a4,1
      (*state)[i][j] ^= RoundKey[(round * Nb * 4) + (i * Nb) + j];
    41b4:	8ea1                	xor	a3,a3,s0
    41b6:	fed70fa3          	sb	a3,-1(a4)
    for (j = 0; j < 4; ++j)
    41ba:	fe7795e3          	bne	a5,t2,41a4 <AddRoundKey+0x14>
  for (i = 0; i < 4; ++i)
    41be:	0591                	addi	a1,a1,4
    41c0:	0511                	addi	a0,a0,4
    41c2:	fc559de3          	bne	a1,t0,419c <AddRoundKey+0xc>
    }
  }
}
    41c6:	4402                	lw	s0,0(sp)
    41c8:	0111                	addi	sp,sp,4
    41ca:	8082                	ret

000041cc <xtime>:
  (*state)[1][3] = temp;
}

static uint8_t xtime(uint8_t x)
{
  return ((x<<1) ^ (((x>>7) & 1) * 0x1b));
    41cc:	00755793          	srli	a5,a0,0x7
    41d0:	476d                	li	a4,27
    41d2:	02e787b3          	mul	a5,a5,a4
    41d6:	0506                	slli	a0,a0,0x1
    41d8:	8d3d                	xor	a0,a0,a5
}
    41da:	0ff57513          	andi	a0,a0,255
    41de:	8082                	ret

000041e0 <Cipher>:
}
#endif // #if (defined(CBC) && CBC == 1) || (defined(ECB) && ECB == 1)

// Cipher is the main function that encrypts the PlainText.
static void Cipher(state_t* state, const uint8_t* RoundKey)
{
    41e0:	fc810113          	addi	sp,sp,-56
    41e4:	862e                	mv	a2,a1
    41e6:	d822                	sw	s0,48(sp)
  uint8_t round = 0;

  // Add the First round key to the state before starting the rounds.
  AddRoundKey(0, state, RoundKey);
    41e8:	c02e                	sw	a1,0(sp)
{
    41ea:	842a                	mv	s0,a0
  AddRoundKey(0, state, RoundKey);
    41ec:	85aa                	mv	a1,a0
    41ee:	4501                	li	a0,0
{
    41f0:	da06                	sw	ra,52(sp)
    41f2:	d626                	sw	s1,44(sp)
  AddRoundKey(0, state, RoundKey);
    41f4:	3f71                	jal	4190 <AddRoundKey>
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    41f6:	6799                	lui	a5,0x6
    41f8:	4602                	lw	a2,0(sp)
    41fa:	a3478793          	addi	a5,a5,-1484 # 5a34 <sbox>

  // There will be Nr rounds.
  // The first Nr-1 rounds are identical.
  // These Nr rounds are executed in the loop below.
  // Last one without MixColumns()
  for (round = 1; ; ++round)
    41fe:	4305                	li	t1,1
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    4200:	c43e                	sw	a5,8(sp)
  for (i = 0; i < 4; ++i)
    4202:	84a2                	mv	s1,s0
    4204:	00440293          	addi	t0,s0,4
    for (j = 0; j < 4; ++j)
    4208:	85a2                	mv	a1,s0
    420a:	4391                	li	t2,4
  for (round = 1; ; ++round)
    420c:	86ae                	mv	a3,a1
    for (j = 0; j < 4; ++j)
    420e:	4701                	li	a4,0
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    4210:	0006c503          	lbu	a0,0(a3)
    4214:	47a2                	lw	a5,8(sp)
    for (j = 0; j < 4; ++j)
    4216:	0705                	addi	a4,a4,1
    4218:	0ff77713          	andi	a4,a4,255
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    421c:	953e                	add	a0,a0,a5
    421e:	00054503          	lbu	a0,0(a0)
    for (j = 0; j < 4; ++j)
    4222:	0691                	addi	a3,a3,4
      (*state)[j][i] = getSBoxValue((*state)[j][i]);
    4224:	fea68e23          	sb	a0,-4(a3)
    for (j = 0; j < 4; ++j)
    4228:	fe7714e3          	bne	a4,t2,4210 <Cipher+0x30>
  for (i = 0; i < 4; ++i)
    422c:	0585                	addi	a1,a1,1
    422e:	fcb29fe3          	bne	t0,a1,420c <Cipher+0x2c>
  (*state)[0][1] = (*state)[1][1];
    4232:	00544683          	lbu	a3,5(s0)
  temp           = (*state)[0][1];
    4236:	00144703          	lbu	a4,1(s0)
  (*state)[0][1] = (*state)[1][1];
    423a:	00d400a3          	sb	a3,1(s0)
  (*state)[1][1] = (*state)[2][1];
    423e:	00944683          	lbu	a3,9(s0)
    4242:	00d402a3          	sb	a3,5(s0)
  (*state)[2][1] = (*state)[3][1];
    4246:	00d44683          	lbu	a3,13(s0)
  (*state)[3][1] = temp;
    424a:	00e406a3          	sb	a4,13(s0)
  temp           = (*state)[0][2];
    424e:	00244703          	lbu	a4,2(s0)
  (*state)[2][1] = (*state)[3][1];
    4252:	00d404a3          	sb	a3,9(s0)
  (*state)[0][2] = (*state)[2][2];
    4256:	00a44683          	lbu	a3,10(s0)
  (*state)[2][2] = temp;
    425a:	00e40523          	sb	a4,10(s0)
  temp           = (*state)[1][2];
    425e:	00644703          	lbu	a4,6(s0)
  (*state)[0][2] = (*state)[2][2];
    4262:	00d40123          	sb	a3,2(s0)
  (*state)[1][2] = (*state)[3][2];
    4266:	00e44683          	lbu	a3,14(s0)
  (*state)[3][2] = temp;
    426a:	00e40723          	sb	a4,14(s0)
  temp           = (*state)[0][3];
    426e:	00344703          	lbu	a4,3(s0)
  (*state)[1][2] = (*state)[3][2];
    4272:	00d40323          	sb	a3,6(s0)
  (*state)[0][3] = (*state)[3][3];
    4276:	00f44683          	lbu	a3,15(s0)
    427a:	00d401a3          	sb	a3,3(s0)
  (*state)[3][3] = (*state)[2][3];
    427e:	00b44683          	lbu	a3,11(s0)
    4282:	00d407a3          	sb	a3,15(s0)
  (*state)[2][3] = (*state)[1][3];
    4286:	00744683          	lbu	a3,7(s0)
  (*state)[1][3] = temp;
    428a:	00e403a3          	sb	a4,7(s0)
  {
    SubBytes(state);
    ShiftRows(state);
    if (round == Nr) {
    428e:	4729                	li	a4,10
  (*state)[2][3] = (*state)[1][3];
    4290:	00d405a3          	sb	a3,11(s0)
    if (round == Nr) {
    4294:	0ae30763          	beq	t1,a4,4342 <Cipher+0x162>
    4298:	01040793          	addi	a5,s0,16
    429c:	c23e                	sw	a5,4(sp)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
    429e:	0034c583          	lbu	a1,3(s1)
    t   = (*state)[i][0];
    42a2:	0004c283          	lbu	t0,0(s1)
    Tmp = (*state)[i][0] ^ (*state)[i][1] ^ (*state)[i][2] ^ (*state)[i][3] ;
    42a6:	0014c683          	lbu	a3,1(s1)
    42aa:	0024c703          	lbu	a4,2(s1)
    42ae:	d432                	sw	a2,40(sp)
    42b0:	00d2c533          	xor	a0,t0,a3
    42b4:	00b743b3          	xor	t2,a4,a1
    42b8:	007547b3          	xor	a5,a0,t2
    42bc:	d21a                	sw	t1,36(sp)
    42be:	ce2e                	sw	a1,28(sp)
    42c0:	cc1e                	sw	t2,24(sp)
    42c2:	d036                	sw	a3,32(sp)
    42c4:	c816                	sw	t0,16(sp)
    42c6:	c63a                	sw	a4,12(sp)
    42c8:	c03e                	sw	a5,0(sp)
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
    42ca:	3709                	jal	41cc <xtime>
    42cc:	42c2                	lw	t0,16(sp)
    42ce:	4782                	lw	a5,0(sp)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    42d0:	4732                	lw	a4,12(sp)
    42d2:	5682                	lw	a3,32(sp)
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
    42d4:	00a2c533          	xor	a0,t0,a0
    42d8:	8d3d                	xor	a0,a0,a5
    42da:	00a48023          	sb	a0,0(s1)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    42de:	00e6c533          	xor	a0,a3,a4
    Tm  = (*state)[i][0] ^ (*state)[i][1] ; Tm = xtime(Tm);  (*state)[i][0] ^= Tm ^ Tmp ;
    42e2:	ca16                	sw	t0,20(sp)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    42e4:	c83a                	sw	a4,16(sp)
    42e6:	c636                	sw	a3,12(sp)
    42e8:	35d5                	jal	41cc <xtime>
    42ea:	46b2                	lw	a3,12(sp)
    42ec:	4782                	lw	a5,0(sp)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
    42ee:	43e2                	lw	t2,24(sp)
    Tm  = (*state)[i][1] ^ (*state)[i][2] ; Tm = xtime(Tm);  (*state)[i][1] ^= Tm ^ Tmp ;
    42f0:	8ea9                	xor	a3,a3,a0
    42f2:	8ebd                	xor	a3,a3,a5
    42f4:	00d480a3          	sb	a3,1(s1)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
    42f8:	851e                	mv	a0,t2
    42fa:	3dc9                	jal	41cc <xtime>
    42fc:	4742                	lw	a4,16(sp)
    42fe:	4782                	lw	a5,0(sp)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
    4300:	45f2                	lw	a1,28(sp)
    4302:	42d2                	lw	t0,20(sp)
    Tm  = (*state)[i][2] ^ (*state)[i][3] ; Tm = xtime(Tm);  (*state)[i][2] ^= Tm ^ Tmp ;
    4304:	8f29                	xor	a4,a4,a0
    4306:	8f3d                	xor	a4,a4,a5
    4308:	00e48123          	sb	a4,2(s1)
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
    430c:	00b2c533          	xor	a0,t0,a1
    4310:	c62e                	sw	a1,12(sp)
    4312:	3d6d                	jal	41cc <xtime>
    4314:	45b2                	lw	a1,12(sp)
    4316:	4782                	lw	a5,0(sp)
  for (i = 0; i < 4; ++i)
    4318:	0491                	addi	s1,s1,4
    Tm  = (*state)[i][3] ^ t ;              Tm = xtime(Tm);  (*state)[i][3] ^= Tm ^ Tmp ;
    431a:	8da9                	xor	a1,a1,a0
    431c:	8fad                	xor	a5,a5,a1
    431e:	fef48fa3          	sb	a5,-1(s1)
  for (i = 0; i < 4; ++i)
    4322:	4792                	lw	a5,4(sp)
    4324:	5312                	lw	t1,36(sp)
    4326:	5622                	lw	a2,40(sp)
    4328:	f6979be3          	bne	a5,s1,429e <Cipher+0xbe>
      break;
    }
    MixColumns(state);
    AddRoundKey(round, state, RoundKey);
    432c:	851a                	mv	a0,t1
    432e:	85a2                	mv	a1,s0
    4330:	c232                	sw	a2,4(sp)
    4332:	c01a                	sw	t1,0(sp)
    4334:	3db1                	jal	4190 <AddRoundKey>
  for (round = 1; ; ++round)
    4336:	4302                	lw	t1,0(sp)
    SubBytes(state);
    4338:	4612                	lw	a2,4(sp)
  for (round = 1; ; ++round)
    433a:	0305                	addi	t1,t1,1
    433c:	0ff37313          	andi	t1,t1,255
    SubBytes(state);
    4340:	b5c9                	j	4202 <Cipher+0x22>
  }
  // Add round key to last round
  AddRoundKey(Nr, state, RoundKey);
    4342:	85a2                	mv	a1,s0
}
    4344:	5442                	lw	s0,48(sp)
    4346:	50d2                	lw	ra,52(sp)
    4348:	54b2                	lw	s1,44(sp)
  AddRoundKey(Nr, state, RoundKey);
    434a:	4529                	li	a0,10
}
    434c:	03810113          	addi	sp,sp,56
  AddRoundKey(Nr, state, RoundKey);
    4350:	b581                	j	4190 <AddRoundKey>

00004352 <AES_init_ctx_iv>:
{
    4352:	1151                	addi	sp,sp,-12
    4354:	c222                	sw	s0,4(sp)
    4356:	c026                	sw	s1,0(sp)
    4358:	c406                	sw	ra,8(sp)
    435a:	84b2                	mv	s1,a2
    435c:	842a                	mv	s0,a0
  KeyExpansion(ctx->RoundKey, key);
    435e:	3bbd                	jal	40dc <KeyExpansion>
  memcpy (ctx->Iv, iv, AES_BLOCKLEN);
    4360:	0b040513          	addi	a0,s0,176
}
    4364:	4412                	lw	s0,4(sp)
    4366:	40a2                	lw	ra,8(sp)
  memcpy (ctx->Iv, iv, AES_BLOCKLEN);
    4368:	85a6                	mv	a1,s1
}
    436a:	4482                	lw	s1,0(sp)
  memcpy (ctx->Iv, iv, AES_BLOCKLEN);
    436c:	4641                	li	a2,16
}
    436e:	0131                	addi	sp,sp,12
  memcpy (ctx->Iv, iv, AES_BLOCKLEN);
    4370:	ea1fd06f          	j	2210 <memcpy>

00004374 <AES_CBC_encrypt_buffer>:
    buf[i] ^= Iv[i];
  }
}

void AES_CBC_encrypt_buffer(struct AES_ctx *ctx, uint8_t* buf, size_t length)
{
    4374:	1111                	addi	sp,sp,-28
  size_t i;
  uint8_t *Iv = ctx->Iv;
    4376:	0b050693          	addi	a3,a0,176
{
    437a:	ca22                	sw	s0,20(sp)
    437c:	c826                	sw	s1,16(sp)
    437e:	872e                	mv	a4,a1
    4380:	cc06                	sw	ra,24(sp)
    4382:	84aa                	mv	s1,a0
  uint8_t *Iv = ctx->Iv;
    4384:	85b6                	mv	a1,a3
  for (i = 0; i < length; i += AES_BLOCKLEN)
    4386:	4401                	li	s0,0
    4388:	00870533          	add	a0,a4,s0
    438c:	00c46a63          	bltu	s0,a2,43a0 <AES_CBC_encrypt_buffer+0x2c>
    Iv = buf;
    buf += AES_BLOCKLEN;
  }
  /* store Iv in ctx for next call */
  memcpy(ctx->Iv, Iv, AES_BLOCKLEN);
}
    4390:	4452                	lw	s0,20(sp)
    4392:	40e2                	lw	ra,24(sp)
    4394:	44c2                	lw	s1,16(sp)
  memcpy(ctx->Iv, Iv, AES_BLOCKLEN);
    4396:	4641                	li	a2,16
    4398:	8536                	mv	a0,a3
}
    439a:	0171                	addi	sp,sp,28
  memcpy(ctx->Iv, Iv, AES_BLOCKLEN);
    439c:	e75fd06f          	j	2210 <memcpy>
    43a0:	4781                	li	a5,0
  for (i = 0; i < AES_BLOCKLEN; ++i) // The block in AES is always 128bit no matter the key size
    43a2:	43c1                	li	t2,16
    buf[i] ^= Iv[i];
    43a4:	00f502b3          	add	t0,a0,a5
    43a8:	00f58333          	add	t1,a1,a5
    43ac:	00034303          	lbu	t1,0(t1)
    43b0:	0002c083          	lbu	ra,0(t0)
  for (i = 0; i < AES_BLOCKLEN; ++i) // The block in AES is always 128bit no matter the key size
    43b4:	0785                	addi	a5,a5,1
    buf[i] ^= Iv[i];
    43b6:	00134333          	xor	t1,t1,ra
    43ba:	00628023          	sb	t1,0(t0)
  for (i = 0; i < AES_BLOCKLEN; ++i) // The block in AES is always 128bit no matter the key size
    43be:	fe7793e3          	bne	a5,t2,43a4 <AES_CBC_encrypt_buffer+0x30>
    Cipher((state_t*)buf, ctx->RoundKey);
    43c2:	85a6                	mv	a1,s1
    43c4:	c632                	sw	a2,12(sp)
    43c6:	c43a                	sw	a4,8(sp)
    43c8:	c236                	sw	a3,4(sp)
    43ca:	c02a                	sw	a0,0(sp)
    43cc:	3d11                	jal	41e0 <Cipher>
    Iv = buf;
    43ce:	4502                	lw	a0,0(sp)
    43d0:	4632                	lw	a2,12(sp)
    43d2:	4722                	lw	a4,8(sp)
    43d4:	4692                	lw	a3,4(sp)
  for (i = 0; i < length; i += AES_BLOCKLEN)
    43d6:	0441                	addi	s0,s0,16
    Iv = buf;
    43d8:	85aa                	mv	a1,a0
    43da:	b77d                	j	4388 <AES_CBC_encrypt_buffer+0x14>

000043dc <gpio_interrupt_handler>:
extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}
    43dc:	8082                	ret

000043de <LED_Init>:

void LED_Init()
{	
    43de:	1151                	addi	sp,sp,-12
    43e0:	c026                	sw	s1,0(sp)
	int32_t ret;		
																					
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    43e2:	6491                	lui	s1,0x4
    43e4:	3dc48593          	addi	a1,s1,988 # 43dc <gpio_interrupt_handler>
    43e8:	4501                	li	a0,0
{	
    43ea:	c406                	sw	ra,8(sp)
    43ec:	c222                	sw	s0,4(sp)
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    43ee:	d7aff0ef          	jal	ra,3968 <csi_gpio_pin_initialize>
    43f2:	02c18413          	addi	s0,gp,44 # 20000514 <led1_pin_handle_t>
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    43f6:	4581                	li	a1,0
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    43f8:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    43fa:	dceff0ef          	jal	ra,39c8 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led1_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    43fe:	4008                	lw	a0,0(s0)
    4400:	4585                	li	a1,1
    4402:	ddeff0ef          	jal	ra,39e0 <csi_gpio_pin_config_direction>

    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    4406:	3dc48593          	addi	a1,s1,988
    440a:	4505                	li	a0,1
    440c:	d5cff0ef          	jal	ra,3968 <csi_gpio_pin_initialize>
    4410:	03018413          	addi	s0,gp,48 # 20000518 <led2_pin_handle_t>
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    4414:	4581                	li	a1,0
    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    4416:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    4418:	db0ff0ef          	jal	ra,39c8 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led2_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    441c:	4008                	lw	a0,0(s0)
    441e:	4585                	li	a1,1
    4420:	dc0ff0ef          	jal	ra,39e0 <csi_gpio_pin_config_direction>

    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    4424:	3dc48593          	addi	a1,s1,988
    4428:	4509                	li	a0,2
    442a:	d3eff0ef          	jal	ra,3968 <csi_gpio_pin_initialize>
    442e:	03418413          	addi	s0,gp,52 # 2000051c <led3_pin_handle_t>
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    4432:	4581                	li	a1,0
    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    4434:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    4436:	d92ff0ef          	jal	ra,39c8 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    443a:	4008                	lw	a0,0(s0)
}
    443c:	4412                	lw	s0,4(sp)
    443e:	40a2                	lw	ra,8(sp)
    4440:	4482                	lw	s1,0(sp)
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4442:	4585                	li	a1,1
}
    4444:	0131                	addi	sp,sp,12
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4446:	d9aff06f          	j	39e0 <csi_gpio_pin_config_direction>

0000444a <LED_ON>:

void LED_ON()
{
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    444a:	02c1a503          	lw	a0,44(gp) # 20000514 <led1_pin_handle_t>
{
    444e:	1151                	addi	sp,sp,-12
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    4450:	4585                	li	a1,1
{
    4452:	c406                	sw	ra,8(sp)
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    4454:	dbeff0ef          	jal	ra,3a12 <csi_gpio_pin_write>
    csi_gpio_pin_write(led2_pin_handle_t,1);	
    4458:	0301a503          	lw	a0,48(gp) # 20000518 <led2_pin_handle_t>
    445c:	4585                	li	a1,1
    445e:	db4ff0ef          	jal	ra,3a12 <csi_gpio_pin_write>
    csi_gpio_pin_write(led3_pin_handle_t,1);	
}
    4462:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(led3_pin_handle_t,1);	
    4464:	0341a503          	lw	a0,52(gp) # 2000051c <led3_pin_handle_t>
    4468:	4585                	li	a1,1
}
    446a:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(led3_pin_handle_t,1);	
    446c:	da6ff06f          	j	3a12 <csi_gpio_pin_write>

00004470 <LED_OFF>:

void LED_OFF()
{
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    4470:	02c1a503          	lw	a0,44(gp) # 20000514 <led1_pin_handle_t>
{
    4474:	1151                	addi	sp,sp,-12
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    4476:	4581                	li	a1,0
{
    4478:	c406                	sw	ra,8(sp)
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    447a:	d98ff0ef          	jal	ra,3a12 <csi_gpio_pin_write>
    csi_gpio_pin_write(led2_pin_handle_t,0);	
    447e:	0301a503          	lw	a0,48(gp) # 20000518 <led2_pin_handle_t>
    4482:	4581                	li	a1,0
    4484:	d8eff0ef          	jal	ra,3a12 <csi_gpio_pin_write>
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    4488:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    448a:	0341a503          	lw	a0,52(gp) # 2000051c <led3_pin_handle_t>
    448e:	4581                	li	a1,0
    4490:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    4492:	d80ff06f          	j	3a12 <csi_gpio_pin_write>

00004496 <copystring>:
    4496:	4781                	li	a5,0
    4498:	470d                	li	a4,3
    449a:	00b7c463          	blt	a5,a1,44a2 <copystring+0xc>
    449e:	853e                	mv	a0,a5
    44a0:	8082                	ret
    44a2:	00f606b3          	add	a3,a2,a5
    44a6:	0006c303          	lbu	t1,0(a3)
    44aa:	00f506b3          	add	a3,a0,a5
    44ae:	0785                	addi	a5,a5,1
    44b0:	00668023          	sb	t1,0(a3)
    44b4:	fee793e3          	bne	a5,a4,449a <copystring+0x4>
    44b8:	feb7d3e3          	bge	a5,a1,449e <copystring+0x8>
    44bc:	000501a3          	sb	zero,3(a0)
    44c0:	4791                	li	a5,4
    44c2:	bff1                	j	449e <copystring+0x8>

000044c4 <__dtostr>:
    44c4:	fa810113          	addi	sp,sp,-88
    44c8:	c8a2                	sw	s0,80(sp)
    44ca:	ca86                	sw	ra,84(sp)
    44cc:	c6a6                	sw	s1,76(sp)
    44ce:	d02a                	sw	a0,32(sp)
    44d0:	c42e                	sw	a1,8(sp)
    44d2:	c032                	sw	a2,0(sp)
    44d4:	8436                	mv	s0,a3
    44d6:	d43a                	sw	a4,40(sp)
    44d8:	c23e                	sw	a5,4(sp)
    44da:	2ed5                	jal	48ce <__isinf>
    44dc:	cd01                	beqz	a0,44f4 <__dtostr+0x30>
    44de:	6619                	lui	a2,0x6
    44e0:	b7060613          	addi	a2,a2,-1168 # 5b70 <sbox+0x13c>
    44e4:	85a2                	mv	a1,s0
    44e6:	4446                	lw	s0,80(sp)
    44e8:	4502                	lw	a0,0(sp)
    44ea:	40d6                	lw	ra,84(sp)
    44ec:	44b6                	lw	s1,76(sp)
    44ee:	05810113          	addi	sp,sp,88
    44f2:	b755                	j	4496 <copystring>
    44f4:	5702                	lw	a4,32(sp)
    44f6:	47a2                	lw	a5,8(sp)
    44f8:	853a                	mv	a0,a4
    44fa:	85be                	mv	a1,a5
    44fc:	2b15                	jal	4a30 <__isnan>
    44fe:	d22a                	sw	a0,36(sp)
    4500:	c509                	beqz	a0,450a <__dtostr+0x46>
    4502:	6619                	lui	a2,0x6
    4504:	b7460613          	addi	a2,a2,-1164 # 5b74 <sbox+0x140>
    4508:	bff1                	j	44e4 <__dtostr+0x20>
    450a:	5702                	lw	a4,32(sp)
    450c:	47a2                	lw	a5,8(sp)
    450e:	4601                	li	a2,0
    4510:	4681                	li	a3,0
    4512:	853a                	mv	a0,a4
    4514:	85be                	mv	a1,a5
    4516:	f27fc0ef          	jal	ra,143c <__eqdf2>
    451a:	e925                	bnez	a0,458a <__dtostr+0xc6>
    451c:	4792                	lw	a5,4(sp)
    451e:	3a078363          	beqz	a5,48c4 <__dtostr+0x400>
    4522:	0789                	addi	a5,a5,2
    4524:	02f46163          	bltu	s0,a5,4546 <__dtostr+0x82>
    4528:	cb85                	beqz	a5,4558 <__dtostr+0x94>
    452a:	4722                	lw	a4,8(sp)
    452c:	04075c63          	bgez	a4,4584 <__dtostr+0xc0>
    4530:	4682                	lw	a3,0(sp)
    4532:	02d00713          	li	a4,45
    4536:	00e68023          	sb	a4,0(a3)
    453a:	00178713          	addi	a4,a5,1
    453e:	4785                	li	a5,1
    4540:	03000693          	li	a3,48
    4544:	a801                	j	4554 <__dtostr+0x90>
    4546:	47a1                	li	a5,8
    4548:	b7cd                	j	452a <__dtostr+0x66>
    454a:	4602                	lw	a2,0(sp)
    454c:	963e                	add	a2,a2,a5
    454e:	00d60023          	sb	a3,0(a2)
    4552:	0785                	addi	a5,a5,1
    4554:	fee7ebe3          	bltu	a5,a4,454a <__dtostr+0x86>
    4558:	4702                	lw	a4,0(sp)
    455a:	03000693          	li	a3,48
    455e:	00074603          	lbu	a2,0(a4)
    4562:	4705                	li	a4,1
    4564:	00d60363          	beq	a2,a3,456a <__dtostr+0xa6>
    4568:	4709                	li	a4,2
    456a:	4682                	lw	a3,0(sp)
    456c:	9736                	add	a4,a4,a3
    456e:	02e00693          	li	a3,46
    4572:	00d70023          	sb	a3,0(a4)
    4576:	4702                	lw	a4,0(sp)
    4578:	00f704b3          	add	s1,a4,a5
    457c:	00048023          	sb	zero,0(s1)
    4580:	d23e                	sw	a5,36(sp)
    4582:	a459                	j	4808 <__dtostr+0x344>
    4584:	873e                	mv	a4,a5
    4586:	4781                	li	a5,0
    4588:	bf65                	j	4540 <__dtostr+0x7c>
    458a:	5702                	lw	a4,32(sp)
    458c:	47a2                	lw	a5,8(sp)
    458e:	4601                	li	a2,0
    4590:	4681                	li	a3,0
    4592:	853a                	mv	a0,a4
    4594:	85be                	mv	a1,a5
    4596:	fd9fc0ef          	jal	ra,156e <__ledf2>
    459a:	16055f63          	bgez	a0,4718 <__dtostr+0x254>
    459e:	47a2                	lw	a5,8(sp)
    45a0:	4702                	lw	a4,0(sp)
    45a2:	800002b7          	lui	t0,0x80000
    45a6:	00f2c2b3          	xor	t0,t0,a5
    45aa:	02d00793          	li	a5,45
    45ae:	00f70023          	sb	a5,0(a4)
    45b2:	147d                	addi	s0,s0,-1
    45b4:	00170493          	addi	s1,a4,1
    45b8:	6799                	lui	a5,0x6
    45ba:	b387a503          	lw	a0,-1224(a5) # 5b38 <sbox+0x104>
    45be:	b3c7a583          	lw	a1,-1220(a5)
    45c2:	6799                	lui	a5,0x6
    45c4:	b487a703          	lw	a4,-1208(a5) # 5b48 <sbox+0x114>
    45c8:	b4c7a783          	lw	a5,-1204(a5)
    45cc:	4381                	li	t2,0
    45ce:	4692                	lw	a3,4(sp)
    45d0:	14d39763          	bne	t2,a3,471e <__dtostr+0x25a>
    45d4:	5702                	lw	a4,32(sp)
    45d6:	862a                	mv	a2,a0
    45d8:	86ae                	mv	a3,a1
    45da:	853a                	mv	a0,a4
    45dc:	8596                	mv	a1,t0
    45de:	ad6fc0ef          	jal	ra,8b4 <__adddf3>
    45e2:	6799                	lui	a5,0x6
    45e4:	b507a603          	lw	a2,-1200(a5) # 5b50 <sbox+0x11c>
    45e8:	b547a683          	lw	a3,-1196(a5)
    45ec:	c82a                	sw	a0,16(sp)
    45ee:	ca2e                	sw	a1,20(sp)
    45f0:	f7ffc0ef          	jal	ra,156e <__ledf2>
    45f4:	00055863          	bgez	a0,4604 <__dtostr+0x140>
    45f8:	03000793          	li	a5,48
    45fc:	00f48023          	sb	a5,0(s1)
    4600:	147d                	addi	s0,s0,-1
    4602:	0485                	addi	s1,s1,1
    4604:	47a2                	lw	a5,8(sp)
    4606:	0147d513          	srli	a0,a5,0x14
    460a:	7ff57513          	andi	a0,a0,2047
    460e:	c0150513          	addi	a0,a0,-1023
    4612:	b0bfd0ef          	jal	ra,211c <__floatsidf>
    4616:	6799                	lui	a5,0x6
    4618:	b587a603          	lw	a2,-1192(a5) # 5b58 <sbox+0x124>
    461c:	b5c7a683          	lw	a3,-1188(a5)
    4620:	804fd0ef          	jal	ra,1624 <__muldf3>
    4624:	a95fd0ef          	jal	ra,20b8 <__fixdfsi>
    4628:	00150793          	addi	a5,a0,1
    462c:	cc3e                	sw	a5,24(sp)
    462e:	22f05763          	blez	a5,485c <__dtostr+0x398>
    4632:	6699                	lui	a3,0x6
    4634:	b606a603          	lw	a2,-1184(a3) # 5b60 <sbox+0x12c>
    4638:	82be                	mv	t0,a5
    463a:	b646a683          	lw	a3,-1180(a3)
    463e:	6799                	lui	a5,0x6
    4640:	b407a703          	lw	a4,-1216(a5) # 5b40 <sbox+0x10c>
    4644:	b447a783          	lw	a5,-1212(a5)
    4648:	43a9                	li	t2,10
    464a:	d632                	sw	a2,44(sp)
    464c:	d836                	sw	a3,48(sp)
    464e:	0e53e663          	bltu	t2,t0,473a <__dtostr+0x276>
    4652:	6699                	lui	a3,0x6
    4654:	b406a603          	lw	a2,-1216(a3) # 5b40 <sbox+0x10c>
    4658:	b446a683          	lw	a3,-1212(a3)
    465c:	4385                	li	t2,1
    465e:	d632                	sw	a2,44(sp)
    4660:	d836                	sw	a3,48(sp)
    4662:	0e729963          	bne	t0,t2,4754 <__dtostr+0x290>
    4666:	4685                	li	a3,1
    4668:	d636                	sw	a3,44(sp)
    466a:	6699                	lui	a3,0x6
    466c:	b686a603          	lw	a2,-1176(a3) # 5b68 <sbox+0x134>
    4670:	b6c6a683          	lw	a3,-1172(a3)
    4674:	da32                	sw	a2,52(sp)
    4676:	dc36                	sw	a3,56(sp)
    4678:	6699                	lui	a3,0x6
    467a:	b406a603          	lw	a2,-1216(a3) # 5b40 <sbox+0x10c>
    467e:	b446a683          	lw	a3,-1212(a3)
    4682:	de32                	sw	a2,60(sp)
    4684:	c0b6                	sw	a3,64(sp)
    4686:	5652                	lw	a2,52(sp)
    4688:	56e2                	lw	a3,56(sp)
    468a:	853a                	mv	a0,a4
    468c:	85be                	mv	a1,a5
    468e:	c2ba                	sw	a4,68(sp)
    4690:	c4be                	sw	a5,72(sp)
    4692:	e27fc0ef          	jal	ra,14b8 <__gedf2>
    4696:	4716                	lw	a4,68(sp)
    4698:	47a6                	lw	a5,72(sp)
    469a:	0ca04a63          	bgtz	a0,476e <__dtostr+0x2aa>
    469e:	4682                	lw	a3,0(sp)
    46a0:	00d49a63          	bne	s1,a3,46b4 <__dtostr+0x1f0>
    46a4:	16040263          	beqz	s0,4808 <__dtostr+0x344>
    46a8:	03000693          	li	a3,48
    46ac:	00d48023          	sb	a3,0(s1)
    46b0:	147d                	addi	s0,s0,-1
    46b2:	0485                	addi	s1,s1,1
    46b4:	4692                	lw	a3,4(sp)
    46b6:	ea81                	bnez	a3,46c6 <__dtostr+0x202>
    46b8:	4682                	lw	a3,0(sp)
    46ba:	5622                	lw	a2,40(sp)
    46bc:	40d486b3          	sub	a3,s1,a3
    46c0:	0685                	addi	a3,a3,1
    46c2:	04c6f563          	bgeu	a3,a2,470c <__dtostr+0x248>
    46c6:	14040163          	beqz	s0,4808 <__dtostr+0x344>
    46ca:	02e00693          	li	a3,46
    46ce:	00d48023          	sb	a3,0(s1)
    46d2:	4692                	lw	a3,4(sp)
    46d4:	147d                	addi	s0,s0,-1
    46d6:	00148293          	addi	t0,s1,1
    46da:	ea81                	bnez	a3,46ea <__dtostr+0x226>
    46dc:	56a2                	lw	a3,40(sp)
    46de:	4602                	lw	a2,0(sp)
    46e0:	0685                	addi	a3,a3,1
    46e2:	40c28633          	sub	a2,t0,a2
    46e6:	8e91                	sub	a3,a3,a2
    46e8:	c236                	sw	a3,4(sp)
    46ea:	4692                	lw	a3,4(sp)
    46ec:	10d46e63          	bltu	s0,a3,4808 <__dtostr+0x344>
    46f0:	8426                	mv	s0,s1
    46f2:	94b6                	add	s1,s1,a3
    46f4:	6699                	lui	a3,0x6
    46f6:	b406a603          	lw	a2,-1216(a3) # 5b40 <sbox+0x10c>
    46fa:	b446a683          	lw	a3,-1212(a3)
    46fe:	c432                	sw	a2,8(sp)
    4700:	c636                	sw	a3,12(sp)
    4702:	16941363          	bne	s0,s1,4868 <__dtostr+0x3a4>
    4706:	4792                	lw	a5,4(sp)
    4708:	00f284b3          	add	s1,t0,a5
    470c:	4782                	lw	a5,0(sp)
    470e:	00048023          	sb	zero,0(s1)
    4712:	40f487b3          	sub	a5,s1,a5
    4716:	b5ad                	j	4580 <__dtostr+0xbc>
    4718:	4482                	lw	s1,0(sp)
    471a:	42a2                	lw	t0,8(sp)
    471c:	bd71                	j	45b8 <__dtostr+0xf4>
    471e:	863a                	mv	a2,a4
    4720:	86be                	mv	a3,a5
    4722:	d616                	sw	t0,44(sp)
    4724:	cc1e                	sw	t2,24(sp)
    4726:	c83a                	sw	a4,16(sp)
    4728:	ca3e                	sw	a5,20(sp)
    472a:	efbfc0ef          	jal	ra,1624 <__muldf3>
    472e:	43e2                	lw	t2,24(sp)
    4730:	52b2                	lw	t0,44(sp)
    4732:	4742                	lw	a4,16(sp)
    4734:	0385                	addi	t2,t2,1
    4736:	47d2                	lw	a5,20(sp)
    4738:	bd59                	j	45ce <__dtostr+0x10a>
    473a:	5632                	lw	a2,44(sp)
    473c:	56c2                	lw	a3,48(sp)
    473e:	853a                	mv	a0,a4
    4740:	85be                	mv	a1,a5
    4742:	da16                	sw	t0,52(sp)
    4744:	ee1fc0ef          	jal	ra,1624 <__muldf3>
    4748:	52d2                	lw	t0,52(sp)
    474a:	872a                	mv	a4,a0
    474c:	87ae                	mv	a5,a1
    474e:	12d9                	addi	t0,t0,-10
    4750:	43a9                	li	t2,10
    4752:	bdf5                	j	464e <__dtostr+0x18a>
    4754:	5632                	lw	a2,44(sp)
    4756:	56c2                	lw	a3,48(sp)
    4758:	853a                	mv	a0,a4
    475a:	85be                	mv	a1,a5
    475c:	da16                	sw	t0,52(sp)
    475e:	ec7fc0ef          	jal	ra,1624 <__muldf3>
    4762:	52d2                	lw	t0,52(sp)
    4764:	872a                	mv	a4,a0
    4766:	87ae                	mv	a5,a1
    4768:	12fd                	addi	t0,t0,-1
    476a:	4385                	li	t2,1
    476c:	bddd                	j	4662 <__dtostr+0x19e>
    476e:	4542                	lw	a0,16(sp)
    4770:	45d2                	lw	a1,20(sp)
    4772:	863a                	mv	a2,a4
    4774:	86be                	mv	a3,a5
    4776:	c2ba                	sw	a4,68(sp)
    4778:	c4be                	sw	a5,72(sp)
    477a:	f30fc0ef          	jal	ra,eaa <__divdf3>
    477e:	93bfd0ef          	jal	ra,20b8 <__fixdfsi>
    4782:	5632                	lw	a2,44(sp)
    4784:	0ff57693          	andi	a3,a0,255
    4788:	4716                	lw	a4,68(sp)
    478a:	47a6                	lw	a5,72(sp)
    478c:	c211                	beqz	a2,4790 <__dtostr+0x2cc>
    478e:	ced5                	beqz	a3,484a <__dtostr+0x386>
    4790:	03068693          	addi	a3,a3,48
    4794:	00d48023          	sb	a3,0(s1)
    4798:	0485                	addi	s1,s1,1
    479a:	ec35                	bnez	s0,4816 <__dtostr+0x352>
    479c:	863a                	mv	a2,a4
    479e:	86be                	mv	a3,a5
    47a0:	5702                	lw	a4,32(sp)
    47a2:	47a2                	lw	a5,8(sp)
    47a4:	853a                	mv	a0,a4
    47a6:	85be                	mv	a1,a5
    47a8:	f02fc0ef          	jal	ra,eaa <__divdf3>
    47ac:	4792                	lw	a5,4(sp)
    47ae:	5722                	lw	a4,40(sp)
    47b0:	4602                	lw	a2,0(sp)
    47b2:	4681                	li	a3,0
    47b4:	3b01                	jal	44c4 <__dtostr>
    47b6:	c929                	beqz	a0,4808 <__dtostr+0x344>
    47b8:	00a48333          	add	t1,s1,a0
    47bc:	06500793          	li	a5,101
    47c0:	00f30023          	sb	a5,0(t1)
    47c4:	00130493          	addi	s1,t1,1
    47c8:	fff54513          	not	a0,a0
    47cc:	4711                	li	a4,4
    47ce:	4685                	li	a3,1
    47d0:	3e800793          	li	a5,1000
    47d4:	4629                	li	a2,10
    47d6:	45e2                	lw	a1,24(sp)
    47d8:	00f5d363          	bge	a1,a5,47de <__dtostr+0x31a>
    47dc:	e285                	bnez	a3,47fc <__dtostr+0x338>
    47de:	c909                	beqz	a0,47f0 <__dtostr+0x32c>
    47e0:	46e2                	lw	a3,24(sp)
    47e2:	0485                	addi	s1,s1,1
    47e4:	02f6c6b3          	div	a3,a3,a5
    47e8:	03068693          	addi	a3,a3,48
    47ec:	fed48fa3          	sb	a3,-1(s1)
    47f0:	46e2                	lw	a3,24(sp)
    47f2:	157d                	addi	a0,a0,-1
    47f4:	02f6e6b3          	rem	a3,a3,a5
    47f8:	cc36                	sw	a3,24(sp)
    47fa:	4681                	li	a3,0
    47fc:	177d                	addi	a4,a4,-1
    47fe:	02c7c7b3          	div	a5,a5,a2
    4802:	fb71                	bnez	a4,47d6 <__dtostr+0x312>
    4804:	f00514e3          	bnez	a0,470c <__dtostr+0x248>
    4808:	40d6                	lw	ra,84(sp)
    480a:	4446                	lw	s0,80(sp)
    480c:	5512                	lw	a0,36(sp)
    480e:	44b6                	lw	s1,76(sp)
    4810:	05810113          	addi	sp,sp,88
    4814:	8082                	ret
    4816:	0ff57513          	andi	a0,a0,255
    481a:	d63a                	sw	a4,44(sp)
    481c:	d83e                	sw	a5,48(sp)
    481e:	8fffd0ef          	jal	ra,211c <__floatsidf>
    4822:	5732                	lw	a4,44(sp)
    4824:	57c2                	lw	a5,48(sp)
    4826:	147d                	addi	s0,s0,-1
    4828:	863a                	mv	a2,a4
    482a:	86be                	mv	a3,a5
    482c:	c2ba                	sw	a4,68(sp)
    482e:	c4be                	sw	a5,72(sp)
    4830:	df5fc0ef          	jal	ra,1624 <__muldf3>
    4834:	862a                	mv	a2,a0
    4836:	86ae                	mv	a3,a1
    4838:	4542                	lw	a0,16(sp)
    483a:	45d2                	lw	a1,20(sp)
    483c:	a70fd0ef          	jal	ra,1aac <__subdf3>
    4840:	4716                	lw	a4,68(sp)
    4842:	47a6                	lw	a5,72(sp)
    4844:	c82a                	sw	a0,16(sp)
    4846:	ca2e                	sw	a1,20(sp)
    4848:	d602                	sw	zero,44(sp)
    484a:	5672                	lw	a2,60(sp)
    484c:	4686                	lw	a3,64(sp)
    484e:	853a                	mv	a0,a4
    4850:	85be                	mv	a1,a5
    4852:	e58fc0ef          	jal	ra,eaa <__divdf3>
    4856:	872a                	mv	a4,a0
    4858:	87ae                	mv	a5,a1
    485a:	b535                	j	4686 <__dtostr+0x1c2>
    485c:	6799                	lui	a5,0x6
    485e:	b487a703          	lw	a4,-1208(a5) # 5b48 <sbox+0x114>
    4862:	b4c7a783          	lw	a5,-1204(a5)
    4866:	bd25                	j	469e <__dtostr+0x1da>
    4868:	4542                	lw	a0,16(sp)
    486a:	45d2                	lw	a1,20(sp)
    486c:	863a                	mv	a2,a4
    486e:	86be                	mv	a3,a5
    4870:	d016                	sw	t0,32(sp)
    4872:	cc3a                	sw	a4,24(sp)
    4874:	ce3e                	sw	a5,28(sp)
    4876:	e34fc0ef          	jal	ra,eaa <__divdf3>
    487a:	83ffd0ef          	jal	ra,20b8 <__fixdfsi>
    487e:	03050693          	addi	a3,a0,48
    4882:	00d400a3          	sb	a3,1(s0)
    4886:	0ff57513          	andi	a0,a0,255
    488a:	893fd0ef          	jal	ra,211c <__floatsidf>
    488e:	4762                	lw	a4,24(sp)
    4890:	47f2                	lw	a5,28(sp)
    4892:	0405                	addi	s0,s0,1
    4894:	863a                	mv	a2,a4
    4896:	86be                	mv	a3,a5
    4898:	d8dfc0ef          	jal	ra,1624 <__muldf3>
    489c:	862a                	mv	a2,a0
    489e:	86ae                	mv	a3,a1
    48a0:	4542                	lw	a0,16(sp)
    48a2:	45d2                	lw	a1,20(sp)
    48a4:	a08fd0ef          	jal	ra,1aac <__subdf3>
    48a8:	4762                	lw	a4,24(sp)
    48aa:	47f2                	lw	a5,28(sp)
    48ac:	4622                	lw	a2,8(sp)
    48ae:	46b2                	lw	a3,12(sp)
    48b0:	c82a                	sw	a0,16(sp)
    48b2:	ca2e                	sw	a1,20(sp)
    48b4:	853a                	mv	a0,a4
    48b6:	85be                	mv	a1,a5
    48b8:	df2fc0ef          	jal	ra,eaa <__divdf3>
    48bc:	872a                	mv	a4,a0
    48be:	87ae                	mv	a5,a1
    48c0:	5282                	lw	t0,32(sp)
    48c2:	b581                	j	4702 <__dtostr+0x23e>
    48c4:	47a1                	li	a5,8
    48c6:	c60402e3          	beqz	s0,452a <__dtostr+0x66>
    48ca:	4785                	li	a5,1
    48cc:	b9b9                	j	452a <__dtostr+0x66>

000048ce <__isinf>:
    48ce:	e509                	bnez	a0,48d8 <__isinf+0xa>
    48d0:	7ff007b7          	lui	a5,0x7ff00
    48d4:	00f58b63          	beq	a1,a5,48ea <__isinf+0x1c>
    48d8:	fff007b7          	lui	a5,0xfff00
    48dc:	8fad                	xor	a5,a5,a1
    48de:	8d5d                	or	a0,a0,a5
    48e0:	00153513          	seqz	a0,a0
    48e4:	40a00533          	neg	a0,a0
    48e8:	8082                	ret
    48ea:	4505                	li	a0,1
    48ec:	8082                	ret

000048ee <__lltostr>:
    48ee:	fdc10113          	addi	sp,sp,-36
    48f2:	15fd                	addi	a1,a1,-1
    48f4:	ce22                	sw	s0,28(sp)
    48f6:	d006                	sw	ra,32(sp)
    48f8:	cc26                	sw	s1,24(sp)
    48fa:	95aa                	add	a1,a1,a0
    48fc:	00058023          	sb	zero,0(a1)
    4900:	842a                	mv	s0,a0
    4902:	82b2                	mv	t0,a2
    4904:	8336                	mv	t1,a3
    4906:	c709                	beqz	a4,4910 <__lltostr+0x22>
    4908:	02400693          	li	a3,36
    490c:	00e6d363          	bge	a3,a4,4912 <__lltostr+0x24>
    4910:	4729                	li	a4,10
    4912:	0062e6b3          	or	a3,t0,t1
    4916:	4601                	li	a2,0
    4918:	e699                	bnez	a3,4926 <__lltostr+0x38>
    491a:	03000693          	li	a3,48
    491e:	fed58fa3          	sb	a3,-1(a1)
    4922:	4605                	li	a2,1
    4924:	15fd                	addi	a1,a1,-1
    4926:	02700693          	li	a3,39
    492a:	c391                	beqz	a5,492e <__lltostr+0x40>
    492c:	469d                	li	a3,7
    492e:	0ff6f793          	andi	a5,a3,255
    4932:	c23e                	sw	a5,4(sp)
    4934:	00c587b3          	add	a5,a1,a2
    4938:	c43e                	sw	a5,8(sp)
    493a:	41f75793          	srai	a5,a4,0x1f
    493e:	84ae                	mv	s1,a1
    4940:	c03e                	sw	a5,0(sp)
    4942:	47a2                	lw	a5,8(sp)
    4944:	409786b3          	sub	a3,a5,s1
    4948:	00947563          	bgeu	s0,s1,4952 <__lltostr+0x64>
    494c:	0062e633          	or	a2,t0,t1
    4950:	e205                	bnez	a2,4970 <__lltostr+0x82>
    4952:	00168613          	addi	a2,a3,1
    4956:	85a6                	mv	a1,s1
    4958:	8522                	mv	a0,s0
    495a:	c036                	sw	a3,0(sp)
    495c:	961fd0ef          	jal	ra,22bc <memmove>
    4960:	4682                	lw	a3,0(sp)
    4962:	5082                	lw	ra,32(sp)
    4964:	4472                	lw	s0,28(sp)
    4966:	44e2                	lw	s1,24(sp)
    4968:	8536                	mv	a0,a3
    496a:	02410113          	addi	sp,sp,36
    496e:	8082                	ret
    4970:	4682                	lw	a3,0(sp)
    4972:	863a                	mv	a2,a4
    4974:	8516                	mv	a0,t0
    4976:	859a                	mv	a1,t1
    4978:	ca3a                	sw	a4,20(sp)
    497a:	c816                	sw	t0,16(sp)
    497c:	c61a                	sw	t1,12(sp)
    497e:	be3fb0ef          	jal	ra,560 <__umoddi3>
    4982:	03050513          	addi	a0,a0,48
    4986:	0ff57513          	andi	a0,a0,255
    498a:	03900793          	li	a5,57
    498e:	14fd                	addi	s1,s1,-1
    4990:	4332                	lw	t1,12(sp)
    4992:	42c2                	lw	t0,16(sp)
    4994:	4752                	lw	a4,20(sp)
    4996:	00a7ef63          	bltu	a5,a0,49b4 <__lltostr+0xc6>
    499a:	4682                	lw	a3,0(sp)
    499c:	00a48023          	sb	a0,0(s1)
    49a0:	863a                	mv	a2,a4
    49a2:	8516                	mv	a0,t0
    49a4:	859a                	mv	a1,t1
    49a6:	c63a                	sw	a4,12(sp)
    49a8:	84ffb0ef          	jal	ra,1f6 <__udivdi3>
    49ac:	82aa                	mv	t0,a0
    49ae:	832e                	mv	t1,a1
    49b0:	4732                	lw	a4,12(sp)
    49b2:	bf41                	j	4942 <__lltostr+0x54>
    49b4:	4792                	lw	a5,4(sp)
    49b6:	953e                	add	a0,a0,a5
    49b8:	b7cd                	j	499a <__lltostr+0xac>

000049ba <printf>:
    49ba:	fdc10113          	addi	sp,sp,-36
    49be:	c82e                	sw	a1,16(sp)
    49c0:	080c                	addi	a1,sp,16
    49c2:	c606                	sw	ra,12(sp)
    49c4:	ca32                	sw	a2,20(sp)
    49c6:	cc36                	sw	a3,24(sp)
    49c8:	ce3a                	sw	a4,28(sp)
    49ca:	d03e                	sw	a5,32(sp)
    49cc:	c02e                	sw	a1,0(sp)
    49ce:	2099                	jal	4a14 <vprintf>
    49d0:	40b2                	lw	ra,12(sp)
    49d2:	02410113          	addi	sp,sp,36
    49d6:	8082                	ret

000049d8 <putc>:
    49d8:	d04ff06f          	j	3edc <fputc>

000049dc <__stdio_outs>:
    49dc:	1151                	addi	sp,sp,-12
    49de:	c222                	sw	s0,4(sp)
    49e0:	c026                	sw	s1,0(sp)
    49e2:	842a                	mv	s0,a0
    49e4:	84ae                	mv	s1,a1
    49e6:	c406                	sw	ra,8(sp)
    49e8:	94a2                	add	s1,s1,s0
    49ea:	d2cff0ef          	jal	ra,3f16 <os_critical_enter>
    49ee:	00941a63          	bne	s0,s1,4a02 <__stdio_outs+0x26>
    49f2:	d28ff0ef          	jal	ra,3f1a <os_critical_exit>
    49f6:	40a2                	lw	ra,8(sp)
    49f8:	4412                	lw	s0,4(sp)
    49fa:	4482                	lw	s1,0(sp)
    49fc:	4505                	li	a0,1
    49fe:	0131                	addi	sp,sp,12
    4a00:	8082                	ret
    4a02:	0001a703          	lw	a4,0(gp) # 200004e8 <_impure_ptr>
    4a06:	00044503          	lbu	a0,0(s0)
    4a0a:	0405                	addi	s0,s0,1
    4a0c:	470c                	lw	a1,8(a4)
    4a0e:	cceff0ef          	jal	ra,3edc <fputc>
    4a12:	bff1                	j	49ee <__stdio_outs+0x12>

00004a14 <vprintf>:
    4a14:	1131                	addi	sp,sp,-20
    4a16:	6795                	lui	a5,0x5
    4a18:	9dc78793          	addi	a5,a5,-1572 # 49dc <__stdio_outs>
    4a1c:	862e                	mv	a2,a1
    4a1e:	85aa                	mv	a1,a0
    4a20:	850a                	mv	a0,sp
    4a22:	c806                	sw	ra,16(sp)
    4a24:	c002                	sw	zero,0(sp)
    4a26:	c23e                	sw	a5,4(sp)
    4a28:	2291                	jal	4b6c <__v_printf>
    4a2a:	40c2                	lw	ra,16(sp)
    4a2c:	0151                	addi	sp,sp,20
    4a2e:	8082                	ret

00004a30 <__isnan>:
    4a30:	fff80737          	lui	a4,0xfff80
    4a34:	177d                	addi	a4,a4,-1
    4a36:	8f6d                	and	a4,a4,a1
    4a38:	e509                	bnez	a0,4a42 <__isnan+0x12>
    4a3a:	7ff007b7          	lui	a5,0x7ff00
    4a3e:	00f70963          	beq	a4,a5,4a50 <__isnan+0x20>
    4a42:	fff807b7          	lui	a5,0xfff80
    4a46:	8fad                	xor	a5,a5,a1
    4a48:	8fc9                	or	a5,a5,a0
    4a4a:	0017b513          	seqz	a0,a5
    4a4e:	8082                	ret
    4a50:	4505                	li	a0,1
    4a52:	8082                	ret

00004a54 <__ltostr>:
    4a54:	1151                	addi	sp,sp,-12
    4a56:	15fd                	addi	a1,a1,-1
    4a58:	c406                	sw	ra,8(sp)
    4a5a:	c222                	sw	s0,4(sp)
    4a5c:	95aa                	add	a1,a1,a0
    4a5e:	00058023          	sb	zero,0(a1)
    4a62:	fff68313          	addi	t1,a3,-1
    4a66:	02300793          	li	a5,35
    4a6a:	0067f363          	bgeu	a5,t1,4a70 <__ltostr+0x1c>
    4a6e:	46a9                	li	a3,10
    4a70:	4781                	li	a5,0
    4a72:	e619                	bnez	a2,4a80 <__ltostr+0x2c>
    4a74:	03000793          	li	a5,48
    4a78:	fef58fa3          	sb	a5,-1(a1)
    4a7c:	15fd                	addi	a1,a1,-1
    4a7e:	4785                	li	a5,1
    4a80:	02700313          	li	t1,39
    4a84:	c311                	beqz	a4,4a88 <__ltostr+0x34>
    4a86:	431d                	li	t1,7
    4a88:	0ff37713          	andi	a4,t1,255
    4a8c:	03900293          	li	t0,57
    4a90:	00f58333          	add	t1,a1,a5
    4a94:	40b30433          	sub	s0,t1,a1
    4a98:	00b57363          	bgeu	a0,a1,4a9e <__ltostr+0x4a>
    4a9c:	ea11                	bnez	a2,4ab0 <__ltostr+0x5c>
    4a9e:	00140613          	addi	a2,s0,1
    4aa2:	81bfd0ef          	jal	ra,22bc <memmove>
    4aa6:	8522                	mv	a0,s0
    4aa8:	40a2                	lw	ra,8(sp)
    4aaa:	4412                	lw	s0,4(sp)
    4aac:	0131                	addi	sp,sp,12
    4aae:	8082                	ret
    4ab0:	02d677b3          	remu	a5,a2,a3
    4ab4:	15fd                	addi	a1,a1,-1
    4ab6:	03078793          	addi	a5,a5,48 # fff80030 <__heap_end+0xdff50030>
    4aba:	0ff7f793          	andi	a5,a5,255
    4abe:	00f2e763          	bltu	t0,a5,4acc <__ltostr+0x78>
    4ac2:	00f58023          	sb	a5,0(a1)
    4ac6:	02d65633          	divu	a2,a2,a3
    4aca:	b7e9                	j	4a94 <__ltostr+0x40>
    4acc:	97ba                	add	a5,a5,a4
    4ace:	bfd5                	j	4ac2 <__ltostr+0x6e>

00004ad0 <putchar>:
    4ad0:	0001a783          	lw	a5,0(gp) # 200004e8 <_impure_ptr>
    4ad4:	1151                	addi	sp,sp,-12
    4ad6:	c406                	sw	ra,8(sp)
    4ad8:	478c                	lw	a1,8(a5)
    4ada:	3dfd                	jal	49d8 <putc>
    4adc:	40a2                	lw	ra,8(sp)
    4ade:	4501                	li	a0,0
    4ae0:	0131                	addi	sp,sp,12
    4ae2:	8082                	ret

00004ae4 <puts>:
    4ae4:	1151                	addi	sp,sp,-12
    4ae6:	c222                	sw	s0,4(sp)
    4ae8:	c406                	sw	ra,8(sp)
    4aea:	842a                	mv	s0,a0
    4aec:	00044503          	lbu	a0,0(s0)
    4af0:	55fd                	li	a1,-1
    4af2:	e909                	bnez	a0,4b04 <puts+0x20>
    4af4:	4529                	li	a0,10
    4af6:	be6ff0ef          	jal	ra,3edc <fputc>
    4afa:	40a2                	lw	ra,8(sp)
    4afc:	4412                	lw	s0,4(sp)
    4afe:	4501                	li	a0,0
    4b00:	0131                	addi	sp,sp,12
    4b02:	8082                	ret
    4b04:	bd8ff0ef          	jal	ra,3edc <fputc>
    4b08:	0405                	addi	s0,s0,1
    4b0a:	b7cd                	j	4aec <puts+0x8>

00004b0c <write_pad>:
    4b0c:	1131                	addi	sp,sp,-20
    4b0e:	fd060613          	addi	a2,a2,-48
    4b12:	c426                	sw	s1,8(sp)
    4b14:	00163613          	seqz	a2,a2
    4b18:	6499                	lui	s1,0x6
    4b1a:	0612                	slli	a2,a2,0x4
    4b1c:	b8048493          	addi	s1,s1,-1152 # 5b80 <pad_line>
    4b20:	c622                	sw	s0,12(sp)
    4b22:	c806                	sw	ra,16(sp)
    4b24:	87aa                	mv	a5,a0
    4b26:	872e                	mv	a4,a1
    4b28:	94b2                	add	s1,s1,a2
    4b2a:	842e                	mv	s0,a1
    4b2c:	463d                	li	a2,15
    4b2e:	408706b3          	sub	a3,a4,s0
    4b32:	02864263          	blt	a2,s0,4b56 <write_pad+0x4a>
    4b36:	00805a63          	blez	s0,4b4a <write_pad+0x3e>
    4b3a:	43d8                	lw	a4,4(a5)
    4b3c:	4390                	lw	a2,0(a5)
    4b3e:	85a2                	mv	a1,s0
    4b40:	8526                	mv	a0,s1
    4b42:	c036                	sw	a3,0(sp)
    4b44:	9702                	jalr	a4
    4b46:	4682                	lw	a3,0(sp)
    4b48:	96a2                	add	a3,a3,s0
    4b4a:	40c2                	lw	ra,16(sp)
    4b4c:	4432                	lw	s0,12(sp)
    4b4e:	44a2                	lw	s1,8(sp)
    4b50:	8536                	mv	a0,a3
    4b52:	0151                	addi	sp,sp,20
    4b54:	8082                	ret
    4b56:	43d4                	lw	a3,4(a5)
    4b58:	4390                	lw	a2,0(a5)
    4b5a:	45c1                	li	a1,16
    4b5c:	8526                	mv	a0,s1
    4b5e:	c23a                	sw	a4,4(sp)
    4b60:	c03e                	sw	a5,0(sp)
    4b62:	9682                	jalr	a3
    4b64:	1441                	addi	s0,s0,-16
    4b66:	4712                	lw	a4,4(sp)
    4b68:	4782                	lw	a5,0(sp)
    4b6a:	b7c9                	j	4b2c <write_pad+0x20>

00004b6c <__v_printf>:
    4b6c:	0081a783          	lw	a5,8(gp) # 200004f0 <errno>
    4b70:	f2810113          	addi	sp,sp,-216
    4b74:	c9a2                	sw	s0,208(sp)
    4b76:	c7a6                	sw	s1,204(sp)
    4b78:	cb86                	sw	ra,212(sp)
    4b7a:	84aa                	mv	s1,a0
    4b7c:	c82e                	sw	a1,16(sp)
    4b7e:	8432                	mv	s0,a2
    4b80:	d83e                	sw	a5,48(sp)
    4b82:	c202                	sw	zero,4(sp)
    4b84:	47c2                	lw	a5,16(sp)
    4b86:	0007c783          	lbu	a5,0(a5)
    4b8a:	68078063          	beqz	a5,520a <__v_printf+0x69e>
    4b8e:	4701                	li	a4,0
    4b90:	02500613          	li	a2,37
    4b94:	a011                	j	4b98 <__v_printf+0x2c>
    4b96:	0705                	addi	a4,a4,1
    4b98:	47c2                	lw	a5,16(sp)
    4b9a:	97ba                	add	a5,a5,a4
    4b9c:	0007c683          	lbu	a3,0(a5)
    4ba0:	74068863          	beqz	a3,52f0 <__v_printf+0x784>
    4ba4:	fec699e3          	bne	a3,a2,4b96 <__v_printf+0x2a>
    4ba8:	e319                	bnez	a4,4bae <__v_printf+0x42>
    4baa:	47c2                	lw	a5,16(sp)
    4bac:	a01d                	j	4bd2 <__v_printf+0x66>
    4bae:	40d4                	lw	a3,4(s1)
    4bb0:	4090                	lw	a2,0(s1)
    4bb2:	4542                	lw	a0,16(sp)
    4bb4:	85ba                	mv	a1,a4
    4bb6:	c43e                	sw	a5,8(sp)
    4bb8:	c03a                	sw	a4,0(sp)
    4bba:	9682                	jalr	a3
    4bbc:	4792                	lw	a5,4(sp)
    4bbe:	4702                	lw	a4,0(sp)
    4bc0:	97ba                	add	a5,a5,a4
    4bc2:	c23e                	sw	a5,4(sp)
    4bc4:	47a2                	lw	a5,8(sp)
    4bc6:	02500713          	li	a4,37
    4bca:	0007c683          	lbu	a3,0(a5)
    4bce:	72e69463          	bne	a3,a4,52f6 <__v_printf+0x78a>
    4bd2:	00178513          	addi	a0,a5,1
    4bd6:	02000793          	li	a5,32
    4bda:	c002                	sw	zero,0(sp)
    4bdc:	c602                	sw	zero,12(sp)
    4bde:	4701                	li	a4,0
    4be0:	ca02                	sw	zero,20(sp)
    4be2:	ce02                	sw	zero,28(sp)
    4be4:	d602                	sw	zero,44(sp)
    4be6:	d002                	sw	zero,32(sp)
    4be8:	c402                	sw	zero,8(sp)
    4bea:	cc3e                	sw	a5,24(sp)
    4bec:	00054303          	lbu	t1,0(a0)
    4bf0:	00150793          	addi	a5,a0,1
    4bf4:	c83e                	sw	a5,16(sp)
    4bf6:	046103a3          	sb	t1,71(sp)
    4bfa:	06300793          	li	a5,99
    4bfe:	1cf30963          	beq	t1,a5,4dd0 <__v_printf+0x264>
    4c02:	0c67e863          	bltu	a5,t1,4cd2 <__v_printf+0x166>
    4c06:	02d00793          	li	a5,45
    4c0a:	02f30363          	beq	t1,a5,4c30 <__v_printf+0xc4>
    4c0e:	0667e263          	bltu	a5,t1,4c72 <__v_printf+0x106>
    4c12:	02300793          	li	a5,35
    4c16:	02f30163          	beq	t1,a5,4c38 <__v_printf+0xcc>
    4c1a:	0267e663          	bltu	a5,t1,4c46 <__v_printf+0xda>
    4c1e:	5e030463          	beqz	t1,5206 <__v_printf+0x69a>
    4c22:	02000793          	li	a5,32
    4c26:	f4f31fe3          	bne	t1,a5,4b84 <__v_printf+0x18>
    4c2a:	4785                	li	a5,1
    4c2c:	d63e                	sw	a5,44(sp)
    4c2e:	a019                	j	4c34 <__v_printf+0xc8>
    4c30:	4785                	li	a5,1
    4c32:	d03e                	sw	a5,32(sp)
    4c34:	4542                	lw	a0,16(sp)
    4c36:	bf5d                	j	4bec <__v_printf+0x80>
    4c38:	0ff00793          	li	a5,255
    4c3c:	c43e                	sw	a5,8(sp)
    4c3e:	bfdd                	j	4c34 <__v_printf+0xc8>
    4c40:	4785                	li	a5,1
    4c42:	ce3e                	sw	a5,28(sp)
    4c44:	bfc5                	j	4c34 <__v_printf+0xc8>
    4c46:	02a00793          	li	a5,42
    4c4a:	16f30163          	beq	t1,a5,4dac <__v_printf+0x240>
    4c4e:	02b00793          	li	a5,43
    4c52:	fef307e3          	beq	t1,a5,4c40 <__v_printf+0xd4>
    4c56:	02500793          	li	a5,37
    4c5a:	f2f315e3          	bne	t1,a5,4b84 <__v_printf+0x18>
    4c5e:	40dc                	lw	a5,4(s1)
    4c60:	4090                	lw	a2,0(s1)
    4c62:	4585                	li	a1,1
    4c64:	04710513          	addi	a0,sp,71
    4c68:	9782                	jalr	a5
    4c6a:	4792                	lw	a5,4(sp)
    4c6c:	0785                	addi	a5,a5,1
    4c6e:	c23e                	sw	a5,4(sp)
    4c70:	bf11                	j	4b84 <__v_printf+0x18>
    4c72:	03900793          	li	a5,57
    4c76:	0267ee63          	bltu	a5,t1,4cb2 <__v_printf+0x146>
    4c7a:	03000793          	li	a5,48
    4c7e:	0ef37f63          	bgeu	t1,a5,4d7c <__v_printf+0x210>
    4c82:	02e00793          	li	a5,46
    4c86:	eef31fe3          	bne	t1,a5,4b84 <__v_printf+0x18>
    4c8a:	00154683          	lbu	a3,1(a0)
    4c8e:	02a00793          	li	a5,42
    4c92:	12f69163          	bne	a3,a5,4db4 <__v_printf+0x248>
    4c96:	4014                	lw	a3,0(s0)
    4c98:	00440793          	addi	a5,s0,4
    4c9c:	c036                	sw	a3,0(sp)
    4c9e:	0006d363          	bgez	a3,4ca4 <__v_printf+0x138>
    4ca2:	c002                	sw	zero,0(sp)
    4ca4:	00250693          	addi	a3,a0,2
    4ca8:	c836                	sw	a3,16(sp)
    4caa:	843e                	mv	s0,a5
    4cac:	4785                	li	a5,1
    4cae:	ca3e                	sw	a5,20(sp)
    4cb0:	b751                	j	4c34 <__v_printf+0xc8>
    4cb2:	05800793          	li	a5,88
    4cb6:	2af30263          	beq	t1,a5,4f5a <__v_printf+0x3ee>
    4cba:	06200793          	li	a5,98
    4cbe:	36f30363          	beq	t1,a5,5024 <__v_printf+0x4b8>
    4cc2:	04c00793          	li	a5,76
    4cc6:	eaf31fe3          	bne	t1,a5,4b84 <__v_printf+0x18>
    4cca:	0705                	addi	a4,a4,1
    4ccc:	0762                	slli	a4,a4,0x18
    4cce:	8761                	srai	a4,a4,0x18
    4cd0:	a091                	j	4d14 <__v_printf+0x1a8>
    4cd2:	06d00793          	li	a5,109
    4cd6:	10f30263          	beq	t1,a5,4dda <__v_printf+0x26e>
    4cda:	0267ef63          	bltu	a5,t1,4d18 <__v_printf+0x1ac>
    4cde:	06700793          	li	a5,103
    4ce2:	0067ef63          	bltu	a5,t1,4d00 <__v_printf+0x194>
    4ce6:	06600793          	li	a5,102
    4cea:	3ef37263          	bgeu	t1,a5,50ce <__v_printf+0x562>
    4cee:	06400793          	li	a5,100
    4cf2:	e8f319e3          	bne	t1,a5,4b84 <__v_printf+0x18>
    4cf6:	4529                	li	a0,10
    4cf8:	4781                	li	a5,0
    4cfa:	4285                	li	t0,1
    4cfc:	4301                	li	t1,0
    4cfe:	ac49                	j	4f90 <__v_printf+0x424>
    4d00:	06900793          	li	a5,105
    4d04:	fef309e3          	beq	t1,a5,4cf6 <__v_printf+0x18a>
    4d08:	06f36663          	bltu	t1,a5,4d74 <__v_printf+0x208>
    4d0c:	06c00793          	li	a5,108
    4d10:	e6f31ae3          	bne	t1,a5,4b84 <__v_printf+0x18>
    4d14:	0705                	addi	a4,a4,1
    4d16:	a085                	j	4d76 <__v_printf+0x20a>
    4d18:	07300793          	li	a5,115
    4d1c:	0ef30163          	beq	t1,a5,4dfe <__v_printf+0x292>
    4d20:	0267ec63          	bltu	a5,t1,4d58 <__v_printf+0x1ec>
    4d24:	07000793          	li	a5,112
    4d28:	22f30263          	beq	t1,a5,4f4c <__v_printf+0x3e0>
    4d2c:	07100793          	li	a5,113
    4d30:	f8f30de3          	beq	t1,a5,4cca <__v_printf+0x15e>
    4d34:	06f00793          	li	a5,111
    4d38:	e4f316e3          	bne	t1,a5,4b84 <__v_printf+0x18>
    4d3c:	47a2                	lw	a5,8(sp)
    4d3e:	2e078763          	beqz	a5,502c <__v_printf+0x4c0>
    4d42:	03000793          	li	a5,48
    4d46:	04f106a3          	sb	a5,77(sp)
    4d4a:	4785                	li	a5,1
    4d4c:	c43e                	sw	a5,8(sp)
    4d4e:	4521                	li	a0,8
    4d50:	4781                	li	a5,0
    4d52:	4281                	li	t0,0
    4d54:	4305                	li	t1,1
    4d56:	ac2d                	j	4f90 <__v_printf+0x424>
    4d58:	07800793          	li	a5,120
    4d5c:	2cf30263          	beq	t1,a5,5020 <__v_printf+0x4b4>
    4d60:	07a00793          	li	a5,122
    4d64:	ecf308e3          	beq	t1,a5,4c34 <__v_printf+0xc8>
    4d68:	07500793          	li	a5,117
    4d6c:	e0f31ce3          	bne	t1,a5,4b84 <__v_printf+0x18>
    4d70:	4529                	li	a0,10
    4d72:	ac55                	j	5026 <__v_printf+0x4ba>
    4d74:	177d                	addi	a4,a4,-1
    4d76:	0762                	slli	a4,a4,0x18
    4d78:	8761                	srai	a4,a4,0x18
    4d7a:	bd6d                	j	4c34 <__v_printf+0xc8>
    4d7c:	47d2                	lw	a5,20(sp)
    4d7e:	c83a                	sw	a4,16(sp)
    4d80:	48079363          	bnez	a5,5206 <__v_printf+0x69a>
    4d84:	4629                	li	a2,10
    4d86:	00ac                	addi	a1,sp,72
    4d88:	f97fd0ef          	jal	ra,2d1e <strtoul>
    4d8c:	04714683          	lbu	a3,71(sp)
    4d90:	c62a                	sw	a0,12(sp)
    4d92:	03000793          	li	a5,48
    4d96:	4742                	lw	a4,16(sp)
    4d98:	00f69763          	bne	a3,a5,4da6 <__v_printf+0x23a>
    4d9c:	5782                	lw	a5,32(sp)
    4d9e:	e781                	bnez	a5,4da6 <__v_printf+0x23a>
    4da0:	03000793          	li	a5,48
    4da4:	cc3e                	sw	a5,24(sp)
    4da6:	47a6                	lw	a5,72(sp)
    4da8:	c83e                	sw	a5,16(sp)
    4daa:	b569                	j	4c34 <__v_printf+0xc8>
    4dac:	401c                	lw	a5,0(s0)
    4dae:	0411                	addi	s0,s0,4
    4db0:	c63e                	sw	a5,12(sp)
    4db2:	b549                	j	4c34 <__v_printf+0xc8>
    4db4:	4542                	lw	a0,16(sp)
    4db6:	4629                	li	a2,10
    4db8:	00ac                	addi	a1,sp,72
    4dba:	ca3a                	sw	a4,20(sp)
    4dbc:	da9fd0ef          	jal	ra,2b64 <strtol>
    4dc0:	c02a                	sw	a0,0(sp)
    4dc2:	4752                	lw	a4,20(sp)
    4dc4:	00055363          	bgez	a0,4dca <__v_printf+0x25e>
    4dc8:	c002                	sw	zero,0(sp)
    4dca:	47a6                	lw	a5,72(sp)
    4dcc:	c83e                	sw	a5,16(sp)
    4dce:	bdf9                	j	4cac <__v_printf+0x140>
    4dd0:	401c                	lw	a5,0(s0)
    4dd2:	0411                	addi	s0,s0,4
    4dd4:	04f103a3          	sb	a5,71(sp)
    4dd8:	b559                	j	4c5e <__v_printf+0xf2>
    4dda:	5542                	lw	a0,48(sp)
    4ddc:	b57fd0ef          	jal	ra,2932 <strerror>
    4de0:	c4aa                	sw	a0,72(sp)
    4de2:	c42a                	sw	a0,8(sp)
    4de4:	b69fd0ef          	jal	ra,294c <strlen>
    4de8:	4722                	lw	a4,8(sp)
    4dea:	40d4                	lw	a3,4(s1)
    4dec:	4090                	lw	a2,0(s1)
    4dee:	85aa                	mv	a1,a0
    4df0:	c02a                	sw	a0,0(sp)
    4df2:	853a                	mv	a0,a4
    4df4:	9682                	jalr	a3
    4df6:	4712                	lw	a4,4(sp)
    4df8:	4782                	lw	a5,0(sp)
    4dfa:	97ba                	add	a5,a5,a4
    4dfc:	bd8d                	j	4c6e <__v_printf+0x102>
    4dfe:	4018                	lw	a4,0(s0)
    4e00:	00440793          	addi	a5,s0,4
    4e04:	c721                	beqz	a4,4e4c <__v_printf+0x2e0>
    4e06:	c4ba                	sw	a4,72(sp)
    4e08:	4526                	lw	a0,72(sp)
    4e0a:	cc3e                	sw	a5,24(sp)
    4e0c:	b41fd0ef          	jal	ra,294c <strlen>
    4e10:	4752                	lw	a4,20(sp)
    4e12:	832a                	mv	t1,a0
    4e14:	47e2                	lw	a5,24(sp)
    4e16:	cf1d                	beqz	a4,4e54 <__v_printf+0x2e8>
    4e18:	4702                	lw	a4,0(sp)
    4e1a:	00a77363          	bgeu	a4,a0,4e20 <__v_printf+0x2b4>
    4e1e:	833a                	mv	t1,a4
    4e20:	843e                	mv	s0,a5
    4e22:	c002                	sw	zero,0(sp)
    4e24:	ca02                	sw	zero,20(sp)
    4e26:	4281                	li	t0,0
    4e28:	02000793          	li	a5,32
    4e2c:	cc3e                	sw	a5,24(sp)
    4e2e:	47b2                	lw	a5,12(sp)
    4e30:	4702                	lw	a4,0(sp)
    4e32:	46a6                	lw	a3,72(sp)
    4e34:	8fd9                	or	a5,a5,a4
    4e36:	e39d                	bnez	a5,4e5c <__v_printf+0x2f0>
    4e38:	40dc                	lw	a5,4(s1)
    4e3a:	4090                	lw	a2,0(s1)
    4e3c:	859a                	mv	a1,t1
    4e3e:	8536                	mv	a0,a3
    4e40:	c01a                	sw	t1,0(sp)
    4e42:	9782                	jalr	a5
    4e44:	4792                	lw	a5,4(sp)
    4e46:	4302                	lw	t1,0(sp)
    4e48:	979a                	add	a5,a5,t1
    4e4a:	b515                	j	4c6e <__v_printf+0x102>
    4e4c:	6719                	lui	a4,0x6
    4e4e:	b7870713          	addi	a4,a4,-1160 # 5b78 <sbox+0x144>
    4e52:	bf55                	j	4e06 <__v_printf+0x29a>
    4e54:	843e                	mv	s0,a5
    4e56:	4281                	li	t0,0
    4e58:	c002                	sw	zero,0(sp)
    4e5a:	b7f9                	j	4e28 <__v_printf+0x2bc>
    4e5c:	44029163          	bnez	t0,529e <__v_printf+0x732>
    4e60:	47a2                	lw	a5,8(sp)
    4e62:	3a078b63          	beqz	a5,5218 <__v_printf+0x6ac>
    4e66:	47a2                	lw	a5,8(sp)
    4e68:	00f68733          	add	a4,a3,a5
    4e6c:	c4ba                	sw	a4,72(sp)
    4e6e:	4732                	lw	a4,12(sp)
    4e70:	40f30333          	sub	t1,t1,a5
    4e74:	8f1d                	sub	a4,a4,a5
    4e76:	c63a                	sw	a4,12(sp)
    4e78:	5702                	lw	a4,32(sp)
    4e7a:	3a070363          	beqz	a4,5220 <__v_printf+0x6b4>
    4e7e:	40d8                	lw	a4,4(s1)
    4e80:	4090                	lw	a2,0(s1)
    4e82:	85be                	mv	a1,a5
    4e84:	8536                	mv	a0,a3
    4e86:	ca1a                	sw	t1,20(sp)
    4e88:	c43e                	sw	a5,8(sp)
    4e8a:	9702                	jalr	a4
    4e8c:	4712                	lw	a4,4(sp)
    4e8e:	47a2                	lw	a5,8(sp)
    4e90:	4352                	lw	t1,20(sp)
    4e92:	97ba                	add	a5,a5,a4
    4e94:	c23e                	sw	a5,4(sp)
    4e96:	4782                	lw	a5,0(sp)
    4e98:	03000613          	li	a2,48
    4e9c:	8526                	mv	a0,s1
    4e9e:	406785b3          	sub	a1,a5,t1
    4ea2:	ca1a                	sw	t1,20(sp)
    4ea4:	c69ff0ef          	jal	ra,4b0c <write_pad>
    4ea8:	4792                	lw	a5,4(sp)
    4eaa:	4352                	lw	t1,20(sp)
    4eac:	40d8                	lw	a4,4(s1)
    4eae:	97aa                	add	a5,a5,a0
    4eb0:	4090                	lw	a2,0(s1)
    4eb2:	4526                	lw	a0,72(sp)
    4eb4:	859a                	mv	a1,t1
    4eb6:	c43e                	sw	a5,8(sp)
    4eb8:	c21a                	sw	t1,4(sp)
    4eba:	9702                	jalr	a4
    4ebc:	4312                	lw	t1,4(sp)
    4ebe:	47a2                	lw	a5,8(sp)
    4ec0:	4582                	lw	a1,0(sp)
    4ec2:	979a                	add	a5,a5,t1
    4ec4:	0065f363          	bgeu	a1,t1,4eca <__v_printf+0x35e>
    4ec8:	859a                	mv	a1,t1
    4eca:	c03e                	sw	a5,0(sp)
    4ecc:	47b2                	lw	a5,12(sp)
    4ece:	02000613          	li	a2,32
    4ed2:	8526                	mv	a0,s1
    4ed4:	40b785b3          	sub	a1,a5,a1
    4ed8:	c35ff0ef          	jal	ra,4b0c <write_pad>
    4edc:	4782                	lw	a5,0(sp)
    4ede:	97aa                	add	a5,a5,a0
    4ee0:	b379                	j	4c6e <__v_printf+0x102>
    4ee2:	c78d                	beqz	a5,4f0c <__v_printf+0x3a0>
    4ee4:	4662                	lw	a2,24(sp)
    4ee6:	03000713          	li	a4,48
    4eea:	02e61163          	bne	a2,a4,4f0c <__v_printf+0x3a0>
    4eee:	40d8                	lw	a4,4(s1)
    4ef0:	4090                	lw	a2,0(s1)
    4ef2:	85be                	mv	a1,a5
    4ef4:	8536                	mv	a0,a3
    4ef6:	ca1a                	sw	t1,20(sp)
    4ef8:	c43e                	sw	a5,8(sp)
    4efa:	c036                	sw	a3,0(sp)
    4efc:	9702                	jalr	a4
    4efe:	4712                	lw	a4,4(sp)
    4f00:	47a2                	lw	a5,8(sp)
    4f02:	4352                	lw	t1,20(sp)
    4f04:	4682                	lw	a3,0(sp)
    4f06:	97ba                	add	a5,a5,a4
    4f08:	c23e                	sw	a5,4(sp)
    4f0a:	4781                	li	a5,0
    4f0c:	c43e                	sw	a5,8(sp)
    4f0e:	47b2                	lw	a5,12(sp)
    4f10:	4662                	lw	a2,24(sp)
    4f12:	8526                	mv	a0,s1
    4f14:	406785b3          	sub	a1,a5,t1
    4f18:	c01a                	sw	t1,0(sp)
    4f1a:	ca36                	sw	a3,20(sp)
    4f1c:	bf1ff0ef          	jal	ra,4b0c <write_pad>
    4f20:	4792                	lw	a5,4(sp)
    4f22:	4302                	lw	t1,0(sp)
    4f24:	00a78733          	add	a4,a5,a0
    4f28:	47a2                	lw	a5,8(sp)
    4f2a:	34078e63          	beqz	a5,5286 <__v_printf+0x71a>
    4f2e:	46d2                	lw	a3,20(sp)
    4f30:	0044a383          	lw	t2,4(s1)
    4f34:	4090                	lw	a2,0(s1)
    4f36:	85be                	mv	a1,a5
    4f38:	8536                	mv	a0,a3
    4f3a:	c41a                	sw	t1,8(sp)
    4f3c:	c23a                	sw	a4,4(sp)
    4f3e:	c03e                	sw	a5,0(sp)
    4f40:	9382                	jalr	t2
    4f42:	4782                	lw	a5,0(sp)
    4f44:	4712                	lw	a4,4(sp)
    4f46:	4322                	lw	t1,8(sp)
    4f48:	973e                	add	a4,a4,a5
    4f4a:	ae35                	j	5286 <__v_printf+0x71a>
    4f4c:	07800793          	li	a5,120
    4f50:	04f103a3          	sb	a5,71(sp)
    4f54:	4789                	li	a5,2
    4f56:	4705                	li	a4,1
    4f58:	c43e                	sw	a5,8(sp)
    4f5a:	04714783          	lbu	a5,71(sp)
    4f5e:	fa878793          	addi	a5,a5,-88
    4f62:	0017b793          	seqz	a5,a5
    4f66:	46a2                	lw	a3,8(sp)
    4f68:	4301                	li	t1,0
    4f6a:	ce81                	beqz	a3,4f82 <__v_printf+0x416>
    4f6c:	03000693          	li	a3,48
    4f70:	04d106a3          	sb	a3,77(sp)
    4f74:	04714683          	lbu	a3,71(sp)
    4f78:	4309                	li	t1,2
    4f7a:	04d10723          	sb	a3,78(sp)
    4f7e:	4689                	li	a3,2
    4f80:	c436                	sw	a3,8(sp)
    4f82:	46b2                	lw	a3,12(sp)
    4f84:	4602                	lw	a2,0(sp)
    4f86:	00c6f363          	bgeu	a3,a2,4f8c <__v_printf+0x420>
    4f8a:	c632                	sw	a2,12(sp)
    4f8c:	4541                	li	a0,16
    4f8e:	4281                	li	t0,0
    4f90:	04d10693          	addi	a3,sp,77
    4f94:	c4b6                	sw	a3,72(sp)
    4f96:	0ae05a63          	blez	a4,504a <__v_printf+0x4de>
    4f9a:	4685                	li	a3,1
    4f9c:	08d70c63          	beq	a4,a3,5034 <__v_printf+0x4c8>
    4fa0:	00840393          	addi	t2,s0,8
    4fa4:	4010                	lw	a2,0(s0)
    4fa6:	4054                	lw	a3,4(s0)
    4fa8:	4581                	li	a1,0
    4faa:	08028c63          	beqz	t0,5042 <__v_printf+0x4d6>
    4fae:	0006da63          	bgez	a3,4fc2 <__v_printf+0x456>
    4fb2:	40c00633          	neg	a2,a2
    4fb6:	00c03733          	snez	a4,a2
    4fba:	40d006b3          	neg	a3,a3
    4fbe:	8e99                	sub	a3,a3,a4
    4fc0:	4289                	li	t0,2
    4fc2:	872a                	mv	a4,a0
    4fc4:	04d10513          	addi	a0,sp,77
    4fc8:	951a                	add	a0,a0,t1
    4fca:	07b00593          	li	a1,123
    4fce:	da1e                	sw	t2,52(sp)
    4fd0:	d416                	sw	t0,40(sp)
    4fd2:	d21a                	sw	t1,36(sp)
    4fd4:	91bff0ef          	jal	ra,48ee <__lltostr>
    4fd8:	53d2                	lw	t2,52(sp)
    4fda:	5312                	lw	t1,36(sp)
    4fdc:	52a2                	lw	t0,40(sp)
    4fde:	841e                	mv	s0,t2
    4fe0:	4752                	lw	a4,20(sp)
    4fe2:	47a6                	lw	a5,72(sp)
    4fe4:	cb5d                	beqz	a4,509a <__v_printf+0x52e>
    4fe6:	4705                	li	a4,1
    4fe8:	0ae51963          	bne	a0,a4,509a <__v_printf+0x52e>
    4fec:	00678733          	add	a4,a5,t1
    4ff0:	00074683          	lbu	a3,0(a4)
    4ff4:	03000713          	li	a4,48
    4ff8:	0ae69163          	bne	a3,a4,509a <__v_printf+0x52e>
    4ffc:	4702                	lw	a4,0(sp)
    4ffe:	c345                	beqz	a4,509e <__v_printf+0x532>
    5000:	4722                	lw	a4,8(sp)
    5002:	c319                	beqz	a4,5008 <__v_printf+0x49c>
    5004:	c402                	sw	zero,8(sp)
    5006:	4301                	li	t1,0
    5008:	4709                	li	a4,2
    500a:	08e29d63          	bne	t0,a4,50a4 <__v_printf+0x538>
    500e:	fff78713          	addi	a4,a5,-1
    5012:	c4ba                	sw	a4,72(sp)
    5014:	02d00713          	li	a4,45
    5018:	fee78fa3          	sb	a4,-1(a5)
    501c:	0305                	addi	t1,t1,1
    501e:	bd01                	j	4e2e <__v_printf+0x2c2>
    5020:	4781                	li	a5,0
    5022:	b791                	j	4f66 <__v_printf+0x3fa>
    5024:	4509                	li	a0,2
    5026:	4781                	li	a5,0
    5028:	4281                	li	t0,0
    502a:	b9c9                	j	4cfc <__v_printf+0x190>
    502c:	4781                	li	a5,0
    502e:	4281                	li	t0,0
    5030:	4521                	li	a0,8
    5032:	b1e9                	j	4cfc <__v_printf+0x190>
    5034:	00440393          	addi	t2,s0,4
    5038:	400c                	lw	a1,0(s0)
    503a:	00029d63          	bnez	t0,5054 <__v_printf+0x4e8>
    503e:	4601                	li	a2,0
    5040:	4681                	li	a3,0
    5042:	4405                	li	s0,1
    5044:	f6e44fe3          	blt	s0,a4,4fc2 <__v_printf+0x456>
    5048:	a01d                	j	506e <__v_printf+0x502>
    504a:	00440393          	addi	t2,s0,4
    504e:	400c                	lw	a1,0(s0)
    5050:	00028863          	beqz	t0,5060 <__v_printf+0x4f4>
    5054:	4285                	li	t0,1
    5056:	0005d563          	bgez	a1,5060 <__v_printf+0x4f4>
    505a:	40b005b3          	neg	a1,a1
    505e:	4289                	li	t0,2
    5060:	fc075fe3          	bgez	a4,503e <__v_printf+0x4d2>
    5064:	56fd                	li	a3,-1
    5066:	02d70763          	beq	a4,a3,5094 <__v_printf+0x528>
    506a:	0ff5f593          	andi	a1,a1,255
    506e:	873e                	mv	a4,a5
    5070:	04d10793          	addi	a5,sp,77
    5074:	86aa                	mv	a3,a0
    5076:	862e                	mv	a2,a1
    5078:	00678533          	add	a0,a5,t1
    507c:	07b00593          	li	a1,123
    5080:	da1e                	sw	t2,52(sp)
    5082:	d416                	sw	t0,40(sp)
    5084:	d21a                	sw	t1,36(sp)
    5086:	9cfff0ef          	jal	ra,4a54 <__ltostr>
    508a:	53d2                	lw	t2,52(sp)
    508c:	52a2                	lw	t0,40(sp)
    508e:	5312                	lw	t1,36(sp)
    5090:	841e                	mv	s0,t2
    5092:	b7b9                	j	4fe0 <__v_printf+0x474>
    5094:	05c2                	slli	a1,a1,0x10
    5096:	81c1                	srli	a1,a1,0x10
    5098:	bfd9                	j	506e <__v_printf+0x502>
    509a:	932a                	add	t1,t1,a0
    509c:	b7b5                	j	5008 <__v_printf+0x49c>
    509e:	4301                	li	t1,0
    50a0:	c402                	sw	zero,8(sp)
    50a2:	b79d                	j	5008 <__v_printf+0x49c>
    50a4:	d80285e3          	beqz	t0,4e2e <__v_printf+0x2c2>
    50a8:	4772                	lw	a4,28(sp)
    50aa:	ef19                	bnez	a4,50c8 <__v_printf+0x55c>
    50ac:	5732                	lw	a4,44(sp)
    50ae:	4281                	li	t0,0
    50b0:	d6070fe3          	beqz	a4,4e2e <__v_printf+0x2c2>
    50b4:	02000713          	li	a4,32
    50b8:	fff78693          	addi	a3,a5,-1
    50bc:	c4b6                	sw	a3,72(sp)
    50be:	fee78fa3          	sb	a4,-1(a5)
    50c2:	0305                	addi	t1,t1,1
    50c4:	4285                	li	t0,1
    50c6:	b3a5                	j	4e2e <__v_printf+0x2c2>
    50c8:	02b00713          	li	a4,43
    50cc:	b7f5                	j	50b8 <__v_printf+0x54c>
    50ce:	00840793          	addi	a5,s0,8
    50d2:	da3e                	sw	a5,52(sp)
    50d4:	401c                	lw	a5,0(s0)
    50d6:	d23e                	sw	a5,36(sp)
    50d8:	405c                	lw	a5,4(s0)
    50da:	d43e                	sw	a5,40(sp)
    50dc:	04d10793          	addi	a5,sp,77
    50e0:	c4be                	sw	a5,72(sp)
    50e2:	47b2                	lw	a5,12(sp)
    50e4:	e399                	bnez	a5,50ea <__v_printf+0x57e>
    50e6:	4785                	li	a5,1
    50e8:	c63e                	sw	a5,12(sp)
    50ea:	47d2                	lw	a5,20(sp)
    50ec:	e399                	bnez	a5,50f2 <__v_printf+0x586>
    50ee:	4799                	li	a5,6
    50f0:	c03e                	sw	a5,0(sp)
    50f2:	42f2                	lw	t0,28(sp)
    50f4:	00029e63          	bnez	t0,5110 <__v_printf+0x5a4>
    50f8:	5712                	lw	a4,36(sp)
    50fa:	57a2                	lw	a5,40(sp)
    50fc:	4601                	li	a2,0
    50fe:	4681                	li	a3,0
    5100:	853a                	mv	a0,a4
    5102:	85be                	mv	a1,a5
    5104:	dc1a                	sw	t1,56(sp)
    5106:	c68fc0ef          	jal	ra,156e <__ledf2>
    510a:	5362                	lw	t1,56(sp)
    510c:	01f55293          	srli	t0,a0,0x1f
    5110:	5412                	lw	s0,36(sp)
    5112:	53a2                	lw	t2,40(sp)
    5114:	4782                	lw	a5,0(sp)
    5116:	4732                	lw	a4,12(sp)
    5118:	07f00693          	li	a3,127
    511c:	04d10613          	addi	a2,sp,77
    5120:	8522                	mv	a0,s0
    5122:	859e                	mv	a1,t2
    5124:	c096                	sw	t0,64(sp)
    5126:	dc1a                	sw	t1,56(sp)
    5128:	b9cff0ef          	jal	ra,44c4 <__dtostr>
    512c:	47d2                	lw	a5,20(sp)
    512e:	de2a                	sw	a0,60(sp)
    5130:	5362                	lw	t1,56(sp)
    5132:	4286                	lw	t0,64(sp)
    5134:	cb95                	beqz	a5,5168 <__v_printf+0x5fc>
    5136:	4426                	lw	s0,72(sp)
    5138:	02e00593          	li	a1,46
    513c:	dc16                	sw	t0,56(sp)
    513e:	8522                	mv	a0,s0
    5140:	ca1a                	sw	t1,20(sp)
    5142:	b18fd0ef          	jal	ra,245a <strchr>
    5146:	4352                	lw	t1,20(sp)
    5148:	52e2                	lw	t0,56(sp)
    514a:	57f2                	lw	a5,60(sp)
    514c:	cd49                	beqz	a0,51e6 <__v_printf+0x67a>
    514e:	4782                	lw	a5,0(sp)
    5150:	e399                	bnez	a5,5156 <__v_printf+0x5ea>
    5152:	47a2                	lw	a5,8(sp)
    5154:	cb81                	beqz	a5,5164 <__v_printf+0x5f8>
    5156:	0505                	addi	a0,a0,1
    5158:	4782                	lw	a5,0(sp)
    515a:	c789                	beqz	a5,5164 <__v_printf+0x5f8>
    515c:	0505                	addi	a0,a0,1
    515e:	00054783          	lbu	a5,0(a0)
    5162:	efb5                	bnez	a5,51de <__v_printf+0x672>
    5164:	00050023          	sb	zero,0(a0)
    5168:	06700793          	li	a5,103
    516c:	04f31a63          	bne	t1,a5,51c0 <__v_printf+0x654>
    5170:	4526                	lw	a0,72(sp)
    5172:	02e00593          	li	a1,46
    5176:	c416                	sw	t0,8(sp)
    5178:	ae2fd0ef          	jal	ra,245a <strchr>
    517c:	842a                	mv	s0,a0
    517e:	42a2                	lw	t0,8(sp)
    5180:	c121                	beqz	a0,51c0 <__v_printf+0x654>
    5182:	06500593          	li	a1,101
    5186:	ad4fd0ef          	jal	ra,245a <strchr>
    518a:	42a2                	lw	t0,8(sp)
    518c:	85aa                	mv	a1,a0
    518e:	00044783          	lbu	a5,0(s0)
    5192:	e7b5                	bnez	a5,51fe <__v_printf+0x692>
    5194:	c191                	beqz	a1,5198 <__v_printf+0x62c>
    5196:	842e                	mv	s0,a1
    5198:	03000693          	li	a3,48
    519c:	fff44703          	lbu	a4,-1(s0)
    51a0:	fff40513          	addi	a0,s0,-1
    51a4:	04d70f63          	beq	a4,a3,5202 <__v_printf+0x696>
    51a8:	02e00693          	li	a3,46
    51ac:	00d70363          	beq	a4,a3,51b2 <__v_printf+0x646>
    51b0:	8522                	mv	a0,s0
    51b2:	00050023          	sb	zero,0(a0)
    51b6:	c589                	beqz	a1,51c0 <__v_printf+0x654>
    51b8:	c416                	sw	t0,8(sp)
    51ba:	b96fd0ef          	jal	ra,2550 <strcpy>
    51be:	42a2                	lw	t0,8(sp)
    51c0:	47f2                	lw	a5,28(sp)
    51c2:	10079263          	bnez	a5,52c6 <__v_printf+0x75a>
    51c6:	57b2                	lw	a5,44(sp)
    51c8:	e3e5                	bnez	a5,52a8 <__v_printf+0x73c>
    51ca:	4526                	lw	a0,72(sp)
    51cc:	ce16                	sw	t0,28(sp)
    51ce:	f7efd0ef          	jal	ra,294c <strlen>
    51d2:	832a                	mv	t1,a0
    51d4:	5452                	lw	s0,52(sp)
    51d6:	ca02                	sw	zero,20(sp)
    51d8:	c402                	sw	zero,8(sp)
    51da:	42f2                	lw	t0,28(sp)
    51dc:	b989                	j	4e2e <__v_printf+0x2c2>
    51de:	4782                	lw	a5,0(sp)
    51e0:	17fd                	addi	a5,a5,-1
    51e2:	c03e                	sw	a5,0(sp)
    51e4:	bf95                	j	5158 <__v_printf+0x5ec>
    51e6:	4722                	lw	a4,8(sp)
    51e8:	d341                	beqz	a4,5168 <__v_printf+0x5fc>
    51ea:	943e                	add	s0,s0,a5
    51ec:	02e00713          	li	a4,46
    51f0:	00e40023          	sb	a4,0(s0)
    51f4:	4526                	lw	a0,72(sp)
    51f6:	953e                	add	a0,a0,a5
    51f8:	000500a3          	sb	zero,1(a0)
    51fc:	b7b5                	j	5168 <__v_printf+0x5fc>
    51fe:	0405                	addi	s0,s0,1
    5200:	b779                	j	518e <__v_printf+0x622>
    5202:	842a                	mv	s0,a0
    5204:	bf61                	j	519c <__v_printf+0x630>
    5206:	57fd                	li	a5,-1
    5208:	c23e                	sw	a5,4(sp)
    520a:	40de                	lw	ra,212(sp)
    520c:	444e                	lw	s0,208(sp)
    520e:	4512                	lw	a0,4(sp)
    5210:	44be                	lw	s1,204(sp)
    5212:	0d810113          	addi	sp,sp,216
    5216:	8082                	ret
    5218:	5782                	lw	a5,32(sp)
    521a:	c6079ee3          	bnez	a5,4e96 <__v_printf+0x32a>
    521e:	4781                	li	a5,0
    5220:	4752                	lw	a4,20(sp)
    5222:	cc0700e3          	beqz	a4,4ee2 <__v_printf+0x376>
    5226:	4582                	lw	a1,0(sp)
    5228:	0065f363          	bgeu	a1,t1,522e <__v_printf+0x6c2>
    522c:	859a                	mv	a1,t1
    522e:	ca3e                	sw	a5,20(sp)
    5230:	47b2                	lw	a5,12(sp)
    5232:	02000613          	li	a2,32
    5236:	8526                	mv	a0,s1
    5238:	40b785b3          	sub	a1,a5,a1
    523c:	c41a                	sw	t1,8(sp)
    523e:	cc36                	sw	a3,24(sp)
    5240:	8cdff0ef          	jal	ra,4b0c <write_pad>
    5244:	4792                	lw	a5,4(sp)
    5246:	4322                	lw	t1,8(sp)
    5248:	00f50733          	add	a4,a0,a5
    524c:	47d2                	lw	a5,20(sp)
    524e:	cf99                	beqz	a5,526c <__v_printf+0x700>
    5250:	46e2                	lw	a3,24(sp)
    5252:	0044a383          	lw	t2,4(s1)
    5256:	4090                	lw	a2,0(s1)
    5258:	85be                	mv	a1,a5
    525a:	8536                	mv	a0,a3
    525c:	c61a                	sw	t1,12(sp)
    525e:	c43a                	sw	a4,8(sp)
    5260:	c23e                	sw	a5,4(sp)
    5262:	9382                	jalr	t2
    5264:	4792                	lw	a5,4(sp)
    5266:	4722                	lw	a4,8(sp)
    5268:	4332                	lw	t1,12(sp)
    526a:	973e                	add	a4,a4,a5
    526c:	4782                	lw	a5,0(sp)
    526e:	03000613          	li	a2,48
    5272:	8526                	mv	a0,s1
    5274:	406785b3          	sub	a1,a5,t1
    5278:	c23a                	sw	a4,4(sp)
    527a:	c01a                	sw	t1,0(sp)
    527c:	891ff0ef          	jal	ra,4b0c <write_pad>
    5280:	4712                	lw	a4,4(sp)
    5282:	4302                	lw	t1,0(sp)
    5284:	972a                	add	a4,a4,a0
    5286:	40dc                	lw	a5,4(s1)
    5288:	4090                	lw	a2,0(s1)
    528a:	4526                	lw	a0,72(sp)
    528c:	859a                	mv	a1,t1
    528e:	c23a                	sw	a4,4(sp)
    5290:	c01a                	sw	t1,0(sp)
    5292:	9782                	jalr	a5
    5294:	4302                	lw	t1,0(sp)
    5296:	4712                	lw	a4,4(sp)
    5298:	006707b3          	add	a5,a4,t1
    529c:	bac9                	j	4c6e <__v_printf+0x102>
    529e:	47a2                	lw	a5,8(sp)
    52a0:	bc0793e3          	bnez	a5,4e66 <__v_printf+0x2fa>
    52a4:	4785                	li	a5,1
    52a6:	b6c9                	j	4e68 <__v_printf+0x2fc>
    52a8:	57a2                	lw	a5,40(sp)
    52aa:	5712                	lw	a4,36(sp)
    52ac:	4601                	li	a2,0
    52ae:	85be                	mv	a1,a5
    52b0:	4681                	li	a3,0
    52b2:	853a                	mv	a0,a4
    52b4:	c416                	sw	t0,8(sp)
    52b6:	a02fc0ef          	jal	ra,14b8 <__gedf2>
    52ba:	02000793          	li	a5,32
    52be:	42a2                	lw	t0,8(sp)
    52c0:	02055163          	bgez	a0,52e2 <__v_printf+0x776>
    52c4:	b719                	j	51ca <__v_printf+0x65e>
    52c6:	5712                	lw	a4,36(sp)
    52c8:	57a2                	lw	a5,40(sp)
    52ca:	4601                	li	a2,0
    52cc:	4681                	li	a3,0
    52ce:	853a                	mv	a0,a4
    52d0:	85be                	mv	a1,a5
    52d2:	c416                	sw	t0,8(sp)
    52d4:	9e4fc0ef          	jal	ra,14b8 <__gedf2>
    52d8:	42a2                	lw	t0,8(sp)
    52da:	ee0548e3          	bltz	a0,51ca <__v_printf+0x65e>
    52de:	02b00793          	li	a5,43
    52e2:	4726                	lw	a4,72(sp)
    52e4:	fff70693          	addi	a3,a4,-1
    52e8:	c4b6                	sw	a3,72(sp)
    52ea:	fef70fa3          	sb	a5,-1(a4)
    52ee:	bdf1                	j	51ca <__v_printf+0x65e>
    52f0:	8a071fe3          	bnez	a4,4bae <__v_printf+0x42>
    52f4:	47c2                	lw	a5,16(sp)
    52f6:	c83e                	sw	a5,16(sp)
    52f8:	b071                	j	4b84 <__v_printf+0x18>
    52fa:	0000                	unimp
    52fc:	0000                	unimp
	...
