
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
      24:	53c10113          	addi	sp,sp,1340 # 2000155c <g_top_irqstack>

    /* Load data section */
    la      a0, __erodata
      28:	00009517          	auipc	a0,0x9
      2c:	86850513          	addi	a0,a0,-1944 # 8890 <__ctor_end__>
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
      66:	485030ef          	jal	ra,3cea <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal     board_init
      6a:	3cd020ef          	jal	ra,2c36 <board_init>
#endif

    jal     main
      6e:	00c040ef          	jal	ra,407a <main>

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
      b0:	fd828293          	addi	t0,t0,-40 # 20002084 <g_irqvector>
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
      e2:	000022b7          	lui	t0,0x2
      e6:	88028293          	addi	t0,t0,-1920 # 1880 <__muldf3+0x25e>
    csrs    mstatus, t0
      ea:	3002a073          	csrs	mstatus,t0
    csrw    mcause, a1
      ee:	34259073          	csrw	mcause,a1
    lw      t0, 44(sp)
      f2:	52b2                	lw	t0,44(sp)
    csrw    mepc, t0
      f4:	34129073          	csrw	mepc,t0
    lw      ra, 0(sp)
      f8:	4082                	lw	ra,0(sp)
    lw      t0, 4(sp)
      fa:	4292                	lw	t0,4(sp)
    lw      t1, 8(sp)
      fc:	4322                	lw	t1,8(sp)
    lw      t2, 12(sp)
      fe:	43b2                	lw	t2,12(sp)
    lw      a0, 16(sp)
     100:	4542                	lw	a0,16(sp)
    lw      a1, 20(sp)
     102:	45d2                	lw	a1,20(sp)
    lw      a2, 24(sp)
     104:	4662                	lw	a2,24(sp)
    lw      a3, 28(sp)
     106:	46f2                	lw	a3,28(sp)
    lw      a4, 32(sp)
     108:	5702                	lw	a4,32(sp)
    lw      a5, 36(sp)
     10a:	5792                	lw	a5,36(sp)

    addi    sp, sp, 48
     10c:	6145                	addi	sp,sp,48
    mret
     10e:	30200073          	mret
     112:	0001                	nop

00000114 <trap>:
    .align  2
    .global trap
    .type   trap, %function
trap:
    /* Check for interrupt */
    addi    sp, sp, -4
     114:	1171                	addi	sp,sp,-4
    sw      t0, 0x0(sp)
     116:	c016                	sw	t0,0(sp)
    csrr    t0, mcause
     118:	342022f3          	csrr	t0,mcause

    blt     t0, x0, .Lirq
     11c:	0602c463          	bltz	t0,184 <trap+0x70>

    addi    sp, sp, 4
     120:	0111                	addi	sp,sp,4

    la      t0, g_trap_sp
     122:	20001297          	auipc	t0,0x20001
     126:	63a28293          	addi	t0,t0,1594 # 2000175c <g_trap_sp>
    addi    t0, t0, -68
     12a:	fbc28293          	addi	t0,t0,-68
    sw      x1, 0(t0)
     12e:	0012a023          	sw	ra,0(t0)
    sw      x2, 4(t0)
     132:	0022a223          	sw	sp,4(t0)
    sw      x3, 8(t0)
     136:	0032a423          	sw	gp,8(t0)
    sw      x4, 12(t0)
     13a:	0042a623          	sw	tp,12(t0)
    sw      x6, 20(t0)
     13e:	0062aa23          	sw	t1,20(t0)
    sw      x7, 24(t0)
     142:	0072ac23          	sw	t2,24(t0)
    sw      x8, 28(t0)
     146:	0082ae23          	sw	s0,28(t0)
    sw      x9, 32(t0)
     14a:	0292a023          	sw	s1,32(t0)
    sw      x10, 36(t0)
     14e:	02a2a223          	sw	a0,36(t0)
    sw      x11, 40(t0)
     152:	02b2a423          	sw	a1,40(t0)
    sw      x12, 44(t0)
     156:	02c2a623          	sw	a2,44(t0)
    sw      x13, 48(t0)
     15a:	02d2a823          	sw	a3,48(t0)
    sw      x14, 52(t0)
     15e:	02e2aa23          	sw	a4,52(t0)
    sw      x15, 56(t0)
     162:	02f2ac23          	sw	a5,56(t0)
    csrr    a0, mepc
     166:	34102573          	csrr	a0,mepc
    sw      a0, 60(t0)
     16a:	02a2ae23          	sw	a0,60(t0)
    csrr    a0, mstatus
     16e:	30002573          	csrr	a0,mstatus
    sw      a0, 64(t0)
     172:	04a2a023          	sw	a0,64(t0)

    mv      a0, t0
     176:	8516                	mv	a0,t0
    lw      t0, -4(sp)
     178:	ffc12283          	lw	t0,-4(sp)
    mv      sp, a0
     17c:	812a                	mv	sp,a0
    sw      t0, 16(sp)
     17e:	c816                	sw	t0,16(sp)

    jal     trap_c
     180:	3c9030ef          	jal	ra,3d48 <trap_c>


.Lirq:
    lw      t0, 0x0(sp)
     184:	4282                	lw	t0,0(sp)
    addi    sp, sp, 4
     186:	0111                	addi	sp,sp,4
    j       Default_IRQHandler
     188:	ef9ff06f          	j	80 <Default_IRQHandler>
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
     1c0:	bf91                	j	114 <trap>
	...

000001f4 <__udivdi3>:
     1f4:	1161                	addi	sp,sp,-8
     1f6:	c222                	sw	s0,4(sp)
     1f8:	c026                	sw	s1,0(sp)
     1fa:	82aa                	mv	t0,a0
     1fc:	87ae                	mv	a5,a1
     1fe:	20069e63          	bnez	a3,41a <__min_heap_size+0x21a>
     202:	85b6                	mv	a1,a3
     204:	8332                	mv	t1,a2
     206:	83aa                	mv	t2,a0
     208:	00007697          	auipc	a3,0x7
     20c:	0b068693          	addi	a3,a3,176 # 72b8 <__clz_tab>
     210:	0cc7f263          	bgeu	a5,a2,2d4 <__min_heap_size+0xd4>
     214:	6741                	lui	a4,0x10
     216:	853e                	mv	a0,a5
     218:	0ae67763          	bgeu	a2,a4,2c6 <__min_heap_size+0xc6>
     21c:	0ff00713          	li	a4,255
     220:	00c73733          	sltu	a4,a4,a2
     224:	070e                	slli	a4,a4,0x3
     226:	00e655b3          	srl	a1,a2,a4
     22a:	96ae                	add	a3,a3,a1
     22c:	0006c683          	lbu	a3,0(a3)
     230:	9736                	add	a4,a4,a3
     232:	02000693          	li	a3,32
     236:	40e68433          	sub	s0,a3,a4
     23a:	00e68c63          	beq	a3,a4,252 <__min_heap_size+0x52>
     23e:	008796b3          	sll	a3,a5,s0
     242:	00e2d733          	srl	a4,t0,a4
     246:	00861333          	sll	t1,a2,s0
     24a:	00d76533          	or	a0,a4,a3
     24e:	008293b3          	sll	t2,t0,s0
     252:	01035593          	srli	a1,t1,0x10
     256:	02b556b3          	divu	a3,a0,a1
     25a:	01031613          	slli	a2,t1,0x10
     25e:	8241                	srli	a2,a2,0x10
     260:	0103d793          	srli	a5,t2,0x10
     264:	02b57733          	remu	a4,a0,a1
     268:	8536                	mv	a0,a3
     26a:	02d602b3          	mul	t0,a2,a3
     26e:	0742                	slli	a4,a4,0x10
     270:	8fd9                	or	a5,a5,a4
     272:	0057fc63          	bgeu	a5,t0,28a <__min_heap_size+0x8a>
     276:	979a                	add	a5,a5,t1
     278:	fff68513          	addi	a0,a3,-1
     27c:	0067e763          	bltu	a5,t1,28a <__min_heap_size+0x8a>
     280:	0057f563          	bgeu	a5,t0,28a <__min_heap_size+0x8a>
     284:	ffe68513          	addi	a0,a3,-2
     288:	979a                	add	a5,a5,t1
     28a:	405787b3          	sub	a5,a5,t0
     28e:	02b7f733          	remu	a4,a5,a1
     292:	03c2                	slli	t2,t2,0x10
     294:	0103d393          	srli	t2,t2,0x10
     298:	02b7d7b3          	divu	a5,a5,a1
     29c:	0742                	slli	a4,a4,0x10
     29e:	007763b3          	or	t2,a4,t2
     2a2:	02f60633          	mul	a2,a2,a5
     2a6:	873e                	mv	a4,a5
     2a8:	00c3fb63          	bgeu	t2,a2,2be <__min_heap_size+0xbe>
     2ac:	939a                	add	t2,t2,t1
     2ae:	fff78713          	addi	a4,a5,-1
     2b2:	0063e663          	bltu	t2,t1,2be <__min_heap_size+0xbe>
     2b6:	00c3f463          	bgeu	t2,a2,2be <__min_heap_size+0xbe>
     2ba:	ffe78713          	addi	a4,a5,-2
     2be:	0542                	slli	a0,a0,0x10
     2c0:	8d59                	or	a0,a0,a4
     2c2:	4581                	li	a1,0
     2c4:	a855                	j	378 <__min_heap_size+0x178>
     2c6:	010005b7          	lui	a1,0x1000
     2ca:	4741                	li	a4,16
     2cc:	f4b66de3          	bltu	a2,a1,226 <__min_heap_size+0x26>
     2d0:	4761                	li	a4,24
     2d2:	bf91                	j	226 <__min_heap_size+0x26>
     2d4:	e601                	bnez	a2,2dc <__min_heap_size+0xdc>
     2d6:	4705                	li	a4,1
     2d8:	02c75333          	divu	t1,a4,a2
     2dc:	6741                	lui	a4,0x10
     2de:	0ae37163          	bgeu	t1,a4,380 <__min_heap_size+0x180>
     2e2:	0ff00713          	li	a4,255
     2e6:	00677363          	bgeu	a4,t1,2ec <__min_heap_size+0xec>
     2ea:	45a1                	li	a1,8
     2ec:	00b35733          	srl	a4,t1,a1
     2f0:	96ba                	add	a3,a3,a4
     2f2:	0006c703          	lbu	a4,0(a3)
     2f6:	02000693          	li	a3,32
     2fa:	972e                	add	a4,a4,a1
     2fc:	40e68533          	sub	a0,a3,a4
     300:	08e69763          	bne	a3,a4,38e <__min_heap_size+0x18e>
     304:	406787b3          	sub	a5,a5,t1
     308:	4585                	li	a1,1
     30a:	01035293          	srli	t0,t1,0x10
     30e:	01031613          	slli	a2,t1,0x10
     312:	8241                	srli	a2,a2,0x10
     314:	0103d713          	srli	a4,t2,0x10
     318:	0257f6b3          	remu	a3,a5,t0
     31c:	0257d7b3          	divu	a5,a5,t0
     320:	06c2                	slli	a3,a3,0x10
     322:	8f55                	or	a4,a4,a3
     324:	02f60433          	mul	s0,a2,a5
     328:	853e                	mv	a0,a5
     32a:	00877c63          	bgeu	a4,s0,342 <__min_heap_size+0x142>
     32e:	971a                	add	a4,a4,t1
     330:	fff78513          	addi	a0,a5,-1
     334:	00676763          	bltu	a4,t1,342 <__min_heap_size+0x142>
     338:	00877563          	bgeu	a4,s0,342 <__min_heap_size+0x142>
     33c:	ffe78513          	addi	a0,a5,-2
     340:	971a                	add	a4,a4,t1
     342:	8f01                	sub	a4,a4,s0
     344:	025777b3          	remu	a5,a4,t0
     348:	03c2                	slli	t2,t2,0x10
     34a:	0103d393          	srli	t2,t2,0x10
     34e:	02575733          	divu	a4,a4,t0
     352:	07c2                	slli	a5,a5,0x10
     354:	0077e3b3          	or	t2,a5,t2
     358:	02e60633          	mul	a2,a2,a4
     35c:	87ba                	mv	a5,a4
     35e:	00c3fb63          	bgeu	t2,a2,374 <__min_heap_size+0x174>
     362:	939a                	add	t2,t2,t1
     364:	fff70793          	addi	a5,a4,-1 # ffff <__ctor_end__+0x776f>
     368:	0063e663          	bltu	t2,t1,374 <__min_heap_size+0x174>
     36c:	00c3f463          	bgeu	t2,a2,374 <__min_heap_size+0x174>
     370:	ffe70793          	addi	a5,a4,-2
     374:	0542                	slli	a0,a0,0x10
     376:	8d5d                	or	a0,a0,a5
     378:	4412                	lw	s0,4(sp)
     37a:	4482                	lw	s1,0(sp)
     37c:	0121                	addi	sp,sp,8
     37e:	8082                	ret
     380:	01000737          	lui	a4,0x1000
     384:	45c1                	li	a1,16
     386:	f6e363e3          	bltu	t1,a4,2ec <__min_heap_size+0xec>
     38a:	45e1                	li	a1,24
     38c:	b785                	j	2ec <__min_heap_size+0xec>
     38e:	00a31333          	sll	t1,t1,a0
     392:	00e7d6b3          	srl	a3,a5,a4
     396:	00a293b3          	sll	t2,t0,a0
     39a:	00a797b3          	sll	a5,a5,a0
     39e:	01035513          	srli	a0,t1,0x10
     3a2:	00e2d733          	srl	a4,t0,a4
     3a6:	02a6d2b3          	divu	t0,a3,a0
     3aa:	00f76633          	or	a2,a4,a5
     3ae:	01031793          	slli	a5,t1,0x10
     3b2:	83c1                	srli	a5,a5,0x10
     3b4:	01065593          	srli	a1,a2,0x10
     3b8:	02a6f733          	remu	a4,a3,a0
     3bc:	025786b3          	mul	a3,a5,t0
     3c0:	0742                	slli	a4,a4,0x10
     3c2:	8f4d                	or	a4,a4,a1
     3c4:	8596                	mv	a1,t0
     3c6:	00d77c63          	bgeu	a4,a3,3de <__min_heap_size+0x1de>
     3ca:	971a                	add	a4,a4,t1
     3cc:	fff28593          	addi	a1,t0,-1
     3d0:	00676763          	bltu	a4,t1,3de <__min_heap_size+0x1de>
     3d4:	00d77563          	bgeu	a4,a3,3de <__min_heap_size+0x1de>
     3d8:	ffe28593          	addi	a1,t0,-2
     3dc:	971a                	add	a4,a4,t1
     3de:	40d706b3          	sub	a3,a4,a3
     3e2:	02a6f733          	remu	a4,a3,a0
     3e6:	02a6d6b3          	divu	a3,a3,a0
     3ea:	0742                	slli	a4,a4,0x10
     3ec:	02d78533          	mul	a0,a5,a3
     3f0:	01061793          	slli	a5,a2,0x10
     3f4:	83c1                	srli	a5,a5,0x10
     3f6:	8fd9                	or	a5,a5,a4
     3f8:	8736                	mv	a4,a3
     3fa:	00a7fc63          	bgeu	a5,a0,412 <__min_heap_size+0x212>
     3fe:	979a                	add	a5,a5,t1
     400:	fff68713          	addi	a4,a3,-1
     404:	0067e763          	bltu	a5,t1,412 <__min_heap_size+0x212>
     408:	00a7f563          	bgeu	a5,a0,412 <__min_heap_size+0x212>
     40c:	ffe68713          	addi	a4,a3,-2
     410:	979a                	add	a5,a5,t1
     412:	05c2                	slli	a1,a1,0x10
     414:	8f89                	sub	a5,a5,a0
     416:	8dd9                	or	a1,a1,a4
     418:	bdcd                	j	30a <__min_heap_size+0x10a>
     41a:	12d5ef63          	bltu	a1,a3,558 <__min_heap_size+0x358>
     41e:	6741                	lui	a4,0x10
     420:	02e6ff63          	bgeu	a3,a4,45e <__min_heap_size+0x25e>
     424:	0ff00713          	li	a4,255
     428:	00d73733          	sltu	a4,a4,a3
     42c:	070e                	slli	a4,a4,0x3
     42e:	00e6d533          	srl	a0,a3,a4
     432:	00007597          	auipc	a1,0x7
     436:	e8658593          	addi	a1,a1,-378 # 72b8 <__clz_tab>
     43a:	95aa                	add	a1,a1,a0
     43c:	0005c583          	lbu	a1,0(a1)
     440:	02000513          	li	a0,32
     444:	972e                	add	a4,a4,a1
     446:	40e505b3          	sub	a1,a0,a4
     44a:	02e51163          	bne	a0,a4,46c <__min_heap_size+0x26c>
     44e:	4505                	li	a0,1
     450:	f2f6e4e3          	bltu	a3,a5,378 <__min_heap_size+0x178>
     454:	00c2b633          	sltu	a2,t0,a2
     458:	00164513          	xori	a0,a2,1
     45c:	bf31                	j	378 <__min_heap_size+0x178>
     45e:	010005b7          	lui	a1,0x1000
     462:	4741                	li	a4,16
     464:	fcb6e5e3          	bltu	a3,a1,42e <__min_heap_size+0x22e>
     468:	4761                	li	a4,24
     46a:	b7d1                	j	42e <__min_heap_size+0x22e>
     46c:	00e65333          	srl	t1,a2,a4
     470:	00b696b3          	sll	a3,a3,a1
     474:	00d36333          	or	t1,t1,a3
     478:	00e7d3b3          	srl	t2,a5,a4
     47c:	01035413          	srli	s0,t1,0x10
     480:	0283f6b3          	remu	a3,t2,s0
     484:	01031513          	slli	a0,t1,0x10
     488:	8141                	srli	a0,a0,0x10
     48a:	00e2d733          	srl	a4,t0,a4
     48e:	00b797b3          	sll	a5,a5,a1
     492:	8fd9                	or	a5,a5,a4
     494:	0107d713          	srli	a4,a5,0x10
     498:	00b61633          	sll	a2,a2,a1
     49c:	0283d3b3          	divu	t2,t2,s0
     4a0:	06c2                	slli	a3,a3,0x10
     4a2:	8ed9                	or	a3,a3,a4
     4a4:	027504b3          	mul	s1,a0,t2
     4a8:	871e                	mv	a4,t2
     4aa:	0096fc63          	bgeu	a3,s1,4c2 <__min_heap_size+0x2c2>
     4ae:	969a                	add	a3,a3,t1
     4b0:	fff38713          	addi	a4,t2,-1
     4b4:	0066e763          	bltu	a3,t1,4c2 <__min_heap_size+0x2c2>
     4b8:	0096f563          	bgeu	a3,s1,4c2 <__min_heap_size+0x2c2>
     4bc:	ffe38713          	addi	a4,t2,-2
     4c0:	969a                	add	a3,a3,t1
     4c2:	8e85                	sub	a3,a3,s1
     4c4:	0286f3b3          	remu	t2,a3,s0
     4c8:	07c2                	slli	a5,a5,0x10
     4ca:	83c1                	srli	a5,a5,0x10
     4cc:	0286d6b3          	divu	a3,a3,s0
     4d0:	03c2                	slli	t2,t2,0x10
     4d2:	00f3e7b3          	or	a5,t2,a5
     4d6:	02d50533          	mul	a0,a0,a3
     4da:	83b6                	mv	t2,a3
     4dc:	00a7fc63          	bgeu	a5,a0,4f4 <__min_heap_size+0x2f4>
     4e0:	979a                	add	a5,a5,t1
     4e2:	fff68393          	addi	t2,a3,-1
     4e6:	0067e763          	bltu	a5,t1,4f4 <__min_heap_size+0x2f4>
     4ea:	00a7f563          	bgeu	a5,a0,4f4 <__min_heap_size+0x2f4>
     4ee:	ffe68393          	addi	t2,a3,-2
     4f2:	979a                	add	a5,a5,t1
     4f4:	8f89                	sub	a5,a5,a0
     4f6:	6441                	lui	s0,0x10
     4f8:	01071513          	slli	a0,a4,0x10
     4fc:	00756533          	or	a0,a0,t2
     500:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0x776f>
     504:	00e573b3          	and	t2,a0,a4
     508:	01055693          	srli	a3,a0,0x10
     50c:	8f71                	and	a4,a4,a2
     50e:	8241                	srli	a2,a2,0x10
     510:	02e38333          	mul	t1,t2,a4
     514:	02e68733          	mul	a4,a3,a4
     518:	02c383b3          	mul	t2,t2,a2
     51c:	02c686b3          	mul	a3,a3,a2
     520:	93ba                	add	t2,t2,a4
     522:	01035613          	srli	a2,t1,0x10
     526:	961e                	add	a2,a2,t2
     528:	00e67363          	bgeu	a2,a4,52e <__min_heap_size+0x32e>
     52c:	96a2                	add	a3,a3,s0
     52e:	01065713          	srli	a4,a2,0x10
     532:	96ba                	add	a3,a3,a4
     534:	02d7e063          	bltu	a5,a3,554 <__min_heap_size+0x354>
     538:	d8d795e3          	bne	a5,a3,2c2 <__min_heap_size+0xc2>
     53c:	67c1                	lui	a5,0x10
     53e:	17fd                	addi	a5,a5,-1
     540:	8e7d                	and	a2,a2,a5
     542:	0642                	slli	a2,a2,0x10
     544:	00f37333          	and	t1,t1,a5
     548:	00b292b3          	sll	t0,t0,a1
     54c:	961a                	add	a2,a2,t1
     54e:	4581                	li	a1,0
     550:	e2c2f4e3          	bgeu	t0,a2,378 <__min_heap_size+0x178>
     554:	157d                	addi	a0,a0,-1
     556:	b3b5                	j	2c2 <__min_heap_size+0xc2>
     558:	4581                	li	a1,0
     55a:	4501                	li	a0,0
     55c:	bd31                	j	378 <__min_heap_size+0x178>

0000055e <__umoddi3>:
     55e:	1151                	addi	sp,sp,-12
     560:	c422                	sw	s0,8(sp)
     562:	c226                	sw	s1,4(sp)
     564:	87aa                	mv	a5,a0
     566:	872e                	mv	a4,a1
     568:	1c069a63          	bnez	a3,73c <__umoddi3+0x1de>
     56c:	8336                	mv	t1,a3
     56e:	8432                	mv	s0,a2
     570:	00007697          	auipc	a3,0x7
     574:	d4868693          	addi	a3,a3,-696 # 72b8 <__clz_tab>
     578:	0ac5fa63          	bgeu	a1,a2,62c <__umoddi3+0xce>
     57c:	62c1                	lui	t0,0x10
     57e:	0a567063          	bgeu	a2,t0,61e <__umoddi3+0xc0>
     582:	0ff00293          	li	t0,255
     586:	00c2f363          	bgeu	t0,a2,58c <__umoddi3+0x2e>
     58a:	4321                	li	t1,8
     58c:	006652b3          	srl	t0,a2,t1
     590:	9696                	add	a3,a3,t0
     592:	0006c683          	lbu	a3,0(a3)
     596:	9336                	add	t1,t1,a3
     598:	02000693          	li	a3,32
     59c:	406682b3          	sub	t0,a3,t1
     5a0:	00668c63          	beq	a3,t1,5b8 <__umoddi3+0x5a>
     5a4:	005595b3          	sll	a1,a1,t0
     5a8:	00655333          	srl	t1,a0,t1
     5ac:	00561433          	sll	s0,a2,t0
     5b0:	00b36733          	or	a4,t1,a1
     5b4:	005517b3          	sll	a5,a0,t0
     5b8:	01045393          	srli	t2,s0,0x10
     5bc:	02777633          	remu	a2,a4,t2
     5c0:	01041513          	slli	a0,s0,0x10
     5c4:	8141                	srli	a0,a0,0x10
     5c6:	0107d693          	srli	a3,a5,0x10
     5ca:	02775733          	divu	a4,a4,t2
     5ce:	0642                	slli	a2,a2,0x10
     5d0:	8ed1                	or	a3,a3,a2
     5d2:	02e50733          	mul	a4,a0,a4
     5d6:	00e6f863          	bgeu	a3,a4,5e6 <__umoddi3+0x88>
     5da:	96a2                	add	a3,a3,s0
     5dc:	0086e563          	bltu	a3,s0,5e6 <__umoddi3+0x88>
     5e0:	00e6f363          	bgeu	a3,a4,5e6 <__umoddi3+0x88>
     5e4:	96a2                	add	a3,a3,s0
     5e6:	8e99                	sub	a3,a3,a4
     5e8:	0276f733          	remu	a4,a3,t2
     5ec:	07c2                	slli	a5,a5,0x10
     5ee:	83c1                	srli	a5,a5,0x10
     5f0:	0276d6b3          	divu	a3,a3,t2
     5f4:	02d506b3          	mul	a3,a0,a3
     5f8:	01071513          	slli	a0,a4,0x10
     5fc:	8fc9                	or	a5,a5,a0
     5fe:	00d7f863          	bgeu	a5,a3,60e <__umoddi3+0xb0>
     602:	97a2                	add	a5,a5,s0
     604:	0087e563          	bltu	a5,s0,60e <__umoddi3+0xb0>
     608:	00d7f363          	bgeu	a5,a3,60e <__umoddi3+0xb0>
     60c:	97a2                	add	a5,a5,s0
     60e:	8f95                	sub	a5,a5,a3
     610:	0057d533          	srl	a0,a5,t0
     614:	4581                	li	a1,0
     616:	4422                	lw	s0,8(sp)
     618:	4492                	lw	s1,4(sp)
     61a:	0131                	addi	sp,sp,12
     61c:	8082                	ret
     61e:	010002b7          	lui	t0,0x1000
     622:	4341                	li	t1,16
     624:	f65664e3          	bltu	a2,t0,58c <__umoddi3+0x2e>
     628:	4361                	li	t1,24
     62a:	b78d                	j	58c <__umoddi3+0x2e>
     62c:	e601                	bnez	a2,634 <__umoddi3+0xd6>
     62e:	4705                	li	a4,1
     630:	02c75433          	divu	s0,a4,a2
     634:	6741                	lui	a4,0x10
     636:	08e47163          	bgeu	s0,a4,6b8 <__umoddi3+0x15a>
     63a:	0ff00713          	li	a4,255
     63e:	00877363          	bgeu	a4,s0,644 <__umoddi3+0xe6>
     642:	4321                	li	t1,8
     644:	00645733          	srl	a4,s0,t1
     648:	96ba                	add	a3,a3,a4
     64a:	0006c603          	lbu	a2,0(a3)
     64e:	02000713          	li	a4,32
     652:	9332                	add	t1,t1,a2
     654:	406702b3          	sub	t0,a4,t1
     658:	06671763          	bne	a4,t1,6c6 <__umoddi3+0x168>
     65c:	8d81                	sub	a1,a1,s0
     65e:	01045693          	srli	a3,s0,0x10
     662:	01041513          	slli	a0,s0,0x10
     666:	8141                	srli	a0,a0,0x10
     668:	0107d613          	srli	a2,a5,0x10
     66c:	02d5f733          	remu	a4,a1,a3
     670:	02d5d5b3          	divu	a1,a1,a3
     674:	0742                	slli	a4,a4,0x10
     676:	8f51                	or	a4,a4,a2
     678:	02b505b3          	mul	a1,a0,a1
     67c:	00b77863          	bgeu	a4,a1,68c <__umoddi3+0x12e>
     680:	9722                	add	a4,a4,s0
     682:	00876563          	bltu	a4,s0,68c <__umoddi3+0x12e>
     686:	00b77363          	bgeu	a4,a1,68c <__umoddi3+0x12e>
     68a:	9722                	add	a4,a4,s0
     68c:	40b705b3          	sub	a1,a4,a1
     690:	02d5f733          	remu	a4,a1,a3
     694:	07c2                	slli	a5,a5,0x10
     696:	83c1                	srli	a5,a5,0x10
     698:	02d5d5b3          	divu	a1,a1,a3
     69c:	0742                	slli	a4,a4,0x10
     69e:	8fd9                	or	a5,a5,a4
     6a0:	02b50533          	mul	a0,a0,a1
     6a4:	00a7f863          	bgeu	a5,a0,6b4 <__umoddi3+0x156>
     6a8:	97a2                	add	a5,a5,s0
     6aa:	0087e563          	bltu	a5,s0,6b4 <__umoddi3+0x156>
     6ae:	00a7f363          	bgeu	a5,a0,6b4 <__umoddi3+0x156>
     6b2:	97a2                	add	a5,a5,s0
     6b4:	8f89                	sub	a5,a5,a0
     6b6:	bfa9                	j	610 <__umoddi3+0xb2>
     6b8:	01000737          	lui	a4,0x1000
     6bc:	4341                	li	t1,16
     6be:	f8e463e3          	bltu	s0,a4,644 <__umoddi3+0xe6>
     6c2:	4361                	li	t1,24
     6c4:	b741                	j	644 <__umoddi3+0xe6>
     6c6:	00541433          	sll	s0,s0,t0
     6ca:	0065d6b3          	srl	a3,a1,t1
     6ce:	005517b3          	sll	a5,a0,t0
     6d2:	00655333          	srl	t1,a0,t1
     6d6:	01045513          	srli	a0,s0,0x10
     6da:	02a6f733          	remu	a4,a3,a0
     6de:	005595b3          	sll	a1,a1,t0
     6e2:	00b36633          	or	a2,t1,a1
     6e6:	01041593          	slli	a1,s0,0x10
     6ea:	81c1                	srli	a1,a1,0x10
     6ec:	01065313          	srli	t1,a2,0x10
     6f0:	02a6d6b3          	divu	a3,a3,a0
     6f4:	0742                	slli	a4,a4,0x10
     6f6:	00676733          	or	a4,a4,t1
     6fa:	02d586b3          	mul	a3,a1,a3
     6fe:	00d77863          	bgeu	a4,a3,70e <__umoddi3+0x1b0>
     702:	9722                	add	a4,a4,s0
     704:	00876563          	bltu	a4,s0,70e <__umoddi3+0x1b0>
     708:	00d77363          	bgeu	a4,a3,70e <__umoddi3+0x1b0>
     70c:	9722                	add	a4,a4,s0
     70e:	40d706b3          	sub	a3,a4,a3
     712:	02a6f733          	remu	a4,a3,a0
     716:	02a6d6b3          	divu	a3,a3,a0
     71a:	0742                	slli	a4,a4,0x10
     71c:	02d586b3          	mul	a3,a1,a3
     720:	01061593          	slli	a1,a2,0x10
     724:	81c1                	srli	a1,a1,0x10
     726:	8dd9                	or	a1,a1,a4
     728:	00d5f863          	bgeu	a1,a3,738 <__umoddi3+0x1da>
     72c:	95a2                	add	a1,a1,s0
     72e:	0085e563          	bltu	a1,s0,738 <__umoddi3+0x1da>
     732:	00d5f363          	bgeu	a1,a3,738 <__umoddi3+0x1da>
     736:	95a2                	add	a1,a1,s0
     738:	8d95                	sub	a1,a1,a3
     73a:	b715                	j	65e <__umoddi3+0x100>
     73c:	ecd5ede3          	bltu	a1,a3,616 <__umoddi3+0xb8>
     740:	6341                	lui	t1,0x10
     742:	0466f563          	bgeu	a3,t1,78c <__umoddi3+0x22e>
     746:	0ff00293          	li	t0,255
     74a:	00d2b333          	sltu	t1,t0,a3
     74e:	030e                	slli	t1,t1,0x3
     750:	0066d3b3          	srl	t2,a3,t1
     754:	00007297          	auipc	t0,0x7
     758:	b6428293          	addi	t0,t0,-1180 # 72b8 <__clz_tab>
     75c:	929e                	add	t0,t0,t2
     75e:	0002c283          	lbu	t0,0(t0)
     762:	929a                	add	t0,t0,t1
     764:	02000313          	li	t1,32
     768:	405303b3          	sub	t2,t1,t0
     76c:	02531763          	bne	t1,t0,79a <__umoddi3+0x23c>
     770:	00b6e463          	bltu	a3,a1,778 <__umoddi3+0x21a>
     774:	00c56963          	bltu	a0,a2,786 <__umoddi3+0x228>
     778:	40c507b3          	sub	a5,a0,a2
     77c:	8d95                	sub	a1,a1,a3
     77e:	00f53533          	sltu	a0,a0,a5
     782:	40a58733          	sub	a4,a1,a0
     786:	853e                	mv	a0,a5
     788:	85ba                	mv	a1,a4
     78a:	b571                	j	616 <__umoddi3+0xb8>
     78c:	010002b7          	lui	t0,0x1000
     790:	4341                	li	t1,16
     792:	fa56efe3          	bltu	a3,t0,750 <__umoddi3+0x1f2>
     796:	4361                	li	t1,24
     798:	bf65                	j	750 <__umoddi3+0x1f2>
     79a:	007696b3          	sll	a3,a3,t2
     79e:	00565333          	srl	t1,a2,t0
     7a2:	00d36333          	or	t1,t1,a3
     7a6:	0055d4b3          	srl	s1,a1,t0
     7aa:	01035413          	srli	s0,t1,0x10
     7ae:	00555733          	srl	a4,a0,t0
     7b2:	007517b3          	sll	a5,a0,t2
     7b6:	0284d533          	divu	a0,s1,s0
     7ba:	c03e                	sw	a5,0(sp)
     7bc:	007595b3          	sll	a1,a1,t2
     7c0:	8dd9                	or	a1,a1,a4
     7c2:	01031713          	slli	a4,t1,0x10
     7c6:	8341                	srli	a4,a4,0x10
     7c8:	00761633          	sll	a2,a2,t2
     7cc:	0284f7b3          	remu	a5,s1,s0
     7d0:	02a704b3          	mul	s1,a4,a0
     7d4:	01079693          	slli	a3,a5,0x10
     7d8:	0105d793          	srli	a5,a1,0x10
     7dc:	8fd5                	or	a5,a5,a3
     7de:	86aa                	mv	a3,a0
     7e0:	0097fc63          	bgeu	a5,s1,7f8 <__umoddi3+0x29a>
     7e4:	979a                	add	a5,a5,t1
     7e6:	fff50693          	addi	a3,a0,-1
     7ea:	0067e763          	bltu	a5,t1,7f8 <__umoddi3+0x29a>
     7ee:	0097f563          	bgeu	a5,s1,7f8 <__umoddi3+0x29a>
     7f2:	ffe50693          	addi	a3,a0,-2
     7f6:	979a                	add	a5,a5,t1
     7f8:	8f85                	sub	a5,a5,s1
     7fa:	0287f533          	remu	a0,a5,s0
     7fe:	05c2                	slli	a1,a1,0x10
     800:	81c1                	srli	a1,a1,0x10
     802:	0287d433          	divu	s0,a5,s0
     806:	0542                	slli	a0,a0,0x10
     808:	8dc9                	or	a1,a1,a0
     80a:	02870733          	mul	a4,a4,s0
     80e:	87a2                	mv	a5,s0
     810:	00e5fc63          	bgeu	a1,a4,828 <__umoddi3+0x2ca>
     814:	959a                	add	a1,a1,t1
     816:	fff40793          	addi	a5,s0,-1
     81a:	0065e763          	bltu	a1,t1,828 <__umoddi3+0x2ca>
     81e:	00e5f563          	bgeu	a1,a4,828 <__umoddi3+0x2ca>
     822:	ffe40793          	addi	a5,s0,-2
     826:	959a                	add	a1,a1,t1
     828:	06c2                	slli	a3,a3,0x10
     82a:	6441                	lui	s0,0x10
     82c:	8edd                	or	a3,a3,a5
     82e:	40e58733          	sub	a4,a1,a4
     832:	fff40593          	addi	a1,s0,-1 # ffff <__ctor_end__+0x776f>
     836:	00b6f7b3          	and	a5,a3,a1
     83a:	01065493          	srli	s1,a2,0x10
     83e:	82c1                	srli	a3,a3,0x10
     840:	8df1                	and	a1,a1,a2
     842:	02b78533          	mul	a0,a5,a1
     846:	02b685b3          	mul	a1,a3,a1
     84a:	029787b3          	mul	a5,a5,s1
     84e:	029686b3          	mul	a3,a3,s1
     852:	97ae                	add	a5,a5,a1
     854:	01055493          	srli	s1,a0,0x10
     858:	97a6                	add	a5,a5,s1
     85a:	00b7f363          	bgeu	a5,a1,860 <__umoddi3+0x302>
     85e:	96a2                	add	a3,a3,s0
     860:	0107d593          	srli	a1,a5,0x10
     864:	96ae                	add	a3,a3,a1
     866:	65c1                	lui	a1,0x10
     868:	15fd                	addi	a1,a1,-1
     86a:	8fed                	and	a5,a5,a1
     86c:	07c2                	slli	a5,a5,0x10
     86e:	8d6d                	and	a0,a0,a1
     870:	953e                	add	a0,a0,a5
     872:	00d76763          	bltu	a4,a3,880 <__umoddi3+0x322>
     876:	00d71d63          	bne	a4,a3,890 <__umoddi3+0x332>
     87a:	4782                	lw	a5,0(sp)
     87c:	00a7fa63          	bgeu	a5,a0,890 <__umoddi3+0x332>
     880:	40c50633          	sub	a2,a0,a2
     884:	00c53533          	sltu	a0,a0,a2
     888:	932a                	add	t1,t1,a0
     88a:	406686b3          	sub	a3,a3,t1
     88e:	8532                	mv	a0,a2
     890:	4782                	lw	a5,0(sp)
     892:	40d706b3          	sub	a3,a4,a3
     896:	40a78533          	sub	a0,a5,a0
     89a:	00a7b5b3          	sltu	a1,a5,a0
     89e:	40b685b3          	sub	a1,a3,a1
     8a2:	005597b3          	sll	a5,a1,t0
     8a6:	00755533          	srl	a0,a0,t2
     8aa:	8d5d                	or	a0,a0,a5
     8ac:	0075d5b3          	srl	a1,a1,t2
     8b0:	b39d                	j	616 <__umoddi3+0xb8>

000008b2 <__adddf3>:
     8b2:	00100337          	lui	t1,0x100
     8b6:	137d                	addi	t1,t1,-1
     8b8:	1131                	addi	sp,sp,-20
     8ba:	00b377b3          	and	a5,t1,a1
     8be:	0145d713          	srli	a4,a1,0x14
     8c2:	c426                	sw	s1,8(sp)
     8c4:	078e                	slli	a5,a5,0x3
     8c6:	7ff77493          	andi	s1,a4,2047
     8ca:	01d55713          	srli	a4,a0,0x1d
     8ce:	8fd9                	or	a5,a5,a4
     8d0:	00d37733          	and	a4,t1,a3
     8d4:	0146d313          	srli	t1,a3,0x14
     8d8:	c622                	sw	s0,12(sp)
     8da:	7ff37313          	andi	t1,t1,2047
     8de:	01f5d413          	srli	s0,a1,0x1f
     8e2:	070e                	slli	a4,a4,0x3
     8e4:	01f6d593          	srli	a1,a3,0x1f
     8e8:	c806                	sw	ra,16(sp)
     8ea:	01d65693          	srli	a3,a2,0x1d
     8ee:	8f55                	or	a4,a4,a3
     8f0:	050e                	slli	a0,a0,0x3
     8f2:	060e                	slli	a2,a2,0x3
     8f4:	406486b3          	sub	a3,s1,t1
     8f8:	22b41463          	bne	s0,a1,b20 <__adddf3+0x26e>
     8fc:	0ed05263          	blez	a3,9e0 <__adddf3+0x12e>
     900:	02031863          	bnez	t1,930 <__adddf3+0x7e>
     904:	00c765b3          	or	a1,a4,a2
     908:	20058a63          	beqz	a1,b1c <__adddf3+0x26a>
     90c:	fff68593          	addi	a1,a3,-1
     910:	e989                	bnez	a1,922 <__adddf3+0x70>
     912:	962a                	add	a2,a2,a0
     914:	00a63533          	sltu	a0,a2,a0
     918:	97ba                	add	a5,a5,a4
     91a:	97aa                	add	a5,a5,a0
     91c:	8532                	mv	a0,a2
     91e:	4485                	li	s1,1
     920:	a8b9                	j	97e <__adddf3+0xcc>
     922:	7ff00313          	li	t1,2047
     926:	00669d63          	bne	a3,t1,940 <__adddf3+0x8e>
     92a:	7ff00493          	li	s1,2047
     92e:	aa71                	j	aca <__adddf3+0x218>
     930:	7ff00593          	li	a1,2047
     934:	18b48b63          	beq	s1,a1,aca <__adddf3+0x218>
     938:	008005b7          	lui	a1,0x800
     93c:	8f4d                	or	a4,a4,a1
     93e:	85b6                	mv	a1,a3
     940:	03800693          	li	a3,56
     944:	08b6ca63          	blt	a3,a1,9d8 <__adddf3+0x126>
     948:	46fd                	li	a3,31
     94a:	06b6c163          	blt	a3,a1,9ac <__adddf3+0xfa>
     94e:	02000313          	li	t1,32
     952:	40b30333          	sub	t1,t1,a1
     956:	006716b3          	sll	a3,a4,t1
     95a:	00b652b3          	srl	t0,a2,a1
     95e:	00661633          	sll	a2,a2,t1
     962:	0056e6b3          	or	a3,a3,t0
     966:	00c03633          	snez	a2,a2
     96a:	8e55                	or	a2,a2,a3
     96c:	00b75733          	srl	a4,a4,a1
     970:	962a                	add	a2,a2,a0
     972:	00a63533          	sltu	a0,a2,a0
     976:	973e                	add	a4,a4,a5
     978:	00a707b3          	add	a5,a4,a0
     97c:	8532                	mv	a0,a2
     97e:	00800737          	lui	a4,0x800
     982:	8f7d                	and	a4,a4,a5
     984:	14070363          	beqz	a4,aca <__adddf3+0x218>
     988:	0485                	addi	s1,s1,1
     98a:	7ff00713          	li	a4,2047
     98e:	48e48b63          	beq	s1,a4,e24 <__adddf3+0x572>
     992:	ff800737          	lui	a4,0xff800
     996:	177d                	addi	a4,a4,-1
     998:	8ff9                	and	a5,a5,a4
     99a:	00155713          	srli	a4,a0,0x1
     99e:	8905                	andi	a0,a0,1
     9a0:	8d59                	or	a0,a0,a4
     9a2:	01f79713          	slli	a4,a5,0x1f
     9a6:	8d59                	or	a0,a0,a4
     9a8:	8385                	srli	a5,a5,0x1
     9aa:	a205                	j	aca <__adddf3+0x218>
     9ac:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f7750>
     9b0:	02000293          	li	t0,32
     9b4:	00d756b3          	srl	a3,a4,a3
     9b8:	4301                	li	t1,0
     9ba:	00558863          	beq	a1,t0,9ca <__adddf3+0x118>
     9be:	04000313          	li	t1,64
     9c2:	40b305b3          	sub	a1,t1,a1
     9c6:	00b71333          	sll	t1,a4,a1
     9ca:	00c36633          	or	a2,t1,a2
     9ce:	00c03633          	snez	a2,a2
     9d2:	8e55                	or	a2,a2,a3
     9d4:	4701                	li	a4,0
     9d6:	bf69                	j	970 <__adddf3+0xbe>
     9d8:	8e59                	or	a2,a2,a4
     9da:	00c03633          	snez	a2,a2
     9de:	bfdd                	j	9d4 <__adddf3+0x122>
     9e0:	cacd                	beqz	a3,a92 <__adddf3+0x1e0>
     9e2:	409305b3          	sub	a1,t1,s1
     9e6:	e48d                	bnez	s1,a10 <__adddf3+0x15e>
     9e8:	00a7e6b3          	or	a3,a5,a0
     9ec:	42068363          	beqz	a3,e12 <__adddf3+0x560>
     9f0:	fff58693          	addi	a3,a1,-1
     9f4:	e699                	bnez	a3,a02 <__adddf3+0x150>
     9f6:	9532                	add	a0,a0,a2
     9f8:	97ba                	add	a5,a5,a4
     9fa:	00c53633          	sltu	a2,a0,a2
     9fe:	97b2                	add	a5,a5,a2
     a00:	bf39                	j	91e <__adddf3+0x6c>
     a02:	7ff00293          	li	t0,2047
     a06:	00559d63          	bne	a1,t0,a20 <__adddf3+0x16e>
     a0a:	87ba                	mv	a5,a4
     a0c:	8532                	mv	a0,a2
     a0e:	bf31                	j	92a <__adddf3+0x78>
     a10:	7ff00693          	li	a3,2047
     a14:	fed30be3          	beq	t1,a3,a0a <__adddf3+0x158>
     a18:	008006b7          	lui	a3,0x800
     a1c:	8fd5                	or	a5,a5,a3
     a1e:	86ae                	mv	a3,a1
     a20:	03800593          	li	a1,56
     a24:	06d5c363          	blt	a1,a3,a8a <__adddf3+0x1d8>
     a28:	45fd                	li	a1,31
     a2a:	02d5ca63          	blt	a1,a3,a5e <__adddf3+0x1ac>
     a2e:	02000293          	li	t0,32
     a32:	40d282b3          	sub	t0,t0,a3
     a36:	005795b3          	sll	a1,a5,t0
     a3a:	00d553b3          	srl	t2,a0,a3
     a3e:	00551533          	sll	a0,a0,t0
     a42:	0075e5b3          	or	a1,a1,t2
     a46:	00a03533          	snez	a0,a0
     a4a:	8d4d                	or	a0,a0,a1
     a4c:	00d7d7b3          	srl	a5,a5,a3
     a50:	9532                	add	a0,a0,a2
     a52:	97ba                	add	a5,a5,a4
     a54:	00c53633          	sltu	a2,a0,a2
     a58:	97b2                	add	a5,a5,a2
     a5a:	849a                	mv	s1,t1
     a5c:	b70d                	j	97e <__adddf3+0xcc>
     a5e:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f7750>
     a62:	02000393          	li	t2,32
     a66:	00b7d5b3          	srl	a1,a5,a1
     a6a:	4281                	li	t0,0
     a6c:	00768863          	beq	a3,t2,a7c <__adddf3+0x1ca>
     a70:	04000293          	li	t0,64
     a74:	40d286b3          	sub	a3,t0,a3
     a78:	00d792b3          	sll	t0,a5,a3
     a7c:	00a2e533          	or	a0,t0,a0
     a80:	00a03533          	snez	a0,a0
     a84:	8d4d                	or	a0,a0,a1
     a86:	4781                	li	a5,0
     a88:	b7e1                	j	a50 <__adddf3+0x19e>
     a8a:	8d5d                	or	a0,a0,a5
     a8c:	00a03533          	snez	a0,a0
     a90:	bfdd                	j	a86 <__adddf3+0x1d4>
     a92:	00148693          	addi	a3,s1,1
     a96:	7fe6f593          	andi	a1,a3,2046
     a9a:	e1bd                	bnez	a1,b00 <__adddf3+0x24e>
     a9c:	00a7e6b3          	or	a3,a5,a0
     aa0:	e4a9                	bnez	s1,aea <__adddf3+0x238>
     aa2:	36068c63          	beqz	a3,e1a <__adddf3+0x568>
     aa6:	00c766b3          	or	a3,a4,a2
     aaa:	c285                	beqz	a3,aca <__adddf3+0x218>
     aac:	962a                	add	a2,a2,a0
     aae:	97ba                	add	a5,a5,a4
     ab0:	00a63533          	sltu	a0,a2,a0
     ab4:	97aa                	add	a5,a5,a0
     ab6:	00800737          	lui	a4,0x800
     aba:	8f7d                	and	a4,a4,a5
     abc:	8532                	mv	a0,a2
     abe:	c711                	beqz	a4,aca <__adddf3+0x218>
     ac0:	ff800737          	lui	a4,0xff800
     ac4:	177d                	addi	a4,a4,-1
     ac6:	8ff9                	and	a5,a5,a4
     ac8:	4485                	li	s1,1
     aca:	00757713          	andi	a4,a0,7
     ace:	34070d63          	beqz	a4,e28 <__adddf3+0x576>
     ad2:	00f57713          	andi	a4,a0,15
     ad6:	4691                	li	a3,4
     ad8:	34d70863          	beq	a4,a3,e28 <__adddf3+0x576>
     adc:	00450713          	addi	a4,a0,4
     ae0:	00a73533          	sltu	a0,a4,a0
     ae4:	97aa                	add	a5,a5,a0
     ae6:	853a                	mv	a0,a4
     ae8:	a681                	j	e28 <__adddf3+0x576>
     aea:	d285                	beqz	a3,a0a <__adddf3+0x158>
     aec:	8e59                	or	a2,a2,a4
     aee:	e2060ee3          	beqz	a2,92a <__adddf3+0x78>
     af2:	4401                	li	s0,0
     af4:	004007b7          	lui	a5,0x400
     af8:	4501                	li	a0,0
     afa:	7ff00493          	li	s1,2047
     afe:	a62d                	j	e28 <__adddf3+0x576>
     b00:	7ff00593          	li	a1,2047
     b04:	30b68e63          	beq	a3,a1,e20 <__adddf3+0x56e>
     b08:	962a                	add	a2,a2,a0
     b0a:	00a63533          	sltu	a0,a2,a0
     b0e:	97ba                	add	a5,a5,a4
     b10:	97aa                	add	a5,a5,a0
     b12:	01f79513          	slli	a0,a5,0x1f
     b16:	8205                	srli	a2,a2,0x1
     b18:	8d51                	or	a0,a0,a2
     b1a:	8385                	srli	a5,a5,0x1
     b1c:	84b6                	mv	s1,a3
     b1e:	b775                	j	aca <__adddf3+0x218>
     b20:	0cd05463          	blez	a3,be8 <__adddf3+0x336>
     b24:	06031f63          	bnez	t1,ba2 <__adddf3+0x2f0>
     b28:	00c765b3          	or	a1,a4,a2
     b2c:	d9e5                	beqz	a1,b1c <__adddf3+0x26a>
     b2e:	fff68593          	addi	a1,a3,-1
     b32:	e991                	bnez	a1,b46 <__adddf3+0x294>
     b34:	40c50633          	sub	a2,a0,a2
     b38:	00c53533          	sltu	a0,a0,a2
     b3c:	8f99                	sub	a5,a5,a4
     b3e:	8f89                	sub	a5,a5,a0
     b40:	8532                	mv	a0,a2
     b42:	4485                	li	s1,1
     b44:	a0b1                	j	b90 <__adddf3+0x2de>
     b46:	7ff00313          	li	t1,2047
     b4a:	de6680e3          	beq	a3,t1,92a <__adddf3+0x78>
     b4e:	03800693          	li	a3,56
     b52:	08b6c763          	blt	a3,a1,be0 <__adddf3+0x32e>
     b56:	46fd                	li	a3,31
     b58:	04b6ce63          	blt	a3,a1,bb4 <__adddf3+0x302>
     b5c:	02000313          	li	t1,32
     b60:	40b30333          	sub	t1,t1,a1
     b64:	006716b3          	sll	a3,a4,t1
     b68:	00b652b3          	srl	t0,a2,a1
     b6c:	00661633          	sll	a2,a2,t1
     b70:	0056e6b3          	or	a3,a3,t0
     b74:	00c03633          	snez	a2,a2
     b78:	8e55                	or	a2,a2,a3
     b7a:	00b75733          	srl	a4,a4,a1
     b7e:	40c50633          	sub	a2,a0,a2
     b82:	00c53533          	sltu	a0,a0,a2
     b86:	40e78733          	sub	a4,a5,a4
     b8a:	40a707b3          	sub	a5,a4,a0
     b8e:	8532                	mv	a0,a2
     b90:	008006b7          	lui	a3,0x800
     b94:	00d7f733          	and	a4,a5,a3
     b98:	db0d                	beqz	a4,aca <__adddf3+0x218>
     b9a:	16fd                	addi	a3,a3,-1
     b9c:	8efd                	and	a3,a3,a5
     b9e:	832a                	mv	t1,a0
     ba0:	aa55                	j	d54 <__adddf3+0x4a2>
     ba2:	7ff00593          	li	a1,2047
     ba6:	f2b482e3          	beq	s1,a1,aca <__adddf3+0x218>
     baa:	008005b7          	lui	a1,0x800
     bae:	8f4d                	or	a4,a4,a1
     bb0:	85b6                	mv	a1,a3
     bb2:	bf71                	j	b4e <__adddf3+0x29c>
     bb4:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f7750>
     bb8:	02000293          	li	t0,32
     bbc:	00d756b3          	srl	a3,a4,a3
     bc0:	4301                	li	t1,0
     bc2:	00558863          	beq	a1,t0,bd2 <__adddf3+0x320>
     bc6:	04000313          	li	t1,64
     bca:	40b305b3          	sub	a1,t1,a1
     bce:	00b71333          	sll	t1,a4,a1
     bd2:	00c36633          	or	a2,t1,a2
     bd6:	00c03633          	snez	a2,a2
     bda:	8e55                	or	a2,a2,a3
     bdc:	4701                	li	a4,0
     bde:	b745                	j	b7e <__adddf3+0x2cc>
     be0:	8e59                	or	a2,a2,a4
     be2:	00c03633          	snez	a2,a2
     be6:	bfdd                	j	bdc <__adddf3+0x32a>
     be8:	c2f9                	beqz	a3,cae <__adddf3+0x3fc>
     bea:	409302b3          	sub	t0,t1,s1
     bee:	e895                	bnez	s1,c22 <__adddf3+0x370>
     bf0:	00a7e6b3          	or	a3,a5,a0
     bf4:	28068863          	beqz	a3,e84 <__adddf3+0x5d2>
     bf8:	fff28693          	addi	a3,t0,-1 # ffffff <__ctor_end__+0xff776f>
     bfc:	ea91                	bnez	a3,c10 <__adddf3+0x35e>
     bfe:	40a60533          	sub	a0,a2,a0
     c02:	40f707b3          	sub	a5,a4,a5
     c06:	00a63633          	sltu	a2,a2,a0
     c0a:	8f91                	sub	a5,a5,a2
     c0c:	842e                	mv	s0,a1
     c0e:	bf15                	j	b42 <__adddf3+0x290>
     c10:	7ff00393          	li	t2,2047
     c14:	00729f63          	bne	t0,t2,c32 <__adddf3+0x380>
     c18:	87ba                	mv	a5,a4
     c1a:	8532                	mv	a0,a2
     c1c:	7ff00493          	li	s1,2047
     c20:	a07d                	j	cce <__adddf3+0x41c>
     c22:	7ff00693          	li	a3,2047
     c26:	fed309e3          	beq	t1,a3,c18 <__adddf3+0x366>
     c2a:	008006b7          	lui	a3,0x800
     c2e:	8fd5                	or	a5,a5,a3
     c30:	8696                	mv	a3,t0
     c32:	03800293          	li	t0,56
     c36:	06d2c863          	blt	t0,a3,ca6 <__adddf3+0x3f4>
     c3a:	42fd                	li	t0,31
     c3c:	02d2ce63          	blt	t0,a3,c78 <__adddf3+0x3c6>
     c40:	02000393          	li	t2,32
     c44:	40d383b3          	sub	t2,t2,a3
     c48:	007792b3          	sll	t0,a5,t2
     c4c:	00d55433          	srl	s0,a0,a3
     c50:	00751533          	sll	a0,a0,t2
     c54:	0082e2b3          	or	t0,t0,s0
     c58:	00a03533          	snez	a0,a0
     c5c:	00a2e533          	or	a0,t0,a0
     c60:	00d7d7b3          	srl	a5,a5,a3
     c64:	40a60533          	sub	a0,a2,a0
     c68:	40f707b3          	sub	a5,a4,a5
     c6c:	00a63633          	sltu	a2,a2,a0
     c70:	8f91                	sub	a5,a5,a2
     c72:	849a                	mv	s1,t1
     c74:	842e                	mv	s0,a1
     c76:	bf29                	j	b90 <__adddf3+0x2de>
     c78:	fe068293          	addi	t0,a3,-32 # 7fffe0 <__ctor_end__+0x7f7750>
     c7c:	02000413          	li	s0,32
     c80:	0057d2b3          	srl	t0,a5,t0
     c84:	4381                	li	t2,0
     c86:	00868863          	beq	a3,s0,c96 <__adddf3+0x3e4>
     c8a:	04000393          	li	t2,64
     c8e:	40d386b3          	sub	a3,t2,a3
     c92:	00d793b3          	sll	t2,a5,a3
     c96:	00a3e533          	or	a0,t2,a0
     c9a:	00a03533          	snez	a0,a0
     c9e:	00a2e533          	or	a0,t0,a0
     ca2:	4781                	li	a5,0
     ca4:	b7c1                	j	c64 <__adddf3+0x3b2>
     ca6:	8d5d                	or	a0,a0,a5
     ca8:	00a03533          	snez	a0,a0
     cac:	bfdd                	j	ca2 <__adddf3+0x3f0>
     cae:	00148693          	addi	a3,s1,1
     cb2:	7fe6f693          	andi	a3,a3,2046
     cb6:	eaa5                	bnez	a3,d26 <__adddf3+0x474>
     cb8:	00a7e333          	or	t1,a5,a0
     cbc:	00c766b3          	or	a3,a4,a2
     cc0:	e8a1                	bnez	s1,d10 <__adddf3+0x45e>
     cc2:	00031863          	bnez	t1,cd2 <__adddf3+0x420>
     cc6:	1c068363          	beqz	a3,e8c <__adddf3+0x5da>
     cca:	87ba                	mv	a5,a4
     ccc:	8532                	mv	a0,a2
     cce:	842e                	mv	s0,a1
     cd0:	bbed                	j	aca <__adddf3+0x218>
     cd2:	de068ce3          	beqz	a3,aca <__adddf3+0x218>
     cd6:	40c50333          	sub	t1,a0,a2
     cda:	006532b3          	sltu	t0,a0,t1
     cde:	40e786b3          	sub	a3,a5,a4
     ce2:	405686b3          	sub	a3,a3,t0
     ce6:	008002b7          	lui	t0,0x800
     cea:	0056f2b3          	and	t0,a3,t0
     cee:	00028a63          	beqz	t0,d02 <__adddf3+0x450>
     cf2:	40a60533          	sub	a0,a2,a0
     cf6:	40f707b3          	sub	a5,a4,a5
     cfa:	00a63633          	sltu	a2,a2,a0
     cfe:	8f91                	sub	a5,a5,a2
     d00:	b7f9                	j	cce <__adddf3+0x41c>
     d02:	00d36533          	or	a0,t1,a3
     d06:	18050763          	beqz	a0,e94 <__adddf3+0x5e2>
     d0a:	87b6                	mv	a5,a3
     d0c:	851a                	mv	a0,t1
     d0e:	bb75                	j	aca <__adddf3+0x218>
     d10:	00031863          	bnez	t1,d20 <__adddf3+0x46e>
     d14:	18068263          	beqz	a3,e98 <__adddf3+0x5e6>
     d18:	87ba                	mv	a5,a4
     d1a:	8532                	mv	a0,a2
     d1c:	842e                	mv	s0,a1
     d1e:	b131                	j	92a <__adddf3+0x78>
     d20:	c00685e3          	beqz	a3,92a <__adddf3+0x78>
     d24:	b3f9                	j	af2 <__adddf3+0x240>
     d26:	40c50333          	sub	t1,a0,a2
     d2a:	006532b3          	sltu	t0,a0,t1
     d2e:	40e786b3          	sub	a3,a5,a4
     d32:	405686b3          	sub	a3,a3,t0
     d36:	008002b7          	lui	t0,0x800
     d3a:	0056f2b3          	and	t0,a3,t0
     d3e:	06028b63          	beqz	t0,db4 <__adddf3+0x502>
     d42:	40a60333          	sub	t1,a2,a0
     d46:	40f707b3          	sub	a5,a4,a5
     d4a:	00663633          	sltu	a2,a2,t1
     d4e:	40c786b3          	sub	a3,a5,a2
     d52:	842e                	mv	s0,a1
     d54:	c6b5                	beqz	a3,dc0 <__adddf3+0x50e>
     d56:	8536                	mv	a0,a3
     d58:	c21a                	sw	t1,4(sp)
     d5a:	c036                	sw	a3,0(sp)
     d5c:	424010ef          	jal	ra,2180 <__clzsi2>
     d60:	4682                	lw	a3,0(sp)
     d62:	4312                	lw	t1,4(sp)
     d64:	ff850713          	addi	a4,a0,-8
     d68:	47fd                	li	a5,31
     d6a:	06e7c563          	blt	a5,a4,dd4 <__adddf3+0x522>
     d6e:	02000793          	li	a5,32
     d72:	8f99                	sub	a5,a5,a4
     d74:	00e696b3          	sll	a3,a3,a4
     d78:	00f357b3          	srl	a5,t1,a5
     d7c:	8fd5                	or	a5,a5,a3
     d7e:	00e31533          	sll	a0,t1,a4
     d82:	08974263          	blt	a4,s1,e06 <__adddf3+0x554>
     d86:	8f05                	sub	a4,a4,s1
     d88:	00170613          	addi	a2,a4,1 # ff800001 <__heap_end+0xdf7d0001>
     d8c:	46fd                	li	a3,31
     d8e:	04c6c963          	blt	a3,a2,de0 <__adddf3+0x52e>
     d92:	02000713          	li	a4,32
     d96:	8f11                	sub	a4,a4,a2
     d98:	00e796b3          	sll	a3,a5,a4
     d9c:	00c555b3          	srl	a1,a0,a2
     da0:	00e51533          	sll	a0,a0,a4
     da4:	8ecd                	or	a3,a3,a1
     da6:	00a03533          	snez	a0,a0
     daa:	8d55                	or	a0,a0,a3
     dac:	00c7d7b3          	srl	a5,a5,a2
     db0:	4481                	li	s1,0
     db2:	bb21                	j	aca <__adddf3+0x218>
     db4:	00d36533          	or	a0,t1,a3
     db8:	fd51                	bnez	a0,d54 <__adddf3+0x4a2>
     dba:	4781                	li	a5,0
     dbc:	4481                	li	s1,0
     dbe:	a8c9                	j	e90 <__adddf3+0x5de>
     dc0:	851a                	mv	a0,t1
     dc2:	c236                	sw	a3,4(sp)
     dc4:	c01a                	sw	t1,0(sp)
     dc6:	3ba010ef          	jal	ra,2180 <__clzsi2>
     dca:	4692                	lw	a3,4(sp)
     dcc:	4302                	lw	t1,0(sp)
     dce:	02050513          	addi	a0,a0,32
     dd2:	bf49                	j	d64 <__adddf3+0x4b2>
     dd4:	fd850793          	addi	a5,a0,-40
     dd8:	00f317b3          	sll	a5,t1,a5
     ddc:	4501                	li	a0,0
     dde:	b755                	j	d82 <__adddf3+0x4d0>
     de0:	1705                	addi	a4,a4,-31
     de2:	02000593          	li	a1,32
     de6:	00e7d733          	srl	a4,a5,a4
     dea:	4681                	li	a3,0
     dec:	00b60763          	beq	a2,a1,dfa <__adddf3+0x548>
     df0:	04000693          	li	a3,64
     df4:	8e91                	sub	a3,a3,a2
     df6:	00d796b3          	sll	a3,a5,a3
     dfa:	8d55                	or	a0,a0,a3
     dfc:	00a03533          	snez	a0,a0
     e00:	8d59                	or	a0,a0,a4
     e02:	4781                	li	a5,0
     e04:	b775                	j	db0 <__adddf3+0x4fe>
     e06:	8c99                	sub	s1,s1,a4
     e08:	ff800737          	lui	a4,0xff800
     e0c:	177d                	addi	a4,a4,-1
     e0e:	8ff9                	and	a5,a5,a4
     e10:	b96d                	j	aca <__adddf3+0x218>
     e12:	87ba                	mv	a5,a4
     e14:	8532                	mv	a0,a2
     e16:	84ae                	mv	s1,a1
     e18:	b94d                	j	aca <__adddf3+0x218>
     e1a:	87ba                	mv	a5,a4
     e1c:	8532                	mv	a0,a2
     e1e:	b175                	j	aca <__adddf3+0x218>
     e20:	7ff00493          	li	s1,2047
     e24:	4781                	li	a5,0
     e26:	4501                	li	a0,0
     e28:	00800737          	lui	a4,0x800
     e2c:	8f7d                	and	a4,a4,a5
     e2e:	cb11                	beqz	a4,e42 <__adddf3+0x590>
     e30:	0485                	addi	s1,s1,1
     e32:	7ff00713          	li	a4,2047
     e36:	06e48663          	beq	s1,a4,ea2 <__adddf3+0x5f0>
     e3a:	ff800737          	lui	a4,0xff800
     e3e:	177d                	addi	a4,a4,-1
     e40:	8ff9                	and	a5,a5,a4
     e42:	01d79713          	slli	a4,a5,0x1d
     e46:	810d                	srli	a0,a0,0x3
     e48:	8d59                	or	a0,a0,a4
     e4a:	7ff00713          	li	a4,2047
     e4e:	838d                	srli	a5,a5,0x3
     e50:	00e49963          	bne	s1,a4,e62 <__adddf3+0x5b0>
     e54:	8d5d                	or	a0,a0,a5
     e56:	4781                	li	a5,0
     e58:	c509                	beqz	a0,e62 <__adddf3+0x5b0>
     e5a:	000807b7          	lui	a5,0x80
     e5e:	4501                	li	a0,0
     e60:	4401                	li	s0,0
     e62:	01449713          	slli	a4,s1,0x14
     e66:	7ff006b7          	lui	a3,0x7ff00
     e6a:	07b2                	slli	a5,a5,0xc
     e6c:	8f75                	and	a4,a4,a3
     e6e:	83b1                	srli	a5,a5,0xc
     e70:	047e                	slli	s0,s0,0x1f
     e72:	8fd9                	or	a5,a5,a4
     e74:	40c2                	lw	ra,16(sp)
     e76:	0087e733          	or	a4,a5,s0
     e7a:	4432                	lw	s0,12(sp)
     e7c:	44a2                	lw	s1,8(sp)
     e7e:	85ba                	mv	a1,a4
     e80:	0151                	addi	sp,sp,20
     e82:	8082                	ret
     e84:	87ba                	mv	a5,a4
     e86:	8532                	mv	a0,a2
     e88:	8496                	mv	s1,t0
     e8a:	b591                	j	cce <__adddf3+0x41c>
     e8c:	4781                	li	a5,0
     e8e:	4501                	li	a0,0
     e90:	4401                	li	s0,0
     e92:	bf59                	j	e28 <__adddf3+0x576>
     e94:	4781                	li	a5,0
     e96:	bfed                	j	e90 <__adddf3+0x5de>
     e98:	4501                	li	a0,0
     e9a:	4401                	li	s0,0
     e9c:	004007b7          	lui	a5,0x400
     ea0:	b9a9                	j	afa <__adddf3+0x248>
     ea2:	4781                	li	a5,0
     ea4:	4501                	li	a0,0
     ea6:	bf71                	j	e42 <__adddf3+0x590>

00000ea8 <__divdf3>:
     ea8:	fdc10113          	addi	sp,sp,-36
     eac:	cc26                	sw	s1,24(sp)
     eae:	872a                	mv	a4,a0
     eb0:	84b2                	mv	s1,a2
     eb2:	87aa                	mv	a5,a0
     eb4:	01f5d613          	srli	a2,a1,0x1f
     eb8:	0145d513          	srli	a0,a1,0x14
     ebc:	00c59313          	slli	t1,a1,0xc
     ec0:	d006                	sw	ra,32(sp)
     ec2:	ce22                	sw	s0,28(sp)
     ec4:	7ff57513          	andi	a0,a0,2047
     ec8:	c432                	sw	a2,8(sp)
     eca:	00c35313          	srli	t1,t1,0xc
     ece:	c551                	beqz	a0,f5a <__divdf3+0xb2>
     ed0:	7ff00593          	li	a1,2047
     ed4:	0eb50863          	beq	a0,a1,fc4 <__divdf3+0x11c>
     ed8:	01d75413          	srli	s0,a4,0x1d
     edc:	030e                	slli	t1,t1,0x3
     ede:	008007b7          	lui	a5,0x800
     ee2:	00646433          	or	s0,s0,t1
     ee6:	8c5d                	or	s0,s0,a5
     ee8:	c0150613          	addi	a2,a0,-1023
     eec:	00371793          	slli	a5,a4,0x3
     ef0:	4301                	li	t1,0
     ef2:	0146d513          	srli	a0,a3,0x14
     ef6:	01f6d713          	srli	a4,a3,0x1f
     efa:	00c69393          	slli	t2,a3,0xc
     efe:	7ff57513          	andi	a0,a0,2047
     f02:	c63a                	sw	a4,12(sp)
     f04:	00c3d393          	srli	t2,t2,0xc
     f08:	cd79                	beqz	a0,fe6 <__divdf3+0x13e>
     f0a:	7ff00713          	li	a4,2047
     f0e:	14e50763          	beq	a0,a4,105c <__divdf3+0x1b4>
     f12:	01d4d713          	srli	a4,s1,0x1d
     f16:	038e                	slli	t2,t2,0x3
     f18:	007763b3          	or	t2,a4,t2
     f1c:	008006b7          	lui	a3,0x800
     f20:	00d3e3b3          	or	t2,t2,a3
     f24:	00349713          	slli	a4,s1,0x3
     f28:	c0150513          	addi	a0,a0,-1023
     f2c:	4681                	li	a3,0
     f2e:	45a2                	lw	a1,8(sp)
     f30:	44b2                	lw	s1,12(sp)
     f32:	8e09                	sub	a2,a2,a0
     f34:	c232                	sw	a2,4(sp)
     f36:	00231613          	slli	a2,t1,0x2
     f3a:	8da5                	xor	a1,a1,s1
     f3c:	8e55                	or	a2,a2,a3
     f3e:	c02e                	sw	a1,0(sp)
     f40:	167d                	addi	a2,a2,-1
     f42:	45b9                	li	a1,14
     f44:	12c5ed63          	bltu	a1,a2,107e <__divdf3+0x1d6>
     f48:	00006597          	auipc	a1,0x6
     f4c:	2f858593          	addi	a1,a1,760 # 7240 <__srodata>
     f50:	060a                	slli	a2,a2,0x2
     f52:	962e                	add	a2,a2,a1
     f54:	4210                	lw	a2,0(a2)
     f56:	962e                	add	a2,a2,a1
     f58:	8602                	jr	a2
     f5a:	00e36433          	or	s0,t1,a4
     f5e:	c83d                	beqz	s0,fd4 <__divdf3+0x12c>
     f60:	c636                	sw	a3,12(sp)
     f62:	04030063          	beqz	t1,fa2 <__divdf3+0xfa>
     f66:	851a                	mv	a0,t1
     f68:	c23a                	sw	a4,4(sp)
     f6a:	c01a                	sw	t1,0(sp)
     f6c:	214010ef          	jal	ra,2180 <__clzsi2>
     f70:	4302                	lw	t1,0(sp)
     f72:	4712                	lw	a4,4(sp)
     f74:	46b2                	lw	a3,12(sp)
     f76:	ff550593          	addi	a1,a0,-11
     f7a:	47f1                	li	a5,28
     f7c:	02b7ce63          	blt	a5,a1,fb8 <__divdf3+0x110>
     f80:	4475                	li	s0,29
     f82:	ff850793          	addi	a5,a0,-8
     f86:	8c0d                	sub	s0,s0,a1
     f88:	00f31333          	sll	t1,t1,a5
     f8c:	00875433          	srl	s0,a4,s0
     f90:	00646433          	or	s0,s0,t1
     f94:	00f717b3          	sll	a5,a4,a5
     f98:	c0d00593          	li	a1,-1011
     f9c:	40a58633          	sub	a2,a1,a0
     fa0:	bf81                	j	ef0 <__divdf3+0x48>
     fa2:	853a                	mv	a0,a4
     fa4:	c21a                	sw	t1,4(sp)
     fa6:	c03a                	sw	a4,0(sp)
     fa8:	1d8010ef          	jal	ra,2180 <__clzsi2>
     fac:	46b2                	lw	a3,12(sp)
     fae:	4312                	lw	t1,4(sp)
     fb0:	4702                	lw	a4,0(sp)
     fb2:	02050513          	addi	a0,a0,32
     fb6:	b7c1                	j	f76 <__divdf3+0xce>
     fb8:	fd850413          	addi	s0,a0,-40
     fbc:	00871433          	sll	s0,a4,s0
     fc0:	4781                	li	a5,0
     fc2:	bfd9                	j	f98 <__divdf3+0xf0>
     fc4:	00e36433          	or	s0,t1,a4
     fc8:	c811                	beqz	s0,fdc <__divdf3+0x134>
     fca:	841a                	mv	s0,t1
     fcc:	7ff00613          	li	a2,2047
     fd0:	430d                	li	t1,3
     fd2:	b705                	j	ef2 <__divdf3+0x4a>
     fd4:	4781                	li	a5,0
     fd6:	4601                	li	a2,0
     fd8:	4305                	li	t1,1
     fda:	bf21                	j	ef2 <__divdf3+0x4a>
     fdc:	4781                	li	a5,0
     fde:	7ff00613          	li	a2,2047
     fe2:	4309                	li	t1,2
     fe4:	b739                	j	ef2 <__divdf3+0x4a>
     fe6:	0093e733          	or	a4,t2,s1
     fea:	c349                	beqz	a4,106c <__divdf3+0x1c4>
     fec:	04038463          	beqz	t2,1034 <__divdf3+0x18c>
     ff0:	851e                	mv	a0,t2
     ff2:	ca1a                	sw	t1,20(sp)
     ff4:	c832                	sw	a2,16(sp)
     ff6:	c23e                	sw	a5,4(sp)
     ff8:	c01e                	sw	t2,0(sp)
     ffa:	186010ef          	jal	ra,2180 <__clzsi2>
     ffe:	4382                	lw	t2,0(sp)
    1000:	4792                	lw	a5,4(sp)
    1002:	4642                	lw	a2,16(sp)
    1004:	4352                	lw	t1,20(sp)
    1006:	ff550293          	addi	t0,a0,-11
    100a:	4771                	li	a4,28
    100c:	04574263          	blt	a4,t0,1050 <__divdf3+0x1a8>
    1010:	46f5                	li	a3,29
    1012:	ff850713          	addi	a4,a0,-8
    1016:	405686b3          	sub	a3,a3,t0
    101a:	00e393b3          	sll	t2,t2,a4
    101e:	00d4d6b3          	srl	a3,s1,a3
    1022:	0076e3b3          	or	t2,a3,t2
    1026:	00e49733          	sll	a4,s1,a4
    102a:	c0d00693          	li	a3,-1011
    102e:	40a68533          	sub	a0,a3,a0
    1032:	bded                	j	f2c <__divdf3+0x84>
    1034:	8526                	mv	a0,s1
    1036:	ca1e                	sw	t2,20(sp)
    1038:	c81a                	sw	t1,16(sp)
    103a:	c232                	sw	a2,4(sp)
    103c:	c03e                	sw	a5,0(sp)
    103e:	142010ef          	jal	ra,2180 <__clzsi2>
    1042:	43d2                	lw	t2,20(sp)
    1044:	4342                	lw	t1,16(sp)
    1046:	4612                	lw	a2,4(sp)
    1048:	4782                	lw	a5,0(sp)
    104a:	02050513          	addi	a0,a0,32
    104e:	bf65                	j	1006 <__divdf3+0x15e>
    1050:	fd850393          	addi	t2,a0,-40
    1054:	007493b3          	sll	t2,s1,t2
    1058:	4701                	li	a4,0
    105a:	bfc1                	j	102a <__divdf3+0x182>
    105c:	0093e733          	or	a4,t2,s1
    1060:	cb11                	beqz	a4,1074 <__divdf3+0x1cc>
    1062:	8726                	mv	a4,s1
    1064:	7ff00513          	li	a0,2047
    1068:	468d                	li	a3,3
    106a:	b5d1                	j	f2e <__divdf3+0x86>
    106c:	4381                	li	t2,0
    106e:	4501                	li	a0,0
    1070:	4685                	li	a3,1
    1072:	bd75                	j	f2e <__divdf3+0x86>
    1074:	4381                	li	t2,0
    1076:	7ff00513          	li	a0,2047
    107a:	4689                	li	a3,2
    107c:	bd4d                	j	f2e <__divdf3+0x86>
    107e:	0083e663          	bltu	t2,s0,108a <__divdf3+0x1e2>
    1082:	2c741263          	bne	s0,t2,1346 <__divdf3+0x49e>
    1086:	2ce7e063          	bltu	a5,a4,1346 <__divdf3+0x49e>
    108a:	01f41613          	slli	a2,s0,0x1f
    108e:	0017d693          	srli	a3,a5,0x1
    1092:	01f79513          	slli	a0,a5,0x1f
    1096:	8005                	srli	s0,s0,0x1
    1098:	00d667b3          	or	a5,a2,a3
    109c:	03a2                	slli	t2,t2,0x8
    109e:	0103d493          	srli	s1,t2,0x10
    10a2:	02945333          	divu	t1,s0,s1
    10a6:	01875613          	srli	a2,a4,0x18
    10aa:	00766633          	or	a2,a2,t2
    10ae:	00871593          	slli	a1,a4,0x8
    10b2:	01061713          	slli	a4,a2,0x10
    10b6:	8341                	srli	a4,a4,0x10
    10b8:	c43a                	sw	a4,8(sp)
    10ba:	0107d693          	srli	a3,a5,0x10
    10be:	02947433          	remu	s0,s0,s1
    10c2:	02670733          	mul	a4,a4,t1
    10c6:	0442                	slli	s0,s0,0x10
    10c8:	8c55                	or	s0,s0,a3
    10ca:	869a                	mv	a3,t1
    10cc:	00e47c63          	bgeu	s0,a4,10e4 <__divdf3+0x23c>
    10d0:	9432                	add	s0,s0,a2
    10d2:	fff30693          	addi	a3,t1,-1 # fffff <__ctor_end__+0xf776f>
    10d6:	00c46763          	bltu	s0,a2,10e4 <__divdf3+0x23c>
    10da:	00e47563          	bgeu	s0,a4,10e4 <__divdf3+0x23c>
    10de:	ffe30693          	addi	a3,t1,-2
    10e2:	9432                	add	s0,s0,a2
    10e4:	8c19                	sub	s0,s0,a4
    10e6:	029452b3          	divu	t0,s0,s1
    10ea:	01061713          	slli	a4,a2,0x10
    10ee:	8341                	srli	a4,a4,0x10
    10f0:	07c2                	slli	a5,a5,0x10
    10f2:	83c1                	srli	a5,a5,0x10
    10f4:	02947433          	remu	s0,s0,s1
    10f8:	8396                	mv	t2,t0
    10fa:	02570333          	mul	t1,a4,t0
    10fe:	0442                	slli	s0,s0,0x10
    1100:	8fc1                	or	a5,a5,s0
    1102:	0067fc63          	bgeu	a5,t1,111a <__divdf3+0x272>
    1106:	97b2                	add	a5,a5,a2
    1108:	fff28393          	addi	t2,t0,-1 # 7fffff <__ctor_end__+0x7f776f>
    110c:	00c7e763          	bltu	a5,a2,111a <__divdf3+0x272>
    1110:	0067f563          	bgeu	a5,t1,111a <__divdf3+0x272>
    1114:	ffe28393          	addi	t2,t0,-2
    1118:	97b2                	add	a5,a5,a2
    111a:	06c2                	slli	a3,a3,0x10
    111c:	6441                	lui	s0,0x10
    111e:	0076e6b3          	or	a3,a3,t2
    1122:	fff40713          	addi	a4,s0,-1 # ffff <__ctor_end__+0x776f>
    1126:	00e6f2b3          	and	t0,a3,a4
    112a:	406787b3          	sub	a5,a5,t1
    112e:	8f6d                	and	a4,a4,a1
    1130:	0106d313          	srli	t1,a3,0x10
    1134:	025703b3          	mul	t2,a4,t0
    1138:	c43a                	sw	a4,8(sp)
    113a:	02e30733          	mul	a4,t1,a4
    113e:	c63a                	sw	a4,12(sp)
    1140:	0105d713          	srli	a4,a1,0x10
    1144:	025702b3          	mul	t0,a4,t0
    1148:	02e30333          	mul	t1,t1,a4
    114c:	4732                	lw	a4,12(sp)
    114e:	92ba                	add	t0,t0,a4
    1150:	0103d713          	srli	a4,t2,0x10
    1154:	9716                	add	a4,a4,t0
    1156:	42b2                	lw	t0,12(sp)
    1158:	00577363          	bgeu	a4,t0,115e <__divdf3+0x2b6>
    115c:	9322                	add	t1,t1,s0
    115e:	6441                	lui	s0,0x10
    1160:	147d                	addi	s0,s0,-1
    1162:	01075293          	srli	t0,a4,0x10
    1166:	8f61                	and	a4,a4,s0
    1168:	0742                	slli	a4,a4,0x10
    116a:	0083f3b3          	and	t2,t2,s0
    116e:	9316                	add	t1,t1,t0
    1170:	971e                	add	a4,a4,t2
    1172:	0067e763          	bltu	a5,t1,1180 <__divdf3+0x2d8>
    1176:	83b6                	mv	t2,a3
    1178:	02679e63          	bne	a5,t1,11b4 <__divdf3+0x30c>
    117c:	02e57c63          	bgeu	a0,a4,11b4 <__divdf3+0x30c>
    1180:	952e                	add	a0,a0,a1
    1182:	00b532b3          	sltu	t0,a0,a1
    1186:	92b2                	add	t0,t0,a2
    1188:	9796                	add	a5,a5,t0
    118a:	fff68393          	addi	t2,a3,-1 # 7fffff <__ctor_end__+0x7f776f>
    118e:	00f66663          	bltu	a2,a5,119a <__divdf3+0x2f2>
    1192:	02f61163          	bne	a2,a5,11b4 <__divdf3+0x30c>
    1196:	00b56f63          	bltu	a0,a1,11b4 <__divdf3+0x30c>
    119a:	0067e663          	bltu	a5,t1,11a6 <__divdf3+0x2fe>
    119e:	00f31b63          	bne	t1,a5,11b4 <__divdf3+0x30c>
    11a2:	00e57963          	bgeu	a0,a4,11b4 <__divdf3+0x30c>
    11a6:	952e                	add	a0,a0,a1
    11a8:	ffe68393          	addi	t2,a3,-2
    11ac:	00b536b3          	sltu	a3,a0,a1
    11b0:	96b2                	add	a3,a3,a2
    11b2:	97b6                	add	a5,a5,a3
    11b4:	40e502b3          	sub	t0,a0,a4
    11b8:	40678333          	sub	t1,a5,t1
    11bc:	00553533          	sltu	a0,a0,t0
    11c0:	40a30333          	sub	t1,t1,a0
    11c4:	577d                	li	a4,-1
    11c6:	10660063          	beq	a2,t1,12c6 <__divdf3+0x41e>
    11ca:	02935433          	divu	s0,t1,s1
    11ce:	01061793          	slli	a5,a2,0x10
    11d2:	83c1                	srli	a5,a5,0x10
    11d4:	0102d693          	srli	a3,t0,0x10
    11d8:	02878733          	mul	a4,a5,s0
    11dc:	029377b3          	remu	a5,t1,s1
    11e0:	07c2                	slli	a5,a5,0x10
    11e2:	8fd5                	or	a5,a5,a3
    11e4:	86a2                	mv	a3,s0
    11e6:	00e7fc63          	bgeu	a5,a4,11fe <__divdf3+0x356>
    11ea:	97b2                	add	a5,a5,a2
    11ec:	fff40693          	addi	a3,s0,-1 # ffff <__ctor_end__+0x776f>
    11f0:	00c7e763          	bltu	a5,a2,11fe <__divdf3+0x356>
    11f4:	00e7f563          	bgeu	a5,a4,11fe <__divdf3+0x356>
    11f8:	ffe40693          	addi	a3,s0,-2
    11fc:	97b2                	add	a5,a5,a2
    11fe:	40e78733          	sub	a4,a5,a4
    1202:	02975333          	divu	t1,a4,s1
    1206:	01061793          	slli	a5,a2,0x10
    120a:	83c1                	srli	a5,a5,0x10
    120c:	02678533          	mul	a0,a5,t1
    1210:	841a                	mv	s0,t1
    1212:	029777b3          	remu	a5,a4,s1
    1216:	01029713          	slli	a4,t0,0x10
    121a:	8341                	srli	a4,a4,0x10
    121c:	07c2                	slli	a5,a5,0x10
    121e:	8fd9                	or	a5,a5,a4
    1220:	00a7fc63          	bgeu	a5,a0,1238 <__divdf3+0x390>
    1224:	97b2                	add	a5,a5,a2
    1226:	fff30413          	addi	s0,t1,-1
    122a:	00c7e763          	bltu	a5,a2,1238 <__divdf3+0x390>
    122e:	00a7f563          	bgeu	a5,a0,1238 <__divdf3+0x390>
    1232:	ffe30413          	addi	s0,t1,-2
    1236:	97b2                	add	a5,a5,a2
    1238:	06c2                	slli	a3,a3,0x10
    123a:	8ec1                	or	a3,a3,s0
    123c:	4422                	lw	s0,8(sp)
    123e:	8f89                	sub	a5,a5,a0
    1240:	4522                	lw	a0,8(sp)
    1242:	0106d293          	srli	t0,a3,0x10
    1246:	01069713          	slli	a4,a3,0x10
    124a:	02828333          	mul	t1,t0,s0
    124e:	8341                	srli	a4,a4,0x10
    1250:	0105d413          	srli	s0,a1,0x10
    1254:	02a70533          	mul	a0,a4,a0
    1258:	02e40733          	mul	a4,s0,a4
    125c:	025402b3          	mul	t0,s0,t0
    1260:	971a                	add	a4,a4,t1
    1262:	01055413          	srli	s0,a0,0x10
    1266:	9722                	add	a4,a4,s0
    1268:	00677463          	bgeu	a4,t1,1270 <__divdf3+0x3c8>
    126c:	6341                	lui	t1,0x10
    126e:	929a                	add	t0,t0,t1
    1270:	01075313          	srli	t1,a4,0x10
    1274:	929a                	add	t0,t0,t1
    1276:	6341                	lui	t1,0x10
    1278:	137d                	addi	t1,t1,-1
    127a:	00677733          	and	a4,a4,t1
    127e:	0742                	slli	a4,a4,0x10
    1280:	00657533          	and	a0,a0,t1
    1284:	953a                	add	a0,a0,a4
    1286:	0057e663          	bltu	a5,t0,1292 <__divdf3+0x3ea>
    128a:	1a579663          	bne	a5,t0,1436 <__divdf3+0x58e>
    128e:	8736                	mv	a4,a3
    1290:	c91d                	beqz	a0,12c6 <__divdf3+0x41e>
    1292:	97b2                	add	a5,a5,a2
    1294:	fff68713          	addi	a4,a3,-1
    1298:	02c7e163          	bltu	a5,a2,12ba <__divdf3+0x412>
    129c:	0057e663          	bltu	a5,t0,12a8 <__divdf3+0x400>
    12a0:	18579a63          	bne	a5,t0,1434 <__divdf3+0x58c>
    12a4:	00a5fd63          	bgeu	a1,a0,12be <__divdf3+0x416>
    12a8:	ffe68713          	addi	a4,a3,-2
    12ac:	00159693          	slli	a3,a1,0x1
    12b0:	00b6b5b3          	sltu	a1,a3,a1
    12b4:	962e                	add	a2,a2,a1
    12b6:	97b2                	add	a5,a5,a2
    12b8:	85b6                	mv	a1,a3
    12ba:	00579463          	bne	a5,t0,12c2 <__divdf3+0x41a>
    12be:	00b50463          	beq	a0,a1,12c6 <__divdf3+0x41e>
    12c2:	00176713          	ori	a4,a4,1
    12c6:	4792                	lw	a5,4(sp)
    12c8:	3ff78793          	addi	a5,a5,1023 # 8003ff <__ctor_end__+0x7f7b6f>
    12cc:	0af05e63          	blez	a5,1388 <__divdf3+0x4e0>
    12d0:	00777693          	andi	a3,a4,7
    12d4:	ce81                	beqz	a3,12ec <__divdf3+0x444>
    12d6:	00f77693          	andi	a3,a4,15
    12da:	4611                	li	a2,4
    12dc:	00c68863          	beq	a3,a2,12ec <__divdf3+0x444>
    12e0:	00470693          	addi	a3,a4,4 # ff800004 <__heap_end+0xdf7d0004>
    12e4:	00e6b733          	sltu	a4,a3,a4
    12e8:	93ba                	add	t2,t2,a4
    12ea:	8736                	mv	a4,a3
    12ec:	010006b7          	lui	a3,0x1000
    12f0:	00d3f6b3          	and	a3,t2,a3
    12f4:	ca89                	beqz	a3,1306 <__divdf3+0x45e>
    12f6:	ff0007b7          	lui	a5,0xff000
    12fa:	17fd                	addi	a5,a5,-1
    12fc:	00f3f3b3          	and	t2,t2,a5
    1300:	4792                	lw	a5,4(sp)
    1302:	40078793          	addi	a5,a5,1024 # ff000400 <__heap_end+0xdefd0400>
    1306:	7fe00693          	li	a3,2046
    130a:	06f6c163          	blt	a3,a5,136c <__divdf3+0x4c4>
    130e:	01d39693          	slli	a3,t2,0x1d
    1312:	830d                	srli	a4,a4,0x3
    1314:	8f55                	or	a4,a4,a3
    1316:	0033d393          	srli	t2,t2,0x3
    131a:	7ff006b7          	lui	a3,0x7ff00
    131e:	07d2                	slli	a5,a5,0x14
    1320:	8ff5                	and	a5,a5,a3
    1322:	4682                	lw	a3,0(sp)
    1324:	03b2                	slli	t2,t2,0xc
    1326:	5082                	lw	ra,32(sp)
    1328:	4472                	lw	s0,28(sp)
    132a:	00c3d393          	srli	t2,t2,0xc
    132e:	01f69593          	slli	a1,a3,0x1f
    1332:	0077e7b3          	or	a5,a5,t2
    1336:	00b7e6b3          	or	a3,a5,a1
    133a:	44e2                	lw	s1,24(sp)
    133c:	853a                	mv	a0,a4
    133e:	85b6                	mv	a1,a3
    1340:	02410113          	addi	sp,sp,36
    1344:	8082                	ret
    1346:	4692                	lw	a3,4(sp)
    1348:	4501                	li	a0,0
    134a:	16fd                	addi	a3,a3,-1
    134c:	c236                	sw	a3,4(sp)
    134e:	b3b9                	j	109c <__divdf3+0x1f4>
    1350:	4722                	lw	a4,8(sp)
    1352:	83a2                	mv	t2,s0
    1354:	869a                	mv	a3,t1
    1356:	c03a                	sw	a4,0(sp)
    1358:	873e                	mv	a4,a5
    135a:	478d                	li	a5,3
    135c:	0af68e63          	beq	a3,a5,1418 <__divdf3+0x570>
    1360:	4785                	li	a5,1
    1362:	0cf68263          	beq	a3,a5,1426 <__divdf3+0x57e>
    1366:	4789                	li	a5,2
    1368:	f4f69fe3          	bne	a3,a5,12c6 <__divdf3+0x41e>
    136c:	4381                	li	t2,0
    136e:	4701                	li	a4,0
    1370:	7ff00793          	li	a5,2047
    1374:	b75d                	j	131a <__divdf3+0x472>
    1376:	47b2                	lw	a5,12(sp)
    1378:	c03e                	sw	a5,0(sp)
    137a:	b7c5                	j	135a <__divdf3+0x4b2>
    137c:	000803b7          	lui	t2,0x80
    1380:	4701                	li	a4,0
    1382:	c002                	sw	zero,0(sp)
    1384:	468d                	li	a3,3
    1386:	bfd1                	j	135a <__divdf3+0x4b2>
    1388:	4685                	li	a3,1
    138a:	8e9d                	sub	a3,a3,a5
    138c:	03800613          	li	a2,56
    1390:	08d64b63          	blt	a2,a3,1426 <__divdf3+0x57e>
    1394:	467d                	li	a2,31
    1396:	04d64c63          	blt	a2,a3,13ee <__divdf3+0x546>
    139a:	4792                	lw	a5,4(sp)
    139c:	00d75633          	srl	a2,a4,a3
    13a0:	41e78593          	addi	a1,a5,1054
    13a4:	00b397b3          	sll	a5,t2,a1
    13a8:	00b71733          	sll	a4,a4,a1
    13ac:	8fd1                	or	a5,a5,a2
    13ae:	00e03733          	snez	a4,a4
    13b2:	8f5d                	or	a4,a4,a5
    13b4:	00d3d3b3          	srl	t2,t2,a3
    13b8:	00777793          	andi	a5,a4,7
    13bc:	cf81                	beqz	a5,13d4 <__divdf3+0x52c>
    13be:	00f77793          	andi	a5,a4,15
    13c2:	4691                	li	a3,4
    13c4:	00d78863          	beq	a5,a3,13d4 <__divdf3+0x52c>
    13c8:	00470693          	addi	a3,a4,4
    13cc:	00e6b733          	sltu	a4,a3,a4
    13d0:	93ba                	add	t2,t2,a4
    13d2:	8736                	mv	a4,a3
    13d4:	008007b7          	lui	a5,0x800
    13d8:	00f3f7b3          	and	a5,t2,a5
    13dc:	eba1                	bnez	a5,142c <__divdf3+0x584>
    13de:	01d39793          	slli	a5,t2,0x1d
    13e2:	830d                	srli	a4,a4,0x3
    13e4:	8f5d                	or	a4,a4,a5
    13e6:	0033d393          	srli	t2,t2,0x3
    13ea:	4781                	li	a5,0
    13ec:	b73d                	j	131a <__divdf3+0x472>
    13ee:	5605                	li	a2,-31
    13f0:	40f607b3          	sub	a5,a2,a5
    13f4:	02000613          	li	a2,32
    13f8:	00f3d7b3          	srl	a5,t2,a5
    13fc:	4581                	li	a1,0
    13fe:	00c68763          	beq	a3,a2,140c <__divdf3+0x564>
    1402:	4692                	lw	a3,4(sp)
    1404:	43e68593          	addi	a1,a3,1086 # 7ff0043e <__heap_end+0x5fed043e>
    1408:	00b395b3          	sll	a1,t2,a1
    140c:	8f4d                	or	a4,a4,a1
    140e:	00e03733          	snez	a4,a4
    1412:	8f5d                	or	a4,a4,a5
    1414:	4381                	li	t2,0
    1416:	b74d                	j	13b8 <__divdf3+0x510>
    1418:	000803b7          	lui	t2,0x80
    141c:	4701                	li	a4,0
    141e:	7ff00793          	li	a5,2047
    1422:	c002                	sw	zero,0(sp)
    1424:	bddd                	j	131a <__divdf3+0x472>
    1426:	4381                	li	t2,0
    1428:	4701                	li	a4,0
    142a:	b7c1                	j	13ea <__divdf3+0x542>
    142c:	4381                	li	t2,0
    142e:	4701                	li	a4,0
    1430:	4785                	li	a5,1
    1432:	b5e5                	j	131a <__divdf3+0x472>
    1434:	86ba                	mv	a3,a4
    1436:	8736                	mv	a4,a3
    1438:	b569                	j	12c2 <__divdf3+0x41a>

0000143a <__eqdf2>:
    143a:	001007b7          	lui	a5,0x100
    143e:	17fd                	addi	a5,a5,-1
    1440:	1151                	addi	sp,sp,-12
    1442:	00b7f2b3          	and	t0,a5,a1
    1446:	0145d713          	srli	a4,a1,0x14
    144a:	81fd                	srli	a1,a1,0x1f
    144c:	c422                	sw	s0,8(sp)
    144e:	c226                	sw	s1,4(sp)
    1450:	832a                	mv	t1,a0
    1452:	842a                	mv	s0,a0
    1454:	c02e                	sw	a1,0(sp)
    1456:	7ff77713          	andi	a4,a4,2047
    145a:	0146d593          	srli	a1,a3,0x14
    145e:	7ff00513          	li	a0,2047
    1462:	8ff5                	and	a5,a5,a3
    1464:	84b2                	mv	s1,a2
    1466:	7ff5f593          	andi	a1,a1,2047
    146a:	82fd                	srli	a3,a3,0x1f
    146c:	00a71a63          	bne	a4,a0,1480 <__eqdf2+0x46>
    1470:	0062e3b3          	or	t2,t0,t1
    1474:	4505                	li	a0,1
    1476:	02039a63          	bnez	t2,14aa <__eqdf2+0x70>
    147a:	02e59863          	bne	a1,a4,14aa <__eqdf2+0x70>
    147e:	a019                	j	1484 <__eqdf2+0x4a>
    1480:	00a59563          	bne	a1,a0,148a <__eqdf2+0x50>
    1484:	8e5d                	or	a2,a2,a5
    1486:	4505                	li	a0,1
    1488:	e20d                	bnez	a2,14aa <__eqdf2+0x70>
    148a:	4505                	li	a0,1
    148c:	00b71f63          	bne	a4,a1,14aa <__eqdf2+0x70>
    1490:	00f29d63          	bne	t0,a5,14aa <__eqdf2+0x70>
    1494:	00941b63          	bne	s0,s1,14aa <__eqdf2+0x70>
    1498:	4782                	lw	a5,0(sp)
    149a:	00d78c63          	beq	a5,a3,14b2 <__eqdf2+0x78>
    149e:	00071663          	bnez	a4,14aa <__eqdf2+0x70>
    14a2:	0062e533          	or	a0,t0,t1
    14a6:	00a03533          	snez	a0,a0
    14aa:	4422                	lw	s0,8(sp)
    14ac:	4492                	lw	s1,4(sp)
    14ae:	0131                	addi	sp,sp,12
    14b0:	8082                	ret
    14b2:	4501                	li	a0,0
    14b4:	bfdd                	j	14aa <__eqdf2+0x70>

000014b6 <__gedf2>:
    14b6:	00100737          	lui	a4,0x100
    14ba:	1161                	addi	sp,sp,-8
    14bc:	177d                	addi	a4,a4,-1
    14be:	0145d313          	srli	t1,a1,0x14
    14c2:	00b772b3          	and	t0,a4,a1
    14c6:	c222                	sw	s0,4(sp)
    14c8:	c026                	sw	s1,0(sp)
    14ca:	87aa                	mv	a5,a0
    14cc:	83aa                	mv	t2,a0
    14ce:	7ff37313          	andi	t1,t1,2047
    14d2:	01f5d513          	srli	a0,a1,0x1f
    14d6:	7ff00493          	li	s1,2047
    14da:	0146d593          	srli	a1,a3,0x14
    14de:	8f75                	and	a4,a4,a3
    14e0:	8432                	mv	s0,a2
    14e2:	7ff5f593          	andi	a1,a1,2047
    14e6:	82fd                	srli	a3,a3,0x1f
    14e8:	00931763          	bne	t1,s1,14f6 <__gedf2+0x40>
    14ec:	00f2e4b3          	or	s1,t0,a5
    14f0:	c8a5                	beqz	s1,1560 <__gedf2+0xaa>
    14f2:	5579                	li	a0,-2
    14f4:	a825                	j	152c <__gedf2+0x76>
    14f6:	00959563          	bne	a1,s1,1500 <__gedf2+0x4a>
    14fa:	00c764b3          	or	s1,a4,a2
    14fe:	f8f5                	bnez	s1,14f2 <__gedf2+0x3c>
    1500:	06031263          	bnez	t1,1564 <__gedf2+0xae>
    1504:	00f2e7b3          	or	a5,t0,a5
    1508:	0017b793          	seqz	a5,a5
    150c:	e199                	bnez	a1,1512 <__gedf2+0x5c>
    150e:	8e59                	or	a2,a2,a4
    1510:	c239                	beqz	a2,1556 <__gedf2+0xa0>
    1512:	00079a63          	bnez	a5,1526 <__gedf2+0x70>
    1516:	00d51463          	bne	a0,a3,151e <__gedf2+0x68>
    151a:	0065dd63          	bge	a1,t1,1534 <__gedf2+0x7e>
    151e:	02050a63          	beqz	a0,1552 <__gedf2+0x9c>
    1522:	557d                	li	a0,-1
    1524:	a021                	j	152c <__gedf2+0x76>
    1526:	557d                	li	a0,-1
    1528:	c291                	beqz	a3,152c <__gedf2+0x76>
    152a:	8536                	mv	a0,a3
    152c:	4412                	lw	s0,4(sp)
    152e:	4482                	lw	s1,0(sp)
    1530:	0121                	addi	sp,sp,8
    1532:	8082                	ret
    1534:	00b35563          	bge	t1,a1,153e <__gedf2+0x88>
    1538:	fe051ae3          	bnez	a0,152c <__gedf2+0x76>
    153c:	b7dd                	j	1522 <__gedf2+0x6c>
    153e:	fe5760e3          	bltu	a4,t0,151e <__gedf2+0x68>
    1542:	00e29c63          	bne	t0,a4,155a <__gedf2+0xa4>
    1546:	fc746ce3          	bltu	s0,t2,151e <__gedf2+0x68>
    154a:	fe83e7e3          	bltu	t2,s0,1538 <__gedf2+0x82>
    154e:	4501                	li	a0,0
    1550:	bff1                	j	152c <__gedf2+0x76>
    1552:	4505                	li	a0,1
    1554:	bfe1                	j	152c <__gedf2+0x76>
    1556:	ffe5                	bnez	a5,154e <__gedf2+0x98>
    1558:	b7d9                	j	151e <__gedf2+0x68>
    155a:	fce2efe3          	bltu	t0,a4,1538 <__gedf2+0x82>
    155e:	bfc5                	j	154e <__gedf2+0x98>
    1560:	f8658de3          	beq	a1,t1,14fa <__gedf2+0x44>
    1564:	fa0599e3          	bnez	a1,1516 <__gedf2+0x60>
    1568:	4781                	li	a5,0
    156a:	b755                	j	150e <__gedf2+0x58>

0000156c <__ledf2>:
    156c:	00100737          	lui	a4,0x100
    1570:	1161                	addi	sp,sp,-8
    1572:	177d                	addi	a4,a4,-1
    1574:	0145d313          	srli	t1,a1,0x14
    1578:	00b772b3          	and	t0,a4,a1
    157c:	c222                	sw	s0,4(sp)
    157e:	c026                	sw	s1,0(sp)
    1580:	87aa                	mv	a5,a0
    1582:	83aa                	mv	t2,a0
    1584:	7ff37313          	andi	t1,t1,2047
    1588:	01f5d513          	srli	a0,a1,0x1f
    158c:	7ff00493          	li	s1,2047
    1590:	0146d593          	srli	a1,a3,0x14
    1594:	8f75                	and	a4,a4,a3
    1596:	8432                	mv	s0,a2
    1598:	7ff5f593          	andi	a1,a1,2047
    159c:	82fd                	srli	a3,a3,0x1f
    159e:	00931763          	bne	t1,s1,15ac <__ledf2+0x40>
    15a2:	00f2e4b3          	or	s1,t0,a5
    15a6:	c8a5                	beqz	s1,1616 <__ledf2+0xaa>
    15a8:	4509                	li	a0,2
    15aa:	a825                	j	15e2 <__ledf2+0x76>
    15ac:	00959563          	bne	a1,s1,15b6 <__ledf2+0x4a>
    15b0:	00c764b3          	or	s1,a4,a2
    15b4:	f8f5                	bnez	s1,15a8 <__ledf2+0x3c>
    15b6:	06031263          	bnez	t1,161a <__ledf2+0xae>
    15ba:	00f2e7b3          	or	a5,t0,a5
    15be:	0017b793          	seqz	a5,a5
    15c2:	e199                	bnez	a1,15c8 <__ledf2+0x5c>
    15c4:	8e59                	or	a2,a2,a4
    15c6:	c239                	beqz	a2,160c <__ledf2+0xa0>
    15c8:	00079a63          	bnez	a5,15dc <__ledf2+0x70>
    15cc:	00d51463          	bne	a0,a3,15d4 <__ledf2+0x68>
    15d0:	0065dd63          	bge	a1,t1,15ea <__ledf2+0x7e>
    15d4:	02050a63          	beqz	a0,1608 <__ledf2+0x9c>
    15d8:	557d                	li	a0,-1
    15da:	a021                	j	15e2 <__ledf2+0x76>
    15dc:	557d                	li	a0,-1
    15de:	c291                	beqz	a3,15e2 <__ledf2+0x76>
    15e0:	8536                	mv	a0,a3
    15e2:	4412                	lw	s0,4(sp)
    15e4:	4482                	lw	s1,0(sp)
    15e6:	0121                	addi	sp,sp,8
    15e8:	8082                	ret
    15ea:	00b35563          	bge	t1,a1,15f4 <__ledf2+0x88>
    15ee:	fe051ae3          	bnez	a0,15e2 <__ledf2+0x76>
    15f2:	b7dd                	j	15d8 <__ledf2+0x6c>
    15f4:	fe5760e3          	bltu	a4,t0,15d4 <__ledf2+0x68>
    15f8:	00e29c63          	bne	t0,a4,1610 <__ledf2+0xa4>
    15fc:	fc746ce3          	bltu	s0,t2,15d4 <__ledf2+0x68>
    1600:	fe83e7e3          	bltu	t2,s0,15ee <__ledf2+0x82>
    1604:	4501                	li	a0,0
    1606:	bff1                	j	15e2 <__ledf2+0x76>
    1608:	4505                	li	a0,1
    160a:	bfe1                	j	15e2 <__ledf2+0x76>
    160c:	ffe5                	bnez	a5,1604 <__ledf2+0x98>
    160e:	b7d9                	j	15d4 <__ledf2+0x68>
    1610:	fce2efe3          	bltu	t0,a4,15ee <__ledf2+0x82>
    1614:	bfc5                	j	1604 <__ledf2+0x98>
    1616:	f8658de3          	beq	a1,t1,15b0 <__ledf2+0x44>
    161a:	fa0599e3          	bnez	a1,15cc <__ledf2+0x60>
    161e:	4781                	li	a5,0
    1620:	b755                	j	15c4 <__ledf2+0x58>

00001622 <__muldf3>:
    1622:	fd810113          	addi	sp,sp,-40
    1626:	0145d293          	srli	t0,a1,0x14
    162a:	01f5d793          	srli	a5,a1,0x1f
    162e:	d022                	sw	s0,32(sp)
    1630:	00c59313          	slli	t1,a1,0xc
    1634:	d206                	sw	ra,36(sp)
    1636:	ce26                	sw	s1,28(sp)
    1638:	7ff2f293          	andi	t0,t0,2047
    163c:	c43e                	sw	a5,8(sp)
    163e:	842a                	mv	s0,a0
    1640:	00c35313          	srli	t1,t1,0xc
    1644:	08028863          	beqz	t0,16d4 <__muldf3+0xb2>
    1648:	7ff00793          	li	a5,2047
    164c:	0ef28763          	beq	t0,a5,173a <__muldf3+0x118>
    1650:	01d55793          	srli	a5,a0,0x1d
    1654:	030e                	slli	t1,t1,0x3
    1656:	0067e333          	or	t1,a5,t1
    165a:	008007b7          	lui	a5,0x800
    165e:	00f36333          	or	t1,t1,a5
    1662:	00351593          	slli	a1,a0,0x3
    1666:	c0128293          	addi	t0,t0,-1023
    166a:	4481                	li	s1,0
    166c:	0146d513          	srli	a0,a3,0x14
    1670:	01f6d793          	srli	a5,a3,0x1f
    1674:	00c69413          	slli	s0,a3,0xc
    1678:	7ff57513          	andi	a0,a0,2047
    167c:	c63e                	sw	a5,12(sp)
    167e:	8031                	srli	s0,s0,0xc
    1680:	cd71                	beqz	a0,175c <__muldf3+0x13a>
    1682:	7ff00793          	li	a5,2047
    1686:	14f50463          	beq	a0,a5,17ce <__muldf3+0x1ac>
    168a:	01d65793          	srli	a5,a2,0x1d
    168e:	040e                	slli	s0,s0,0x3
    1690:	8c5d                	or	s0,s0,a5
    1692:	008007b7          	lui	a5,0x800
    1696:	8c5d                	or	s0,s0,a5
    1698:	00361713          	slli	a4,a2,0x3
    169c:	c0150513          	addi	a0,a0,-1023
    16a0:	4781                	li	a5,0
    16a2:	4632                	lw	a2,12(sp)
    16a4:	46a2                	lw	a3,8(sp)
    16a6:	8eb1                	xor	a3,a3,a2
    16a8:	c036                	sw	a3,0(sp)
    16aa:	00a286b3          	add	a3,t0,a0
    16ae:	c836                	sw	a3,16(sp)
    16b0:	0685                	addi	a3,a3,1
    16b2:	c236                	sw	a3,4(sp)
    16b4:	00249693          	slli	a3,s1,0x2
    16b8:	8edd                	or	a3,a3,a5
    16ba:	16fd                	addi	a3,a3,-1
    16bc:	4639                	li	a2,14
    16be:	12d66963          	bltu	a2,a3,17f0 <__muldf3+0x1ce>
    16c2:	00006617          	auipc	a2,0x6
    16c6:	bba60613          	addi	a2,a2,-1094 # 727c <__srodata+0x3c>
    16ca:	068a                	slli	a3,a3,0x2
    16cc:	96b2                	add	a3,a3,a2
    16ce:	4294                	lw	a3,0(a3)
    16d0:	96b2                	add	a3,a3,a2
    16d2:	8682                	jr	a3
    16d4:	00a365b3          	or	a1,t1,a0
    16d8:	c9ad                	beqz	a1,174a <__muldf3+0x128>
    16da:	c636                	sw	a3,12(sp)
    16dc:	c232                	sw	a2,4(sp)
    16de:	02030f63          	beqz	t1,171c <__muldf3+0xfa>
    16e2:	851a                	mv	a0,t1
    16e4:	c01a                	sw	t1,0(sp)
    16e6:	29b000ef          	jal	ra,2180 <__clzsi2>
    16ea:	4302                	lw	t1,0(sp)
    16ec:	4612                	lw	a2,4(sp)
    16ee:	46b2                	lw	a3,12(sp)
    16f0:	ff550713          	addi	a4,a0,-11
    16f4:	47f1                	li	a5,28
    16f6:	02e7cc63          	blt	a5,a4,172e <__muldf3+0x10c>
    16fa:	47f5                	li	a5,29
    16fc:	ff850593          	addi	a1,a0,-8
    1700:	8f99                	sub	a5,a5,a4
    1702:	00b31333          	sll	t1,t1,a1
    1706:	00f457b3          	srl	a5,s0,a5
    170a:	0067e333          	or	t1,a5,t1
    170e:	00b415b3          	sll	a1,s0,a1
    1712:	c0d00293          	li	t0,-1011
    1716:	40a282b3          	sub	t0,t0,a0
    171a:	bf81                	j	166a <__muldf3+0x48>
    171c:	c01a                	sw	t1,0(sp)
    171e:	263000ef          	jal	ra,2180 <__clzsi2>
    1722:	46b2                	lw	a3,12(sp)
    1724:	4612                	lw	a2,4(sp)
    1726:	4302                	lw	t1,0(sp)
    1728:	02050513          	addi	a0,a0,32
    172c:	b7d1                	j	16f0 <__muldf3+0xce>
    172e:	fd850313          	addi	t1,a0,-40
    1732:	00641333          	sll	t1,s0,t1
    1736:	4581                	li	a1,0
    1738:	bfe9                	j	1712 <__muldf3+0xf0>
    173a:	00a365b3          	or	a1,t1,a0
    173e:	c991                	beqz	a1,1752 <__muldf3+0x130>
    1740:	85aa                	mv	a1,a0
    1742:	7ff00293          	li	t0,2047
    1746:	448d                	li	s1,3
    1748:	b715                	j	166c <__muldf3+0x4a>
    174a:	4301                	li	t1,0
    174c:	4281                	li	t0,0
    174e:	4485                	li	s1,1
    1750:	bf31                	j	166c <__muldf3+0x4a>
    1752:	4301                	li	t1,0
    1754:	7ff00293          	li	t0,2047
    1758:	4489                	li	s1,2
    175a:	bf09                	j	166c <__muldf3+0x4a>
    175c:	00c46733          	or	a4,s0,a2
    1760:	cf3d                	beqz	a4,17de <__muldf3+0x1bc>
    1762:	04040263          	beqz	s0,17a6 <__muldf3+0x184>
    1766:	8522                	mv	a0,s0
    1768:	ca32                	sw	a2,20(sp)
    176a:	c81a                	sw	t1,16(sp)
    176c:	c22e                	sw	a1,4(sp)
    176e:	c016                	sw	t0,0(sp)
    1770:	211000ef          	jal	ra,2180 <__clzsi2>
    1774:	4282                	lw	t0,0(sp)
    1776:	4592                	lw	a1,4(sp)
    1778:	4342                	lw	t1,16(sp)
    177a:	4652                	lw	a2,20(sp)
    177c:	ff550693          	addi	a3,a0,-11
    1780:	47f1                	li	a5,28
    1782:	04d7c063          	blt	a5,a3,17c2 <__muldf3+0x1a0>
    1786:	47f5                	li	a5,29
    1788:	ff850713          	addi	a4,a0,-8
    178c:	8f95                	sub	a5,a5,a3
    178e:	00e41433          	sll	s0,s0,a4
    1792:	00f657b3          	srl	a5,a2,a5
    1796:	8c5d                	or	s0,s0,a5
    1798:	00e61733          	sll	a4,a2,a4
    179c:	c0d00793          	li	a5,-1011
    17a0:	40a78533          	sub	a0,a5,a0
    17a4:	bdf5                	j	16a0 <__muldf3+0x7e>
    17a6:	8532                	mv	a0,a2
    17a8:	ca1a                	sw	t1,20(sp)
    17aa:	c82e                	sw	a1,16(sp)
    17ac:	c216                	sw	t0,4(sp)
    17ae:	c032                	sw	a2,0(sp)
    17b0:	1d1000ef          	jal	ra,2180 <__clzsi2>
    17b4:	4352                	lw	t1,20(sp)
    17b6:	45c2                	lw	a1,16(sp)
    17b8:	4292                	lw	t0,4(sp)
    17ba:	4602                	lw	a2,0(sp)
    17bc:	02050513          	addi	a0,a0,32
    17c0:	bf75                	j	177c <__muldf3+0x15a>
    17c2:	fd850413          	addi	s0,a0,-40
    17c6:	00861433          	sll	s0,a2,s0
    17ca:	4701                	li	a4,0
    17cc:	bfc1                	j	179c <__muldf3+0x17a>
    17ce:	00c46733          	or	a4,s0,a2
    17d2:	cb11                	beqz	a4,17e6 <__muldf3+0x1c4>
    17d4:	8732                	mv	a4,a2
    17d6:	7ff00513          	li	a0,2047
    17da:	478d                	li	a5,3
    17dc:	b5d9                	j	16a2 <__muldf3+0x80>
    17de:	4401                	li	s0,0
    17e0:	4501                	li	a0,0
    17e2:	4785                	li	a5,1
    17e4:	bd7d                	j	16a2 <__muldf3+0x80>
    17e6:	4401                	li	s0,0
    17e8:	7ff00513          	li	a0,2047
    17ec:	4789                	li	a5,2
    17ee:	bd55                	j	16a2 <__muldf3+0x80>
    17f0:	0105d613          	srli	a2,a1,0x10
    17f4:	01075493          	srli	s1,a4,0x10
    17f8:	029606b3          	mul	a3,a2,s1
    17fc:	67c1                	lui	a5,0x10
    17fe:	17fd                	addi	a5,a5,-1
    1800:	8dfd                	and	a1,a1,a5
    1802:	8f7d                	and	a4,a4,a5
    1804:	02e603b3          	mul	t2,a2,a4
    1808:	c436                	sw	a3,8(sp)
    180a:	02b486b3          	mul	a3,s1,a1
    180e:	02e58533          	mul	a0,a1,a4
    1812:	969e                	add	a3,a3,t2
    1814:	82b6                	mv	t0,a3
    1816:	01055693          	srli	a3,a0,0x10
    181a:	9696                	add	a3,a3,t0
    181c:	0076f763          	bgeu	a3,t2,182a <__muldf3+0x208>
    1820:	029603b3          	mul	t2,a2,s1
    1824:	62c1                	lui	t0,0x10
    1826:	929e                	add	t0,t0,t2
    1828:	c416                	sw	t0,8(sp)
    182a:	0106d293          	srli	t0,a3,0x10
    182e:	8efd                	and	a3,a3,a5
    1830:	8d7d                	and	a0,a0,a5
    1832:	06c2                	slli	a3,a3,0x10
    1834:	96aa                	add	a3,a3,a0
    1836:	8fe1                	and	a5,a5,s0
    1838:	01045513          	srli	a0,s0,0x10
    183c:	02f603b3          	mul	t2,a2,a5
    1840:	ca36                	sw	a3,20(sp)
    1842:	02f586b3          	mul	a3,a1,a5
    1846:	02b505b3          	mul	a1,a0,a1
    184a:	0106d413          	srli	s0,a3,0x10
    184e:	959e                	add	a1,a1,t2
    1850:	95a2                	add	a1,a1,s0
    1852:	02a60633          	mul	a2,a2,a0
    1856:	0075f463          	bgeu	a1,t2,185e <__muldf3+0x23c>
    185a:	63c1                	lui	t2,0x10
    185c:	961e                	add	a2,a2,t2
    185e:	0105d393          	srli	t2,a1,0x10
    1862:	961e                	add	a2,a2,t2
    1864:	c632                	sw	a2,12(sp)
    1866:	6641                	lui	a2,0x10
    1868:	fff60393          	addi	t2,a2,-1 # ffff <__ctor_end__+0x776f>
    186c:	0075f5b3          	and	a1,a1,t2
    1870:	0076f6b3          	and	a3,a3,t2
    1874:	05c2                	slli	a1,a1,0x10
    1876:	95b6                	add	a1,a1,a3
    1878:	00b286b3          	add	a3,t0,a1
    187c:	01035293          	srli	t0,t1,0x10
    1880:	00737333          	and	t1,t1,t2
    1884:	026703b3          	mul	t2,a4,t1
    1888:	cc36                	sw	a3,24(sp)
    188a:	02e28733          	mul	a4,t0,a4
    188e:	026486b3          	mul	a3,s1,t1
    1892:	02548433          	mul	s0,s1,t0
    1896:	96ba                	add	a3,a3,a4
    1898:	0103d493          	srli	s1,t2,0x10
    189c:	96a6                	add	a3,a3,s1
    189e:	00e6f363          	bgeu	a3,a4,18a4 <__muldf3+0x282>
    18a2:	9432                	add	s0,s0,a2
    18a4:	0106d613          	srli	a2,a3,0x10
    18a8:	6741                	lui	a4,0x10
    18aa:	9622                	add	a2,a2,s0
    18ac:	fff70413          	addi	s0,a4,-1 # ffff <__ctor_end__+0x776f>
    18b0:	026784b3          	mul	s1,a5,t1
    18b4:	8ee1                	and	a3,a3,s0
    18b6:	06c2                	slli	a3,a3,0x10
    18b8:	0083f3b3          	and	t2,t2,s0
    18bc:	969e                	add	a3,a3,t2
    18be:	02f287b3          	mul	a5,t0,a5
    18c2:	02650333          	mul	t1,a0,t1
    18c6:	025502b3          	mul	t0,a0,t0
    18ca:	933e                	add	t1,t1,a5
    18cc:	0104d513          	srli	a0,s1,0x10
    18d0:	932a                	add	t1,t1,a0
    18d2:	00f37363          	bgeu	t1,a5,18d8 <__muldf3+0x2b6>
    18d6:	92ba                	add	t0,t0,a4
    18d8:	4762                	lw	a4,24(sp)
    18da:	47a2                	lw	a5,8(sp)
    18dc:	6541                	lui	a0,0x10
    18de:	157d                	addi	a0,a0,-1
    18e0:	97ba                	add	a5,a5,a4
    18e2:	00a37733          	and	a4,t1,a0
    18e6:	0742                	slli	a4,a4,0x10
    18e8:	8ce9                	and	s1,s1,a0
    18ea:	94ba                	add	s1,s1,a4
    18ec:	4732                	lw	a4,12(sp)
    18ee:	00b7b5b3          	sltu	a1,a5,a1
    18f2:	97b6                	add	a5,a5,a3
    18f4:	94ba                	add	s1,s1,a4
    18f6:	00b48533          	add	a0,s1,a1
    18fa:	00d7b6b3          	sltu	a3,a5,a3
    18fe:	00c50433          	add	s0,a0,a2
    1902:	00d403b3          	add	t2,s0,a3
    1906:	00e4b4b3          	sltu	s1,s1,a4
    190a:	00b535b3          	sltu	a1,a0,a1
    190e:	00d3b6b3          	sltu	a3,t2,a3
    1912:	8dc5                	or	a1,a1,s1
    1914:	01035313          	srli	t1,t1,0x10
    1918:	00c43433          	sltu	s0,s0,a2
    191c:	8c55                	or	s0,s0,a3
    191e:	959a                	add	a1,a1,t1
    1920:	942e                	add	s0,s0,a1
    1922:	46d2                	lw	a3,20(sp)
    1924:	92a2                	add	t0,t0,s0
    1926:	0173d713          	srli	a4,t2,0x17
    192a:	00929413          	slli	s0,t0,0x9
    192e:	8c59                	or	s0,s0,a4
    1930:	00979713          	slli	a4,a5,0x9
    1934:	8f55                	or	a4,a4,a3
    1936:	83dd                	srli	a5,a5,0x17
    1938:	00e03733          	snez	a4,a4
    193c:	8f5d                	or	a4,a4,a5
    193e:	010007b7          	lui	a5,0x1000
    1942:	03a6                	slli	t2,t2,0x9
    1944:	8fe1                	and	a5,a5,s0
    1946:	00776733          	or	a4,a4,t2
    194a:	c7dd                	beqz	a5,19f8 <__muldf3+0x3d6>
    194c:	00175793          	srli	a5,a4,0x1
    1950:	8b05                	andi	a4,a4,1
    1952:	8f5d                	or	a4,a4,a5
    1954:	01f41793          	slli	a5,s0,0x1f
    1958:	8f5d                	or	a4,a4,a5
    195a:	8005                	srli	s0,s0,0x1
    195c:	4792                	lw	a5,4(sp)
    195e:	3ff78793          	addi	a5,a5,1023 # 10003ff <__ctor_end__+0xff7b6f>
    1962:	08f05e63          	blez	a5,19fe <__muldf3+0x3dc>
    1966:	00777693          	andi	a3,a4,7
    196a:	ce81                	beqz	a3,1982 <__muldf3+0x360>
    196c:	00f77693          	andi	a3,a4,15
    1970:	4611                	li	a2,4
    1972:	00c68863          	beq	a3,a2,1982 <__muldf3+0x360>
    1976:	00470693          	addi	a3,a4,4
    197a:	00e6b733          	sltu	a4,a3,a4
    197e:	943a                	add	s0,s0,a4
    1980:	8736                	mv	a4,a3
    1982:	010006b7          	lui	a3,0x1000
    1986:	8ee1                	and	a3,a3,s0
    1988:	ca81                	beqz	a3,1998 <__muldf3+0x376>
    198a:	ff0007b7          	lui	a5,0xff000
    198e:	17fd                	addi	a5,a5,-1
    1990:	8c7d                	and	s0,s0,a5
    1992:	4792                	lw	a5,4(sp)
    1994:	40078793          	addi	a5,a5,1024 # ff000400 <__heap_end+0xdefd0400>
    1998:	7fe00693          	li	a3,2046
    199c:	0ef6ce63          	blt	a3,a5,1a98 <__muldf3+0x476>
    19a0:	01d41693          	slli	a3,s0,0x1d
    19a4:	830d                	srli	a4,a4,0x3
    19a6:	8f55                	or	a4,a4,a3
    19a8:	800d                	srli	s0,s0,0x3
    19aa:	7ff006b7          	lui	a3,0x7ff00
    19ae:	07d2                	slli	a5,a5,0x14
    19b0:	0432                	slli	s0,s0,0xc
    19b2:	8ff5                	and	a5,a5,a3
    19b4:	8031                	srli	s0,s0,0xc
    19b6:	8c5d                	or	s0,s0,a5
    19b8:	4782                	lw	a5,0(sp)
    19ba:	5092                	lw	ra,36(sp)
    19bc:	44f2                	lw	s1,28(sp)
    19be:	07fe                	slli	a5,a5,0x1f
    19c0:	00f466b3          	or	a3,s0,a5
    19c4:	5402                	lw	s0,32(sp)
    19c6:	853a                	mv	a0,a4
    19c8:	85b6                	mv	a1,a3
    19ca:	02810113          	addi	sp,sp,40
    19ce:	8082                	ret
    19d0:	47a2                	lw	a5,8(sp)
    19d2:	c03e                	sw	a5,0(sp)
    19d4:	841a                	mv	s0,t1
    19d6:	872e                	mv	a4,a1
    19d8:	87a6                	mv	a5,s1
    19da:	4689                	li	a3,2
    19dc:	0ad78e63          	beq	a5,a3,1a98 <__muldf3+0x476>
    19e0:	468d                	li	a3,3
    19e2:	0ad78463          	beq	a5,a3,1a8a <__muldf3+0x468>
    19e6:	4685                	li	a3,1
    19e8:	f6d79ae3          	bne	a5,a3,195c <__muldf3+0x33a>
    19ec:	4401                	li	s0,0
    19ee:	4701                	li	a4,0
    19f0:	a0b5                	j	1a5c <__muldf3+0x43a>
    19f2:	46b2                	lw	a3,12(sp)
    19f4:	c036                	sw	a3,0(sp)
    19f6:	b7d5                	j	19da <__muldf3+0x3b8>
    19f8:	47c2                	lw	a5,16(sp)
    19fa:	c23e                	sw	a5,4(sp)
    19fc:	b785                	j	195c <__muldf3+0x33a>
    19fe:	4605                	li	a2,1
    1a00:	8e1d                	sub	a2,a2,a5
    1a02:	03800693          	li	a3,56
    1a06:	fec6c3e3          	blt	a3,a2,19ec <__muldf3+0x3ca>
    1a0a:	46fd                	li	a3,31
    1a0c:	04c6ca63          	blt	a3,a2,1a60 <__muldf3+0x43e>
    1a10:	4792                	lw	a5,4(sp)
    1a12:	00c755b3          	srl	a1,a4,a2
    1a16:	41e78793          	addi	a5,a5,1054
    1a1a:	00f416b3          	sll	a3,s0,a5
    1a1e:	00f71733          	sll	a4,a4,a5
    1a22:	8ecd                	or	a3,a3,a1
    1a24:	00e03733          	snez	a4,a4
    1a28:	8f55                	or	a4,a4,a3
    1a2a:	00c45433          	srl	s0,s0,a2
    1a2e:	00777793          	andi	a5,a4,7
    1a32:	cf81                	beqz	a5,1a4a <__muldf3+0x428>
    1a34:	00f77793          	andi	a5,a4,15
    1a38:	4691                	li	a3,4
    1a3a:	00d78863          	beq	a5,a3,1a4a <__muldf3+0x428>
    1a3e:	00470793          	addi	a5,a4,4
    1a42:	00e7b733          	sltu	a4,a5,a4
    1a46:	943a                	add	s0,s0,a4
    1a48:	873e                	mv	a4,a5
    1a4a:	008007b7          	lui	a5,0x800
    1a4e:	8fe1                	and	a5,a5,s0
    1a50:	eba9                	bnez	a5,1aa2 <__muldf3+0x480>
    1a52:	01d41793          	slli	a5,s0,0x1d
    1a56:	830d                	srli	a4,a4,0x3
    1a58:	8f5d                	or	a4,a4,a5
    1a5a:	800d                	srli	s0,s0,0x3
    1a5c:	4781                	li	a5,0
    1a5e:	b7b1                	j	19aa <__muldf3+0x388>
    1a60:	5685                	li	a3,-31
    1a62:	40f687b3          	sub	a5,a3,a5
    1a66:	02000593          	li	a1,32
    1a6a:	00f457b3          	srl	a5,s0,a5
    1a6e:	4681                	li	a3,0
    1a70:	00b60763          	beq	a2,a1,1a7e <__muldf3+0x45c>
    1a74:	4692                	lw	a3,4(sp)
    1a76:	43e68693          	addi	a3,a3,1086 # 7ff0043e <__heap_end+0x5fed043e>
    1a7a:	00d416b3          	sll	a3,s0,a3
    1a7e:	8f55                	or	a4,a4,a3
    1a80:	00e03733          	snez	a4,a4
    1a84:	8f5d                	or	a4,a4,a5
    1a86:	4401                	li	s0,0
    1a88:	b75d                	j	1a2e <__muldf3+0x40c>
    1a8a:	00080437          	lui	s0,0x80
    1a8e:	4701                	li	a4,0
    1a90:	7ff00793          	li	a5,2047
    1a94:	c002                	sw	zero,0(sp)
    1a96:	bf11                	j	19aa <__muldf3+0x388>
    1a98:	4401                	li	s0,0
    1a9a:	4701                	li	a4,0
    1a9c:	7ff00793          	li	a5,2047
    1aa0:	b729                	j	19aa <__muldf3+0x388>
    1aa2:	4401                	li	s0,0
    1aa4:	4701                	li	a4,0
    1aa6:	4785                	li	a5,1
    1aa8:	b709                	j	19aa <__muldf3+0x388>

00001aaa <__subdf3>:
    1aaa:	00100337          	lui	t1,0x100
    1aae:	137d                	addi	t1,t1,-1
    1ab0:	1131                	addi	sp,sp,-20
    1ab2:	00b377b3          	and	a5,t1,a1
    1ab6:	0145d713          	srli	a4,a1,0x14
    1aba:	c426                	sw	s1,8(sp)
    1abc:	078e                	slli	a5,a5,0x3
    1abe:	7ff77493          	andi	s1,a4,2047
    1ac2:	01d55713          	srli	a4,a0,0x1d
    1ac6:	8fd9                	or	a5,a5,a4
    1ac8:	00d37733          	and	a4,t1,a3
    1acc:	c622                	sw	s0,12(sp)
    1ace:	0146d313          	srli	t1,a3,0x14
    1ad2:	01f5d413          	srli	s0,a1,0x1f
    1ad6:	070e                	slli	a4,a4,0x3
    1ad8:	01d65593          	srli	a1,a2,0x1d
    1adc:	8f4d                	or	a4,a4,a1
    1ade:	c806                	sw	ra,16(sp)
    1ae0:	7ff37313          	andi	t1,t1,2047
    1ae4:	7ff00593          	li	a1,2047
    1ae8:	050e                	slli	a0,a0,0x3
    1aea:	82fd                	srli	a3,a3,0x1f
    1aec:	060e                	slli	a2,a2,0x3
    1aee:	00b31563          	bne	t1,a1,1af8 <__subdf3+0x4e>
    1af2:	00c765b3          	or	a1,a4,a2
    1af6:	e199                	bnez	a1,1afc <__subdf3+0x52>
    1af8:	0016c693          	xori	a3,a3,1
    1afc:	406482b3          	sub	t0,s1,t1
    1b00:	22869563          	bne	a3,s0,1d2a <__subdf3+0x280>
    1b04:	0e505263          	blez	t0,1be8 <__subdf3+0x13e>
    1b08:	02031863          	bnez	t1,1b38 <__subdf3+0x8e>
    1b0c:	00c766b3          	or	a3,a4,a2
    1b10:	56068f63          	beqz	a3,208e <__subdf3+0x5e4>
    1b14:	fff28593          	addi	a1,t0,-1 # ffff <__ctor_end__+0x776f>
    1b18:	e989                	bnez	a1,1b2a <__subdf3+0x80>
    1b1a:	962a                	add	a2,a2,a0
    1b1c:	00a63533          	sltu	a0,a2,a0
    1b20:	97ba                	add	a5,a5,a4
    1b22:	97aa                	add	a5,a5,a0
    1b24:	8532                	mv	a0,a2
    1b26:	4485                	li	s1,1
    1b28:	a8b9                	j	1b86 <__subdf3+0xdc>
    1b2a:	7ff00693          	li	a3,2047
    1b2e:	00d29d63          	bne	t0,a3,1b48 <__subdf3+0x9e>
    1b32:	7ff00493          	li	s1,2047
    1b36:	aa79                	j	1cd4 <__subdf3+0x22a>
    1b38:	7ff00693          	li	a3,2047
    1b3c:	18d48c63          	beq	s1,a3,1cd4 <__subdf3+0x22a>
    1b40:	008006b7          	lui	a3,0x800
    1b44:	8f55                	or	a4,a4,a3
    1b46:	8596                	mv	a1,t0
    1b48:	03800693          	li	a3,56
    1b4c:	08b6ca63          	blt	a3,a1,1be0 <__subdf3+0x136>
    1b50:	46fd                	li	a3,31
    1b52:	06b6c163          	blt	a3,a1,1bb4 <__subdf3+0x10a>
    1b56:	02000313          	li	t1,32
    1b5a:	40b30333          	sub	t1,t1,a1
    1b5e:	006716b3          	sll	a3,a4,t1
    1b62:	00b652b3          	srl	t0,a2,a1
    1b66:	00661633          	sll	a2,a2,t1
    1b6a:	0056e6b3          	or	a3,a3,t0
    1b6e:	00c03633          	snez	a2,a2
    1b72:	8e55                	or	a2,a2,a3
    1b74:	00b75733          	srl	a4,a4,a1
    1b78:	962a                	add	a2,a2,a0
    1b7a:	00a63533          	sltu	a0,a2,a0
    1b7e:	973e                	add	a4,a4,a5
    1b80:	00a707b3          	add	a5,a4,a0
    1b84:	8532                	mv	a0,a2
    1b86:	00800737          	lui	a4,0x800
    1b8a:	8f7d                	and	a4,a4,a5
    1b8c:	14070463          	beqz	a4,1cd4 <__subdf3+0x22a>
    1b90:	0485                	addi	s1,s1,1
    1b92:	7ff00713          	li	a4,2047
    1b96:	48e48c63          	beq	s1,a4,202e <__subdf3+0x584>
    1b9a:	ff800737          	lui	a4,0xff800
    1b9e:	177d                	addi	a4,a4,-1
    1ba0:	8ff9                	and	a5,a5,a4
    1ba2:	00155713          	srli	a4,a0,0x1
    1ba6:	8905                	andi	a0,a0,1
    1ba8:	8d59                	or	a0,a0,a4
    1baa:	01f79713          	slli	a4,a5,0x1f
    1bae:	8d59                	or	a0,a0,a4
    1bb0:	8385                	srli	a5,a5,0x1
    1bb2:	a20d                	j	1cd4 <__subdf3+0x22a>
    1bb4:	fe058693          	addi	a3,a1,-32
    1bb8:	02000293          	li	t0,32
    1bbc:	00d756b3          	srl	a3,a4,a3
    1bc0:	4301                	li	t1,0
    1bc2:	00558863          	beq	a1,t0,1bd2 <__subdf3+0x128>
    1bc6:	04000313          	li	t1,64
    1bca:	40b305b3          	sub	a1,t1,a1
    1bce:	00b71333          	sll	t1,a4,a1
    1bd2:	00c36633          	or	a2,t1,a2
    1bd6:	00c03633          	snez	a2,a2
    1bda:	8e55                	or	a2,a2,a3
    1bdc:	4701                	li	a4,0
    1bde:	bf69                	j	1b78 <__subdf3+0xce>
    1be0:	8e59                	or	a2,a2,a4
    1be2:	00c03633          	snez	a2,a2
    1be6:	bfdd                	j	1bdc <__subdf3+0x132>
    1be8:	0a028a63          	beqz	t0,1c9c <__subdf3+0x1f2>
    1bec:	409305b3          	sub	a1,t1,s1
    1bf0:	e48d                	bnez	s1,1c1a <__subdf3+0x170>
    1bf2:	00a7e6b3          	or	a3,a5,a0
    1bf6:	42068363          	beqz	a3,201c <__subdf3+0x572>
    1bfa:	fff58693          	addi	a3,a1,-1
    1bfe:	e699                	bnez	a3,1c0c <__subdf3+0x162>
    1c00:	9532                	add	a0,a0,a2
    1c02:	97ba                	add	a5,a5,a4
    1c04:	00c53633          	sltu	a2,a0,a2
    1c08:	97b2                	add	a5,a5,a2
    1c0a:	bf31                	j	1b26 <__subdf3+0x7c>
    1c0c:	7ff00293          	li	t0,2047
    1c10:	00559d63          	bne	a1,t0,1c2a <__subdf3+0x180>
    1c14:	87ba                	mv	a5,a4
    1c16:	8532                	mv	a0,a2
    1c18:	bf29                	j	1b32 <__subdf3+0x88>
    1c1a:	7ff00693          	li	a3,2047
    1c1e:	fed30be3          	beq	t1,a3,1c14 <__subdf3+0x16a>
    1c22:	008006b7          	lui	a3,0x800
    1c26:	8fd5                	or	a5,a5,a3
    1c28:	86ae                	mv	a3,a1
    1c2a:	03800593          	li	a1,56
    1c2e:	06d5c363          	blt	a1,a3,1c94 <__subdf3+0x1ea>
    1c32:	45fd                	li	a1,31
    1c34:	02d5ca63          	blt	a1,a3,1c68 <__subdf3+0x1be>
    1c38:	02000293          	li	t0,32
    1c3c:	40d282b3          	sub	t0,t0,a3
    1c40:	005795b3          	sll	a1,a5,t0
    1c44:	00d553b3          	srl	t2,a0,a3
    1c48:	00551533          	sll	a0,a0,t0
    1c4c:	0075e5b3          	or	a1,a1,t2
    1c50:	00a03533          	snez	a0,a0
    1c54:	8d4d                	or	a0,a0,a1
    1c56:	00d7d7b3          	srl	a5,a5,a3
    1c5a:	9532                	add	a0,a0,a2
    1c5c:	97ba                	add	a5,a5,a4
    1c5e:	00c53633          	sltu	a2,a0,a2
    1c62:	97b2                	add	a5,a5,a2
    1c64:	849a                	mv	s1,t1
    1c66:	b705                	j	1b86 <__subdf3+0xdc>
    1c68:	fe068593          	addi	a1,a3,-32 # 7fffe0 <__ctor_end__+0x7f7750>
    1c6c:	02000393          	li	t2,32
    1c70:	00b7d5b3          	srl	a1,a5,a1
    1c74:	4281                	li	t0,0
    1c76:	00768863          	beq	a3,t2,1c86 <__subdf3+0x1dc>
    1c7a:	04000293          	li	t0,64
    1c7e:	40d286b3          	sub	a3,t0,a3
    1c82:	00d792b3          	sll	t0,a5,a3
    1c86:	00a2e533          	or	a0,t0,a0
    1c8a:	00a03533          	snez	a0,a0
    1c8e:	8d4d                	or	a0,a0,a1
    1c90:	4781                	li	a5,0
    1c92:	b7e1                	j	1c5a <__subdf3+0x1b0>
    1c94:	8d5d                	or	a0,a0,a5
    1c96:	00a03533          	snez	a0,a0
    1c9a:	bfdd                	j	1c90 <__subdf3+0x1e6>
    1c9c:	00148693          	addi	a3,s1,1
    1ca0:	7fe6f593          	andi	a1,a3,2046
    1ca4:	e1bd                	bnez	a1,1d0a <__subdf3+0x260>
    1ca6:	00a7e6b3          	or	a3,a5,a0
    1caa:	e4a9                	bnez	s1,1cf4 <__subdf3+0x24a>
    1cac:	36068c63          	beqz	a3,2024 <__subdf3+0x57a>
    1cb0:	00c766b3          	or	a3,a4,a2
    1cb4:	c285                	beqz	a3,1cd4 <__subdf3+0x22a>
    1cb6:	962a                	add	a2,a2,a0
    1cb8:	97ba                	add	a5,a5,a4
    1cba:	00a63533          	sltu	a0,a2,a0
    1cbe:	97aa                	add	a5,a5,a0
    1cc0:	00800737          	lui	a4,0x800
    1cc4:	8f7d                	and	a4,a4,a5
    1cc6:	8532                	mv	a0,a2
    1cc8:	c711                	beqz	a4,1cd4 <__subdf3+0x22a>
    1cca:	ff800737          	lui	a4,0xff800
    1cce:	177d                	addi	a4,a4,-1
    1cd0:	8ff9                	and	a5,a5,a4
    1cd2:	4485                	li	s1,1
    1cd4:	00757713          	andi	a4,a0,7
    1cd8:	34070d63          	beqz	a4,2032 <__subdf3+0x588>
    1cdc:	00f57713          	andi	a4,a0,15
    1ce0:	4691                	li	a3,4
    1ce2:	34d70863          	beq	a4,a3,2032 <__subdf3+0x588>
    1ce6:	00450713          	addi	a4,a0,4 # 10004 <__ctor_end__+0x7774>
    1cea:	00a73533          	sltu	a0,a4,a0
    1cee:	97aa                	add	a5,a5,a0
    1cf0:	853a                	mv	a0,a4
    1cf2:	a681                	j	2032 <__subdf3+0x588>
    1cf4:	d285                	beqz	a3,1c14 <__subdf3+0x16a>
    1cf6:	8e59                	or	a2,a2,a4
    1cf8:	e2060de3          	beqz	a2,1b32 <__subdf3+0x88>
    1cfc:	4401                	li	s0,0
    1cfe:	004007b7          	lui	a5,0x400
    1d02:	4501                	li	a0,0
    1d04:	7ff00493          	li	s1,2047
    1d08:	a62d                	j	2032 <__subdf3+0x588>
    1d0a:	7ff00593          	li	a1,2047
    1d0e:	30b68e63          	beq	a3,a1,202a <__subdf3+0x580>
    1d12:	962a                	add	a2,a2,a0
    1d14:	00a63533          	sltu	a0,a2,a0
    1d18:	97ba                	add	a5,a5,a4
    1d1a:	97aa                	add	a5,a5,a0
    1d1c:	01f79513          	slli	a0,a5,0x1f
    1d20:	8205                	srli	a2,a2,0x1
    1d22:	8d51                	or	a0,a0,a2
    1d24:	8385                	srli	a5,a5,0x1
    1d26:	84b6                	mv	s1,a3
    1d28:	b775                	j	1cd4 <__subdf3+0x22a>
    1d2a:	0c505563          	blez	t0,1df4 <__subdf3+0x34a>
    1d2e:	08031063          	bnez	t1,1dae <__subdf3+0x304>
    1d32:	00c766b3          	or	a3,a4,a2
    1d36:	34068c63          	beqz	a3,208e <__subdf3+0x5e4>
    1d3a:	fff28593          	addi	a1,t0,-1
    1d3e:	e991                	bnez	a1,1d52 <__subdf3+0x2a8>
    1d40:	40c50633          	sub	a2,a0,a2
    1d44:	00c53533          	sltu	a0,a0,a2
    1d48:	8f99                	sub	a5,a5,a4
    1d4a:	8f89                	sub	a5,a5,a0
    1d4c:	8532                	mv	a0,a2
    1d4e:	4485                	li	s1,1
    1d50:	a0b1                	j	1d9c <__subdf3+0x2f2>
    1d52:	7ff00693          	li	a3,2047
    1d56:	dcd28ee3          	beq	t0,a3,1b32 <__subdf3+0x88>
    1d5a:	03800693          	li	a3,56
    1d5e:	08b6c763          	blt	a3,a1,1dec <__subdf3+0x342>
    1d62:	46fd                	li	a3,31
    1d64:	04b6ce63          	blt	a3,a1,1dc0 <__subdf3+0x316>
    1d68:	02000313          	li	t1,32
    1d6c:	40b30333          	sub	t1,t1,a1
    1d70:	006716b3          	sll	a3,a4,t1
    1d74:	00b652b3          	srl	t0,a2,a1
    1d78:	00661633          	sll	a2,a2,t1
    1d7c:	0056e6b3          	or	a3,a3,t0
    1d80:	00c03633          	snez	a2,a2
    1d84:	8e55                	or	a2,a2,a3
    1d86:	00b75733          	srl	a4,a4,a1
    1d8a:	40c50633          	sub	a2,a0,a2
    1d8e:	00c53533          	sltu	a0,a0,a2
    1d92:	40e78733          	sub	a4,a5,a4
    1d96:	40a707b3          	sub	a5,a4,a0
    1d9a:	8532                	mv	a0,a2
    1d9c:	008005b7          	lui	a1,0x800
    1da0:	00b7f733          	and	a4,a5,a1
    1da4:	db05                	beqz	a4,1cd4 <__subdf3+0x22a>
    1da6:	15fd                	addi	a1,a1,-1
    1da8:	8dfd                	and	a1,a1,a5
    1daa:	832a                	mv	t1,a0
    1dac:	aa5d                	j	1f62 <__subdf3+0x4b8>
    1dae:	7ff00693          	li	a3,2047
    1db2:	f2d481e3          	beq	s1,a3,1cd4 <__subdf3+0x22a>
    1db6:	008006b7          	lui	a3,0x800
    1dba:	8f55                	or	a4,a4,a3
    1dbc:	8596                	mv	a1,t0
    1dbe:	bf71                	j	1d5a <__subdf3+0x2b0>
    1dc0:	fe058693          	addi	a3,a1,-32 # 7fffe0 <__ctor_end__+0x7f7750>
    1dc4:	02000293          	li	t0,32
    1dc8:	00d756b3          	srl	a3,a4,a3
    1dcc:	4301                	li	t1,0
    1dce:	00558863          	beq	a1,t0,1dde <__subdf3+0x334>
    1dd2:	04000313          	li	t1,64
    1dd6:	40b305b3          	sub	a1,t1,a1
    1dda:	00b71333          	sll	t1,a4,a1
    1dde:	00c36633          	or	a2,t1,a2
    1de2:	00c03633          	snez	a2,a2
    1de6:	8e55                	or	a2,a2,a3
    1de8:	4701                	li	a4,0
    1dea:	b745                	j	1d8a <__subdf3+0x2e0>
    1dec:	8e59                	or	a2,a2,a4
    1dee:	00c03633          	snez	a2,a2
    1df2:	bfdd                	j	1de8 <__subdf3+0x33e>
    1df4:	0c028463          	beqz	t0,1ebc <__subdf3+0x412>
    1df8:	409302b3          	sub	t0,t1,s1
    1dfc:	e895                	bnez	s1,1e30 <__subdf3+0x386>
    1dfe:	00a7e5b3          	or	a1,a5,a0
    1e02:	28058863          	beqz	a1,2092 <__subdf3+0x5e8>
    1e06:	fff28593          	addi	a1,t0,-1
    1e0a:	e991                	bnez	a1,1e1e <__subdf3+0x374>
    1e0c:	40a60533          	sub	a0,a2,a0
    1e10:	40f707b3          	sub	a5,a4,a5
    1e14:	00a63633          	sltu	a2,a2,a0
    1e18:	8f91                	sub	a5,a5,a2
    1e1a:	8436                	mv	s0,a3
    1e1c:	bf0d                	j	1d4e <__subdf3+0x2a4>
    1e1e:	7ff00393          	li	t2,2047
    1e22:	00729f63          	bne	t0,t2,1e40 <__subdf3+0x396>
    1e26:	87ba                	mv	a5,a4
    1e28:	8532                	mv	a0,a2
    1e2a:	7ff00493          	li	s1,2047
    1e2e:	a07d                	j	1edc <__subdf3+0x432>
    1e30:	7ff00593          	li	a1,2047
    1e34:	feb309e3          	beq	t1,a1,1e26 <__subdf3+0x37c>
    1e38:	008005b7          	lui	a1,0x800
    1e3c:	8fcd                	or	a5,a5,a1
    1e3e:	8596                	mv	a1,t0
    1e40:	03800293          	li	t0,56
    1e44:	06b2c863          	blt	t0,a1,1eb4 <__subdf3+0x40a>
    1e48:	42fd                	li	t0,31
    1e4a:	02b2ce63          	blt	t0,a1,1e86 <__subdf3+0x3dc>
    1e4e:	02000393          	li	t2,32
    1e52:	40b383b3          	sub	t2,t2,a1
    1e56:	007792b3          	sll	t0,a5,t2
    1e5a:	00b55433          	srl	s0,a0,a1
    1e5e:	00751533          	sll	a0,a0,t2
    1e62:	0082e2b3          	or	t0,t0,s0
    1e66:	00a03533          	snez	a0,a0
    1e6a:	00a2e533          	or	a0,t0,a0
    1e6e:	00b7d7b3          	srl	a5,a5,a1
    1e72:	40a60533          	sub	a0,a2,a0
    1e76:	40f707b3          	sub	a5,a4,a5
    1e7a:	00a63633          	sltu	a2,a2,a0
    1e7e:	8f91                	sub	a5,a5,a2
    1e80:	849a                	mv	s1,t1
    1e82:	8436                	mv	s0,a3
    1e84:	bf21                	j	1d9c <__subdf3+0x2f2>
    1e86:	fe058293          	addi	t0,a1,-32 # 7fffe0 <__ctor_end__+0x7f7750>
    1e8a:	02000413          	li	s0,32
    1e8e:	0057d2b3          	srl	t0,a5,t0
    1e92:	4381                	li	t2,0
    1e94:	00858863          	beq	a1,s0,1ea4 <__subdf3+0x3fa>
    1e98:	04000393          	li	t2,64
    1e9c:	40b385b3          	sub	a1,t2,a1
    1ea0:	00b793b3          	sll	t2,a5,a1
    1ea4:	00a3e533          	or	a0,t2,a0
    1ea8:	00a03533          	snez	a0,a0
    1eac:	00a2e533          	or	a0,t0,a0
    1eb0:	4781                	li	a5,0
    1eb2:	b7c1                	j	1e72 <__subdf3+0x3c8>
    1eb4:	8d5d                	or	a0,a0,a5
    1eb6:	00a03533          	snez	a0,a0
    1eba:	bfdd                	j	1eb0 <__subdf3+0x406>
    1ebc:	00148593          	addi	a1,s1,1
    1ec0:	7fe5f593          	andi	a1,a1,2046
    1ec4:	e9a5                	bnez	a1,1f34 <__subdf3+0x48a>
    1ec6:	00a7e333          	or	t1,a5,a0
    1eca:	00c765b3          	or	a1,a4,a2
    1ece:	e8a1                	bnez	s1,1f1e <__subdf3+0x474>
    1ed0:	00031863          	bnez	t1,1ee0 <__subdf3+0x436>
    1ed4:	1c058363          	beqz	a1,209a <__subdf3+0x5f0>
    1ed8:	87ba                	mv	a5,a4
    1eda:	8532                	mv	a0,a2
    1edc:	8436                	mv	s0,a3
    1ede:	bbdd                	j	1cd4 <__subdf3+0x22a>
    1ee0:	de058ae3          	beqz	a1,1cd4 <__subdf3+0x22a>
    1ee4:	40c50333          	sub	t1,a0,a2
    1ee8:	006532b3          	sltu	t0,a0,t1
    1eec:	40e785b3          	sub	a1,a5,a4
    1ef0:	405585b3          	sub	a1,a1,t0
    1ef4:	008002b7          	lui	t0,0x800
    1ef8:	0055f2b3          	and	t0,a1,t0
    1efc:	00028a63          	beqz	t0,1f10 <__subdf3+0x466>
    1f00:	40a60533          	sub	a0,a2,a0
    1f04:	40f707b3          	sub	a5,a4,a5
    1f08:	00a63633          	sltu	a2,a2,a0
    1f0c:	8f91                	sub	a5,a5,a2
    1f0e:	b7f9                	j	1edc <__subdf3+0x432>
    1f10:	00b36533          	or	a0,t1,a1
    1f14:	18050763          	beqz	a0,20a2 <__subdf3+0x5f8>
    1f18:	87ae                	mv	a5,a1
    1f1a:	851a                	mv	a0,t1
    1f1c:	bb65                	j	1cd4 <__subdf3+0x22a>
    1f1e:	00031863          	bnez	t1,1f2e <__subdf3+0x484>
    1f22:	18058263          	beqz	a1,20a6 <__subdf3+0x5fc>
    1f26:	87ba                	mv	a5,a4
    1f28:	8532                	mv	a0,a2
    1f2a:	8436                	mv	s0,a3
    1f2c:	b119                	j	1b32 <__subdf3+0x88>
    1f2e:	c00582e3          	beqz	a1,1b32 <__subdf3+0x88>
    1f32:	b3e9                	j	1cfc <__subdf3+0x252>
    1f34:	40c50333          	sub	t1,a0,a2
    1f38:	006532b3          	sltu	t0,a0,t1
    1f3c:	40e785b3          	sub	a1,a5,a4
    1f40:	405585b3          	sub	a1,a1,t0
    1f44:	008002b7          	lui	t0,0x800
    1f48:	0055f2b3          	and	t0,a1,t0
    1f4c:	06028a63          	beqz	t0,1fc0 <__subdf3+0x516>
    1f50:	40a60333          	sub	t1,a2,a0
    1f54:	40f707b3          	sub	a5,a4,a5
    1f58:	00663633          	sltu	a2,a2,t1
    1f5c:	40c785b3          	sub	a1,a5,a2
    1f60:	8436                	mv	s0,a3
    1f62:	c5ad                	beqz	a1,1fcc <__subdf3+0x522>
    1f64:	852e                	mv	a0,a1
    1f66:	c21a                	sw	t1,4(sp)
    1f68:	c02e                	sw	a1,0(sp)
    1f6a:	2c19                	jal	2180 <__clzsi2>
    1f6c:	4582                	lw	a1,0(sp)
    1f6e:	4312                	lw	t1,4(sp)
    1f70:	ff850713          	addi	a4,a0,-8
    1f74:	47fd                	li	a5,31
    1f76:	06e7c463          	blt	a5,a4,1fde <__subdf3+0x534>
    1f7a:	02000793          	li	a5,32
    1f7e:	8f99                	sub	a5,a5,a4
    1f80:	00e595b3          	sll	a1,a1,a4
    1f84:	00f357b3          	srl	a5,t1,a5
    1f88:	8fcd                	or	a5,a5,a1
    1f8a:	00e31533          	sll	a0,t1,a4
    1f8e:	08974163          	blt	a4,s1,2010 <__subdf3+0x566>
    1f92:	8f05                	sub	a4,a4,s1
    1f94:	00170613          	addi	a2,a4,1 # ff800001 <__heap_end+0xdf7d0001>
    1f98:	46fd                	li	a3,31
    1f9a:	04c6c863          	blt	a3,a2,1fea <__subdf3+0x540>
    1f9e:	02000713          	li	a4,32
    1fa2:	8f11                	sub	a4,a4,a2
    1fa4:	00e796b3          	sll	a3,a5,a4
    1fa8:	00c555b3          	srl	a1,a0,a2
    1fac:	00e51533          	sll	a0,a0,a4
    1fb0:	8ecd                	or	a3,a3,a1
    1fb2:	00a03533          	snez	a0,a0
    1fb6:	8d55                	or	a0,a0,a3
    1fb8:	00c7d7b3          	srl	a5,a5,a2
    1fbc:	4481                	li	s1,0
    1fbe:	bb19                	j	1cd4 <__subdf3+0x22a>
    1fc0:	00b36533          	or	a0,t1,a1
    1fc4:	fd59                	bnez	a0,1f62 <__subdf3+0x4b8>
    1fc6:	4781                	li	a5,0
    1fc8:	4481                	li	s1,0
    1fca:	a8d1                	j	209e <__subdf3+0x5f4>
    1fcc:	851a                	mv	a0,t1
    1fce:	c22e                	sw	a1,4(sp)
    1fd0:	c01a                	sw	t1,0(sp)
    1fd2:	227d                	jal	2180 <__clzsi2>
    1fd4:	4592                	lw	a1,4(sp)
    1fd6:	4302                	lw	t1,0(sp)
    1fd8:	02050513          	addi	a0,a0,32
    1fdc:	bf51                	j	1f70 <__subdf3+0x4c6>
    1fde:	fd850793          	addi	a5,a0,-40
    1fe2:	00f317b3          	sll	a5,t1,a5
    1fe6:	4501                	li	a0,0
    1fe8:	b75d                	j	1f8e <__subdf3+0x4e4>
    1fea:	1705                	addi	a4,a4,-31
    1fec:	02000593          	li	a1,32
    1ff0:	00e7d733          	srl	a4,a5,a4
    1ff4:	4681                	li	a3,0
    1ff6:	00b60763          	beq	a2,a1,2004 <__subdf3+0x55a>
    1ffa:	04000693          	li	a3,64
    1ffe:	8e91                	sub	a3,a3,a2
    2000:	00d796b3          	sll	a3,a5,a3
    2004:	8d55                	or	a0,a0,a3
    2006:	00a03533          	snez	a0,a0
    200a:	8d59                	or	a0,a0,a4
    200c:	4781                	li	a5,0
    200e:	b77d                	j	1fbc <__subdf3+0x512>
    2010:	8c99                	sub	s1,s1,a4
    2012:	ff800737          	lui	a4,0xff800
    2016:	177d                	addi	a4,a4,-1
    2018:	8ff9                	and	a5,a5,a4
    201a:	b96d                	j	1cd4 <__subdf3+0x22a>
    201c:	87ba                	mv	a5,a4
    201e:	8532                	mv	a0,a2
    2020:	84ae                	mv	s1,a1
    2022:	b94d                	j	1cd4 <__subdf3+0x22a>
    2024:	87ba                	mv	a5,a4
    2026:	8532                	mv	a0,a2
    2028:	b175                	j	1cd4 <__subdf3+0x22a>
    202a:	7ff00493          	li	s1,2047
    202e:	4781                	li	a5,0
    2030:	4501                	li	a0,0
    2032:	00800737          	lui	a4,0x800
    2036:	8f7d                	and	a4,a4,a5
    2038:	cb11                	beqz	a4,204c <__subdf3+0x5a2>
    203a:	0485                	addi	s1,s1,1
    203c:	7ff00713          	li	a4,2047
    2040:	06e48863          	beq	s1,a4,20b0 <__subdf3+0x606>
    2044:	ff800737          	lui	a4,0xff800
    2048:	177d                	addi	a4,a4,-1
    204a:	8ff9                	and	a5,a5,a4
    204c:	01d79713          	slli	a4,a5,0x1d
    2050:	810d                	srli	a0,a0,0x3
    2052:	8d59                	or	a0,a0,a4
    2054:	7ff00713          	li	a4,2047
    2058:	838d                	srli	a5,a5,0x3
    205a:	00e49963          	bne	s1,a4,206c <__subdf3+0x5c2>
    205e:	8d5d                	or	a0,a0,a5
    2060:	4781                	li	a5,0
    2062:	c509                	beqz	a0,206c <__subdf3+0x5c2>
    2064:	000807b7          	lui	a5,0x80
    2068:	4501                	li	a0,0
    206a:	4401                	li	s0,0
    206c:	01449713          	slli	a4,s1,0x14
    2070:	7ff006b7          	lui	a3,0x7ff00
    2074:	07b2                	slli	a5,a5,0xc
    2076:	8f75                	and	a4,a4,a3
    2078:	83b1                	srli	a5,a5,0xc
    207a:	047e                	slli	s0,s0,0x1f
    207c:	8fd9                	or	a5,a5,a4
    207e:	40c2                	lw	ra,16(sp)
    2080:	0087e733          	or	a4,a5,s0
    2084:	4432                	lw	s0,12(sp)
    2086:	44a2                	lw	s1,8(sp)
    2088:	85ba                	mv	a1,a4
    208a:	0151                	addi	sp,sp,20
    208c:	8082                	ret
    208e:	8496                	mv	s1,t0
    2090:	b191                	j	1cd4 <__subdf3+0x22a>
    2092:	87ba                	mv	a5,a4
    2094:	8532                	mv	a0,a2
    2096:	8496                	mv	s1,t0
    2098:	b591                	j	1edc <__subdf3+0x432>
    209a:	4781                	li	a5,0
    209c:	4501                	li	a0,0
    209e:	4401                	li	s0,0
    20a0:	bf49                	j	2032 <__subdf3+0x588>
    20a2:	4781                	li	a5,0
    20a4:	bfed                	j	209e <__subdf3+0x5f4>
    20a6:	4501                	li	a0,0
    20a8:	4401                	li	s0,0
    20aa:	004007b7          	lui	a5,0x400
    20ae:	b999                	j	1d04 <__subdf3+0x25a>
    20b0:	4781                	li	a5,0
    20b2:	4501                	li	a0,0
    20b4:	bf61                	j	204c <__subdf3+0x5a2>

000020b6 <__fixdfsi>:
    20b6:	0145d713          	srli	a4,a1,0x14
    20ba:	001006b7          	lui	a3,0x100
    20be:	fff68793          	addi	a5,a3,-1 # fffff <__ctor_end__+0xf776f>
    20c2:	7ff77713          	andi	a4,a4,2047
    20c6:	3fe00613          	li	a2,1022
    20ca:	8fed                	and	a5,a5,a1
    20cc:	81fd                	srli	a1,a1,0x1f
    20ce:	04e65463          	bge	a2,a4,2116 <__fixdfsi+0x60>
    20d2:	41d00613          	li	a2,1053
    20d6:	00e65863          	bge	a2,a4,20e6 <__fixdfsi+0x30>
    20da:	80000537          	lui	a0,0x80000
    20de:	fff54513          	not	a0,a0
    20e2:	952e                	add	a0,a0,a1
    20e4:	8082                	ret
    20e6:	8fd5                	or	a5,a5,a3
    20e8:	43300693          	li	a3,1075
    20ec:	8e99                	sub	a3,a3,a4
    20ee:	467d                	li	a2,31
    20f0:	00d64d63          	blt	a2,a3,210a <__fixdfsi+0x54>
    20f4:	bed70713          	addi	a4,a4,-1043 # ff7ffbed <__heap_end+0xdf7cfbed>
    20f8:	00e797b3          	sll	a5,a5,a4
    20fc:	00d55533          	srl	a0,a0,a3
    2100:	8d5d                	or	a0,a0,a5
    2102:	c999                	beqz	a1,2118 <__fixdfsi+0x62>
    2104:	40a00533          	neg	a0,a0
    2108:	8082                	ret
    210a:	41300513          	li	a0,1043
    210e:	8d19                	sub	a0,a0,a4
    2110:	00a7d533          	srl	a0,a5,a0
    2114:	b7fd                	j	2102 <__fixdfsi+0x4c>
    2116:	4501                	li	a0,0
    2118:	8082                	ret

0000211a <__floatsidf>:
    211a:	1151                	addi	sp,sp,-12
    211c:	c406                	sw	ra,8(sp)
    211e:	c222                	sw	s0,4(sp)
    2120:	c026                	sw	s1,0(sp)
    2122:	cd21                	beqz	a0,217a <__floatsidf+0x60>
    2124:	41f55793          	srai	a5,a0,0x1f
    2128:	00a7c433          	xor	s0,a5,a0
    212c:	8c1d                	sub	s0,s0,a5
    212e:	01f55493          	srli	s1,a0,0x1f
    2132:	8522                	mv	a0,s0
    2134:	20b1                	jal	2180 <__clzsi2>
    2136:	41e00713          	li	a4,1054
    213a:	47a9                	li	a5,10
    213c:	8f09                	sub	a4,a4,a0
    213e:	02a7c863          	blt	a5,a0,216e <__floatsidf+0x54>
    2142:	47ad                	li	a5,11
    2144:	8f89                	sub	a5,a5,a0
    2146:	0555                	addi	a0,a0,21
    2148:	00f457b3          	srl	a5,s0,a5
    214c:	00a41433          	sll	s0,s0,a0
    2150:	8526                	mv	a0,s1
    2152:	07b2                	slli	a5,a5,0xc
    2154:	0752                	slli	a4,a4,0x14
    2156:	83b1                	srli	a5,a5,0xc
    2158:	057e                	slli	a0,a0,0x1f
    215a:	8fd9                	or	a5,a5,a4
    215c:	40a2                	lw	ra,8(sp)
    215e:	00a7e733          	or	a4,a5,a0
    2162:	8522                	mv	a0,s0
    2164:	4412                	lw	s0,4(sp)
    2166:	4482                	lw	s1,0(sp)
    2168:	85ba                	mv	a1,a4
    216a:	0131                	addi	sp,sp,12
    216c:	8082                	ret
    216e:	1555                	addi	a0,a0,-11
    2170:	00a417b3          	sll	a5,s0,a0
    2174:	8526                	mv	a0,s1
    2176:	4401                	li	s0,0
    2178:	bfe9                	j	2152 <__floatsidf+0x38>
    217a:	4701                	li	a4,0
    217c:	4781                	li	a5,0
    217e:	bfe5                	j	2176 <__floatsidf+0x5c>

00002180 <__clzsi2>:
    2180:	67c1                	lui	a5,0x10
    2182:	02f57663          	bgeu	a0,a5,21ae <__clzsi2+0x2e>
    2186:	0ff00793          	li	a5,255
    218a:	00a7b7b3          	sltu	a5,a5,a0
    218e:	078e                	slli	a5,a5,0x3
    2190:	02000713          	li	a4,32
    2194:	8f1d                	sub	a4,a4,a5
    2196:	00f55533          	srl	a0,a0,a5
    219a:	00005797          	auipc	a5,0x5
    219e:	11e78793          	addi	a5,a5,286 # 72b8 <__clz_tab>
    21a2:	953e                	add	a0,a0,a5
    21a4:	00054503          	lbu	a0,0(a0) # 80000000 <__heap_end+0x5ffd0000>
    21a8:	40a70533          	sub	a0,a4,a0
    21ac:	8082                	ret
    21ae:	01000737          	lui	a4,0x1000
    21b2:	47c1                	li	a5,16
    21b4:	fce56ee3          	bltu	a0,a4,2190 <__clzsi2+0x10>
    21b8:	47e1                	li	a5,24
    21ba:	bfd9                	j	2190 <__clzsi2+0x10>

000021bc <memmove>:
    21bc:	02a5f263          	bgeu	a1,a0,21e0 <memmove+0x24>
    21c0:	00c587b3          	add	a5,a1,a2
    21c4:	00f57e63          	bgeu	a0,a5,21e0 <memmove+0x24>
    21c8:	00c50733          	add	a4,a0,a2
    21cc:	c20d                	beqz	a2,21ee <memmove+0x32>
    21ce:	fff7c683          	lbu	a3,-1(a5)
    21d2:	17fd                	addi	a5,a5,-1
    21d4:	177d                	addi	a4,a4,-1
    21d6:	00d70023          	sb	a3,0(a4) # 1000000 <__ctor_end__+0xff7770>
    21da:	fef59ae3          	bne	a1,a5,21ce <memmove+0x12>
    21de:	8082                	ret
    21e0:	47bd                	li	a5,15
    21e2:	00c7e763          	bltu	a5,a2,21f0 <memmove+0x34>
    21e6:	87aa                	mv	a5,a0
    21e8:	fff60693          	addi	a3,a2,-1
    21ec:	ea09                	bnez	a2,21fe <memmove+0x42>
    21ee:	8082                	ret
    21f0:	00a5e7b3          	or	a5,a1,a0
    21f4:	8b8d                	andi	a5,a5,3
    21f6:	cf99                	beqz	a5,2214 <memmove+0x58>
    21f8:	fff60693          	addi	a3,a2,-1
    21fc:	87aa                	mv	a5,a0
    21fe:	0685                	addi	a3,a3,1
    2200:	96be                	add	a3,a3,a5
    2202:	0005c703          	lbu	a4,0(a1)
    2206:	0785                	addi	a5,a5,1
    2208:	0585                	addi	a1,a1,1
    220a:	fee78fa3          	sb	a4,-1(a5)
    220e:	fed79ae3          	bne	a5,a3,2202 <memmove+0x46>
    2212:	8082                	ret
    2214:	ff060293          	addi	t0,a2,-16
    2218:	ff02f293          	andi	t0,t0,-16
    221c:	02c1                	addi	t0,t0,16
    221e:	00550333          	add	t1,a0,t0
    2222:	872e                	mv	a4,a1
    2224:	87aa                	mv	a5,a0
    2226:	4314                	lw	a3,0(a4)
    2228:	0741                	addi	a4,a4,16
    222a:	07c1                	addi	a5,a5,16
    222c:	fed7a823          	sw	a3,-16(a5)
    2230:	ff472683          	lw	a3,-12(a4)
    2234:	fed7aa23          	sw	a3,-12(a5)
    2238:	ff872683          	lw	a3,-8(a4)
    223c:	fed7ac23          	sw	a3,-8(a5)
    2240:	ffc72683          	lw	a3,-4(a4)
    2244:	fed7ae23          	sw	a3,-4(a5)
    2248:	fcf31fe3          	bne	t1,a5,2226 <memmove+0x6a>
    224c:	00c67713          	andi	a4,a2,12
    2250:	9596                	add	a1,a1,t0
    2252:	00f67313          	andi	t1,a2,15
    2256:	cb21                	beqz	a4,22a6 <memmove+0xea>
    2258:	1171                	addi	sp,sp,-4
    225a:	c022                	sw	s0,0(sp)
    225c:	872e                	mv	a4,a1
    225e:	82be                	mv	t0,a5
    2260:	440d                	li	s0,3
    2262:	00072383          	lw	t2,0(a4)
    2266:	0711                	addi	a4,a4,4
    2268:	40e306b3          	sub	a3,t1,a4
    226c:	0072a023          	sw	t2,0(t0) # 800000 <__ctor_end__+0x7f7770>
    2270:	96ae                	add	a3,a3,a1
    2272:	0291                	addi	t0,t0,4
    2274:	fed467e3          	bltu	s0,a3,2262 <memmove+0xa6>
    2278:	ffc30713          	addi	a4,t1,-4 # ffffc <__ctor_end__+0xf776c>
    227c:	9b71                	andi	a4,a4,-4
    227e:	8a0d                	andi	a2,a2,3
    2280:	0711                	addi	a4,a4,4
    2282:	fff60693          	addi	a3,a2,-1
    2286:	97ba                	add	a5,a5,a4
    2288:	0685                	addi	a3,a3,1
    228a:	95ba                	add	a1,a1,a4
    228c:	96be                	add	a3,a3,a5
    228e:	ca09                	beqz	a2,22a0 <memmove+0xe4>
    2290:	0005c703          	lbu	a4,0(a1)
    2294:	0785                	addi	a5,a5,1
    2296:	0585                	addi	a1,a1,1
    2298:	fee78fa3          	sb	a4,-1(a5)
    229c:	fed79ae3          	bne	a5,a3,2290 <memmove+0xd4>
    22a0:	4402                	lw	s0,0(sp)
    22a2:	0111                	addi	sp,sp,4
    22a4:	8082                	ret
    22a6:	861a                	mv	a2,t1
    22a8:	b781                	j	21e8 <memmove+0x2c>
	...

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
    24da:	ee260613          	addi	a2,a2,-286 # 73b8 <__clz_tab+0x100>
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
    2508:	2f850513          	addi	a0,a0,760 # 87fc <pad_line+0x68c>
    250c:	8082                	ret
    250e:	00006517          	auipc	a0,0x6
    2512:	2d650513          	addi	a0,a0,726 # 87e4 <pad_line+0x674>
    2516:	8082                	ret
    2518:	00006517          	auipc	a0,0x6
    251c:	28450513          	addi	a0,a0,644 # 879c <pad_line+0x62c>
    2520:	8082                	ret
    2522:	00006517          	auipc	a0,0x6
    2526:	29250513          	addi	a0,a0,658 # 87b4 <pad_line+0x644>
    252a:	8082                	ret
    252c:	00006517          	auipc	a0,0x6
    2530:	e7450513          	addi	a0,a0,-396 # 83a0 <pad_line+0x230>
    2534:	8082                	ret
    2536:	00006517          	auipc	a0,0x6
    253a:	22a50513          	addi	a0,a0,554 # 8760 <pad_line+0x5f0>
    253e:	8082                	ret
    2540:	00006517          	auipc	a0,0x6
    2544:	09450513          	addi	a0,a0,148 # 85d4 <pad_line+0x464>
    2548:	8082                	ret
    254a:	00006517          	auipc	a0,0x6
    254e:	31250513          	addi	a0,a0,786 # 885c <pad_line+0x6ec>
    2552:	8082                	ret
    2554:	00006517          	auipc	a0,0x6
    2558:	d1450513          	addi	a0,a0,-748 # 8268 <pad_line+0xf8>
    255c:	8082                	ret
    255e:	00006517          	auipc	a0,0x6
    2562:	cd250513          	addi	a0,a0,-814 # 8230 <pad_line+0xc0>
    2566:	8082                	ret
    2568:	00006517          	auipc	a0,0x6
    256c:	26850513          	addi	a0,a0,616 # 87d0 <pad_line+0x660>
    2570:	8082                	ret
    2572:	00006517          	auipc	a0,0x6
    2576:	2c250513          	addi	a0,a0,706 # 8834 <pad_line+0x6c4>
    257a:	8082                	ret
    257c:	00006517          	auipc	a0,0x6
    2580:	fb050513          	addi	a0,a0,-80 # 852c <pad_line+0x3bc>
    2584:	8082                	ret
    2586:	00006517          	auipc	a0,0x6
    258a:	ede50513          	addi	a0,a0,-290 # 8464 <pad_line+0x2f4>
    258e:	8082                	ret
    2590:	00006517          	auipc	a0,0x6
    2594:	da850513          	addi	a0,a0,-600 # 8338 <pad_line+0x1c8>
    2598:	8082                	ret
    259a:	00006517          	auipc	a0,0x6
    259e:	e9e50513          	addi	a0,a0,-354 # 8438 <pad_line+0x2c8>
    25a2:	8082                	ret
    25a4:	00006517          	auipc	a0,0x6
    25a8:	d8450513          	addi	a0,a0,-636 # 8328 <pad_line+0x1b8>
    25ac:	8082                	ret
    25ae:	00006517          	auipc	a0,0x6
    25b2:	2c250513          	addi	a0,a0,706 # 8870 <pad_line+0x700>
    25b6:	8082                	ret
    25b8:	00006517          	auipc	a0,0x6
    25bc:	dc450513          	addi	a0,a0,-572 # 837c <pad_line+0x20c>
    25c0:	8082                	ret
    25c2:	00006517          	auipc	a0,0x6
    25c6:	f8e50513          	addi	a0,a0,-114 # 8550 <pad_line+0x3e0>
    25ca:	8082                	ret
    25cc:	00006517          	auipc	a0,0x6
    25d0:	1ac50513          	addi	a0,a0,428 # 8778 <pad_line+0x608>
    25d4:	8082                	ret
    25d6:	00006517          	auipc	a0,0x6
    25da:	17250513          	addi	a0,a0,370 # 8748 <pad_line+0x5d8>
    25de:	8082                	ret
    25e0:	00006517          	auipc	a0,0x6
    25e4:	13850513          	addi	a0,a0,312 # 8718 <pad_line+0x5a8>
    25e8:	8082                	ret
    25ea:	00006517          	auipc	a0,0x6
    25ee:	11650513          	addi	a0,a0,278 # 8700 <pad_line+0x590>
    25f2:	8082                	ret
    25f4:	00006517          	auipc	a0,0x6
    25f8:	0ec50513          	addi	a0,a0,236 # 86e0 <pad_line+0x570>
    25fc:	8082                	ret
    25fe:	00006517          	auipc	a0,0x6
    2602:	0c250513          	addi	a0,a0,194 # 86c0 <pad_line+0x550>
    2606:	8082                	ret
    2608:	00006517          	auipc	a0,0x6
    260c:	08850513          	addi	a0,a0,136 # 8690 <pad_line+0x520>
    2610:	8082                	ret
    2612:	00006517          	auipc	a0,0x6
    2616:	05a50513          	addi	a0,a0,90 # 866c <pad_line+0x4fc>
    261a:	8082                	ret
    261c:	00006517          	auipc	a0,0x6
    2620:	11050513          	addi	a0,a0,272 # 872c <pad_line+0x5bc>
    2624:	8082                	ret
    2626:	00006517          	auipc	a0,0x6
    262a:	1ea50513          	addi	a0,a0,490 # 8810 <pad_line+0x6a0>
    262e:	8082                	ret
    2630:	00006517          	auipc	a0,0x6
    2634:	02450513          	addi	a0,a0,36 # 8654 <pad_line+0x4e4>
    2638:	8082                	ret
    263a:	00006517          	auipc	a0,0x6
    263e:	ffe50513          	addi	a0,a0,-2 # 8638 <pad_line+0x4c8>
    2642:	8082                	ret
    2644:	00006517          	auipc	a0,0x6
    2648:	fe050513          	addi	a0,a0,-32 # 8624 <pad_line+0x4b4>
    264c:	8082                	ret
    264e:	00006517          	auipc	a0,0x6
    2652:	fba50513          	addi	a0,a0,-70 # 8608 <pad_line+0x498>
    2656:	8082                	ret
    2658:	00006517          	auipc	a0,0x6
    265c:	fa450513          	addi	a0,a0,-92 # 85fc <pad_line+0x48c>
    2660:	8082                	ret
    2662:	00006517          	auipc	a0,0x6
    2666:	f8650513          	addi	a0,a0,-122 # 85e8 <pad_line+0x478>
    266a:	8082                	ret
    266c:	00006517          	auipc	a0,0x6
    2670:	f5850513          	addi	a0,a0,-168 # 85c4 <pad_line+0x454>
    2674:	8082                	ret
    2676:	00006517          	auipc	a0,0x6
    267a:	f3650513          	addi	a0,a0,-202 # 85ac <pad_line+0x43c>
    267e:	8082                	ret
    2680:	00006517          	auipc	a0,0x6
    2684:	f1850513          	addi	a0,a0,-232 # 8598 <pad_line+0x428>
    2688:	8082                	ret
    268a:	00006517          	auipc	a0,0x6
    268e:	ef650513          	addi	a0,a0,-266 # 8580 <pad_line+0x410>
    2692:	8082                	ret
    2694:	00006517          	auipc	a0,0x6
    2698:	ff450513          	addi	a0,a0,-12 # 8688 <pad_line+0x518>
    269c:	8082                	ret
    269e:	00006517          	auipc	a0,0x6
    26a2:	ed250513          	addi	a0,a0,-302 # 8570 <pad_line+0x400>
    26a6:	8082                	ret
    26a8:	00006517          	auipc	a0,0x6
    26ac:	ec050513          	addi	a0,a0,-320 # 8568 <pad_line+0x3f8>
    26b0:	8082                	ret
    26b2:	00006517          	auipc	a0,0x6
    26b6:	e9250513          	addi	a0,a0,-366 # 8544 <pad_line+0x3d4>
    26ba:	8082                	ret
    26bc:	00006517          	auipc	a0,0x6
    26c0:	e5c50513          	addi	a0,a0,-420 # 8518 <pad_line+0x3a8>
    26c4:	8082                	ret
    26c6:	00006517          	auipc	a0,0x6
    26ca:	e3650513          	addi	a0,a0,-458 # 84fc <pad_line+0x38c>
    26ce:	8082                	ret
    26d0:	00006517          	auipc	a0,0x6
    26d4:	e1850513          	addi	a0,a0,-488 # 84e8 <pad_line+0x378>
    26d8:	8082                	ret
    26da:	00006517          	auipc	a0,0x6
    26de:	dde50513          	addi	a0,a0,-546 # 84b8 <pad_line+0x348>
    26e2:	8082                	ret
    26e4:	00006517          	auipc	a0,0x6
    26e8:	dc850513          	addi	a0,a0,-568 # 84ac <pad_line+0x33c>
    26ec:	8082                	ret
    26ee:	00006517          	auipc	a0,0x6
    26f2:	dae50513          	addi	a0,a0,-594 # 849c <pad_line+0x32c>
    26f6:	8082                	ret
    26f8:	00006517          	auipc	a0,0x6
    26fc:	d8c50513          	addi	a0,a0,-628 # 8484 <pad_line+0x314>
    2700:	8082                	ret
    2702:	00006517          	auipc	a0,0x6
    2706:	d7250513          	addi	a0,a0,-654 # 8474 <pad_line+0x304>
    270a:	8082                	ret
    270c:	00006517          	auipc	a0,0x6
    2710:	d4050513          	addi	a0,a0,-704 # 844c <pad_line+0x2dc>
    2714:	8082                	ret
    2716:	00006517          	auipc	a0,0x6
    271a:	d1250513          	addi	a0,a0,-750 # 8428 <pad_line+0x2b8>
    271e:	8082                	ret
    2720:	00006517          	auipc	a0,0x6
    2724:	cf850513          	addi	a0,a0,-776 # 8418 <pad_line+0x2a8>
    2728:	8082                	ret
    272a:	00006517          	auipc	a0,0x6
    272e:	cd650513          	addi	a0,a0,-810 # 8400 <pad_line+0x290>
    2732:	8082                	ret
    2734:	00006517          	auipc	a0,0x6
    2738:	cac50513          	addi	a0,a0,-852 # 83e0 <pad_line+0x270>
    273c:	8082                	ret
    273e:	00006517          	auipc	a0,0x6
    2742:	c8250513          	addi	a0,a0,-894 # 83c0 <pad_line+0x250>
    2746:	8082                	ret
    2748:	00006517          	auipc	a0,0x6
    274c:	c2050513          	addi	a0,a0,-992 # 8368 <pad_line+0x1f8>
    2750:	8082                	ret
    2752:	00006517          	auipc	a0,0x6
    2756:	c0650513          	addi	a0,a0,-1018 # 8358 <pad_line+0x1e8>
    275a:	8082                	ret
    275c:	00006517          	auipc	a0,0x6
    2760:	bbc50513          	addi	a0,a0,-1092 # 8318 <pad_line+0x1a8>
    2764:	8082                	ret
    2766:	00006517          	auipc	a0,0x6
    276a:	ba250513          	addi	a0,a0,-1118 # 8308 <pad_line+0x198>
    276e:	8082                	ret
    2770:	00006517          	auipc	a0,0x6
    2774:	b8450513          	addi	a0,a0,-1148 # 82f4 <pad_line+0x184>
    2778:	8082                	ret
    277a:	00006517          	auipc	a0,0x6
    277e:	b6e50513          	addi	a0,a0,-1170 # 82e8 <pad_line+0x178>
    2782:	8082                	ret
    2784:	00006517          	auipc	a0,0x6
    2788:	b4c50513          	addi	a0,a0,-1204 # 82d0 <pad_line+0x160>
    278c:	8082                	ret
    278e:	00006517          	auipc	a0,0x6
    2792:	b3650513          	addi	a0,a0,-1226 # 82c4 <pad_line+0x154>
    2796:	8082                	ret
    2798:	00006517          	auipc	a0,0x6
    279c:	b1850513          	addi	a0,a0,-1256 # 82b0 <pad_line+0x140>
    27a0:	8082                	ret
    27a2:	00006517          	auipc	a0,0x6
    27a6:	afa50513          	addi	a0,a0,-1286 # 829c <pad_line+0x12c>
    27aa:	8082                	ret
    27ac:	00006517          	auipc	a0,0x6
    27b0:	adc50513          	addi	a0,a0,-1316 # 8288 <pad_line+0x118>
    27b4:	8082                	ret
    27b6:	00006517          	auipc	a0,0x6
    27ba:	aa650513          	addi	a0,a0,-1370 # 825c <pad_line+0xec>
    27be:	8082                	ret
    27c0:	00006517          	auipc	a0,0x6
    27c4:	a8c50513          	addi	a0,a0,-1396 # 824c <pad_line+0xdc>
    27c8:	8082                	ret
    27ca:	00006517          	auipc	a0,0x6
    27ce:	a5250513          	addi	a0,a0,-1454 # 821c <pad_line+0xac>
    27d2:	8082                	ret
    27d4:	00006517          	auipc	a0,0x6
    27d8:	a3450513          	addi	a0,a0,-1484 # 8208 <pad_line+0x98>
    27dc:	8082                	ret
    27de:	00006517          	auipc	a0,0x6
    27e2:	a0e50513          	addi	a0,a0,-1522 # 81ec <pad_line+0x7c>
    27e6:	8082                	ret
    27e8:	00006517          	auipc	a0,0x6
    27ec:	9f850513          	addi	a0,a0,-1544 # 81e0 <pad_line+0x70>
    27f0:	8082                	ret
    27f2:	00006517          	auipc	a0,0x6
    27f6:	9d650513          	addi	a0,a0,-1578 # 81c8 <pad_line+0x58>
    27fa:	8082                	ret
    27fc:	00006517          	auipc	a0,0x6
    2800:	9bc50513          	addi	a0,a0,-1604 # 81b8 <pad_line+0x48>
    2804:	8082                	ret
    2806:	00006517          	auipc	a0,0x6
    280a:	99650513          	addi	a0,a0,-1642 # 819c <pad_line+0x2c>
    280e:	8082                	ret
    2810:	00006517          	auipc	a0,0x6
    2814:	07850513          	addi	a0,a0,120 # 8888 <pad_line+0x718>
    2818:	8082                	ret
    281a:	00006517          	auipc	a0,0x6
    281e:	97650513          	addi	a0,a0,-1674 # 8190 <pad_line+0x20>
    2822:	8082                	ret
    2824:	00005517          	auipc	a0,0x5
    2828:	03850513          	addi	a0,a0,56 # 785c <sg_usi_config+0xa4>
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
    28c4:	d3550513          	addi	a0,a0,-715 # 75f5 <_ctype_+0x1>
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
    2aa2:	b5730313          	addi	t1,t1,-1193 # 75f5 <_ctype_+0x1>
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
    2af6:	99938393          	addi	t2,t2,-1639 # 19999999 <__ctor_end__+0x19991109>
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
    2c3a:	19e010ef          	jal	ra,3dd8 <clock_timer_init>
    clock_timer_start();
    2c3e:	214010ef          	jal	ra,3e52 <clock_timer_start>

    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2c42:	4581                	li	a1,0
    2c44:	4501                	li	a0,0
    2c46:	22d000ef          	jal	ra,3672 <csi_usart_initialize>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    if (ret < 0) {
        return;
    }
}
    2c4a:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    2c4c:	02a1a423          	sw	a0,40(gp) # 20000510 <console_handle>
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2c50:	65f1                	lui	a1,0x1c
    2c52:	478d                	li	a5,3
    2c54:	4701                	li	a4,0
    2c56:	4681                	li	a3,0
    2c58:	4601                	li	a2,0
    2c5a:	20058593          	addi	a1,a1,512 # 1c200 <__ctor_end__+0x13970>
}
    2c5e:	0131                	addi	sp,sp,12
    ret = csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    2c60:	2150006f          	j	3674 <csi_usart_config>

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
    2c72:	0017e793          	ori	a5,a5,1
    2c76:	40f50023          	sb	a5,1024(a0)
#ifdef CONFIG_SYSTEM_SECURE
    csi_vic_enable_sirq(irq_num);
#else
    csi_vic_enable_irq(irq_num);
#endif
}
    2c7a:	8082                	ret

00002c7c <drv_irq_register>:
  \param[in]   irq_handler IRQ Handler.
  \return      None.
*/
void drv_irq_register(uint32_t irq_num, void *irq_handler)
{
    g_irqvector[irq_num] = irq_handler;
    2c7c:	200027b7          	lui	a5,0x20002
    2c80:	050a                	slli	a0,a0,0x2
    2c82:	08478793          	addi	a5,a5,132 # 20002084 <g_irqvector>
    2c86:	953e                	add	a0,a0,a5
    2c88:	c10c                	sw	a1,0(a0)
}
    2c8a:	8082                	ret

00002c8c <wj_usi_set_rxfifo_th>:

static wj_usi_priv_t usi_instance[CONFIG_USI_NUM];

void wj_usi_set_rxfifo_th(wj_usi_reg_t *addr, uint32_t length)
{
    addr->USI_INTR_CTRL &= ~USI_INTR_CTRL_TH_MODE;
    2c8c:	457c                	lw	a5,76(a0)
    2c8e:	7741                	lui	a4,0xffff0
    2c90:	177d                	addi	a4,a4,-1
    2c92:	8ff9                	and	a5,a5,a4
    2c94:	c57c                	sw	a5,76(a0)
    addr->USI_INTR_CTRL &= USI_INTR_CTRL_RXFIFO_TH;
    2c96:	457c                	lw	a5,76(a0)
    2c98:	cff7f793          	andi	a5,a5,-769
    2c9c:	c57c                	sw	a5,76(a0)

    if (length >= USI_RX_MAX_FIFO) {
    2c9e:	47bd                	li	a5,15
    2ca0:	00b7f963          	bgeu	a5,a1,2cb2 <wj_usi_set_rxfifo_th+0x26>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_12 | USI_INTR_CTRL_TH_MODE;
    2ca4:	457c                	lw	a5,76(a0)
    2ca6:	6741                	lui	a4,0x10
    2ca8:	30070713          	addi	a4,a4,768 # 10300 <__ctor_end__+0x7a70>
    } else if (length >= USI_RX_MAX_FIFO - 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2cac:	8fd9                	or	a5,a5,a4
    } else {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2cae:	c57c                	sw	a5,76(a0)
    }
}
    2cb0:	8082                	ret
    } else if (length >= USI_RX_MAX_FIFO - 4) {
    2cb2:	47ad                	li	a5,11
    2cb4:	00b7f763          	bgeu	a5,a1,2cc2 <wj_usi_set_rxfifo_th+0x36>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    2cb8:	6741                	lui	a4,0x10
    2cba:	457c                	lw	a5,76(a0)
    2cbc:	20070713          	addi	a4,a4,512 # 10200 <__ctor_end__+0x7970>
    2cc0:	b7f5                	j	2cac <wj_usi_set_rxfifo_th+0x20>
    } else if (length >= 4) {
    2cc2:	478d                	li	a5,3
    2cc4:	00b7f763          	bgeu	a5,a1,2cd2 <wj_usi_set_rxfifo_th+0x46>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    2cc8:	6741                	lui	a4,0x10
    2cca:	457c                	lw	a5,76(a0)
    2ccc:	10070713          	addi	a4,a4,256 # 10100 <__ctor_end__+0x7870>
    2cd0:	bff1                	j	2cac <wj_usi_set_rxfifo_th+0x20>
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    2cd2:	457c                	lw	a5,76(a0)
    2cd4:	1007e793          	ori	a5,a5,256
    2cd8:	bfd9                	j	2cae <wj_usi_set_rxfifo_th+0x22>

00002cda <wj_usi_irqhandler>:
//            CSI_DRIVER
//------------------------------------------
void wj_usi_irqhandler(int32_t idx)
{
    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usi_priv->base);
    2cda:	200017b7          	lui	a5,0x20001
    2cde:	00351713          	slli	a4,a0,0x3
    2ce2:	76478793          	addi	a5,a5,1892 # 20001764 <usi_instance>
    2ce6:	97ba                	add	a5,a5,a4
    2ce8:	439c                	lw	a5,0(a5)

    switch (addr->USI_MODE_SEL & 0x3) {
    2cea:	4705                	li	a4,1
    2cec:	43dc                	lw	a5,4(a5)
    2cee:	8b8d                	andi	a5,a5,3
    2cf0:	00e78863          	beq	a5,a4,2d00 <wj_usi_irqhandler+0x26>
    2cf4:	c789                	beqz	a5,2cfe <wj_usi_irqhandler+0x24>
    2cf6:	4709                	li	a4,2
    2cf8:	00e78563          	beq	a5,a4,2d02 <wj_usi_irqhandler+0x28>
    2cfc:	8082                	ret
        case USI_MODE_UART:
#ifndef  CONFIG_CHIP_PANGU
            wj_usi_usart_irqhandler(idx);
    2cfe:	a70d                	j	3420 <wj_usi_usart_irqhandler>
#endif
            break;

        case USI_MODE_I2C:
            wj_usi_i2c_irqhandler(idx);
    2d00:	a099                	j	2d46 <wj_usi_i2c_irqhandler>
            break;

        case USI_MODE_SPI:
            wj_usi_spi_irqhandler(idx);
    2d02:	a619                	j	3008 <wj_usi_spi_irqhandler>

00002d04 <drv_usi_initialize>:
            return;
    }
}

int32_t drv_usi_initialize(int32_t idx)
{
    2d04:	1131                	addi	sp,sp,-20
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usi_init(idx, &base, &irq);
    2d06:	0050                	addi	a2,sp,4
    2d08:	858a                	mv	a1,sp
{
    2d0a:	c622                	sw	s0,12(sp)
    2d0c:	c806                	sw	ra,16(sp)
    2d0e:	842a                	mv	s0,a0
    uint32_t base = 0u;
    2d10:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    2d12:	c202                	sw	zero,4(sp)
    int32_t ret = target_usi_init(idx, &base, &irq);
    2d14:	1e1000ef          	jal	ra,36f4 <target_usi_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    2d18:	4789                	li	a5,2
    2d1a:	02a7e163          	bltu	a5,a0,2d3c <drv_usi_initialize+0x38>
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    usi_priv->base = base;
    2d1e:	4782                	lw	a5,0(sp)
    2d20:	20001537          	lui	a0,0x20001
    2d24:	040e                	slli	s0,s0,0x3
    2d26:	76450513          	addi	a0,a0,1892 # 20001764 <usi_instance>
    2d2a:	9522                	add	a0,a0,s0
    2d2c:	c11c                	sw	a5,0(a0)
    usi_priv->irq  = irq;
    2d2e:	4792                	lw	a5,4(sp)
    2d30:	c15c                	sw	a5,4(a0)

    return 0;
    2d32:	4501                	li	a0,0
}
    2d34:	40c2                	lw	ra,16(sp)
    2d36:	4432                	lw	s0,12(sp)
    2d38:	0151                	addi	sp,sp,20
    2d3a:	8082                	ret
        return ERR_USI(DRV_ERROR_PARAMETER);
    2d3c:	81180537          	lui	a0,0x81180
    2d40:	08450513          	addi	a0,a0,132 # 81180084 <__heap_end+0x61150084>
    2d44:	bfc5                	j	2d34 <drv_usi_initialize+0x30>

00002d46 <wj_usi_i2c_irqhandler>:

}
void wj_usi_i2c_irqhandler(int32_t idx)
{
    wj_usi_iic_priv_t *iic_priv = &iic_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2d46:	03000793          	li	a5,48
    2d4a:	02f507b3          	mul	a5,a0,a5
{
    2d4e:	1111                	addi	sp,sp,-28
    2d50:	c826                	sw	s1,16(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2d52:	200014b7          	lui	s1,0x20001
    2d56:	77c48713          	addi	a4,s1,1916 # 2000177c <iic_instance>
{
    2d5a:	ca22                	sw	s0,20(sp)
    2d5c:	cc06                	sw	ra,24(sp)
    2d5e:	862a                	mv	a2,a0
    2d60:	77c48493          	addi	s1,s1,1916
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(iic_priv->base);
    2d64:	97ba                	add	a5,a5,a4
    2d66:	4380                	lw	s0,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;

    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d68:	6719                	lui	a4,0x6
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2d6a:	4874                	lw	a3,84(s0)
    2d6c:	00e69313          	slli	t1,a3,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d70:	8f75                	and	a4,a4,a3
    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    2d72:	00e35313          	srli	t1,t1,0xe
    if ((intr_state & USI_INT_I2CM_LOSE_ARBI) || (intr_state & USI_INT_I2C_NACK)) {
    2d76:	c70d                	beqz	a4,2da0 <wj_usi_i2c_irqhandler+0x5a>
        /* If arbitration fault, it indicates either a slave device not
        * responding as expected, or other master which is not supported
        * by this SW.
        */
        iic_priv->status    = IIC_STATE_DONE;
    2d78:	4711                	li	a4,4
    2d7a:	d798                	sw	a4,40(a5)
        addr->USI_EN = 0;
    2d7c:	00042023          	sw	zero,0(s0) # 80000 <__ctor_end__+0x77770>
        addr->USI_INTR_UNMASK = 0;
    2d80:	04042e23          	sw	zero,92(s0)
        addr->USI_INTR_EN = 0;
        addr->USI_INTR_CLR = intr_state;

        if (iic_priv->cb_event) {
    2d84:	0087a383          	lw	t2,8(a5)
        addr->USI_INTR_EN = 0;
    2d88:	04042823          	sw	zero,80(s0)
        addr->USI_INTR_CLR = intr_state;
    2d8c:	06642023          	sw	t1,96(s0)
        if (iic_priv->cb_event) {
    2d90:	02038063          	beqz	t2,2db0 <wj_usi_i2c_irqhandler+0x6a>
            if (iic_priv->cb_event) {
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
            }
        }
    }
}
    2d94:	4452                	lw	s0,20(sp)
    2d96:	40e2                	lw	ra,24(sp)
    2d98:	44c2                	lw	s1,16(sp)
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d9a:	459d                	li	a1,7
}
    2d9c:	0171                	addi	sp,sp,28
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2d9e:	8382                	jr	t2
    switch (iic_priv->status) {
    2da0:	578c                	lw	a1,40(a5)
    2da2:	872a                	mv	a4,a0
    2da4:	4505                	li	a0,1
    2da6:	02a58963          	beq	a1,a0,2dd8 <wj_usi_i2c_irqhandler+0x92>
    2daa:	4509                	li	a0,2
    2dac:	10a58563          	beq	a1,a0,2eb6 <wj_usi_i2c_irqhandler+0x170>
            if (iic_priv->cb_event) {
    2db0:	03000793          	li	a5,48
    2db4:	02f607b3          	mul	a5,a2,a5
            addr->USI_INTR_CLR = intr_state;
    2db8:	06642023          	sw	t1,96(s0)
            addr->USI_INTR_UNMASK = 0;
    2dbc:	04042e23          	sw	zero,92(s0)
            addr->USI_INTR_EN = 0;
    2dc0:	04042823          	sw	zero,80(s0)
            addr->USI_EN = 0;
    2dc4:	00042023          	sw	zero,0(s0)
            if (iic_priv->cb_event) {
    2dc8:	94be                	add	s1,s1,a5
    2dca:	0084a303          	lw	t1,8(s1)
    2dce:	0c030663          	beqz	t1,2e9a <wj_usi_i2c_irqhandler+0x154>
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2dd2:	4599                	li	a1,6
    2dd4:	8532                	mv	a0,a2
    2dd6:	a2d9                	j	2f9c <wj_usi_i2c_irqhandler+0x256>
    if (intr_stat & USI_INT_TX_EMPTY) {
    2dd8:	0026f593          	andi	a1,a3,2
    uint8_t emptyfifo = 0;
    2ddc:	4601                	li	a2,0
    if (intr_stat & USI_INT_TX_EMPTY) {
    2dde:	cd8d                	beqz	a1,2e18 <wj_usi_i2c_irqhandler+0xd2>
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2de0:	53d0                	lw	a2,36(a5)
    2de2:	4b8c                	lw	a1,16(a5)
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2de4:	445c                	lw	a5,12(s0)
        uint32_t remain_txfifo = iic_priv->tx_total_num - iic_priv->tx_cnt;
    2de6:	8d91                	sub	a1,a1,a2
        emptyfifo = (remain_txfifo > (USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr))) ? USI_TX_MAX_FIFO - USI_FIFO_STA_TX_NUM(addr) : remain_txfifo;
    2de8:	83a1                	srli	a5,a5,0x8
    2dea:	4641                	li	a2,16
    2dec:	8bfd                	andi	a5,a5,31
    2dee:	40f607b3          	sub	a5,a2,a5
    2df2:	0ff5f613          	andi	a2,a1,255
    2df6:	00b7f963          	bgeu	a5,a1,2e08 <wj_usi_i2c_irqhandler+0xc2>
    2dfa:	445c                	lw	a5,12(s0)
    2dfc:	4641                	li	a2,16
    2dfe:	83a1                	srli	a5,a5,0x8
    2e00:	8bfd                	andi	a5,a5,31
    2e02:	8e1d                	sub	a2,a2,a5
    2e04:	0ff67613          	andi	a2,a2,255
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2e08:	03000793          	li	a5,48
    2e0c:	02f707b3          	mul	a5,a4,a5
        for (i = 0; i < emptyfifo; i++) {
    2e10:	4501                	li	a0,0
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2e12:	97a6                	add	a5,a5,s1
        for (i = 0; i < emptyfifo; i++) {
    2e14:	08c56863          	bltu	a0,a2,2ea4 <wj_usi_i2c_irqhandler+0x15e>
    if (iic_priv->tx_cnt == iic_priv->tx_total_num) {
    2e18:	03000793          	li	a5,48
    2e1c:	02f707b3          	mul	a5,a4,a5
    2e20:	97a6                	add	a5,a5,s1
    2e22:	53cc                	lw	a1,36(a5)
    2e24:	4b9c                	lw	a5,16(a5)
    2e26:	00f59963          	bne	a1,a5,2e38 <wj_usi_i2c_irqhandler+0xf2>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2e2a:	541c                	lw	a5,40(s0)
    2e2c:	0027e793          	ori	a5,a5,2
    2e30:	d41c                	sw	a5,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    2e32:	483c                	lw	a5,80(s0)
    2e34:	9bf5                	andi	a5,a5,-3
    2e36:	c83c                	sw	a5,80(s0)
    if (intr_stat & USI_INT_I2C_STOP) {
    2e38:	01369793          	slli	a5,a3,0x13
    2e3c:	0207d863          	bgez	a5,2e6c <wj_usi_i2c_irqhandler+0x126>
        iic_priv->status  = IIC_STATE_SEND_DONE;
    2e40:	03000793          	li	a5,48
    2e44:	02f707b3          	mul	a5,a4,a5
    2e48:	4595                	li	a1,5
    2e4a:	97a6                	add	a5,a5,s1
    2e4c:	d78c                	sw	a1,40(a5)
        if (iic_priv->cb_event) {
    2e4e:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2e50:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2e54:	cf81                	beqz	a5,2e6c <wj_usi_i2c_irqhandler+0x126>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2e56:	853a                	mv	a0,a4
    2e58:	4581                	li	a1,0
    2e5a:	c632                	sw	a2,12(sp)
    2e5c:	c41a                	sw	t1,8(sp)
    2e5e:	c236                	sw	a3,4(sp)
    2e60:	c03a                	sw	a4,0(sp)
    2e62:	9782                	jalr	a5
    2e64:	4632                	lw	a2,12(sp)
    2e66:	4322                	lw	t1,8(sp)
    2e68:	4692                	lw	a3,4(sp)
    2e6a:	4702                	lw	a4,0(sp)
    iic_priv->tx_cnt += emptyfifo;
    2e6c:	03000793          	li	a5,48
    2e70:	02f707b3          	mul	a5,a4,a5
    if (intr_stat & USI_INT_TX_WERR) {
    2e74:	8ac1                	andi	a3,a3,16
    iic_priv->tx_cnt += emptyfifo;
    2e76:	94be                	add	s1,s1,a5
    2e78:	50dc                	lw	a5,36(s1)
    2e7a:	963e                	add	a2,a2,a5
    2e7c:	d0d0                	sw	a2,36(s1)
    if (intr_stat & USI_INT_TX_WERR) {
    2e7e:	ce81                	beqz	a3,2e96 <wj_usi_i2c_irqhandler+0x150>
        iic_priv->status = IIC_STATE_ERROR;
    2e80:	479d                	li	a5,7
    2e82:	d49c                	sw	a5,40(s1)
        if (iic_priv->cb_event) {
    2e84:	449c                	lw	a5,8(s1)
        addr->USI_EN = 0;
    2e86:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2e8a:	c791                	beqz	a5,2e96 <wj_usi_i2c_irqhandler+0x150>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2e8c:	459d                	li	a1,7
    2e8e:	853a                	mv	a0,a4
    2e90:	c01a                	sw	t1,0(sp)
    2e92:	9782                	jalr	a5
    2e94:	4302                	lw	t1,0(sp)
            addr->USI_INTR_CLR = intr_state;
    2e96:	06642023          	sw	t1,96(s0)
}
    2e9a:	40e2                	lw	ra,24(sp)
    2e9c:	4452                	lw	s0,20(sp)
    2e9e:	44c2                	lw	s1,16(sp)
    2ea0:	0171                	addi	sp,sp,28
    2ea2:	8082                	ret
            tx_data = (uint16_t)(*iic_priv->tx_buf);
    2ea4:	4f8c                	lw	a1,24(a5)
        for (i = 0; i < emptyfifo; i++) {
    2ea6:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = tx_data;
    2ea8:	0005c283          	lbu	t0,0(a1)
            iic_priv->tx_buf++;
    2eac:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = tx_data;
    2eae:	00542423          	sw	t0,8(s0)
            iic_priv->tx_buf++;
    2eb2:	cf8c                	sw	a1,24(a5)
    2eb4:	b785                	j	2e14 <wj_usi_i2c_irqhandler+0xce>
    if (intr_stat & USI_INT_RX_THOLD) {
    2eb6:	0206f613          	andi	a2,a3,32
    2eba:	c635                	beqz	a2,2f26 <wj_usi_i2c_irqhandler+0x1e0>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    2ebc:	02000613          	li	a2,32
    2ec0:	d030                	sw	a2,96(s0)
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2ec2:	444c                	lw	a1,12(s0)
        for (i = 0; i < rx_num; i++) {
    2ec4:	4601                	li	a2,0
        uint32_t rx_num = USI_FIFO_STA_RX_NUM(addr);
    2ec6:	81c1                	srli	a1,a1,0x10
    2ec8:	89fd                	andi	a1,a1,31
        for (i = 0; i < rx_num; i++) {
    2eca:	0cb66e63          	bltu	a2,a1,2fa6 <wj_usi_i2c_irqhandler+0x260>
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2ece:	03000793          	li	a5,48
    2ed2:	02f707b3          	mul	a5,a4,a5
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2ed6:	4450                	lw	a2,12(s0)
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2ed8:	45c1                	li	a1,16
        uint32_t tx_num = USI_FIFO_STA_TX_NUM(addr);
    2eda:	8221                	srli	a2,a2,0x8
    2edc:	8a7d                	andi	a2,a2,31
        uint8_t rxfifo = iic_priv->rx_clk > (USI_RX_MAX_FIFO - tx_num) ? (USI_RX_MAX_FIFO - tx_num) : 1;
    2ede:	8d91                	sub	a1,a1,a2
    2ee0:	97a6                	add	a5,a5,s1
    2ee2:	5388                	lw	a0,32(a5)
    2ee4:	4785                	li	a5,1
    2ee6:	00a5f663          	bgeu	a1,a0,2ef2 <wj_usi_i2c_irqhandler+0x1ac>
    2eea:	47c1                	li	a5,16
    2eec:	8f91                	sub	a5,a5,a2
    2eee:	0ff7f793          	andi	a5,a5,255
        if (iic_priv->rx_clk == 0) {
    2ef2:	03000613          	li	a2,48
    2ef6:	02c70633          	mul	a2,a4,a2
    2efa:	9626                	add	a2,a2,s1
    2efc:	520c                	lw	a1,32(a2)
    2efe:	cde1                	beqz	a1,2fd6 <wj_usi_i2c_irqhandler+0x290>
        for (i = 0; i < rxfifo; i++) {
    2f00:	4581                	li	a1,0
            addr->USI_TX_RX_FIFO = 0x100;
    2f02:	10000313          	li	t1,256
        for (i = 0; i < rxfifo; i++) {
    2f06:	0af59f63          	bne	a1,a5,2fc4 <wj_usi_i2c_irqhandler+0x27e>
        wj_usi_set_rxfifo_th(addr, rxfifo);
    2f0a:	85be                	mv	a1,a5
    2f0c:	8522                	mv	a0,s0
    2f0e:	c43a                	sw	a4,8(sp)
    2f10:	c236                	sw	a3,4(sp)
    2f12:	c03e                	sw	a5,0(sp)
    2f14:	3ba5                	jal	2c8c <wj_usi_set_rxfifo_th>
        if (rxfifo == 0) {
    2f16:	4782                	lw	a5,0(sp)
    2f18:	4692                	lw	a3,4(sp)
    2f1a:	4722                	lw	a4,8(sp)
    2f1c:	e789                	bnez	a5,2f26 <wj_usi_i2c_irqhandler+0x1e0>
            addr->USI_INTR_EN |= USI_INT_I2C_STOP;
    2f1e:	483c                	lw	a5,80(s0)
    2f20:	6605                	lui	a2,0x1
    2f22:	8fd1                	or	a5,a5,a2
    2f24:	c83c                	sw	a5,80(s0)
    if (iic_priv->rx_cnt == iic_priv->rx_total_num) {
    2f26:	03000793          	li	a5,48
    2f2a:	02f707b3          	mul	a5,a4,a5
    2f2e:	97a6                	add	a5,a5,s1
    2f30:	4fd0                	lw	a2,28(a5)
    2f32:	47dc                	lw	a5,12(a5)
    2f34:	00f61a63          	bne	a2,a5,2f48 <wj_usi_i2c_irqhandler+0x202>
        addr->USI_I2CM_CTRL |= (1 << 1);
    2f38:	541c                	lw	a5,40(s0)
    2f3a:	0027e793          	ori	a5,a5,2
    2f3e:	d41c                	sw	a5,40(s0)
        addr->USI_INTR_EN &= ~USI_INT_RX_THOLD;
    2f40:	483c                	lw	a5,80(s0)
    2f42:	fdf7f793          	andi	a5,a5,-33
    2f46:	c83c                	sw	a5,80(s0)
    if ((intr_stat & USI_INT_RX_WERR) || (intr_stat & USI_INT_RX_RERR)) {
    2f48:	3006f793          	andi	a5,a3,768
    2f4c:	c39d                	beqz	a5,2f72 <wj_usi_i2c_irqhandler+0x22c>
        iic_priv->status = IIC_STATE_ERROR;
    2f4e:	03000793          	li	a5,48
    2f52:	02f707b3          	mul	a5,a4,a5
    2f56:	461d                	li	a2,7
    2f58:	97a6                	add	a5,a5,s1
    2f5a:	d790                	sw	a2,40(a5)
        if (iic_priv->cb_event) {
    2f5c:	479c                	lw	a5,8(a5)
        addr->USI_EN = 0;
    2f5e:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f62:	cb81                	beqz	a5,2f72 <wj_usi_i2c_irqhandler+0x22c>
            iic_priv->cb_event(idx, IIC_EVENT_BUS_ERROR);
    2f64:	853a                	mv	a0,a4
    2f66:	459d                	li	a1,7
    2f68:	c236                	sw	a3,4(sp)
    2f6a:	c03a                	sw	a4,0(sp)
    2f6c:	9782                	jalr	a5
    2f6e:	4692                	lw	a3,4(sp)
    2f70:	4702                	lw	a4,0(sp)
    if (intr_stat & USI_INT_I2C_STOP) {
    2f72:	01369793          	slli	a5,a3,0x13
    2f76:	f207d2e3          	bgez	a5,2e9a <wj_usi_i2c_irqhandler+0x154>
        addr->USI_INTR_CLR = USI_INT_I2C_STOP;
    2f7a:	6785                	lui	a5,0x1
    2f7c:	d03c                	sw	a5,96(s0)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2f7e:	03000793          	li	a5,48
    2f82:	02f707b3          	mul	a5,a4,a5
    2f86:	94be                	add	s1,s1,a5
        if (iic_priv->cb_event) {
    2f88:	0084a303          	lw	t1,8(s1)
        iic_priv->status  = IIC_STATE_RECV_DONE;
    2f8c:	4799                	li	a5,6
    2f8e:	d49c                	sw	a5,40(s1)
        addr->USI_EN = 0;
    2f90:	00042023          	sw	zero,0(s0)
        if (iic_priv->cb_event) {
    2f94:	f00303e3          	beqz	t1,2e9a <wj_usi_i2c_irqhandler+0x154>
            iic_priv->cb_event(idx, IIC_EVENT_TRANSFER_DONE);
    2f98:	4581                	li	a1,0
    2f9a:	853a                	mv	a0,a4
}
    2f9c:	4452                	lw	s0,20(sp)
    2f9e:	40e2                	lw	ra,24(sp)
    2fa0:	44c2                	lw	s1,16(sp)
    2fa2:	0171                	addi	sp,sp,28
                iic_priv->cb_event(idx, IIC_EVENT_ARBITRATION_LOST);
    2fa4:	8302                	jr	t1
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2fa6:	00842303          	lw	t1,8(s0)
    2faa:	4bc8                	lw	a0,20(a5)
        for (i = 0; i < rx_num; i++) {
    2fac:	0605                	addi	a2,a2,1
    2fae:	0ff67613          	andi	a2,a2,255
            *iic_priv->rx_buf = addr->USI_TX_RX_FIFO;
    2fb2:	00650023          	sb	t1,0(a0)
            iic_priv->rx_buf++;
    2fb6:	4bc8                	lw	a0,20(a5)
    2fb8:	0505                	addi	a0,a0,1
    2fba:	cbc8                	sw	a0,20(a5)
            iic_priv->rx_cnt++;;
    2fbc:	4fc8                	lw	a0,28(a5)
    2fbe:	0505                	addi	a0,a0,1
    2fc0:	cfc8                	sw	a0,28(a5)
    2fc2:	b721                	j	2eca <wj_usi_i2c_irqhandler+0x184>
            addr->USI_TX_RX_FIFO = 0x100;
    2fc4:	00642423          	sw	t1,8(s0)
            iic_priv->rx_clk--;
    2fc8:	5208                	lw	a0,32(a2)
        for (i = 0; i < rxfifo; i++) {
    2fca:	0585                	addi	a1,a1,1
    2fcc:	0ff5f593          	andi	a1,a1,255
            iic_priv->rx_clk--;
    2fd0:	157d                	addi	a0,a0,-1
    2fd2:	d208                	sw	a0,32(a2)
    2fd4:	bf0d                	j	2f06 <wj_usi_i2c_irqhandler+0x1c0>
            rxfifo = 0;
    2fd6:	4781                	li	a5,0
    2fd8:	bf0d                	j	2f0a <wj_usi_i2c_irqhandler+0x1c4>

00002fda <wj_spi_ss_control.isra.0>:
/**
  \brief control ss line depend on controlled Output mode.
*/
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
{
    if (spi_priv->ss_mode == SPI_SS_MASTER_HW_OUTPUT) {
    2fda:	4789                	li	a5,2
    2fdc:	02f51463          	bne	a0,a5,3004 <wj_spi_ss_control.isra.0+0x2a>
static int32_t wj_spi_ss_control(wj_usi_spi_priv_t *spi_priv, spi_ss_stat_e stat)
    2fe0:	1151                	addi	sp,sp,-12
    2fe2:	c406                	sw	ra,8(sp)
        if (stat == SPI_SS_INACTIVE) {
    2fe4:	e991                	bnez	a1,2ff8 <wj_spi_ss_control.isra.0+0x1e>
            csi_gpio_pin_write(pgpio_pin_handle, true);
    2fe6:	4585                	li	a1,1
        } else if (stat == SPI_SS_ACTIVE) {
            csi_gpio_pin_write(pgpio_pin_handle, false);
    2fe8:	0101a503          	lw	a0,16(gp) # 200004f8 <pgpio_pin_handle>
    2fec:	121000ef          	jal	ra,390c <csi_gpio_pin_write>
        } else {
            return -1;
        }
    }

    return 0;
    2ff0:	4501                	li	a0,0
}
    2ff2:	40a2                	lw	ra,8(sp)
    2ff4:	0131                	addi	sp,sp,12
    2ff6:	8082                	ret
        } else if (stat == SPI_SS_ACTIVE) {
    2ff8:	4785                	li	a5,1
            return -1;
    2ffa:	557d                	li	a0,-1
        } else if (stat == SPI_SS_ACTIVE) {
    2ffc:	fef59be3          	bne	a1,a5,2ff2 <wj_spi_ss_control.isra.0+0x18>
            csi_gpio_pin_write(pgpio_pin_handle, false);
    3000:	4581                	li	a1,0
    3002:	b7dd                	j	2fe8 <wj_spi_ss_control.isra.0+0xe>
    return 0;
    3004:	4501                	li	a0,0
}
    3006:	8082                	ret

00003008 <wj_usi_spi_irqhandler>:
  \brief       handler the interrupt.
  \param[in]   spi      Pointer to \ref SPI_RESOURCES
*/
void wj_usi_spi_irqhandler(int32_t idx)
{
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3008:	04c00793          	li	a5,76
    300c:	02f507b3          	mul	a5,a0,a5
{
    3010:	1101                	addi	sp,sp,-32
    3012:	ca26                	sw	s1,20(sp)
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3014:	200024b7          	lui	s1,0x20002
    3018:	80c48613          	addi	a2,s1,-2036 # 2000180c <spi_instance>
{
    301c:	cc22                	sw	s0,24(sp)
    301e:	ce06                	sw	ra,28(sp)
    3020:	86aa                	mv	a3,a0
    3022:	80c48493          	addi	s1,s1,-2036
    wj_usi_spi_priv_t *spi_priv = &spi_instance[idx];
    3026:	963e                	add	a2,a2,a5
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    3028:	4200                	lw	s0,0(a2)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    302a:	05442303          	lw	t1,84(s0)
    302e:	00e31793          	slli	a5,t1,0xe
    3032:	83b9                	srli	a5,a5,0xe
    3034:	c03e                	sw	a5,0(sp)

    /* deal with receive FIFO full interrupt */
    if (intr_state & USI_INT_SPI_STOP) {
    3036:	00e31793          	slli	a5,t1,0xe
    303a:	0807d363          	bgez	a5,30c0 <wj_usi_spi_irqhandler+0xb8>
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    303e:	445c                	lw	a5,12(s0)
    uint32_t length = spi_priv->recv_num;
    3040:	4a48                	lw	a0,20(a2)
    uint8_t *pbuffer = spi_priv->recv_buf;
    3042:	4e4c                	lw	a1,28(a2)
    uint8_t rxnum = USI_FIFO_STA_RX_NUM(addr);
    3044:	83c1                	srli	a5,a5,0x10
    uint32_t rxdata_num = (rxnum > length) ? length : rxnum;
    3046:	8bfd                	andi	a5,a5,31
    3048:	00f57363          	bgeu	a0,a5,304e <wj_usi_spi_irqhandler+0x46>
    304c:	87aa                	mv	a5,a0
    for (i = 0; i < rxdata_num; i++) {
    304e:	00f582b3          	add	t0,a1,a5
    3052:	10559763          	bne	a1,t0,3160 <wj_usi_spi_irqhandler+0x158>
    length -= rxdata_num;
    3056:	8d1d                	sub	a0,a0,a5
    if (length <= 0) {
    3058:	10051a63          	bnez	a0,316c <wj_usi_spi_irqhandler+0x164>
        addr->USI_INTR_EN &= ~USI_INT_SPI_STOP;
    305c:	483c                	lw	a5,80(s0)
    305e:	7581                	lui	a1,0xfffe0
    3060:	15fd                	addi	a1,a1,-1
    3062:	8fed                	and	a5,a5,a1
    3064:	c83c                	sw	a5,80(s0)
        spi_priv->status.busy = 0U;
    3066:	04c00793          	li	a5,76
    306a:	02f687b3          	mul	a5,a3,a5
    306e:	c81a                	sw	t1,16(sp)
    3070:	c636                	sw	a3,12(sp)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3072:	c232                	sw	a2,4(sp)
        spi_priv->status.busy = 0U;
    3074:	97a6                	add	a5,a5,s1
    3076:	0387c583          	lbu	a1,56(a5) # 1038 <__divdf3+0x190>
        spi_priv->recv_num = 0;
    307a:	c43e                	sw	a5,8(sp)
        spi_priv->status.busy = 0U;
    307c:	99f9                	andi	a1,a1,-2
    307e:	02b78c23          	sb	a1,56(a5)
        addr->USI_EN = 0x0;
    3082:	00042023          	sw	zero,0(s0)
        addr->USI_EN = 0xf;
    3086:	45bd                	li	a1,15
    3088:	c00c                	sw	a1,0(s0)
        addr->USI_EN = 0x0;
    308a:	00042023          	sw	zero,0(s0)
        spi_priv->recv_num = 0;
    308e:	0007aa23          	sw	zero,20(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    3092:	03464503          	lbu	a0,52(a2) # 1034 <__divdf3+0x18c>
    3096:	4581                	li	a1,0
    3098:	3789                	jal	2fda <wj_spi_ss_control.isra.0>
        if (spi_priv->cb_event) {
    309a:	47a2                	lw	a5,8(sp)
    309c:	4612                	lw	a2,4(sp)
    309e:	46b2                	lw	a3,12(sp)
    30a0:	00c7a383          	lw	t2,12(a5)
    30a4:	4342                	lw	t1,16(sp)
    30a6:	00038a63          	beqz	t2,30ba <wj_usi_spi_irqhandler+0xb2>
            spi_priv->cb_event(spi_priv->idx, SPI_EVENT_RX_COMPLETE);
    30aa:	43a8                	lw	a0,64(a5)
    30ac:	4589                	li	a1,2
    30ae:	c432                	sw	a2,8(sp)
    30b0:	c21a                	sw	t1,4(sp)
    30b2:	9382                	jalr	t2
            return;
    30b4:	4312                	lw	t1,4(sp)
    30b6:	4622                	lw	a2,8(sp)
    30b8:	46b2                	lw	a3,12(sp)
        wj_spi_intr_rx_full(spi_priv);
        addr->USI_INTR_CLR = USI_INT_SPI_STOP;
    30ba:	000207b7          	lui	a5,0x20
    30be:	d03c                	sw	a5,96(s0)
    }

    /* deal with transmit FIFO empty interrupt */
    if (intr_state & USI_INT_TX_EMPTY) {
    30c0:	00237313          	andi	t1,t1,2
    30c4:	08030763          	beqz	t1,3152 <wj_usi_spi_irqhandler+0x14a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    30c8:	04c00793          	li	a5,76
    30cc:	02f687b3          	mul	a5,a3,a5
    30d0:	97a6                	add	a5,a5,s1
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30d2:	5b8c                	lw	a1,48(a5)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    30d4:	0007a303          	lw	t1,0(a5) # 20000 <__ctor_end__+0x17770>
    if (spi_priv->mode == WJENUM_SPI_TXRX) {
    30d8:	e9fd                	bnez	a1,31ce <wj_usi_spi_irqhandler+0x1c6>
        while (spi_priv->transfer_num) {
    30da:	53cc                	lw	a1,36(a5)
    30dc:	e1e9                	bnez	a1,319e <wj_usi_spi_irqhandler+0x196>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    30de:	5788                	lw	a0,40(a5)
    30e0:	42bd                	li	t0,15
    30e2:	00a2f363          	bgeu	t0,a0,30e8 <wj_usi_spi_irqhandler+0xe0>
            spi_priv->transfer_num = USI_TX_MAX_FIFO;
    30e6:	4541                	li	a0,16
            spi_priv->transfer_num = spi_priv->clk_num;
    30e8:	d3c8                	sw	a0,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    30ea:	04c00793          	li	a5,76
    30ee:	02f687b3          	mul	a5,a3,a5
    30f2:	97a6                	add	a5,a5,s1
    30f4:	0247a283          	lw	t0,36(a5)
    30f8:	0a559f63          	bne	a1,t0,31b6 <wj_usi_spi_irqhandler+0x1ae>
    if (spi_priv->clk_num == 0) {
    30fc:	04c00793          	li	a5,76
    3100:	02f687b3          	mul	a5,a3,a5
    3104:	97a6                	add	a5,a5,s1
    3106:	578c                	lw	a1,40(a5)
    3108:	10059263          	bnez	a1,320c <wj_usi_spi_irqhandler+0x204>
        addr->USI_INTR_EN &= ~USI_INT_TX_EMPTY;
    310c:	05032583          	lw	a1,80(t1)
    3110:	c636                	sw	a3,12(sp)
    3112:	c41a                	sw	t1,8(sp)
    3114:	99f5                	andi	a1,a1,-3
    3116:	04b32823          	sw	a1,80(t1)
        spi_priv->status.busy = 0U;
    311a:	0387c583          	lbu	a1,56(a5)
        spi_priv->send_num = 0;
    311e:	0007a823          	sw	zero,16(a5)
    3122:	c23e                	sw	a5,4(sp)
        spi_priv->status.busy = 0U;
    3124:	99f9                	andi	a1,a1,-2
    3126:	02b78c23          	sb	a1,56(a5)
        wj_spi_ss_control(spi_priv, SPI_SS_INACTIVE);
    312a:	03464503          	lbu	a0,52(a2)
    312e:	4581                	li	a1,0
    3130:	356d                	jal	2fda <wj_spi_ss_control.isra.0>
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    3132:	4792                	lw	a5,4(sp)
        addr->USI_EN = 0x0;
    3134:	4322                	lw	t1,8(sp)
        addr->USI_EN = 0xf;
    3136:	463d                	li	a2,15
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    3138:	5b8c                	lw	a1,48(a5)
        addr->USI_EN = 0x0;
    313a:	00032023          	sw	zero,0(t1)
        addr->USI_EN = 0xf;
    313e:	00c32023          	sw	a2,0(t1)
        if (spi_priv->mode == WJENUM_SPI_TXRX) {
    3142:	46b2                	lw	a3,12(sp)
    3144:	47d0                	lw	a2,12(a5)
    3146:	e1e1                	bnez	a1,3206 <wj_usi_spi_irqhandler+0x1fe>
            if (spi_priv->cb_event) {
    3148:	c271                	beqz	a2,320c <wj_usi_spi_irqhandler+0x204>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    314a:	43a8                	lw	a0,64(a5)
    314c:	9602                	jalr	a2
        wj_spi_intr_tx_empty(spi_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    314e:	4789                	li	a5,2
    3150:	d03c                	sw	a5,96(s0)
    }

    addr->USI_INTR_CLR = intr_state;
    3152:	4782                	lw	a5,0(sp)
}
    3154:	40f2                	lw	ra,28(sp)
    3156:	44d2                	lw	s1,20(sp)
    addr->USI_INTR_CLR = intr_state;
    3158:	d03c                	sw	a5,96(s0)
}
    315a:	4462                	lw	s0,24(sp)
    315c:	6105                	addi	sp,sp,32
    315e:	8082                	ret
        *pbuffer = addr->USI_TX_RX_FIFO;
    3160:	00842383          	lw	t2,8(s0)
        pbuffer++;
    3164:	0585                	addi	a1,a1,1
        *pbuffer = addr->USI_TX_RX_FIFO;
    3166:	fe758fa3          	sb	t2,-1(a1) # fffdffff <__heap_end+0xdffaffff>
        pbuffer++;
    316a:	b5e5                	j	3052 <wj_usi_spi_irqhandler+0x4a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(spi_priv->base);
    316c:	04c00793          	li	a5,76
    3170:	02f687b3          	mul	a5,a3,a5
    3174:	97a6                	add	a5,a5,s1
    3176:	0007a283          	lw	t0,0(a5)
            addr->USI_SPI_CTRL &= ~WJ_USI_SPI_CTRL_TMODE;
    317a:	0442a383          	lw	t2,68(t0) # 2382 <strchr+0x28>
    317e:	fcf3f393          	andi	t2,t2,-49
    3182:	0472a223          	sw	t2,68(t0)
            addr->USI_SPI_CTRL |= WJ_USI_SPI_CTRL_TMODE_RX;
    3186:	0442a383          	lw	t2,68(t0)
    318a:	0203e393          	ori	t2,t2,32
    318e:	0472a223          	sw	t2,68(t0)
    spi_priv->mode = mode;
    3192:	4289                	li	t0,2
    3194:	0257a823          	sw	t0,48(a5)
        spi_priv->recv_buf = pbuffer;
    3198:	cfcc                	sw	a1,28(a5)
        spi_priv->recv_num = length;
    319a:	cbc8                	sw	a0,20(a5)
    319c:	bf39                	j	30ba <wj_usi_spi_irqhandler+0xb2>
            *spi_priv->recv_buf = addr->USI_TX_RX_FIFO;
    319e:	00832503          	lw	a0,8(t1)
    31a2:	4fcc                	lw	a1,28(a5)
    31a4:	00a58023          	sb	a0,0(a1)
            spi_priv->recv_buf++;
    31a8:	4fcc                	lw	a1,28(a5)
    31aa:	0585                	addi	a1,a1,1
    31ac:	cfcc                	sw	a1,28(a5)
            spi_priv->transfer_num--;
    31ae:	53cc                	lw	a1,36(a5)
    31b0:	15fd                	addi	a1,a1,-1
    31b2:	d3cc                	sw	a1,36(a5)
    31b4:	b71d                	j	30da <wj_usi_spi_irqhandler+0xd2>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31b6:	4f88                	lw	a0,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31b8:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31ba:	00054383          	lbu	t2,0(a0)
            spi_priv->send_buf++;
    31be:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31c0:	00732423          	sw	t2,8(t1)
            spi_priv->send_buf++;
    31c4:	cf88                	sw	a0,24(a5)
            spi_priv->send_num--;
    31c6:	4b88                	lw	a0,16(a5)
    31c8:	157d                	addi	a0,a0,-1
    31ca:	cb88                	sw	a0,16(a5)
    31cc:	b735                	j	30f8 <wj_usi_spi_irqhandler+0xf0>
        if (spi_priv->clk_num >= USI_TX_MAX_FIFO) {
    31ce:	578c                	lw	a1,40(a5)
    31d0:	453d                	li	a0,15
    31d2:	00b57363          	bgeu	a0,a1,31d8 <wj_usi_spi_irqhandler+0x1d0>
            spi_priv->transfer_num = USI_TX_MAX_FIFO;
    31d6:	45c1                	li	a1,16
            spi_priv->transfer_num = spi_priv->clk_num;
    31d8:	d3cc                	sw	a1,36(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31da:	04c00793          	li	a5,76
    31de:	02f687b3          	mul	a5,a3,a5
    31e2:	4501                	li	a0,0
    31e4:	97a6                	add	a5,a5,s1
    31e6:	0247a283          	lw	t0,36(a5)
    31ea:	f05509e3          	beq	a0,t0,30fc <wj_usi_spi_irqhandler+0xf4>
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31ee:	4f8c                	lw	a1,24(a5)
        for (i = 0; i < spi_priv->transfer_num; i++) {
    31f0:	0505                	addi	a0,a0,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31f2:	0005c383          	lbu	t2,0(a1)
            spi_priv->send_buf++;
    31f6:	0585                	addi	a1,a1,1
            addr->USI_TX_RX_FIFO = *spi_priv->send_buf;
    31f8:	00732423          	sw	t2,8(t1)
            spi_priv->send_buf++;
    31fc:	cf8c                	sw	a1,24(a5)
            spi_priv->send_num--;
    31fe:	4b8c                	lw	a1,16(a5)
    3200:	15fd                	addi	a1,a1,-1
    3202:	cb8c                	sw	a1,16(a5)
    3204:	b7dd                	j	31ea <wj_usi_spi_irqhandler+0x1e2>
            if (spi_priv->cb_event) {
    3206:	c219                	beqz	a2,320c <wj_usi_spi_irqhandler+0x204>
                spi_priv->cb_event(spi_priv->idx, SPI_EVENT_TX_COMPLETE);
    3208:	4585                	li	a1,1
    320a:	b781                	j	314a <wj_usi_spi_irqhandler+0x142>
    spi_priv->clk_num -= spi_priv->transfer_num;
    320c:	04c00793          	li	a5,76
    3210:	02f686b3          	mul	a3,a3,a5
    3214:	94b6                	add	s1,s1,a3
    3216:	549c                	lw	a5,40(s1)
    3218:	50d4                	lw	a3,36(s1)
    321a:	8f95                	sub	a5,a5,a3
    321c:	d49c                	sw	a5,40(s1)
    321e:	bf05                	j	314e <wj_usi_spi_irqhandler+0x146>

00003220 <ck_usart_intr_recv_data>:
  \brief        interrupt service function for receiver data available.
  \param[in]   usart_priv usart private to operate.
*/
static void ck_usart_intr_recv_data(wj_usi_usart_priv_t *usart_priv)
{
    if ((usart_priv->rx_total_num == 0) || (usart_priv->rx_buf == NULL)) {
    3220:	4558                	lw	a4,12(a0)
    3222:	c319                	beqz	a4,3228 <ck_usart_intr_recv_data+0x8>
    3224:	495c                	lw	a5,20(a0)
    3226:	e791                	bnez	a5,3232 <ck_usart_intr_recv_data+0x12>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    3228:	00852303          	lw	t1,8(a0)
    322c:	45b9                	li	a1,14
        usart_priv->rx_buf = NULL;
        usart_priv->rx_busy = 0;
        usart_priv->rx_total_num = 0;

        if (usart_priv->cb_event) {
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    322e:	5948                	lw	a0,52(a0)
    3230:	8302                	jr	t1
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3232:	4110                	lw	a2,0(a0)
    uint32_t rxfifo_num = (addr->USI_FIFO_STA >> 16) & 0xf;
    3234:	465c                	lw	a5,12(a2)
    3236:	83c1                	srli	a5,a5,0x10
    3238:	8bbd                	andi	a5,a5,15
    uint32_t rxdata_num = (rxfifo_num > usart_priv->rx_total_num) ? usart_priv->rx_total_num : rxfifo_num;
    323a:	00f77363          	bgeu	a4,a5,3240 <ck_usart_intr_recv_data+0x20>
    323e:	87ba                	mv	a5,a4
    for (i = 0; i < rxdata_num; i++) {
    3240:	4701                	li	a4,0
    3242:	02f71563          	bne	a4,a5,326c <ck_usart_intr_recv_data+0x4c>
    if (usart_priv->rx_cnt >= usart_priv->rx_total_num) {
    3246:	4d58                	lw	a4,28(a0)
    3248:	455c                	lw	a5,12(a0)
    324a:	02f76d63          	bltu	a4,a5,3284 <ck_usart_intr_recv_data+0x64>
        if (usart_priv->cb_event) {
    324e:	00852303          	lw	t1,8(a0)
        usart_priv->rx_cnt = 0;
    3252:	00052e23          	sw	zero,28(a0)
        usart_priv->last_rx_num = usart_priv->rx_total_num;
    3256:	d91c                	sw	a5,48(a0)
        usart_priv->rx_buf = NULL;
    3258:	00052a23          	sw	zero,20(a0)
        usart_priv->rx_busy = 0;
    325c:	02052423          	sw	zero,40(a0)
        usart_priv->rx_total_num = 0;
    3260:	00052623          	sw	zero,12(a0)
        if (usart_priv->cb_event) {
    3264:	02030063          	beqz	t1,3284 <ck_usart_intr_recv_data+0x64>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVE_COMPLETE);
    3268:	4585                	li	a1,1
    326a:	b7d1                	j	322e <ck_usart_intr_recv_data+0xe>
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    326c:	460c                	lw	a1,8(a2)
    326e:	4954                	lw	a3,20(a0)
    for (i = 0; i < rxdata_num; i++) {
    3270:	0705                	addi	a4,a4,1
        *((uint8_t *)usart_priv->rx_buf) = addr->USI_TX_RX_FIFO;;
    3272:	00b68023          	sb	a1,0(a3)
        usart_priv->rx_cnt++;
    3276:	4d54                	lw	a3,28(a0)
    3278:	0685                	addi	a3,a3,1
    327a:	cd54                	sw	a3,28(a0)
        usart_priv->rx_buf++;
    327c:	4954                	lw	a3,20(a0)
    327e:	0685                	addi	a3,a3,1
    3280:	c954                	sw	a3,20(a0)
    3282:	b7c1                	j	3242 <ck_usart_intr_recv_data+0x22>
        }
    }
}
    3284:	8082                	ret

00003286 <drv_usi_usart_config_baudrate>:
{
    3286:	1141                	addi	sp,sp,-16
    3288:	c422                	sw	s0,8(sp)
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    328a:	4100                	lw	s0,0(a0)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    328c:	5948                	lw	a0,52(a0)
{
    328e:	c606                	sw	ra,12(sp)
    addr->USI_EN = 0x0;
    3290:	00042023          	sw	zero,0(s0)
{
    3294:	c02e                	sw	a1,0(sp)
    uint32_t divisor = ((drv_get_usi_freq(usart_priv->idx)  * 10) / baudrate) >> 4;
    3296:	243000ef          	jal	ra,3cd8 <drv_get_usi_freq>
    329a:	4729                	li	a4,10
    329c:	02e50533          	mul	a0,a0,a4
    32a0:	4582                	lw	a1,0(sp)
    32a2:	02b555b3          	divu	a1,a0,a1
    32a6:	8191                	srli	a1,a1,0x4
    if ((divisor % 10) >= 5) {
    32a8:	02e5d7b3          	divu	a5,a1,a4
    32ac:	02e5f5b3          	remu	a1,a1,a4
    32b0:	4711                	li	a4,4
    32b2:	00b76363          	bltu	a4,a1,32b8 <drv_usi_usart_config_baudrate+0x32>
        divisor = divisor / 10 - 1;
    32b6:	17fd                	addi	a5,a5,-1
    addr->USI_CLK_DIV0 = divisor;
    32b8:	c81c                	sw	a5,16(s0)
    addr->USI_EN = 0xf;
    32ba:	47bd                	li	a5,15
    32bc:	c01c                	sw	a5,0(s0)
}
    32be:	40b2                	lw	ra,12(sp)
    32c0:	4422                	lw	s0,8(sp)
    32c2:	4501                	li	a0,0
    32c4:	0141                	addi	sp,sp,16
    32c6:	8082                	ret

000032c8 <drv_usi_usart_config_mode>:
    USART_NULL_PARAM_CHK(handle);
    32c8:	cd11                	beqz	a0,32e4 <drv_usi_usart_config_mode+0x1c>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    32ca:	411c                	lw	a5,0(a0)
        addr->USI_EN = 0xf;
    32cc:	473d                	li	a4,15
    addr->USI_EN = 0x0;
    32ce:	0007a023          	sw	zero,0(a5)
        addr->USI_EN = 0xf;
    32d2:	c398                	sw	a4,0(a5)
    if (mode == USART_MODE_ASYNCHRONOUS) {
    32d4:	e199                	bnez	a1,32da <drv_usi_usart_config_mode+0x12>
        return 0;
    32d6:	4501                	li	a0,0
    32d8:	8082                	ret
    return ERR_USART(USART_ERROR_MODE);
    32da:	81020537          	lui	a0,0x81020
    32de:	08650513          	addi	a0,a0,134 # 81020086 <__heap_end+0x60ff0086>
    32e2:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    32e4:	81020537          	lui	a0,0x81020
    32e8:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    32ec:	8082                	ret

000032ee <drv_usi_usart_config_parity>:
    USART_NULL_PARAM_CHK(handle);
    32ee:	c939                	beqz	a0,3344 <drv_usi_usart_config_parity+0x56>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    32f0:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    32f2:	4705                	li	a4,1
    32f4:	0007a023          	sw	zero,0(a5)
    switch (parity) {
    32f8:	02e58b63          	beq	a1,a4,332e <drv_usi_usart_config_parity+0x40>
    32fc:	c989                	beqz	a1,330e <drv_usi_usart_config_parity+0x20>
    32fe:	4709                	li	a4,2
    3300:	00e58e63          	beq	a1,a4,331c <drv_usi_usart_config_parity+0x2e>
            return ERR_USART(USART_ERROR_PARITY);
    3304:	81020537          	lui	a0,0x81020
    3308:	08950513          	addi	a0,a0,137 # 81020089 <__heap_end+0x60ff0089>
    330c:	8082                	ret
            addr->USI_UART_CTRL &= ~CTRL_PARITY_ENABLE;
    330e:	4f98                	lw	a4,24(a5)
    3310:	9b3d                	andi	a4,a4,-17
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    3312:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    3314:	473d                	li	a4,15
    3316:	c398                	sw	a4,0(a5)
    return 0;
    3318:	4501                	li	a0,0
    331a:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    331c:	4f98                	lw	a4,24(a5)
    331e:	8b3d                	andi	a4,a4,15
    3320:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    3322:	4f98                	lw	a4,24(a5)
    3324:	01076713          	ori	a4,a4,16
    3328:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ODD;
    332a:	4f98                	lw	a4,24(a5)
    332c:	b7dd                	j	3312 <drv_usi_usart_config_parity+0x24>
            addr->USI_UART_CTRL &= CTRL_PARITY_BITS;
    332e:	4f98                	lw	a4,24(a5)
    3330:	8b3d                	andi	a4,a4,15
    3332:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_ENABLE;
    3334:	4f98                	lw	a4,24(a5)
    3336:	01076713          	ori	a4,a4,16
    333a:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_PARITY_EVEN;
    333c:	4f98                	lw	a4,24(a5)
    333e:	02076713          	ori	a4,a4,32
    3342:	bfc1                	j	3312 <drv_usi_usart_config_parity+0x24>
    USART_NULL_PARAM_CHK(handle);
    3344:	81020537          	lui	a0,0x81020
    3348:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    334c:	8082                	ret

0000334e <drv_usi_usart_config_stopbits>:
    USART_NULL_PARAM_CHK(handle);
    334e:	c931                	beqz	a0,33a2 <drv_usi_usart_config_stopbits+0x54>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3350:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    3352:	4705                	li	a4,1
    3354:	0007a023          	sw	zero,0(a5)
    switch (stopbit) {
    3358:	02e58d63          	beq	a1,a4,3392 <drv_usi_usart_config_stopbits+0x44>
    335c:	c989                	beqz	a1,336e <drv_usi_usart_config_stopbits+0x20>
    335e:	4709                	li	a4,2
    3360:	02e58163          	beq	a1,a4,3382 <drv_usi_usart_config_stopbits+0x34>
            return ERR_USART(USART_ERROR_STOP_BITS);
    3364:	81020537          	lui	a0,0x81020
    3368:	08a50513          	addi	a0,a0,138 # 8102008a <__heap_end+0x60ff008a>
    336c:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    336e:	4f98                	lw	a4,24(a5)
    3370:	03377713          	andi	a4,a4,51
    3374:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1;
    3376:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    3378:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    337a:	473d                	li	a4,15
    337c:	c398                	sw	a4,0(a5)
    return 0;
    337e:	4501                	li	a0,0
    3380:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3382:	4f98                	lw	a4,24(a5)
    3384:	03377713          	andi	a4,a4,51
    3388:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_1_5;
    338a:	4f98                	lw	a4,24(a5)
    338c:	00476713          	ori	a4,a4,4
    3390:	b7e5                	j	3378 <drv_usi_usart_config_stopbits+0x2a>
            addr->USI_UART_CTRL &= CTRL_STOP_BITS;
    3392:	4f98                	lw	a4,24(a5)
    3394:	03377713          	andi	a4,a4,51
    3398:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_STOP_2;
    339a:	4f98                	lw	a4,24(a5)
    339c:	00876713          	ori	a4,a4,8
    33a0:	bfe1                	j	3378 <drv_usi_usart_config_stopbits+0x2a>
    USART_NULL_PARAM_CHK(handle);
    33a2:	81020537          	lui	a0,0x81020
    33a6:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    33aa:	8082                	ret

000033ac <drv_usi_usart_config_databits>:
    USART_NULL_PARAM_CHK(handle);
    33ac:	c52d                	beqz	a0,3416 <drv_usi_usart_config_databits+0x6a>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    33ae:	411c                	lw	a5,0(a0)
    addr->USI_EN = 0x0;
    33b0:	4705                	li	a4,1
    33b2:	0007a023          	sw	zero,0(a5)
    switch (databits) {
    33b6:	02e58863          	beq	a1,a4,33e6 <drv_usi_usart_config_databits+0x3a>
    33ba:	cd81                	beqz	a1,33d2 <drv_usi_usart_config_databits+0x26>
    33bc:	4709                	li	a4,2
    33be:	02e58c63          	beq	a1,a4,33f6 <drv_usi_usart_config_databits+0x4a>
    33c2:	470d                	li	a4,3
    33c4:	04e58163          	beq	a1,a4,3406 <drv_usi_usart_config_databits+0x5a>
            return ERR_USART(USART_ERROR_DATA_BITS);
    33c8:	81020537          	lui	a0,0x81020
    33cc:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60ff0088>
    33d0:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33d2:	4f98                	lw	a4,24(a5)
    33d4:	03c77713          	andi	a4,a4,60
    33d8:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_5;
    33da:	4f98                	lw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    33dc:	cf98                	sw	a4,24(a5)
    addr->USI_EN = 0xf;
    33de:	473d                	li	a4,15
    33e0:	c398                	sw	a4,0(a5)
    return 0;
    33e2:	4501                	li	a0,0
    33e4:	8082                	ret
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33e6:	4f98                	lw	a4,24(a5)
    33e8:	03c77713          	andi	a4,a4,60
    33ec:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_6;
    33ee:	4f98                	lw	a4,24(a5)
    33f0:	00176713          	ori	a4,a4,1
    33f4:	b7e5                	j	33dc <drv_usi_usart_config_databits+0x30>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    33f6:	4f98                	lw	a4,24(a5)
    33f8:	03c77713          	andi	a4,a4,60
    33fc:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_7;
    33fe:	4f98                	lw	a4,24(a5)
    3400:	00276713          	ori	a4,a4,2
    3404:	bfe1                	j	33dc <drv_usi_usart_config_databits+0x30>
            addr->USI_UART_CTRL &= CTRL_DBIT_BITS;
    3406:	4f98                	lw	a4,24(a5)
    3408:	03c77713          	andi	a4,a4,60
    340c:	cf98                	sw	a4,24(a5)
            addr->USI_UART_CTRL |= CTRL_DBIT_8;
    340e:	4f98                	lw	a4,24(a5)
    3410:	00376713          	ori	a4,a4,3
    3414:	b7e1                	j	33dc <drv_usi_usart_config_databits+0x30>
    USART_NULL_PARAM_CHK(handle);
    3416:	81020537          	lui	a0,0x81020
    341a:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60ff0084>
}
    341e:	8082                	ret

00003420 <wj_usi_usart_irqhandler>:
    }
}

void wj_usi_usart_irqhandler(int idx)
{
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    3420:	03800793          	li	a5,56
    3424:	02f507b3          	mul	a5,a0,a5
    3428:	200026b7          	lui	a3,0x20002
    342c:	8f068713          	addi	a4,a3,-1808 # 200018f0 <usi_usart_instance>
{
    3430:	1101                	addi	sp,sp,-32
    3432:	ca26                	sw	s1,20(sp)
    3434:	cc22                	sw	s0,24(sp)
    3436:	ce06                	sw	ra,28(sp)
    3438:	842a                	mv	s0,a0
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    343a:	97ba                	add	a5,a5,a4
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    343c:	4384                	lw	s1,0(a5)

    uint32_t intr_state = addr->USI_INTR_STA & 0x3ffff;
    343e:	48f8                	lw	a4,84(s1)
    3440:	c03a                	sw	a4,0(sp)
    3442:	073a                	slli	a4,a4,0xe
    3444:	8339                	srli	a4,a4,0xe
    3446:	c43a                	sw	a4,8(sp)

    if (intr_state & USI_INT_TX_EMPTY) {
    3448:	4702                	lw	a4,0(sp)
    344a:	00277613          	andi	a2,a4,2
    344e:	8f068713          	addi	a4,a3,-1808
    3452:	c23a                	sw	a4,4(sp)
    3454:	ce1d                	beqz	a2,3492 <wj_usi_usart_irqhandler+0x72>
    if (usart_priv->tx_total_num == 0) {
    3456:	4b94                	lw	a3,16(a5)
    3458:	ca9d                	beqz	a3,348e <wj_usi_usart_irqhandler+0x6e>
    if (usart_priv->tx_cnt >= usart_priv->tx_total_num) {
    345a:	5390                	lw	a2,32(a5)
    345c:	0ad66f63          	bltu	a2,a3,351a <wj_usi_usart_irqhandler+0xfa>
        addr->USI_INTR_EN &= (~USI_INT_TX_EMPTY);
    3460:	48b0                	lw	a2,80(s1)
    3462:	9a75                	andi	a2,a2,-3
    3464:	c8b0                	sw	a2,80(s1)
        addr->USI_INTR_EN |= USI_INT_UART_STOP;
    3466:	48b0                	lw	a2,80(s1)
    3468:	40066613          	ori	a2,a2,1024
    346c:	c8b0                	sw	a2,80(s1)
        usart_priv->last_tx_num = usart_priv->tx_total_num;
    346e:	d7d4                	sw	a3,44(a5)
        if (usart_priv->cb_event) {
    3470:	4794                	lw	a3,8(a5)
        usart_priv->tx_cnt = 0;
    3472:	0207a023          	sw	zero,32(a5)
        usart_priv->tx_busy = 0;
    3476:	0207a223          	sw	zero,36(a5)
        usart_priv->tx_buf = NULL;
    347a:	0007ac23          	sw	zero,24(a5)
        usart_priv->tx_total_num = 0;
    347e:	0007a823          	sw	zero,16(a5)
        if (usart_priv->cb_event) {
    3482:	c691                	beqz	a3,348e <wj_usi_usart_irqhandler+0x6e>
            usart_priv->cb_event(usart_priv->idx, USART_EVENT_SEND_COMPLETE);
    3484:	5bc8                	lw	a0,52(a5)
    3486:	4581                	li	a1,0
    3488:	c63e                	sw	a5,12(sp)
    348a:	9682                	jalr	a3
    348c:	47b2                	lw	a5,12(sp)
        ck_usart_intr_threshold_empty(usart_priv);
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    348e:	4689                	li	a3,2
    3490:	d0b4                	sw	a3,96(s1)
    }

    if (intr_state & USI_INT_RX_THOLD) {
    3492:	4702                	lw	a4,0(sp)
    3494:	02077693          	andi	a3,a4,32
    3498:	ca81                	beqz	a3,34a8 <wj_usi_usart_irqhandler+0x88>
        ck_usart_intr_recv_data(usart_priv);
    349a:	853e                	mv	a0,a5
    349c:	c63e                	sw	a5,12(sp)
    349e:	3349                	jal	3220 <ck_usart_intr_recv_data>
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    34a0:	47b2                	lw	a5,12(sp)
    34a2:	02000693          	li	a3,32
    34a6:	d0b4                	sw	a3,96(s1)
    }

    if (intr_state & USI_INT_UART_STOP) {
    34a8:	4702                	lw	a4,0(sp)
    34aa:	40077693          	andi	a3,a4,1024
    34ae:	c685                	beqz	a3,34d6 <wj_usi_usart_irqhandler+0xb6>
        if (USI_FIFO_STA_RX_NUM(addr) > 0) {
    34b0:	44d4                	lw	a3,12(s1)
    34b2:	82c1                	srli	a3,a3,0x10
    34b4:	8afd                	andi	a3,a3,31
    34b6:	ce89                	beqz	a3,34d0 <wj_usi_usart_irqhandler+0xb0>
    if ((usart_priv->rx_total_num != 0) && (usart_priv->rx_buf != NULL)) {
    34b8:	03800693          	li	a3,56
    34bc:	02d406b3          	mul	a3,s0,a3
    34c0:	4712                	lw	a4,4(sp)
    34c2:	96ba                	add	a3,a3,a4
    34c4:	46d0                	lw	a2,12(a3)
    34c6:	ce41                	beqz	a2,355e <wj_usi_usart_irqhandler+0x13e>
    34c8:	4ad4                	lw	a3,20(a3)
    34ca:	cad1                	beqz	a3,355e <wj_usi_usart_irqhandler+0x13e>
        ck_usart_intr_recv_data(usart_priv);
    34cc:	853e                	mv	a0,a5
    34ce:	3b89                	jal	3220 <ck_usart_intr_recv_data>
            ck_usart_intr_char_timeout(usart_priv);     //receive small data
        }

        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    34d0:	02000793          	li	a5,32
    34d4:	d0bc                	sw	a5,96(s1)
    }

    if (intr_state & USI_INT_UART_PERR) {
    34d6:	4782                	lw	a5,0(sp)
    34d8:	01479713          	slli	a4,a5,0x14
    34dc:	02075863          	bgez	a4,350c <wj_usi_usart_irqhandler+0xec>
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    34e0:	03800793          	li	a5,56
    34e4:	02f40433          	mul	s0,s0,a5
    34e8:	4792                	lw	a5,4(sp)
    34ea:	943e                	add	s0,s0,a5
    34ec:	401c                	lw	a5,0(s0)
    addr->USI_EN &= ~USI_RX_FIFO_EN;
    34ee:	4394                	lw	a3,0(a5)
    34f0:	9add                	andi	a3,a3,-9
    34f2:	c394                	sw	a3,0(a5)
    addr->USI_EN |= USI_RX_FIFO_EN;
    34f4:	4394                	lw	a3,0(a5)
    34f6:	0086e693          	ori	a3,a3,8
    34fa:	c394                	sw	a3,0(a5)
    if (usart_priv->cb_event) {
    34fc:	441c                	lw	a5,8(s0)
    34fe:	c781                	beqz	a5,3506 <wj_usi_usart_irqhandler+0xe6>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RX_PARITY_ERROR);
    3500:	5848                	lw	a0,52(s0)
    3502:	45a5                	li	a1,9
    3504:	9782                	jalr	a5
        ck_usart_intr_recv_line(usart_priv);
        addr->USI_INTR_CLR = USI_INT_RX_THOLD;
    3506:	02000793          	li	a5,32
    350a:	d0bc                	sw	a5,96(s1)
    }

    addr->USI_INTR_CLR = intr_state;
    350c:	47a2                	lw	a5,8(sp)
}
    350e:	40f2                	lw	ra,28(sp)
    3510:	4462                	lw	s0,24(sp)
    addr->USI_INTR_CLR = intr_state;
    3512:	d0bc                	sw	a5,96(s1)
}
    3514:	44d2                	lw	s1,20(sp)
    3516:	6105                	addi	sp,sp,32
    3518:	8082                	ret
        uint32_t remain_txdata  = usart_priv->tx_total_num - usart_priv->tx_cnt;
    351a:	538c                	lw	a1,32(a5)
    351c:	40b685b3          	sub	a1,a3,a1
        uint32_t txdata_num = (remain_txdata > (USI_TX_MAX_FIFO - 1)) ? (USI_TX_MAX_FIFO - 1) : remain_txdata;
    3520:	46bd                	li	a3,15
    3522:	00b6f363          	bgeu	a3,a1,3528 <wj_usi_usart_irqhandler+0x108>
    3526:	45bd                	li	a1,15
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3528:	03800693          	li	a3,56
    352c:	02d406b3          	mul	a3,s0,a3
    3530:	4712                	lw	a4,4(sp)
        volatile uint32_t i = 0u;
    3532:	c802                	sw	zero,16(sp)
        for (i = 0; i < txdata_num; i++) {
    3534:	c802                	sw	zero,16(sp)
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3536:	96ba                	add	a3,a3,a4
        for (i = 0; i < txdata_num; i++) {
    3538:	4642                	lw	a2,16(sp)
    353a:	00b66563          	bltu	a2,a1,3544 <wj_usi_usart_irqhandler+0x124>
        addr->USI_INTR_CLR = USI_INT_TX_EMPTY;
    353e:	4689                	li	a3,2
    3540:	d0b4                	sw	a3,96(s1)
    3542:	b7b1                	j	348e <wj_usi_usart_irqhandler+0x6e>
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    3544:	4e90                	lw	a2,24(a3)
    3546:	00064503          	lbu	a0,0(a2)
            usart_priv->tx_buf++;
    354a:	0605                	addi	a2,a2,1
            addr->USI_TX_RX_FIFO = *((uint8_t *)usart_priv->tx_buf);
    354c:	c488                	sw	a0,8(s1)
            usart_priv->tx_cnt++;
    354e:	5288                	lw	a0,32(a3)
            usart_priv->tx_buf++;
    3550:	ce90                	sw	a2,24(a3)
            usart_priv->tx_cnt++;
    3552:	0505                	addi	a0,a0,1
    3554:	d288                	sw	a0,32(a3)
        for (i = 0; i < txdata_num; i++) {
    3556:	4642                	lw	a2,16(sp)
    3558:	0605                	addi	a2,a2,1
    355a:	c832                	sw	a2,16(sp)
    355c:	bff1                	j	3538 <wj_usi_usart_irqhandler+0x118>
    if (usart_priv->cb_event) {
    355e:	03800793          	li	a5,56
    3562:	02f407b3          	mul	a5,s0,a5
    3566:	4712                	lw	a4,4(sp)
    3568:	97ba                	add	a5,a5,a4
    356a:	4794                	lw	a3,8(a5)
    356c:	c689                	beqz	a3,3576 <wj_usi_usart_irqhandler+0x156>
        usart_priv->cb_event(usart_priv->idx, USART_EVENT_RECEIVED);
    356e:	5bc8                	lw	a0,52(a5)
    3570:	45b9                	li	a1,14
    3572:	9682                	jalr	a3
    3574:	bfb1                	j	34d0 <wj_usi_usart_irqhandler+0xb0>
        wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3576:	439c                	lw	a5,0(a5)
        addr->USI_EN &= ~USI_RX_FIFO_EN;
    3578:	4394                	lw	a3,0(a5)
    357a:	9add                	andi	a3,a3,-9
    357c:	c394                	sw	a3,0(a5)
        addr->USI_EN |= USI_RX_FIFO_EN;
    357e:	4394                	lw	a3,0(a5)
    3580:	0086e693          	ori	a3,a3,8
    3584:	c394                	sw	a3,0(a5)
    3586:	b7a9                	j	34d0 <wj_usi_usart_irqhandler+0xb0>

00003588 <drv_usi_usart_putchar>:
  \return      error code
*/
int32_t drv_usi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    3588:	4118                	lw	a4,0(a0)
    //addr->USI_EN = 0xb;
    //addr->USI_EN = 0xf;
    addr->USI_TX_RX_FIFO = ch;
    358a:	c70c                	sw	a1,8(a4)

    while (!(addr->USI_FIFO_STA & 0x1));
    358c:	475c                	lw	a5,12(a4)
    358e:	8b85                	andi	a5,a5,1
    3590:	dff5                	beqz	a5,358c <drv_usi_usart_putchar+0x4>

    return 0;
}
    3592:	4501                	li	a0,0
    3594:	8082                	ret

00003596 <drv_usi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event event call back function \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t drv_usi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    3596:	1111                	addi	sp,sp,-28
    3598:	c02e                	sw	a1,0(sp)
    //initialize instace
    uint32_t base;
    uint32_t irq;
    void *handler;

    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    359a:	0074                	addi	a3,sp,12
    359c:	0030                	addi	a2,sp,8
    359e:	004c                	addi	a1,sp,4
{
    35a0:	c826                	sw	s1,16(sp)
    35a2:	cc06                	sw	ra,24(sp)
    35a4:	ca22                	sw	s0,20(sp)
    35a6:	84aa                	mv	s1,a0
    int32_t ret  = target_usi_usart_init(idx, &base, &irq, &handler);
    35a8:	2241                	jal	3728 <target_usi_usart_init>

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
    35aa:	4789                	li	a5,2
    35ac:	00a7f963          	bgeu	a5,a0,35be <drv_usi_usart_initialize+0x28>
        return NULL;
    35b0:	4401                	li	s0,0
    addr->USI_MODE_SEL = USI_MODE_UART;
    drv_irq_register(usart_priv->irq, handler);
    drv_irq_enable(usart_priv->irq);

    return usart_priv;
}
    35b2:	8522                	mv	a0,s0
    35b4:	40e2                	lw	ra,24(sp)
    35b6:	4452                	lw	s0,20(sp)
    35b8:	44c2                	lw	s1,16(sp)
    35ba:	0171                	addi	sp,sp,28
    35bc:	8082                	ret
    ret = drv_usi_initialize(idx);
    35be:	8526                	mv	a0,s1
    35c0:	f44ff0ef          	jal	ra,2d04 <drv_usi_initialize>
    if (ret < 0) {
    35c4:	fe0546e3          	bltz	a0,35b0 <drv_usi_usart_initialize+0x1a>
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35c8:	03800413          	li	s0,56
    35cc:	028487b3          	mul	a5,s1,s0
    usart_priv->irq = irq;
    35d0:	4722                	lw	a4,8(sp)
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35d2:	20002437          	lui	s0,0x20002
    35d6:	8f040413          	addi	s0,s0,-1808 # 200018f0 <usi_usart_instance>
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    35da:	45c1                	li	a1,16
    wj_usi_usart_priv_t *usart_priv = &usi_usart_instance[idx];
    35dc:	943e                	add	s0,s0,a5
    usart_priv->irq = irq;
    35de:	c058                	sw	a4,4(s0)
    usart_priv->base = base;
    35e0:	4792                	lw	a5,4(sp)
    usart_priv->cb_event = cb_event;
    35e2:	4702                	lw	a4,0(sp)
    usart_priv->idx = idx;
    35e4:	d844                	sw	s1,52(s0)
    usart_priv->base = base;
    35e6:	c01c                	sw	a5,0(s0)
    usart_priv->cb_event = cb_event;
    35e8:	c418                	sw	a4,8(s0)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    35ea:	6705                	lui	a4,0x1
    35ec:	f9870713          	addi	a4,a4,-104 # f98 <__divdf3+0xf0>
    addr->USI_EN = 0x0;
    35f0:	0007a023          	sw	zero,0(a5)
    addr->USI_INTR_UNMASK = WJ_UART_INT_ENABLE_DEFAUL;
    35f4:	cff8                	sw	a4,92(a5)
    addr->USI_INTR_EN = WJ_UART_INT_ENABLE_DEFAUL;
    35f6:	cbb8                	sw	a4,80(a5)
    wj_usi_set_rxfifo_th(addr, USI_RX_MAX_FIFO);
    35f8:	853e                	mv	a0,a5
    35fa:	c03e                	sw	a5,0(sp)
    35fc:	e90ff0ef          	jal	ra,2c8c <wj_usi_set_rxfifo_th>
    addr->USI_MODE_SEL = USI_MODE_UART;
    3600:	4782                	lw	a5,0(sp)
    drv_irq_register(usart_priv->irq, handler);
    3602:	4048                	lw	a0,4(s0)
    3604:	45b2                	lw	a1,12(sp)
    addr->USI_MODE_SEL = USI_MODE_UART;
    3606:	0007a223          	sw	zero,4(a5)
    drv_irq_register(usart_priv->irq, handler);
    360a:	e72ff0ef          	jal	ra,2c7c <drv_irq_register>
    drv_irq_enable(usart_priv->irq);
    360e:	4048                	lw	a0,4(s0)
    3610:	e54ff0ef          	jal	ra,2c64 <drv_irq_enable>
    return usart_priv;
    3614:	bf79                	j	35b2 <drv_usi_usart_initialize+0x1c>

00003616 <drv_usi_usart_config>:
                             uint32_t baud,
                             usart_mode_e mode,
                             usart_parity_e parity,
                             usart_stop_bits_e stopbits,
                             usart_data_bits_e bits)
{
    3616:	1111                	addi	sp,sp,-28
    3618:	c826                	sw	s1,16(sp)
    int32_t ret;
    wj_usi_usart_priv_t *usart_priv = handle;
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usart_priv->base);
    361a:	4104                	lw	s1,0(a0)
{
    361c:	ca22                	sw	s0,20(sp)
    361e:	cc06                	sw	ra,24(sp)

    addr->USI_EN = 0x0;
    3620:	0004a023          	sw	zero,0(s1)
{
    3624:	842a                	mv	s0,a0
    3626:	c632                	sw	a2,12(sp)
    3628:	c436                	sw	a3,8(sp)
    362a:	c03a                	sw	a4,0(sp)
    362c:	c23e                	sw	a5,4(sp)
    /* control the data_bit of the usart*/
    ret = drv_usi_usart_config_baudrate(handle, baud);
    362e:	39a1                	jal	3286 <drv_usi_usart_config_baudrate>

    if (ret < 0) {
    3630:	02054b63          	bltz	a0,3666 <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control the parity of the usart*/
    ret = drv_usi_usart_config_parity(handle, parity);
    3634:	46a2                	lw	a3,8(sp)
    3636:	8522                	mv	a0,s0
    3638:	85b6                	mv	a1,a3
    363a:	3955                	jal	32ee <drv_usi_usart_config_parity>

    if (ret < 0) {
    363c:	02054563          	bltz	a0,3666 <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control mode of the usart*/
    ret = drv_usi_usart_config_mode(handle, mode);
    3640:	4632                	lw	a2,12(sp)
    3642:	8522                	mv	a0,s0
    3644:	85b2                	mv	a1,a2
    3646:	3149                	jal	32c8 <drv_usi_usart_config_mode>

    if (ret < 0) {
    3648:	00054f63          	bltz	a0,3666 <drv_usi_usart_config+0x50>
        return ret;
    }

    /* control the stopbit of the usart*/
    ret = drv_usi_usart_config_stopbits(handle, stopbits);
    364c:	4582                	lw	a1,0(sp)
    364e:	8522                	mv	a0,s0
    3650:	39fd                	jal	334e <drv_usi_usart_config_stopbits>

    if (ret < 0) {
    3652:	00054a63          	bltz	a0,3666 <drv_usi_usart_config+0x50>
        return ret;
    }

    ret = drv_usi_usart_config_databits(handle, bits);
    3656:	4592                	lw	a1,4(sp)
    3658:	8522                	mv	a0,s0
    365a:	3b89                	jal	33ac <drv_usi_usart_config_databits>

    if (ret < 0) {
    365c:	00054563          	bltz	a0,3666 <drv_usi_usart_config+0x50>
        return ret;
    }

    addr->USI_EN = 0xf;
    3660:	47bd                	li	a5,15
    3662:	c09c                	sw	a5,0(s1)
    return 0;
    3664:	4501                	li	a0,0
}
    3666:	40e2                	lw	ra,24(sp)
    3668:	4452                	lw	s0,20(sp)
    366a:	44c2                	lw	s1,16(sp)
    366c:	0171                	addi	sp,sp,28
    366e:	8082                	ret

00003670 <csi_usart_putchar>:
  \param[in]   ch  the input character
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    return drv_usi_usart_putchar(handle, ch);
    3670:	bf21                	j	3588 <drv_usi_usart_putchar>

00003672 <csi_usart_initialize>:
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    return drv_usi_usart_initialize(idx, cb_event);
    3672:	b715                	j	3596 <drv_usi_usart_initialize>

00003674 <csi_usart_config>:
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    return drv_usi_usart_config(handle, baud, mode, parity, stopbits, bits);
    3674:	b74d                	j	3616 <drv_usi_usart_config>

00003676 <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_timer_count()) {
    3676:	47bd                	li	a5,15
    3678:	04a7c163          	blt	a5,a0,36ba <target_get_timer+0x44>
        return -1;
    }

    if (base != NULL) {
    367c:	c991                	beqz	a1,3690 <target_get_timer+0x1a>
        *base = sg_timer_config[idx].base;
    367e:	47b1                	li	a5,12
    3680:	02f50733          	mul	a4,a0,a5
    3684:	679d                	lui	a5,0x7
    3686:	6f878793          	addi	a5,a5,1784 # 76f8 <sg_timer_config>
    368a:	97ba                	add	a5,a5,a4
    368c:	439c                	lw	a5,0(a5)
    368e:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3690:	ca11                	beqz	a2,36a4 <target_get_timer+0x2e>
        *irq = sg_timer_config[idx].irq;
    3692:	47b1                	li	a5,12
    3694:	02f50733          	mul	a4,a0,a5
    3698:	679d                	lui	a5,0x7
    369a:	6f878793          	addi	a5,a5,1784 # 76f8 <sg_timer_config>
    369e:	97ba                	add	a5,a5,a4
    36a0:	43dc                	lw	a5,4(a5)
    36a2:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    36a4:	ce81                	beqz	a3,36bc <target_get_timer+0x46>
        *handler = sg_timer_config[idx].handler;
    36a6:	47b1                	li	a5,12
    36a8:	02f50733          	mul	a4,a0,a5
    36ac:	679d                	lui	a5,0x7
    36ae:	6f878793          	addi	a5,a5,1784 # 76f8 <sg_timer_config>
    36b2:	97ba                	add	a5,a5,a4
    36b4:	479c                	lw	a5,8(a5)
    36b6:	c29c                	sw	a5,0(a3)
    36b8:	8082                	ret
        return -1;
    36ba:	557d                	li	a0,-1
    }

    return idx;
}
    36bc:	8082                	ret

000036be <target_gpio_port_init>:
} gpio_pin_map_t;

int32_t target_gpio_port_init(port_name_e port, uint32_t *base, uint32_t *irq, void **handler, uint32_t *pin_num)
{
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
        return -1;
    36be:	57fd                	li	a5,-1
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
    36c0:	c18d                	beqz	a1,36e2 <target_gpio_port_init+0x24>
    36c2:	c205                	beqz	a2,36e2 <target_gpio_port_init+0x24>
    36c4:	ce99                	beqz	a3,36e2 <target_gpio_port_init+0x24>
    36c6:	cf11                	beqz	a4,36e2 <target_gpio_port_init+0x24>
    }

    if (sg_gpio_config[0].port == port) {
    36c8:	ed09                	bnez	a0,36e2 <target_gpio_port_init+0x24>
        if (base != NULL) {
            *base = sg_gpio_config[0].base;
    36ca:	600187b7          	lui	a5,0x60018
    36ce:	c19c                	sw	a5,0(a1)
        }

        if (irq != NULL) {
            *irq = sg_gpio_config[0].irq;
    36d0:	47c1                	li	a5,16
    36d2:	c21c                	sw	a5,0(a2)
        }

        if (pin_num != NULL) {
            *pin_num = sg_gpio_config[0].pin_num;
    36d4:	47fd                	li	a5,31
    36d6:	c31c                	sw	a5,0(a4)
        }

        if (handler != NULL) {
            *handler = (void *)GPIO0_IRQHandler;
    36d8:	6791                	lui	a5,0x4
    36da:	c7478793          	addi	a5,a5,-908 # 3c74 <GPIO0_IRQHandler>
    36de:	c29c                	sw	a5,0(a3)
        }

        return 0;
    36e0:	4781                	li	a5,0
    }

    return -1;
}
    36e2:	853e                	mv	a0,a5
    36e4:	8082                	ret

000036e6 <target_gpio_pin_init>:

int32_t target_gpio_pin_init(int32_t gpio_pin, uint32_t *port_idx)
{
    *port_idx = 0;
    36e6:	0005a023          	sw	zero,0(a1)

    if (gpio_pin >= PA0 && gpio_pin <= PA31) {
    36ea:	47fd                	li	a5,31
    36ec:	00a7f363          	bgeu	a5,a0,36f2 <target_gpio_pin_init+0xc>
        return gpio_pin;
    }

    return -1;
    36f0:	557d                	li	a0,-1
}
    36f2:	8082                	ret

000036f4 <target_usi_init>:
    {WJ_USI2_BASE, USI2_IRQn, USI2_IRQHandler},
};

int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_USI_NUM) {
    36f4:	4789                	li	a5,2
    36f6:	02a7c763          	blt	a5,a0,3724 <target_usi_init+0x30>
        return -1;
    }

    if (base != NULL) {
    36fa:	c991                	beqz	a1,370e <target_usi_init+0x1a>
        *base = sg_usi_config[idx].base;
    36fc:	47b1                	li	a5,12
    36fe:	02f50733          	mul	a4,a0,a5
    3702:	679d                	lui	a5,0x7
    3704:	7b878793          	addi	a5,a5,1976 # 77b8 <sg_usi_config>
    3708:	97ba                	add	a5,a5,a4
    370a:	439c                	lw	a5,0(a5)
    370c:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    370e:	ce01                	beqz	a2,3726 <target_usi_init+0x32>
        *irq = sg_usi_config[idx].irq;
    3710:	47b1                	li	a5,12
    3712:	02f50733          	mul	a4,a0,a5
    3716:	679d                	lui	a5,0x7
    3718:	7b878793          	addi	a5,a5,1976 # 77b8 <sg_usi_config>
    371c:	97ba                	add	a5,a5,a4
    371e:	43dc                	lw	a5,4(a5)
    3720:	c21c                	sw	a5,0(a2)
    3722:	8082                	ret
        return -1;
    3724:	557d                	li	a0,-1
    }

    return idx;
}
    3726:	8082                	ret

00003728 <target_usi_usart_init>:

int32_t target_usi_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_SPI_NUM) {
    3728:	4789                	li	a5,2
    372a:	04a7c163          	blt	a5,a0,376c <target_usi_usart_init+0x44>
        return -1;
    }

    if (base != NULL) {
    372e:	c991                	beqz	a1,3742 <target_usi_usart_init+0x1a>
        *base = sg_usi_config[idx].base;
    3730:	47b1                	li	a5,12
    3732:	02f50733          	mul	a4,a0,a5
    3736:	679d                	lui	a5,0x7
    3738:	7b878793          	addi	a5,a5,1976 # 77b8 <sg_usi_config>
    373c:	97ba                	add	a5,a5,a4
    373e:	439c                	lw	a5,0(a5)
    3740:	c19c                	sw	a5,0(a1)
    }

    if (irq != NULL) {
    3742:	ca11                	beqz	a2,3756 <target_usi_usart_init+0x2e>
        *irq = sg_usi_config[idx].irq;
    3744:	47b1                	li	a5,12
    3746:	02f50733          	mul	a4,a0,a5
    374a:	679d                	lui	a5,0x7
    374c:	7b878793          	addi	a5,a5,1976 # 77b8 <sg_usi_config>
    3750:	97ba                	add	a5,a5,a4
    3752:	43dc                	lw	a5,4(a5)
    3754:	c21c                	sw	a5,0(a2)
    }

    if (handler != NULL) {
    3756:	ce81                	beqz	a3,376e <target_usi_usart_init+0x46>
        *handler = sg_usi_config[idx].handler;
    3758:	47b1                	li	a5,12
    375a:	02f50733          	mul	a4,a0,a5
    375e:	679d                	lui	a5,0x7
    3760:	7b878793          	addi	a5,a5,1976 # 77b8 <sg_usi_config>
    3764:	97ba                	add	a5,a5,a4
    3766:	479c                	lw	a5,8(a5)
    3768:	c29c                	sw	a5,0(a3)
    376a:	8082                	ret
        return -1;
    376c:	557d                	li	a0,-1
    }

    return idx;
}
    376e:	8082                	ret

00003770 <gpio_set_direction>:
    void *port,
    gpio_direction_e direction
)
{
    wj_oip_gpio_priv_t *gpio_priv = port;
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3770:	4118                	lw	a4,0(a0)

    if (direction == GPIO_DIRECTION_INPUT) {
    3772:	e989                	bnez	a1,3784 <gpio_set_direction+0x14>
        gpio_reg->SWPORT_DDR &= (~gpio_priv->mask);
    3774:	495c                	lw	a5,20(a0)
    3776:	4354                	lw	a3,4(a4)
    3778:	fff7c793          	not	a5,a5
    377c:	8ff5                	and	a5,a5,a3
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    377e:	c35c                	sw	a5,4(a4)
    } else {
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    }

    return 0;
    3780:	4501                	li	a0,0
    3782:	8082                	ret
    } else if (direction == GPIO_DIRECTION_OUTPUT) {
    3784:	4785                	li	a5,1
    3786:	00f59663          	bne	a1,a5,3792 <gpio_set_direction+0x22>
        gpio_reg->SWPORT_DDR |= gpio_priv->mask;
    378a:	435c                	lw	a5,4(a4)
    378c:	4954                	lw	a3,20(a0)
    378e:	8fd5                	or	a5,a5,a3
    3790:	b7fd                	j	377e <gpio_set_direction+0xe>
        return ERR_GPIO(GPIO_ERROR_DIRECTION);
    3792:	81010537          	lui	a0,0x81010
    3796:	08750513          	addi	a0,a0,135 # 81010087 <__heap_end+0x60fe0087>
}
    379a:	8082                	ret

0000379c <wj_oip_gpio_irqhandler>:
    gpio_control_reg->INTEN = val;
}

void wj_oip_gpio_irqhandler(int idx)
{
    if (idx >= CONFIG_GPIO_NUM) {
    379c:	06a04e63          	bgtz	a0,3818 <wj_oip_gpio_irqhandler+0x7c>
        return;
    }

    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    37a0:	46f1                	li	a3,28
    37a2:	02d50533          	mul	a0,a0,a3
    37a6:	20002737          	lui	a4,0x20002
    37aa:	99870793          	addi	a5,a4,-1640 # 20001998 <gpio_handle>
{
    37ae:	1141                	addi	sp,sp,-16
    37b0:	c422                	sw	s0,8(sp)
    37b2:	20002437          	lui	s0,0x20002
    37b6:	c226                	sw	s1,4(sp)
    37b8:	c606                	sw	ra,12(sp)
    37ba:	9b440413          	addi	s0,s0,-1612 # 200019b4 <gpio_pin_handle>

    uint32_t value = gpio_control_reg->INTSTATUS;
    37be:	4481                	li	s1,0
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_handle[idx].base + 0x30);
    37c0:	953e                	add	a0,a0,a5
    37c2:	411c                	lw	a5,0(a0)
    uint32_t value = gpio_control_reg->INTSTATUS;
    37c4:	99870713          	addi	a4,a4,-1640
    37c8:	43b0                	lw	a2,64(a5)
    uint8_t i;

    /* find the interrput pin */
    for (i = 0; i < 32; i++) {
        if (value & (1U << i)) {
    37ca:	4685                	li	a3,1
    37cc:	009696b3          	sll	a3,a3,s1
    37d0:	00c6f7b3          	and	a5,a3,a2
    37d4:	c79d                	beqz	a5,3802 <wj_oip_gpio_irqhandler+0x66>
                for (j = 0; j < idx; j++) {
                    pin_idx += gpio_handle[j].pin_num;
                }
            }

            if (pin_idx >= CONFIG_GPIO_PIN_NUM) {
    37d6:	47fd                	li	a5,31
    37d8:	02f48b63          	beq	s1,a5,380e <wj_oip_gpio_irqhandler+0x72>
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    37dc:	00044783          	lbu	a5,0(s0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(port_handle->base + 0x30);
    37e0:	45f1                	li	a1,28
    37e2:	02b787b3          	mul	a5,a5,a1
    37e6:	97ba                	add	a5,a5,a4
    37e8:	439c                	lw	a5,0(a5)
    gpio_control_reg->PORTA_EOI = idx;
    37ea:	c7f4                	sw	a3,76(a5)
            wj_oip_gpio_pin_priv_t *gpio_pin_priv = (wj_oip_gpio_pin_priv_t *)&gpio_pin_handle[pin_idx];

            gpio_irq_clear(gpio_pin_priv, (1 << i));  //clear the gpio interrupt

            /* execute the callback function */
            if ((gpio_event_cb_t)(gpio_pin_priv->cb)) {
    37ec:	405c                	lw	a5,4(s0)
    37ee:	cb91                	beqz	a5,3802 <wj_oip_gpio_irqhandler+0x66>
                ((gpio_event_cb_t)(gpio_pin_priv->cb))(gpio_pin_priv->offset);
    37f0:	00244503          	lbu	a0,2(s0)
    37f4:	c032                	sw	a2,0(sp)
    37f6:	9782                	jalr	a5
    37f8:	4602                	lw	a2,0(sp)
    37fa:	200027b7          	lui	a5,0x20002
    37fe:	99878713          	addi	a4,a5,-1640 # 20001998 <gpio_handle>
    3802:	0485                	addi	s1,s1,1
    for (i = 0; i < 32; i++) {
    3804:	02000793          	li	a5,32
    3808:	0421                	addi	s0,s0,8
    380a:	fcf490e3          	bne	s1,a5,37ca <wj_oip_gpio_irqhandler+0x2e>
            }
        }
    }
}
    380e:	40b2                	lw	ra,12(sp)
    3810:	4422                	lw	s0,8(sp)
    3812:	4492                	lw	s1,4(sp)
    3814:	0141                	addi	sp,sp,16
    3816:	8082                	ret
    3818:	8082                	ret

0000381a <csi_gpio_port_initialize>:
                3.get gpio_port_handle
  \param[in]   port      port_name.
  \return      gpio_port_handle
*/
gpio_port_handle_t csi_gpio_port_initialize(int32_t port)
{
    381a:	1111                	addi	sp,sp,-28
    /* obtain the gpio port information */
    uint32_t base = 0u;
    uint32_t pin_num;
    uint32_t irq;
    void *handler;
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    381c:	0058                	addi	a4,sp,4
    381e:	0074                	addi	a3,sp,12
    3820:	0030                	addi	a2,sp,8
    3822:	858a                	mv	a1,sp
{
    3824:	cc06                	sw	ra,24(sp)
    3826:	ca22                	sw	s0,20(sp)
    3828:	c826                	sw	s1,16(sp)
    uint32_t base = 0u;
    382a:	c002                	sw	zero,0(sp)
    int32_t idx = target_gpio_port_init(port, &base, &irq, &handler, &pin_num);
    382c:	3d49                	jal	36be <target_gpio_port_init>

    if (idx < 0 || idx >= CONFIG_GPIO_NUM) {
    382e:	e905                	bnez	a0,385e <csi_gpio_port_initialize+0x44>
        return NULL;
    }

    gpio_priv = &gpio_handle[idx];

    gpio_priv->base = base;
    3830:	4782                	lw	a5,0(sp)
    3832:	20002437          	lui	s0,0x20002
    3836:	99840493          	addi	s1,s0,-1640 # 20001998 <gpio_handle>
    gpio_priv->irq  = irq;
    383a:	4522                	lw	a0,8(sp)
    gpio_priv->base = base;
    383c:	c09c                	sw	a5,0(s1)

#ifdef CONFIG_LPM
    csi_gpio_power_control(gpio_priv, DRV_POWER_FULL);
#endif

    drv_irq_register(gpio_priv->irq, handler);
    383e:	45b2                	lw	a1,12(sp)
    gpio_priv->pin_num  = pin_num;
    3840:	4792                	lw	a5,4(sp)
    gpio_priv->irq  = irq;
    3842:	c0c8                	sw	a0,4(s1)
    gpio_priv->pin_num  = pin_num;
    3844:	c49c                	sw	a5,8(s1)
    drv_irq_register(gpio_priv->irq, handler);
    3846:	c36ff0ef          	jal	ra,2c7c <drv_irq_register>
    drv_irq_enable(gpio_priv->irq);
    384a:	40c8                	lw	a0,4(s1)
    384c:	c18ff0ef          	jal	ra,2c64 <drv_irq_enable>

    return (gpio_port_handle_t)gpio_priv;
    3850:	99840513          	addi	a0,s0,-1640
}
    3854:	40e2                	lw	ra,24(sp)
    3856:	4452                	lw	s0,20(sp)
    3858:	44c2                	lw	s1,16(sp)
    385a:	0171                	addi	sp,sp,28
    385c:	8082                	ret
        return NULL;
    385e:	4501                	li	a0,0
    3860:	bfd5                	j	3854 <csi_gpio_port_initialize+0x3a>

00003862 <csi_gpio_pin_initialize>:
  \return      gpio_pin_handle
*/
gpio_pin_handle_t csi_gpio_pin_initialize(int32_t gpio_pin, gpio_event_cb_t cb_event)
{

    if (gpio_pin < 0 || gpio_pin >= CONFIG_GPIO_PIN_NUM) {
    3862:	47f9                	li	a5,30
    3864:	00a7f563          	bgeu	a5,a0,386e <csi_gpio_pin_initialize+0xc>
        return NULL;
    3868:	4781                	li	a5,0
    gpio_pin_priv->idx = pin_idx;
    gpio_pin_priv->cb = cb_event;
    gpio_pin_priv->offset = gpio_pin;

    return (gpio_pin_handle_t)gpio_pin_priv;
}
    386a:	853e                	mv	a0,a5
    386c:	8082                	ret
{
    386e:	1141                	addi	sp,sp,-16
    3870:	c422                	sw	s0,8(sp)
    3872:	842a                	mv	s0,a0
        csi_gpio_port_initialize(i);
    3874:	4501                	li	a0,0
{
    3876:	c606                	sw	ra,12(sp)
    3878:	c226                	sw	s1,4(sp)
    387a:	84ae                	mv	s1,a1
        csi_gpio_port_initialize(i);
    387c:	3f79                	jal	381a <csi_gpio_port_initialize>
    int32_t pin_idx = target_gpio_pin_init(gpio_pin, &port_idx);
    387e:	858a                	mv	a1,sp
    3880:	8522                	mv	a0,s0
    3882:	3595                	jal	36e6 <target_gpio_pin_init>
        return NULL;
    3884:	4781                	li	a5,0
    if (pin_idx < 0) {
    3886:	02054863          	bltz	a0,38b6 <csi_gpio_pin_initialize+0x54>
    for (i = 0; i < port_idx; i++) {
    388a:	4682                	lw	a3,0(sp)
    388c:	87aa                	mv	a5,a0
    388e:	c691                	beqz	a3,389a <csi_gpio_pin_initialize+0x38>
        idx += (gpio_handle[i].pin_num);
    3890:	200027b7          	lui	a5,0x20002
    3894:	9a07a783          	lw	a5,-1632(a5) # 200019a0 <gpio_handle+0x8>
    3898:	97aa                	add	a5,a5,a0
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = &(gpio_pin_handle[idx]);
    389a:	00379713          	slli	a4,a5,0x3
    389e:	200027b7          	lui	a5,0x20002
    38a2:	9b478793          	addi	a5,a5,-1612 # 200019b4 <gpio_pin_handle>
    38a6:	97ba                	add	a5,a5,a4
    gpio_pin_priv->portidx = port_idx;
    38a8:	00d78023          	sb	a3,0(a5)
    gpio_pin_priv->idx = pin_idx;
    38ac:	00a780a3          	sb	a0,1(a5)
    gpio_pin_priv->cb = cb_event;
    38b0:	c3c4                	sw	s1,4(a5)
    gpio_pin_priv->offset = gpio_pin;
    38b2:	00878123          	sb	s0,2(a5)
}
    38b6:	40b2                	lw	ra,12(sp)
    38b8:	4422                	lw	s0,8(sp)
    38ba:	4492                	lw	s1,4(sp)
    38bc:	853e                	mv	a0,a5
    38be:	0141                	addi	sp,sp,16
    38c0:	8082                	ret

000038c2 <csi_gpio_pin_config_mode>:
  \param[in]   mode      \ref gpio_mode_e
  \return      error code
*/
int32_t csi_gpio_pin_config_mode(gpio_pin_handle_t handle,
                                 gpio_mode_e mode)
{
    38c2:	862e                	mv	a2,a1
    GPIO_NULL_PARAM_CHK(handle);
    38c4:	c511                	beqz	a0,38d0 <csi_gpio_pin_config_mode+0xe>
    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    uint8_t offset = gpio_pin_priv->idx;

    int32_t ret = drv_pin_config_mode(gpio_pin_priv->portidx, offset, mode);
    38c6:	00154583          	lbu	a1,1(a0)
    38ca:	00054503          	lbu	a0,0(a0)
    38ce:	a119                	j	3cd4 <drv_pin_config_mode>

    return ret;
}
    38d0:	81010537          	lui	a0,0x81010
    38d4:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    38d8:	8082                	ret

000038da <csi_gpio_pin_config_direction>:
  \return      error code
*/
int32_t csi_gpio_pin_config_direction(gpio_pin_handle_t handle,
                                      gpio_direction_e dir)
{
    GPIO_NULL_PARAM_CHK(handle);
    38da:	c505                	beqz	a0,3902 <csi_gpio_pin_config_direction+0x28>

    /* config the gpio pin mode direction mask bits */
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *gpio_priv = &gpio_handle[gpio_pin_priv->portidx];
    38dc:	00054783          	lbu	a5,0(a0)

    gpio_priv->dir = dir;
    38e0:	4771                	li	a4,28
    38e2:	02e78733          	mul	a4,a5,a4
    38e6:	200027b7          	lui	a5,0x20002
    38ea:	99878793          	addi	a5,a5,-1640 # 20001998 <gpio_handle>
    38ee:	97ba                	add	a5,a5,a4
    38f0:	cb8c                	sw	a1,16(a5)
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    38f2:	00154683          	lbu	a3,1(a0)
    38f6:	4705                	li	a4,1

    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    38f8:	853e                	mv	a0,a5
    gpio_priv->mask = 1 << gpio_pin_priv->idx;
    38fa:	00d71733          	sll	a4,a4,a3
    38fe:	cbd8                	sw	a4,20(a5)
    uint32_t ret = gpio_set_direction(gpio_priv, dir);
    3900:	bd85                	j	3770 <gpio_set_direction>
    if (ret) {
        return ret;
    }

    return 0;
}
    3902:	81010537          	lui	a0,0x81010
    3906:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    390a:	8082                	ret

0000390c <csi_gpio_pin_write>:
  \param[in]   value     the value to be set
  \return      error code
*/
int32_t csi_gpio_pin_write(gpio_pin_handle_t handle, bool value)
{
    GPIO_NULL_PARAM_CHK(handle);
    390c:	cd05                	beqz	a0,3944 <csi_gpio_pin_write+0x38>

    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    390e:	00054703          	lbu	a4,0(a0)

    uint8_t offset = gpio_pin_priv->idx;
    uint32_t port_value = value << offset;

    port_handle->value = port_value;
    3912:	46f1                	li	a3,28
    uint32_t port_value = value << offset;
    3914:	00154603          	lbu	a2,1(a0)
    port_handle->value = port_value;
    3918:	02d706b3          	mul	a3,a4,a3
    391c:	20002737          	lui	a4,0x20002
    3920:	99870713          	addi	a4,a4,-1640 # 20001998 <gpio_handle>
    uint32_t port_value = value << offset;
    3924:	00c595b3          	sll	a1,a1,a2
    gpio_write(port_handle, (1 << offset));
    3928:	4785                	li	a5,1
    392a:	00c797b3          	sll	a5,a5,a2
    value &= ~(mask);
    392e:	fff7c793          	not	a5,a5

    return 0;
    3932:	4501                	li	a0,0
    port_handle->value = port_value;
    3934:	9736                	add	a4,a4,a3
    3936:	cf0c                	sw	a1,24(a4)
    wj_oip_gpio_reg_t *gpio_reg = (wj_oip_gpio_reg_t *)(gpio_priv->base);
    3938:	4318                	lw	a4,0(a4)
    uint32_t value = gpio_reg->SWPORT_DR;
    393a:	4314                	lw	a3,0(a4)
    value &= ~(mask);
    393c:	8ff5                	and	a5,a5,a3
    value |= gpio_priv->value;
    393e:	8ddd                	or	a1,a1,a5
    gpio_reg->SWPORT_DR = value;
    3940:	c30c                	sw	a1,0(a4)
    return 0;
    3942:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3944:	81010537          	lui	a0,0x81010
    3948:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>

}
    394c:	8082                	ret

0000394e <csi_gpio_pin_read>:
  \param[out]  value     buf to store the pin value
  \return      error code
*/
int32_t csi_gpio_pin_read(gpio_pin_handle_t handle, bool *value)
{
    GPIO_NULL_PARAM_CHK(handle);
    394e:	cd05                	beqz	a0,3986 <csi_gpio_pin_read+0x38>
    GPIO_NULL_PARAM_CHK(value);
    3950:	c99d                	beqz	a1,3986 <csi_gpio_pin_read+0x38>
    wj_oip_gpio_pin_priv_t *gpio_pin_priv = handle;
    uint32_t port_value;
    uint8_t offset = gpio_pin_priv->idx;

    /* convert portidx to port handle */
    wj_oip_gpio_priv_t *port_handle = &gpio_handle[gpio_pin_priv->portidx];
    3952:	00054783          	lbu	a5,0(a0)
    wj_oip_gpio_control_reg_t *gpio_control_reg = (wj_oip_gpio_control_reg_t *)(gpio_priv->base + 0x30);
    3956:	4771                	li	a4,28
    3958:	02e78733          	mul	a4,a5,a4
    395c:	200027b7          	lui	a5,0x20002
    3960:	99878793          	addi	a5,a5,-1640 # 20001998 <gpio_handle>
    3964:	97ba                	add	a5,a5,a4
    3966:	439c                	lw	a5,0(a5)

    gpio_read(port_handle, &port_value);
    *value = (port_value & (1 << offset)) >> offset;
    3968:	00154703          	lbu	a4,1(a0)

    return 0;
    396c:	4501                	li	a0,0
    *value = gpio_control_reg->EXT_PORTA;
    396e:	4bb4                	lw	a3,80(a5)
    *value = (port_value & (1 << offset)) >> offset;
    3970:	4785                	li	a5,1
    3972:	00e797b3          	sll	a5,a5,a4
    3976:	8ff5                	and	a5,a5,a3
    3978:	00e7d7b3          	srl	a5,a5,a4
    397c:	00f037b3          	snez	a5,a5
    3980:	00f58023          	sb	a5,0(a1)
    return 0;
    3984:	8082                	ret
    GPIO_NULL_PARAM_CHK(handle);
    3986:	81010537          	lui	a0,0x81010
    398a:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
}
    398e:	8082                	ret

00003990 <csi_gpio_pin_set_irq>:
  \param[in]   enable    the enable flag
  \return      error code
*/
int32_t csi_gpio_pin_set_irq(gpio_pin_handle_t handle, gpio_irq_mode_e mode, bool enable)
{
    GPIO_NULL_PARAM_CHK(handle);
    3990:	c559                	beqz	a0,3a1e <csi_gpio_pin_set_irq+0x8e>

    uint32_t ret = 0;

    if (enable) {
    3992:	00054783          	lbu	a5,0(a0)
    3996:	4771                	li	a4,28
    3998:	02e78733          	mul	a4,a5,a4
    399c:	200027b7          	lui	a5,0x20002
    39a0:	99878793          	addi	a5,a5,-1640 # 20001998 <gpio_handle>
    39a4:	97ba                	add	a5,a5,a4
    39a6:	4394                	lw	a3,0(a5)
    39a8:	00154703          	lbu	a4,1(a0)
    39ac:	4505                	li	a0,1
    39ae:	03068793          	addi	a5,a3,48
    39b2:	00e51733          	sll	a4,a0,a4
    39b6:	ce39                	beqz	a2,3a14 <csi_gpio_pin_set_irq+0x84>
    switch (irq_mode) {
    39b8:	4611                	li	a2,4
    39ba:	00b66963          	bltu	a2,a1,39cc <csi_gpio_pin_set_irq+0x3c>
    39be:	661d                	lui	a2,0x7
    39c0:	7dc60613          	addi	a2,a2,2012 # 77dc <sg_usi_config+0x24>
    39c4:	058a                	slli	a1,a1,0x2
    39c6:	95b2                	add	a1,a1,a2
    39c8:	4190                	lw	a2,0(a1)
    39ca:	8602                	jr	a2
            return ERR_GPIO(GPIO_ERROR_IRQ_MODE);
    39cc:	81010537          	lui	a0,0x81010
    39d0:	08850513          	addi	a0,a0,136 # 81010088 <__heap_end+0x60fe0088>
    39d4:	8082                	ret
            gpio_control_reg->INTTYPE_LEVEL |= mask;
    39d6:	4790                	lw	a2,8(a5)
    39d8:	8e59                	or	a2,a2,a4
            gpio_control_reg->INTTYPE_LEVEL &= (~mask);
    39da:	c790                	sw	a2,8(a5)
            gpio_control_reg->INT_POLARITY |= mask;
    39dc:	47d0                	lw	a2,12(a5)
    39de:	8e59                	or	a2,a2,a4
    39e0:	a801                	j	39f0 <csi_gpio_pin_set_irq+0x60>
            gpio_control_reg->INTTYPE_LEVEL |= mask;
    39e2:	4790                	lw	a2,8(a5)
    39e4:	8e59                	or	a2,a2,a4
    39e6:	c790                	sw	a2,8(a5)
            gpio_control_reg->INT_POLARITY &= (~mask);
    39e8:	47cc                	lw	a1,12(a5)
    39ea:	fff74613          	not	a2,a4
            gpio_control_reg->INT_POLARITY &= (~mask);
    39ee:	8e6d                	and	a2,a2,a1
            gpio_control_reg->INT_POLARITY |= mask;
    39f0:	c7d0                	sw	a2,12(a5)
    uint32_t val = gpio_control_reg->INTEN;
    39f2:	5a9c                	lw	a5,48(a3)
    val |= (1 << offset);
    39f4:	8f5d                	or	a4,a4,a5
    gpio_control_reg->INTEN = val;
    39f6:	da98                	sw	a4,48(a3)
    } else {
        gpio_irq_disable(handle);

    }

    return ret;
    39f8:	4501                	li	a0,0
    39fa:	8082                	ret
            gpio_control_reg->INTTYPE_LEVEL &= (~mask);
    39fc:	478c                	lw	a1,8(a5)
    39fe:	fff74613          	not	a2,a4
    3a02:	8df1                	and	a1,a1,a2
    3a04:	c78c                	sw	a1,8(a5)
            gpio_control_reg->INT_POLARITY &= (~mask);
    3a06:	47cc                	lw	a1,12(a5)
    3a08:	b7dd                	j	39ee <csi_gpio_pin_set_irq+0x5e>
            gpio_control_reg->INTTYPE_LEVEL &= (~mask);
    3a0a:	478c                	lw	a1,8(a5)
    3a0c:	fff74613          	not	a2,a4
    3a10:	8e6d                	and	a2,a2,a1
    3a12:	b7e1                	j	39da <csi_gpio_pin_set_irq+0x4a>
    uint32_t val = gpio_control_reg->INTEN;
    3a14:	5a9c                	lw	a5,48(a3)
    val &= ~(1 << offset);
    3a16:	fff74713          	not	a4,a4
    3a1a:	8f7d                	and	a4,a4,a5
    3a1c:	bfe9                	j	39f6 <csi_gpio_pin_set_irq+0x66>
    GPIO_NULL_PARAM_CHK(handle);
    3a1e:	81010537          	lui	a0,0x81010
    3a22:	08450513          	addi	a0,a0,132 # 81010084 <__heap_end+0x60fe0084>
    3a26:	8082                	ret
            return ERR_GPIO(DRV_ERROR_UNSUPPORTED);
    3a28:	81010537          	lui	a0,0x81010
    3a2c:	08350513          	addi	a0,a0,131 # 81010083 <__heap_end+0x60fe0083>

}
    3a30:	8082                	ret

00003a32 <wj_oip_timer_irqhandler>:
}

void wj_oip_timer_irqhandler(int idx)
{
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->timeout_flag = 1;
    3a32:	47e1                	li	a5,24
    3a34:	02f50733          	mul	a4,a0,a5
    3a38:	200027b7          	lui	a5,0x20002
    3a3c:	aac78793          	addi	a5,a5,-1364 # 20001aac <timer_instance>
    3a40:	97ba                	add	a5,a5,a4
    3a42:	4705                	li	a4,1
    3a44:	cbd8                	sw	a4,20(a5)

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3a46:	43d8                	lw	a4,4(a5)

    addr->TxEOI;

    if (timer_priv->cb_event) {
    3a48:	00c7a303          	lw	t1,12(a5)
    addr->TxEOI;
    3a4c:	4758                	lw	a4,12(a4)
    if (timer_priv->cb_event) {
    3a4e:	00030463          	beqz	t1,3a56 <wj_oip_timer_irqhandler+0x24>
        return timer_priv->cb_event(idx, TIMER_EVENT_TIMEOUT);
    3a52:	4581                	li	a1,0
    3a54:	8302                	jr	t1
    }

}
    3a56:	8082                	ret

00003a58 <csi_timer_initialize>:
  \param[in]   idx  instance timer index
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    3a58:	1111                	addi	sp,sp,-28
    3a5a:	cc06                	sw	ra,24(sp)
    3a5c:	ca22                	sw	s0,20(sp)
    3a5e:	c826                	sw	s1,16(sp)
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    3a60:	47bd                	li	a5,15
    3a62:	00a7f963          	bgeu	a5,a0,3a74 <csi_timer_initialize+0x1c>
        return NULL;
    3a66:	4401                	li	s0,0
        drv_irq_register(timer_priv->irq, handler);
        drv_irq_enable(timer_priv->irq);
    }

    return (timer_handle_t)timer_priv;
}
    3a68:	8522                	mv	a0,s0
    3a6a:	40e2                	lw	ra,24(sp)
    3a6c:	4452                	lw	s0,20(sp)
    3a6e:	44c2                	lw	s1,16(sp)
    3a70:	0171                	addi	sp,sp,28
    3a72:	8082                	ret
    3a74:	84ae                	mv	s1,a1
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    3a76:	0074                	addi	a3,sp,12
    3a78:	0030                	addi	a2,sp,8
    3a7a:	004c                	addi	a1,sp,4
    3a7c:	c02a                	sw	a0,0(sp)
    uint32_t base = 0u;
    3a7e:	c202                	sw	zero,4(sp)
    uint32_t irq = 0u;
    3a80:	c402                	sw	zero,8(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq, &handler);
    3a82:	3ed5                	jal	3676 <target_get_timer>
    if (real_idx != idx) {
    3a84:	4702                	lw	a4,0(sp)
    3a86:	fea710e3          	bne	a4,a0,3a66 <csi_timer_initialize+0xe>
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    3a8a:	4461                	li	s0,24
    3a8c:	028707b3          	mul	a5,a4,s0
    3a90:	20002437          	lui	s0,0x20002
    3a94:	aac40413          	addi	s0,s0,-1364 # 20001aac <timer_instance>
    timer_priv->irq  = irq;
    3a98:	46a2                	lw	a3,8(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3a9a:	4501                	li	a0,0
    wj_oip_timer_priv_t *timer_priv = &timer_instance[idx];
    3a9c:	943e                	add	s0,s0,a5
    timer_priv->base = base;
    3a9e:	4792                	lw	a5,4(sp)
    timer_priv->irq  = irq;
    3aa0:	c414                	sw	a3,8(s0)
    timer_priv->idx = idx;
    3aa2:	00e40023          	sb	a4,0(s0)
    timer_priv->base = base;
    3aa6:	c05c                	sw	a5,4(s0)
    3aa8:	c03e                	sw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3aaa:	2c2d                	jal	3ce4 <drv_get_timer_freq>
    3aac:	577d                	li	a4,-1
    3aae:	02a75533          	divu	a0,a4,a0
    3ab2:	000f4737          	lui	a4,0xf4
    3ab6:	24070713          	addi	a4,a4,576 # f4240 <__ctor_end__+0xeb9b0>
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3aba:	4782                	lw	a5,0(sp)
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3abc:	02e50533          	mul	a0,a0,a4
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3ac0:	4798                	lw	a4,8(a5)
    3ac2:	01e77693          	andi	a3,a4,30
    3ac6:	0087c703          	lbu	a4,8(a5)
    3aca:	9b01                	andi	a4,a4,-32
    3acc:	8f55                	or	a4,a4,a3
    timer_priv->timeout = WJ_OIP_TIMER_INIT_DEFAULT_VALUE;
    3ace:	c808                	sw	a0,16(s0)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;
    3ad0:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_INTMASK;
    3ad4:	4798                	lw	a4,8(a5)
    3ad6:	8b7d                	andi	a4,a4,31
    3ad8:	00476693          	ori	a3,a4,4
    3adc:	0087c703          	lbu	a4,8(a5)
    3ae0:	9b01                	andi	a4,a4,-32
    3ae2:	8f55                	or	a4,a4,a3
    3ae4:	00e78423          	sb	a4,8(a5)
    timer_priv->cb_event = cb_event;
    3ae8:	c444                	sw	s1,12(s0)
    if (cb_event != NULL) {
    3aea:	dcbd                	beqz	s1,3a68 <csi_timer_initialize+0x10>
        drv_irq_register(timer_priv->irq, handler);
    3aec:	4408                	lw	a0,8(s0)
    3aee:	45b2                	lw	a1,12(sp)
    3af0:	98cff0ef          	jal	ra,2c7c <drv_irq_register>
        drv_irq_enable(timer_priv->irq);
    3af4:	4408                	lw	a0,8(s0)
    3af6:	96eff0ef          	jal	ra,2c64 <drv_irq_enable>
    3afa:	b7bd                	j	3a68 <csi_timer_initialize+0x10>

00003afc <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
    3afc:	c511                	beqz	a0,3b08 <csi_timer_config+0xc>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3afe:	415c                	lw	a5,4(a0)

    switch (mode) {
    3b00:	c989                	beqz	a1,3b12 <csi_timer_config+0x16>
    3b02:	4705                	li	a4,1
    3b04:	02e58c63          	beq	a1,a4,3b3c <csi_timer_config+0x40>
    TIMER_NULL_PARAM_CHK(handle);
    3b08:	81070537          	lui	a0,0x81070
    3b0c:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
    }

    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);

    return 0;
}
    3b10:	8082                	ret
            addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_MODE;
    3b12:	4798                	lw	a4,8(a5)
    3b14:	01d77693          	andi	a3,a4,29
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b18:	0087c703          	lbu	a4,8(a5)
    return 0;
    3b1c:	4501                	li	a0,0
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b1e:	9b01                	andi	a4,a4,-32
    3b20:	8f55                	or	a4,a4,a3
    3b22:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= (WJ_OIP_TIMER_TXCONTROL_TRIGGER);
    3b26:	4798                	lw	a4,8(a5)
    3b28:	8b7d                	andi	a4,a4,31
    3b2a:	01076693          	ori	a3,a4,16
    3b2e:	0087c703          	lbu	a4,8(a5)
    3b32:	9b01                	andi	a4,a4,-32
    3b34:	8f55                	or	a4,a4,a3
    3b36:	00e78423          	sb	a4,8(a5)
    return 0;
    3b3a:	8082                	ret
            addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_MODE;
    3b3c:	4798                	lw	a4,8(a5)
    3b3e:	8b7d                	andi	a4,a4,31
    3b40:	00276693          	ori	a3,a4,2
    3b44:	bfd1                	j	3b18 <csi_timer_config+0x1c>

00003b46 <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b46:	c501                	beqz	a0,3b4e <csi_timer_set_timeout+0x8>

    wj_oip_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
    3b48:	c90c                	sw	a1,16(a0)
    return 0;
    3b4a:	4501                	li	a0,0
    3b4c:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3b4e:	81070537          	lui	a0,0x81070
    3b52:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3b56:	8082                	ret

00003b58 <csi_timer_start>:
  \return      error code
*/

int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    3b58:	c545                	beqz	a0,3c00 <csi_timer_start+0xa8>
{
    3b5a:	1141                	addi	sp,sp,-16
    3b5c:	c606                	sw	ra,12(sp)
    3b5e:	c422                	sw	s0,8(sp)
    3b60:	c226                	sw	s1,4(sp)
    3b62:	842a                	mv	s0,a0

    wj_oip_timer_priv_t *timer_priv = handle;

    timer_priv->timeout_flag = 0;
    3b64:	00052a23          	sw	zero,20(a0)

    uint32_t min_us = drv_get_timer_freq(timer_priv->idx) / 1000000;
    3b68:	00054503          	lbu	a0,0(a0)
    3b6c:	000f44b7          	lui	s1,0xf4
    3b70:	24048493          	addi	s1,s1,576 # f4240 <__ctor_end__+0xeb9b0>
    3b74:	2a85                	jal	3ce4 <drv_get_timer_freq>
    3b76:	029544b3          	div	s1,a0,s1
    uint32_t load;

    if (((timer_priv->timeout * drv_get_timer_freq(timer_priv->idx)) / 1000000) > 0xffffffff) {
    3b7a:	00044503          	lbu	a0,0(s0)
    3b7e:	229d                	jal	3ce4 <drv_get_timer_freq>
        return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    if (min_us) {
    3b80:	481c                	lw	a5,16(s0)
        load = (uint32_t)(timer_priv->timeout * min_us);
    3b82:	02f48533          	mul	a0,s1,a5
    if (min_us) {
    3b86:	e08d                	bnez	s1,3ba8 <csi_timer_start+0x50>
    } else {
        load = (uint32_t)(((uint64_t)(timer_priv->timeout) * drv_get_timer_freq(timer_priv->idx)) / 1000000);
    3b88:	00044503          	lbu	a0,0(s0)
    3b8c:	c03e                	sw	a5,0(sp)
    3b8e:	2a99                	jal	3ce4 <drv_get_timer_freq>
    3b90:	4782                	lw	a5,0(sp)
    3b92:	000f4637          	lui	a2,0xf4
    3b96:	24060613          	addi	a2,a2,576 # f4240 <__ctor_end__+0xeb9b0>
    3b9a:	4681                	li	a3,0
    3b9c:	02f525b3          	mulhsu	a1,a0,a5
    3ba0:	02a78533          	mul	a0,a5,a0
    3ba4:	e50fc0ef          	jal	ra,1f4 <__udivdi3>
    }

    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);

    if (timer_priv->timeout == 0) {
    3ba8:	4818                	lw	a4,16(s0)
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3baa:	405c                	lw	a5,4(s0)
    if (timer_priv->timeout == 0) {
    3bac:	e729                	bnez	a4,3bf6 <csi_timer_start+0x9e>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    3bae:	577d                	li	a4,-1
    3bb0:	c398                	sw	a4,0(a5)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bb2:	4798                	lw	a4,8(a5)
    }

#endif

    return 0;
}
    3bb4:	40b2                	lw	ra,12(sp)
    3bb6:	4422                	lw	s0,8(sp)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bb8:	01e77693          	andi	a3,a4,30
    3bbc:	0087c703          	lbu	a4,8(a5)
}
    3bc0:	4492                	lw	s1,4(sp)
    return 0;
    3bc2:	4501                	li	a0,0
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    3bc4:	9b01                	andi	a4,a4,-32
    3bc6:	8f55                	or	a4,a4,a3
    3bc8:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= WJ_OIP_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    3bcc:	4798                	lw	a4,8(a5)
    3bce:	8b7d                	andi	a4,a4,31
    3bd0:	00176693          	ori	a3,a4,1
    3bd4:	0087c703          	lbu	a4,8(a5)
    3bd8:	9b01                	andi	a4,a4,-32
    3bda:	8f55                	or	a4,a4,a3
    3bdc:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~WJ_OIP_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    3be0:	4798                	lw	a4,8(a5)
    3be2:	01b77693          	andi	a3,a4,27
    3be6:	0087c703          	lbu	a4,8(a5)
    3bea:	9b01                	andi	a4,a4,-32
    3bec:	8f55                	or	a4,a4,a3
    3bee:	00e78423          	sb	a4,8(a5)
}
    3bf2:	0141                	addi	sp,sp,16
    3bf4:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    3bf6:	4798                	lw	a4,8(a5)
    3bf8:	8b75                	andi	a4,a4,29
    3bfa:	db55                	beqz	a4,3bae <csi_timer_start+0x56>
            addr->TxLoadCount = load;                           /* load time(us) */
    3bfc:	c388                	sw	a0,0(a5)
    3bfe:	bf55                	j	3bb2 <csi_timer_start+0x5a>
    TIMER_NULL_PARAM_CHK(handle);
    3c00:	81070537          	lui	a0,0x81070
    3c04:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3c08:	8082                	ret

00003c0a <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    3c0a:	c519                	beqz	a0,3c18 <csi_timer_get_current_value+0xe>
    TIMER_NULL_PARAM_CHK(value);
    3c0c:	c591                	beqz	a1,3c18 <csi_timer_get_current_value+0xe>

    wj_oip_timer_priv_t *timer_priv = handle;
    wj_oip_timer_reg_t *addr = (wj_oip_timer_reg_t *)(timer_priv->base);
    3c0e:	415c                	lw	a5,4(a0)

    *value = addr->TxCurrentValue;
    return 0;
    3c10:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    3c12:	43dc                	lw	a5,4(a5)
    3c14:	c19c                	sw	a5,0(a1)
    return 0;
    3c16:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    3c18:	81070537          	lui	a0,0x81070
    3c1c:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x61040084>
}
    3c20:	8082                	ret

00003c22 <TIM0_IRQHandler>:
}

ATTRIBUTE_ISR void TIM0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(0);
    3c22:	4501                	li	a0,0
    3c24:	b539                	j	3a32 <wj_oip_timer_irqhandler>

00003c26 <TIM1_IRQHandler>:
}

ATTRIBUTE_ISR void TIM1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(1);
    3c26:	4505                	li	a0,1
    3c28:	b529                	j	3a32 <wj_oip_timer_irqhandler>

00003c2a <TIM2_IRQHandler>:
    CSI_INTRPT_EXIT();
}
ATTRIBUTE_ISR void TIM2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(2);
    3c2a:	4509                	li	a0,2
    3c2c:	b519                	j	3a32 <wj_oip_timer_irqhandler>

00003c2e <TIM3_IRQHandler>:
}

ATTRIBUTE_ISR void TIM3_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(3);
    3c2e:	450d                	li	a0,3
    3c30:	b509                	j	3a32 <wj_oip_timer_irqhandler>

00003c32 <TIM4_IRQHandler>:
}

ATTRIBUTE_ISR void TIM4_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(4);
    3c32:	4511                	li	a0,4
    3c34:	bbfd                	j	3a32 <wj_oip_timer_irqhandler>

00003c36 <TIM5_IRQHandler>:
}

ATTRIBUTE_ISR void TIM5_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(5);
    3c36:	4515                	li	a0,5
    3c38:	bbed                	j	3a32 <wj_oip_timer_irqhandler>

00003c3a <TIM6_IRQHandler>:
}

ATTRIBUTE_ISR void TIM6_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(6);
    3c3a:	4519                	li	a0,6
    3c3c:	bbdd                	j	3a32 <wj_oip_timer_irqhandler>

00003c3e <TIM7_IRQHandler>:
}

ATTRIBUTE_ISR void TIM7_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(7);
    3c3e:	451d                	li	a0,7
    3c40:	bbcd                	j	3a32 <wj_oip_timer_irqhandler>

00003c42 <TIM8_IRQHandler>:
}

ATTRIBUTE_ISR void TIM8_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(8);
    3c42:	4521                	li	a0,8
    3c44:	b3fd                	j	3a32 <wj_oip_timer_irqhandler>

00003c46 <TIM9_IRQHandler>:
}

ATTRIBUTE_ISR void TIM9_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(9);
    3c46:	4525                	li	a0,9
    3c48:	b3ed                	j	3a32 <wj_oip_timer_irqhandler>

00003c4a <TIM10_IRQHandler>:
}

ATTRIBUTE_ISR void TIM10_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(10);
    3c4a:	4529                	li	a0,10
    3c4c:	b3dd                	j	3a32 <wj_oip_timer_irqhandler>

00003c4e <TIM11_IRQHandler>:
}

ATTRIBUTE_ISR void TIM11_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(11);
    3c4e:	452d                	li	a0,11
    3c50:	b3cd                	j	3a32 <wj_oip_timer_irqhandler>

00003c52 <TIM12_IRQHandler>:
}

ATTRIBUTE_ISR void TIM12_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(12);
    3c52:	4531                	li	a0,12
    3c54:	bbf9                	j	3a32 <wj_oip_timer_irqhandler>

00003c56 <TIM13_IRQHandler>:
}

ATTRIBUTE_ISR void TIM13_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(13);
    3c56:	4535                	li	a0,13
    3c58:	bbe9                	j	3a32 <wj_oip_timer_irqhandler>

00003c5a <TIM14_IRQHandler>:
}

ATTRIBUTE_ISR void TIM14_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(14);
    3c5a:	4539                	li	a0,14
    3c5c:	bbd9                	j	3a32 <wj_oip_timer_irqhandler>

00003c5e <TIM15_IRQHandler>:
}

ATTRIBUTE_ISR void TIM15_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_timer_irqhandler(15);
    3c5e:	453d                	li	a0,15
    3c60:	bbc9                	j	3a32 <wj_oip_timer_irqhandler>

00003c62 <USI0_IRQHandler>:
}

ATTRIBUTE_ISR void USI0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(0);
    3c62:	4501                	li	a0,0
    3c64:	876ff06f          	j	2cda <wj_usi_irqhandler>

00003c68 <USI1_IRQHandler>:
}

ATTRIBUTE_ISR void USI1_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(1);
    3c68:	4505                	li	a0,1
    3c6a:	870ff06f          	j	2cda <wj_usi_irqhandler>

00003c6e <USI2_IRQHandler>:
}

ATTRIBUTE_ISR void USI2_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_usi_irqhandler(2);
    3c6e:	4509                	li	a0,2
    3c70:	86aff06f          	j	2cda <wj_usi_irqhandler>

00003c74 <GPIO0_IRQHandler>:
}

ATTRIBUTE_ISR void GPIO0_IRQHandler(void)
{
    CSI_INTRPT_ENTER();
    wj_oip_gpio_irqhandler(0);
    3c74:	4501                	li	a0,0
    3c76:	b61d                	j	379c <wj_oip_gpio_irqhandler>

00003c78 <mdelay>:
    }
}

void mdelay(uint32_t ms)
{
    if (ms == 0) {
    3c78:	c939                	beqz	a0,3cce <mdelay+0x56>
{
    3c7a:	1141                	addi	sp,sp,-16
    3c7c:	c422                	sw	s0,8(sp)
    3c7e:	c606                	sw	ra,12(sp)
    3c80:	c226                	sw	s1,4(sp)
    3c82:	fff50413          	addi	s0,a0,-1
        return;
    }

    while (ms--) {
    3c86:	57fd                	li	a5,-1
    3c88:	00f41763          	bne	s0,a5,3c96 <mdelay+0x1e>
        _mdelay();
    }
}
    3c8c:	40b2                	lw	ra,12(sp)
    3c8e:	4422                	lw	s0,8(sp)
    3c90:	4492                	lw	s1,4(sp)
    3c92:	0141                	addi	sp,sp,16
    3c94:	8082                	ret
  \brief   get CORE timer reload value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_load(void)
{
    return CORET->LOAD;
    3c96:	e000e7b7          	lui	a5,0xe000e
    3c9a:	4bc4                	lw	s1,20(a5)
  \brief   get CORE timer counter value
  \return          CORE timer counter value.
 */
__STATIC_INLINE uint32_t csi_coret_get_value(void)
{
    return CORET->VAL;
    3c9c:	4f98                	lw	a4,24(a5)
    3c9e:	c03a                	sw	a4,0(sp)
    uint32_t cnt = (drv_get_sys_freq() / 1000);
    3ca0:	283d                	jal	3cde <drv_get_sys_freq>
    3ca2:	3e800793          	li	a5,1000
    3ca6:	02f54533          	div	a0,a0,a5
            if (load - cur + start > cnt) {
    3caa:	4702                	lw	a4,0(sp)
    3cac:	e000e6b7          	lui	a3,0xe000e
    3cb0:	94ba                	add	s1,s1,a4
    3cb2:	4e9c                	lw	a5,24(a3)
        if (start > cur) {
    3cb4:	00e7f863          	bgeu	a5,a4,3cc4 <mdelay+0x4c>
            if (start - cur >= cnt) {
    3cb8:	40f707b3          	sub	a5,a4,a5
    3cbc:	fea7ebe3          	bltu	a5,a0,3cb2 <mdelay+0x3a>
    3cc0:	147d                	addi	s0,s0,-1
    3cc2:	b7d1                	j	3c86 <mdelay+0xe>
            if (load - cur + start > cnt) {
    3cc4:	40f487b3          	sub	a5,s1,a5
    3cc8:	fef575e3          	bgeu	a0,a5,3cb2 <mdelay+0x3a>
    3ccc:	bfd5                	j	3cc0 <mdelay+0x48>
    3cce:	8082                	ret

00003cd0 <drv_pinmux_config>:
#include <drv_gpio.h>

int32_t drv_pinmux_config(pin_name_e pin, pin_func_e pin_func)
{
    return 0;
}
    3cd0:	4501                	li	a0,0
    3cd2:	8082                	ret

00003cd4 <drv_pin_config_mode>:

int32_t drv_pin_config_mode(port_name_e port, uint8_t offset, gpio_mode_e pin_mode)
{
    return 0;
}
    3cd4:	4501                	li	a0,0
    3cd6:	8082                	ret

00003cd8 <drv_get_usi_freq>:
    3cd8:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3cdc:	8082                	ret

00003cde <drv_get_sys_freq>:
}

int32_t drv_get_sys_freq(void)
{
    return g_system_clock;
}
    3cde:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3ce2:	8082                	ret

00003ce4 <drv_get_timer_freq>:
    3ce4:	0041a503          	lw	a0,4(gp) # 200004ec <g_system_clock>
    3ce8:	8082                	ret

00003cea <SystemInit>:
  */
void SystemInit(void)
{
    int i;

    CLIC->CLICCFG = 0x4UL;
    3cea:	e000e7b7          	lui	a5,0xe000e
{
    3cee:	1151                	addi	sp,sp,-12
    CLIC->CLICCFG = 0x4UL;
    3cf0:	10078793          	addi	a5,a5,256 # e000e100 <__heap_end+0xbffde100>
    3cf4:	6705                	lui	a4,0x1
{
    3cf6:	c222                	sw	s0,4(sp)
    CLIC->CLICCFG = 0x4UL;
    3cf8:	973e                	add	a4,a4,a5
    3cfa:	4691                	li	a3,4
{
    3cfc:	c406                	sw	ra,8(sp)
    CLIC->CLICCFG = 0x4UL;
    3cfe:	b0d70023          	sb	a3,-1280(a4) # b00 <__adddf3+0x24e>

    for (i = 0; i < 12; i++) {
        CLIC->INTIP[i] = 0;
    3d02:	e000e437          	lui	s0,0xe000e
    for (i = 0; i < 12; i++) {
    3d06:	4701                	li	a4,0
    3d08:	46b1                	li	a3,12
        CLIC->INTIP[i] = 0;
    3d0a:	00e78633          	add	a2,a5,a4
    3d0e:	00060023          	sb	zero,0(a2)
    for (i = 0; i < 12; i++) {
    3d12:	0705                	addi	a4,a4,1
    3d14:	fed71be3          	bne	a4,a3,3d0a <SystemInit+0x20>
    }

    drv_irq_enable(Machine_Software_IRQn);
    3d18:	450d                	li	a0,3
    3d1a:	f4bfe0ef          	jal	ra,2c64 <drv_irq_enable>
  \details Enables IRQ interrupts by setting the IE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_irq(void)
{
    __ASM volatile("csrs mstatus, 8");
    3d1e:	30046073          	csrsi	mstatus,8
    csi_coret_config(drv_get_sys_freq() / CONFIG_SYSTICK_HZ, CORET_IRQn);    //10ms
    3d22:	3f75                	jal	3cde <drv_get_sys_freq>
    3d24:	06400793          	li	a5,100
    3d28:	02f54533          	div	a0,a0,a5
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
    3d2c:	010007b7          	lui	a5,0x1000
    3d30:	157d                	addi	a0,a0,-1
    3d32:	00f57763          	bgeu	a0,a5,3d40 <SystemInit+0x56>
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
    3d36:	c848                	sw	a0,20(s0)
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    3d38:	00042c23          	sw	zero,24(s0) # e000e018 <__heap_end+0xbffde018>
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
    3d3c:	479d                	li	a5,7
    3d3e:	c81c                	sw	a5,16(s0)
#ifdef CONFIG_KERNEL_NONE
    _system_init_for_baremetal();
#else
    _system_init_for_kernel();
#endif
}
    3d40:	4412                	lw	s0,4(sp)
    3d42:	40a2                	lw	ra,8(sp)
    3d44:	0131                	addi	sp,sp,12
    mm_heap_initialize();
    3d46:	a471                	j	3fd2 <mm_heap_initialize>

00003d48 <trap_c>:
#include <csi_core.h>

void (*trap_c_callback)(void);

void trap_c(uint32_t *regs)
{
    3d48:	1131                	addi	sp,sp,-20
    3d4a:	c622                	sw	s0,12(sp)
    3d4c:	c806                	sw	ra,16(sp)
    3d4e:	c426                	sw	s1,8(sp)
    3d50:	842a                	mv	s0,a0
 */
__ALWAYS_STATIC_INLINE uint32_t __get_MCAUSE(void)
{
    uint32_t result;

    __ASM volatile("csrr %0, mcause" : "=r"(result));
    3d52:	342025f3          	csrr	a1,mcause
    int i;
    uint32_t vec = 0;

    vec = __get_MCAUSE() & 0x3FF;

    printf("CPU Exception: NO.%d", vec);
    3d56:	651d                	lui	a0,0x7
    3d58:	3ff5f593          	andi	a1,a1,1023
    3d5c:	7f050513          	addi	a0,a0,2032 # 77f0 <sg_usi_config+0x38>
    3d60:	337020ef          	jal	ra,6896 <printf>
    printf("\n");
    3d64:	4529                	li	a0,10
    3d66:	447020ef          	jal	ra,69ac <putchar>

    for (i = 0; i < 15; i++) {
    3d6a:	84a2                	mv	s1,s0
    3d6c:	4781                	li	a5,0
        printf("x%d: %08x\t", i + 1, regs[i]);
    3d6e:	4090                	lw	a2,0(s1)
    3d70:	00178713          	addi	a4,a5,1 # 1000001 <__ctor_end__+0xff7771>
    3d74:	c23e                	sw	a5,4(sp)
    3d76:	67a1                	lui	a5,0x8
    3d78:	80878513          	addi	a0,a5,-2040 # 7808 <sg_usi_config+0x50>
    3d7c:	85ba                	mv	a1,a4
    3d7e:	c03a                	sw	a4,0(sp)
    3d80:	317020ef          	jal	ra,6896 <printf>

        if ((i % 4) == 3) {
    3d84:	4792                	lw	a5,4(sp)
    3d86:	468d                	li	a3,3
    3d88:	8b8d                	andi	a5,a5,3
    3d8a:	00d79563          	bne	a5,a3,3d94 <trap_c+0x4c>
            printf("\n");
    3d8e:	4529                	li	a0,10
    3d90:	41d020ef          	jal	ra,69ac <putchar>
    3d94:	4782                	lw	a5,0(sp)
    for (i = 0; i < 15; i++) {
    3d96:	46bd                	li	a3,15
    3d98:	0491                	addi	s1,s1,4
    3d9a:	fcd79ae3          	bne	a5,a3,3d6e <trap_c+0x26>
        }
    }

    printf("\n");
    3d9e:	4529                	li	a0,10
    3da0:	40d020ef          	jal	ra,69ac <putchar>
    printf("mepc   : %08x\n", regs[15]);
    3da4:	5c4c                	lw	a1,60(s0)
    3da6:	6521                	lui	a0,0x8
    3da8:	81450513          	addi	a0,a0,-2028 # 7814 <sg_usi_config+0x5c>
    3dac:	2eb020ef          	jal	ra,6896 <printf>
    printf("mstatus: %08x\n", regs[16]);
    3db0:	402c                	lw	a1,64(s0)
    3db2:	6521                	lui	a0,0x8
    3db4:	82450513          	addi	a0,a0,-2012 # 7824 <sg_usi_config+0x6c>
    3db8:	2df020ef          	jal	ra,6896 <printf>

    if (trap_c_callback) {
    3dbc:	200027b7          	lui	a5,0x20002
    3dc0:	1447a783          	lw	a5,324(a5) # 20002144 <trap_c_callback>
    3dc4:	c391                	beqz	a5,3dc8 <trap_c+0x80>
        trap_c_callback();
    3dc6:	9782                	jalr	a5
    }

    while (1);
    3dc8:	a001                	j	3dc8 <trap_c+0x80>

00003dca <timer_cb_fun>:
static unsigned int Timer_LoopCount;    /* Count unit is 10 seconds */
static uint8_t timer_count_rise = 0;    /*1: timer cont increasing, 0: timer cont diminishing*/

static void timer_cb_fun(int32_t idx, timer_event_e event)
{
    if (TIMER_EVENT_TIMEOUT == event) {
    3dca:	e591                	bnez	a1,3dd6 <timer_cb_fun+0xc>
        Timer_LoopCount++;
    3dcc:	01c18793          	addi	a5,gp,28 # 20000504 <Timer_LoopCount>
    3dd0:	4398                	lw	a4,0(a5)
    3dd2:	0705                	addi	a4,a4,1
    3dd4:	c398                	sw	a4,0(a5)
    }
}
    3dd6:	8082                	ret

00003dd8 <clock_timer_init>:

    return (unsigned long long)(Timer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv - 1;
}

int clock_timer_init(void)
{
    3dd8:	1131                	addi	sp,sp,-20
    if (CLOCK_GETTIME_USE_TIMER_ID > CONFIG_TIMER_NUM) {
        return EPERM;
    }

    uint32_t timer_loadtimer;
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3dda:	6591                	lui	a1,0x4
{
    3ddc:	c622                	sw	s0,12(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3dde:	dca58593          	addi	a1,a1,-566 # 3dca <timer_cb_fun>
    3de2:	4501                	li	a0,0
{
    3de4:	c806                	sw	ra,16(sp)
    3de6:	c426                	sw	s1,8(sp)
    timer_handle = csi_timer_initialize(CLOCK_GETTIME_USE_TIMER_ID, timer_cb_fun);
    3de8:	02418413          	addi	s0,gp,36 # 2000050c <timer_handle>
    3dec:	31b5                	jal	3a58 <csi_timer_initialize>
    3dee:	c008                	sw	a0,0(s0)

    if (timer_handle == NULL) {
    3df0:	e901                	bnez	a0,3e00 <clock_timer_init+0x28>
        return -1;
    3df2:	54fd                	li	s1,-1
    if (cv2 > cv1) {
        timer_count_rise = 1;
    }

    return 0;
}
    3df4:	40c2                	lw	ra,16(sp)
    3df6:	4432                	lw	s0,12(sp)
    3df8:	8526                	mv	a0,s1
    3dfa:	44a2                	lw	s1,8(sp)
    3dfc:	0151                	addi	sp,sp,20
    3dfe:	8082                	ret
    APB_FREQ = drv_get_timer_freq(CLOCK_GETTIME_USE_TIMER_ID);
    3e00:	4501                	li	a0,0
    3e02:	35cd                	jal	3ce4 <drv_get_timer_freq>
    3e04:	00a1aa23          	sw	a0,20(gp) # 200004fc <APB_FREQ>
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e08:	000f47b7          	lui	a5,0xf4
    3e0c:	24078793          	addi	a5,a5,576 # f4240 <__ctor_end__+0xeb9b0>
    3e10:	02f55533          	divu	a0,a0,a5
    3e14:	009894b7          	lui	s1,0x989
    3e18:	68048493          	addi	s1,s1,1664 # 989680 <__ctor_end__+0x980df0>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3e1c:	4585                	li	a1,1
    TIMER_LOADCOUNT = timer_loadtimer * (APB_FREQ / MILLION);
    3e1e:	02950533          	mul	a0,a0,s1
    3e22:	00a1ac23          	sw	a0,24(gp) # 20000500 <TIMER_LOADCOUNT>
    int ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    3e26:	4008                	lw	a0,0(s0)
    3e28:	39d1                	jal	3afc <csi_timer_config>
    if (ret != 0) {
    3e2a:	f561                	bnez	a0,3df2 <clock_timer_init+0x1a>
    ret = csi_timer_set_timeout(timer_handle, timer_loadtimer);
    3e2c:	4008                	lw	a0,0(s0)
    3e2e:	85a6                	mv	a1,s1
    3e30:	3b19                	jal	3b46 <csi_timer_set_timeout>
    3e32:	84aa                	mv	s1,a0
    if (ret != 0) {
    3e34:	fd5d                	bnez	a0,3df2 <clock_timer_init+0x1a>
    csi_timer_get_current_value(timer_handle, &cv1);
    3e36:	4008                	lw	a0,0(s0)
    3e38:	858a                	mv	a1,sp
    3e3a:	3bc1                	jal	3c0a <csi_timer_get_current_value>
    csi_timer_get_current_value(timer_handle, &cv2);
    3e3c:	4008                	lw	a0,0(s0)
    3e3e:	004c                	addi	a1,sp,4
    3e40:	33e9                	jal	3c0a <csi_timer_get_current_value>
    if (cv2 > cv1) {
    3e42:	4712                	lw	a4,4(sp)
    3e44:	4782                	lw	a5,0(sp)
    3e46:	fae7f7e3          	bgeu	a5,a4,3df4 <clock_timer_init+0x1c>
        timer_count_rise = 1;
    3e4a:	4705                	li	a4,1
    3e4c:	02e18023          	sb	a4,32(gp) # 20000508 <timer_count_rise>
    3e50:	b755                	j	3df4 <clock_timer_init+0x1c>

00003e52 <clock_timer_start>:
}

int clock_timer_start(void)
{
    int ret = -1;
    Timer_LoopCount = 0;
    3e52:	0001ae23          	sw	zero,28(gp) # 20000504 <Timer_LoopCount>

    ret = csi_timer_start(timer_handle);
    3e56:	0241a503          	lw	a0,36(gp) # 2000050c <timer_handle>
{
    3e5a:	1151                	addi	sp,sp,-12
    3e5c:	c406                	sw	ra,8(sp)
    ret = csi_timer_start(timer_handle);
    3e5e:	39ed                	jal	3b58 <csi_timer_start>
        (ts_begin.tv_sec * 1000000000 + ts_begin.tv_nsec);
    printf("clock_gettime() timing deviation is +%llu ns\n", error_margin_ns);
#endif

    return 0;
}
    3e60:	40a2                	lw	ra,8(sp)
    if (ret != 0) {
    3e62:	00a03533          	snez	a0,a0
    3e66:	40a00533          	neg	a0,a0
}
    3e6a:	0131                	addi	sp,sp,12
    3e6c:	8082                	ret

00003e6e <_init>:
extern int __ctor_start__;

typedef void (*func_ptr) (void);

CPP_WEAK void _init(void)
{
    3e6e:	1151                	addi	sp,sp,-12
    3e70:	c222                	sw	s0,4(sp)
    3e72:	c026                	sw	s1,0(sp)
    3e74:	6425                	lui	s0,0x9
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3e76:	64a5                	lui	s1,0x9
{
    3e78:	c406                	sw	ra,8(sp)
    3e7a:	89040413          	addi	s0,s0,-1904 # 8890 <__ctor_end__>
    for (p = (func_ptr *)&__ctor_end__ - 1; p >= (func_ptr *)&__ctor_start__; p--) {
    3e7e:	89048493          	addi	s1,s1,-1904 # 8890 <__ctor_end__>
    3e82:	1471                	addi	s0,s0,-4
    3e84:	00947763          	bgeu	s0,s1,3e92 <_init+0x24>
        (*p) ();
    }
}
    3e88:	40a2                	lw	ra,8(sp)
    3e8a:	4412                	lw	s0,4(sp)
    3e8c:	4482                	lw	s1,0(sp)
    3e8e:	0131                	addi	sp,sp,12
    3e90:	8082                	ret
        (*p) ();
    3e92:	401c                	lw	a5,0(s0)
    3e94:	9782                	jalr	a5
    3e96:	b7f5                	j	3e82 <_init+0x14>

00003e98 <_fini>:

CPP_WEAK void _fini(void)
{
    3e98:	1151                	addi	sp,sp,-12
    3e9a:	c222                	sw	s0,4(sp)
    3e9c:	c026                	sw	s1,0(sp)
    func_ptr *p;
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3e9e:	6425                	lui	s0,0x9
    3ea0:	64a5                	lui	s1,0x9
{
    3ea2:	c406                	sw	ra,8(sp)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ea4:	89040413          	addi	s0,s0,-1904 # 8890 <__ctor_end__>
    3ea8:	88c48493          	addi	s1,s1,-1908 # 888c <pad_line+0x71c>
    3eac:	0084f763          	bgeu	s1,s0,3eba <_fini+0x22>
        (*p) ();
    }
}
    3eb0:	40a2                	lw	ra,8(sp)
    3eb2:	4412                	lw	s0,4(sp)
    3eb4:	4482                	lw	s1,0(sp)
    3eb6:	0131                	addi	sp,sp,12
    3eb8:	8082                	ret
        (*p) ();
    3eba:	401c                	lw	a5,0(s0)
    for (p = (func_ptr *)&__ctor_end__; p <= (func_ptr *)&__dtor_end__ - 1; p++) {
    3ebc:	0411                	addi	s0,s0,4
        (*p) ();
    3ebe:	9782                	jalr	a5
    3ec0:	b7f5                	j	3eac <_fini+0x14>

00003ec2 <fputc>:
{
    return 0;
}

int fputc(int ch, FILE *stream)
{
    3ec2:	1151                	addi	sp,sp,-12
    3ec4:	c026                	sw	s1,0(sp)
    3ec6:	84aa                	mv	s1,a0
    (void)stream;

    if (console_handle == NULL) {
    3ec8:	0281a503          	lw	a0,40(gp) # 20000510 <console_handle>
{
    3ecc:	c406                	sw	ra,8(sp)
    3ece:	c222                	sw	s0,4(sp)
    if (console_handle == NULL) {
    3ed0:	c505                	beqz	a0,3ef8 <fputc+0x36>
    3ed2:	02818413          	addi	s0,gp,40 # 20000510 <console_handle>
        return -1;
    }

    if (ch == '\n') {
    3ed6:	47a9                	li	a5,10
    3ed8:	00f49563          	bne	s1,a5,3ee2 <fputc+0x20>
        csi_usart_putchar(console_handle, '\r');
    3edc:	45b5                	li	a1,13
    3ede:	f92ff0ef          	jal	ra,3670 <csi_usart_putchar>
    }

    csi_usart_putchar(console_handle, ch);
    3ee2:	4008                	lw	a0,0(s0)
    3ee4:	0ff4f593          	andi	a1,s1,255
    3ee8:	f88ff0ef          	jal	ra,3670 <csi_usart_putchar>

    return 0;
    3eec:	4501                	li	a0,0
}
    3eee:	40a2                	lw	ra,8(sp)
    3ef0:	4412                	lw	s0,4(sp)
    3ef2:	4482                	lw	s1,0(sp)
    3ef4:	0131                	addi	sp,sp,12
    3ef6:	8082                	ret
        return -1;
    3ef8:	557d                	li	a0,-1
    3efa:	bfd5                	j	3eee <fputc+0x2c>

00003efc <os_critical_enter>:
#ifndef CONFIG_KERNEL_NONE
    csi_kernel_sched_suspend();
#endif

    return 0;
}
    3efc:	4501                	li	a0,0
    3efe:	8082                	ret

00003f00 <os_critical_exit>:
    3f00:	4501                	li	a0,0
    3f02:	8082                	ret

00003f04 <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    3f04:	1141                	addi	sp,sp,-16
    3f06:	c422                	sw	s0,8(sp)
    3f08:	842a                	mv	s0,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    3f0a:	4188                	lw	a0,0(a1)
    3f0c:	c02e                	sw	a1,0(sp)
{
    3f0e:	c606                	sw	ra,12(sp)
  int ndx = mm_size2ndx(node->size);
    3f10:	20d5                	jal	3ff4 <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    3f12:	0505                	addi	a0,a0,1
    3f14:	0512                	slli	a0,a0,0x4
    3f16:	00850713          	addi	a4,a0,8
    3f1a:	9722                	add	a4,a4,s0
    3f1c:	942a                	add	s0,s0,a0
    3f1e:	481c                	lw	a5,16(s0)
    3f20:	4582                	lw	a1,0(sp)
    3f22:	c791                	beqz	a5,3f2e <mm_addfreechunk+0x2a>
       next && next->size && next->size < node->size;
    3f24:	4394                	lw	a3,0(a5)
    3f26:	c681                	beqz	a3,3f2e <mm_addfreechunk+0x2a>
    3f28:	4190                	lw	a2,0(a1)
    3f2a:	00c6eb63          	bltu	a3,a2,3f40 <mm_addfreechunk+0x3c>
       prev = next, next = next->flink);

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    3f2e:	c70c                	sw	a1,8(a4)
  node->blink = prev;
    3f30:	c5d8                	sw	a4,12(a1)
  node->flink = next;
    3f32:	c59c                	sw	a5,8(a1)

  if (next)
    3f34:	c391                	beqz	a5,3f38 <mm_addfreechunk+0x34>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    3f36:	c7cc                	sw	a1,12(a5)
    }
}
    3f38:	40b2                	lw	ra,12(sp)
    3f3a:	4422                	lw	s0,8(sp)
    3f3c:	0141                	addi	sp,sp,16
    3f3e:	8082                	ret
       prev = next, next = next->flink);
    3f40:	873e                	mv	a4,a5
    3f42:	479c                	lw	a5,8(a5)
    3f44:	bff9                	j	3f22 <mm_addfreechunk+0x1e>

00003f46 <mm_addregion>:

  /* Adjust the provide heap start and size so that they are both aligned
   * with the MM_MIN_CHUNK size.
   */

  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3f46:	00f58713          	addi	a4,a1,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3f4a:	962e                	add	a2,a2,a1

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    3f4c:	454c                	lw	a1,12(a0)
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    3f4e:	9b41                	andi	a4,a4,-16
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    3f50:	9a41                	andi	a2,a2,-16
  heapsize = heapend - heapbase;
    3f52:	40e607b3          	sub	a5,a2,a4
  heap->mm_heapsize += heapsize;
    3f56:	95be                	add	a1,a1,a5
    3f58:	c54c                	sw	a1,12(a0)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    3f5a:	c918                	sw	a4,16(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3f5c:	4321                	li	t1,8
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3f5e:	800002b7          	lui	t0,0x80000

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    3f62:	17c1                	addi	a5,a5,-16
    3f64:	c71c                	sw	a5,8(a4)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    3f66:	00672023          	sw	t1,0(a4)
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    3f6a:	00572223          	sw	t0,4(a4)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    3f6e:	00870593          	addi	a1,a4,8
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    3f72:	0065a223          	sw	t1,4(a1)

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    3f76:	ff860713          	addi	a4,a2,-8
    3f7a:	c958                	sw	a4,20(a0)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3f7c:	0057e7b3          	or	a5,a5,t0
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    3f80:	fe662c23          	sw	t1,-8(a2)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    3f84:	fef62e23          	sw	a5,-4(a2)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    3f88:	bfb5                	j	3f04 <mm_addfreechunk>

00003f8a <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    3f8a:	1141                	addi	sp,sp,-16
    3f8c:	c422                	sw	s0,8(sp)
    3f8e:	c226                	sw	s1,4(sp)
    3f90:	c606                	sw	ra,12(sp)
    3f92:	842a                	mv	s0,a0
    3f94:	c032                	sw	a2,0(sp)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    3f96:	00052623          	sw	zero,12(a0)
{
    3f9a:	84ae                	mv	s1,a1
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    3f9c:	13000613          	li	a2,304
    3fa0:	4581                	li	a1,0
    3fa2:	0561                	addi	a0,a0,24
    3fa4:	b08fe0ef          	jal	ra,22ac <memset>
  for (i = 1; i < MM_NNODES; i++)
    3fa8:	4702                	lw	a4,0(sp)
    3faa:	02840793          	addi	a5,s0,40
    3fae:	14840693          	addi	a3,s0,328
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3fb2:	ff078613          	addi	a2,a5,-16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    3fb6:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    3fba:	c7d0                	sw	a2,12(a5)
    3fbc:	07c1                	addi	a5,a5,16
  for (i = 1; i < MM_NNODES; i++)
    3fbe:	fed79ae3          	bne	a5,a3,3fb2 <mm_initialize+0x28>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    3fc2:	8522                	mv	a0,s0
}
    3fc4:	4422                	lw	s0,8(sp)
    3fc6:	40b2                	lw	ra,12(sp)
  mm_addregion(heap, heapstart, heapsize);
    3fc8:	85a6                	mv	a1,s1
}
    3fca:	4492                	lw	s1,4(sp)
  mm_addregion(heap, heapstart, heapsize);
    3fcc:	863a                	mv	a2,a4
}
    3fce:	0141                	addi	sp,sp,16
  mm_addregion(heap, heapstart, heapsize);
    3fd0:	bf9d                	j	3f46 <mm_addregion>

00003fd2 <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    3fd2:	200025b7          	lui	a1,0x20002
    3fd6:	200307b7          	lui	a5,0x20030
    3fda:	29058613          	addi	a2,a1,656 # 20002290 <__bss_end__>
    3fde:	00078793          	mv	a5,a5
    3fe2:	20002537          	lui	a0,0x20002
    3fe6:	40c78633          	sub	a2,a5,a2
    3fea:	29058593          	addi	a1,a1,656
    3fee:	14850513          	addi	a0,a0,328 # 20002148 <g_mmheap>
    3ff2:	bf61                	j	3f8a <mm_initialize>

00003ff4 <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
    3ff4:	004007b7          	lui	a5,0x400
    3ff8:	00f57c63          	bgeu	a0,a5,4010 <mm_size2ndx+0x1c>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
    3ffc:	00455793          	srli	a5,a0,0x4
  while (size > 1)
    4000:	4705                	li	a4,1
  int ndx = 0;
    4002:	4501                	li	a0,0
  while (size > 1)
    4004:	00f76363          	bltu	a4,a5,400a <mm_size2ndx+0x16>
    4008:	8082                	ret
    {
      ndx++;
    400a:	0505                	addi	a0,a0,1
      size >>= 1;
    400c:	8385                	srli	a5,a5,0x1
    400e:	bfdd                	j	4004 <mm_size2ndx+0x10>
       return MM_NNODES-1;
    4010:	4549                	li	a0,18
    }

  return ndx;
}
    4012:	8082                	ret

00004014 <sd_test>:
{
	UINT bw;
	FRESULT fr;


	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */
    4014:	65a1                	lui	a1,0x8
    4016:	20002537          	lui	a0,0x20002
{
    401a:	1141                	addi	sp,sp,-16
	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */
    401c:	4601                	li	a2,0
    401e:	85c58593          	addi	a1,a1,-1956 # 785c <sg_usi_config+0xa4>
    4022:	c2c50513          	addi	a0,a0,-980 # 20001c2c <FatFs>
{
    4026:	c422                	sw	s0,8(sp)
    4028:	c606                	sw	ra,12(sp)
	f_mount(&FatFs, "", 0);		/* Give a work area to the default drive */
    402a:	50e010ef          	jal	ra,5538 <f_mount>

	fr = f_open(&Fil, "newfile.txt", FA_WRITE | FA_CREATE_ALWAYS);	/* Create a file */
    402e:	20002437          	lui	s0,0x20002
    4032:	65a1                	lui	a1,0x8
    4034:	4629                	li	a2,10
    4036:	83458593          	addi	a1,a1,-1996 # 7834 <sg_usi_config+0x7c>
    403a:	e5c40513          	addi	a0,s0,-420 # 20001e5c <Fil>
    403e:	54a010ef          	jal	ra,5588 <f_open>
	if (fr == FR_OK) {
    4042:	e905                	bnez	a0,4072 <sd_test+0x5e>
		f_write(&Fil, "It works!\r\n", 11, &bw);	/* Write data to the file */
    4044:	65a1                	lui	a1,0x8
    4046:	868a                	mv	a3,sp
    4048:	462d                	li	a2,11
    404a:	84058593          	addi	a1,a1,-1984 # 7840 <sg_usi_config+0x88>
    404e:	e5c40513          	addi	a0,s0,-420
    4052:	75c010ef          	jal	ra,57ae <f_write>
		fr = f_close(&Fil);							/* Close the file */
    4056:	e5c40513          	addi	a0,s0,-420
    405a:	205010ef          	jal	ra,5a5e <f_close>
		if (fr == FR_OK && bw == 11) {		
    405e:	e911                	bnez	a0,4072 <sd_test+0x5e>
    4060:	4702                	lw	a4,0(sp)
    4062:	47ad                	li	a5,11
    4064:	00f71763          	bne	a4,a5,4072 <sd_test+0x5e>
			printf("sd card success\r\n");
    4068:	6521                	lui	a0,0x8
    406a:	84c50513          	addi	a0,a0,-1972 # 784c <sg_usi_config+0x94>
    406e:	155020ef          	jal	ra,69c2 <puts>
		}
	}
    4072:	40b2                	lw	ra,12(sp)
    4074:	4422                	lw	s0,8(sp)
    4076:	0141                	addi	sp,sp,16
    4078:	8082                	ret

0000407a <main>:
{
    407a:	1151                	addi	sp,sp,-12
    407c:	c222                	sw	s0,4(sp)
    printf("Hello World!\n");
    407e:	6421                	lui	s0,0x8
    4080:	86040513          	addi	a0,s0,-1952 # 7860 <sg_usi_config+0xa8>
{
    4084:	c406                	sw	ra,8(sp)
    printf("Hello World!\n");
    4086:	13d020ef          	jal	ra,69c2 <puts>
    key_gpio_intr(PA8);
    408a:	4521                	li	a0,8
    408c:	2871                	jal	4128 <key_gpio_intr>
    LED_Init();
    408e:	206d                	jal	4138 <LED_Init>
    OLED_SHOW();
    4090:	57a000ef          	jal	ra,460a <OLED_SHOW>
    sd_test();
    4094:	3741                	jal	4014 <sd_test>
        LED_ON();
    4096:	2239                	jal	41a4 <LED_ON>
        mdelay(500);
    4098:	1f400513          	li	a0,500
    409c:	3ef1                	jal	3c78 <mdelay>
		printf("Hello World!\n");
    409e:	86040513          	addi	a0,s0,-1952
    40a2:	121020ef          	jal	ra,69c2 <puts>
        LED_OFF();
    40a6:	2215                	jal	41ca <LED_OFF>
        mdelay(500);
    40a8:	1f400513          	li	a0,500
    40ac:	36f1                	jal	3c78 <mdelay>
    while(1)
    40ae:	b7e5                	j	4096 <main+0x1c>

000040b0 <gpio_interrupt_handler>:
#include "drv_gpio.h"
#include "key.h"

gpio_pin_handle_t pin = NULL;
static void gpio_interrupt_handler(int32_t idx)
{
    40b0:	1151                	addi	sp,sp,-12
    printf("gpio interrupt is triggled\n");
    40b2:	6521                	lui	a0,0x8
{
    40b4:	c222                	sw	s0,4(sp)
    printf("gpio interrupt is triggled\n");
    40b6:	8ac50513          	addi	a0,a0,-1876 # 78ac <sg_usi_config+0xf4>
{
    40ba:	c406                	sw	ra,8(sp)
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 0);
    40bc:	02c18413          	addi	s0,gp,44 # 20000514 <pin>
    printf("gpio interrupt is triggled\n");
    40c0:	103020ef          	jal	ra,69c2 <puts>
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 0);
    40c4:	4008                	lw	a0,0(s0)
    40c6:	4601                	li	a2,0
    40c8:	4585                	li	a1,1
    40ca:	8c7ff0ef          	jal	ra,3990 <csi_gpio_pin_set_irq>
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    40ce:	4008                	lw	a0,0(s0)
}
    40d0:	4412                	lw	s0,4(sp)
    40d2:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    40d4:	4605                	li	a2,1
    40d6:	4585                	li	a1,1
}
    40d8:	0131                	addi	sp,sp,12
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    40da:	8b7ff06f          	j	3990 <csi_gpio_pin_set_irq>

000040de <example_pin_gpio_init>:

void example_pin_gpio_init(void)
{
    drv_pinmux_config(EXAMPLE_GPIO_PIN, EXAMPLE_GPIO_PIN_FUNC);
    40de:	4581                	li	a1,0
    40e0:	4505                	li	a0,1
    40e2:	b6fd                	j	3cd0 <drv_pinmux_config>

000040e4 <gpio_falling_edge_interrupt>:
}

void gpio_falling_edge_interrupt(pin_name_e gpio_pin)
{
    40e4:	1151                	addi	sp,sp,-12
    40e6:	c406                	sw	ra,8(sp)
    40e8:	c222                	sw	s0,4(sp)
    40ea:	842a                	mv	s0,a0
    

    example_pin_gpio_init();
    40ec:	3fcd                	jal	40de <example_pin_gpio_init>

    printf("press the center button will triggle the gpio interrupt \n");
    40ee:	6521                	lui	a0,0x8
    40f0:	87050513          	addi	a0,a0,-1936 # 7870 <sg_usi_config+0xb8>
    40f4:	0cf020ef          	jal	ra,69c2 <puts>
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);
    40f8:	6591                	lui	a1,0x4
    40fa:	0b058593          	addi	a1,a1,176 # 40b0 <gpio_interrupt_handler>
    40fe:	8522                	mv	a0,s0
    4100:	f62ff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    4104:	02c18413          	addi	s0,gp,44 # 20000514 <pin>

    csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    4108:	4581                	li	a1,0
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);
    410a:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    410c:	fb6ff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    4110:	4008                	lw	a0,0(s0)
    4112:	4581                	li	a1,0
    4114:	fc6ff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    4118:	4008                	lw	a0,0(s0)
}
    411a:	4412                	lw	s0,4(sp)
    411c:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    411e:	4605                	li	a2,1
    4120:	4585                	li	a1,1
}
    4122:	0131                	addi	sp,sp,12
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    4124:	86dff06f          	j	3990 <csi_gpio_pin_set_irq>

00004128 <key_gpio_intr>:

RETURN: NULL

*****************************************************************************/
int key_gpio_intr(pin_name_e gpio_pin)
{
    4128:	1151                	addi	sp,sp,-12
    412a:	c406                	sw	ra,8(sp)
    gpio_falling_edge_interrupt(gpio_pin);
    412c:	3f65                	jal	40e4 <gpio_falling_edge_interrupt>
    return 0;
}
    412e:	40a2                	lw	ra,8(sp)
    4130:	4501                	li	a0,0
    4132:	0131                	addi	sp,sp,12
    4134:	8082                	ret

00004136 <gpio_interrupt_handler>:
extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}
    4136:	8082                	ret

00004138 <LED_Init>:

void LED_Init()
{	
    4138:	1151                	addi	sp,sp,-12
    413a:	c026                	sw	s1,0(sp)
	int32_t ret;		
																					
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    413c:	6491                	lui	s1,0x4
    413e:	13648593          	addi	a1,s1,310 # 4136 <gpio_interrupt_handler>
    4142:	4501                	li	a0,0
{	
    4144:	c406                	sw	ra,8(sp)
    4146:	c222                	sw	s0,4(sp)
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    4148:	f1aff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    414c:	03018413          	addi	s0,gp,48 # 20000518 <led1_pin_handle_t>
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    4150:	4581                	li	a1,0
    led1_pin_handle_t = csi_gpio_pin_initialize(PA0, gpio_interrupt_handler);       
    4152:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led1_pin_handle_t, GPIO_MODE_PULLNONE);
    4154:	f6eff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led1_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4158:	4008                	lw	a0,0(s0)
    415a:	4585                	li	a1,1
    415c:	f7eff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>

    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    4160:	13648593          	addi	a1,s1,310
    4164:	4505                	li	a0,1
    4166:	efcff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    416a:	03418413          	addi	s0,gp,52 # 2000051c <led2_pin_handle_t>
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    416e:	4581                	li	a1,0
    led2_pin_handle_t = csi_gpio_pin_initialize(PA1, gpio_interrupt_handler);       
    4170:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led2_pin_handle_t, GPIO_MODE_PULLNONE);
    4172:	f50ff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led2_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4176:	4008                	lw	a0,0(s0)
    4178:	4585                	li	a1,1
    417a:	f60ff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>

    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    417e:	13648593          	addi	a1,s1,310
    4182:	4509                	li	a0,2
    4184:	edeff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    4188:	03818413          	addi	s0,gp,56 # 20000520 <led3_pin_handle_t>
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    418c:	4581                	li	a1,0
    led3_pin_handle_t = csi_gpio_pin_initialize(PA2, gpio_interrupt_handler);       
    418e:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(led3_pin_handle_t, GPIO_MODE_PULLNONE);
    4190:	f32ff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4194:	4008                	lw	a0,0(s0)
}
    4196:	4412                	lw	s0,4(sp)
    4198:	40a2                	lw	ra,8(sp)
    419a:	4482                	lw	s1,0(sp)
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    419c:	4585                	li	a1,1
}
    419e:	0131                	addi	sp,sp,12
    csi_gpio_pin_config_direction(led3_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    41a0:	f3aff06f          	j	38da <csi_gpio_pin_config_direction>

000041a4 <LED_ON>:

void LED_ON()
{
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    41a4:	0301a503          	lw	a0,48(gp) # 20000518 <led1_pin_handle_t>
{
    41a8:	1151                	addi	sp,sp,-12
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    41aa:	4585                	li	a1,1
{
    41ac:	c406                	sw	ra,8(sp)
    csi_gpio_pin_write(led1_pin_handle_t,1);	
    41ae:	f5eff0ef          	jal	ra,390c <csi_gpio_pin_write>
    csi_gpio_pin_write(led2_pin_handle_t,1);	
    41b2:	0341a503          	lw	a0,52(gp) # 2000051c <led2_pin_handle_t>
    41b6:	4585                	li	a1,1
    41b8:	f54ff0ef          	jal	ra,390c <csi_gpio_pin_write>
    csi_gpio_pin_write(led3_pin_handle_t,1);	
}
    41bc:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(led3_pin_handle_t,1);	
    41be:	0381a503          	lw	a0,56(gp) # 20000520 <led3_pin_handle_t>
    41c2:	4585                	li	a1,1
}
    41c4:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(led3_pin_handle_t,1);	
    41c6:	f46ff06f          	j	390c <csi_gpio_pin_write>

000041ca <LED_OFF>:

void LED_OFF()
{
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    41ca:	0301a503          	lw	a0,48(gp) # 20000518 <led1_pin_handle_t>
{
    41ce:	1151                	addi	sp,sp,-12
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    41d0:	4581                	li	a1,0
{
    41d2:	c406                	sw	ra,8(sp)
    csi_gpio_pin_write(led1_pin_handle_t,0);	
    41d4:	f38ff0ef          	jal	ra,390c <csi_gpio_pin_write>
    csi_gpio_pin_write(led2_pin_handle_t,0);	
    41d8:	0341a503          	lw	a0,52(gp) # 2000051c <led2_pin_handle_t>
    41dc:	4581                	li	a1,0
    41de:	f2eff0ef          	jal	ra,390c <csi_gpio_pin_write>
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    41e2:	40a2                	lw	ra,8(sp)
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    41e4:	0381a503          	lw	a0,56(gp) # 20000520 <led3_pin_handle_t>
    41e8:	4581                	li	a1,0
    41ea:	0131                	addi	sp,sp,12
    csi_gpio_pin_write(led3_pin_handle_t,0);	
    41ec:	f20ff06f          	j	390c <csi_gpio_pin_write>

000041f0 <gpio_interrupt_handler>:
extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}
    41f0:	8082                	ret

000041f2 <OLED_WR_Byte>:
		}
}


void OLED_WR_Byte(char dat,char cmd)
{	
    41f2:	1141                	addi	sp,sp,-16
    41f4:	c226                	sw	s1,4(sp)
    41f6:	84aa                	mv	s1,a0
    41f8:	03c1a503          	lw	a0,60(gp) # 20000524 <OLED_dc_pin_handle_t>
    41fc:	03c18793          	addi	a5,gp,60 # 20000524 <OLED_dc_pin_handle_t>
    4200:	c606                	sw	ra,12(sp)
    4202:	c422                	sw	s0,8(sp)
    4204:	c03e                	sw	a5,0(sp)
	char i;			  
	if(cmd)
    4206:	c191                	beqz	a1,420a <OLED_WR_Byte+0x18>
	  OLED_DC_Set();
    4208:	4585                	li	a1,1
	else 
	  OLED_DC_Clr();		  
    420a:	f02ff0ef          	jal	ra,390c <csi_gpio_pin_write>
{	
    420e:	4421                	li	s0,8
	for(i=0;i<8;i++)
	{			  
		OLED_SCL_Clr();
    4210:	0441a503          	lw	a0,68(gp) # 2000052c <OLED_scl_pin_handle_t>
    4214:	4581                	li	a1,0
    4216:	ef6ff0ef          	jal	ra,390c <csi_gpio_pin_write>
		if(dat&0x80)
    421a:	01849713          	slli	a4,s1,0x18
    421e:	8761                	srai	a4,a4,0x18
    4220:	04818793          	addi	a5,gp,72 # 20000530 <OLED_sda_pin_handle_t>
		{
		 OLED_SDA_Set();
    4224:	4585                	li	a1,1
		if(dat&0x80)
    4226:	00074363          	bltz	a4,422c <OLED_WR_Byte+0x3a>
		}
		else
		{
		 OLED_SDA_Clr();
    422a:	4581                	li	a1,0
    422c:	4388                	lw	a0,0(a5)
    422e:	147d                	addi	s0,s0,-1
		}
	  OLED_SCL_Set();
		dat<<=1;   
    4230:	0486                	slli	s1,s1,0x1
		 OLED_SDA_Clr();
    4232:	edaff0ef          	jal	ra,390c <csi_gpio_pin_write>
	  OLED_SCL_Set();
    4236:	04418793          	addi	a5,gp,68 # 2000052c <OLED_scl_pin_handle_t>
    423a:	4388                	lw	a0,0(a5)
    423c:	4585                	li	a1,1
    423e:	0ff47413          	andi	s0,s0,255
    4242:	ecaff0ef          	jal	ra,390c <csi_gpio_pin_write>
		dat<<=1;   
    4246:	0ff4f493          	andi	s1,s1,255
	for(i=0;i<8;i++)
    424a:	f079                	bnez	s0,4210 <OLED_WR_Byte+0x1e>
	}				 		  
	OLED_DC_Set();   	  
    424c:	4782                	lw	a5,0(sp)
} 
    424e:	4422                	lw	s0,8(sp)
    4250:	40b2                	lw	ra,12(sp)
    4252:	4492                	lw	s1,4(sp)
	OLED_DC_Set();   	  
    4254:	4388                	lw	a0,0(a5)
    4256:	4585                	li	a1,1
} 
    4258:	0141                	addi	sp,sp,16
	OLED_DC_Set();   	  
    425a:	eb2ff06f          	j	390c <csi_gpio_pin_write>

0000425e <OLED_ColorTurn>:
	if(i==0)
    425e:	e509                	bnez	a0,4268 <OLED_ColorTurn+0xa>
			OLED_WR_Byte(0xA6,OLED_CMD);//正常显示
    4260:	4581                	li	a1,0
    4262:	0a600513          	li	a0,166
			OLED_WR_Byte(0xA7,OLED_CMD);//反色显示
    4266:	b771                	j	41f2 <OLED_WR_Byte>
	if(i==1)
    4268:	4785                	li	a5,1
    426a:	00f51663          	bne	a0,a5,4276 <OLED_ColorTurn+0x18>
			OLED_WR_Byte(0xA7,OLED_CMD);//反色显示
    426e:	4581                	li	a1,0
    4270:	0a700513          	li	a0,167
    4274:	bfcd                	j	4266 <OLED_ColorTurn+0x8>
}
    4276:	8082                	ret

00004278 <OLED_DisplayTurn.part.1>:
void OLED_DisplayTurn(char i)
    4278:	1151                	addi	sp,sp,-12
			OLED_WR_Byte(0xC0,OLED_CMD);//反转显示
    427a:	4581                	li	a1,0
    427c:	0c000513          	li	a0,192
void OLED_DisplayTurn(char i)
    4280:	c406                	sw	ra,8(sp)
			OLED_WR_Byte(0xC0,OLED_CMD);//反转显示
    4282:	3f85                	jal	41f2 <OLED_WR_Byte>
}
    4284:	40a2                	lw	ra,8(sp)
			OLED_WR_Byte(0xA0,OLED_CMD);
    4286:	4581                	li	a1,0
    4288:	0a000513          	li	a0,160
}
    428c:	0131                	addi	sp,sp,12
			OLED_WR_Byte(0xA0,OLED_CMD);
    428e:	b795                	j	41f2 <OLED_WR_Byte>

00004290 <OLED_Set_Pos>:

//坐标设置

void OLED_Set_Pos(char x, char y) 
{
    4290:	1151                	addi	sp,sp,-12
    4292:	c222                	sw	s0,4(sp)
    4294:	842a                	mv	s0,a0
	OLED_WR_Byte(0xb0+y,OLED_CMD);
    4296:	fb058513          	addi	a0,a1,-80
    429a:	0ff57513          	andi	a0,a0,255
    429e:	4581                	li	a1,0
{
    42a0:	c406                	sw	ra,8(sp)
	OLED_WR_Byte(0xb0+y,OLED_CMD);
    42a2:	3f81                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
    42a4:	00445513          	srli	a0,s0,0x4
    42a8:	4581                	li	a1,0
    42aa:	01056513          	ori	a0,a0,16
    42ae:	3791                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte((x&0x0f),OLED_CMD);
    42b0:	00f47513          	andi	a0,s0,15
}   	  
    42b4:	4412                	lw	s0,4(sp)
    42b6:	40a2                	lw	ra,8(sp)
	OLED_WR_Byte((x&0x0f),OLED_CMD);
    42b8:	4581                	li	a1,0
}   	  
    42ba:	0131                	addi	sp,sp,12
	OLED_WR_Byte((x&0x0f),OLED_CMD);
    42bc:	bf1d                	j	41f2 <OLED_WR_Byte>

000042be <OLED_Clear>:
	OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
	OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
}		   			 
//清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!	  
void OLED_Clear(void)  
{  
    42be:	1151                	addi	sp,sp,-12
    42c0:	c222                	sw	s0,4(sp)
    42c2:	c406                	sw	ra,8(sp)
    42c4:	c026                	sw	s1,0(sp)
    42c6:	0b000413          	li	s0,176
	char i,n;		    
	for(i=0;i<4;i++)  
	{  
		OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
    42ca:	4581                	li	a1,0
    42cc:	8522                	mv	a0,s0
    42ce:	3715                	jal	41f2 <OLED_WR_Byte>
		OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
    42d0:	4581                	li	a1,0
    42d2:	4501                	li	a0,0
    42d4:	3f39                	jal	41f2 <OLED_WR_Byte>
		OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址   
    42d6:	4581                	li	a1,0
    42d8:	4541                	li	a0,16
    42da:	3f21                	jal	41f2 <OLED_WR_Byte>
    42dc:	08000493          	li	s1,128
		for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA); 
    42e0:	4585                	li	a1,1
    42e2:	4501                	li	a0,0
    42e4:	14fd                	addi	s1,s1,-1
    42e6:	3731                	jal	41f2 <OLED_WR_Byte>
    42e8:	fce5                	bnez	s1,42e0 <OLED_Clear+0x22>
    42ea:	0405                	addi	s0,s0,1
    42ec:	0ff47413          	andi	s0,s0,255
	for(i=0;i<4;i++)  
    42f0:	0b400793          	li	a5,180
    42f4:	fcf41be3          	bne	s0,a5,42ca <OLED_Clear+0xc>
	} //更新显示
}
    42f8:	40a2                	lw	ra,8(sp)
    42fa:	4412                	lw	s0,4(sp)
    42fc:	4482                	lw	s1,0(sp)
    42fe:	0131                	addi	sp,sp,12
    4300:	8082                	ret

00004302 <OLED_ShowChar>:
//在指定位置显示一个字符,包括部分字符
//x:0~127
//y:0~63				 
//sizey:选择字体 6x8  8x16
void OLED_ShowChar(char x,char y,char chr,char sizey)
{      	
    4302:	fd810113          	addi	sp,sp,-40
	char c=0,sizex=sizey/2;
    4306:	0016d793          	srli	a5,a3,0x1
	u16 i=0,size1;
	if(sizey==8)size1=6;
    430a:	4719                	li	a4,6
{      	
    430c:	d022                	sw	s0,32(sp)
	char c=0,sizex=sizey/2;
    430e:	c83e                	sw	a5,16(sp)
{      	
    4310:	d206                	sw	ra,36(sp)
    4312:	ce26                	sw	s1,28(sp)
    4314:	c42a                	sw	a0,8(sp)
    4316:	c02e                	sw	a1,0(sp)
	if(sizey==8)size1=6;
    4318:	47a1                	li	a5,8
    431a:	c23a                	sw	a4,4(sp)
{      	
    431c:	8436                	mv	s0,a3
	if(sizey==8)size1=6;
    431e:	00f68e63          	beq	a3,a5,433a <OLED_ShowChar+0x38>
	else size1=(sizey/8+((sizey%8)?1:0))*(sizey/2);
    4322:	0076f793          	andi	a5,a3,7
    4326:	0036d713          	srli	a4,a3,0x3
    432a:	00f037b3          	snez	a5,a5
    432e:	97ba                	add	a5,a5,a4
    4330:	0016d713          	srli	a4,a3,0x1
    4334:	02e787b3          	mul	a5,a5,a4
    4338:	c23e                	sw	a5,4(sp)
	c=chr-' ';//得到偏移后的值
	OLED_Set_Pos(x,y);
    433a:	4582                	lw	a1,0(sp)
    433c:	4522                	lw	a0,8(sp)
    433e:	c632                	sw	a2,12(sp)
	for(i=0;i<size1;i++)
    4340:	4481                	li	s1,0
	OLED_Set_Pos(x,y);
    4342:	37b9                	jal	4290 <OLED_Set_Pos>
	c=chr-' ';//得到偏移后的值
    4344:	4632                	lw	a2,12(sp)
    4346:	4799                	li	a5,6
    4348:	1601                	addi	a2,a2,-32
    434a:	0ff67613          	andi	a2,a2,255
    434e:	02f607b3          	mul	a5,a2,a5
    4352:	ca3e                	sw	a5,20(sp)
    4354:	00461793          	slli	a5,a2,0x4
    4358:	c63e                	sw	a5,12(sp)
	for(i=0;i<size1;i++)
    435a:	4792                	lw	a5,4(sp)
    435c:	00f49863          	bne	s1,a5,436c <OLED_ShowChar+0x6a>
		if(sizey==8) OLED_WR_Byte(asc2_0806[c][i],OLED_DATA);//6X8字号
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
//		else if(sizey==xx) OLED_WR_Byte(asc2_xxxx[c][i],OLED_DATA);//用户添加字号
		else return;
	}
}
    4360:	5092                	lw	ra,36(sp)
    4362:	5402                	lw	s0,32(sp)
    4364:	44f2                	lw	s1,28(sp)
    4366:	02810113          	addi	sp,sp,40
    436a:	8082                	ret
		if(i%sizex==0&&sizey!=8) OLED_Set_Pos(x,y++);
    436c:	47c2                	lw	a5,16(sp)
    436e:	02f4f733          	remu	a4,s1,a5
    4372:	eb0d                	bnez	a4,43a4 <OLED_ShowChar+0xa2>
    4374:	4721                	li	a4,8
    4376:	02e40a63          	beq	s0,a4,43aa <OLED_ShowChar+0xa8>
    437a:	4782                	lw	a5,0(sp)
    437c:	4522                	lw	a0,8(sp)
    437e:	00178713          	addi	a4,a5,1 # 400001 <__ctor_end__+0x3f7771>
    4382:	0ff77713          	andi	a4,a4,255
    4386:	85be                	mv	a1,a5
    4388:	cc3a                	sw	a4,24(sp)
    438a:	3719                	jal	4290 <OLED_Set_Pos>
    438c:	4762                	lw	a4,24(sp)
    438e:	c03a                	sw	a4,0(sp)
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
    4390:	4741                	li	a4,16
    4392:	fce417e3          	bne	s0,a4,4360 <OLED_ShowChar+0x5e>
    4396:	67a1                	lui	a5,0x8
    4398:	b1c78713          	addi	a4,a5,-1252 # 7b1c <asc2_1608>
    439c:	47b2                	lw	a5,12(sp)
    439e:	00f48633          	add	a2,s1,a5
    43a2:	a811                	j	43b6 <OLED_ShowChar+0xb4>
		if(sizey==8) OLED_WR_Byte(asc2_0806[c][i],OLED_DATA);//6X8字号
    43a4:	4721                	li	a4,8
    43a6:	fee415e3          	bne	s0,a4,4390 <OLED_ShowChar+0x8e>
    43aa:	47d2                	lw	a5,20(sp)
    43ac:	6621                	lui	a2,0x8
    43ae:	8f460613          	addi	a2,a2,-1804 # 78f4 <asc2_0806>
    43b2:	00f48733          	add	a4,s1,a5
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
    43b6:	9732                	add	a4,a4,a2
    43b8:	00074503          	lbu	a0,0(a4)
    43bc:	4585                	li	a1,1
	for(i=0;i<size1;i++)
    43be:	0485                	addi	s1,s1,1
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
    43c0:	3d0d                	jal	41f2 <OLED_WR_Byte>
    43c2:	bf61                	j	435a <OLED_ShowChar+0x58>

000043c4 <OLED_ShowString>:
	 	OLED_ShowChar(x+(sizey/2+m)*t,y,temp+'0',sizey);
	}
} 
//显示一个字符号串
void OLED_ShowString(char x,char y,char *chr,char sizey)
{
    43c4:	1111                	addi	sp,sp,-28
    43c6:	ca22                	sw	s0,20(sp)
    43c8:	c826                	sw	s1,16(sp)
    43ca:	cc06                	sw	ra,24(sp)
    43cc:	842a                	mv	s0,a0
    43ce:	82ae                	mv	t0,a1
    43d0:	8732                	mv	a4,a2
    43d2:	87b6                	mv	a5,a3
	char j=0;
	while (chr[j]!='\0')
	{		
		OLED_ShowChar(x,y,chr[j++],sizey);
		if(sizey==8)x+=6;
		else x+=sizey/2;
    43d4:	0016d313          	srli	t1,a3,0x1
	char j=0;
    43d8:	4481                	li	s1,0
	while (chr[j]!='\0')
    43da:	009706b3          	add	a3,a4,s1
    43de:	0006c603          	lbu	a2,0(a3) # e000e000 <__heap_end+0xbffde000>
    43e2:	e611                	bnez	a2,43ee <OLED_ShowString+0x2a>
	}
}
    43e4:	40e2                	lw	ra,24(sp)
    43e6:	4452                	lw	s0,20(sp)
    43e8:	44c2                	lw	s1,16(sp)
    43ea:	0171                	addi	sp,sp,28
    43ec:	8082                	ret
		OLED_ShowChar(x,y,chr[j++],sizey);
    43ee:	86be                	mv	a3,a5
    43f0:	8596                	mv	a1,t0
    43f2:	8522                	mv	a0,s0
    43f4:	c63a                	sw	a4,12(sp)
    43f6:	c41a                	sw	t1,8(sp)
    43f8:	c23e                	sw	a5,4(sp)
    43fa:	c016                	sw	t0,0(sp)
    43fc:	3719                	jal	4302 <OLED_ShowChar>
		if(sizey==8)x+=6;
    43fe:	4792                	lw	a5,4(sp)
		OLED_ShowChar(x,y,chr[j++],sizey);
    4400:	0485                	addi	s1,s1,1
		if(sizey==8)x+=6;
    4402:	46a1                	li	a3,8
		OLED_ShowChar(x,y,chr[j++],sizey);
    4404:	0ff4f493          	andi	s1,s1,255
		if(sizey==8)x+=6;
    4408:	4282                	lw	t0,0(sp)
    440a:	4322                	lw	t1,8(sp)
    440c:	4732                	lw	a4,12(sp)
    440e:	00d79663          	bne	a5,a3,441a <OLED_ShowString+0x56>
    4412:	0419                	addi	s0,s0,6
		else x+=sizey/2;
    4414:	0ff47413          	andi	s0,s0,255
    4418:	b7c9                	j	43da <OLED_ShowString+0x16>
    441a:	941a                	add	s0,s0,t1
    441c:	bfe5                	j	4414 <OLED_ShowString+0x50>

0000441e <OLED_Init>:
	printf("OLED_SPI_INIT \n");																   
    441e:	6521                	lui	a0,0x8


//refer to nexys video refference to see the power on sequence...
//初始化				    
void OLED_Init(void)
{   
    4420:	1151                	addi	sp,sp,-12
	printf("OLED_SPI_INIT \n");																   
    4422:	8c850513          	addi	a0,a0,-1848 # 78c8 <sg_usi_config+0x110>
{   
    4426:	c406                	sw	ra,8(sp)
    4428:	c222                	sw	s0,4(sp)
    442a:	c026                	sw	s1,0(sp)
	printf("OLED_SPI_INIT \n");																   
    442c:	596020ef          	jal	ra,69c2 <puts>
    OLED_vdd_pin_handle_t = csi_gpio_pin_initialize(PA26, gpio_interrupt_handler);         //                         				            PA26
    4430:	6491                	lui	s1,0x4
    4432:	1f048593          	addi	a1,s1,496 # 41f0 <gpio_interrupt_handler>
    4436:	4569                	li	a0,26
    4438:	c2aff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    443c:	05018713          	addi	a4,gp,80 # 20000538 <OLED_vdd_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_vdd_pin_handle_t, GPIO_MODE_PULLNONE);
    4440:	4581                	li	a1,0
    OLED_vdd_pin_handle_t = csi_gpio_pin_initialize(PA26, gpio_interrupt_handler);         //                         				            PA26
    4442:	c308                	sw	a0,0(a4)
    csi_gpio_pin_config_mode(OLED_vdd_pin_handle_t, GPIO_MODE_PULLNONE);
    4444:	c7eff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_vdd_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4448:	05018713          	addi	a4,gp,80 # 20000538 <OLED_vdd_pin_handle_t>
    444c:	4308                	lw	a0,0(a4)
    444e:	4585                	li	a1,1
    4450:	c8aff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    OLED_vbat_pin_handle_t = csi_gpio_pin_initialize(PA25, gpio_interrupt_handler);        //                         				            PA25    
    4454:	1f048593          	addi	a1,s1,496
    4458:	4565                	li	a0,25
    445a:	c08ff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    445e:	04c18793          	addi	a5,gp,76 # 20000534 <OLED_vbat_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_vbat_pin_handle_t, GPIO_MODE_PULLNONE);
    4462:	4581                	li	a1,0
    OLED_vbat_pin_handle_t = csi_gpio_pin_initialize(PA25, gpio_interrupt_handler);        //                         				            PA25    
    4464:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(OLED_vbat_pin_handle_t, GPIO_MODE_PULLNONE);
    4466:	c5cff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_vbat_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    446a:	04c18693          	addi	a3,gp,76 # 20000534 <OLED_vbat_pin_handle_t>
    446e:	4288                	lw	a0,0(a3)
    4470:	4585                	li	a1,1
    OLED_res_pin_handle_t = csi_gpio_pin_initialize(PA22, gpio_interrupt_handler);         //                         				            PA22
    4472:	04018413          	addi	s0,gp,64 # 20000528 <OLED_res_pin_handle_t>
    csi_gpio_pin_config_direction(OLED_vbat_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    4476:	c64ff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    OLED_res_pin_handle_t = csi_gpio_pin_initialize(PA22, gpio_interrupt_handler);         //                         				            PA22
    447a:	1f048593          	addi	a1,s1,496
    447e:	4559                	li	a0,22
    4480:	be2ff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    csi_gpio_pin_config_mode(OLED_res_pin_handle_t, GPIO_MODE_PULLNONE);
    4484:	4581                	li	a1,0
    OLED_res_pin_handle_t = csi_gpio_pin_initialize(PA22, gpio_interrupt_handler);         //                         				            PA22
    4486:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(OLED_res_pin_handle_t, GPIO_MODE_PULLNONE);
    4488:	c3aff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_res_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    448c:	4008                	lw	a0,0(s0)
    448e:	4585                	li	a1,1
    4490:	c4aff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    OLED_scl_pin_handle_t = csi_gpio_pin_initialize(PA23, gpio_interrupt_handler);        //                                                    PA23
    4494:	1f048593          	addi	a1,s1,496
    4498:	455d                	li	a0,23
    449a:	bc8ff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    449e:	04418693          	addi	a3,gp,68 # 2000052c <OLED_scl_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_scl_pin_handle_t, GPIO_MODE_PULLNONE);
    44a2:	4581                	li	a1,0
    OLED_scl_pin_handle_t = csi_gpio_pin_initialize(PA23, gpio_interrupt_handler);        //                                                    PA23
    44a4:	c288                	sw	a0,0(a3)
    csi_gpio_pin_config_mode(OLED_scl_pin_handle_t, GPIO_MODE_PULLNONE);
    44a6:	c1cff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_scl_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    44aa:	04418693          	addi	a3,gp,68 # 2000052c <OLED_scl_pin_handle_t>
    44ae:	4288                	lw	a0,0(a3)
    44b0:	4585                	li	a1,1
    44b2:	c28ff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    OLED_dc_pin_handle_t = csi_gpio_pin_initialize(PA21, gpio_interrupt_handler);         //                                                    PA21                                                
    44b6:	1f048593          	addi	a1,s1,496
    44ba:	4555                	li	a0,21
    44bc:	ba6ff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    44c0:	03c18693          	addi	a3,gp,60 # 20000524 <OLED_dc_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_dc_pin_handle_t, GPIO_MODE_PULLNONE);
    44c4:	4581                	li	a1,0
    OLED_dc_pin_handle_t = csi_gpio_pin_initialize(PA21, gpio_interrupt_handler);         //                                                    PA21                                                
    44c6:	c288                	sw	a0,0(a3)
    csi_gpio_pin_config_mode(OLED_dc_pin_handle_t, GPIO_MODE_PULLNONE);
    44c8:	bfaff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_dc_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    44cc:	03c18693          	addi	a3,gp,60 # 20000524 <OLED_dc_pin_handle_t>
    44d0:	4288                	lw	a0,0(a3)
    44d2:	4585                	li	a1,1
    44d4:	c06ff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    OLED_sda_pin_handle_t = csi_gpio_pin_initialize(PA24, gpio_interrupt_handler);        //                                                    PA24
    44d8:	1f048593          	addi	a1,s1,496
    44dc:	4561                	li	a0,24
    44de:	b84ff0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    44e2:	04818493          	addi	s1,gp,72 # 20000530 <OLED_sda_pin_handle_t>
    csi_gpio_pin_config_mode(OLED_sda_pin_handle_t, GPIO_MODE_PULLNONE);
    44e6:	4581                	li	a1,0
    OLED_sda_pin_handle_t = csi_gpio_pin_initialize(PA24, gpio_interrupt_handler);        //                                                    PA24
    44e8:	c088                	sw	a0,0(s1)
    csi_gpio_pin_config_mode(OLED_sda_pin_handle_t, GPIO_MODE_PULLNONE);
    44ea:	bd8ff0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(OLED_sda_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    44ee:	4088                	lw	a0,0(s1)
    44f0:	4585                	li	a1,1
    44f2:	be8ff0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    oled_pin_init();
    OLED_VDD_Clr();
    44f6:	05018793          	addi	a5,gp,80 # 20000538 <OLED_vdd_pin_handle_t>
    44fa:	4388                	lw	a0,0(a5)
    44fc:	4581                	li	a1,0
    44fe:	c0eff0ef          	jal	ra,390c <csi_gpio_pin_write>
    mdelay(1);
    4502:	4505                	li	a0,1
    4504:	f74ff0ef          	jal	ra,3c78 <mdelay>
	OLED_RES_Clr();
    4508:	4008                	lw	a0,0(s0)
    450a:	4581                	li	a1,0
    450c:	c00ff0ef          	jal	ra,390c <csi_gpio_pin_write>
    mdelay(200);
    4510:	0c800513          	li	a0,200
    4514:	f64ff0ef          	jal	ra,3c78 <mdelay>
	OLED_RES_Set();
    4518:	4008                	lw	a0,0(s0)
    451a:	4585                	li	a1,1
    451c:	bf0ff0ef          	jal	ra,390c <csi_gpio_pin_write>
	
	OLED_WR_Byte(0xAE,OLED_CMD); /*display off*/
    4520:	4581                	li	a1,0
    4522:	0ae00513          	li	a0,174
    4526:	31f1                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x00,OLED_CMD); /*set lower column address*/ 
    4528:	4581                	li	a1,0
    452a:	4501                	li	a0,0
    452c:	31d9                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x10,OLED_CMD); /*set higher column address*/
    452e:	4581                	li	a1,0
    4530:	4541                	li	a0,16
    4532:	31c1                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x00,OLED_CMD); /*set display start line*/ 
    4534:	4581                	li	a1,0
    4536:	4501                	li	a0,0
    4538:	396d                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xB0,OLED_CMD); /*set page address*/ 
    453a:	4581                	li	a1,0
    453c:	0b000513          	li	a0,176
    4540:	394d                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x81,OLED_CMD); /*contract control*/ 
    4542:	4581                	li	a1,0
    4544:	08100513          	li	a0,129
    4548:	316d                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xff,OLED_CMD); /*128*/ 
    454a:	4581                	li	a1,0
    454c:	0ff00513          	li	a0,255
    4550:	314d                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xA1,OLED_CMD); /*set segment remap*/ 
    4552:	4581                	li	a1,0
    4554:	0a100513          	li	a0,161
    4558:	3969                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xA6,OLED_CMD); /*normal / reverse*/ 
    455a:	4581                	li	a1,0
    455c:	0a600513          	li	a0,166
    4560:	3949                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xA8,OLED_CMD); /*multiplex ratio*/ 
    4562:	4581                	li	a1,0
    4564:	0a800513          	li	a0,168
    4568:	3169                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x1F,OLED_CMD); /*duty = 1/32*/ 
    456a:	4581                	li	a1,0
    456c:	457d                	li	a0,31
    456e:	3151                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xC8,OLED_CMD); /*Com scan direction*/ 
    4570:	4581                	li	a1,0
    4572:	0c800513          	li	a0,200
    4576:	39b5                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xD3,OLED_CMD); /*set display offset*/ 
    4578:	4581                	li	a1,0
    457a:	0d300513          	li	a0,211
    457e:	3995                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x00,OLED_CMD); 
    4580:	4581                	li	a1,0
    4582:	4501                	li	a0,0
    4584:	31bd                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xD5,OLED_CMD); /*set osc division*/ 
    4586:	4581                	li	a1,0
    4588:	0d500513          	li	a0,213
    458c:	319d                	jal	41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x80,OLED_CMD); 
    458e:	4581                	li	a1,0
    4590:	08000513          	li	a0,128
    4594:	c5fff0ef          	jal	ra,41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xD9,OLED_CMD); /*set pre-charge period*/ 
    4598:	4581                	li	a1,0
    459a:	0d900513          	li	a0,217
    459e:	c55ff0ef          	jal	ra,41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x1f,OLED_CMD); 
    45a2:	4581                	li	a1,0
    45a4:	457d                	li	a0,31
    45a6:	c4dff0ef          	jal	ra,41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xDA,OLED_CMD); /*set COM pins*/ 
    45aa:	4581                	li	a1,0
    45ac:	0da00513          	li	a0,218
    45b0:	c43ff0ef          	jal	ra,41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x00,OLED_CMD); 
    45b4:	4581                	li	a1,0
    45b6:	4501                	li	a0,0
    45b8:	c3bff0ef          	jal	ra,41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0xdb,OLED_CMD); /*set vcomh*/ 
    45bc:	4581                	li	a1,0
    45be:	0db00513          	li	a0,219
    45c2:	c31ff0ef          	jal	ra,41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x40,OLED_CMD); 
    45c6:	4581                	li	a1,0
    45c8:	04000513          	li	a0,64
    45cc:	c27ff0ef          	jal	ra,41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x8d,OLED_CMD); /*set charge pump enable*/ 
    45d0:	4581                	li	a1,0
    45d2:	08d00513          	li	a0,141
    45d6:	c1dff0ef          	jal	ra,41f2 <OLED_WR_Byte>
	OLED_WR_Byte(0x14,OLED_CMD);
    45da:	4581                	li	a1,0
    45dc:	4551                	li	a0,20
    45de:	c15ff0ef          	jal	ra,41f2 <OLED_WR_Byte>

    OLED_VBAT_Clr();
    45e2:	04c18793          	addi	a5,gp,76 # 20000534 <OLED_vbat_pin_handle_t>
    45e6:	4388                	lw	a0,0(a5)
    45e8:	4581                	li	a1,0
    45ea:	b22ff0ef          	jal	ra,390c <csi_gpio_pin_write>
    mdelay(100);
    45ee:	06400513          	li	a0,100
    45f2:	e86ff0ef          	jal	ra,3c78 <mdelay>
	OLED_Clear();
    45f6:	31e1                	jal	42be <OLED_Clear>
	OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
}
    45f8:	4412                	lw	s0,4(sp)
    45fa:	40a2                	lw	ra,8(sp)
    45fc:	4482                	lw	s1,0(sp)
	OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
    45fe:	4581                	li	a1,0
    4600:	0af00513          	li	a0,175
}
    4604:	0131                	addi	sp,sp,12
	OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
    4606:	bedff06f          	j	41f2 <OLED_WR_Byte>

0000460a <OLED_SHOW>:
		OLED_Clear();
	}
}

void OLED_SHOW()
{
    460a:	1151                	addi	sp,sp,-12
    460c:	c406                	sw	ra,8(sp)
	OLED_Init();//初始化OLED 
    460e:	3d01                	jal	441e <OLED_Init>
	OLED_ColorTurn(0);//0正常显示，1 反色显示
    4610:	4501                	li	a0,0
    4612:	c4dff0ef          	jal	ra,425e <OLED_ColorTurn>
	if(i==1)
    4616:	c63ff0ef          	jal	ra,4278 <OLED_DisplayTurn.part.1>
    OLED_DisplayTurn(1);//0正常显示 1 屏幕翻转显示	
	OLED_Clear();
    461a:	ca5ff0ef          	jal	ra,42be <OLED_Clear>
	// OLED_ShowChinese(36,0,2,16);//园
	// OLED_ShowChinese(54,0,3,16);//电
	// OLED_ShowChinese(72,0,4,16);//子
	// OLED_ShowChinese(90,0,5,16);//科
	// OLED_ShowChinese(108,0,6,16);//技
	OLED_ShowString(0,0,"Welcome to use",16);
    461e:	6621                	lui	a2,0x8
    4620:	46c1                	li	a3,16
    4622:	8d860613          	addi	a2,a2,-1832 # 78d8 <sg_usi_config+0x120>
    4626:	4581                	li	a1,0
    4628:	4501                	li	a0,0
    462a:	3b69                	jal	43c4 <OLED_ShowString>
	OLED_ShowString(16,2,"WujianSoC",16);
    462c:	40a2                	lw	ra,8(sp)
	OLED_ShowString(16,2,"WujianSoC",16);
    462e:	6621                	lui	a2,0x8
    4630:	46c1                	li	a3,16
    4632:	8e860613          	addi	a2,a2,-1816 # 78e8 <sg_usi_config+0x130>
    4636:	4589                	li	a1,2
    4638:	4541                	li	a0,16
    463a:	0131                	addi	sp,sp,12
	OLED_ShowString(16,2,"WujianSoC",16);
    463c:	b361                	j	43c4 <OLED_ShowString>

0000463e <ld_dword>:
static DWORD ld_dword (const BYTE* ptr)	/* Load a 4-byte little-endian word */
{
	DWORD rv;

	rv = ptr[3];
	rv = rv << 8 | ptr[2];
    463e:	00354783          	lbu	a5,3(a0)
    4642:	00254703          	lbu	a4,2(a0)
    4646:	07a2                	slli	a5,a5,0x8
    4648:	8fd9                	or	a5,a5,a4
	rv = rv << 8 | ptr[1];
    464a:	00154703          	lbu	a4,1(a0)
    464e:	07a2                	slli	a5,a5,0x8
	rv = rv << 8 | ptr[0];
    4650:	00054503          	lbu	a0,0(a0)
	rv = rv << 8 | ptr[1];
    4654:	8fd9                	or	a5,a5,a4
	rv = rv << 8 | ptr[0];
    4656:	07a2                	slli	a5,a5,0x8
	return rv;
}
    4658:	8d5d                	or	a0,a0,a5
    465a:	8082                	ret

0000465c <clst2sect>:
	FATFS* fs,		/* Filesystem object */
	DWORD clst		/* Cluster# to be converted */
)
{
	clst -= 2;		/* Cluster number is origin from 2 */
	if (clst >= fs->n_fatent - 2) return 0;		/* Is it invalid cluster number? */
    465c:	4958                	lw	a4,20(a0)
	clst -= 2;		/* Cluster number is origin from 2 */
    465e:	15f9                	addi	a1,a1,-2
	if (clst >= fs->n_fatent - 2) return 0;		/* Is it invalid cluster number? */
    4660:	1779                	addi	a4,a4,-2
    4662:	00e5f963          	bgeu	a1,a4,4674 <clst2sect+0x18>
	return fs->database + (LBA_t)fs->csize * clst;	/* Start sector number of the cluster */
    4666:	00a55783          	lhu	a5,10(a0)
    466a:	5508                	lw	a0,40(a0)
    466c:	02b787b3          	mul	a5,a5,a1
    4670:	953e                	add	a0,a0,a5
    4672:	8082                	ret
	if (clst >= fs->n_fatent - 2) return 0;		/* Is it invalid cluster number? */
    4674:	4501                	li	a0,0
}
    4676:	8082                	ret

00004678 <get_ldnumber>:
#if FF_STR_VOLUME_ID		/* Find string volume ID */
	const char *sp;
	char c;
#endif

	tt = tp = *path;
    4678:	411c                	lw	a5,0(a0)
	if (!tp) return vol;	/* Invalid path name? */
    467a:	c38d                	beqz	a5,469c <get_ldnumber+0x24>
    467c:	873e                	mv	a4,a5
	do tc = *tt++; while ((UINT)tc >= (FF_USE_LFN ? ' ' : '!') && tc != ':');	/* Find a colon in the path */
    467e:	02000593          	li	a1,32
    4682:	03a00613          	li	a2,58
    4686:	0705                	addi	a4,a4,1
    4688:	fff74683          	lbu	a3,-1(a4)
    468c:	02d5f263          	bgeu	a1,a3,46b0 <get_ldnumber+0x38>
    4690:	fec69be3          	bne	a3,a2,4686 <get_ldnumber+0xe>

	if (tc == ':') {	/* DOS/Windows style volume ID? */
		i = FF_VOLUMES;
		if (IsDigit(*tp) && tp + 2 == tt) {	/* Is there a numeric volume ID + colon? */
    4694:	00278693          	addi	a3,a5,2
    4698:	00d70463          	beq	a4,a3,46a0 <get_ldnumber+0x28>
	if (!tp) return vol;	/* Invalid path name? */
    469c:	57fd                	li	a5,-1
    469e:	a811                	j	46b2 <get_ldnumber+0x3a>
					if (IsLower(tc)) tc -= 0x20;
				} while (c && (TCHAR)c == tc);
			} while ((c || tp != tt) && ++i < FF_VOLUMES);	/* Repeat for each id until pattern match */
		}
#endif
		if (i < FF_VOLUMES) {	/* If a volume ID is found, get the drive number and strip it */
    46a0:	0007c603          	lbu	a2,0(a5)
    46a4:	03000693          	li	a3,48
	if (!tp) return vol;	/* Invalid path name? */
    46a8:	57fd                	li	a5,-1
		if (i < FF_VOLUMES) {	/* If a volume ID is found, get the drive number and strip it */
    46aa:	00d61463          	bne	a2,a3,46b2 <get_ldnumber+0x3a>
			vol = i;		/* Drive number */
			*path = tt;		/* Snip the drive prefix off */
    46ae:	c118                	sw	a4,0(a0)
#if FF_FS_RPATH != 0
	vol = CurrVol;	/* Default drive is current drive */
#else
	vol = 0;		/* Default drive is 0 */
#endif
	return vol;		/* Return the default drive */
    46b0:	4781                	li	a5,0
}
    46b2:	853e                	mv	a0,a5
    46b4:	8082                	ret

000046b6 <validate>:
)
{
	FRESULT res = FR_INVALID_OBJECT;


	if (obj && obj->fs && obj->fs->fs_type && obj->id == obj->fs->id) {	/* Test if the object is valid */
    46b6:	ed01                	bnez	a0,46ce <validate+0x18>
		if (!(disk_status(obj->fs->pdrv) & STA_NOINIT)) { /* Test if the phsical drive is kept initialized */
			res = FR_OK;
		}
#endif
	}
	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
    46b8:	4781                	li	a5,0
	FRESULT res = FR_INVALID_OBJECT;
    46ba:	4525                	li	a0,9
	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
    46bc:	c19c                	sw	a5,0(a1)
	return res;
}
    46be:	8082                	ret
	FRESULT res = FR_INVALID_OBJECT;
    46c0:	4525                	li	a0,9
	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
    46c2:	4781                	li	a5,0
}
    46c4:	40b2                	lw	ra,12(sp)
    46c6:	4422                	lw	s0,8(sp)
	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
    46c8:	c19c                	sw	a5,0(a1)
}
    46ca:	0141                	addi	sp,sp,16
    46cc:	8082                	ret
	if (obj && obj->fs && obj->fs->fs_type && obj->id == obj->fs->id) {	/* Test if the object is valid */
    46ce:	411c                	lw	a5,0(a0)
{
    46d0:	1141                	addi	sp,sp,-16
    46d2:	c422                	sw	s0,8(sp)
    46d4:	c606                	sw	ra,12(sp)
    46d6:	842a                	mv	s0,a0
	if (obj && obj->fs && obj->fs->fs_type && obj->id == obj->fs->id) {	/* Test if the object is valid */
    46d8:	d7e5                	beqz	a5,46c0 <validate+0xa>
    46da:	0007c703          	lbu	a4,0(a5)
    46de:	d36d                	beqz	a4,46c0 <validate+0xa>
    46e0:	00455683          	lhu	a3,4(a0)
    46e4:	0067d703          	lhu	a4,6(a5)
    46e8:	fce69ce3          	bne	a3,a4,46c0 <validate+0xa>
		if (!(disk_status(obj->fs->pdrv) & STA_NOINIT)) { /* Test if the phsical drive is kept initialized */
    46ec:	0017c503          	lbu	a0,1(a5)
    46f0:	c02e                	sw	a1,0(sp)
    46f2:	19f010ef          	jal	ra,6090 <disk_status>
    46f6:	8905                	andi	a0,a0,1
    46f8:	4582                	lw	a1,0(sp)
    46fa:	f179                	bnez	a0,46c0 <validate+0xa>
	*rfs = (res == FR_OK) ? obj->fs : 0;	/* Corresponding filesystem object */
    46fc:	401c                	lw	a5,0(s0)
    46fe:	b7d9                	j	46c4 <validate+0xe>

00004700 <mem_cpy.part.0>:
static void mem_cpy (void* dst, const void* src, UINT cnt)
    4700:	4781                	li	a5,0
			*d++ = *s++;
    4702:	00f58733          	add	a4,a1,a5
    4706:	00074683          	lbu	a3,0(a4)
    470a:	00f50733          	add	a4,a0,a5
    470e:	0785                	addi	a5,a5,1
    4710:	00d70023          	sb	a3,0(a4)
		} while (--cnt);
    4714:	fef617e3          	bne	a2,a5,4702 <mem_cpy.part.0+0x2>
}
    4718:	8082                	ret

0000471a <ld_clust.isra.1>:
	rv = rv << 8 | ptr[0];
    471a:	01b5c783          	lbu	a5,27(a1)
    471e:	01a5c703          	lbu	a4,26(a1)
    4722:	07a2                	slli	a5,a5,0x8
	cl = ld_word(dir + DIR_FstClusLO);
    4724:	8fd9                	or	a5,a5,a4
	if (fs->fs_type == FS_FAT32) {
    4726:	470d                	li	a4,3
    4728:	00e51a63          	bne	a0,a4,473c <ld_clust.isra.1+0x22>
	rv = rv << 8 | ptr[0];
    472c:	0155c703          	lbu	a4,21(a1)
    4730:	0145c683          	lbu	a3,20(a1)
    4734:	0722                	slli	a4,a4,0x8
		cl |= (DWORD)ld_word(dir + DIR_FstClusHI) << 16;
    4736:	8f55                	or	a4,a4,a3
    4738:	0742                	slli	a4,a4,0x10
    473a:	8fd9                	or	a5,a5,a4
}
    473c:	853e                	mv	a0,a5
    473e:	8082                	ret

00004740 <st_clust.isra.2>:
	*ptr++ = (BYTE)val; val >>= 8;
    4740:	01061793          	slli	a5,a2,0x10
    4744:	83c1                	srli	a5,a5,0x10
    4746:	83a1                	srli	a5,a5,0x8
	*ptr++ = (BYTE)val;
    4748:	00f58da3          	sb	a5,27(a1)
	*ptr++ = (BYTE)val; val >>= 8;
    474c:	00c58d23          	sb	a2,26(a1)
	if (fs->fs_type == FS_FAT32) {
    4750:	00054703          	lbu	a4,0(a0)
    4754:	478d                	li	a5,3
    4756:	00f71863          	bne	a4,a5,4766 <st_clust.isra.2+0x26>
		st_word(dir + DIR_FstClusHI, (WORD)(cl >> 16));
    475a:	8241                	srli	a2,a2,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    475c:	00c58a23          	sb	a2,20(a1)
    4760:	8221                	srli	a2,a2,0x8
	*ptr++ = (BYTE)val;
    4762:	00c58aa3          	sb	a2,21(a1)
}
    4766:	8082                	ret

00004768 <sync_window.part.4>:
static FRESULT sync_window (	/* Returns FR_OK or FR_DISK_ERR */
    4768:	1141                	addi	sp,sp,-16
    476a:	c422                	sw	s0,8(sp)
    476c:	c226                	sw	s1,4(sp)
    476e:	c606                	sw	ra,12(sp)
		if (disk_write(fs->pdrv, fs->win, fs->winsect, 1) == RES_OK) {	/* Write it back into the volume */
    4770:	03050713          	addi	a4,a0,48
    4774:	5550                	lw	a2,44(a0)
static FRESULT sync_window (	/* Returns FR_OK or FR_DISK_ERR */
    4776:	842a                	mv	s0,a0
		if (disk_write(fs->pdrv, fs->win, fs->winsect, 1) == RES_OK) {	/* Write it back into the volume */
    4778:	00154503          	lbu	a0,1(a0)
    477c:	4685                	li	a3,1
    477e:	85ba                	mv	a1,a4
    4780:	c03a                	sw	a4,0(sp)
    4782:	295010ef          	jal	ra,6216 <disk_write>
			res = FR_DISK_ERR;
    4786:	4485                	li	s1,1
		if (disk_write(fs->pdrv, fs->win, fs->winsect, 1) == RES_OK) {	/* Write it back into the volume */
    4788:	e905                	bnez	a0,47b8 <sync_window.part.4+0x50>
			if (fs->winsect - fs->fatbase < fs->fsize) {	/* Is it in the 1st FAT? */
    478a:	544c                	lw	a1,44(s0)
    478c:	501c                	lw	a5,32(s0)
    478e:	4c10                	lw	a2,24(s0)
			fs->wflag = 0;	/* Clear window dirty flag */
    4790:	000401a3          	sb	zero,3(s0)
			if (fs->winsect - fs->fatbase < fs->fsize) {	/* Is it in the 1st FAT? */
    4794:	40f587b3          	sub	a5,a1,a5
	FRESULT res = FR_OK;
    4798:	4481                	li	s1,0
			if (fs->winsect - fs->fatbase < fs->fsize) {	/* Is it in the 1st FAT? */
    479a:	00c7ff63          	bgeu	a5,a2,47b8 <sync_window.part.4+0x50>
				if (fs->n_fats == 2) disk_write(fs->pdrv, fs->win, fs->winsect + fs->fsize, 1);	/* Reflect it to 2nd FAT if needed */
    479e:	00244683          	lbu	a3,2(s0)
    47a2:	4789                	li	a5,2
    47a4:	4702                	lw	a4,0(sp)
    47a6:	00f69963          	bne	a3,a5,47b8 <sync_window.part.4+0x50>
    47aa:	00144503          	lbu	a0,1(s0)
    47ae:	962e                	add	a2,a2,a1
    47b0:	4685                	li	a3,1
    47b2:	85ba                	mv	a1,a4
    47b4:	263010ef          	jal	ra,6216 <disk_write>
}
    47b8:	40b2                	lw	ra,12(sp)
    47ba:	4422                	lw	s0,8(sp)
    47bc:	8526                	mv	a0,s1
    47be:	4492                	lw	s1,4(sp)
    47c0:	0141                	addi	sp,sp,16
    47c2:	8082                	ret

000047c4 <move_window>:
	if (sect != fs->winsect) {	/* Window offset changed? */
    47c4:	555c                	lw	a5,44(a0)
    47c6:	04b78263          	beq	a5,a1,480a <move_window+0x46>
{
    47ca:	1151                	addi	sp,sp,-12
    47cc:	c222                	sw	s0,4(sp)
    47ce:	c026                	sw	s1,0(sp)
    47d0:	c406                	sw	ra,8(sp)
	if (fs->wflag) {	/* Is the disk access window dirty? */
    47d2:	00354783          	lbu	a5,3(a0)
    47d6:	842a                	mv	s0,a0
    47d8:	84ae                	mv	s1,a1
    47da:	ef99                	bnez	a5,47f8 <move_window+0x34>
			if (disk_read(fs->pdrv, fs->win, sect, 1) != RES_OK) {
    47dc:	00144503          	lbu	a0,1(s0)
    47e0:	4685                	li	a3,1
    47e2:	8626                	mv	a2,s1
    47e4:	03040593          	addi	a1,s0,48
    47e8:	1bd010ef          	jal	ra,61a4 <disk_read>
		res = sync_window(fs);		/* Flush the window */
    47ec:	4781                	li	a5,0
			if (disk_read(fs->pdrv, fs->win, sect, 1) != RES_OK) {
    47ee:	c119                	beqz	a0,47f4 <move_window+0x30>
				res = FR_DISK_ERR;
    47f0:	4785                	li	a5,1
				sect = (LBA_t)0 - 1;	/* Invalidate window if read data is not valid */
    47f2:	54fd                	li	s1,-1
			fs->winsect = sect;
    47f4:	d444                	sw	s1,44(s0)
	return res;
    47f6:	a021                	j	47fe <move_window+0x3a>
    47f8:	3f85                	jal	4768 <sync_window.part.4>
    47fa:	87aa                	mv	a5,a0
		if (res == FR_OK) {			/* Fill sector window with new data */
    47fc:	d165                	beqz	a0,47dc <move_window+0x18>
}
    47fe:	40a2                	lw	ra,8(sp)
    4800:	4412                	lw	s0,4(sp)
    4802:	4482                	lw	s1,0(sp)
    4804:	853e                	mv	a0,a5
    4806:	0131                	addi	sp,sp,12
    4808:	8082                	ret
	FRESULT res = FR_OK;
    480a:	4781                	li	a5,0
}
    480c:	853e                	mv	a0,a5
    480e:	8082                	ret

00004810 <check_fs>:
{
    4810:	1151                	addi	sp,sp,-12
    4812:	c222                	sw	s0,4(sp)
    4814:	c406                	sw	ra,8(sp)
	fs->wflag = 0; fs->winsect = (LBA_t)0 - 1;		/* Invaidate window */
    4816:	57fd                	li	a5,-1
    4818:	000501a3          	sb	zero,3(a0)
    481c:	d55c                	sw	a5,44(a0)
{
    481e:	842a                	mv	s0,a0
	if (move_window(fs, sect) != FR_OK) return 4;	/* Load the boot sector */
    4820:	3755                	jal	47c4 <move_window>
    4822:	e179                	bnez	a0,48e8 <check_fs+0xd8>
	rv = rv << 8 | ptr[0];
    4824:	22f44703          	lbu	a4,559(s0)
    4828:	22e44783          	lbu	a5,558(s0)
	if (b == 0xEB || b == 0xE9 || b == 0xE8) {	/* Valid JumpBoot code? (short jump, near jump or near call) */
    482c:	0eb00693          	li	a3,235
	rv = rv << 8 | ptr[0];
    4830:	0722                	slli	a4,a4,0x8
    4832:	8f5d                	or	a4,a4,a5
	b = fs->win[BS_JmpBoot];
    4834:	03044783          	lbu	a5,48(s0)
	if (b == 0xEB || b == 0xE9 || b == 0xE8) {	/* Valid JumpBoot code? (short jump, near jump or near call) */
    4838:	00d78863          	beq	a5,a3,4848 <check_fs+0x38>
    483c:	07e1                	addi	a5,a5,24
    483e:	0ff7f793          	andi	a5,a5,255
    4842:	4685                	li	a3,1
    4844:	08f6e463          	bltu	a3,a5,48cc <check_fs+0xbc>
		if (sign == 0xAA55 && !mem_cmp(fs->win + BS_FilSysType32, "FAT32   ", 8)) return 0;	/* It is an FAT32 VBR */
    4848:	67ad                	lui	a5,0xb
    484a:	a5578793          	addi	a5,a5,-1451 # aa55 <__ctor_end__+0x21c5>
    484e:	02f71363          	bne	a4,a5,4874 <check_fs+0x64>
	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
    4852:	67a1                	lui	a5,0x8
		if (sign == 0xAA55 && !mem_cmp(fs->win + BS_FilSysType32, "FAT32   ", 8)) return 0;	/* It is an FAT32 VBR */
    4854:	08240613          	addi	a2,s0,130
	int r = 0;
    4858:	08a40593          	addi	a1,s0,138
	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
    485c:	10c78793          	addi	a5,a5,268 # 810c <asc2_1608+0x5f0>
		r = *d++ - *s++;
    4860:	0605                	addi	a2,a2,1
    4862:	0785                	addi	a5,a5,1
    4864:	fff64683          	lbu	a3,-1(a2)
    4868:	fff7c503          	lbu	a0,-1(a5)
    486c:	8e89                	sub	a3,a3,a0
	} while (--cnt && r == 0);
    486e:	06b60763          	beq	a2,a1,48dc <check_fs+0xcc>
    4872:	d6fd                	beqz	a3,4860 <check_fs+0x50>
	rv = rv << 8 | ptr[0];
    4874:	03c44783          	lbu	a5,60(s0)
    4878:	03b44683          	lbu	a3,59(s0)
    487c:	07a2                	slli	a5,a5,0x8
    487e:	8fd5                	or	a5,a5,a3
		if ((w & (w - 1)) == 0 && w >= FF_MIN_SS && w <= FF_MAX_SS) {	/* Properness of sector size */
    4880:	fff78693          	addi	a3,a5,-1
    4884:	8efd                	and	a3,a3,a5
    4886:	e2b9                	bnez	a3,48cc <check_fs+0xbc>
    4888:	20000693          	li	a3,512
    488c:	04d79063          	bne	a5,a3,48cc <check_fs+0xbc>
			b = fs->win[BPB_SecPerClus];
    4890:	03d44683          	lbu	a3,61(s0)
			if (b != 0 && (b & (b - 1)) == 0						/* Properness of cluster size */
    4894:	ce85                	beqz	a3,48cc <check_fs+0xbc>
    4896:	fff68793          	addi	a5,a3,-1
    489a:	8ff5                	and	a5,a5,a3
    489c:	eb85                	bnez	a5,48cc <check_fs+0xbc>
			&& (fs->win[BPB_NumFATs] == 1 || fs->win[BPB_NumFATs] == 2)	/* Properness of number of FATs */
    489e:	04044783          	lbu	a5,64(s0)
    48a2:	4685                	li	a3,1
    48a4:	17fd                	addi	a5,a5,-1
    48a6:	0ff7f793          	andi	a5,a5,255
    48aa:	02f6e163          	bltu	a3,a5,48cc <check_fs+0xbc>
	rv = rv << 8 | ptr[0];
    48ae:	04244783          	lbu	a5,66(s0)
    48b2:	04144683          	lbu	a3,65(s0)
    48b6:	07a2                	slli	a5,a5,0x8
    48b8:	8fd5                	or	a5,a5,a3
			&& ld_word(fs->win + BPB_RootEntCnt) != 0				/* Properness of root entry count */
    48ba:	cb89                	beqz	a5,48cc <check_fs+0xbc>
	rv = rv << 8 | ptr[0];
    48bc:	04744783          	lbu	a5,71(s0)
    48c0:	04644683          	lbu	a3,70(s0)
		if (sign == 0xAA55 && !mem_cmp(fs->win + BS_FilSysType32, "FAT32   ", 8)) return 0;	/* It is an FAT32 VBR */
    48c4:	4501                	li	a0,0
	rv = rv << 8 | ptr[0];
    48c6:	07a2                	slli	a5,a5,0x8
    48c8:	8fd5                	or	a5,a5,a3
			&& ld_word(fs->win + BPB_FATSz16) != 0) {				/* Properness of FAT size */
    48ca:	eb99                	bnez	a5,48e0 <check_fs+0xd0>
	return sign == 0xAA55 ? 2 : 3;	/* Not an FAT VBR (valid or invalid BS) */
    48cc:	67ad                	lui	a5,0xb
    48ce:	a5578793          	addi	a5,a5,-1451 # aa55 <__ctor_end__+0x21c5>
    48d2:	4509                	li	a0,2
    48d4:	00f70663          	beq	a4,a5,48e0 <check_fs+0xd0>
    48d8:	450d                	li	a0,3
    48da:	a019                	j	48e0 <check_fs+0xd0>
		if (sign == 0xAA55 && !mem_cmp(fs->win + BS_FilSysType32, "FAT32   ", 8)) return 0;	/* It is an FAT32 VBR */
    48dc:	4501                	li	a0,0
    48de:	fad9                	bnez	a3,4874 <check_fs+0x64>
}
    48e0:	40a2                	lw	ra,8(sp)
    48e2:	4412                	lw	s0,4(sp)
    48e4:	0131                	addi	sp,sp,12
    48e6:	8082                	ret
	if (move_window(fs, sect) != FR_OK) return 4;	/* Load the boot sector */
    48e8:	4511                	li	a0,4
    48ea:	bfdd                	j	48e0 <check_fs+0xd0>

000048ec <put_fat>:
{
    48ec:	1121                	addi	sp,sp,-24
    48ee:	c626                	sw	s1,12(sp)
    48f0:	ca06                	sw	ra,20(sp)
    48f2:	c822                	sw	s0,16(sp)
	if (clst >= 2 && clst < fs->n_fatent) {	/* Check if in valid range */
    48f4:	4485                	li	s1,1
	FRESULT res = FR_INT_ERR;
    48f6:	4689                	li	a3,2
	if (clst >= 2 && clst < fs->n_fatent) {	/* Check if in valid range */
    48f8:	0ab4f863          	bgeu	s1,a1,49a8 <put_fat+0xbc>
    48fc:	495c                	lw	a5,20(a0)
	FRESULT res = FR_INT_ERR;
    48fe:	4689                	li	a3,2
	if (clst >= 2 && clst < fs->n_fatent) {	/* Check if in valid range */
    4900:	0af5f463          	bgeu	a1,a5,49a8 <put_fat+0xbc>
    4904:	8432                	mv	s0,a2
		switch (fs->fs_type) {
    4906:	00054603          	lbu	a2,0(a0)
    490a:	87ae                	mv	a5,a1
    490c:	0ad60b63          	beq	a2,a3,49c2 <put_fat+0xd6>
    4910:	468d                	li	a3,3
    4912:	0ed60263          	beq	a2,a3,49f6 <put_fat+0x10a>
	FRESULT res = FR_INT_ERR;
    4916:	4689                	li	a3,2
    4918:	08961863          	bne	a2,s1,49a8 <put_fat+0xbc>
			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
    491c:	5114                	lw	a3,32(a0)
			bc = (UINT)clst; bc += bc / 2;	/* bc: byte offset of the entry */
    491e:	0015d493          	srli	s1,a1,0x1
    4922:	94ae                	add	s1,s1,a1
    4924:	c22e                	sw	a1,4(sp)
			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
    4926:	0094d593          	srli	a1,s1,0x9
    492a:	95b6                	add	a1,a1,a3
    492c:	c02a                	sw	a0,0(sp)
    492e:	3d59                	jal	47c4 <move_window>
    4930:	86aa                	mv	a3,a0
			if (res != FR_OK) break;
    4932:	e93d                	bnez	a0,49a8 <put_fat+0xbc>
			p = fs->win + bc++ % SS(fs);
    4934:	4702                	lw	a4,0(sp)
			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;		/* Update 1st byte */
    4936:	4792                	lw	a5,4(sp)
			p = fs->win + bc++ % SS(fs);
    4938:	00148313          	addi	t1,s1,1
    493c:	03070613          	addi	a2,a4,48
    4940:	1ff4f493          	andi	s1,s1,511
    4944:	009605b3          	add	a1,a2,s1
			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;		/* Update 1st byte */
    4948:	0017f493          	andi	s1,a5,1
    494c:	0ff47793          	andi	a5,s0,255
    4950:	cc89                	beqz	s1,496a <put_fat+0x7e>
    4952:	0005c783          	lbu	a5,0(a1)
    4956:	6505                	lui	a0,0x1
    4958:	1541                	addi	a0,a0,-16
    495a:	00f7f693          	andi	a3,a5,15
    495e:	00441793          	slli	a5,s0,0x4
    4962:	8fe9                	and	a5,a5,a0
    4964:	8fd5                	or	a5,a5,a3
    4966:	0ff7f793          	andi	a5,a5,255
    496a:	00f58023          	sb	a5,0(a1)
			fs->wflag = 1;
    496e:	4785                	li	a5,1
    4970:	00f701a3          	sb	a5,3(a4)
			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
    4974:	531c                	lw	a5,32(a4)
    4976:	00935593          	srli	a1,t1,0x9
    497a:	853a                	mv	a0,a4
    497c:	95be                	add	a1,a1,a5
    497e:	c432                	sw	a2,8(sp)
    4980:	c21a                	sw	t1,4(sp)
    4982:	c03a                	sw	a4,0(sp)
    4984:	3581                	jal	47c4 <move_window>
    4986:	86aa                	mv	a3,a0
			if (res != FR_OK) break;
    4988:	e105                	bnez	a0,49a8 <put_fat+0xbc>
			p = fs->win + bc % SS(fs);
    498a:	4312                	lw	t1,4(sp)
    498c:	4622                	lw	a2,8(sp)
			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));	/* Update 2nd byte */
    498e:	4702                	lw	a4,0(sp)
			p = fs->win + bc % SS(fs);
    4990:	1ff37313          	andi	t1,t1,511
    4994:	961a                	add	a2,a2,t1
			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));	/* Update 2nd byte */
    4996:	cc99                	beqz	s1,49b4 <put_fat+0xc8>
    4998:	8011                	srli	s0,s0,0x4
    499a:	0ff47413          	andi	s0,s0,255
    499e:	00860023          	sb	s0,0(a2)
			fs->wflag = 1;
    49a2:	4785                	li	a5,1
    49a4:	00f701a3          	sb	a5,3(a4)
}
    49a8:	40d2                	lw	ra,20(sp)
    49aa:	4442                	lw	s0,16(sp)
    49ac:	44b2                	lw	s1,12(sp)
    49ae:	8536                	mv	a0,a3
    49b0:	0161                	addi	sp,sp,24
    49b2:	8082                	ret
			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));	/* Update 2nd byte */
    49b4:	00064783          	lbu	a5,0(a2)
    49b8:	8021                	srli	s0,s0,0x8
    49ba:	883d                	andi	s0,s0,15
    49bc:	9bc1                	andi	a5,a5,-16
    49be:	8c5d                	or	s0,s0,a5
    49c0:	bff9                	j	499e <put_fat+0xb2>
			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)));
    49c2:	5114                	lw	a3,32(a0)
    49c4:	81a1                	srli	a1,a1,0x8
    49c6:	c23e                	sw	a5,4(sp)
    49c8:	95b6                	add	a1,a1,a3
    49ca:	c02a                	sw	a0,0(sp)
    49cc:	3be5                	jal	47c4 <move_window>
    49ce:	86aa                	mv	a3,a0
			if (res != FR_OK) break;
    49d0:	fd61                	bnez	a0,49a8 <put_fat+0xbc>
			st_word(fs->win + clst * 2 % SS(fs), (WORD)val);	/* Simple WORD array */
    49d2:	4792                	lw	a5,4(sp)
    49d4:	4702                	lw	a4,0(sp)
    49d6:	0786                	slli	a5,a5,0x1
    49d8:	03070613          	addi	a2,a4,48
    49dc:	1fe7f793          	andi	a5,a5,510
    49e0:	97b2                	add	a5,a5,a2
	*ptr++ = (BYTE)val; val >>= 8;
    49e2:	00878023          	sb	s0,0(a5)
    49e6:	0442                	slli	s0,s0,0x10
    49e8:	8041                	srli	s0,s0,0x10
    49ea:	8021                	srli	s0,s0,0x8
	*ptr++ = (BYTE)val;
    49ec:	008780a3          	sb	s0,1(a5)
			fs->wflag = 1;
    49f0:	009701a3          	sb	s1,3(a4)
			break;
    49f4:	bf55                	j	49a8 <put_fat+0xbc>
			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
    49f6:	5114                	lw	a3,32(a0)
    49f8:	819d                	srli	a1,a1,0x7
    49fa:	c23e                	sw	a5,4(sp)
    49fc:	95b6                	add	a1,a1,a3
    49fe:	c02a                	sw	a0,0(sp)
    4a00:	dc5ff0ef          	jal	ra,47c4 <move_window>
    4a04:	86aa                	mv	a3,a0
			if (res != FR_OK) break;
    4a06:	4702                	lw	a4,0(sp)
    4a08:	4792                	lw	a5,4(sp)
    4a0a:	fd59                	bnez	a0,49a8 <put_fat+0xbc>
				val = (val & 0x0FFFFFFF) | (ld_dword(fs->win + clst * 4 % SS(fs)) & 0xF0000000);
    4a0c:	078a                	slli	a5,a5,0x2
    4a0e:	03070613          	addi	a2,a4,48
    4a12:	1fc7f793          	andi	a5,a5,508
    4a16:	97b2                	add	a5,a5,a2
    4a18:	c42a                	sw	a0,8(sp)
    4a1a:	853e                	mv	a0,a5
    4a1c:	c23a                	sw	a4,4(sp)
    4a1e:	c03e                	sw	a5,0(sp)
    4a20:	c1fff0ef          	jal	ra,463e <ld_dword>
    4a24:	f0000637          	lui	a2,0xf0000
    4a28:	0412                	slli	s0,s0,0x4
	*ptr++ = (BYTE)val; val >>= 8;
    4a2a:	4782                	lw	a5,0(sp)
				val = (val & 0x0FFFFFFF) | (ld_dword(fs->win + clst * 4 % SS(fs)) & 0xF0000000);
    4a2c:	8d71                	and	a0,a0,a2
    4a2e:	8011                	srli	s0,s0,0x4
    4a30:	8c49                	or	s0,s0,a0
	*ptr++ = (BYTE)val; val >>= 8;
    4a32:	00845613          	srli	a2,s0,0x8
			fs->wflag = 1;
    4a36:	4712                	lw	a4,4(sp)
	*ptr++ = (BYTE)val; val >>= 8;
    4a38:	00878023          	sb	s0,0(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    4a3c:	00c780a3          	sb	a2,1(a5)
    4a40:	01045613          	srli	a2,s0,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    4a44:	8061                	srli	s0,s0,0x18
    4a46:	00c78123          	sb	a2,2(a5)
	*ptr++ = (BYTE)val;
    4a4a:	008781a3          	sb	s0,3(a5)
			fs->wflag = 1;
    4a4e:	009701a3          	sb	s1,3(a4)
			break;
    4a52:	46a2                	lw	a3,8(sp)
    4a54:	bf91                	j	49a8 <put_fat+0xbc>

00004a56 <get_fat.isra.7>:
	if (clst < 2 || clst >= fs->n_fatent) {	/* Check if in valid range */
    4a56:	4785                	li	a5,1
    4a58:	0cb7fe63          	bgeu	a5,a1,4b34 <get_fat.isra.7+0xde>
    4a5c:	4958                	lw	a4,20(a0)
static DWORD get_fat (		/* 0xFFFFFFFF:Disk error, 1:Internal error, 2..0x7FFFFFFF:Cluster status */
    4a5e:	1131                	addi	sp,sp,-20
    4a60:	c426                	sw	s1,8(sp)
    4a62:	c806                	sw	ra,16(sp)
    4a64:	c622                	sw	s0,12(sp)
    4a66:	84aa                	mv	s1,a0
	if (clst < 2 || clst >= fs->n_fatent) {	/* Check if in valid range */
    4a68:	02e5fa63          	bgeu	a1,a4,4a9c <get_fat.isra.7+0x46>
		switch (fs->fs_type) {
    4a6c:	00054703          	lbu	a4,0(a0) # 1000 <__divdf3+0x158>
    4a70:	4689                	li	a3,2
    4a72:	842e                	mv	s0,a1
    4a74:	06d70b63          	beq	a4,a3,4aea <get_fat.isra.7+0x94>
    4a78:	468d                	li	a3,3
    4a7a:	08d70b63          	beq	a4,a3,4b10 <get_fat.isra.7+0xba>
    4a7e:	00f71f63          	bne	a4,a5,4a9c <get_fat.isra.7+0x46>
			bc = (UINT)clst; bc += bc / 2;
    4a82:	0015d793          	srli	a5,a1,0x1
			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
    4a86:	5118                	lw	a4,32(a0)
			bc = (UINT)clst; bc += bc / 2;
    4a88:	97ae                	add	a5,a5,a1
			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
    4a8a:	0097d593          	srli	a1,a5,0x9
    4a8e:	95ba                	add	a1,a1,a4
    4a90:	c03e                	sw	a5,0(sp)
    4a92:	d33ff0ef          	jal	ra,47c4 <move_window>
    4a96:	4782                	lw	a5,0(sp)
    4a98:	c901                	beqz	a0,4aa8 <get_fat.isra.7+0x52>
		val = 0xFFFFFFFF;	/* Default value falls on disk error */
    4a9a:	57fd                	li	a5,-1
}
    4a9c:	40c2                	lw	ra,16(sp)
    4a9e:	4432                	lw	s0,12(sp)
    4aa0:	44a2                	lw	s1,8(sp)
    4aa2:	853e                	mv	a0,a5
    4aa4:	0151                	addi	sp,sp,20
    4aa6:	8082                	ret
			wc = fs->win[bc++ % SS(fs)];		/* Get 1st byte of the entry */
    4aa8:	00178713          	addi	a4,a5,1
    4aac:	1ff7f793          	andi	a5,a5,511
    4ab0:	97a6                	add	a5,a5,s1
    4ab2:	0307c683          	lbu	a3,48(a5)
			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
    4ab6:	509c                	lw	a5,32(s1)
    4ab8:	00975593          	srli	a1,a4,0x9
    4abc:	8526                	mv	a0,s1
    4abe:	95be                	add	a1,a1,a5
			wc = fs->win[bc++ % SS(fs)];		/* Get 1st byte of the entry */
    4ac0:	c236                	sw	a3,4(sp)
			if (move_window(fs, fs->fatbase + (bc / SS(fs))) != FR_OK) break;
    4ac2:	c03a                	sw	a4,0(sp)
    4ac4:	d01ff0ef          	jal	ra,47c4 <move_window>
    4ac8:	f969                	bnez	a0,4a9a <get_fat.isra.7+0x44>
			wc |= fs->win[bc % SS(fs)] << 8;	/* Merge 2nd byte of the entry */
    4aca:	4702                	lw	a4,0(sp)
    4acc:	4692                	lw	a3,4(sp)
			val = (clst & 1) ? (wc >> 4) : (wc & 0xFFF);	/* Adjust bit position */
    4ace:	8805                	andi	s0,s0,1
			wc |= fs->win[bc % SS(fs)] << 8;	/* Merge 2nd byte of the entry */
    4ad0:	1ff77713          	andi	a4,a4,511
    4ad4:	94ba                	add	s1,s1,a4
    4ad6:	0304c783          	lbu	a5,48(s1)
    4ada:	07a2                	slli	a5,a5,0x8
    4adc:	8fd5                	or	a5,a5,a3
			val = (clst & 1) ? (wc >> 4) : (wc & 0xFFF);	/* Adjust bit position */
    4ade:	c019                	beqz	s0,4ae4 <get_fat.isra.7+0x8e>
			val = ld_dword(fs->win + clst * 4 % SS(fs)) & 0x0FFFFFFF;	/* Simple DWORD array but mask out upper 4 bits */
    4ae0:	8391                	srli	a5,a5,0x4
			break;
    4ae2:	bf6d                	j	4a9c <get_fat.isra.7+0x46>
			val = (clst & 1) ? (wc >> 4) : (wc & 0xFFF);	/* Adjust bit position */
    4ae4:	07d2                	slli	a5,a5,0x14
    4ae6:	83d1                	srli	a5,a5,0x14
    4ae8:	bf55                	j	4a9c <get_fat.isra.7+0x46>
			if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 2))) != FR_OK) break;
    4aea:	511c                	lw	a5,32(a0)
    4aec:	81a1                	srli	a1,a1,0x8
    4aee:	95be                	add	a1,a1,a5
    4af0:	cd5ff0ef          	jal	ra,47c4 <move_window>
    4af4:	f15d                	bnez	a0,4a9a <get_fat.isra.7+0x44>
			val = ld_word(fs->win + clst * 2 % SS(fs));		/* Simple WORD array */
    4af6:	0406                	slli	s0,s0,0x1
    4af8:	03048493          	addi	s1,s1,48
    4afc:	1fe47413          	andi	s0,s0,510
    4b00:	94a2                	add	s1,s1,s0
	rv = rv << 8 | ptr[0];
    4b02:	0014c783          	lbu	a5,1(s1)
    4b06:	0004c703          	lbu	a4,0(s1)
    4b0a:	07a2                	slli	a5,a5,0x8
			val = ld_word(fs->win + clst * 2 % SS(fs));		/* Simple WORD array */
    4b0c:	8fd9                	or	a5,a5,a4
			break;
    4b0e:	b779                	j	4a9c <get_fat.isra.7+0x46>
			if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4))) != FR_OK) break;
    4b10:	511c                	lw	a5,32(a0)
    4b12:	819d                	srli	a1,a1,0x7
    4b14:	95be                	add	a1,a1,a5
    4b16:	cafff0ef          	jal	ra,47c4 <move_window>
    4b1a:	f141                	bnez	a0,4a9a <get_fat.isra.7+0x44>
			val = ld_dword(fs->win + clst * 4 % SS(fs)) & 0x0FFFFFFF;	/* Simple DWORD array but mask out upper 4 bits */
    4b1c:	00241513          	slli	a0,s0,0x2
    4b20:	03048493          	addi	s1,s1,48
    4b24:	1fc57513          	andi	a0,a0,508
    4b28:	9526                	add	a0,a0,s1
    4b2a:	b15ff0ef          	jal	ra,463e <ld_dword>
    4b2e:	00451793          	slli	a5,a0,0x4
    4b32:	b77d                	j	4ae0 <get_fat.isra.7+0x8a>
		val = 1;	/* Internal error */
    4b34:	4785                	li	a5,1
}
    4b36:	853e                	mv	a0,a5
    4b38:	8082                	ret

00004b3a <create_chain>:
{
    4b3a:	1121                	addi	sp,sp,-24
    4b3c:	c822                	sw	s0,16(sp)
    4b3e:	ca06                	sw	ra,20(sp)
    4b40:	c626                	sw	s1,12(sp)
    4b42:	c22a                	sw	a0,4(sp)
    4b44:	c02e                	sw	a1,0(sp)
	FATFS *fs = obj->fs;
    4b46:	4100                	lw	s0,0(a0)
	if (clst == 0) {	/* Create a new chain */
    4b48:	e981                	bnez	a1,4b58 <create_chain+0x1e>
		scl = fs->last_clst;				/* Suggested cluster to start to find */
    4b4a:	4454                	lw	a3,12(s0)
		if (scl == 0 || scl >= fs->n_fatent) scl = 1;
    4b4c:	c681                	beqz	a3,4b54 <create_chain+0x1a>
    4b4e:	485c                	lw	a5,20(s0)
    4b50:	02f6e863          	bltu	a3,a5,4b80 <create_chain+0x46>
    4b54:	4685                	li	a3,1
    4b56:	a02d                	j	4b80 <create_chain+0x46>
		cs = get_fat(obj, clst);			/* Check the cluster status */
    4b58:	8522                	mv	a0,s0
    4b5a:	3df5                	jal	4a56 <get_fat.isra.7>
		if (cs < 2) return 1;				/* Test for insanity */
    4b5c:	4685                	li	a3,1
		cs = get_fat(obj, clst);			/* Check the cluster status */
    4b5e:	84aa                	mv	s1,a0
		if (cs < 2) return 1;				/* Test for insanity */
    4b60:	00a6e963          	bltu	a3,a0,4b72 <create_chain+0x38>
    4b64:	4485                	li	s1,1
}
    4b66:	40d2                	lw	ra,20(sp)
    4b68:	4442                	lw	s0,16(sp)
    4b6a:	8526                	mv	a0,s1
    4b6c:	44b2                	lw	s1,12(sp)
    4b6e:	0161                	addi	sp,sp,24
    4b70:	8082                	ret
		if (cs == 0xFFFFFFFF) return cs;	/* Test for disk error */
    4b72:	56fd                	li	a3,-1
    4b74:	0ad50f63          	beq	a0,a3,4c32 <create_chain+0xf8>
		if (cs < fs->n_fatent) return cs;	/* It is already followed by next cluster */
    4b78:	4854                	lw	a3,20(s0)
    4b7a:	fed566e3          	bltu	a0,a3,4b66 <create_chain+0x2c>
    4b7e:	4682                	lw	a3,0(sp)
	if (fs->free_clst == 0) return 0;		/* No free cluster */
    4b80:	481c                	lw	a5,16(s0)
    4b82:	e399                	bnez	a5,4b88 <create_chain+0x4e>
    4b84:	4481                	li	s1,0
    4b86:	b7c5                	j	4b66 <create_chain+0x2c>
		if (scl == clst) {						/* Stretching an existing chain? */
    4b88:	4782                	lw	a5,0(sp)
    4b8a:	02f69c63          	bne	a3,a5,4bc2 <create_chain+0x88>
			if (ncl >= fs->n_fatent) ncl = 2;
    4b8e:	4850                	lw	a2,20(s0)
    4b90:	00168493          	addi	s1,a3,1
    4b94:	00c4e363          	bltu	s1,a2,4b9a <create_chain+0x60>
    4b98:	4489                	li	s1,2
			cs = get_fat(obj, ncl);				/* Get next cluster status */
    4b9a:	4792                	lw	a5,4(sp)
    4b9c:	85a6                	mv	a1,s1
    4b9e:	c436                	sw	a3,8(sp)
    4ba0:	4388                	lw	a0,0(a5)
    4ba2:	3d55                	jal	4a56 <get_fat.isra.7>
			if (cs == 1 || cs == 0xFFFFFFFF) return cs;	/* Test for error */
    4ba4:	4605                	li	a2,1
    4ba6:	fac50fe3          	beq	a0,a2,4b64 <create_chain+0x2a>
    4baa:	55fd                	li	a1,-1
    4bac:	08b50363          	beq	a0,a1,4c32 <create_chain+0xf8>
			if (cs != 0) {						/* Not free? */
    4bb0:	46a2                	lw	a3,8(sp)
    4bb2:	c129                	beqz	a0,4bf4 <create_chain+0xba>
				cs = fs->last_clst;				/* Start at suggested cluster if it is valid */
    4bb4:	445c                	lw	a5,12(s0)
				if (cs >= 2 && cs < fs->n_fatent) scl = cs;
    4bb6:	00f67663          	bgeu	a2,a5,4bc2 <create_chain+0x88>
    4bba:	4850                	lw	a2,20(s0)
    4bbc:	00c7f363          	bgeu	a5,a2,4bc2 <create_chain+0x88>
    4bc0:	86be                	mv	a3,a5
    4bc2:	84b6                	mv	s1,a3
				if (ncl >= fs->n_fatent) {		/* Check wrap-around */
    4bc4:	4850                	lw	a2,20(s0)
				ncl++;							/* Next cluster */
    4bc6:	0485                	addi	s1,s1,1
				if (ncl >= fs->n_fatent) {		/* Check wrap-around */
    4bc8:	00c4e663          	bltu	s1,a2,4bd4 <create_chain+0x9a>
					if (ncl > scl) return 0;	/* No free cluster found? */
    4bcc:	4785                	li	a5,1
    4bce:	fad7fbe3          	bgeu	a5,a3,4b84 <create_chain+0x4a>
					ncl = 2;
    4bd2:	4489                	li	s1,2
				cs = get_fat(obj, ncl);			/* Get the cluster status */
    4bd4:	4792                	lw	a5,4(sp)
    4bd6:	85a6                	mv	a1,s1
    4bd8:	c436                	sw	a3,8(sp)
    4bda:	4388                	lw	a0,0(a5)
    4bdc:	3dad                	jal	4a56 <get_fat.isra.7>
				if (cs == 0) break;				/* Found a free cluster? */
    4bde:	cd01                	beqz	a0,4bf6 <create_chain+0xbc>
				if (cs == 1 || cs == 0xFFFFFFFF) return cs;	/* Test for error */
    4be0:	4605                	li	a2,1
    4be2:	f8c501e3          	beq	a0,a2,4b64 <create_chain+0x2a>
    4be6:	567d                	li	a2,-1
    4be8:	04c50563          	beq	a0,a2,4c32 <create_chain+0xf8>
				if (ncl == scl) return 0;		/* No free cluster found? */
    4bec:	46a2                	lw	a3,8(sp)
    4bee:	fcd49be3          	bne	s1,a3,4bc4 <create_chain+0x8a>
    4bf2:	bf49                	j	4b84 <create_chain+0x4a>
		if (ncl == 0) {	/* The new cluster cannot be contiguous and find another fragment */
    4bf4:	d4f9                	beqz	s1,4bc2 <create_chain+0x88>
		res = put_fat(fs, ncl, 0xFFFFFFFF);		/* Mark the new cluster 'EOC' */
    4bf6:	567d                	li	a2,-1
    4bf8:	85a6                	mv	a1,s1
    4bfa:	8522                	mv	a0,s0
    4bfc:	cf1ff0ef          	jal	ra,48ec <put_fat>
		if (res == FR_OK && clst != 0) {
    4c00:	e515                	bnez	a0,4c2c <create_chain+0xf2>
    4c02:	4782                	lw	a5,0(sp)
    4c04:	ef91                	bnez	a5,4c20 <create_chain+0xe6>
		if (fs->free_clst <= fs->n_fatent - 2) fs->free_clst--;
    4c06:	4850                	lw	a2,20(s0)
    4c08:	4814                	lw	a3,16(s0)
		fs->last_clst = ncl;
    4c0a:	c444                	sw	s1,12(s0)
		if (fs->free_clst <= fs->n_fatent - 2) fs->free_clst--;
    4c0c:	1679                	addi	a2,a2,-2
    4c0e:	02d67463          	bgeu	a2,a3,4c36 <create_chain+0xfc>
		fs->fsi_flag |= 1;
    4c12:	00444683          	lbu	a3,4(s0)
    4c16:	0016e693          	ori	a3,a3,1
    4c1a:	00d40223          	sb	a3,4(s0)
    4c1e:	b7a1                	j	4b66 <create_chain+0x2c>
			res = put_fat(fs, clst, ncl);		/* Link it from the previous one if needed */
    4c20:	4582                	lw	a1,0(sp)
    4c22:	8626                	mv	a2,s1
    4c24:	8522                	mv	a0,s0
    4c26:	cc7ff0ef          	jal	ra,48ec <put_fat>
	if (res == FR_OK) {			/* Update FSINFO if function succeeded. */
    4c2a:	dd71                	beqz	a0,4c06 <create_chain+0xcc>
		ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;	/* Failed. Generate error status */
    4c2c:	4785                	li	a5,1
    4c2e:	f2f51be3          	bne	a0,a5,4b64 <create_chain+0x2a>
    4c32:	54fd                	li	s1,-1
    4c34:	bf0d                	j	4b66 <create_chain+0x2c>
		if (fs->free_clst <= fs->n_fatent - 2) fs->free_clst--;
    4c36:	16fd                	addi	a3,a3,-1
    4c38:	c814                	sw	a3,16(s0)
    4c3a:	bfe1                	j	4c12 <create_chain+0xd8>

00004c3c <remove_chain>:
{
    4c3c:	1131                	addi	sp,sp,-20
    4c3e:	c622                	sw	s0,12(sp)
    4c40:	c426                	sw	s1,8(sp)
    4c42:	c806                	sw	ra,16(sp)
    4c44:	c02a                	sw	a0,0(sp)
	if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Check if in valid range */
    4c46:	4705                	li	a4,1
{
    4c48:	84ae                	mv	s1,a1
	FATFS *fs = obj->fs;
    4c4a:	4100                	lw	s0,0(a0)
	if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Check if in valid range */
    4c4c:	06b77863          	bgeu	a4,a1,4cbc <remove_chain+0x80>
    4c50:	4858                	lw	a4,20(s0)
    4c52:	06e5f563          	bgeu	a1,a4,4cbc <remove_chain+0x80>
    4c56:	85b2                	mv	a1,a2
	if (pclst != 0 && (!FF_FS_EXFAT || fs->fs_type != FS_EXFAT || obj->stat != 2)) {
    4c58:	c611                	beqz	a2,4c64 <remove_chain+0x28>
		res = put_fat(fs, pclst, 0xFFFFFFFF);
    4c5a:	567d                	li	a2,-1
    4c5c:	8522                	mv	a0,s0
    4c5e:	c8fff0ef          	jal	ra,48ec <put_fat>
		if (res != FR_OK) return res;
    4c62:	e901                	bnez	a0,4c72 <remove_chain+0x36>
		nxt = get_fat(obj, clst);			/* Get cluster status */
    4c64:	4782                	lw	a5,0(sp)
    4c66:	85a6                	mv	a1,s1
    4c68:	4388                	lw	a0,0(a5)
    4c6a:	dedff0ef          	jal	ra,4a56 <get_fat.isra.7>
		if (nxt == 0) break;				/* Empty cluster? */
    4c6e:	e519                	bnez	a0,4c7c <remove_chain+0x40>
	return FR_OK;
    4c70:	4501                	li	a0,0
}
    4c72:	40c2                	lw	ra,16(sp)
    4c74:	4432                	lw	s0,12(sp)
    4c76:	44a2                	lw	s1,8(sp)
    4c78:	0151                	addi	sp,sp,20
    4c7a:	8082                	ret
		if (nxt == 1) return FR_INT_ERR;	/* Internal error? */
    4c7c:	4685                	li	a3,1
    4c7e:	02d50f63          	beq	a0,a3,4cbc <remove_chain+0x80>
		if (nxt == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error? */
    4c82:	56fd                	li	a3,-1
    4c84:	c22a                	sw	a0,4(sp)
    4c86:	02d50d63          	beq	a0,a3,4cc0 <remove_chain+0x84>
			res = put_fat(fs, clst, 0);		/* Mark the cluster 'free' on the FAT */
    4c8a:	4601                	li	a2,0
    4c8c:	85a6                	mv	a1,s1
    4c8e:	8522                	mv	a0,s0
    4c90:	c5dff0ef          	jal	ra,48ec <put_fat>
			if (res != FR_OK) return res;
    4c94:	fd79                	bnez	a0,4c72 <remove_chain+0x36>
		if (fs->free_clst < fs->n_fatent - 2) {	/* Update FSINFO */
    4c96:	4854                	lw	a3,20(s0)
    4c98:	481c                	lw	a5,16(s0)
    4c9a:	4712                	lw	a4,4(sp)
    4c9c:	ffe68613          	addi	a2,a3,-2
    4ca0:	00c7fa63          	bgeu	a5,a2,4cb4 <remove_chain+0x78>
			fs->free_clst++;
    4ca4:	0785                	addi	a5,a5,1
    4ca6:	c81c                	sw	a5,16(s0)
			fs->fsi_flag |= 1;
    4ca8:	00444783          	lbu	a5,4(s0)
    4cac:	0017e793          	ori	a5,a5,1
    4cb0:	00f40223          	sb	a5,4(s0)
		clst = nxt;					/* Next cluster */
    4cb4:	84ba                	mv	s1,a4
	} while (clst < fs->n_fatent);	/* Repeat while not the last link */
    4cb6:	fad767e3          	bltu	a4,a3,4c64 <remove_chain+0x28>
    4cba:	bf5d                	j	4c70 <remove_chain+0x34>
	if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Check if in valid range */
    4cbc:	4509                	li	a0,2
    4cbe:	bf55                	j	4c72 <remove_chain+0x36>
		if (nxt == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error? */
    4cc0:	4505                	li	a0,1
    4cc2:	bf45                	j	4c72 <remove_chain+0x36>

00004cc4 <mount_volume>:
{
    4cc4:	7179                	addi	sp,sp,-48
    4cc6:	d226                	sw	s1,36(sp)
    4cc8:	d606                	sw	ra,44(sp)
    4cca:	d422                	sw	s0,40(sp)
	*rfs = 0;
    4ccc:	0005a023          	sw	zero,0(a1)
{
    4cd0:	84b2                	mv	s1,a2
	*rfs = 0;
    4cd2:	c02e                	sw	a1,0(sp)
	vol = get_ldnumber(path);
    4cd4:	9a5ff0ef          	jal	ra,4678 <get_ldnumber>
	if (vol < 0) return FR_INVALID_DRIVE;
    4cd8:	47ad                	li	a5,11
    4cda:	02054f63          	bltz	a0,4d18 <mount_volume+0x54>
	fs = FatFs[vol];					/* Get pointer to the filesystem object */
    4cde:	00251793          	slli	a5,a0,0x2
    4ce2:	05418693          	addi	a3,gp,84 # 2000053c <FatFs>
    4ce6:	97b6                	add	a5,a5,a3
    4ce8:	4380                	lw	s0,0(a5)
    4cea:	872a                	mv	a4,a0
	if (!fs) return FR_NOT_ENABLED;		/* Is the filesystem object available? */
    4cec:	47b1                	li	a5,12
    4cee:	c40d                	beqz	s0,4d18 <mount_volume+0x54>
	*rfs = fs;							/* Return pointer to the filesystem object */
    4cf0:	4582                	lw	a1,0(sp)
	mode &= (BYTE)~FA_READ;				/* Desired access mode, write access or not */
    4cf2:	0fe4f493          	andi	s1,s1,254
	*rfs = fs;							/* Return pointer to the filesystem object */
    4cf6:	c180                	sw	s0,0(a1)
	if (fs->fs_type != 0) {				/* If the volume has been mounted */
    4cf8:	00044783          	lbu	a5,0(s0)
    4cfc:	c785                	beqz	a5,4d24 <mount_volume+0x60>
    4cfe:	c02a                	sw	a0,0(sp)
		stat = disk_status(fs->pdrv);
    4d00:	00144503          	lbu	a0,1(s0)
    4d04:	38c010ef          	jal	ra,6090 <disk_status>
		if (!(stat & STA_NOINIT)) {		/* and the physical drive is kept initialized */
    4d08:	00157793          	andi	a5,a0,1
    4d0c:	4702                	lw	a4,0(sp)
    4d0e:	eb99                	bnez	a5,4d24 <mount_volume+0x60>
			if (!FF_FS_READONLY && mode && (stat & STA_PROTECT)) {	/* Check write protection if needed */
    4d10:	c481                	beqz	s1,4d18 <mount_volume+0x54>
    4d12:	8911                	andi	a0,a0,4
    4d14:	c111                	beqz	a0,4d18 <mount_volume+0x54>
				return FR_WRITE_PROTECTED;
    4d16:	47a9                	li	a5,10
}
    4d18:	50b2                	lw	ra,44(sp)
    4d1a:	5422                	lw	s0,40(sp)
    4d1c:	5492                	lw	s1,36(sp)
    4d1e:	853e                	mv	a0,a5
    4d20:	6145                	addi	sp,sp,48
    4d22:	8082                	ret
	fs->pdrv = LD2PD(vol);				/* Volume hosting physical drive */
    4d24:	0ff77513          	andi	a0,a4,255
	fs->fs_type = 0;					/* Clear the filesystem object */
    4d28:	00040023          	sb	zero,0(s0)
	fs->pdrv = LD2PD(vol);				/* Volume hosting physical drive */
    4d2c:	00a400a3          	sb	a0,1(s0)
	stat = disk_initialize(fs->pdrv);	/* Initialize the physical drive */
    4d30:	36c010ef          	jal	ra,609c <disk_initialize>
	if (stat & STA_NOINIT) { 			/* Check if the initialization succeeded */
    4d34:	00157713          	andi	a4,a0,1
		return FR_NOT_READY;			/* Failed to initialize due to no medium or hard error */
    4d38:	478d                	li	a5,3
	if (stat & STA_NOINIT) { 			/* Check if the initialization succeeded */
    4d3a:	ff79                	bnez	a4,4d18 <mount_volume+0x54>
	if (!FF_FS_READONLY && mode && (stat & STA_PROTECT)) { /* Check disk write protection if needed */
    4d3c:	c099                	beqz	s1,4d42 <mount_volume+0x7e>
    4d3e:	8911                	andi	a0,a0,4
    4d40:	f979                	bnez	a0,4d16 <mount_volume+0x52>
	fmt = check_fs(fs, 0);				/* Load sector 0 and check if it is an FAT VBR as SFD */
    4d42:	4581                	li	a1,0
    4d44:	8522                	mv	a0,s0
    4d46:	acbff0ef          	jal	ra,4810 <check_fs>
	if (fmt != 2 && (fmt >= 3 || part == 0)) return fmt;	/* Returns if it is a FAT VBR as auto scan, not a BS or disk error */
    4d4a:	4789                	li	a5,2
    4d4c:	04f51b63          	bne	a0,a5,4da2 <mount_volume+0xde>
    4d50:	0844                	addi	s1,sp,20
    4d52:	1f640793          	addi	a5,s0,502
    4d56:	23640693          	addi	a3,s0,566
    4d5a:	8726                	mv	a4,s1
		mbr_pt[i] = ld_dword(fs->win + MBR_Table + i * SZ_PTE + PTE_StLba);
    4d5c:	853e                	mv	a0,a5
    4d5e:	c43a                	sw	a4,8(sp)
    4d60:	c236                	sw	a3,4(sp)
    4d62:	c03e                	sw	a5,0(sp)
    4d64:	8dbff0ef          	jal	ra,463e <ld_dword>
    4d68:	4722                	lw	a4,8(sp)
    4d6a:	4782                	lw	a5,0(sp)
	for (i = 0; i < 4; i++) {		/* Load partition offset in the MBR */
    4d6c:	4692                	lw	a3,4(sp)
		mbr_pt[i] = ld_dword(fs->win + MBR_Table + i * SZ_PTE + PTE_StLba);
    4d6e:	c308                	sw	a0,0(a4)
    4d70:	07c1                	addi	a5,a5,16
    4d72:	0711                	addi	a4,a4,4
	for (i = 0; i < 4; i++) {		/* Load partition offset in the MBR */
    4d74:	fef694e3          	bne	a3,a5,4d5c <mount_volume+0x98>
    4d78:	01048793          	addi	a5,s1,16
		fmt = mbr_pt[i] ? check_fs(fs, mbr_pt[i]) : 3;	/* Check if the partition is FAT */
    4d7c:	408c                	lw	a1,0(s1)
    4d7e:	450d                	li	a0,3
    4d80:	c989                	beqz	a1,4d92 <mount_volume+0xce>
    4d82:	8522                	mv	a0,s0
    4d84:	c03e                	sw	a5,0(sp)
    4d86:	a8bff0ef          	jal	ra,4810 <check_fs>
	} while (part == 0 && fmt >= 2 && ++i < 4);
    4d8a:	4705                	li	a4,1
    4d8c:	4782                	lw	a5,0(sp)
    4d8e:	02a77263          	bgeu	a4,a0,4db2 <mount_volume+0xee>
    4d92:	0491                	addi	s1,s1,4
    4d94:	fe9794e3          	bne	a5,s1,4d7c <mount_volume+0xb8>
	if (fmt == 4) return FR_DISK_ERR;		/* An error occured in the disk I/O layer */
    4d98:	4711                	li	a4,4
    4d9a:	4785                	li	a5,1
    4d9c:	00e51963          	bne	a0,a4,4dae <mount_volume+0xea>
    4da0:	bfa5                	j	4d18 <mount_volume+0x54>
    4da2:	4711                	li	a4,4
    4da4:	4785                	li	a5,1
    4da6:	f6e509e3          	beq	a0,a4,4d18 <mount_volume+0x54>
	if (fmt >= 2) return FR_NO_FILESYSTEM;	/* No FAT volume is found */
    4daa:	00a7f463          	bgeu	a5,a0,4db2 <mount_volume+0xee>
    4dae:	47b5                	li	a5,13
    4db0:	b7a5                	j	4d18 <mount_volume+0x54>
	rv = rv << 8 | ptr[0];
    4db2:	03c44783          	lbu	a5,60(s0)
    4db6:	03b44703          	lbu	a4,59(s0)
    4dba:	07a2                	slli	a5,a5,0x8
    4dbc:	8fd9                	or	a5,a5,a4
		if (ld_word(fs->win + BPB_BytsPerSec) != SS(fs)) return FR_NO_FILESYSTEM;	/* (BPB_BytsPerSec must be equal to the physical sector size) */
    4dbe:	07c2                	slli	a5,a5,0x10
    4dc0:	87c1                	srai	a5,a5,0x10
    4dc2:	20000713          	li	a4,512
    4dc6:	fee794e3          	bne	a5,a4,4dae <mount_volume+0xea>
	rv = rv << 8 | ptr[0];
    4dca:	04744703          	lbu	a4,71(s0)
    4dce:	04644783          	lbu	a5,70(s0)
    4dd2:	0722                	slli	a4,a4,0x8
    4dd4:	8f5d                	or	a4,a4,a5
		if (fasize == 0) fasize = ld_dword(fs->win + BPB_FATSz32);
    4dd6:	e711                	bnez	a4,4de2 <mount_volume+0x11e>
    4dd8:	05440513          	addi	a0,s0,84
    4ddc:	863ff0ef          	jal	ra,463e <ld_dword>
    4de0:	872a                	mv	a4,a0
		fs->n_fats = fs->win[BPB_NumFATs];				/* Number of FATs */
    4de2:	04044383          	lbu	t2,64(s0)
		fs->fsize = fasize;
    4de6:	cc18                	sw	a4,24(s0)
		if (fs->n_fats != 1 && fs->n_fats != 2) return FR_NO_FILESYSTEM;	/* (Must be 1 or 2) */
    4de8:	4685                	li	a3,1
    4dea:	fff38793          	addi	a5,t2,-1 # fffffff <__ctor_end__+0xfff776f>
		fs->n_fats = fs->win[BPB_NumFATs];				/* Number of FATs */
    4dee:	00740123          	sb	t2,2(s0)
		if (fs->n_fats != 1 && fs->n_fats != 2) return FR_NO_FILESYSTEM;	/* (Must be 1 or 2) */
    4df2:	0ff7f793          	andi	a5,a5,255
	bsect = fs->winsect;					/* Volume location */
    4df6:	544c                	lw	a1,44(s0)
		if (fs->n_fats != 1 && fs->n_fats != 2) return FR_NO_FILESYSTEM;	/* (Must be 1 or 2) */
    4df8:	faf6ebe3          	bltu	a3,a5,4dae <mount_volume+0xea>
		fs->csize = fs->win[BPB_SecPerClus];			/* Cluster size */
    4dfc:	03d44483          	lbu	s1,61(s0)
    4e00:	01049793          	slli	a5,s1,0x10
    4e04:	83c1                	srli	a5,a5,0x10
    4e06:	00f41523          	sh	a5,10(s0)
		if (fs->csize == 0 || (fs->csize & (fs->csize - 1))) return FR_NO_FILESYSTEM;	/* (Must be power of 2) */
    4e0a:	d3d5                	beqz	a5,4dae <mount_volume+0xea>
    4e0c:	fff48793          	addi	a5,s1,-1
    4e10:	8fe5                	and	a5,a5,s1
    4e12:	ffd1                	bnez	a5,4dae <mount_volume+0xea>
	rv = rv << 8 | ptr[0];
    4e14:	04244683          	lbu	a3,66(s0)
    4e18:	04144303          	lbu	t1,65(s0)
    4e1c:	06a2                	slli	a3,a3,0x8
    4e1e:	0066e6b3          	or	a3,a3,t1
    4e22:	01069313          	slli	t1,a3,0x10
    4e26:	41035313          	srai	t1,t1,0x10
    4e2a:	01031293          	slli	t0,t1,0x10
    4e2e:	0102d293          	srli	t0,t0,0x10
		fs->n_rootdir = ld_word(fs->win + BPB_RootEntCnt);	/* Number of root directory entries */
    4e32:	00541423          	sh	t0,8(s0)
		if (fs->n_rootdir % (SS(fs) / SZDIRE)) return FR_NO_FILESYSTEM;	/* (Must be sector aligned) */
    4e36:	00f2f793          	andi	a5,t0,15
    4e3a:	fbb5                	bnez	a5,4dae <mount_volume+0xea>
	rv = rv << 8 | ptr[0];
    4e3c:	04444503          	lbu	a0,68(s0)
    4e40:	04344783          	lbu	a5,67(s0)
    4e44:	0522                	slli	a0,a0,0x8
    4e46:	8d5d                	or	a0,a0,a5
		if (tsect == 0) tsect = ld_dword(fs->win + BPB_TotSec32);
    4e48:	ed19                	bnez	a0,4e66 <mount_volume+0x1a2>
    4e4a:	05040513          	addi	a0,s0,80
    4e4e:	c816                	sw	t0,16(sp)
    4e50:	c61a                	sw	t1,12(sp)
    4e52:	c42e                	sw	a1,8(sp)
    4e54:	c23a                	sw	a4,4(sp)
    4e56:	c01e                	sw	t2,0(sp)
    4e58:	fe6ff0ef          	jal	ra,463e <ld_dword>
    4e5c:	42c2                	lw	t0,16(sp)
    4e5e:	4332                	lw	t1,12(sp)
    4e60:	45a2                	lw	a1,8(sp)
    4e62:	4712                	lw	a4,4(sp)
    4e64:	4382                	lw	t2,0(sp)
	rv = rv << 8 | ptr[0];
    4e66:	03f44683          	lbu	a3,63(s0)
    4e6a:	03e44783          	lbu	a5,62(s0)
    4e6e:	06a2                	slli	a3,a3,0x8
    4e70:	8edd                	or	a3,a3,a5
		if (nrsv == 0) return FR_NO_FILESYSTEM;			/* (Must not be 0) */
    4e72:	de95                	beqz	a3,4dae <mount_volume+0xea>
		fasize *= fs->n_fats;							/* Number of sectors for FAT area */
    4e74:	02e383b3          	mul	t2,t2,a4
		sysect = nrsv + fasize + fs->n_rootdir / (SS(fs) / SZDIRE);	/* RSV + FAT + DIR */
    4e78:	0042d613          	srli	a2,t0,0x4
    4e7c:	9636                	add	a2,a2,a3
    4e7e:	961e                	add	a2,a2,t2
		if (tsect < sysect) return FR_NO_FILESYSTEM;	/* (Invalid volume size) */
    4e80:	f2c567e3          	bltu	a0,a2,4dae <mount_volume+0xea>
		nclst = (tsect - sysect) / fs->csize;			/* Number of clusters */
    4e84:	8d11                	sub	a0,a0,a2
    4e86:	029557b3          	divu	a5,a0,s1
		if (nclst == 0) return FR_NO_FILESYSTEM;		/* (Invalid volume size) */
    4e8a:	f29562e3          	bltu	a0,s1,4dae <mount_volume+0xea>
		if (nclst <= MAX_FAT32) fmt = FS_FAT32;
    4e8e:	10000537          	lui	a0,0x10000
    4e92:	1555                	addi	a0,a0,-11
    4e94:	f0f56de3          	bltu	a0,a5,4dae <mount_volume+0xea>
		if (nclst <= MAX_FAT16) fmt = FS_FAT16;
    4e98:	6541                	lui	a0,0x10
    4e9a:	1555                	addi	a0,a0,-11
    4e9c:	10f57f63          	bgeu	a0,a5,4fba <mount_volume+0x2f6>
		if (nclst <= MAX_FAT32) fmt = FS_FAT32;
    4ea0:	448d                	li	s1,3
		fs->database = bsect + sysect;					/* Data start sector */
    4ea2:	962e                	add	a2,a2,a1
		fs->n_fatent = nclst + 2;						/* Number of FAT entries */
    4ea4:	0789                	addi	a5,a5,2
		fs->fatbase = bsect + nrsv; 					/* FAT start sector */
    4ea6:	96ae                	add	a3,a3,a1
		fs->database = bsect + sysect;					/* Data start sector */
    4ea8:	d410                	sw	a2,40(s0)
		fs->n_fatent = nclst + 2;						/* Number of FAT entries */
    4eaa:	c85c                	sw	a5,20(s0)
		fs->volbase = bsect;							/* Volume start sector */
    4eac:	cc4c                	sw	a1,28(s0)
		fs->fatbase = bsect + nrsv; 					/* FAT start sector */
    4eae:	d014                	sw	a3,32(s0)
		if (fmt == FS_FAT32) {
    4eb0:	460d                	li	a2,3
    4eb2:	0ec49563          	bne	s1,a2,4f9c <mount_volume+0x2d8>
	rv = rv << 8 | ptr[0];
    4eb6:	05b44683          	lbu	a3,91(s0)
    4eba:	05a44603          	lbu	a2,90(s0)
    4ebe:	c42e                	sw	a1,8(sp)
    4ec0:	06a2                	slli	a3,a3,0x8
    4ec2:	8ed1                	or	a3,a3,a2
			if (ld_word(fs->win + BPB_FSVer32) != 0) return FR_NO_FILESYSTEM;	/* (Must be FAT32 revision 0.0) */
    4ec4:	00d366b3          	or	a3,t1,a3
    4ec8:	06c2                	slli	a3,a3,0x10
    4eca:	c23a                	sw	a4,4(sp)
    4ecc:	c03e                	sw	a5,0(sp)
    4ece:	86c1                	srai	a3,a3,0x10
    4ed0:	ec069fe3          	bnez	a3,4dae <mount_volume+0xea>
			fs->dirbase = ld_dword(fs->win + BPB_RootClus32);	/* Root directory start cluster */
    4ed4:	05c40513          	addi	a0,s0,92
    4ed8:	f66ff0ef          	jal	ra,463e <ld_dword>
			szbfat = fs->n_fatent * 4;					/* (Needed FAT size) */
    4edc:	4782                	lw	a5,0(sp)
    4ede:	4712                	lw	a4,4(sp)
    4ee0:	45a2                	lw	a1,8(sp)
			fs->dirbase = ld_dword(fs->win + BPB_RootClus32);	/* Root directory start cluster */
    4ee2:	d048                	sw	a0,36(s0)
			szbfat = fs->n_fatent * 4;					/* (Needed FAT size) */
    4ee4:	078a                	slli	a5,a5,0x2
		if (fs->fsize < (szbfat + (SS(fs) - 1)) / SS(fs)) return FR_NO_FILESYSTEM;	/* (BPB_FATSz must not be less than the size needed) */
    4ee6:	1ff78793          	addi	a5,a5,511
    4eea:	83a5                	srli	a5,a5,0x9
    4eec:	ecf761e3          	bltu	a4,a5,4dae <mount_volume+0xea>
		fs->last_clst = fs->free_clst = 0xFFFFFFFF;		/* Initialize cluster allocation information */
    4ef0:	57fd                	li	a5,-1
    4ef2:	c81c                	sw	a5,16(s0)
    4ef4:	c45c                	sw	a5,12(s0)
		fs->fsi_flag = 0x80;
    4ef6:	f8000793          	li	a5,-128
    4efa:	00f40223          	sb	a5,4(s0)
		if (fmt == FS_FAT32				/* Allow to update FSInfo only if BPB_FSInfo32 == 1 */
    4efe:	478d                	li	a5,3
    4f00:	06f49f63          	bne	s1,a5,4f7e <mount_volume+0x2ba>
	rv = rv << 8 | ptr[0];
    4f04:	06144783          	lbu	a5,97(s0)
    4f08:	06044703          	lbu	a4,96(s0)
    4f0c:	07a2                	slli	a5,a5,0x8
    4f0e:	8fd9                	or	a5,a5,a4
			&& ld_word(fs->win + BPB_FSInfo32) == 1
    4f10:	07c2                	slli	a5,a5,0x10
    4f12:	87c1                	srai	a5,a5,0x10
    4f14:	4705                	li	a4,1
    4f16:	06e79463          	bne	a5,a4,4f7e <mount_volume+0x2ba>
			&& move_window(fs, bsect + 1) == FR_OK)
    4f1a:	0585                	addi	a1,a1,1
    4f1c:	8522                	mv	a0,s0
    4f1e:	8a7ff0ef          	jal	ra,47c4 <move_window>
    4f22:	ed31                	bnez	a0,4f7e <mount_volume+0x2ba>
	rv = rv << 8 | ptr[0];
    4f24:	22f44783          	lbu	a5,559(s0)
    4f28:	22e44703          	lbu	a4,558(s0)
			fs->fsi_flag = 0;
    4f2c:	00040223          	sb	zero,4(s0)
	rv = rv << 8 | ptr[0];
    4f30:	07a2                	slli	a5,a5,0x8
    4f32:	8fd9                	or	a5,a5,a4
			if (ld_word(fs->win + BS_55AA) == 0xAA55	/* Load FSInfo data if available */
    4f34:	07c2                	slli	a5,a5,0x10
    4f36:	776d                	lui	a4,0xffffb
    4f38:	87c1                	srai	a5,a5,0x10
    4f3a:	a5570713          	addi	a4,a4,-1451 # ffffaa55 <__heap_end+0xdffcaa55>
    4f3e:	04e79063          	bne	a5,a4,4f7e <mount_volume+0x2ba>
				&& ld_dword(fs->win + FSI_LeadSig) == 0x41615252
    4f42:	03040513          	addi	a0,s0,48
    4f46:	ef8ff0ef          	jal	ra,463e <ld_dword>
    4f4a:	416157b7          	lui	a5,0x41615
    4f4e:	25278793          	addi	a5,a5,594 # 41615252 <__heap_end+0x215e5252>
    4f52:	02f51663          	bne	a0,a5,4f7e <mount_volume+0x2ba>
				&& ld_dword(fs->win + FSI_StrucSig) == 0x61417272)
    4f56:	21440513          	addi	a0,s0,532
    4f5a:	ee4ff0ef          	jal	ra,463e <ld_dword>
    4f5e:	614177b7          	lui	a5,0x61417
    4f62:	27278793          	addi	a5,a5,626 # 61417272 <__heap_end+0x413e7272>
    4f66:	00f51c63          	bne	a0,a5,4f7e <mount_volume+0x2ba>
				fs->free_clst = ld_dword(fs->win + FSI_Free_Count);
    4f6a:	21840513          	addi	a0,s0,536
    4f6e:	ed0ff0ef          	jal	ra,463e <ld_dword>
    4f72:	c808                	sw	a0,16(s0)
				fs->last_clst = ld_dword(fs->win + FSI_Nxt_Free);
    4f74:	21c40513          	addi	a0,s0,540
    4f78:	ec6ff0ef          	jal	ra,463e <ld_dword>
    4f7c:	c448                	sw	a0,12(s0)
	fs->id = ++Fsid;		/* Volume mount ID */
    4f7e:	05818713          	addi	a4,gp,88 # 20000540 <Fsid>
    4f82:	00075783          	lhu	a5,0(a4)
	fs->fs_type = (BYTE)fmt;/* FAT sub-type */
    4f86:	00940023          	sb	s1,0(s0)
	fs->id = ++Fsid;		/* Volume mount ID */
    4f8a:	0785                	addi	a5,a5,1
    4f8c:	07c2                	slli	a5,a5,0x10
    4f8e:	83c1                	srli	a5,a5,0x10
    4f90:	00f71023          	sh	a5,0(a4)
    4f94:	00f41323          	sh	a5,6(s0)
	return FR_OK;
    4f98:	4781                	li	a5,0
    4f9a:	bbbd                	j	4d18 <mount_volume+0x54>
			if (fs->n_rootdir == 0)	return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must not be 0) */
    4f9c:	e00289e3          	beqz	t0,4dae <mount_volume+0xea>
			fs->dirbase = fs->fatbase + fasize;			/* Root directory start sector */
    4fa0:	969e                	add	a3,a3,t2
    4fa2:	d054                	sw	a3,36(s0)
				fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
    4fa4:	4689                	li	a3,2
    4fa6:	00d49463          	bne	s1,a3,4fae <mount_volume+0x2ea>
    4faa:	0786                	slli	a5,a5,0x1
    4fac:	bf2d                	j	4ee6 <mount_volume+0x222>
    4fae:	02c78633          	mul	a2,a5,a2
    4fb2:	8b85                	andi	a5,a5,1
    4fb4:	8205                	srli	a2,a2,0x1
    4fb6:	97b2                	add	a5,a5,a2
    4fb8:	b73d                	j	4ee6 <mount_volume+0x222>
		if (nclst <= MAX_FAT12) fmt = FS_FAT12;
    4fba:	6485                	lui	s1,0x1
    4fbc:	14d5                	addi	s1,s1,-11
    4fbe:	00f4b4b3          	sltu	s1,s1,a5
    4fc2:	0485                	addi	s1,s1,1
    4fc4:	bdf9                	j	4ea2 <mount_volume+0x1de>

00004fc6 <dir_sdi.constprop.13>:
static FRESULT dir_sdi (	/* FR_OK(0):succeeded, !=0:error */
    4fc6:	1141                	addi	sp,sp,-16
	clst = dp->obj.sclust;		/* Table start cluster (0:root) */
    4fc8:	451c                	lw	a5,8(a0)
static FRESULT dir_sdi (	/* FR_OK(0):succeeded, !=0:error */
    4fca:	c422                	sw	s0,8(sp)
    4fcc:	c226                	sw	s1,4(sp)
    4fce:	c606                	sw	ra,12(sp)
	dp->dptr = ofs;				/* Set current offset */
    4fd0:	00052823          	sw	zero,16(a0) # 10010 <__ctor_end__+0x7780>
static FRESULT dir_sdi (	/* FR_OK(0):succeeded, !=0:error */
    4fd4:	84aa                	mv	s1,a0
	FATFS *fs = dp->obj.fs;
    4fd6:	4100                	lw	s0,0(a0)
	if (clst == 0 && fs->fs_type >= FS_FAT32) {	/* Replace cluster# 0 with root cluster# */
    4fd8:	ef85                	bnez	a5,5010 <dir_sdi.constprop.13+0x4a>
    4fda:	00044683          	lbu	a3,0(s0)
    4fde:	4709                	li	a4,2
    4fe0:	00d77463          	bgeu	a4,a3,4fe8 <dir_sdi.constprop.13+0x22>
		clst = (DWORD)fs->dirbase;
    4fe4:	5058                	lw	a4,36(s0)
	if (clst == 0) {	/* Static table (root-directory on the FAT volume) */
    4fe6:	e705                	bnez	a4,500e <dir_sdi.constprop.13+0x48>
		if (ofs / SZDIRE >= fs->n_rootdir) return FR_INT_ERR;	/* Is index out of range? */
    4fe8:	00845703          	lhu	a4,8(s0)
    4fec:	e719                	bnez	a4,4ffa <dir_sdi.constprop.13+0x34>
    4fee:	4509                	li	a0,2
}
    4ff0:	40b2                	lw	ra,12(sp)
    4ff2:	4422                	lw	s0,8(sp)
    4ff4:	4492                	lw	s1,4(sp)
    4ff6:	0141                	addi	sp,sp,16
    4ff8:	8082                	ret
		dp->sect = fs->dirbase;
    4ffa:	5058                	lw	a4,36(s0)
    4ffc:	cc98                	sw	a4,24(s1)
	dp->clust = clst;					/* Current cluster# */
    4ffe:	c8dc                	sw	a5,20(s1)
	if (dp->sect == 0) return FR_INT_ERR;
    5000:	4c9c                	lw	a5,24(s1)
    5002:	d7f5                	beqz	a5,4fee <dir_sdi.constprop.13+0x28>
	dp->dir = fs->win + (ofs % SS(fs));	/* Pointer to the entry in the win[] */
    5004:	03040413          	addi	s0,s0,48
    5008:	ccc0                	sw	s0,28(s1)
	return FR_OK;
    500a:	4501                	li	a0,0
    500c:	b7d5                	j	4ff0 <dir_sdi.constprop.13+0x2a>
	if (clst == 0) {	/* Static table (root-directory on the FAT volume) */
    500e:	87ba                	mv	a5,a4
		csz = (DWORD)fs->csize * SS(fs);	/* Bytes per cluster */
    5010:	00a45703          	lhu	a4,10(s0)
		while (ofs >= csz) {				/* Follow cluster chain */
    5014:	e305                	bnez	a4,5034 <dir_sdi.constprop.13+0x6e>
			clst = get_fat(&dp->obj, clst);				/* Get next cluster */
    5016:	4088                	lw	a0,0(s1)
    5018:	85be                	mv	a1,a5
    501a:	a3dff0ef          	jal	ra,4a56 <get_fat.isra.7>
			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    501e:	577d                	li	a4,-1
			clst = get_fat(&dp->obj, clst);				/* Get next cluster */
    5020:	87aa                	mv	a5,a0
			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    5022:	02e50163          	beq	a0,a4,5044 <dir_sdi.constprop.13+0x7e>
			if (clst < 2 || clst >= fs->n_fatent) return FR_INT_ERR;	/* Reached to end of table or internal error */
    5026:	4705                	li	a4,1
    5028:	fca773e3          	bgeu	a4,a0,4fee <dir_sdi.constprop.13+0x28>
    502c:	4858                	lw	a4,20(s0)
    502e:	fee564e3          	bltu	a0,a4,5016 <dir_sdi.constprop.13+0x50>
    5032:	bf75                	j	4fee <dir_sdi.constprop.13+0x28>
		dp->sect = clst2sect(fs, clst);
    5034:	85be                	mv	a1,a5
    5036:	8522                	mv	a0,s0
    5038:	c03e                	sw	a5,0(sp)
    503a:	e22ff0ef          	jal	ra,465c <clst2sect>
    503e:	cc88                	sw	a0,24(s1)
    5040:	4782                	lw	a5,0(sp)
    5042:	bf75                	j	4ffe <dir_sdi.constprop.13+0x38>
			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    5044:	4505                	li	a0,1
    5046:	b76d                	j	4ff0 <dir_sdi.constprop.13+0x2a>

00005048 <dir_clear>:
{
    5048:	1131                	addi	sp,sp,-20
    504a:	c622                	sw	s0,12(sp)
    504c:	c806                	sw	ra,16(sp)
    504e:	c426                	sw	s1,8(sp)
	if (fs->wflag) {	/* Is the disk access window dirty? */
    5050:	00354783          	lbu	a5,3(a0)
{
    5054:	842a                	mv	s0,a0
	if (fs->wflag) {	/* Is the disk access window dirty? */
    5056:	eb9d                	bnez	a5,508c <dir_clear+0x44>
	sect = clst2sect(fs, clst);		/* Top of the cluster */
    5058:	8522                	mv	a0,s0
    505a:	e02ff0ef          	jal	ra,465c <clst2sect>
	mem_set(fs->win, 0, sizeof fs->win);	/* Clear window buffer */
    505e:	03040713          	addi	a4,s0,48
	sect = clst2sect(fs, clst);		/* Top of the cluster */
    5062:	832a                	mv	t1,a0
	fs->winsect = sect;				/* Set window to top of the cluster */
    5064:	d448                	sw	a0,44(s0)
	BYTE *d = (BYTE*)dst;
    5066:	23040693          	addi	a3,s0,560
    506a:	87ba                	mv	a5,a4
		*d++ = (BYTE)val;
    506c:	0785                	addi	a5,a5,1
    506e:	fe078fa3          	sb	zero,-1(a5)
	} while (--cnt);
    5072:	fed79de3          	bne	a5,a3,506c <dir_clear+0x24>
		for (n = 0; n < fs->csize && disk_write(fs->pdrv, ibuf, sect + n, szb) == RES_OK; n += szb) ;	/* Fill the cluster with 0 */
    5076:	4481                	li	s1,0
    5078:	00a45783          	lhu	a5,10(s0)
    507c:	02f4e463          	bltu	s1,a5,50a4 <dir_clear+0x5c>
	return (n == fs->csize) ? FR_OK : FR_DISK_ERR;
    5080:	00a45783          	lhu	a5,10(s0)
    5084:	8f85                	sub	a5,a5,s1
    5086:	00f037b3          	snez	a5,a5
    508a:	a039                	j	5098 <dir_clear+0x50>
    508c:	c02e                	sw	a1,0(sp)
    508e:	edaff0ef          	jal	ra,4768 <sync_window.part.4>
	if (sync_window(fs) != FR_OK) return FR_DISK_ERR;	/* Flush disk access window */
    5092:	4785                	li	a5,1
    5094:	4582                	lw	a1,0(sp)
    5096:	d169                	beqz	a0,5058 <dir_clear+0x10>
}
    5098:	40c2                	lw	ra,16(sp)
    509a:	4432                	lw	s0,12(sp)
    509c:	44a2                	lw	s1,8(sp)
    509e:	853e                	mv	a0,a5
    50a0:	0151                	addi	sp,sp,20
    50a2:	8082                	ret
		for (n = 0; n < fs->csize && disk_write(fs->pdrv, ibuf, sect + n, szb) == RES_OK; n += szb) ;	/* Fill the cluster with 0 */
    50a4:	00144503          	lbu	a0,1(s0)
    50a8:	00930633          	add	a2,t1,s1
    50ac:	85ba                	mv	a1,a4
    50ae:	4685                	li	a3,1
    50b0:	c21a                	sw	t1,4(sp)
    50b2:	c03a                	sw	a4,0(sp)
    50b4:	162010ef          	jal	ra,6216 <disk_write>
    50b8:	4702                	lw	a4,0(sp)
    50ba:	4312                	lw	t1,4(sp)
    50bc:	f171                	bnez	a0,5080 <dir_clear+0x38>
    50be:	0485                	addi	s1,s1,1
    50c0:	bf65                	j	5078 <dir_clear+0x30>

000050c2 <dir_next>:
	ofs = dp->dptr + SZDIRE;	/* Next entry */
    50c2:	491c                	lw	a5,16(a0)
{
    50c4:	1121                	addi	sp,sp,-24
    50c6:	c822                	sw	s0,16(sp)
	ofs = dp->dptr + SZDIRE;	/* Next entry */
    50c8:	02078793          	addi	a5,a5,32
    50cc:	c03e                	sw	a5,0(sp)
	if (ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR)) dp->sect = 0;	/* Disable it if the offset reached the max value */
    50ce:	4702                	lw	a4,0(sp)
{
    50d0:	ca06                	sw	ra,20(sp)
    50d2:	c626                	sw	s1,12(sp)
	if (ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR)) dp->sect = 0;	/* Disable it if the offset reached the max value */
    50d4:	002007b7          	lui	a5,0x200
	FATFS *fs = dp->obj.fs;
    50d8:	4100                	lw	s0,0(a0)
	if (ofs >= (DWORD)((FF_FS_EXFAT && fs->fs_type == FS_EXFAT) ? MAX_DIR_EX : MAX_DIR)) dp->sect = 0;	/* Disable it if the offset reached the max value */
    50da:	00f76463          	bltu	a4,a5,50e2 <dir_next+0x20>
    50de:	00052c23          	sw	zero,24(a0)
	if (dp->sect == 0) return FR_NO_FILE;	/* Report EOT if it has been disabled */
    50e2:	4d14                	lw	a3,24(a0)
    50e4:	4611                	li	a2,4
    50e6:	c695                	beqz	a3,5112 <dir_next+0x50>
	if (ofs % SS(fs) == 0) {	/* Sector changed? */
    50e8:	4782                	lw	a5,0(sp)
    50ea:	862e                	mv	a2,a1
    50ec:	84aa                	mv	s1,a0
    50ee:	1ff7f793          	andi	a5,a5,511
    50f2:	c23e                	sw	a5,4(sp)
    50f4:	ebc9                	bnez	a5,5186 <dir_next+0xc4>
		if (dp->clust == 0) {	/* Static table */
    50f6:	494c                	lw	a1,20(a0)
		dp->sect++;				/* Next sector */
    50f8:	0685                	addi	a3,a3,1
    50fa:	cd14                	sw	a3,24(a0)
		if (dp->clust == 0) {	/* Static table */
    50fc:	e18d                	bnez	a1,511e <dir_next+0x5c>
			if (ofs / SZDIRE >= fs->n_rootdir) {	/* Report EOT if it reached end of static table */
    50fe:	4782                	lw	a5,0(sp)
    5100:	00845603          	lhu	a2,8(s0)
    5104:	0057d693          	srli	a3,a5,0x5
    5108:	06c6ef63          	bltu	a3,a2,5186 <dir_next+0xc4>
				dp->sect = 0; return FR_NO_FILE;
    510c:	0004ac23          	sw	zero,24(s1) # 1018 <__divdf3+0x170>
    5110:	4611                	li	a2,4
}
    5112:	40d2                	lw	ra,20(sp)
    5114:	4442                	lw	s0,16(sp)
    5116:	44b2                	lw	s1,12(sp)
    5118:	8532                	mv	a0,a2
    511a:	0161                	addi	sp,sp,24
    511c:	8082                	ret
			if ((ofs / SS(fs) & (fs->csize - 1)) == 0) {	/* Cluster changed? */
    511e:	00a45683          	lhu	a3,10(s0)
    5122:	4782                	lw	a5,0(sp)
    5124:	16fd                	addi	a3,a3,-1
    5126:	0097d513          	srli	a0,a5,0x9
    512a:	8ee9                	and	a3,a3,a0
    512c:	eea9                	bnez	a3,5186 <dir_next+0xc4>
				clst = get_fat(&dp->obj, dp->clust);		/* Get next cluster */
    512e:	8522                	mv	a0,s0
    5130:	c432                	sw	a2,8(sp)
    5132:	925ff0ef          	jal	ra,4a56 <get_fat.isra.7>
				if (clst <= 1) return FR_INT_ERR;			/* Internal error */
    5136:	4305                	li	t1,1
				clst = get_fat(&dp->obj, dp->clust);		/* Get next cluster */
    5138:	86aa                	mv	a3,a0
				if (clst <= 1) return FR_INT_ERR;			/* Internal error */
    513a:	4622                	lw	a2,8(sp)
    513c:	00a36463          	bltu	t1,a0,5144 <dir_next+0x82>
    5140:	4609                	li	a2,2
    5142:	bfc1                	j	5112 <dir_next+0x50>
				if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    5144:	55fd                	li	a1,-1
    5146:	00b51463          	bne	a0,a1,514e <dir_next+0x8c>
    514a:	4605                	li	a2,1
    514c:	b7d9                	j	5112 <dir_next+0x50>
				if (clst >= fs->n_fatent) {					/* It reached end of dynamic table */
    514e:	484c                	lw	a1,20(s0)
    5150:	02b56563          	bltu	a0,a1,517a <dir_next+0xb8>
					if (!stretch) {								/* If no stretch, report EOT */
    5154:	de45                	beqz	a2,510c <dir_next+0x4a>
					clst = create_chain(&dp->obj, dp->clust);	/* Allocate a cluster */
    5156:	48cc                	lw	a1,20(s1)
    5158:	8526                	mv	a0,s1
    515a:	9e1ff0ef          	jal	ra,4b3a <create_chain>
					if (clst == 0) return FR_DENIED;			/* No free cluster */
    515e:	461d                	li	a2,7
    5160:	d94d                	beqz	a0,5112 <dir_next+0x50>
					if (clst == 1) return FR_INT_ERR;			/* Internal error */
    5162:	4305                	li	t1,1
    5164:	fc650ee3          	beq	a0,t1,5140 <dir_next+0x7e>
					if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
    5168:	567d                	li	a2,-1
    516a:	fec500e3          	beq	a0,a2,514a <dir_next+0x88>
					if (dir_clear(fs, clst) != FR_OK) return FR_DISK_ERR;	/* Clean up the stretched table */
    516e:	85aa                	mv	a1,a0
    5170:	c42a                	sw	a0,8(sp)
    5172:	8522                	mv	a0,s0
    5174:	3dd1                	jal	5048 <dir_clear>
    5176:	46a2                	lw	a3,8(sp)
    5178:	f969                	bnez	a0,514a <dir_next+0x88>
				dp->clust = clst;		/* Initialize data for new cluster */
    517a:	c8d4                	sw	a3,20(s1)
				dp->sect = clst2sect(fs, clst);
    517c:	85b6                	mv	a1,a3
    517e:	8522                	mv	a0,s0
    5180:	cdcff0ef          	jal	ra,465c <clst2sect>
    5184:	cc88                	sw	a0,24(s1)
	dp->dptr = ofs;						/* Current entry */
    5186:	4782                	lw	a5,0(sp)
	dp->dir = fs->win + ofs % SS(fs);	/* Pointer to the entry in the win[] */
    5188:	03040713          	addi	a4,s0,48
	return FR_OK;
    518c:	4601                	li	a2,0
	dp->dptr = ofs;						/* Current entry */
    518e:	c89c                	sw	a5,16(s1)
	dp->dir = fs->win + ofs % SS(fs);	/* Pointer to the entry in the win[] */
    5190:	4792                	lw	a5,4(sp)
    5192:	97ba                	add	a5,a5,a4
    5194:	ccdc                	sw	a5,28(s1)
	return FR_OK;
    5196:	bfb5                	j	5112 <dir_next+0x50>

00005198 <dir_register>:
	FATFS *fs = dp->obj.fs;
    5198:	411c                	lw	a5,0(a0)
{
    519a:	1141                	addi	sp,sp,-16
    519c:	c422                	sw	s0,8(sp)
    519e:	c226                	sw	s1,4(sp)
    51a0:	c606                	sw	ra,12(sp)
    51a2:	84aa                	mv	s1,a0
	FATFS *fs = dp->obj.fs;
    51a4:	c03e                	sw	a5,0(sp)
	res = dir_sdi(dp, 0);
    51a6:	e21ff0ef          	jal	ra,4fc6 <dir_sdi.constprop.13>
    51aa:	842a                	mv	s0,a0
	if (res == FR_OK) {
    51ac:	e135                	bnez	a0,5210 <dir_register+0x78>
			res = move_window(fs, dp->sect);
    51ae:	4c8c                	lw	a1,24(s1)
    51b0:	4502                	lw	a0,0(sp)
    51b2:	e12ff0ef          	jal	ra,47c4 <move_window>
    51b6:	842a                	mv	s0,a0
			if (res != FR_OK) break;
    51b8:	ed21                	bnez	a0,5210 <dir_register+0x78>
			if (dp->dir[DIR_Name] == DDEM || dp->dir[DIR_Name] == 0) {	/* Is the entry free? */
    51ba:	4cd8                	lw	a4,28(s1)
    51bc:	0e500693          	li	a3,229
    51c0:	00074703          	lbu	a4,0(a4)
    51c4:	04d71063          	bne	a4,a3,5204 <dir_register+0x6c>
		res = move_window(fs, dp->sect);
    51c8:	4c8c                	lw	a1,24(s1)
    51ca:	4502                	lw	a0,0(sp)
    51cc:	df8ff0ef          	jal	ra,47c4 <move_window>
    51d0:	842a                	mv	s0,a0
		if (res == FR_OK) {
    51d2:	e11d                	bnez	a0,51f8 <dir_register+0x60>
			mem_set(dp->dir, 0, SZDIRE);	/* Clean the entry */
    51d4:	4cd8                	lw	a4,28(s1)
	BYTE *d = (BYTE*)dst;
    51d6:	02070693          	addi	a3,a4,32
		*d++ = (BYTE)val;
    51da:	0705                	addi	a4,a4,1
    51dc:	fe070fa3          	sb	zero,-1(a4)
	} while (--cnt);
    51e0:	fed71de3          	bne	a4,a3,51da <dir_register+0x42>
	if (cnt != 0) {
    51e4:	4cc8                	lw	a0,28(s1)
    51e6:	462d                	li	a2,11
    51e8:	02048593          	addi	a1,s1,32
    51ec:	d14ff0ef          	jal	ra,4700 <mem_cpy.part.0>
			fs->wflag = 1;
    51f0:	4702                	lw	a4,0(sp)
    51f2:	4785                	li	a5,1
    51f4:	00f701a3          	sb	a5,3(a4)
}
    51f8:	8522                	mv	a0,s0
    51fa:	40b2                	lw	ra,12(sp)
    51fc:	4422                	lw	s0,8(sp)
    51fe:	4492                	lw	s1,4(sp)
    5200:	0141                	addi	sp,sp,16
    5202:	8082                	ret
			if (dp->dir[DIR_Name] == DDEM || dp->dir[DIR_Name] == 0) {	/* Is the entry free? */
    5204:	d371                	beqz	a4,51c8 <dir_register+0x30>
			res = dir_next(dp, 1);	/* Next entry with table stretch enabled */
    5206:	4585                	li	a1,1
    5208:	8526                	mv	a0,s1
    520a:	3d65                	jal	50c2 <dir_next>
    520c:	842a                	mv	s0,a0
		} while (res == FR_OK);
    520e:	d145                	beqz	a0,51ae <dir_register+0x16>
	if (res == FR_NO_FILE) res = FR_DENIED;	/* No directory entry to allocate */
    5210:	4791                	li	a5,4
    5212:	fef413e3          	bne	s0,a5,51f8 <dir_register+0x60>
    5216:	441d                	li	s0,7
    5218:	b7c5                	j	51f8 <dir_register+0x60>

0000521a <follow_path>:
	FATFS *fs = dp->obj.fs;
    521a:	411c                	lw	a5,0(a0)
{
    521c:	1131                	addi	sp,sp,-20
    521e:	c622                	sw	s0,12(sp)
    5220:	c806                	sw	ra,16(sp)
    5222:	c426                	sw	s1,8(sp)
    5224:	842a                	mv	s0,a0
    5226:	832e                	mv	t1,a1
	FATFS *fs = dp->obj.fs;
    5228:	c03e                	sw	a5,0(sp)
		while (*path == '/' || *path == '\\') path++;	/* Strip heading separator */
    522a:	02f00613          	li	a2,47
    522e:	05c00693          	li	a3,92
    5232:	00034703          	lbu	a4,0(t1)
    5236:	02c70663          	beq	a4,a2,5262 <follow_path+0x48>
    523a:	02d70463          	beq	a4,a3,5262 <follow_path+0x48>
		dp->obj.sclust = 0;					/* Start from root directory */
    523e:	00042423          	sw	zero,8(s0)
	if ((UINT)*path < ' ') {				/* Null path name is the origin directory itself */
    5242:	00034683          	lbu	a3,0(t1)
    5246:	477d                	li	a4,31
    5248:	10d76e63          	bltu	a4,a3,5364 <follow_path+0x14a>
		dp->fn[NSFLAG] = NS_NONAME;
    524c:	f8000713          	li	a4,-128
    5250:	02e405a3          	sb	a4,43(s0)
		res = dir_sdi(dp, 0);
    5254:	8522                	mv	a0,s0
}
    5256:	4432                	lw	s0,12(sp)
    5258:	40c2                	lw	ra,16(sp)
    525a:	44a2                	lw	s1,8(sp)
    525c:	0151                	addi	sp,sp,20
		res = dir_sdi(dp, 0);
    525e:	d69ff06f          	j	4fc6 <dir_sdi.constprop.13>
		while (*path == '/' || *path == '\\') path++;	/* Strip heading separator */
    5262:	0305                	addi	t1,t1,1
    5264:	b7f9                	j	5232 <follow_path+0x18>
			while (p[si] == '/' || p[si] == '\\') si++;	/* Skip duplicated separator if exist */
    5266:	0605                	addi	a2,a2,1
    5268:	a299                	j	53ae <follow_path+0x194>
		if (c == '.' || i >= ni) {		/* End of body or field overflow? */
    526a:	02e00493          	li	s1,46
    526e:	1c970e63          	beq	a4,s1,544a <follow_path+0x230>
    5272:	06a6fc63          	bgeu	a3,a0,52ea <follow_path+0xd0>
	if (c >= DbcTbl[0]) {
    5276:	08000493          	li	s1,128
    527a:	06e4fa63          	bgeu	s1,a4,52ee <follow_path+0xd4>
		if (c <= DbcTbl[1]) return 1;
    527e:	09f00393          	li	t2,159
    5282:	00e3f963          	bgeu	t2,a4,5294 <follow_path+0x7a>
		if (c >= DbcTbl[2] && c <= DbcTbl[3]) return 1;
    5286:	02070393          	addi	t2,a4,32
    528a:	0ff3f393          	andi	t2,t2,255
    528e:	44f1                	li	s1,28
    5290:	0474ef63          	bltu	s1,t2,52ee <follow_path+0xd4>
			d = (BYTE)p[si++];			/* Get 2nd byte */
    5294:	961a                	add	a2,a2,t1
    5296:	00258393          	addi	t2,a1,2
    529a:	00064583          	lbu	a1,0(a2) # f0000000 <__heap_end+0xcffd0000>
	if (c >= DbcTbl[4]) {
    529e:	03f00613          	li	a2,63
    52a2:	04b67463          	bgeu	a2,a1,52ea <follow_path+0xd0>
		if (c <= DbcTbl[5]) return 1;
    52a6:	07e00613          	li	a2,126
    52aa:	00b67863          	bgeu	a2,a1,52ba <follow_path+0xa0>
		if (c >= DbcTbl[6] && c <= DbcTbl[7]) return 1;
    52ae:	0805c613          	xori	a2,a1,128
    52b2:	07c00493          	li	s1,124
    52b6:	02c4ea63          	bltu	s1,a2,52ea <follow_path+0xd0>
			if (!dbc_2nd(d) || i >= ni - 1) return FR_INVALID_NAME;	/* Reject invalid DBC */
    52ba:	fff50613          	addi	a2,a0,-1
    52be:	02c6f663          	bgeu	a3,a2,52ea <follow_path+0xd0>
			sfn[i++] = c;
    52c2:	00168613          	addi	a2,a3,1
    52c6:	00d284b3          	add	s1,t0,a3
			sfn[i++] = d;
    52ca:	9616                	add	a2,a2,t0
			sfn[i++] = c;
    52cc:	00e48023          	sb	a4,0(s1)
			sfn[i++] = d;
    52d0:	00b60023          	sb	a1,0(a2)
    52d4:	0689                	addi	a3,a3,2
			d = (BYTE)p[si++];			/* Get 2nd byte */
    52d6:	861e                	mv	a2,t2
			i = 8; ni = 11;				/* Enter file extension field */
    52d8:	85b2                	mv	a1,a2
    52da:	a075                	j	5386 <follow_path+0x16c>
	while (*str && *str != chr) str++;
    52dc:	0585                	addi	a1,a1,1
    52de:	0005c383          	lbu	t2,0(a1)
    52e2:	00038a63          	beqz	t2,52f6 <follow_path+0xdc>
    52e6:	fe771be3          	bne	a4,t2,52dc <follow_path+0xc2>
			if (ni == 11 || c != '.') return FR_INVALID_NAME;	/* Field overflow or invalid dot? */
    52ea:	4519                	li	a0,6
	return res;
    52ec:	a081                	j	532c <follow_path+0x112>
		if (c >= DbcTbl[2] && c <= DbcTbl[3]) return 1;
    52ee:	65a1                	lui	a1,0x8
    52f0:	11858593          	addi	a1,a1,280 # 8118 <asc2_1608+0x5fc>
    52f4:	b7ed                	j	52de <follow_path+0xc4>
			if (IsLower(c)) c -= 0x20;	/* To upper */
    52f6:	f9f70593          	addi	a1,a4,-97
    52fa:	0ff5f593          	andi	a1,a1,255
    52fe:	43e5                	li	t2,25
    5300:	00b3e563          	bltu	t2,a1,530a <follow_path+0xf0>
    5304:	1701                	addi	a4,a4,-32
    5306:	0ff77713          	andi	a4,a4,255
			sfn[i++] = c;
    530a:	00d285b3          	add	a1,t0,a3
    530e:	00e58023          	sb	a4,0(a1)
    5312:	0685                	addi	a3,a3,1
    5314:	b7d1                	j	52d8 <follow_path+0xbe>
		if (!(dp->dir[DIR_Attr] & AM_VOL) && !mem_cmp(dp->dir, dp->fn, 11)) break;	/* Is it a valid entry? */
    5316:	12069263          	bnez	a3,543a <follow_path+0x220>
			ns = dp->fn[NSFLAG];
    531a:	02b44703          	lbu	a4,43(s0)
			if (res != FR_OK) {				/* Failed to find the object */
    531e:	cd11                	beqz	a0,533a <follow_path+0x120>
				if (res == FR_NO_FILE) {	/* Object is not found */
    5320:	4791                	li	a5,4
    5322:	00f51563          	bne	a0,a5,532c <follow_path+0x112>
						if (!(ns & NS_LAST)) res = FR_NO_PATH;	/* Adjust error code if not last segment */
    5326:	8b11                	andi	a4,a4,4
    5328:	10070f63          	beqz	a4,5446 <follow_path+0x22c>
}
    532c:	40c2                	lw	ra,16(sp)
    532e:	4432                	lw	s0,12(sp)
    5330:	44a2                	lw	s1,8(sp)
    5332:	0151                	addi	sp,sp,20
    5334:	8082                	ret
		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
    5336:	4511                	li	a0,4
    5338:	b7cd                	j	531a <follow_path+0x100>
    533a:	c21a                	sw	t1,4(sp)
			if (ns & NS_LAST) break;			/* Last segment matched. Function completed. */
    533c:	8b11                	andi	a4,a4,4
    533e:	f77d                	bnez	a4,532c <follow_path+0x112>
			if (!(dp->obj.attr & AM_DIR)) {		/* It is not a sub-directory and cannot follow */
    5340:	00644703          	lbu	a4,6(s0)
    5344:	8b41                	andi	a4,a4,16
    5346:	10070063          	beqz	a4,5446 <follow_path+0x22c>
				dp->obj.sclust = ld_clust(fs, fs->win + dp->dptr % SS(fs));	/* Open next directory */
    534a:	4782                	lw	a5,0(sp)
    534c:	4818                	lw	a4,16(s0)
    534e:	0007c503          	lbu	a0,0(a5) # 200000 <__ctor_end__+0x1f7770>
    5352:	03078593          	addi	a1,a5,48
    5356:	1ff77713          	andi	a4,a4,511
    535a:	95ba                	add	a1,a1,a4
    535c:	bbeff0ef          	jal	ra,471a <ld_clust.isra.1>
			res = create_name(dp, &path);	/* Get a segment name of the path */
    5360:	4312                	lw	t1,4(sp)
				dp->obj.sclust = ld_clust(fs, fs->win + dp->dptr % SS(fs));	/* Open next directory */
    5362:	c408                	sw	a0,8(s0)
	p = *path; sfn = dp->fn;
    5364:	02040293          	addi	t0,s0,32
	mem_set(sfn, ' ', 11);
    5368:	02b40693          	addi	a3,s0,43
	BYTE *d = (BYTE*)dst;
    536c:	8716                	mv	a4,t0
		*d++ = (BYTE)val;
    536e:	02000613          	li	a2,32
    5372:	0705                	addi	a4,a4,1
    5374:	fec70fa3          	sb	a2,-1(a4)
	} while (--cnt);
    5378:	fed71de3          	bne	a4,a3,5372 <follow_path+0x158>
	si = i = 0; ni = 8;
    537c:	4681                	li	a3,0
    537e:	4581                	li	a1,0
    5380:	4521                	li	a0,8
		if (c <= ' ') break; 			/* Break if end of the path name */
    5382:	02000793          	li	a5,32
		c = (BYTE)p[si++];				/* Get a byte */
    5386:	00b30733          	add	a4,t1,a1
    538a:	00074703          	lbu	a4,0(a4)
    538e:	00158613          	addi	a2,a1,1
		if (c <= ' ') break; 			/* Break if end of the path name */
    5392:	02e7f663          	bgeu	a5,a4,53be <follow_path+0x1a4>
		if (c == '/' || c == '\\') {	/* Break if a separator is found */
    5396:	02f00493          	li	s1,47
    539a:	00970663          	beq	a4,s1,53a6 <follow_path+0x18c>
    539e:	05c00493          	li	s1,92
    53a2:	ec9714e3          	bne	a4,s1,526a <follow_path+0x50>
			while (p[si] == '/' || p[si] == '\\') si++;	/* Skip duplicated separator if exist */
    53a6:	02f00293          	li	t0,47
    53aa:	05c00513          	li	a0,92
    53ae:	00c305b3          	add	a1,t1,a2
    53b2:	0005c583          	lbu	a1,0(a1)
    53b6:	ea5588e3          	beq	a1,t0,5266 <follow_path+0x4c>
    53ba:	eaa586e3          	beq	a1,a0,5266 <follow_path+0x4c>
	*path = p + si;						/* Return pointer to the next segment */
    53be:	9332                	add	t1,t1,a2
	if (i == 0) return FR_INVALID_NAME;	/* Reject nul string */
    53c0:	d68d                	beqz	a3,52ea <follow_path+0xd0>
	if (sfn[0] == DDEM) sfn[0] = RDDEM;	/* If the first character collides with DDEM, replace it with RDDEM */
    53c2:	02044603          	lbu	a2,32(s0)
    53c6:	0e500693          	li	a3,229
    53ca:	00d61563          	bne	a2,a3,53d4 <follow_path+0x1ba>
    53ce:	4695                	li	a3,5
    53d0:	02d40023          	sb	a3,32(s0)
	sfn[NSFLAG] = (c <= ' ') ? NS_LAST : 0;		/* Set last segment flag if end of the path */
    53d4:	02000613          	li	a2,32
    53d8:	4691                	li	a3,4
    53da:	00e67363          	bgeu	a2,a4,53e0 <follow_path+0x1c6>
    53de:	4681                	li	a3,0
    53e0:	02d405a3          	sb	a3,43(s0)
	res = dir_sdi(dp, 0);			/* Rewind directory object */
    53e4:	8522                	mv	a0,s0
    53e6:	c21a                	sw	t1,4(sp)
	FATFS *fs = dp->obj.fs;
    53e8:	4004                	lw	s1,0(s0)
	res = dir_sdi(dp, 0);			/* Rewind directory object */
    53ea:	bddff0ef          	jal	ra,4fc6 <dir_sdi.constprop.13>
	if (res != FR_OK) return res;
    53ee:	4312                	lw	t1,4(sp)
    53f0:	f50d                	bnez	a0,531a <follow_path+0x100>
		res = move_window(fs, dp->sect);
    53f2:	4c0c                	lw	a1,24(s0)
    53f4:	8526                	mv	a0,s1
    53f6:	c21a                	sw	t1,4(sp)
    53f8:	bccff0ef          	jal	ra,47c4 <move_window>
		if (res != FR_OK) break;
    53fc:	4312                	lw	t1,4(sp)
    53fe:	fd11                	bnez	a0,531a <follow_path+0x100>
		c = dp->dir[DIR_Name];
    5400:	4c50                	lw	a2,28(s0)
		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
    5402:	00064703          	lbu	a4,0(a2)
    5406:	db05                	beqz	a4,5336 <follow_path+0x11c>
		dp->obj.attr = dp->dir[DIR_Attr] & AM_MASK;
    5408:	00b64703          	lbu	a4,11(a2)
    540c:	03f77713          	andi	a4,a4,63
    5410:	00e40323          	sb	a4,6(s0)
		if (!(dp->dir[DIR_Attr] & AM_VOL) && !mem_cmp(dp->dir, dp->fn, 11)) break;	/* Is it a valid entry? */
    5414:	00b64703          	lbu	a4,11(a2)
    5418:	8b21                	andi	a4,a4,8
    541a:	e305                	bnez	a4,543a <follow_path+0x220>
	} while (--cnt && r == 0);
    541c:	45a9                	li	a1,10
		r = *d++ - *s++;
    541e:	00e606b3          	add	a3,a2,a4
    5422:	00e402b3          	add	t0,s0,a4
    5426:	0006c683          	lbu	a3,0(a3)
    542a:	0202c283          	lbu	t0,32(t0) # 80000020 <__heap_end+0x5ffd0020>
    542e:	405686b3          	sub	a3,a3,t0
	} while (--cnt && r == 0);
    5432:	eeb702e3          	beq	a4,a1,5316 <follow_path+0xfc>
    5436:	0705                	addi	a4,a4,1
    5438:	d2fd                	beqz	a3,541e <follow_path+0x204>
		res = dir_next(dp, 0);	/* Next entry */
    543a:	4581                	li	a1,0
    543c:	8522                	mv	a0,s0
    543e:	c21a                	sw	t1,4(sp)
    5440:	c83ff0ef          	jal	ra,50c2 <dir_next>
    5444:	b76d                	j	53ee <follow_path+0x1d4>
						if (!(ns & NS_LAST)) res = FR_NO_PATH;	/* Adjust error code if not last segment */
    5446:	4515                	li	a0,5
    5448:	b5d5                	j	532c <follow_path+0x112>
			if (ni == 11 || c != '.') return FR_INVALID_NAME;	/* Field overflow or invalid dot? */
    544a:	472d                	li	a4,11
    544c:	e8e50fe3          	beq	a0,a4,52ea <follow_path+0xd0>
			i = 8; ni = 11;				/* Enter file extension field */
    5450:	46a1                	li	a3,8
    5452:	452d                	li	a0,11
    5454:	b551                	j	52d8 <follow_path+0xbe>

00005456 <sync_fs>:
{
    5456:	1151                	addi	sp,sp,-12
    5458:	c222                	sw	s0,4(sp)
    545a:	c406                	sw	ra,8(sp)
	if (fs->wflag) {	/* Is the disk access window dirty? */
    545c:	00354783          	lbu	a5,3(a0)
{
    5460:	842a                	mv	s0,a0
	if (fs->wflag) {	/* Is the disk access window dirty? */
    5462:	e7e1                	bnez	a5,552a <sync_fs+0xd4>
		if (fs->fs_type == FS_FAT32 && fs->fsi_flag == 1) {	/* FAT32: Update FSInfo sector if needed */
    5464:	00044703          	lbu	a4,0(s0)
    5468:	478d                	li	a5,3
    546a:	0af71763          	bne	a4,a5,5518 <sync_fs+0xc2>
    546e:	00444703          	lbu	a4,4(s0)
    5472:	4785                	li	a5,1
    5474:	0af71263          	bne	a4,a5,5518 <sync_fs+0xc2>
			mem_set(fs->win, 0, sizeof fs->win);
    5478:	03040593          	addi	a1,s0,48
	BYTE *d = (BYTE*)dst;
    547c:	23040713          	addi	a4,s0,560
    5480:	87ae                	mv	a5,a1
		*d++ = (BYTE)val;
    5482:	0785                	addi	a5,a5,1
    5484:	fe078fa3          	sb	zero,-1(a5)
	} while (--cnt);
    5488:	fef71de3          	bne	a4,a5,5482 <sync_fs+0x2c>
	*ptr++ = (BYTE)val; val >>= 8;
    548c:	05500793          	li	a5,85
    5490:	22f40723          	sb	a5,558(s0)
	*ptr++ = (BYTE)val;
    5494:	faa00793          	li	a5,-86
    5498:	22f407a3          	sb	a5,559(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    549c:	05200793          	li	a5,82
    54a0:	02f40823          	sb	a5,48(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54a4:	02f408a3          	sb	a5,49(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54a8:	06100793          	li	a5,97
    54ac:	02f40923          	sb	a5,50(s0)
	*ptr++ = (BYTE)val;
    54b0:	20f40ba3          	sb	a5,535(s0)
			st_dword(fs->win + FSI_Free_Count, fs->free_clst);	/* Number of free clusters */
    54b4:	481c                	lw	a5,16(s0)
	*ptr++ = (BYTE)val;
    54b6:	04100713          	li	a4,65
    54ba:	02e409a3          	sb	a4,51(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54be:	20e40b23          	sb	a4,534(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54c2:	0087d713          	srli	a4,a5,0x8
    54c6:	20f40c23          	sb	a5,536(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54ca:	20e40ca3          	sb	a4,537(s0)
    54ce:	0107d713          	srli	a4,a5,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    54d2:	83e1                	srli	a5,a5,0x18
	*ptr++ = (BYTE)val;
    54d4:	20f40da3          	sb	a5,539(s0)
			st_dword(fs->win + FSI_Nxt_Free, fs->last_clst);	/* Last allocated culuster */
    54d8:	445c                	lw	a5,12(s0)
			fs->winsect = fs->volbase + 1;						/* Write it into the FSInfo sector (Next to VBR) */
    54da:	4c50                	lw	a2,28(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54dc:	20e40d23          	sb	a4,538(s0)
			disk_write(fs->pdrv, fs->win, fs->winsect, 1);
    54e0:	00144503          	lbu	a0,1(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54e4:	0087d713          	srli	a4,a5,0x8
    54e8:	07200693          	li	a3,114
    54ec:	20f40e23          	sb	a5,540(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    54f0:	20e40ea3          	sb	a4,541(s0)
			fs->winsect = fs->volbase + 1;						/* Write it into the FSInfo sector (Next to VBR) */
    54f4:	0605                	addi	a2,a2,1
	*ptr++ = (BYTE)val; val >>= 8;
    54f6:	0107d713          	srli	a4,a5,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    54fa:	83e1                	srli	a5,a5,0x18
	*ptr++ = (BYTE)val; val >>= 8;
    54fc:	20d40a23          	sb	a3,532(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    5500:	20d40aa3          	sb	a3,533(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    5504:	20e40f23          	sb	a4,542(s0)
	*ptr++ = (BYTE)val;
    5508:	20f40fa3          	sb	a5,543(s0)
			fs->winsect = fs->volbase + 1;						/* Write it into the FSInfo sector (Next to VBR) */
    550c:	d450                	sw	a2,44(s0)
			disk_write(fs->pdrv, fs->win, fs->winsect, 1);
    550e:	4685                	li	a3,1
    5510:	507000ef          	jal	ra,6216 <disk_write>
			fs->fsi_flag = 0;
    5514:	00040223          	sb	zero,4(s0)
		if (disk_ioctl(fs->pdrv, CTRL_SYNC, 0) != RES_OK) res = FR_DISK_ERR;
    5518:	00144503          	lbu	a0,1(s0)
    551c:	4601                	li	a2,0
    551e:	4581                	li	a1,0
    5520:	58d000ef          	jal	ra,62ac <disk_ioctl>
    5524:	00a03533          	snez	a0,a0
	return res;
    5528:	a021                	j	5530 <sync_fs+0xda>
    552a:	a3eff0ef          	jal	ra,4768 <sync_window.part.4>
	if (res == FR_OK) {
    552e:	d91d                	beqz	a0,5464 <sync_fs+0xe>
}
    5530:	40a2                	lw	ra,8(sp)
    5532:	4412                	lw	s0,4(sp)
    5534:	0131                	addi	sp,sp,12
    5536:	8082                	ret

00005538 <f_mount>:
FRESULT f_mount (
	FATFS* fs,			/* Pointer to the filesystem object (NULL:unmount)*/
	const TCHAR* path,	/* Logical drive number to be mounted/unmounted */
	BYTE opt			/* Mode option 0:Do not mount (delayed mount), 1:Mount immediately */
)
{
    5538:	1111                	addi	sp,sp,-28
    553a:	c42a                	sw	a0,8(sp)
	FRESULT res;
	const TCHAR *rp = path;


	/* Get logical drive number */
	vol = get_ldnumber(&rp);
    553c:	0068                	addi	a0,sp,12
{
    553e:	cc06                	sw	ra,24(sp)
    5540:	c22e                	sw	a1,4(sp)
    5542:	c032                	sw	a2,0(sp)
	const TCHAR *rp = path;
    5544:	c62e                	sw	a1,12(sp)
	vol = get_ldnumber(&rp);
    5546:	932ff0ef          	jal	ra,4678 <get_ldnumber>
	if (vol < 0) return FR_INVALID_DRIVE;
    554a:	02054d63          	bltz	a0,5584 <f_mount+0x4c>
	cfs = FatFs[vol];					/* Pointer to fs object */
    554e:	05418713          	addi	a4,gp,84 # 2000053c <FatFs>
    5552:	050a                	slli	a0,a0,0x2
    5554:	972a                	add	a4,a4,a0
    5556:	4318                	lw	a4,0(a4)

	if (cfs) {
    5558:	05418793          	addi	a5,gp,84 # 2000053c <FatFs>
    555c:	4602                	lw	a2,0(sp)
    555e:	c319                	beqz	a4,5564 <f_mount+0x2c>
		clear_lock(cfs);
#endif
#if FF_FS_REENTRANT						/* Discard sync object of the current volume */
		if (!ff_del_syncobj(cfs->sobj)) return FR_INT_ERR;
#endif
		cfs->fs_type = 0;				/* Clear old fs object */
    5560:	00070023          	sb	zero,0(a4)
	}

	if (fs) {
    5564:	4722                	lw	a4,8(sp)
    5566:	c319                	beqz	a4,556c <f_mount+0x34>
		fs->fs_type = 0;				/* Clear new fs object */
    5568:	00070023          	sb	zero,0(a4)
#if FF_FS_REENTRANT						/* Create sync object for the new volume */
		if (!ff_cre_syncobj((BYTE)vol, &fs->sobj)) return FR_INT_ERR;
#endif
	}
	FatFs[vol] = fs;					/* Register new fs object */
    556c:	97aa                	add	a5,a5,a0
    556e:	c398                	sw	a4,0(a5)

	if (opt == 0) return FR_OK;			/* Do not mount now, it will be mounted later */
    5570:	4501                	li	a0,0
    5572:	c611                	beqz	a2,557e <f_mount+0x46>

	res = mount_volume(&path, &fs, 0);	/* Force mounted the volume */
    5574:	4601                	li	a2,0
    5576:	002c                	addi	a1,sp,8
    5578:	0048                	addi	a0,sp,4
    557a:	f4aff0ef          	jal	ra,4cc4 <mount_volume>
	LEAVE_FF(fs, res);
}
    557e:	40e2                	lw	ra,24(sp)
    5580:	0171                	addi	sp,sp,28
    5582:	8082                	ret
	if (vol < 0) return FR_INVALID_DRIVE;
    5584:	452d                	li	a0,11
    5586:	bfe5                	j	557e <f_mount+0x46>

00005588 <f_open>:
FRESULT f_open (
	FIL* fp,			/* Pointer to the blank file object */
	const TCHAR* path,	/* Pointer to the file name */
	BYTE mode			/* Access mode and file open mode flags */
)
{
    5588:	715d                	addi	sp,sp,-80
    558a:	c686                	sw	ra,76(sp)
    558c:	c4a2                	sw	s0,72(sp)
    558e:	c2a6                	sw	s1,68(sp)
    5590:	c82e                	sw	a1,16(sp)
	FSIZE_t ofs;
#endif
	DEF_NAMBUF


	if (!fp) return FR_INVALID_OBJECT;
    5592:	20050b63          	beqz	a0,57a8 <f_open+0x220>

	/* Get logical drive number */
	mode &= FF_FS_READONLY ? FA_READ : FA_READ | FA_WRITE | FA_CREATE_ALWAYS | FA_CREATE_NEW | FA_OPEN_ALWAYS | FA_OPEN_APPEND;
    5596:	03f67493          	andi	s1,a2,63
    559a:	c232                	sw	a2,4(sp)
    559c:	842a                	mv	s0,a0
	res = mount_volume(&path, &fs, mode);
    559e:	8626                	mv	a2,s1
    55a0:	084c                	addi	a1,sp,20
    55a2:	0808                	addi	a0,sp,16
    55a4:	f20ff0ef          	jal	ra,4cc4 <mount_volume>
    55a8:	c02a                	sw	a0,0(sp)
	if (res == FR_OK) {
    55aa:	ed05                	bnez	a0,55e2 <f_open+0x5a>
		dj.obj.fs = fs;
    55ac:	4752                	lw	a4,20(sp)
		INIT_NAMBUF(fs);
		res = follow_path(&dj, path);	/* Follow the file path */
    55ae:	45c2                	lw	a1,16(sp)
    55b0:	0828                	addi	a0,sp,24
		dj.obj.fs = fs;
    55b2:	cc3a                	sw	a4,24(sp)
		res = follow_path(&dj, path);	/* Follow the file path */
    55b4:	c67ff0ef          	jal	ra,521a <follow_path>
#if !FF_FS_READONLY	/* Read/Write configuration */
		if (res == FR_OK) {
    55b8:	4792                	lw	a5,4(sp)
    55ba:	e511                	bnez	a0,55c6 <f_open+0x3e>
			if (dj.fn[NSFLAG] & NS_NONAME) {	/* Origin directory itself? */
    55bc:	04310703          	lb	a4,67(sp)
    55c0:	00075363          	bgez	a4,55c6 <f_open+0x3e>
				res = FR_INVALID_NAME;
    55c4:	4519                	li	a0,6
				res = chk_lock(&dj, (mode & ~FA_READ) ? 1 : 0);		/* Check if the file can be used */
			}
#endif
		}
		/* Create or Open a file */
		if (mode & (FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW)) {
    55c6:	01c7f713          	andi	a4,a5,28
    55ca:	18070b63          	beqz	a4,5760 <f_open+0x1d8>
			if (res != FR_OK) {					/* No file, create new */
    55ce:	c11d                	beqz	a0,55f4 <f_open+0x6c>
				if (res == FR_NO_FILE) {		/* There is no file to open, create a new entry */
    55d0:	4791                	li	a5,4
    55d2:	00f51863          	bne	a0,a5,55e2 <f_open+0x5a>
#if FF_FS_LOCK != 0
					res = enq_lock() ? dir_register(&dj) : FR_TOO_MANY_OPEN_FILES;
#else
					res = dir_register(&dj);
    55d6:	0828                	addi	a0,sp,24
    55d8:	bc1ff0ef          	jal	ra,5198 <dir_register>
#endif
				}
				mode |= FA_CREATE_ALWAYS;		/* File is created */
    55dc:	0084e493          	ori	s1,s1,8
					res = FR_DENIED;
				} else {
					if (mode & FA_CREATE_NEW) res = FR_EXIST;	/* Cannot create as new file */
				}
			}
			if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {	/* Truncate the file if overwrite mode */
    55e0:	c50d                	beqz	a0,560a <f_open+0x82>
		}

		FREE_NAMBUF();
	}

	if (res != FR_OK) fp->obj.fs = 0;	/* Invalidate file object on error */
    55e2:	00042023          	sw	zero,0(s0)
    55e6:	c02a                	sw	a0,0(sp)

	LEAVE_FF(fs, res);
}
    55e8:	40b6                	lw	ra,76(sp)
    55ea:	4426                	lw	s0,72(sp)
    55ec:	4502                	lw	a0,0(sp)
    55ee:	4496                	lw	s1,68(sp)
    55f0:	6161                	addi	sp,sp,80
    55f2:	8082                	ret
				if (dj.obj.attr & (AM_RDO | AM_DIR)) {	/* Cannot overwrite it (R/O or DIR) */
    55f4:	01e14703          	lbu	a4,30(sp)
    55f8:	8b45                	andi	a4,a4,17
    55fa:	16071e63          	bnez	a4,5776 <f_open+0x1ee>
					if (mode & FA_CREATE_NEW) res = FR_EXIST;	/* Cannot create as new file */
    55fe:	0047f713          	andi	a4,a5,4
    5602:	18071f63          	bnez	a4,57a0 <f_open+0x218>
			if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {	/* Truncate the file if overwrite mode */
    5606:	8ba1                	andi	a5,a5,8
    5608:	cfc9                	beqz	a5,56a2 <f_open+0x11a>
					st_dword(dj.dir + DIR_CrtTime, tm);
    560a:	57d2                	lw	a5,52(sp)
	*ptr++ = (BYTE)val; val >>= 8;
    560c:	02100693          	li	a3,33
	*ptr++ = (BYTE)val;
    5610:	05000713          	li	a4,80
	*ptr++ = (BYTE)val; val >>= 8;
    5614:	00d78823          	sb	a3,16(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    5618:	00078723          	sb	zero,14(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    561c:	000787a3          	sb	zero,15(a5)
	*ptr++ = (BYTE)val;
    5620:	00e788a3          	sb	a4,17(a5)
					st_dword(dj.dir + DIR_ModTime, tm);
    5624:	57d2                	lw	a5,52(sp)
	*ptr++ = (BYTE)val; val >>= 8;
    5626:	00d78c23          	sb	a3,24(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    562a:	00078b23          	sb	zero,22(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    562e:	00078ba3          	sb	zero,23(a5)
	*ptr++ = (BYTE)val;
    5632:	00e78ca3          	sb	a4,25(a5)
					cl = ld_clust(fs, dj.dir);			/* Get current cluster chain */
    5636:	47d2                	lw	a5,20(sp)
    5638:	5752                	lw	a4,52(sp)
    563a:	0007c503          	lbu	a0,0(a5)
    563e:	85ba                	mv	a1,a4
    5640:	c63a                	sw	a4,12(sp)
    5642:	c43e                	sw	a5,8(sp)
    5644:	8d6ff0ef          	jal	ra,471a <ld_clust.isra.1>
					dj.dir[DIR_Attr] = AM_ARC;			/* Reset attribute */
    5648:	4732                	lw	a4,12(sp)
    564a:	02000693          	li	a3,32
					st_clust(fs, dj.dir, 0);			/* Reset file allocation info */
    564e:	47a2                	lw	a5,8(sp)
					dj.dir[DIR_Attr] = AM_ARC;			/* Reset attribute */
    5650:	00d705a3          	sb	a3,11(a4)
					st_clust(fs, dj.dir, 0);			/* Reset file allocation info */
    5654:	55d2                	lw	a1,52(sp)
					cl = ld_clust(fs, dj.dir);			/* Get current cluster chain */
    5656:	c22a                	sw	a0,4(sp)
					st_clust(fs, dj.dir, 0);			/* Reset file allocation info */
    5658:	4601                	li	a2,0
    565a:	853e                	mv	a0,a5
    565c:	8e4ff0ef          	jal	ra,4740 <st_clust.isra.2>
					st_dword(dj.dir + DIR_FileSize, 0);
    5660:	57d2                	lw	a5,52(sp)
					fs->wflag = 1;
    5662:	4705                	li	a4,1
	*ptr++ = (BYTE)val; val >>= 8;
    5664:	00078e23          	sb	zero,28(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    5668:	00078ea3          	sb	zero,29(a5)
	*ptr++ = (BYTE)val; val >>= 8;
    566c:	00078f23          	sb	zero,30(a5)
	*ptr++ = (BYTE)val;
    5670:	00078fa3          	sb	zero,31(a5)
					fs->wflag = 1;
    5674:	47d2                	lw	a5,20(sp)
    5676:	00e781a3          	sb	a4,3(a5)
					if (cl != 0) {						/* Remove the cluster chain if exist */
    567a:	4712                	lw	a4,4(sp)
    567c:	c31d                	beqz	a4,56a2 <f_open+0x11a>
						sc = fs->winsect;
    567e:	57dc                	lw	a5,44(a5)
						res = remove_chain(&dj.obj, cl, 0);
    5680:	4601                	li	a2,0
    5682:	85ba                	mv	a1,a4
    5684:	0828                	addi	a0,sp,24
						sc = fs->winsect;
    5686:	c43e                	sw	a5,8(sp)
						res = remove_chain(&dj.obj, cl, 0);
    5688:	db4ff0ef          	jal	ra,4c3c <remove_chain>
						if (res == FR_OK) {
    568c:	47a2                	lw	a5,8(sp)
    568e:	f931                	bnez	a0,55e2 <f_open+0x5a>
							res = move_window(fs, sc);
    5690:	4552                	lw	a0,20(sp)
    5692:	85be                	mv	a1,a5
    5694:	930ff0ef          	jal	ra,47c4 <move_window>
							fs->last_clst = cl - 1;		/* Reuse the cluster hole */
    5698:	4792                	lw	a5,4(sp)
    569a:	4752                	lw	a4,20(sp)
    569c:	17fd                	addi	a5,a5,-1
    569e:	c75c                	sw	a5,12(a4)
		if (res == FR_OK) {
    56a0:	f129                	bnez	a0,55e2 <f_open+0x5a>
			if (mode & FA_CREATE_ALWAYS) mode |= FA_MODIFIED;	/* Set file change flag if created or overwritten */
    56a2:	0084f793          	andi	a5,s1,8
    56a6:	c399                	beqz	a5,56ac <f_open+0x124>
    56a8:	0404e493          	ori	s1,s1,64
			fp->dir_sect = fs->winsect;			/* Pointer to the directory entry */
    56ac:	4752                	lw	a4,20(sp)
    56ae:	575c                	lw	a5,44(a4)
				fp->obj.sclust = ld_clust(fs, dj.dir);					/* Get object allocation info */
    56b0:	c23a                	sw	a4,4(sp)
			fp->dir_sect = fs->winsect;			/* Pointer to the directory entry */
    56b2:	d01c                	sw	a5,32(s0)
			fp->dir_ptr = dj.dir;
    56b4:	57d2                	lw	a5,52(sp)
    56b6:	d05c                	sw	a5,36(s0)
				fp->obj.sclust = ld_clust(fs, dj.dir);					/* Get object allocation info */
    56b8:	00074503          	lbu	a0,0(a4)
    56bc:	85be                	mv	a1,a5
    56be:	c43e                	sw	a5,8(sp)
    56c0:	85aff0ef          	jal	ra,471a <ld_clust.isra.1>
				fp->obj.objsize = ld_dword(dj.dir + DIR_FileSize);
    56c4:	47a2                	lw	a5,8(sp)
				fp->obj.sclust = ld_clust(fs, dj.dir);					/* Get object allocation info */
    56c6:	c408                	sw	a0,8(s0)
				fp->obj.objsize = ld_dword(dj.dir + DIR_FileSize);
    56c8:	01c78513          	addi	a0,a5,28
    56cc:	f73fe0ef          	jal	ra,463e <ld_dword>
			fp->obj.fs = fs;	 	/* Validate the file object */
    56d0:	4712                	lw	a4,4(sp)
				fp->obj.objsize = ld_dword(dj.dir + DIR_FileSize);
    56d2:	c448                	sw	a0,12(s0)
			fp->obj.fs = fs;	 	/* Validate the file object */
    56d4:	22840693          	addi	a3,s0,552
			fp->obj.id = fs->id;
    56d8:	00675783          	lhu	a5,6(a4)
			fp->obj.fs = fs;	 	/* Validate the file object */
    56dc:	c018                	sw	a4,0(s0)
			fp->flag = mode;		/* Set file access mode */
    56de:	00940823          	sb	s1,16(s0)
			fp->obj.id = fs->id;
    56e2:	00f41223          	sh	a5,4(s0)
			mem_set(fp->buf, 0, sizeof fp->buf);	/* Clear sector buffer */
    56e6:	02840793          	addi	a5,s0,40
			fp->err = 0;			/* Clear error flag */
    56ea:	000408a3          	sb	zero,17(s0)
			fp->sect = 0;			/* Invalidate current data sector */
    56ee:	00042e23          	sw	zero,28(s0)
			fp->fptr = 0;			/* Set file pointer top of the file */
    56f2:	00042a23          	sw	zero,20(s0)
			mem_set(fp->buf, 0, sizeof fp->buf);	/* Clear sector buffer */
    56f6:	c23e                	sw	a5,4(sp)
		*d++ = (BYTE)val;
    56f8:	0785                	addi	a5,a5,1
    56fa:	fe078fa3          	sb	zero,-1(a5)
	} while (--cnt);
    56fe:	fef69de3          	bne	a3,a5,56f8 <f_open+0x170>
			if ((mode & FA_SEEKEND) && fp->obj.objsize > 0) {	/* Seek to end of file if FA_OPEN_APPEND is specified */
    5702:	0204f793          	andi	a5,s1,32
    5706:	ee0781e3          	beqz	a5,55e8 <f_open+0x60>
    570a:	445c                	lw	a5,12(s0)
    570c:	ec078ee3          	beqz	a5,55e8 <f_open+0x60>
				bcs = (DWORD)fs->csize * SS(fs);	/* Cluster size in byte */
    5710:	00a75703          	lhu	a4,10(a4)
				clst = fp->obj.sclust;				/* Follow the cluster chain */
    5714:	440c                	lw	a1,8(s0)
				fp->fptr = fp->obj.objsize;			/* Offset to seek */
    5716:	c85c                	sw	a5,20(s0)
				bcs = (DWORD)fs->csize * SS(fs);	/* Cluster size in byte */
    5718:	0726                	slli	a4,a4,0x9
				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
    571a:	06f76063          	bltu	a4,a5,577a <f_open+0x1f2>
    571e:	4501                	li	a0,0
				fp->clust = clst;
    5720:	cc0c                	sw	a1,24(s0)
				if (res == FR_OK && ofs % SS(fs)) {	/* Fill sector buffer if not on the sector boundary */
    5722:	ec0510e3          	bnez	a0,55e2 <f_open+0x5a>
    5726:	1ff7f713          	andi	a4,a5,511
    572a:	c63e                	sw	a5,12(sp)
    572c:	ea070ee3          	beqz	a4,55e8 <f_open+0x60>
					sc = clst2sect(fs, clst);
    5730:	4752                	lw	a4,20(sp)
    5732:	853a                	mv	a0,a4
    5734:	c43a                	sw	a4,8(sp)
    5736:	f27fe0ef          	jal	ra,465c <clst2sect>
    573a:	862a                	mv	a2,a0
					if (sc == 0) {
    573c:	4722                	lw	a4,8(sp)
						res = FR_INT_ERR;
    573e:	4509                	li	a0,2
					if (sc == 0) {
    5740:	47b2                	lw	a5,12(sp)
    5742:	ea0600e3          	beqz	a2,55e2 <f_open+0x5a>
						fp->sect = sc + (DWORD)(ofs / SS(fs));
    5746:	83a5                	srli	a5,a5,0x9
    5748:	963e                	add	a2,a2,a5
    574a:	cc50                	sw	a2,28(s0)
						if (disk_read(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) res = FR_DISK_ERR;
    574c:	4592                	lw	a1,4(sp)
    574e:	00174503          	lbu	a0,1(a4)
    5752:	4685                	li	a3,1
    5754:	251000ef          	jal	ra,61a4 <disk_read>
    5758:	e80508e3          	beqz	a0,55e8 <f_open+0x60>
    575c:	4505                	li	a0,1
    575e:	b551                	j	55e2 <f_open+0x5a>
			if (res == FR_OK) {					/* Is the object exsiting? */
    5760:	e80511e3          	bnez	a0,55e2 <f_open+0x5a>
				if (dj.obj.attr & AM_DIR) {		/* File open against a directory */
    5764:	01e14703          	lbu	a4,30(sp)
    5768:	01077693          	andi	a3,a4,16
    576c:	ee85                	bnez	a3,57a4 <f_open+0x21c>
					if ((mode & FA_WRITE) && (dj.obj.attr & AM_RDO)) { /* Write mode open against R/O file */
    576e:	8b89                	andi	a5,a5,2
    5770:	db8d                	beqz	a5,56a2 <f_open+0x11a>
    5772:	8b05                	andi	a4,a4,1
    5774:	d71d                	beqz	a4,56a2 <f_open+0x11a>
					res = FR_DENIED;
    5776:	451d                	li	a0,7
    5778:	b5ad                	j	55e2 <f_open+0x5a>
					clst = get_fat(&fp->obj, clst);
    577a:	4008                	lw	a0,0(s0)
    577c:	c63e                	sw	a5,12(sp)
    577e:	c43a                	sw	a4,8(sp)
    5780:	ad6ff0ef          	jal	ra,4a56 <get_fat.isra.7>
    5784:	4722                	lw	a4,8(sp)
    5786:	47b2                	lw	a5,12(sp)
					if (clst <= 1) res = FR_INT_ERR;
    5788:	4685                	li	a3,1
					clst = get_fat(&fp->obj, clst);
    578a:	85aa                	mv	a1,a0
					if (clst <= 1) res = FR_INT_ERR;
    578c:	8f99                	sub	a5,a5,a4
    578e:	00a6f763          	bgeu	a3,a0,579c <f_open+0x214>
				for (ofs = fp->obj.objsize; res == FR_OK && ofs > bcs; ofs -= bcs) {
    5792:	56fd                	li	a3,-1
    5794:	f8d513e3          	bne	a0,a3,571a <f_open+0x192>
					if (clst == 0xFFFFFFFF) res = FR_DISK_ERR;
    5798:	4505                	li	a0,1
    579a:	b759                	j	5720 <f_open+0x198>
					if (clst <= 1) res = FR_INT_ERR;
    579c:	4509                	li	a0,2
    579e:	b749                	j	5720 <f_open+0x198>
					if (mode & FA_CREATE_NEW) res = FR_EXIST;	/* Cannot create as new file */
    57a0:	4521                	li	a0,8
    57a2:	b581                	j	55e2 <f_open+0x5a>
					res = FR_NO_FILE;
    57a4:	4511                	li	a0,4
    57a6:	bd35                	j	55e2 <f_open+0x5a>
	if (!fp) return FR_INVALID_OBJECT;
    57a8:	47a5                	li	a5,9
    57aa:	c03e                	sw	a5,0(sp)
    57ac:	bd35                	j	55e8 <f_open+0x60>

000057ae <f_write>:
	FIL* fp,			/* Pointer to the file object */
	const void* buff,	/* Pointer to the data to be written */
	UINT btw,			/* Number of bytes to write */
	UINT* bw			/* Pointer to number of bytes written */
)
{
    57ae:	fd810113          	addi	sp,sp,-40
    57b2:	d022                	sw	s0,32(sp)
    57b4:	ce26                	sw	s1,28(sp)
    57b6:	d206                	sw	ra,36(sp)
    57b8:	c22e                	sw	a1,4(sp)
	LBA_t sect;
	UINT wcnt, cc, csect;
	const BYTE *wbuff = (const BYTE*)buff;


	*bw = 0;	/* Clear write byte counter */
    57ba:	0006a023          	sw	zero,0(a3)
	res = validate(&fp->obj, &fs);			/* Check validity of the file object */
    57be:	082c                	addi	a1,sp,24
{
    57c0:	84aa                	mv	s1,a0
    57c2:	8432                	mv	s0,a2
    57c4:	c836                	sw	a3,16(sp)
	res = validate(&fp->obj, &fs);			/* Check validity of the file object */
    57c6:	ef1fe0ef          	jal	ra,46b6 <validate>
    57ca:	c02a                	sw	a0,0(sp)
	if (res != FR_OK || (res = (FRESULT)fp->err) != FR_OK) LEAVE_FF(fs, res);	/* Check validity */
    57cc:	e129                	bnez	a0,580e <f_write+0x60>
    57ce:	0114c783          	lbu	a5,17(s1)
    57d2:	c03e                	sw	a5,0(sp)
    57d4:	ef8d                	bnez	a5,580e <f_write+0x60>
	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
    57d6:	0104c703          	lbu	a4,16(s1)
    57da:	8b09                	andi	a4,a4,2
    57dc:	1a070863          	beqz	a4,598c <f_write+0x1de>

	/* Check fptr wrap-around (file size cannot reach 4 GiB at FAT volume) */
	if ((!FF_FS_EXFAT || fs->fs_type != FS_EXFAT) && (DWORD)(fp->fptr + btw) < (DWORD)fp->fptr) {
    57e0:	48d8                	lw	a4,20(s1)
    57e2:	008706b3          	add	a3,a4,s0
    57e6:	00e6f463          	bgeu	a3,a4,57ee <f_write+0x40>
		btw = (UINT)(0xFFFFFFFF - (DWORD)fp->fptr);
    57ea:	fff74413          	not	s0,a4
#if FF_FS_TINY
		if (move_window(fs, fp->sect) != FR_OK) ABORT(fs, FR_DISK_ERR);	/* Move sector window */
		mem_cpy(fs->win + fp->fptr % SS(fs), wbuff, wcnt);	/* Fit data to the sector */
		fs->wflag = 1;
#else
		mem_cpy(fp->buf + fp->fptr % SS(fs), wbuff, wcnt);	/* Fit data to the sector */
    57ee:	02848793          	addi	a5,s1,40
    57f2:	c63e                	sw	a5,12(sp)
    57f4:	a201                	j	58f4 <f_write+0x146>
						clst = create_chain(&fp->obj, fp->clust);	/* Follow or stretch cluster chain on the FAT */
    57f6:	4c8c                	lw	a1,24(s1)
    57f8:	8526                	mv	a0,s1
    57fa:	b40ff0ef          	jal	ra,4b3a <create_chain>
				if (clst == 0) break;		/* Could not allocate a new cluster (disk full) */
    57fe:	12051163          	bnez	a0,5920 <f_write+0x172>
		fp->flag |= FA_DIRTY;
#endif
	}

	fp->flag |= FA_MODIFIED;				/* Set file change flag */
    5802:	0104c703          	lbu	a4,16(s1)
    5806:	04076713          	ori	a4,a4,64
    580a:	00e48823          	sb	a4,16(s1)

	LEAVE_FF(fs, FR_OK);
}
    580e:	5092                	lw	ra,36(sp)
    5810:	5402                	lw	s0,32(sp)
    5812:	4502                	lw	a0,0(sp)
    5814:	44f2                	lw	s1,28(sp)
    5816:	02810113          	addi	sp,sp,40
    581a:	8082                	ret
				if (clst == 0xFFFFFFFF) ABORT(fs, FR_DISK_ERR);
    581c:	577d                	li	a4,-1
    581e:	00e51763          	bne	a0,a4,582c <f_write+0x7e>
    5822:	4705                	li	a4,1
    5824:	00e488a3          	sb	a4,17(s1)
    5828:	4785                	li	a5,1
    582a:	a211                	j	592e <f_write+0x180>
				if (fp->obj.sclust == 0) fp->obj.sclust = clst;	/* Set start cluster if the first write */
    582c:	4498                	lw	a4,8(s1)
				fp->clust = clst;			/* Update current cluster */
    582e:	cc88                	sw	a0,24(s1)
				if (fp->obj.sclust == 0) fp->obj.sclust = clst;	/* Set start cluster if the first write */
    5830:	e311                	bnez	a4,5834 <f_write+0x86>
    5832:	c488                	sw	a0,8(s1)
			if (fp->flag & FA_DIRTY) {		/* Write-back sector cache */
    5834:	01048703          	lb	a4,16(s1)
    5838:	02075163          	bgez	a4,585a <f_write+0xac>
				if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) ABORT(fs, FR_DISK_ERR);
    583c:	4762                	lw	a4,24(sp)
    583e:	4cd0                	lw	a2,28(s1)
    5840:	45b2                	lw	a1,12(sp)
    5842:	00174503          	lbu	a0,1(a4)
    5846:	4685                	li	a3,1
    5848:	1cf000ef          	jal	ra,6216 <disk_write>
    584c:	f979                	bnez	a0,5822 <f_write+0x74>
				fp->flag &= (BYTE)~FA_DIRTY;
    584e:	0104c703          	lbu	a4,16(s1)
    5852:	07f77713          	andi	a4,a4,127
    5856:	00e48823          	sb	a4,16(s1)
			sect = clst2sect(fs, fp->clust);	/* Get current sector */
    585a:	42e2                	lw	t0,24(sp)
    585c:	4c8c                	lw	a1,24(s1)
    585e:	8516                	mv	a0,t0
    5860:	ca16                	sw	t0,20(sp)
    5862:	dfbfe0ef          	jal	ra,465c <clst2sect>
			if (sect == 0) ABORT(fs, FR_INT_ERR);
    5866:	c161                	beqz	a0,5926 <f_write+0x178>
			sect += csect;
    5868:	47a2                	lw	a5,8(sp)
			if (cc > 0) {					/* Write maximum contiguous sectors directly */
    586a:	1ff00713          	li	a4,511
    586e:	42d2                	lw	t0,20(sp)
			sect += csect;
    5870:	00a78333          	add	t1,a5,a0
			if (cc > 0) {					/* Write maximum contiguous sectors directly */
    5874:	0a877f63          	bgeu	a4,s0,5932 <f_write+0x184>
				if (csect + cc > fs->csize) {	/* Clip at cluster boundary */
    5878:	00a2d683          	lhu	a3,10(t0)
			cc = btw / SS(fs);				/* When remaining bytes >= sector size, */
    587c:	00945713          	srli	a4,s0,0x9
				if (csect + cc > fs->csize) {	/* Clip at cluster boundary */
    5880:	00e78633          	add	a2,a5,a4
    5884:	00c6f463          	bgeu	a3,a2,588c <f_write+0xde>
					cc = fs->csize - csect;
    5888:	40f68733          	sub	a4,a3,a5
				if (disk_write(fs->pdrv, wbuff, sect, cc) != RES_OK) ABORT(fs, FR_DISK_ERR);
    588c:	4592                	lw	a1,4(sp)
    588e:	0012c503          	lbu	a0,1(t0)
    5892:	86ba                	mv	a3,a4
    5894:	861a                	mv	a2,t1
    5896:	ca3a                	sw	a4,20(sp)
    5898:	c41a                	sw	t1,8(sp)
    589a:	17d000ef          	jal	ra,6216 <disk_write>
    589e:	f151                	bnez	a0,5822 <f_write+0x74>
				if (fp->sect - sect < cc) { /* Refill sector cache if it gets invalidated by the direct write */
    58a0:	4ccc                	lw	a1,28(s1)
    58a2:	4322                	lw	t1,8(sp)
    58a4:	4752                	lw	a4,20(sp)
    58a6:	40658333          	sub	t1,a1,t1
    58aa:	02e37363          	bgeu	t1,a4,58d0 <f_write+0x122>
    58ae:	4792                	lw	a5,4(sp)
    58b0:	4532                	lw	a0,12(sp)
					mem_cpy(fp->buf, wbuff + ((fp->sect - sect) * SS(fs)), SS(fs));
    58b2:	0326                	slli	t1,t1,0x9
    58b4:	20000613          	li	a2,512
    58b8:	006785b3          	add	a1,a5,t1
    58bc:	c43a                	sw	a4,8(sp)
	if (cnt != 0) {
    58be:	e43fe0ef          	jal	ra,4700 <mem_cpy.part.0>
					fp->flag &= (BYTE)~FA_DIRTY;
    58c2:	0104c683          	lbu	a3,16(s1)
    58c6:	4722                	lw	a4,8(sp)
    58c8:	07f6f693          	andi	a3,a3,127
    58cc:	00d48823          	sb	a3,16(s1)
				wcnt = SS(fs) * cc;		/* Number of bytes transferred */
    58d0:	00971693          	slli	a3,a4,0x9
		btw -= wcnt, *bw += wcnt, wbuff += wcnt, fp->fptr += wcnt, fp->obj.objsize = (fp->fptr > fp->obj.objsize) ? fp->fptr : fp->obj.objsize) {
    58d4:	47c2                	lw	a5,16(sp)
    58d6:	8c15                	sub	s0,s0,a3
    58d8:	4398                	lw	a4,0(a5)
    58da:	9736                	add	a4,a4,a3
    58dc:	c398                	sw	a4,0(a5)
    58de:	48d8                	lw	a4,20(s1)
    58e0:	4792                	lw	a5,4(sp)
    58e2:	97b6                	add	a5,a5,a3
    58e4:	96ba                	add	a3,a3,a4
    58e6:	44d8                	lw	a4,12(s1)
    58e8:	c23e                	sw	a5,4(sp)
    58ea:	c8d4                	sw	a3,20(s1)
    58ec:	00d77363          	bgeu	a4,a3,58f2 <f_write+0x144>
    58f0:	8736                	mv	a4,a3
    58f2:	c4d8                	sw	a4,12(s1)
	for ( ;  btw;							/* Repeat until all data written */
    58f4:	f00407e3          	beqz	s0,5802 <f_write+0x54>
		if (fp->fptr % SS(fs) == 0) {		/* On the sector boundary? */
    58f8:	48d8                	lw	a4,20(s1)
    58fa:	1ff77693          	andi	a3,a4,511
    58fe:	eeb1                	bnez	a3,595a <f_write+0x1ac>
			csect = (UINT)(fp->fptr / SS(fs)) & (fs->csize - 1);	/* Sector offset in the cluster */
    5900:	46e2                	lw	a3,24(sp)
    5902:	00975613          	srli	a2,a4,0x9
    5906:	00a6d683          	lhu	a3,10(a3)
    590a:	16fd                	addi	a3,a3,-1
    590c:	00c6f7b3          	and	a5,a3,a2
    5910:	c43e                	sw	a5,8(sp)
			if (csect == 0) {				/* On the cluster boundary? */
    5912:	f38d                	bnez	a5,5834 <f_write+0x86>
				if (fp->fptr == 0) {		/* On the top of the file? */
    5914:	ee0711e3          	bnez	a4,57f6 <f_write+0x48>
					clst = fp->obj.sclust;	/* Follow from the origin */
    5918:	4488                	lw	a0,8(s1)
						clst = create_chain(&fp->obj, 0);	/* create a new cluster chain */
    591a:	4581                	li	a1,0
					if (clst == 0) {		/* If no cluster is allocated, */
    591c:	ec050ee3          	beqz	a0,57f8 <f_write+0x4a>
				if (clst == 1) ABORT(fs, FR_INT_ERR);
    5920:	4705                	li	a4,1
    5922:	eee51de3          	bne	a0,a4,581c <f_write+0x6e>
    5926:	4709                	li	a4,2
    5928:	00e488a3          	sb	a4,17(s1)
    592c:	4789                	li	a5,2
	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
    592e:	c03e                	sw	a5,0(sp)
    5930:	bdf9                	j	580e <f_write+0x60>
			if (fp->sect != sect && 		/* Fill sector cache with file data */
    5932:	4cd8                	lw	a4,28(s1)
    5934:	02670163          	beq	a4,t1,5956 <f_write+0x1a8>
    5938:	44d4                	lw	a3,12(s1)
    593a:	48d8                	lw	a4,20(s1)
    593c:	00d77d63          	bgeu	a4,a3,5956 <f_write+0x1a8>
				disk_read(fs->pdrv, fp->buf, sect, 1) != RES_OK) {
    5940:	45b2                	lw	a1,12(sp)
    5942:	0012c503          	lbu	a0,1(t0)
    5946:	861a                	mv	a2,t1
    5948:	4685                	li	a3,1
    594a:	c41a                	sw	t1,8(sp)
    594c:	059000ef          	jal	ra,61a4 <disk_read>
				fp->fptr < fp->obj.objsize &&
    5950:	4322                	lw	t1,8(sp)
    5952:	ec0518e3          	bnez	a0,5822 <f_write+0x74>
			fp->sect = sect;
    5956:	0064ae23          	sw	t1,28(s1)
		wcnt = SS(fs) - (UINT)fp->fptr % SS(fs);	/* Number of bytes remains in the sector */
    595a:	48c8                	lw	a0,20(s1)
    595c:	20000713          	li	a4,512
    5960:	86a2                	mv	a3,s0
    5962:	1ff57513          	andi	a0,a0,511
    5966:	8f09                	sub	a4,a4,a0
		if (wcnt > btw) wcnt = btw;					/* Clip it by btw if needed */
    5968:	00877363          	bgeu	a4,s0,596e <f_write+0x1c0>
    596c:	86ba                	mv	a3,a4
	if (cnt != 0) {
    596e:	47b2                	lw	a5,12(sp)
    5970:	4592                	lw	a1,4(sp)
    5972:	8636                	mv	a2,a3
    5974:	953e                	add	a0,a0,a5
    5976:	c436                	sw	a3,8(sp)
    5978:	d89fe0ef          	jal	ra,4700 <mem_cpy.part.0>
		fp->flag |= FA_DIRTY;
    597c:	0104c703          	lbu	a4,16(s1)
    5980:	46a2                	lw	a3,8(sp)
    5982:	f8076713          	ori	a4,a4,-128
    5986:	00e48823          	sb	a4,16(s1)
    598a:	b7a9                	j	58d4 <f_write+0x126>
	if (!(fp->flag & FA_WRITE)) LEAVE_FF(fs, FR_DENIED);	/* Check access mode */
    598c:	479d                	li	a5,7
    598e:	b745                	j	592e <f_write+0x180>

00005990 <f_sync>:
/*-----------------------------------------------------------------------*/

FRESULT f_sync (
	FIL* fp		/* Pointer to the file object */
)
{
    5990:	1141                	addi	sp,sp,-16
	FATFS *fs;
	DWORD tm;
	BYTE *dir;


	res = validate(&fp->obj, &fs);	/* Check validity of the file object */
    5992:	858a                	mv	a1,sp
{
    5994:	c226                	sw	s1,4(sp)
    5996:	c606                	sw	ra,12(sp)
    5998:	c422                	sw	s0,8(sp)
    599a:	84aa                	mv	s1,a0
	res = validate(&fp->obj, &fs);	/* Check validity of the file object */
    599c:	d1bfe0ef          	jal	ra,46b6 <validate>
    59a0:	87aa                	mv	a5,a0
	if (res == FR_OK) {
    59a2:	e945                	bnez	a0,5a52 <f_sync+0xc2>
		if (fp->flag & FA_MODIFIED) {	/* Is there any change to the file? */
    59a4:	0104c703          	lbu	a4,16(s1)
    59a8:	04077693          	andi	a3,a4,64
    59ac:	c2dd                	beqz	a3,5a52 <f_sync+0xc2>
#if !FF_FS_TINY
			if (fp->flag & FA_DIRTY) {	/* Write-back cached data if needed */
    59ae:	0762                	slli	a4,a4,0x18
    59b0:	8761                	srai	a4,a4,0x18
    59b2:	02075363          	bgez	a4,59d8 <f_sync+0x48>
				if (disk_write(fs->pdrv, fp->buf, fp->sect, 1) != RES_OK) LEAVE_FF(fs, FR_DISK_ERR);
    59b6:	4782                	lw	a5,0(sp)
    59b8:	4cd0                	lw	a2,28(s1)
    59ba:	4685                	li	a3,1
    59bc:	0017c503          	lbu	a0,1(a5)
    59c0:	02848593          	addi	a1,s1,40
    59c4:	053000ef          	jal	ra,6216 <disk_write>
    59c8:	4785                	li	a5,1
    59ca:	e541                	bnez	a0,5a52 <f_sync+0xc2>
				fp->flag &= (BYTE)~FA_DIRTY;
    59cc:	0104c783          	lbu	a5,16(s1)
    59d0:	07f7f793          	andi	a5,a5,127
    59d4:	00f48823          	sb	a5,16(s1)
					FREE_NAMBUF();
				}
			} else
#endif
			{
				res = move_window(fs, fp->dir_sect);
    59d8:	508c                	lw	a1,32(s1)
    59da:	4502                	lw	a0,0(sp)
    59dc:	de9fe0ef          	jal	ra,47c4 <move_window>
    59e0:	87aa                	mv	a5,a0
				if (res == FR_OK) {
    59e2:	e925                	bnez	a0,5a52 <f_sync+0xc2>
					dir = fp->dir_ptr;
    59e4:	50c0                	lw	s0,36(s1)
					dir[DIR_Attr] |= AM_ARC;						/* Set archive attribute to indicate that the file has been changed */
    59e6:	00b44783          	lbu	a5,11(s0)
					st_clust(fp->obj.fs, dir, fp->obj.sclust);		/* Update file allocation information  */
    59ea:	85a2                	mv	a1,s0
					dir[DIR_Attr] |= AM_ARC;						/* Set archive attribute to indicate that the file has been changed */
    59ec:	0207e793          	ori	a5,a5,32
    59f0:	00f405a3          	sb	a5,11(s0)
					st_clust(fp->obj.fs, dir, fp->obj.sclust);		/* Update file allocation information  */
    59f4:	4490                	lw	a2,8(s1)
    59f6:	4088                	lw	a0,0(s1)
    59f8:	d49fe0ef          	jal	ra,4740 <st_clust.isra.2>
					st_dword(dir + DIR_FileSize, (DWORD)fp->obj.objsize);	/* Update file size */
    59fc:	44dc                	lw	a5,12(s1)
					st_dword(dir + DIR_ModTime, tm);				/* Update modified time */
					st_word(dir + DIR_LstAccDate, 0);
					fs->wflag = 1;
    59fe:	4502                	lw	a0,0(sp)
	*ptr++ = (BYTE)val; val >>= 8;
    5a00:	00040b23          	sb	zero,22(s0)
    5a04:	0087d713          	srli	a4,a5,0x8
    5a08:	00f40e23          	sb	a5,28(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    5a0c:	00e40ea3          	sb	a4,29(s0)
    5a10:	0107d713          	srli	a4,a5,0x10
	*ptr++ = (BYTE)val; val >>= 8;
    5a14:	83e1                	srli	a5,a5,0x18
	*ptr++ = (BYTE)val;
    5a16:	00f40fa3          	sb	a5,31(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    5a1a:	02100793          	li	a5,33
    5a1e:	00f40c23          	sb	a5,24(s0)
	*ptr++ = (BYTE)val;
    5a22:	05000793          	li	a5,80
	*ptr++ = (BYTE)val; val >>= 8;
    5a26:	00e40f23          	sb	a4,30(s0)
	*ptr++ = (BYTE)val;
    5a2a:	00f40ca3          	sb	a5,25(s0)
	*ptr++ = (BYTE)val; val >>= 8;
    5a2e:	00040ba3          	sb	zero,23(s0)
					fs->wflag = 1;
    5a32:	4785                	li	a5,1
	*ptr++ = (BYTE)val; val >>= 8;
    5a34:	00040923          	sb	zero,18(s0)
	*ptr++ = (BYTE)val;
    5a38:	000409a3          	sb	zero,19(s0)
					fs->wflag = 1;
    5a3c:	00f501a3          	sb	a5,3(a0)
					res = sync_fs(fs);					/* Restore it to the directory */
    5a40:	a17ff0ef          	jal	ra,5456 <sync_fs>
					fp->flag &= (BYTE)~FA_MODIFIED;
    5a44:	0104c703          	lbu	a4,16(s1)
					res = sync_fs(fs);					/* Restore it to the directory */
    5a48:	87aa                	mv	a5,a0
					fp->flag &= (BYTE)~FA_MODIFIED;
    5a4a:	fbf77713          	andi	a4,a4,-65
    5a4e:	00e48823          	sb	a4,16(s1)
			}
		}
	}

	LEAVE_FF(fs, res);
}
    5a52:	40b2                	lw	ra,12(sp)
    5a54:	4422                	lw	s0,8(sp)
    5a56:	4492                	lw	s1,4(sp)
    5a58:	853e                	mv	a0,a5
    5a5a:	0141                	addi	sp,sp,16
    5a5c:	8082                	ret

00005a5e <f_close>:
/*-----------------------------------------------------------------------*/

FRESULT f_close (
	FIL* fp		/* Pointer to the file object to be closed */
)
{
    5a5e:	1141                	addi	sp,sp,-16
    5a60:	c422                	sw	s0,8(sp)
    5a62:	c606                	sw	ra,12(sp)
    5a64:	842a                	mv	s0,a0
	FRESULT res;
	FATFS *fs;

#if !FF_FS_READONLY
	res = f_sync(fp);					/* Flush cached data */
    5a66:	372d                	jal	5990 <f_sync>
	if (res == FR_OK)
    5a68:	e901                	bnez	a0,5a78 <f_close+0x1a>
#endif
	{
		res = validate(&fp->obj, &fs);	/* Lock volume */
    5a6a:	858a                	mv	a1,sp
    5a6c:	8522                	mv	a0,s0
    5a6e:	c49fe0ef          	jal	ra,46b6 <validate>
		if (res == FR_OK) {
    5a72:	e119                	bnez	a0,5a78 <f_close+0x1a>
#if FF_FS_LOCK != 0
			res = dec_lock(fp->obj.lockid);		/* Decrement file open counter */
			if (res == FR_OK) fp->obj.fs = 0;	/* Invalidate file object */
#else
			fp->obj.fs = 0;	/* Invalidate file object */
    5a74:	00042023          	sw	zero,0(s0)
			unlock_fs(fs, FR_OK);		/* Unlock volume */
#endif
		}
	}
	return res;
}
    5a78:	40b2                	lw	ra,12(sp)
    5a7a:	4422                	lw	s0,8(sp)
    5a7c:	0141                	addi	sp,sp,16
    5a7e:	8082                	ret

00005a80 <gpio_interrupt_handler>:
extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}
    5a80:	8082                	ret

00005a82 <xmit_mmc>:
static
void xmit_mmc (
	const BYTE* buff,	/* Data to be sent */
	UINT bc				/* Number of bytes to send */
)
{
    5a82:	1121                	addi	sp,sp,-24
    5a84:	00b507b3          	add	a5,a0,a1
    5a88:	ca06                	sw	ra,20(sp)
    5a8a:	c822                	sw	s0,16(sp)
    5a8c:	c626                	sw	s1,12(sp)
    5a8e:	c22a                	sw	a0,4(sp)
    5a90:	c43e                	sw	a5,8(sp)
	BYTE d;
    
	do {
		d = *buff++;	/* Get a byte to be sent */
    5a92:	4792                	lw	a5,4(sp)
    5a94:	0681a503          	lw	a0,104(gp) # 20000550 <sd_di_pin_handle_t>
    5a98:	0785                	addi	a5,a5,1
    5a9a:	c23e                	sw	a5,4(sp)
    5a9c:	fff7c783          	lbu	a5,-1(a5)
    5aa0:	06818493          	addi	s1,gp,104 # 20000550 <sd_di_pin_handle_t>
		if (d & 0x80) DI_H(); else DI_L();	/* bit7 */
    5aa4:	4585                	li	a1,1
		d = *buff++;	/* Get a byte to be sent */
    5aa6:	c03e                	sw	a5,0(sp)
		if (d & 0x80) DI_H(); else DI_L();	/* bit7 */
    5aa8:	00010783          	lb	a5,0(sp)
    5aac:	0007c363          	bltz	a5,5ab2 <xmit_mmc+0x30>
    5ab0:	4581                	li	a1,0
    5ab2:	e5bfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		CK_H(); CK_L();
    5ab6:	06018793          	addi	a5,gp,96 # 20000548 <sd_clk_pin_handle_t>
    5aba:	4388                	lw	a0,0(a5)
    5abc:	4585                	li	a1,1
    5abe:	e4ffd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5ac2:	06018793          	addi	a5,gp,96 # 20000548 <sd_clk_pin_handle_t>
    5ac6:	4388                	lw	a0,0(a5)
    5ac8:	4581                	li	a1,0
    5aca:	06018413          	addi	s0,gp,96 # 20000548 <sd_clk_pin_handle_t>
    5ace:	e3ffd0ef          	jal	ra,390c <csi_gpio_pin_write>
		if (d & 0x40) DI_H(); else DI_L();	/* bit6 */
    5ad2:	4782                	lw	a5,0(sp)
    5ad4:	4585                	li	a1,1
    5ad6:	0407f793          	andi	a5,a5,64
    5ada:	e391                	bnez	a5,5ade <xmit_mmc+0x5c>
    5adc:	4581                	li	a1,0
    5ade:	4088                	lw	a0,0(s1)
    5ae0:	e2dfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		CK_H(); CK_L();
    5ae4:	4008                	lw	a0,0(s0)
    5ae6:	4585                	li	a1,1
    5ae8:	e25fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5aec:	4008                	lw	a0,0(s0)
    5aee:	4581                	li	a1,0
    5af0:	e1dfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		if (d & 0x20) DI_H(); else DI_L();	/* bit5 */
    5af4:	4782                	lw	a5,0(sp)
    5af6:	4585                	li	a1,1
    5af8:	0207f793          	andi	a5,a5,32
    5afc:	e391                	bnez	a5,5b00 <xmit_mmc+0x7e>
    5afe:	4581                	li	a1,0
    5b00:	4088                	lw	a0,0(s1)
    5b02:	e0bfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b06:	4008                	lw	a0,0(s0)
    5b08:	4585                	li	a1,1
    5b0a:	e03fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5b0e:	4008                	lw	a0,0(s0)
    5b10:	4581                	li	a1,0
    5b12:	dfbfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		if (d & 0x10) DI_H(); else DI_L();	/* bit4 */
    5b16:	4782                	lw	a5,0(sp)
    5b18:	4585                	li	a1,1
    5b1a:	8bc1                	andi	a5,a5,16
    5b1c:	e391                	bnez	a5,5b20 <xmit_mmc+0x9e>
    5b1e:	4581                	li	a1,0
    5b20:	4088                	lw	a0,0(s1)
    5b22:	debfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b26:	4008                	lw	a0,0(s0)
    5b28:	4585                	li	a1,1
    5b2a:	de3fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5b2e:	4008                	lw	a0,0(s0)
    5b30:	4581                	li	a1,0
    5b32:	ddbfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		if (d & 0x08) DI_H(); else DI_L();	/* bit3 */
    5b36:	4782                	lw	a5,0(sp)
    5b38:	4585                	li	a1,1
    5b3a:	8ba1                	andi	a5,a5,8
    5b3c:	e391                	bnez	a5,5b40 <xmit_mmc+0xbe>
    5b3e:	4581                	li	a1,0
    5b40:	4088                	lw	a0,0(s1)
    5b42:	dcbfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b46:	4008                	lw	a0,0(s0)
    5b48:	4585                	li	a1,1
    5b4a:	dc3fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5b4e:	4008                	lw	a0,0(s0)
    5b50:	4581                	li	a1,0
    5b52:	dbbfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		if (d & 0x04) DI_H(); else DI_L();	/* bit2 */
    5b56:	4782                	lw	a5,0(sp)
    5b58:	4585                	li	a1,1
    5b5a:	8b91                	andi	a5,a5,4
    5b5c:	e391                	bnez	a5,5b60 <xmit_mmc+0xde>
    5b5e:	4581                	li	a1,0
    5b60:	4088                	lw	a0,0(s1)
    5b62:	dabfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b66:	4008                	lw	a0,0(s0)
    5b68:	4585                	li	a1,1
    5b6a:	da3fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5b6e:	4008                	lw	a0,0(s0)
    5b70:	4581                	li	a1,0
    5b72:	d9bfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		if (d & 0x02) DI_H(); else DI_L();	/* bit1 */
    5b76:	4782                	lw	a5,0(sp)
    5b78:	4585                	li	a1,1
    5b7a:	8b89                	andi	a5,a5,2
    5b7c:	e391                	bnez	a5,5b80 <xmit_mmc+0xfe>
    5b7e:	4581                	li	a1,0
    5b80:	4088                	lw	a0,0(s1)
    5b82:	d8bfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		CK_H(); CK_L();
    5b86:	4008                	lw	a0,0(s0)
    5b88:	4585                	li	a1,1
    5b8a:	d83fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5b8e:	4008                	lw	a0,0(s0)
    5b90:	4581                	li	a1,0
    5b92:	d7bfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		if (d & 0x01) DI_H(); else DI_L();	/* bit0 */
    5b96:	4782                	lw	a5,0(sp)
    5b98:	4585                	li	a1,1
    5b9a:	8b85                	andi	a5,a5,1
    5b9c:	e391                	bnez	a5,5ba0 <xmit_mmc+0x11e>
    5b9e:	4581                	li	a1,0
    5ba0:	4088                	lw	a0,0(s1)
    5ba2:	d6bfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		CK_H(); CK_L();
    5ba6:	4008                	lw	a0,0(s0)
    5ba8:	4585                	li	a1,1
    5baa:	d63fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5bae:	4008                	lw	a0,0(s0)
    5bb0:	4581                	li	a1,0
    5bb2:	d5bfd0ef          	jal	ra,390c <csi_gpio_pin_write>
	} while (--bc);
    5bb6:	4792                	lw	a5,4(sp)
    5bb8:	4722                	lw	a4,8(sp)
    5bba:	ece79ce3          	bne	a5,a4,5a92 <xmit_mmc+0x10>
}
    5bbe:	40d2                	lw	ra,20(sp)
    5bc0:	4442                	lw	s0,16(sp)
    5bc2:	44b2                	lw	s1,12(sp)
    5bc4:	0161                	addi	sp,sp,24
    5bc6:	8082                	ret

00005bc8 <soft_spi_init>:
{	
    5bc8:	1141                	addi	sp,sp,-16
    5bca:	c226                	sw	s1,4(sp)
    sd_cd_pin_handle_t = csi_gpio_pin_initialize(PA18, gpio_interrupt_handler);        //sd_cd_pin_handle_t PA18 				PA18	    PA18
    5bcc:	6499                	lui	s1,0x6
    5bce:	a8048593          	addi	a1,s1,-1408 # 5a80 <gpio_interrupt_handler>
    5bd2:	4549                	li	a0,18
{	
    5bd4:	c606                	sw	ra,12(sp)
    5bd6:	c422                	sw	s0,8(sp)
    sd_cd_pin_handle_t = csi_gpio_pin_initialize(PA18, gpio_interrupt_handler);        //sd_cd_pin_handle_t PA18 				PA18	    PA18
    5bd8:	c8bfd0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    5bdc:	05c18413          	addi	s0,gp,92 # 20000544 <sd_cd_pin_handle_t>
    csi_gpio_pin_config_mode(sd_cd_pin_handle_t, GPIO_MODE_PULLNONE);
    5be0:	4581                	li	a1,0
    sd_cd_pin_handle_t = csi_gpio_pin_initialize(PA18, gpio_interrupt_handler);        //sd_cd_pin_handle_t PA18 				PA18	    PA18
    5be2:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(sd_cd_pin_handle_t, GPIO_MODE_PULLNONE);
    5be4:	cdffd0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_cd_pin_handle_t, GPIO_DIRECTION_INPUT);
    5be8:	4008                	lw	a0,0(s0)
    5bea:	4581                	li	a1,0
    5bec:	ceffd0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    sd_cs_pin_handle_t = csi_gpio_pin_initialize(PA19, gpio_interrupt_handler);        //sd_cs_pin_handle_t PA19 				PA27        PA19
    5bf0:	a8048593          	addi	a1,s1,-1408
    5bf4:	454d                	li	a0,19
    5bf6:	c6dfd0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    5bfa:	06418413          	addi	s0,gp,100 # 2000054c <sd_cs_pin_handle_t>
    csi_gpio_pin_config_mode(sd_cs_pin_handle_t, GPIO_MODE_PULLNONE);
    5bfe:	4581                	li	a1,0
    sd_cs_pin_handle_t = csi_gpio_pin_initialize(PA19, gpio_interrupt_handler);        //sd_cs_pin_handle_t PA19 				PA27        PA19
    5c00:	c008                	sw	a0,0(s0)
    csi_gpio_pin_config_mode(sd_cs_pin_handle_t, GPIO_MODE_PULLNONE);
    5c02:	cc1fd0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_cs_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    5c06:	4008                	lw	a0,0(s0)
    5c08:	4585                	li	a1,1
    5c0a:	cd1fd0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    sd_clk_pin_handle_t = csi_gpio_pin_initialize(PA6, gpio_interrupt_handler);        //                         				            PA6
    5c0e:	a8048593          	addi	a1,s1,-1408
    5c12:	4519                	li	a0,6
    5c14:	c4ffd0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    5c18:	06018793          	addi	a5,gp,96 # 20000548 <sd_clk_pin_handle_t>
    csi_gpio_pin_config_mode(sd_clk_pin_handle_t, GPIO_MODE_PULLNONE);
    5c1c:	4581                	li	a1,0
    sd_clk_pin_handle_t = csi_gpio_pin_initialize(PA6, gpio_interrupt_handler);        //                         				            PA6
    5c1e:	c03e                	sw	a5,0(sp)
    5c20:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(sd_clk_pin_handle_t, GPIO_MODE_PULLNONE);
    5c22:	ca1fd0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_clk_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    5c26:	4782                	lw	a5,0(sp)
    5c28:	4585                	li	a1,1
    5c2a:	4388                	lw	a0,0(a5)
    5c2c:	caffd0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    sd_di_pin_handle_t = csi_gpio_pin_initialize(PA5, gpio_interrupt_handler);        //                         				            PA5    
    5c30:	a8048593          	addi	a1,s1,-1408
    5c34:	4515                	li	a0,5
    5c36:	c2dfd0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    5c3a:	06818793          	addi	a5,gp,104 # 20000550 <sd_di_pin_handle_t>
    csi_gpio_pin_config_mode(sd_di_pin_handle_t, GPIO_MODE_PULLNONE);
    5c3e:	4581                	li	a1,0
    sd_di_pin_handle_t = csi_gpio_pin_initialize(PA5, gpio_interrupt_handler);        //                         				            PA5    
    5c40:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(sd_di_pin_handle_t, GPIO_MODE_PULLNONE);
    5c42:	c81fd0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_di_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    5c46:	06818793          	addi	a5,gp,104 # 20000550 <sd_di_pin_handle_t>
    5c4a:	4388                	lw	a0,0(a5)
    5c4c:	4585                	li	a1,1
    5c4e:	c8dfd0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    sd_do_pin_handle_t = csi_gpio_pin_initialize(PA7, gpio_interrupt_handler);        //                         				            PA7
    5c52:	a8048593          	addi	a1,s1,-1408
    5c56:	451d                	li	a0,7
    5c58:	c0bfd0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    5c5c:	06c18793          	addi	a5,gp,108 # 20000554 <sd_do_pin_handle_t>
    csi_gpio_pin_config_mode(sd_do_pin_handle_t, GPIO_MODE_PULLNONE);
    5c60:	4581                	li	a1,0
    sd_do_pin_handle_t = csi_gpio_pin_initialize(PA7, gpio_interrupt_handler);        //                         				            PA7
    5c62:	c388                	sw	a0,0(a5)
    csi_gpio_pin_config_mode(sd_do_pin_handle_t, GPIO_MODE_PULLNONE);
    5c64:	c5ffd0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_do_pin_handle_t, GPIO_DIRECTION_INPUT);
    5c68:	06c18793          	addi	a5,gp,108 # 20000554 <sd_do_pin_handle_t>
    5c6c:	4388                	lw	a0,0(a5)
    5c6e:	4581                	li	a1,0
    5c70:	c6bfd0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    sd_rst_pin_handle_t = csi_gpio_pin_initialize(PA20, gpio_interrupt_handler);      //PA20                         			PA20	    PA20
    5c74:	a8048593          	addi	a1,s1,-1408
    5c78:	4551                	li	a0,20
    5c7a:	be9fd0ef          	jal	ra,3862 <csi_gpio_pin_initialize>
    5c7e:	07018493          	addi	s1,gp,112 # 20000558 <sd_rst_pin_handle_t>
    csi_gpio_pin_config_mode(sd_rst_pin_handle_t, GPIO_MODE_PULLNONE);
    5c82:	4581                	li	a1,0
    sd_rst_pin_handle_t = csi_gpio_pin_initialize(PA20, gpio_interrupt_handler);      //PA20                         			PA20	    PA20
    5c84:	c088                	sw	a0,0(s1)
    csi_gpio_pin_config_mode(sd_rst_pin_handle_t, GPIO_MODE_PULLNONE);
    5c86:	c3dfd0ef          	jal	ra,38c2 <csi_gpio_pin_config_mode>
    csi_gpio_pin_config_direction(sd_rst_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    5c8a:	4088                	lw	a0,0(s1)
    5c8c:	4585                	li	a1,1
    5c8e:	c4dfd0ef          	jal	ra,38da <csi_gpio_pin_config_direction>
    csi_gpio_pin_write(sd_cs_pin_handle_t,1);											//set cs high
    5c92:	4008                	lw	a0,0(s0)
    5c94:	4585                	li	a1,1
    5c96:	c77fd0ef          	jal	ra,390c <csi_gpio_pin_write>
	csi_gpio_pin_write(sd_rst_pin_handle_t,0);											//set rst low to power on the card
    5c9a:	4088                	lw	a0,0(s1)
    5c9c:	4581                	li	a1,0
    5c9e:	c6ffd0ef          	jal	ra,390c <csi_gpio_pin_write>
	csi_gpio_pin_write(sd_clk_pin_handle_t,0);											//set sclk low 
    5ca2:	4782                	lw	a5,0(sp)
    5ca4:	4581                	li	a1,0
    5ca6:	4388                	lw	a0,0(a5)
    5ca8:	c65fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    CS_H();
    5cac:	4008                	lw	a0,0(s0)
    5cae:	4585                	li	a1,1
    5cb0:	c5dfd0ef          	jal	ra,390c <csi_gpio_pin_write>
    CK_L();
    5cb4:	4782                	lw	a5,0(sp)
}
    5cb6:	4422                	lw	s0,8(sp)
    5cb8:	40b2                	lw	ra,12(sp)
    5cba:	4492                	lw	s1,4(sp)
    CK_L();
    5cbc:	4388                	lw	a0,0(a5)
    5cbe:	4581                	li	a1,0
}
    5cc0:	0141                	addi	sp,sp,16
    CK_L();
    5cc2:	c4bfd06f          	j	390c <csi_gpio_pin_write>

00005cc6 <rcvr_mmc>:
static
void rcvr_mmc (
	BYTE *buff,	/* Pointer to read buffer */
	UINT bc		/* Number of bytes to receive */
)
{
    5cc6:	1111                	addi	sp,sp,-28
    5cc8:	c02a                	sw	a0,0(sp)
	BYTE r;
    bool get_temp = 0;

	DI_H();	/* Send 0xFF */
    5cca:	0681a503          	lw	a0,104(gp) # 20000550 <sd_di_pin_handle_t>
{
    5cce:	ca22                	sw	s0,20(sp)
    5cd0:	842e                	mv	s0,a1
	DI_H();	/* Send 0xFF */
    5cd2:	4585                	li	a1,1
{
    5cd4:	cc06                	sw	ra,24(sp)
    5cd6:	c826                	sw	s1,16(sp)
    bool get_temp = 0;
    5cd8:	000107a3          	sb	zero,15(sp)
	DI_H();	/* Send 0xFF */
    5cdc:	c31fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5ce0:	4782                	lw	a5,0(sp)
    5ce2:	97a2                	add	a5,a5,s0
    5ce4:	c23e                	sw	a5,4(sp)

	do {
		r = 0;
        csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5ce6:	06c18493          	addi	s1,gp,108 # 20000554 <sd_do_pin_handle_t>
    5cea:	4088                	lw	a0,0(s1)
    5cec:	00f10593          	addi	a1,sp,15
    5cf0:	c5ffd0ef          	jal	ra,394e <csi_gpio_pin_read>
        if (get_temp) r++;	/* bit7 */
		CK_H(); CK_L();
    5cf4:	06018793          	addi	a5,gp,96 # 20000548 <sd_clk_pin_handle_t>
		r = 0;
    5cf8:	00f14703          	lbu	a4,15(sp)
		CK_H(); CK_L();
    5cfc:	4388                	lw	a0,0(a5)
    5cfe:	4585                	li	a1,1
		r = 0;
    5d00:	c43a                	sw	a4,8(sp)
		CK_H(); CK_L();
    5d02:	c0bfd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5d06:	06018793          	addi	a5,gp,96 # 20000548 <sd_clk_pin_handle_t>
    5d0a:	4388                	lw	a0,0(a5)
    5d0c:	4581                	li	a1,0
    5d0e:	06018413          	addi	s0,gp,96 # 20000548 <sd_clk_pin_handle_t>
    5d12:	bfbfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5d16:	4722                	lw	a4,8(sp)
    5d18:	4088                	lw	a0,0(s1)
    5d1a:	00f10593          	addi	a1,sp,15
    5d1e:	00171793          	slli	a5,a4,0x1
    5d22:	0ff7f793          	andi	a5,a5,255
    5d26:	c43e                	sw	a5,8(sp)
    5d28:	c27fd0ef          	jal	ra,394e <csi_gpio_pin_read>
        if (get_temp) r++;	/* bit6 */
    5d2c:	00f14683          	lbu	a3,15(sp)
    5d30:	47a2                	lw	a5,8(sp)
    5d32:	c681                	beqz	a3,5d3a <rcvr_mmc+0x74>
    5d34:	0785                	addi	a5,a5,1
    5d36:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5d3a:	4008                	lw	a0,0(s0)
    5d3c:	4585                	li	a1,1
    5d3e:	c43e                	sw	a5,8(sp)
    5d40:	bcdfd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5d44:	4008                	lw	a0,0(s0)
    5d46:	4581                	li	a1,0
    5d48:	bc5fd0ef          	jal	ra,390c <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5d4c:	47a2                	lw	a5,8(sp)
    5d4e:	4088                	lw	a0,0(s1)
    5d50:	00f10593          	addi	a1,sp,15
    5d54:	0786                	slli	a5,a5,0x1
    5d56:	0ff7f793          	andi	a5,a5,255
    5d5a:	c43e                	sw	a5,8(sp)
    5d5c:	bf3fd0ef          	jal	ra,394e <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit5 */
    5d60:	00f14703          	lbu	a4,15(sp)
    5d64:	47a2                	lw	a5,8(sp)
    5d66:	c701                	beqz	a4,5d6e <rcvr_mmc+0xa8>
    5d68:	0785                	addi	a5,a5,1
    5d6a:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5d6e:	4008                	lw	a0,0(s0)
    5d70:	4585                	li	a1,1
    5d72:	c43e                	sw	a5,8(sp)
    5d74:	b99fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5d78:	4008                	lw	a0,0(s0)
    5d7a:	4581                	li	a1,0
    5d7c:	b91fd0ef          	jal	ra,390c <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5d80:	47a2                	lw	a5,8(sp)
    5d82:	4088                	lw	a0,0(s1)
    5d84:	00f10593          	addi	a1,sp,15
    5d88:	0786                	slli	a5,a5,0x1
    5d8a:	0ff7f793          	andi	a5,a5,255
    5d8e:	c43e                	sw	a5,8(sp)
    5d90:	bbffd0ef          	jal	ra,394e <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit4 */
    5d94:	00f14703          	lbu	a4,15(sp)
    5d98:	47a2                	lw	a5,8(sp)
    5d9a:	c701                	beqz	a4,5da2 <rcvr_mmc+0xdc>
    5d9c:	0785                	addi	a5,a5,1
    5d9e:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5da2:	4008                	lw	a0,0(s0)
    5da4:	4585                	li	a1,1
    5da6:	c43e                	sw	a5,8(sp)
    5da8:	b65fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5dac:	4008                	lw	a0,0(s0)
    5dae:	4581                	li	a1,0
    5db0:	b5dfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5db4:	47a2                	lw	a5,8(sp)
    5db6:	4088                	lw	a0,0(s1)
    5db8:	00f10593          	addi	a1,sp,15
    5dbc:	0786                	slli	a5,a5,0x1
    5dbe:	0ff7f793          	andi	a5,a5,255
    5dc2:	c43e                	sw	a5,8(sp)
    5dc4:	b8bfd0ef          	jal	ra,394e <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit3 */
    5dc8:	00f14703          	lbu	a4,15(sp)
    5dcc:	47a2                	lw	a5,8(sp)
    5dce:	c701                	beqz	a4,5dd6 <rcvr_mmc+0x110>
    5dd0:	0785                	addi	a5,a5,1
    5dd2:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5dd6:	4008                	lw	a0,0(s0)
    5dd8:	4585                	li	a1,1
    5dda:	c43e                	sw	a5,8(sp)
    5ddc:	b31fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5de0:	4008                	lw	a0,0(s0)
    5de2:	4581                	li	a1,0
    5de4:	b29fd0ef          	jal	ra,390c <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5de8:	47a2                	lw	a5,8(sp)
    5dea:	4088                	lw	a0,0(s1)
    5dec:	00f10593          	addi	a1,sp,15
    5df0:	0786                	slli	a5,a5,0x1
    5df2:	0ff7f793          	andi	a5,a5,255
    5df6:	c43e                	sw	a5,8(sp)
    5df8:	b57fd0ef          	jal	ra,394e <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit2 */
    5dfc:	00f14703          	lbu	a4,15(sp)
    5e00:	47a2                	lw	a5,8(sp)
    5e02:	c701                	beqz	a4,5e0a <rcvr_mmc+0x144>
    5e04:	0785                	addi	a5,a5,1
    5e06:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5e0a:	4008                	lw	a0,0(s0)
    5e0c:	4585                	li	a1,1
    5e0e:	c43e                	sw	a5,8(sp)
    5e10:	afdfd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5e14:	4008                	lw	a0,0(s0)
    5e16:	4581                	li	a1,0
    5e18:	af5fd0ef          	jal	ra,390c <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5e1c:	47a2                	lw	a5,8(sp)
    5e1e:	4088                	lw	a0,0(s1)
    5e20:	00f10593          	addi	a1,sp,15
    5e24:	0786                	slli	a5,a5,0x1
    5e26:	0ff7f793          	andi	a5,a5,255
    5e2a:	c43e                	sw	a5,8(sp)
    5e2c:	b23fd0ef          	jal	ra,394e <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit1 */
    5e30:	00f14703          	lbu	a4,15(sp)
    5e34:	47a2                	lw	a5,8(sp)
    5e36:	c701                	beqz	a4,5e3e <rcvr_mmc+0x178>
    5e38:	0785                	addi	a5,a5,1
    5e3a:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5e3e:	4008                	lw	a0,0(s0)
    5e40:	4585                	li	a1,1
    5e42:	c43e                	sw	a5,8(sp)
    5e44:	ac9fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5e48:	4008                	lw	a0,0(s0)
    5e4a:	4581                	li	a1,0
    5e4c:	ac1fd0ef          	jal	ra,390c <csi_gpio_pin_write>
		r <<= 1;csi_gpio_pin_read(sd_do_pin_handle_t,&get_temp);
    5e50:	47a2                	lw	a5,8(sp)
    5e52:	4088                	lw	a0,0(s1)
    5e54:	00f10593          	addi	a1,sp,15
    5e58:	0786                	slli	a5,a5,0x1
    5e5a:	0ff7f793          	andi	a5,a5,255
    5e5e:	c43e                	sw	a5,8(sp)
    5e60:	aeffd0ef          	jal	ra,394e <csi_gpio_pin_read>
        if (get_temp)  r++;	/* bit0 */
    5e64:	00f14703          	lbu	a4,15(sp)
    5e68:	47a2                	lw	a5,8(sp)
    5e6a:	c701                	beqz	a4,5e72 <rcvr_mmc+0x1ac>
    5e6c:	0785                	addi	a5,a5,1
    5e6e:	0ff7f793          	andi	a5,a5,255
		CK_H(); CK_L();
    5e72:	4008                	lw	a0,0(s0)
    5e74:	4585                	li	a1,1
    5e76:	c43e                	sw	a5,8(sp)
    5e78:	a95fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    5e7c:	4008                	lw	a0,0(s0)
    5e7e:	4581                	li	a1,0
    5e80:	a8dfd0ef          	jal	ra,390c <csi_gpio_pin_write>
		*buff++ = r;			/* Store a received byte */
    5e84:	4782                	lw	a5,0(sp)
    5e86:	0785                	addi	a5,a5,1
    5e88:	873e                	mv	a4,a5
    5e8a:	c03e                	sw	a5,0(sp)
    5e8c:	47a2                	lw	a5,8(sp)
    5e8e:	fef70fa3          	sb	a5,-1(a4)
	} while (--bc);
    5e92:	4792                	lw	a5,4(sp)
    5e94:	e4e799e3          	bne	a5,a4,5ce6 <rcvr_mmc+0x20>
}
    5e98:	40e2                	lw	ra,24(sp)
    5e9a:	4452                	lw	s0,20(sp)
    5e9c:	44c2                	lw	s1,16(sp)
    5e9e:	0171                	addi	sp,sp,28
    5ea0:	8082                	ret

00005ea2 <wait_ready>:
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static
int wait_ready (void)	/* 1:OK, 0:Timeout */
{
    5ea2:	1141                	addi	sp,sp,-16
    5ea4:	c422                	sw	s0,8(sp)
	BYTE d;
	UINT tmr;


	for (tmr = 5000; tmr; tmr--) {	/* Wait for ready in timeout of 500ms */
    5ea6:	6405                	lui	s0,0x1
{
    5ea8:	c606                	sw	ra,12(sp)
	for (tmr = 5000; tmr; tmr--) {	/* Wait for ready in timeout of 500ms */
    5eaa:	38840413          	addi	s0,s0,904 # 1388 <__divdf3+0x4e0>
		rcvr_mmc(&d, 1);
    5eae:	4585                	li	a1,1
    5eb0:	00310513          	addi	a0,sp,3
    5eb4:	e13ff0ef          	jal	ra,5cc6 <rcvr_mmc>
		if (d == 0xFF) break;
    5eb8:	00314703          	lbu	a4,3(sp)
    5ebc:	0ff00793          	li	a5,255
    5ec0:	00f70463          	beq	a4,a5,5ec8 <wait_ready+0x26>
	for (tmr = 5000; tmr; tmr--) {	/* Wait for ready in timeout of 500ms */
    5ec4:	147d                	addi	s0,s0,-1
    5ec6:	f465                	bnez	s0,5eae <wait_ready+0xc>
		dly_us(100);
	}

	return tmr ? 1 : 0;
}
    5ec8:	00803533          	snez	a0,s0
    5ecc:	40b2                	lw	ra,12(sp)
    5ece:	4422                	lw	s0,8(sp)
    5ed0:	0141                	addi	sp,sp,16
    5ed2:	8082                	ret

00005ed4 <deselect>:
static
void deselect (void)
{
	BYTE d;

	CS_H();				/* Set CS# high */
    5ed4:	0641a503          	lw	a0,100(gp) # 2000054c <sd_cs_pin_handle_t>
{
    5ed8:	1141                	addi	sp,sp,-16
	CS_H();				/* Set CS# high */
    5eda:	4585                	li	a1,1
{
    5edc:	c606                	sw	ra,12(sp)
	CS_H();				/* Set CS# high */
    5ede:	a2ffd0ef          	jal	ra,390c <csi_gpio_pin_write>
	rcvr_mmc(&d, 1);	/* Dummy clock (force DO hi-z for multiple slave SPI) */
    5ee2:	00310513          	addi	a0,sp,3
    5ee6:	4585                	li	a1,1
    5ee8:	ddfff0ef          	jal	ra,5cc6 <rcvr_mmc>
}
    5eec:	40b2                	lw	ra,12(sp)
    5eee:	0141                	addi	sp,sp,16
    5ef0:	8082                	ret

00005ef2 <my_select>:
static
int my_select (void)	/* 1:OK, 0:Timeout */
{
	BYTE d;

	CS_L();				/* Set CS# low */
    5ef2:	0641a503          	lw	a0,100(gp) # 2000054c <sd_cs_pin_handle_t>
{
    5ef6:	1131                	addi	sp,sp,-20
	CS_L();				/* Set CS# low */
    5ef8:	4581                	li	a1,0
{
    5efa:	c806                	sw	ra,16(sp)
	CS_L();				/* Set CS# low */
    5efc:	a11fd0ef          	jal	ra,390c <csi_gpio_pin_write>
	rcvr_mmc(&d, 1);	/* Dummy clock (force DO enabled) */
    5f00:	4585                	li	a1,1
    5f02:	00710513          	addi	a0,sp,7
    5f06:	dc1ff0ef          	jal	ra,5cc6 <rcvr_mmc>
	if (wait_ready()) return 1;	/* Wait for card ready */
    5f0a:	f99ff0ef          	jal	ra,5ea2 <wait_ready>
    5f0e:	c02a                	sw	a0,0(sp)
    5f10:	e519                	bnez	a0,5f1e <my_select+0x2c>

	deselect();
    5f12:	fc3ff0ef          	jal	ra,5ed4 <deselect>
	return 0;			/* Failed */
    5f16:	4502                	lw	a0,0(sp)
}
    5f18:	40c2                	lw	ra,16(sp)
    5f1a:	0151                	addi	sp,sp,20
    5f1c:	8082                	ret
	if (wait_ready()) return 1;	/* Wait for card ready */
    5f1e:	4505                	li	a0,1
    5f20:	bfe5                	j	5f18 <my_select+0x26>

00005f22 <send_cmd>:
static
BYTE send_cmd (		/* Returns command response (bit7==1:Send failed)*/
	BYTE cmd,		/* Command byte */
	DWORD arg		/* Argument */
)
{
    5f22:	1121                	addi	sp,sp,-24
	BYTE n, d, buf[6];


	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
    5f24:	01851793          	slli	a5,a0,0x18
{
    5f28:	c822                	sw	s0,16(sp)
    5f2a:	c626                	sw	s1,12(sp)
    5f2c:	ca06                	sw	ra,20(sp)
	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
    5f2e:	87e1                	srai	a5,a5,0x18
{
    5f30:	842a                	mv	s0,a0
    5f32:	84ae                	mv	s1,a1
	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
    5f34:	0007dc63          	bgez	a5,5f4c <send_cmd+0x2a>
		cmd &= 0x7F;
		n = send_cmd(CMD55, 0);
    5f38:	4581                	li	a1,0
    5f3a:	03700513          	li	a0,55
    5f3e:	37d5                	jal	5f22 <send_cmd>
		if (n > 1) return n;
    5f40:	4705                	li	a4,1
		n = send_cmd(CMD55, 0);
    5f42:	87aa                	mv	a5,a0
		if (n > 1) return n;
    5f44:	08a76963          	bltu	a4,a0,5fd6 <send_cmd+0xb4>
		cmd &= 0x7F;
    5f48:	07f47413          	andi	s0,s0,127
	}

	/* Select the card and wait for ready except to stop multiple block read */
	if (cmd != CMD12) {
    5f4c:	47b1                	li	a5,12
    5f4e:	06f41d63          	bne	s0,a5,5fc8 <send_cmd+0xa6>
		deselect();
		if (!my_select()) return 0xFF;
	}

	/* Send a command packet */
	buf[0] = 0x40 | cmd;			/* Start + Command index */
    5f52:	04046793          	ori	a5,s0,64
    5f56:	00f10223          	sb	a5,4(sp)
	buf[1] = (BYTE)(arg >> 24);		/* Argument[31..24] */
    5f5a:	0184d793          	srli	a5,s1,0x18
    5f5e:	00f102a3          	sb	a5,5(sp)
	buf[2] = (BYTE)(arg >> 16);		/* Argument[23..16] */
    5f62:	0104d793          	srli	a5,s1,0x10
    5f66:	00f10323          	sb	a5,6(sp)
	buf[3] = (BYTE)(arg >> 8);		/* Argument[15..8] */
    5f6a:	0084d793          	srli	a5,s1,0x8
    5f6e:	00f103a3          	sb	a5,7(sp)
	buf[4] = (BYTE)arg;				/* Argument[7..0] */
    5f72:	00910423          	sb	s1,8(sp)
	n = 0x01;						/* Dummy CRC + Stop */
	if (cmd == CMD0) n = 0x95;		/* (valid CRC for CMD0(0)) */
    5f76:	09500793          	li	a5,149
    5f7a:	c419                	beqz	s0,5f88 <send_cmd+0x66>
	if (cmd == CMD8) n = 0x87;		/* (valid CRC for CMD8(0x1AA)) */
    5f7c:	4721                	li	a4,8
	n = 0x01;						/* Dummy CRC + Stop */
    5f7e:	4785                	li	a5,1
	if (cmd == CMD8) n = 0x87;		/* (valid CRC for CMD8(0x1AA)) */
    5f80:	00e41463          	bne	s0,a4,5f88 <send_cmd+0x66>
    5f84:	08700793          	li	a5,135
	buf[5] = n;
	xmit_mmc(buf, 6);
    5f88:	4599                	li	a1,6
    5f8a:	0048                	addi	a0,sp,4
	buf[5] = n;
    5f8c:	00f104a3          	sb	a5,9(sp)
	xmit_mmc(buf, 6);
    5f90:	af3ff0ef          	jal	ra,5a82 <xmit_mmc>

	/* Receive command response */
	if (cmd == CMD12) rcvr_mmc(&d, 1);	/* Skip a stuff byte when stop reading */
    5f94:	47b1                	li	a5,12
    5f96:	00f41763          	bne	s0,a5,5fa4 <send_cmd+0x82>
    5f9a:	4585                	li	a1,1
    5f9c:	00310513          	addi	a0,sp,3
    5fa0:	d27ff0ef          	jal	ra,5cc6 <rcvr_mmc>
	if (cmd == CMD8) n = 0x87;		/* (valid CRC for CMD8(0x1AA)) */
    5fa4:	4429                	li	s0,10
	n = 10;								/* Wait for a valid response in timeout of 10 attempts */
	do
		rcvr_mmc(&d, 1);
    5fa6:	4585                	li	a1,1
    5fa8:	00310513          	addi	a0,sp,3
    5fac:	d1bff0ef          	jal	ra,5cc6 <rcvr_mmc>
	while ((d & 0x80) && --n);
    5fb0:	00314783          	lbu	a5,3(sp)
    5fb4:	01879713          	slli	a4,a5,0x18
    5fb8:	8761                	srai	a4,a4,0x18
    5fba:	00075e63          	bgez	a4,5fd6 <send_cmd+0xb4>
    5fbe:	147d                	addi	s0,s0,-1
    5fc0:	0ff47413          	andi	s0,s0,255
    5fc4:	f06d                	bnez	s0,5fa6 <send_cmd+0x84>
    5fc6:	a801                	j	5fd6 <send_cmd+0xb4>
		deselect();
    5fc8:	f0dff0ef          	jal	ra,5ed4 <deselect>
		if (!my_select()) return 0xFF;
    5fcc:	f27ff0ef          	jal	ra,5ef2 <my_select>
    5fd0:	0ff00793          	li	a5,255
    5fd4:	fd3d                	bnez	a0,5f52 <send_cmd+0x30>

	return d;			/* Return with the response value */
}
    5fd6:	40d2                	lw	ra,20(sp)
    5fd8:	4442                	lw	s0,16(sp)
    5fda:	44b2                	lw	s1,12(sp)
    5fdc:	853e                	mv	a0,a5
    5fde:	0161                	addi	sp,sp,24
    5fe0:	8082                	ret

00005fe2 <rcvr_datablock>:
{
    5fe2:	1131                	addi	sp,sp,-20
    5fe4:	c622                	sw	s0,12(sp)
    5fe6:	c426                	sw	s1,8(sp)
    5fe8:	c806                	sw	ra,16(sp)
    5fea:	84aa                	mv	s1,a0
    5fec:	872e                	mv	a4,a1
    5fee:	3e800413          	li	s0,1000
		rcvr_mmc(d, 1);
    5ff2:	4585                	li	a1,1
    5ff4:	0048                	addi	a0,sp,4
    5ff6:	c03a                	sw	a4,0(sp)
    5ff8:	ccfff0ef          	jal	ra,5cc6 <rcvr_mmc>
		if (d[0] != 0xFF) break;
    5ffc:	00414783          	lbu	a5,4(sp)
    6000:	0ff00693          	li	a3,255
    6004:	4702                	lw	a4,0(sp)
    6006:	00d79a63          	bne	a5,a3,601a <rcvr_datablock+0x38>
	} while (--num);
    600a:	147d                	addi	s0,s0,-1
	for (tmr = 1000; tmr; tmr--) {	/* Wait for data packet in timeout of 100ms */
    600c:	f07d                	bnez	s0,5ff2 <rcvr_datablock+0x10>
	if (d[0] != 0xFE) return 0;		/* If not valid data token, return with error */
    600e:	4501                	li	a0,0
}
    6010:	40c2                	lw	ra,16(sp)
    6012:	4432                	lw	s0,12(sp)
    6014:	44a2                	lw	s1,8(sp)
    6016:	0151                	addi	sp,sp,20
    6018:	8082                	ret
	if (d[0] != 0xFE) return 0;		/* If not valid data token, return with error */
    601a:	0fe00693          	li	a3,254
    601e:	4501                	li	a0,0
    6020:	fed798e3          	bne	a5,a3,6010 <rcvr_datablock+0x2e>
	rcvr_mmc(buff, btr);			/* Receive the data block into buffer */
    6024:	85ba                	mv	a1,a4
    6026:	8526                	mv	a0,s1
    6028:	c9fff0ef          	jal	ra,5cc6 <rcvr_mmc>
	rcvr_mmc(d, 2);					/* Discard CRC */
    602c:	0048                	addi	a0,sp,4
    602e:	4589                	li	a1,2
    6030:	c97ff0ef          	jal	ra,5cc6 <rcvr_mmc>
	return 1;						/* Return with success */
    6034:	4505                	li	a0,1
    6036:	bfe9                	j	6010 <rcvr_datablock+0x2e>

00006038 <xmit_datablock>:
{
    6038:	1141                	addi	sp,sp,-16
    603a:	c422                	sw	s0,8(sp)
    603c:	c226                	sw	s1,4(sp)
    603e:	c606                	sw	ra,12(sp)
    6040:	84aa                	mv	s1,a0
    6042:	842e                	mv	s0,a1
	if (!wait_ready()) return 0;
    6044:	e5fff0ef          	jal	ra,5ea2 <wait_ready>
    6048:	cd1d                	beqz	a0,6086 <xmit_datablock+0x4e>
	xmit_mmc(d, 1);				/* Xmit a token */
    604a:	850a                	mv	a0,sp
    604c:	4585                	li	a1,1
	d[0] = token;
    604e:	00810023          	sb	s0,0(sp)
	xmit_mmc(d, 1);				/* Xmit a token */
    6052:	a31ff0ef          	jal	ra,5a82 <xmit_mmc>
	if (token != 0xFD) {		/* Is it data token? */
    6056:	0fd00793          	li	a5,253
	return 1;
    605a:	4505                	li	a0,1
	if (token != 0xFD) {		/* Is it data token? */
    605c:	02f40563          	beq	s0,a5,6086 <xmit_datablock+0x4e>
		xmit_mmc(buff, 512);	/* Xmit the 512 byte data block to MMC */
    6060:	20000593          	li	a1,512
    6064:	8526                	mv	a0,s1
    6066:	a1dff0ef          	jal	ra,5a82 <xmit_mmc>
		rcvr_mmc(d, 2);			/* Xmit dummy CRC (0xFF,0xFF) */
    606a:	4589                	li	a1,2
    606c:	850a                	mv	a0,sp
    606e:	c59ff0ef          	jal	ra,5cc6 <rcvr_mmc>
		rcvr_mmc(d, 1);			/* Receive data response */
    6072:	850a                	mv	a0,sp
    6074:	4585                	li	a1,1
    6076:	c51ff0ef          	jal	ra,5cc6 <rcvr_mmc>
		if ((d[0] & 0x1F) != 0x05)	/* If not accepted, return with error */
    607a:	00014503          	lbu	a0,0(sp)
    607e:	897d                	andi	a0,a0,31
    6080:	156d                	addi	a0,a0,-5
    6082:	00153513          	seqz	a0,a0
}
    6086:	40b2                	lw	ra,12(sp)
    6088:	4422                	lw	s0,8(sp)
    608a:	4492                	lw	s1,4(sp)
    608c:	0141                	addi	sp,sp,16
    608e:	8082                	ret

00006090 <disk_status>:

DSTATUS disk_status (
	BYTE drv			/* Drive number (always 0) */
)
{
	if (drv) return STA_NOINIT;
    6090:	e501                	bnez	a0,6098 <disk_status+0x8>

	return Stat;
    6092:	0081c503          	lbu	a0,8(gp) # 200004f0 <Stat>
    6096:	8082                	ret
	if (drv) return STA_NOINIT;
    6098:	4505                	li	a0,1
}
    609a:	8082                	ret

0000609c <disk_initialize>:
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
	BYTE drv		/* Physical drive nmuber (0) */
)
{
    609c:	1131                	addi	sp,sp,-20
    609e:	c622                	sw	s0,12(sp)
    60a0:	c806                	sw	ra,16(sp)
    60a2:	c426                	sw	s1,8(sp)
	BYTE n, ty, cmd, buf[4];
	UINT tmr;
	DSTATUS s;


	if (drv) return RES_NOTRDY;
    60a4:	440d                	li	s0,3
    60a6:	0e051263          	bnez	a0,618a <disk_initialize+0xee>

    
	dly_us(10000);			/* 10ms */
    soft_spi_init();
    60aa:	b1fff0ef          	jal	ra,5bc8 <soft_spi_init>
    CS_H();
    60ae:	0641a503          	lw	a0,100(gp) # 2000054c <sd_cs_pin_handle_t>
    60b2:	4585                	li	a1,1
    CK_L();	
    60b4:	4429                	li	s0,10
    CS_H();
    60b6:	857fd0ef          	jal	ra,390c <csi_gpio_pin_write>
    CK_L();	
    60ba:	0601a503          	lw	a0,96(gp) # 20000548 <sd_clk_pin_handle_t>
    60be:	4581                	li	a1,0
    60c0:	84dfd0ef          	jal	ra,390c <csi_gpio_pin_write>

	for (n = 10; n; n--) rcvr_mmc(buf, 1);	/* Apply 80 dummy clocks and the card gets ready to receive command */
    60c4:	147d                	addi	s0,s0,-1
    60c6:	4585                	li	a1,1
    60c8:	0048                	addi	a0,sp,4
    60ca:	0ff47413          	andi	s0,s0,255
    60ce:	bf9ff0ef          	jal	ra,5cc6 <rcvr_mmc>
    60d2:	f86d                	bnez	s0,60c4 <disk_initialize+0x28>

	ty = 0;
	if (send_cmd(CMD0, 0) == 1) {			/* Enter Idle state */
    60d4:	4581                	li	a1,0
    60d6:	4501                	li	a0,0
    60d8:	e4bff0ef          	jal	ra,5f22 <send_cmd>
    60dc:	4785                	li	a5,1
    60de:	842a                	mv	s0,a0
    60e0:	04f51363          	bne	a0,a5,6126 <disk_initialize+0x8a>
		if (send_cmd(CMD8, 0x1AA) == 1) {	/* SDv2? */
    60e4:	1aa00593          	li	a1,426
    60e8:	4521                	li	a0,8
    60ea:	e39ff0ef          	jal	ra,5f22 <send_cmd>
    60ee:	84aa                	mv	s1,a0
    60f0:	02851d63          	bne	a0,s0,612a <disk_initialize+0x8e>
			rcvr_mmc(buf, 4);							/* Get trailing return value of R7 resp */
    60f4:	4591                	li	a1,4
    60f6:	0048                	addi	a0,sp,4
    60f8:	bcfff0ef          	jal	ra,5cc6 <rcvr_mmc>
			if (buf[2] == 0x01 && buf[3] == 0xAA) {		/* The card can work at vdd range of 2.7-3.6V */
    60fc:	00614783          	lbu	a5,6(sp)
    6100:	02979363          	bne	a5,s1,6126 <disk_initialize+0x8a>
    6104:	00714703          	lbu	a4,7(sp)
    6108:	0aa00793          	li	a5,170
    610c:	00f71d63          	bne	a4,a5,6126 <disk_initialize+0x8a>
    6110:	3e800413          	li	s0,1000
				for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state (ACMD41 with HCS bit) */
					if (send_cmd(ACMD41, 1UL << 30) == 0) break;
    6114:	400005b7          	lui	a1,0x40000
    6118:	0a900513          	li	a0,169
    611c:	e07ff0ef          	jal	ra,5f22 <send_cmd>
    6120:	cd05                	beqz	a0,6158 <disk_initialize+0xbc>
	} while (--num);
    6122:	147d                	addi	s0,s0,-1
				for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state (ACMD41 with HCS bit) */
    6124:	f865                	bnez	s0,6114 <disk_initialize+0x78>
			for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state */
				if (send_cmd(cmd, 0) == 0) break;
				dly_us(1000);
			}
			if (!tmr || send_cmd(CMD16, 512) != 0)	/* Set R/W block length to 512 */
				ty = 0;
    6126:	4401                	li	s0,0
    6128:	a889                	j	617a <disk_initialize+0xde>
			if (send_cmd(ACMD41, 0) <= 1) 	{
    612a:	4581                	li	a1,0
    612c:	0a900513          	li	a0,169
    6130:	df3ff0ef          	jal	ra,5f22 <send_cmd>
				ty = CT_MMC3; cmd = CMD1;	/* MMCv3 */
    6134:	4785                	li	a5,1
			if (send_cmd(ACMD41, 0) <= 1) 	{
    6136:	00a46563          	bltu	s0,a0,6140 <disk_initialize+0xa4>
				ty = CT_SDC2; cmd = ACMD41;	/* SDv1 */
    613a:	0a900793          	li	a5,169
    613e:	4421                	li	s0,8
				ty = CT_MMC3; cmd = CMD1;	/* MMCv3 */
    6140:	3e800493          	li	s1,1000
				if (send_cmd(cmd, 0) == 0) break;
    6144:	4581                	li	a1,0
    6146:	853e                	mv	a0,a5
    6148:	c03e                	sw	a5,0(sp)
    614a:	dd9ff0ef          	jal	ra,5f22 <send_cmd>
    614e:	c521                	beqz	a0,6196 <disk_initialize+0xfa>
	} while (--num);
    6150:	14fd                	addi	s1,s1,-1
			for (tmr = 1000; tmr; tmr--) {			/* Wait for leaving idle state */
    6152:	4782                	lw	a5,0(sp)
    6154:	f8e5                	bnez	s1,6144 <disk_initialize+0xa8>
    6156:	bfc1                	j	6126 <disk_initialize+0x8a>
				if (tmr && send_cmd(CMD58, 0) == 0) {	/* Check CCS bit in the OCR */
    6158:	4581                	li	a1,0
    615a:	03a00513          	li	a0,58
    615e:	dc5ff0ef          	jal	ra,5f22 <send_cmd>
    6162:	f171                	bnez	a0,6126 <disk_initialize+0x8a>
					rcvr_mmc(buf, 4);
    6164:	4591                	li	a1,4
    6166:	0048                	addi	a0,sp,4
    6168:	b5fff0ef          	jal	ra,5cc6 <rcvr_mmc>
					ty = (buf[0] & 0x40) ? CT_SDC2 | CT_BLOCK : CT_SDC2;	/* SDv2+ */
    616c:	00414783          	lbu	a5,4(sp)
    6170:	4461                	li	s0,24
    6172:	0407f793          	andi	a5,a5,64
    6176:	e391                	bnez	a5,617a <disk_initialize+0xde>
    6178:	4421                	li	s0,8
		}
	}
	CardType = ty;
    617a:	04818d23          	sb	s0,90(gp) # 20000542 <CardType>
	s = ty ? 0 : STA_NOINIT;
    617e:	00143413          	seqz	s0,s0
	Stat = s;
    6182:	00818423          	sb	s0,8(gp) # 200004f0 <Stat>

	deselect();
    6186:	d4fff0ef          	jal	ra,5ed4 <deselect>

	return s;
}
    618a:	8522                	mv	a0,s0
    618c:	40c2                	lw	ra,16(sp)
    618e:	4432                	lw	s0,12(sp)
    6190:	44a2                	lw	s1,8(sp)
    6192:	0151                	addi	sp,sp,20
    6194:	8082                	ret
			if (!tmr || send_cmd(CMD16, 512) != 0)	/* Set R/W block length to 512 */
    6196:	20000593          	li	a1,512
    619a:	4541                	li	a0,16
    619c:	d87ff0ef          	jal	ra,5f22 <send_cmd>
    61a0:	f159                	bnez	a0,6126 <disk_initialize+0x8a>
    61a2:	bfe1                	j	617a <disk_initialize+0xde>

000061a4 <disk_read>:
{
	BYTE cmd;
	DWORD sect = (DWORD)sector;


	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;
    61a4:	0081c783          	lbu	a5,8(gp) # 200004f0 <Stat>
    61a8:	8b85                	andi	a5,a5,1
    61aa:	8d5d                	or	a0,a0,a5
    61ac:	e13d                	bnez	a0,6212 <disk_read+0x6e>
	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert LBA to byte address if needed */
    61ae:	05a1c783          	lbu	a5,90(gp) # 20000542 <CardType>
{
    61b2:	1141                	addi	sp,sp,-16
    61b4:	c422                	sw	s0,8(sp)
    61b6:	c606                	sw	ra,12(sp)
    61b8:	c226                	sw	s1,4(sp)
	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert LBA to byte address if needed */
    61ba:	8bc1                	andi	a5,a5,16
    61bc:	872e                	mv	a4,a1
    61be:	8436                	mv	s0,a3
    61c0:	e391                	bnez	a5,61c4 <disk_read+0x20>
    61c2:	0626                	slli	a2,a2,0x9

	cmd = count > 1 ? CMD18 : CMD17;			/*  READ_MULTIPLE_BLOCK : READ_SINGLE_BLOCK */
    61c4:	4485                	li	s1,1
    61c6:	0084b4b3          	sltu	s1,s1,s0
    61ca:	04c5                	addi	s1,s1,17
	if (send_cmd(cmd, sect) == 0) {
    61cc:	85b2                	mv	a1,a2
    61ce:	8526                	mv	a0,s1
    61d0:	c03a                	sw	a4,0(sp)
    61d2:	d51ff0ef          	jal	ra,5f22 <send_cmd>
    61d6:	4702                	lw	a4,0(sp)
    61d8:	e505                	bnez	a0,6200 <disk_read+0x5c>
		do {
			if (!rcvr_datablock(buff, 512)) break;
    61da:	20000593          	li	a1,512
    61de:	853a                	mv	a0,a4
    61e0:	c03a                	sw	a4,0(sp)
    61e2:	e01ff0ef          	jal	ra,5fe2 <rcvr_datablock>
    61e6:	c511                	beqz	a0,61f2 <disk_read+0x4e>
			buff += 512;
    61e8:	4702                	lw	a4,0(sp)
		} while (--count);
    61ea:	147d                	addi	s0,s0,-1
			buff += 512;
    61ec:	20070713          	addi	a4,a4,512
		} while (--count);
    61f0:	f46d                	bnez	s0,61da <disk_read+0x36>
		if (cmd == CMD18) send_cmd(CMD12, 0);	/* STOP_TRANSMISSION */
    61f2:	47c9                	li	a5,18
    61f4:	00f49663          	bne	s1,a5,6200 <disk_read+0x5c>
    61f8:	4581                	li	a1,0
    61fa:	4531                	li	a0,12
    61fc:	d27ff0ef          	jal	ra,5f22 <send_cmd>
	}
	deselect();
    6200:	cd5ff0ef          	jal	ra,5ed4 <deselect>

	return count ? RES_ERROR : RES_OK;
    6204:	00803533          	snez	a0,s0
}
    6208:	40b2                	lw	ra,12(sp)
    620a:	4422                	lw	s0,8(sp)
    620c:	4492                	lw	s1,4(sp)
    620e:	0141                	addi	sp,sp,16
    6210:	8082                	ret
	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;
    6212:	450d                	li	a0,3
}
    6214:	8082                	ret

00006216 <disk_write>:
)
{
	DWORD sect = (DWORD)sector;


	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;
    6216:	0081c783          	lbu	a5,8(gp) # 200004f0 <Stat>
    621a:	8b85                	andi	a5,a5,1
    621c:	8d5d                	or	a0,a0,a5
    621e:	e549                	bnez	a0,62a8 <disk_write+0x92>
	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert LBA to byte address if needed */
    6220:	05a1c783          	lbu	a5,90(gp) # 20000542 <CardType>
{
    6224:	1141                	addi	sp,sp,-16
    6226:	c422                	sw	s0,8(sp)
    6228:	c226                	sw	s1,4(sp)
    622a:	c606                	sw	ra,12(sp)
	if (!(CardType & CT_BLOCK)) sect *= 512;	/* Convert LBA to byte address if needed */
    622c:	0107f713          	andi	a4,a5,16
    6230:	84ae                	mv	s1,a1
    6232:	8436                	mv	s0,a3
    6234:	e311                	bnez	a4,6238 <disk_write+0x22>
    6236:	0626                	slli	a2,a2,0x9

	if (count == 1) {	/* Single block write */
    6238:	4705                	li	a4,1
    623a:	02e41763          	bne	s0,a4,6268 <disk_write+0x52>
		if ((send_cmd(CMD24, sect) == 0)	/* WRITE_BLOCK */
    623e:	85b2                	mv	a1,a2
    6240:	4561                	li	a0,24
    6242:	ce1ff0ef          	jal	ra,5f22 <send_cmd>
    6246:	ed39                	bnez	a0,62a4 <disk_write+0x8e>
			&& xmit_datablock(buff, 0xFE))
    6248:	0fe00593          	li	a1,254
    624c:	8526                	mv	a0,s1
    624e:	debff0ef          	jal	ra,6038 <xmit_datablock>
    6252:	00153413          	seqz	s0,a0
			} while (--count);
			if (!xmit_datablock(0, 0xFD))	/* STOP_TRAN token */
				count = 1;
		}
	}
	deselect();
    6256:	c7fff0ef          	jal	ra,5ed4 <deselect>

	return count ? RES_ERROR : RES_OK;
    625a:	00803533          	snez	a0,s0
}
    625e:	40b2                	lw	ra,12(sp)
    6260:	4422                	lw	s0,8(sp)
    6262:	4492                	lw	s1,4(sp)
    6264:	0141                	addi	sp,sp,16
    6266:	8082                	ret
		if (CardType & CT_SDC) send_cmd(ACMD23, count);
    6268:	8bb1                	andi	a5,a5,12
    626a:	cb81                	beqz	a5,627a <disk_write+0x64>
    626c:	85a2                	mv	a1,s0
    626e:	09700513          	li	a0,151
    6272:	c032                	sw	a2,0(sp)
    6274:	cafff0ef          	jal	ra,5f22 <send_cmd>
    6278:	4602                	lw	a2,0(sp)
		if (send_cmd(CMD25, sect) == 0) {	/* WRITE_MULTIPLE_BLOCK */
    627a:	85b2                	mv	a1,a2
    627c:	4565                	li	a0,25
    627e:	ca5ff0ef          	jal	ra,5f22 <send_cmd>
    6282:	f971                	bnez	a0,6256 <disk_write+0x40>
				if (!xmit_datablock(buff, 0xFC)) break;
    6284:	0fc00593          	li	a1,252
    6288:	8526                	mv	a0,s1
    628a:	dafff0ef          	jal	ra,6038 <xmit_datablock>
    628e:	c509                	beqz	a0,6298 <disk_write+0x82>
			} while (--count);
    6290:	147d                	addi	s0,s0,-1
				buff += 512;
    6292:	20048493          	addi	s1,s1,512
			} while (--count);
    6296:	f47d                	bnez	s0,6284 <disk_write+0x6e>
			if (!xmit_datablock(0, 0xFD))	/* STOP_TRAN token */
    6298:	0fd00593          	li	a1,253
    629c:	4501                	li	a0,0
    629e:	d9bff0ef          	jal	ra,6038 <xmit_datablock>
    62a2:	f955                	bnez	a0,6256 <disk_write+0x40>
				count = 1;
    62a4:	4405                	li	s0,1
    62a6:	bf45                	j	6256 <disk_write+0x40>
	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;
    62a8:	450d                	li	a0,3
}
    62aa:	8082                	ret

000062ac <disk_ioctl>:
	DRESULT res;
	BYTE n, csd[16];
	DWORD cs;


	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;	/* Check if card is in the socket */
    62ac:	0081c783          	lbu	a5,8(gp) # 200004f0 <Stat>
    62b0:	8b85                	andi	a5,a5,1
    62b2:	8d5d                	or	a0,a0,a5
    62b4:	ed45                	bnez	a0,636c <disk_ioctl+0xc0>
{
    62b6:	1101                	addi	sp,sp,-32
    62b8:	cc22                	sw	s0,24(sp)
    62ba:	ca26                	sw	s1,20(sp)
    62bc:	ce06                	sw	ra,28(sp)
    62be:	4785                	li	a5,1
    62c0:	8432                	mv	s0,a2
    62c2:	84ae                	mv	s1,a1

	res = RES_ERROR;
	switch (ctrl) {
    62c4:	02f58763          	beq	a1,a5,62f2 <disk_ioctl+0x46>
    62c8:	c981                	beqz	a1,62d8 <disk_ioctl+0x2c>
    62ca:	478d                	li	a5,3
			*(DWORD*)buff = 128;
			res = RES_OK;
			break;

		default:
			res = RES_PARERR;
    62cc:	4511                	li	a0,4
    62ce:	00f59963          	bne	a1,a5,62e0 <disk_ioctl+0x34>
			*(DWORD*)buff = 128;
    62d2:	08000793          	li	a5,128
    62d6:	a8b1                	j	6332 <disk_ioctl+0x86>
			if (my_select()) res = RES_OK;
    62d8:	c1bff0ef          	jal	ra,5ef2 <my_select>
    62dc:	00153513          	seqz	a0,a0
    62e0:	c02a                	sw	a0,0(sp)
	}

	deselect();
    62e2:	bf3ff0ef          	jal	ra,5ed4 <deselect>

	return res;
}
    62e6:	40f2                	lw	ra,28(sp)
    62e8:	4462                	lw	s0,24(sp)
	return res;
    62ea:	4502                	lw	a0,0(sp)
}
    62ec:	44d2                	lw	s1,20(sp)
    62ee:	6105                	addi	sp,sp,32
    62f0:	8082                	ret
			if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
    62f2:	4581                	li	a1,0
    62f4:	4525                	li	a0,9
    62f6:	c2dff0ef          	jal	ra,5f22 <send_cmd>
    62fa:	c119                	beqz	a0,6300 <disk_ioctl+0x54>
	res = RES_ERROR;
    62fc:	4505                	li	a0,1
    62fe:	b7cd                	j	62e0 <disk_ioctl+0x34>
			if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
    6300:	45c1                	li	a1,16
    6302:	0048                	addi	a0,sp,4
    6304:	cdfff0ef          	jal	ra,5fe2 <rcvr_datablock>
    6308:	d975                	beqz	a0,62fc <disk_ioctl+0x50>
				if ((csd[0] >> 6) == 1) {	/* SDC ver 2.00 */
    630a:	00414603          	lbu	a2,4(sp)
    630e:	00d14683          	lbu	a3,13(sp)
    6312:	00c14783          	lbu	a5,12(sp)
    6316:	8219                	srli	a2,a2,0x6
    6318:	00b14703          	lbu	a4,11(sp)
    631c:	00961e63          	bne	a2,s1,6338 <disk_ioctl+0x8c>
					cs = csd[9] + ((WORD)csd[8] << 8) + ((DWORD)(csd[7] & 63) << 16) + 1;
    6320:	0742                	slli	a4,a4,0x10
    6322:	003f0637          	lui	a2,0x3f0
    6326:	8f71                	and	a4,a4,a2
    6328:	07a2                	slli	a5,a5,0x8
    632a:	0705                	addi	a4,a4,1
    632c:	97b6                	add	a5,a5,a3
    632e:	97ba                	add	a5,a5,a4
					*(LBA_t*)buff = cs << 10;
    6330:	07aa                	slli	a5,a5,0xa
			*(DWORD*)buff = 128;
    6332:	c01c                	sw	a5,0(s0)
			res = RES_OK;
    6334:	4501                	li	a0,0
			break;
    6336:	b76d                	j	62e0 <disk_ioctl+0x34>
					cs = (csd[8] >> 6) + ((WORD)csd[7] << 2) + ((WORD)(csd[6] & 3) << 10) + 1;
    6338:	070a                	slli	a4,a4,0x2
    633a:	8399                	srli	a5,a5,0x6
    633c:	97ba                	add	a5,a5,a4
    633e:	00a14703          	lbu	a4,10(sp)
    6342:	6605                	lui	a2,0x1
    6344:	c0060613          	addi	a2,a2,-1024 # c00 <__adddf3+0x34e>
    6348:	072a                	slli	a4,a4,0xa
    634a:	8f71                	and	a4,a4,a2
    634c:	97ba                	add	a5,a5,a4
					n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
    634e:	00e14603          	lbu	a2,14(sp)
    6352:	00914703          	lbu	a4,9(sp)
    6356:	0686                	slli	a3,a3,0x1
    6358:	821d                	srli	a2,a2,0x7
    635a:	8b3d                	andi	a4,a4,15
    635c:	9732                	add	a4,a4,a2
    635e:	8a99                	andi	a3,a3,6
					*(LBA_t*)buff = cs << (n - 9);
    6360:	96ba                	add	a3,a3,a4
					cs = (csd[8] >> 6) + ((WORD)csd[7] << 2) + ((WORD)(csd[6] & 3) << 10) + 1;
    6362:	0785                	addi	a5,a5,1
					*(LBA_t*)buff = cs << (n - 9);
    6364:	16e5                	addi	a3,a3,-7
    6366:	00d797b3          	sll	a5,a5,a3
    636a:	b7e1                	j	6332 <disk_ioctl+0x86>
	if (disk_status(drv) & STA_NOINIT) return RES_NOTRDY;	/* Check if card is in the socket */
    636c:	450d                	li	a0,3
}
    636e:	8082                	ret

00006370 <copystring>:
    6370:	4781                	li	a5,0
    6372:	470d                	li	a4,3
    6374:	00b7c463          	blt	a5,a1,637c <copystring+0xc>
    6378:	853e                	mv	a0,a5
    637a:	8082                	ret
    637c:	00f606b3          	add	a3,a2,a5
    6380:	0006c303          	lbu	t1,0(a3)
    6384:	00f506b3          	add	a3,a0,a5
    6388:	0785                	addi	a5,a5,1
    638a:	00668023          	sb	t1,0(a3)
    638e:	fee793e3          	bne	a5,a4,6374 <copystring+0x4>
    6392:	feb7d3e3          	bge	a5,a1,6378 <copystring+0x8>
    6396:	000501a3          	sb	zero,3(a0)
    639a:	4791                	li	a5,4
    639c:	bff1                	j	6378 <copystring+0x8>

0000639e <__dtostr>:
    639e:	fa810113          	addi	sp,sp,-88
    63a2:	c8a2                	sw	s0,80(sp)
    63a4:	ca86                	sw	ra,84(sp)
    63a6:	c6a6                	sw	s1,76(sp)
    63a8:	d02a                	sw	a0,32(sp)
    63aa:	c42e                	sw	a1,8(sp)
    63ac:	c032                	sw	a2,0(sp)
    63ae:	8436                	mv	s0,a3
    63b0:	d43a                	sw	a4,40(sp)
    63b2:	c23e                	sw	a5,4(sp)
    63b4:	2edd                	jal	67aa <__isinf>
    63b6:	cd09                	beqz	a0,63d0 <__dtostr+0x32>
    63b8:	6621                	lui	a2,0x8
    63ba:	16060613          	addi	a2,a2,352 # 8160 <asc2_1608+0x644>
    63be:	85a2                	mv	a1,s0
    63c0:	4446                	lw	s0,80(sp)
    63c2:	4502                	lw	a0,0(sp)
    63c4:	40d6                	lw	ra,84(sp)
    63c6:	44b6                	lw	s1,76(sp)
    63c8:	05810113          	addi	sp,sp,88
    63cc:	fa5ff06f          	j	6370 <copystring>
    63d0:	5702                	lw	a4,32(sp)
    63d2:	47a2                	lw	a5,8(sp)
    63d4:	853a                	mv	a0,a4
    63d6:	85be                	mv	a1,a5
    63d8:	2b15                	jal	690c <__isnan>
    63da:	d22a                	sw	a0,36(sp)
    63dc:	c509                	beqz	a0,63e6 <__dtostr+0x48>
    63de:	6621                	lui	a2,0x8
    63e0:	16460613          	addi	a2,a2,356 # 8164 <asc2_1608+0x648>
    63e4:	bfe9                	j	63be <__dtostr+0x20>
    63e6:	5702                	lw	a4,32(sp)
    63e8:	47a2                	lw	a5,8(sp)
    63ea:	4601                	li	a2,0
    63ec:	4681                	li	a3,0
    63ee:	853a                	mv	a0,a4
    63f0:	85be                	mv	a1,a5
    63f2:	848fb0ef          	jal	ra,143a <__eqdf2>
    63f6:	e925                	bnez	a0,6466 <__dtostr+0xc8>
    63f8:	4792                	lw	a5,4(sp)
    63fa:	3a078363          	beqz	a5,67a0 <__dtostr+0x402>
    63fe:	0789                	addi	a5,a5,2
    6400:	02f46163          	bltu	s0,a5,6422 <__dtostr+0x84>
    6404:	cb85                	beqz	a5,6434 <__dtostr+0x96>
    6406:	4722                	lw	a4,8(sp)
    6408:	04075c63          	bgez	a4,6460 <__dtostr+0xc2>
    640c:	4682                	lw	a3,0(sp)
    640e:	02d00713          	li	a4,45
    6412:	00e68023          	sb	a4,0(a3)
    6416:	00178713          	addi	a4,a5,1
    641a:	4785                	li	a5,1
    641c:	03000693          	li	a3,48
    6420:	a801                	j	6430 <__dtostr+0x92>
    6422:	47a1                	li	a5,8
    6424:	b7cd                	j	6406 <__dtostr+0x68>
    6426:	4602                	lw	a2,0(sp)
    6428:	963e                	add	a2,a2,a5
    642a:	00d60023          	sb	a3,0(a2)
    642e:	0785                	addi	a5,a5,1
    6430:	fee7ebe3          	bltu	a5,a4,6426 <__dtostr+0x88>
    6434:	4702                	lw	a4,0(sp)
    6436:	03000693          	li	a3,48
    643a:	00074603          	lbu	a2,0(a4)
    643e:	4705                	li	a4,1
    6440:	00d60363          	beq	a2,a3,6446 <__dtostr+0xa8>
    6444:	4709                	li	a4,2
    6446:	4682                	lw	a3,0(sp)
    6448:	9736                	add	a4,a4,a3
    644a:	02e00693          	li	a3,46
    644e:	00d70023          	sb	a3,0(a4)
    6452:	4702                	lw	a4,0(sp)
    6454:	00f704b3          	add	s1,a4,a5
    6458:	00048023          	sb	zero,0(s1)
    645c:	d23e                	sw	a5,36(sp)
    645e:	a459                	j	66e4 <__dtostr+0x346>
    6460:	873e                	mv	a4,a5
    6462:	4781                	li	a5,0
    6464:	bf65                	j	641c <__dtostr+0x7e>
    6466:	5702                	lw	a4,32(sp)
    6468:	47a2                	lw	a5,8(sp)
    646a:	4601                	li	a2,0
    646c:	4681                	li	a3,0
    646e:	853a                	mv	a0,a4
    6470:	85be                	mv	a1,a5
    6472:	8fafb0ef          	jal	ra,156c <__ledf2>
    6476:	16055f63          	bgez	a0,65f4 <__dtostr+0x256>
    647a:	47a2                	lw	a5,8(sp)
    647c:	4702                	lw	a4,0(sp)
    647e:	800002b7          	lui	t0,0x80000
    6482:	00f2c2b3          	xor	t0,t0,a5
    6486:	02d00793          	li	a5,45
    648a:	00f70023          	sb	a5,0(a4)
    648e:	147d                	addi	s0,s0,-1
    6490:	00170493          	addi	s1,a4,1
    6494:	67a1                	lui	a5,0x8
    6496:	1287a503          	lw	a0,296(a5) # 8128 <asc2_1608+0x60c>
    649a:	12c7a583          	lw	a1,300(a5)
    649e:	67a1                	lui	a5,0x8
    64a0:	1387a703          	lw	a4,312(a5) # 8138 <asc2_1608+0x61c>
    64a4:	13c7a783          	lw	a5,316(a5)
    64a8:	4381                	li	t2,0
    64aa:	4692                	lw	a3,4(sp)
    64ac:	14d39763          	bne	t2,a3,65fa <__dtostr+0x25c>
    64b0:	5702                	lw	a4,32(sp)
    64b2:	862a                	mv	a2,a0
    64b4:	86ae                	mv	a3,a1
    64b6:	853a                	mv	a0,a4
    64b8:	8596                	mv	a1,t0
    64ba:	bf8fa0ef          	jal	ra,8b2 <__adddf3>
    64be:	67a1                	lui	a5,0x8
    64c0:	1407a603          	lw	a2,320(a5) # 8140 <asc2_1608+0x624>
    64c4:	1447a683          	lw	a3,324(a5)
    64c8:	c82a                	sw	a0,16(sp)
    64ca:	ca2e                	sw	a1,20(sp)
    64cc:	8a0fb0ef          	jal	ra,156c <__ledf2>
    64d0:	00055863          	bgez	a0,64e0 <__dtostr+0x142>
    64d4:	03000793          	li	a5,48
    64d8:	00f48023          	sb	a5,0(s1)
    64dc:	147d                	addi	s0,s0,-1
    64de:	0485                	addi	s1,s1,1
    64e0:	47a2                	lw	a5,8(sp)
    64e2:	0147d513          	srli	a0,a5,0x14
    64e6:	7ff57513          	andi	a0,a0,2047
    64ea:	c0150513          	addi	a0,a0,-1023
    64ee:	c2dfb0ef          	jal	ra,211a <__floatsidf>
    64f2:	67a1                	lui	a5,0x8
    64f4:	1487a603          	lw	a2,328(a5) # 8148 <asc2_1608+0x62c>
    64f8:	14c7a683          	lw	a3,332(a5)
    64fc:	926fb0ef          	jal	ra,1622 <__muldf3>
    6500:	bb7fb0ef          	jal	ra,20b6 <__fixdfsi>
    6504:	00150793          	addi	a5,a0,1
    6508:	cc3e                	sw	a5,24(sp)
    650a:	22f05763          	blez	a5,6738 <__dtostr+0x39a>
    650e:	66a1                	lui	a3,0x8
    6510:	1506a603          	lw	a2,336(a3) # 8150 <asc2_1608+0x634>
    6514:	82be                	mv	t0,a5
    6516:	1546a683          	lw	a3,340(a3)
    651a:	67a1                	lui	a5,0x8
    651c:	1307a703          	lw	a4,304(a5) # 8130 <asc2_1608+0x614>
    6520:	1347a783          	lw	a5,308(a5)
    6524:	43a9                	li	t2,10
    6526:	d632                	sw	a2,44(sp)
    6528:	d836                	sw	a3,48(sp)
    652a:	0e53e663          	bltu	t2,t0,6616 <__dtostr+0x278>
    652e:	66a1                	lui	a3,0x8
    6530:	1306a603          	lw	a2,304(a3) # 8130 <asc2_1608+0x614>
    6534:	1346a683          	lw	a3,308(a3)
    6538:	4385                	li	t2,1
    653a:	d632                	sw	a2,44(sp)
    653c:	d836                	sw	a3,48(sp)
    653e:	0e729963          	bne	t0,t2,6630 <__dtostr+0x292>
    6542:	4685                	li	a3,1
    6544:	d636                	sw	a3,44(sp)
    6546:	66a1                	lui	a3,0x8
    6548:	1586a603          	lw	a2,344(a3) # 8158 <asc2_1608+0x63c>
    654c:	15c6a683          	lw	a3,348(a3)
    6550:	da32                	sw	a2,52(sp)
    6552:	dc36                	sw	a3,56(sp)
    6554:	66a1                	lui	a3,0x8
    6556:	1306a603          	lw	a2,304(a3) # 8130 <asc2_1608+0x614>
    655a:	1346a683          	lw	a3,308(a3)
    655e:	de32                	sw	a2,60(sp)
    6560:	c0b6                	sw	a3,64(sp)
    6562:	5652                	lw	a2,52(sp)
    6564:	56e2                	lw	a3,56(sp)
    6566:	853a                	mv	a0,a4
    6568:	85be                	mv	a1,a5
    656a:	c2ba                	sw	a4,68(sp)
    656c:	c4be                	sw	a5,72(sp)
    656e:	f49fa0ef          	jal	ra,14b6 <__gedf2>
    6572:	4716                	lw	a4,68(sp)
    6574:	47a6                	lw	a5,72(sp)
    6576:	0ca04a63          	bgtz	a0,664a <__dtostr+0x2ac>
    657a:	4682                	lw	a3,0(sp)
    657c:	00d49a63          	bne	s1,a3,6590 <__dtostr+0x1f2>
    6580:	16040263          	beqz	s0,66e4 <__dtostr+0x346>
    6584:	03000693          	li	a3,48
    6588:	00d48023          	sb	a3,0(s1)
    658c:	147d                	addi	s0,s0,-1
    658e:	0485                	addi	s1,s1,1
    6590:	4692                	lw	a3,4(sp)
    6592:	ea81                	bnez	a3,65a2 <__dtostr+0x204>
    6594:	4682                	lw	a3,0(sp)
    6596:	5622                	lw	a2,40(sp)
    6598:	40d486b3          	sub	a3,s1,a3
    659c:	0685                	addi	a3,a3,1
    659e:	04c6f563          	bgeu	a3,a2,65e8 <__dtostr+0x24a>
    65a2:	14040163          	beqz	s0,66e4 <__dtostr+0x346>
    65a6:	02e00693          	li	a3,46
    65aa:	00d48023          	sb	a3,0(s1)
    65ae:	4692                	lw	a3,4(sp)
    65b0:	147d                	addi	s0,s0,-1
    65b2:	00148293          	addi	t0,s1,1
    65b6:	ea81                	bnez	a3,65c6 <__dtostr+0x228>
    65b8:	56a2                	lw	a3,40(sp)
    65ba:	4602                	lw	a2,0(sp)
    65bc:	0685                	addi	a3,a3,1
    65be:	40c28633          	sub	a2,t0,a2
    65c2:	8e91                	sub	a3,a3,a2
    65c4:	c236                	sw	a3,4(sp)
    65c6:	4692                	lw	a3,4(sp)
    65c8:	10d46e63          	bltu	s0,a3,66e4 <__dtostr+0x346>
    65cc:	8426                	mv	s0,s1
    65ce:	94b6                	add	s1,s1,a3
    65d0:	66a1                	lui	a3,0x8
    65d2:	1306a603          	lw	a2,304(a3) # 8130 <asc2_1608+0x614>
    65d6:	1346a683          	lw	a3,308(a3)
    65da:	c432                	sw	a2,8(sp)
    65dc:	c636                	sw	a3,12(sp)
    65de:	16941363          	bne	s0,s1,6744 <__dtostr+0x3a6>
    65e2:	4792                	lw	a5,4(sp)
    65e4:	00f284b3          	add	s1,t0,a5
    65e8:	4782                	lw	a5,0(sp)
    65ea:	00048023          	sb	zero,0(s1)
    65ee:	40f487b3          	sub	a5,s1,a5
    65f2:	b5ad                	j	645c <__dtostr+0xbe>
    65f4:	4482                	lw	s1,0(sp)
    65f6:	42a2                	lw	t0,8(sp)
    65f8:	bd71                	j	6494 <__dtostr+0xf6>
    65fa:	863a                	mv	a2,a4
    65fc:	86be                	mv	a3,a5
    65fe:	d616                	sw	t0,44(sp)
    6600:	cc1e                	sw	t2,24(sp)
    6602:	c83a                	sw	a4,16(sp)
    6604:	ca3e                	sw	a5,20(sp)
    6606:	81cfb0ef          	jal	ra,1622 <__muldf3>
    660a:	43e2                	lw	t2,24(sp)
    660c:	52b2                	lw	t0,44(sp)
    660e:	4742                	lw	a4,16(sp)
    6610:	0385                	addi	t2,t2,1
    6612:	47d2                	lw	a5,20(sp)
    6614:	bd59                	j	64aa <__dtostr+0x10c>
    6616:	5632                	lw	a2,44(sp)
    6618:	56c2                	lw	a3,48(sp)
    661a:	853a                	mv	a0,a4
    661c:	85be                	mv	a1,a5
    661e:	da16                	sw	t0,52(sp)
    6620:	802fb0ef          	jal	ra,1622 <__muldf3>
    6624:	52d2                	lw	t0,52(sp)
    6626:	872a                	mv	a4,a0
    6628:	87ae                	mv	a5,a1
    662a:	12d9                	addi	t0,t0,-10
    662c:	43a9                	li	t2,10
    662e:	bdf5                	j	652a <__dtostr+0x18c>
    6630:	5632                	lw	a2,44(sp)
    6632:	56c2                	lw	a3,48(sp)
    6634:	853a                	mv	a0,a4
    6636:	85be                	mv	a1,a5
    6638:	da16                	sw	t0,52(sp)
    663a:	fe9fa0ef          	jal	ra,1622 <__muldf3>
    663e:	52d2                	lw	t0,52(sp)
    6640:	872a                	mv	a4,a0
    6642:	87ae                	mv	a5,a1
    6644:	12fd                	addi	t0,t0,-1
    6646:	4385                	li	t2,1
    6648:	bddd                	j	653e <__dtostr+0x1a0>
    664a:	4542                	lw	a0,16(sp)
    664c:	45d2                	lw	a1,20(sp)
    664e:	863a                	mv	a2,a4
    6650:	86be                	mv	a3,a5
    6652:	c2ba                	sw	a4,68(sp)
    6654:	c4be                	sw	a5,72(sp)
    6656:	853fa0ef          	jal	ra,ea8 <__divdf3>
    665a:	a5dfb0ef          	jal	ra,20b6 <__fixdfsi>
    665e:	5632                	lw	a2,44(sp)
    6660:	0ff57693          	andi	a3,a0,255
    6664:	4716                	lw	a4,68(sp)
    6666:	47a6                	lw	a5,72(sp)
    6668:	c211                	beqz	a2,666c <__dtostr+0x2ce>
    666a:	ced5                	beqz	a3,6726 <__dtostr+0x388>
    666c:	03068693          	addi	a3,a3,48
    6670:	00d48023          	sb	a3,0(s1)
    6674:	0485                	addi	s1,s1,1
    6676:	ec35                	bnez	s0,66f2 <__dtostr+0x354>
    6678:	863a                	mv	a2,a4
    667a:	86be                	mv	a3,a5
    667c:	5702                	lw	a4,32(sp)
    667e:	47a2                	lw	a5,8(sp)
    6680:	853a                	mv	a0,a4
    6682:	85be                	mv	a1,a5
    6684:	825fa0ef          	jal	ra,ea8 <__divdf3>
    6688:	4792                	lw	a5,4(sp)
    668a:	5722                	lw	a4,40(sp)
    668c:	4602                	lw	a2,0(sp)
    668e:	4681                	li	a3,0
    6690:	3339                	jal	639e <__dtostr>
    6692:	c929                	beqz	a0,66e4 <__dtostr+0x346>
    6694:	00a48333          	add	t1,s1,a0
    6698:	06500793          	li	a5,101
    669c:	00f30023          	sb	a5,0(t1)
    66a0:	00130493          	addi	s1,t1,1
    66a4:	fff54513          	not	a0,a0
    66a8:	4711                	li	a4,4
    66aa:	4685                	li	a3,1
    66ac:	3e800793          	li	a5,1000
    66b0:	4629                	li	a2,10
    66b2:	45e2                	lw	a1,24(sp)
    66b4:	00f5d363          	bge	a1,a5,66ba <__dtostr+0x31c>
    66b8:	e285                	bnez	a3,66d8 <__dtostr+0x33a>
    66ba:	c909                	beqz	a0,66cc <__dtostr+0x32e>
    66bc:	46e2                	lw	a3,24(sp)
    66be:	0485                	addi	s1,s1,1
    66c0:	02f6c6b3          	div	a3,a3,a5
    66c4:	03068693          	addi	a3,a3,48
    66c8:	fed48fa3          	sb	a3,-1(s1)
    66cc:	46e2                	lw	a3,24(sp)
    66ce:	157d                	addi	a0,a0,-1
    66d0:	02f6e6b3          	rem	a3,a3,a5
    66d4:	cc36                	sw	a3,24(sp)
    66d6:	4681                	li	a3,0
    66d8:	177d                	addi	a4,a4,-1
    66da:	02c7c7b3          	div	a5,a5,a2
    66de:	fb71                	bnez	a4,66b2 <__dtostr+0x314>
    66e0:	f00514e3          	bnez	a0,65e8 <__dtostr+0x24a>
    66e4:	40d6                	lw	ra,84(sp)
    66e6:	4446                	lw	s0,80(sp)
    66e8:	5512                	lw	a0,36(sp)
    66ea:	44b6                	lw	s1,76(sp)
    66ec:	05810113          	addi	sp,sp,88
    66f0:	8082                	ret
    66f2:	0ff57513          	andi	a0,a0,255
    66f6:	d63a                	sw	a4,44(sp)
    66f8:	d83e                	sw	a5,48(sp)
    66fa:	a21fb0ef          	jal	ra,211a <__floatsidf>
    66fe:	5732                	lw	a4,44(sp)
    6700:	57c2                	lw	a5,48(sp)
    6702:	147d                	addi	s0,s0,-1
    6704:	863a                	mv	a2,a4
    6706:	86be                	mv	a3,a5
    6708:	c2ba                	sw	a4,68(sp)
    670a:	c4be                	sw	a5,72(sp)
    670c:	f17fa0ef          	jal	ra,1622 <__muldf3>
    6710:	862a                	mv	a2,a0
    6712:	86ae                	mv	a3,a1
    6714:	4542                	lw	a0,16(sp)
    6716:	45d2                	lw	a1,20(sp)
    6718:	b92fb0ef          	jal	ra,1aaa <__subdf3>
    671c:	4716                	lw	a4,68(sp)
    671e:	47a6                	lw	a5,72(sp)
    6720:	c82a                	sw	a0,16(sp)
    6722:	ca2e                	sw	a1,20(sp)
    6724:	d602                	sw	zero,44(sp)
    6726:	5672                	lw	a2,60(sp)
    6728:	4686                	lw	a3,64(sp)
    672a:	853a                	mv	a0,a4
    672c:	85be                	mv	a1,a5
    672e:	f7afa0ef          	jal	ra,ea8 <__divdf3>
    6732:	872a                	mv	a4,a0
    6734:	87ae                	mv	a5,a1
    6736:	b535                	j	6562 <__dtostr+0x1c4>
    6738:	67a1                	lui	a5,0x8
    673a:	1387a703          	lw	a4,312(a5) # 8138 <asc2_1608+0x61c>
    673e:	13c7a783          	lw	a5,316(a5)
    6742:	bd25                	j	657a <__dtostr+0x1dc>
    6744:	4542                	lw	a0,16(sp)
    6746:	45d2                	lw	a1,20(sp)
    6748:	863a                	mv	a2,a4
    674a:	86be                	mv	a3,a5
    674c:	d016                	sw	t0,32(sp)
    674e:	cc3a                	sw	a4,24(sp)
    6750:	ce3e                	sw	a5,28(sp)
    6752:	f56fa0ef          	jal	ra,ea8 <__divdf3>
    6756:	961fb0ef          	jal	ra,20b6 <__fixdfsi>
    675a:	03050693          	addi	a3,a0,48
    675e:	00d400a3          	sb	a3,1(s0)
    6762:	0ff57513          	andi	a0,a0,255
    6766:	9b5fb0ef          	jal	ra,211a <__floatsidf>
    676a:	4762                	lw	a4,24(sp)
    676c:	47f2                	lw	a5,28(sp)
    676e:	0405                	addi	s0,s0,1
    6770:	863a                	mv	a2,a4
    6772:	86be                	mv	a3,a5
    6774:	eaffa0ef          	jal	ra,1622 <__muldf3>
    6778:	862a                	mv	a2,a0
    677a:	86ae                	mv	a3,a1
    677c:	4542                	lw	a0,16(sp)
    677e:	45d2                	lw	a1,20(sp)
    6780:	b2afb0ef          	jal	ra,1aaa <__subdf3>
    6784:	4762                	lw	a4,24(sp)
    6786:	47f2                	lw	a5,28(sp)
    6788:	4622                	lw	a2,8(sp)
    678a:	46b2                	lw	a3,12(sp)
    678c:	c82a                	sw	a0,16(sp)
    678e:	ca2e                	sw	a1,20(sp)
    6790:	853a                	mv	a0,a4
    6792:	85be                	mv	a1,a5
    6794:	f14fa0ef          	jal	ra,ea8 <__divdf3>
    6798:	872a                	mv	a4,a0
    679a:	87ae                	mv	a5,a1
    679c:	5282                	lw	t0,32(sp)
    679e:	b581                	j	65de <__dtostr+0x240>
    67a0:	47a1                	li	a5,8
    67a2:	c60402e3          	beqz	s0,6406 <__dtostr+0x68>
    67a6:	4785                	li	a5,1
    67a8:	b9b9                	j	6406 <__dtostr+0x68>

000067aa <__isinf>:
    67aa:	e509                	bnez	a0,67b4 <__isinf+0xa>
    67ac:	7ff007b7          	lui	a5,0x7ff00
    67b0:	00f58b63          	beq	a1,a5,67c6 <__isinf+0x1c>
    67b4:	fff007b7          	lui	a5,0xfff00
    67b8:	8fad                	xor	a5,a5,a1
    67ba:	8d5d                	or	a0,a0,a5
    67bc:	00153513          	seqz	a0,a0
    67c0:	40a00533          	neg	a0,a0
    67c4:	8082                	ret
    67c6:	4505                	li	a0,1
    67c8:	8082                	ret

000067ca <__lltostr>:
    67ca:	fdc10113          	addi	sp,sp,-36
    67ce:	15fd                	addi	a1,a1,-1
    67d0:	ce22                	sw	s0,28(sp)
    67d2:	d006                	sw	ra,32(sp)
    67d4:	cc26                	sw	s1,24(sp)
    67d6:	95aa                	add	a1,a1,a0
    67d8:	00058023          	sb	zero,0(a1) # 40000000 <__heap_end+0x1ffd0000>
    67dc:	842a                	mv	s0,a0
    67de:	82b2                	mv	t0,a2
    67e0:	8336                	mv	t1,a3
    67e2:	c709                	beqz	a4,67ec <__lltostr+0x22>
    67e4:	02400693          	li	a3,36
    67e8:	00e6d363          	bge	a3,a4,67ee <__lltostr+0x24>
    67ec:	4729                	li	a4,10
    67ee:	0062e6b3          	or	a3,t0,t1
    67f2:	4601                	li	a2,0
    67f4:	e699                	bnez	a3,6802 <__lltostr+0x38>
    67f6:	03000693          	li	a3,48
    67fa:	fed58fa3          	sb	a3,-1(a1)
    67fe:	4605                	li	a2,1
    6800:	15fd                	addi	a1,a1,-1
    6802:	02700693          	li	a3,39
    6806:	c391                	beqz	a5,680a <__lltostr+0x40>
    6808:	469d                	li	a3,7
    680a:	0ff6f793          	andi	a5,a3,255
    680e:	c23e                	sw	a5,4(sp)
    6810:	00c587b3          	add	a5,a1,a2
    6814:	c43e                	sw	a5,8(sp)
    6816:	41f75793          	srai	a5,a4,0x1f
    681a:	84ae                	mv	s1,a1
    681c:	c03e                	sw	a5,0(sp)
    681e:	47a2                	lw	a5,8(sp)
    6820:	409786b3          	sub	a3,a5,s1
    6824:	00947563          	bgeu	s0,s1,682e <__lltostr+0x64>
    6828:	0062e633          	or	a2,t0,t1
    682c:	e205                	bnez	a2,684c <__lltostr+0x82>
    682e:	00168613          	addi	a2,a3,1
    6832:	85a6                	mv	a1,s1
    6834:	8522                	mv	a0,s0
    6836:	c036                	sw	a3,0(sp)
    6838:	985fb0ef          	jal	ra,21bc <memmove>
    683c:	4682                	lw	a3,0(sp)
    683e:	5082                	lw	ra,32(sp)
    6840:	4472                	lw	s0,28(sp)
    6842:	44e2                	lw	s1,24(sp)
    6844:	8536                	mv	a0,a3
    6846:	02410113          	addi	sp,sp,36
    684a:	8082                	ret
    684c:	4682                	lw	a3,0(sp)
    684e:	863a                	mv	a2,a4
    6850:	8516                	mv	a0,t0
    6852:	859a                	mv	a1,t1
    6854:	ca3a                	sw	a4,20(sp)
    6856:	c816                	sw	t0,16(sp)
    6858:	c61a                	sw	t1,12(sp)
    685a:	d05f90ef          	jal	ra,55e <__umoddi3>
    685e:	03050513          	addi	a0,a0,48
    6862:	0ff57513          	andi	a0,a0,255
    6866:	03900793          	li	a5,57
    686a:	14fd                	addi	s1,s1,-1
    686c:	4332                	lw	t1,12(sp)
    686e:	42c2                	lw	t0,16(sp)
    6870:	4752                	lw	a4,20(sp)
    6872:	00a7ef63          	bltu	a5,a0,6890 <__lltostr+0xc6>
    6876:	4682                	lw	a3,0(sp)
    6878:	00a48023          	sb	a0,0(s1)
    687c:	863a                	mv	a2,a4
    687e:	8516                	mv	a0,t0
    6880:	859a                	mv	a1,t1
    6882:	c63a                	sw	a4,12(sp)
    6884:	971f90ef          	jal	ra,1f4 <__udivdi3>
    6888:	82aa                	mv	t0,a0
    688a:	832e                	mv	t1,a1
    688c:	4732                	lw	a4,12(sp)
    688e:	bf41                	j	681e <__lltostr+0x54>
    6890:	4792                	lw	a5,4(sp)
    6892:	953e                	add	a0,a0,a5
    6894:	b7cd                	j	6876 <__lltostr+0xac>

00006896 <printf>:
    6896:	fdc10113          	addi	sp,sp,-36
    689a:	c82e                	sw	a1,16(sp)
    689c:	080c                	addi	a1,sp,16
    689e:	c606                	sw	ra,12(sp)
    68a0:	ca32                	sw	a2,20(sp)
    68a2:	cc36                	sw	a3,24(sp)
    68a4:	ce3a                	sw	a4,28(sp)
    68a6:	d03e                	sw	a5,32(sp)
    68a8:	c02e                	sw	a1,0(sp)
    68aa:	2099                	jal	68f0 <vprintf>
    68ac:	40b2                	lw	ra,12(sp)
    68ae:	02410113          	addi	sp,sp,36
    68b2:	8082                	ret

000068b4 <putc>:
    68b4:	e0efd06f          	j	3ec2 <fputc>

000068b8 <__stdio_outs>:
    68b8:	1151                	addi	sp,sp,-12
    68ba:	c222                	sw	s0,4(sp)
    68bc:	c026                	sw	s1,0(sp)
    68be:	842a                	mv	s0,a0
    68c0:	84ae                	mv	s1,a1
    68c2:	c406                	sw	ra,8(sp)
    68c4:	94a2                	add	s1,s1,s0
    68c6:	e36fd0ef          	jal	ra,3efc <os_critical_enter>
    68ca:	00941a63          	bne	s0,s1,68de <__stdio_outs+0x26>
    68ce:	e32fd0ef          	jal	ra,3f00 <os_critical_exit>
    68d2:	40a2                	lw	ra,8(sp)
    68d4:	4412                	lw	s0,4(sp)
    68d6:	4482                	lw	s1,0(sp)
    68d8:	4505                	li	a0,1
    68da:	0131                	addi	sp,sp,12
    68dc:	8082                	ret
    68de:	0001a703          	lw	a4,0(gp) # 200004e8 <_impure_ptr>
    68e2:	00044503          	lbu	a0,0(s0)
    68e6:	0405                	addi	s0,s0,1
    68e8:	470c                	lw	a1,8(a4)
    68ea:	dd8fd0ef          	jal	ra,3ec2 <fputc>
    68ee:	bff1                	j	68ca <__stdio_outs+0x12>

000068f0 <vprintf>:
    68f0:	1131                	addi	sp,sp,-20
    68f2:	679d                	lui	a5,0x7
    68f4:	8b878793          	addi	a5,a5,-1864 # 68b8 <__stdio_outs>
    68f8:	862e                	mv	a2,a1
    68fa:	85aa                	mv	a1,a0
    68fc:	850a                	mv	a0,sp
    68fe:	c806                	sw	ra,16(sp)
    6900:	c002                	sw	zero,0(sp)
    6902:	c23e                	sw	a5,4(sp)
    6904:	2299                	jal	6a4a <__v_printf>
    6906:	40c2                	lw	ra,16(sp)
    6908:	0151                	addi	sp,sp,20
    690a:	8082                	ret

0000690c <__isnan>:
    690c:	fff80737          	lui	a4,0xfff80
    6910:	177d                	addi	a4,a4,-1
    6912:	8f6d                	and	a4,a4,a1
    6914:	e509                	bnez	a0,691e <__isnan+0x12>
    6916:	7ff007b7          	lui	a5,0x7ff00
    691a:	00f70963          	beq	a4,a5,692c <__isnan+0x20>
    691e:	fff807b7          	lui	a5,0xfff80
    6922:	8fad                	xor	a5,a5,a1
    6924:	8fc9                	or	a5,a5,a0
    6926:	0017b513          	seqz	a0,a5
    692a:	8082                	ret
    692c:	4505                	li	a0,1
    692e:	8082                	ret

00006930 <__ltostr>:
    6930:	1151                	addi	sp,sp,-12
    6932:	15fd                	addi	a1,a1,-1
    6934:	c406                	sw	ra,8(sp)
    6936:	c222                	sw	s0,4(sp)
    6938:	95aa                	add	a1,a1,a0
    693a:	00058023          	sb	zero,0(a1)
    693e:	fff68313          	addi	t1,a3,-1
    6942:	02300793          	li	a5,35
    6946:	0067f363          	bgeu	a5,t1,694c <__ltostr+0x1c>
    694a:	46a9                	li	a3,10
    694c:	4781                	li	a5,0
    694e:	e619                	bnez	a2,695c <__ltostr+0x2c>
    6950:	03000793          	li	a5,48
    6954:	fef58fa3          	sb	a5,-1(a1)
    6958:	15fd                	addi	a1,a1,-1
    695a:	4785                	li	a5,1
    695c:	02700313          	li	t1,39
    6960:	c311                	beqz	a4,6964 <__ltostr+0x34>
    6962:	431d                	li	t1,7
    6964:	0ff37713          	andi	a4,t1,255
    6968:	03900293          	li	t0,57
    696c:	00f58333          	add	t1,a1,a5
    6970:	40b30433          	sub	s0,t1,a1
    6974:	00b57363          	bgeu	a0,a1,697a <__ltostr+0x4a>
    6978:	ea11                	bnez	a2,698c <__ltostr+0x5c>
    697a:	00140613          	addi	a2,s0,1
    697e:	83ffb0ef          	jal	ra,21bc <memmove>
    6982:	8522                	mv	a0,s0
    6984:	40a2                	lw	ra,8(sp)
    6986:	4412                	lw	s0,4(sp)
    6988:	0131                	addi	sp,sp,12
    698a:	8082                	ret
    698c:	02d677b3          	remu	a5,a2,a3
    6990:	15fd                	addi	a1,a1,-1
    6992:	03078793          	addi	a5,a5,48 # fff80030 <__heap_end+0xdff50030>
    6996:	0ff7f793          	andi	a5,a5,255
    699a:	00f2e763          	bltu	t0,a5,69a8 <__ltostr+0x78>
    699e:	00f58023          	sb	a5,0(a1)
    69a2:	02d65633          	divu	a2,a2,a3
    69a6:	b7e9                	j	6970 <__ltostr+0x40>
    69a8:	97ba                	add	a5,a5,a4
    69aa:	bfd5                	j	699e <__ltostr+0x6e>

000069ac <putchar>:
    69ac:	0001a783          	lw	a5,0(gp) # 200004e8 <_impure_ptr>
    69b0:	1151                	addi	sp,sp,-12
    69b2:	c406                	sw	ra,8(sp)
    69b4:	478c                	lw	a1,8(a5)
    69b6:	effff0ef          	jal	ra,68b4 <putc>
    69ba:	40a2                	lw	ra,8(sp)
    69bc:	4501                	li	a0,0
    69be:	0131                	addi	sp,sp,12
    69c0:	8082                	ret

000069c2 <puts>:
    69c2:	1151                	addi	sp,sp,-12
    69c4:	c222                	sw	s0,4(sp)
    69c6:	c406                	sw	ra,8(sp)
    69c8:	842a                	mv	s0,a0
    69ca:	00044503          	lbu	a0,0(s0)
    69ce:	55fd                	li	a1,-1
    69d0:	e909                	bnez	a0,69e2 <puts+0x20>
    69d2:	4529                	li	a0,10
    69d4:	ceefd0ef          	jal	ra,3ec2 <fputc>
    69d8:	40a2                	lw	ra,8(sp)
    69da:	4412                	lw	s0,4(sp)
    69dc:	4501                	li	a0,0
    69de:	0131                	addi	sp,sp,12
    69e0:	8082                	ret
    69e2:	ce0fd0ef          	jal	ra,3ec2 <fputc>
    69e6:	0405                	addi	s0,s0,1
    69e8:	b7cd                	j	69ca <puts+0x8>

000069ea <write_pad>:
    69ea:	1131                	addi	sp,sp,-20
    69ec:	fd060613          	addi	a2,a2,-48
    69f0:	c426                	sw	s1,8(sp)
    69f2:	00163613          	seqz	a2,a2
    69f6:	64a1                	lui	s1,0x8
    69f8:	0612                	slli	a2,a2,0x4
    69fa:	17048493          	addi	s1,s1,368 # 8170 <pad_line>
    69fe:	c622                	sw	s0,12(sp)
    6a00:	c806                	sw	ra,16(sp)
    6a02:	87aa                	mv	a5,a0
    6a04:	872e                	mv	a4,a1
    6a06:	94b2                	add	s1,s1,a2
    6a08:	842e                	mv	s0,a1
    6a0a:	463d                	li	a2,15
    6a0c:	408706b3          	sub	a3,a4,s0
    6a10:	02864263          	blt	a2,s0,6a34 <write_pad+0x4a>
    6a14:	00805a63          	blez	s0,6a28 <write_pad+0x3e>
    6a18:	43d8                	lw	a4,4(a5)
    6a1a:	4390                	lw	a2,0(a5)
    6a1c:	85a2                	mv	a1,s0
    6a1e:	8526                	mv	a0,s1
    6a20:	c036                	sw	a3,0(sp)
    6a22:	9702                	jalr	a4
    6a24:	4682                	lw	a3,0(sp)
    6a26:	96a2                	add	a3,a3,s0
    6a28:	40c2                	lw	ra,16(sp)
    6a2a:	4432                	lw	s0,12(sp)
    6a2c:	44a2                	lw	s1,8(sp)
    6a2e:	8536                	mv	a0,a3
    6a30:	0151                	addi	sp,sp,20
    6a32:	8082                	ret
    6a34:	43d4                	lw	a3,4(a5)
    6a36:	4390                	lw	a2,0(a5)
    6a38:	45c1                	li	a1,16
    6a3a:	8526                	mv	a0,s1
    6a3c:	c23a                	sw	a4,4(sp)
    6a3e:	c03e                	sw	a5,0(sp)
    6a40:	9682                	jalr	a3
    6a42:	1441                	addi	s0,s0,-16
    6a44:	4712                	lw	a4,4(sp)
    6a46:	4782                	lw	a5,0(sp)
    6a48:	b7c9                	j	6a0a <write_pad+0x20>

00006a4a <__v_printf>:
    6a4a:	00c1a783          	lw	a5,12(gp) # 200004f4 <errno>
    6a4e:	f2810113          	addi	sp,sp,-216
    6a52:	c9a2                	sw	s0,208(sp)
    6a54:	c7a6                	sw	s1,204(sp)
    6a56:	cb86                	sw	ra,212(sp)
    6a58:	84aa                	mv	s1,a0
    6a5a:	c82e                	sw	a1,16(sp)
    6a5c:	8432                	mv	s0,a2
    6a5e:	d83e                	sw	a5,48(sp)
    6a60:	c202                	sw	zero,4(sp)
    6a62:	47c2                	lw	a5,16(sp)
    6a64:	0007c783          	lbu	a5,0(a5)
    6a68:	68078063          	beqz	a5,70e8 <__v_printf+0x69e>
    6a6c:	4701                	li	a4,0
    6a6e:	02500613          	li	a2,37
    6a72:	a011                	j	6a76 <__v_printf+0x2c>
    6a74:	0705                	addi	a4,a4,1
    6a76:	47c2                	lw	a5,16(sp)
    6a78:	97ba                	add	a5,a5,a4
    6a7a:	0007c683          	lbu	a3,0(a5)
    6a7e:	74068863          	beqz	a3,71ce <__v_printf+0x784>
    6a82:	fec699e3          	bne	a3,a2,6a74 <__v_printf+0x2a>
    6a86:	e319                	bnez	a4,6a8c <__v_printf+0x42>
    6a88:	47c2                	lw	a5,16(sp)
    6a8a:	a01d                	j	6ab0 <__v_printf+0x66>
    6a8c:	40d4                	lw	a3,4(s1)
    6a8e:	4090                	lw	a2,0(s1)
    6a90:	4542                	lw	a0,16(sp)
    6a92:	85ba                	mv	a1,a4
    6a94:	c43e                	sw	a5,8(sp)
    6a96:	c03a                	sw	a4,0(sp)
    6a98:	9682                	jalr	a3
    6a9a:	4792                	lw	a5,4(sp)
    6a9c:	4702                	lw	a4,0(sp)
    6a9e:	97ba                	add	a5,a5,a4
    6aa0:	c23e                	sw	a5,4(sp)
    6aa2:	47a2                	lw	a5,8(sp)
    6aa4:	02500713          	li	a4,37
    6aa8:	0007c683          	lbu	a3,0(a5)
    6aac:	72e69463          	bne	a3,a4,71d4 <__v_printf+0x78a>
    6ab0:	00178513          	addi	a0,a5,1
    6ab4:	02000793          	li	a5,32
    6ab8:	c002                	sw	zero,0(sp)
    6aba:	c602                	sw	zero,12(sp)
    6abc:	4701                	li	a4,0
    6abe:	ca02                	sw	zero,20(sp)
    6ac0:	ce02                	sw	zero,28(sp)
    6ac2:	d602                	sw	zero,44(sp)
    6ac4:	d002                	sw	zero,32(sp)
    6ac6:	c402                	sw	zero,8(sp)
    6ac8:	cc3e                	sw	a5,24(sp)
    6aca:	00054303          	lbu	t1,0(a0)
    6ace:	00150793          	addi	a5,a0,1
    6ad2:	c83e                	sw	a5,16(sp)
    6ad4:	046103a3          	sb	t1,71(sp)
    6ad8:	06300793          	li	a5,99
    6adc:	1cf30963          	beq	t1,a5,6cae <__v_printf+0x264>
    6ae0:	0c67e863          	bltu	a5,t1,6bb0 <__v_printf+0x166>
    6ae4:	02d00793          	li	a5,45
    6ae8:	02f30363          	beq	t1,a5,6b0e <__v_printf+0xc4>
    6aec:	0667e263          	bltu	a5,t1,6b50 <__v_printf+0x106>
    6af0:	02300793          	li	a5,35
    6af4:	02f30163          	beq	t1,a5,6b16 <__v_printf+0xcc>
    6af8:	0267e663          	bltu	a5,t1,6b24 <__v_printf+0xda>
    6afc:	5e030463          	beqz	t1,70e4 <__v_printf+0x69a>
    6b00:	02000793          	li	a5,32
    6b04:	f4f31fe3          	bne	t1,a5,6a62 <__v_printf+0x18>
    6b08:	4785                	li	a5,1
    6b0a:	d63e                	sw	a5,44(sp)
    6b0c:	a019                	j	6b12 <__v_printf+0xc8>
    6b0e:	4785                	li	a5,1
    6b10:	d03e                	sw	a5,32(sp)
    6b12:	4542                	lw	a0,16(sp)
    6b14:	bf5d                	j	6aca <__v_printf+0x80>
    6b16:	0ff00793          	li	a5,255
    6b1a:	c43e                	sw	a5,8(sp)
    6b1c:	bfdd                	j	6b12 <__v_printf+0xc8>
    6b1e:	4785                	li	a5,1
    6b20:	ce3e                	sw	a5,28(sp)
    6b22:	bfc5                	j	6b12 <__v_printf+0xc8>
    6b24:	02a00793          	li	a5,42
    6b28:	16f30163          	beq	t1,a5,6c8a <__v_printf+0x240>
    6b2c:	02b00793          	li	a5,43
    6b30:	fef307e3          	beq	t1,a5,6b1e <__v_printf+0xd4>
    6b34:	02500793          	li	a5,37
    6b38:	f2f315e3          	bne	t1,a5,6a62 <__v_printf+0x18>
    6b3c:	40dc                	lw	a5,4(s1)
    6b3e:	4090                	lw	a2,0(s1)
    6b40:	4585                	li	a1,1
    6b42:	04710513          	addi	a0,sp,71
    6b46:	9782                	jalr	a5
    6b48:	4792                	lw	a5,4(sp)
    6b4a:	0785                	addi	a5,a5,1
    6b4c:	c23e                	sw	a5,4(sp)
    6b4e:	bf11                	j	6a62 <__v_printf+0x18>
    6b50:	03900793          	li	a5,57
    6b54:	0267ee63          	bltu	a5,t1,6b90 <__v_printf+0x146>
    6b58:	03000793          	li	a5,48
    6b5c:	0ef37f63          	bgeu	t1,a5,6c5a <__v_printf+0x210>
    6b60:	02e00793          	li	a5,46
    6b64:	eef31fe3          	bne	t1,a5,6a62 <__v_printf+0x18>
    6b68:	00154683          	lbu	a3,1(a0)
    6b6c:	02a00793          	li	a5,42
    6b70:	12f69163          	bne	a3,a5,6c92 <__v_printf+0x248>
    6b74:	4014                	lw	a3,0(s0)
    6b76:	00440793          	addi	a5,s0,4
    6b7a:	c036                	sw	a3,0(sp)
    6b7c:	0006d363          	bgez	a3,6b82 <__v_printf+0x138>
    6b80:	c002                	sw	zero,0(sp)
    6b82:	00250693          	addi	a3,a0,2
    6b86:	c836                	sw	a3,16(sp)
    6b88:	843e                	mv	s0,a5
    6b8a:	4785                	li	a5,1
    6b8c:	ca3e                	sw	a5,20(sp)
    6b8e:	b751                	j	6b12 <__v_printf+0xc8>
    6b90:	05800793          	li	a5,88
    6b94:	2af30263          	beq	t1,a5,6e38 <__v_printf+0x3ee>
    6b98:	06200793          	li	a5,98
    6b9c:	36f30363          	beq	t1,a5,6f02 <__v_printf+0x4b8>
    6ba0:	04c00793          	li	a5,76
    6ba4:	eaf31fe3          	bne	t1,a5,6a62 <__v_printf+0x18>
    6ba8:	0705                	addi	a4,a4,1
    6baa:	0762                	slli	a4,a4,0x18
    6bac:	8761                	srai	a4,a4,0x18
    6bae:	a091                	j	6bf2 <__v_printf+0x1a8>
    6bb0:	06d00793          	li	a5,109
    6bb4:	10f30263          	beq	t1,a5,6cb8 <__v_printf+0x26e>
    6bb8:	0267ef63          	bltu	a5,t1,6bf6 <__v_printf+0x1ac>
    6bbc:	06700793          	li	a5,103
    6bc0:	0067ef63          	bltu	a5,t1,6bde <__v_printf+0x194>
    6bc4:	06600793          	li	a5,102
    6bc8:	3ef37263          	bgeu	t1,a5,6fac <__v_printf+0x562>
    6bcc:	06400793          	li	a5,100
    6bd0:	e8f319e3          	bne	t1,a5,6a62 <__v_printf+0x18>
    6bd4:	4529                	li	a0,10
    6bd6:	4781                	li	a5,0
    6bd8:	4285                	li	t0,1
    6bda:	4301                	li	t1,0
    6bdc:	ac49                	j	6e6e <__v_printf+0x424>
    6bde:	06900793          	li	a5,105
    6be2:	fef309e3          	beq	t1,a5,6bd4 <__v_printf+0x18a>
    6be6:	06f36663          	bltu	t1,a5,6c52 <__v_printf+0x208>
    6bea:	06c00793          	li	a5,108
    6bee:	e6f31ae3          	bne	t1,a5,6a62 <__v_printf+0x18>
    6bf2:	0705                	addi	a4,a4,1
    6bf4:	a085                	j	6c54 <__v_printf+0x20a>
    6bf6:	07300793          	li	a5,115
    6bfa:	0ef30163          	beq	t1,a5,6cdc <__v_printf+0x292>
    6bfe:	0267ec63          	bltu	a5,t1,6c36 <__v_printf+0x1ec>
    6c02:	07000793          	li	a5,112
    6c06:	22f30263          	beq	t1,a5,6e2a <__v_printf+0x3e0>
    6c0a:	07100793          	li	a5,113
    6c0e:	f8f30de3          	beq	t1,a5,6ba8 <__v_printf+0x15e>
    6c12:	06f00793          	li	a5,111
    6c16:	e4f316e3          	bne	t1,a5,6a62 <__v_printf+0x18>
    6c1a:	47a2                	lw	a5,8(sp)
    6c1c:	2e078763          	beqz	a5,6f0a <__v_printf+0x4c0>
    6c20:	03000793          	li	a5,48
    6c24:	04f106a3          	sb	a5,77(sp)
    6c28:	4785                	li	a5,1
    6c2a:	c43e                	sw	a5,8(sp)
    6c2c:	4521                	li	a0,8
    6c2e:	4781                	li	a5,0
    6c30:	4281                	li	t0,0
    6c32:	4305                	li	t1,1
    6c34:	ac2d                	j	6e6e <__v_printf+0x424>
    6c36:	07800793          	li	a5,120
    6c3a:	2cf30263          	beq	t1,a5,6efe <__v_printf+0x4b4>
    6c3e:	07a00793          	li	a5,122
    6c42:	ecf308e3          	beq	t1,a5,6b12 <__v_printf+0xc8>
    6c46:	07500793          	li	a5,117
    6c4a:	e0f31ce3          	bne	t1,a5,6a62 <__v_printf+0x18>
    6c4e:	4529                	li	a0,10
    6c50:	ac55                	j	6f04 <__v_printf+0x4ba>
    6c52:	177d                	addi	a4,a4,-1
    6c54:	0762                	slli	a4,a4,0x18
    6c56:	8761                	srai	a4,a4,0x18
    6c58:	bd6d                	j	6b12 <__v_printf+0xc8>
    6c5a:	47d2                	lw	a5,20(sp)
    6c5c:	c83a                	sw	a4,16(sp)
    6c5e:	48079363          	bnez	a5,70e4 <__v_printf+0x69a>
    6c62:	4629                	li	a2,10
    6c64:	00ac                	addi	a1,sp,72
    6c66:	fb9fb0ef          	jal	ra,2c1e <strtoul>
    6c6a:	04714683          	lbu	a3,71(sp)
    6c6e:	c62a                	sw	a0,12(sp)
    6c70:	03000793          	li	a5,48
    6c74:	4742                	lw	a4,16(sp)
    6c76:	00f69763          	bne	a3,a5,6c84 <__v_printf+0x23a>
    6c7a:	5782                	lw	a5,32(sp)
    6c7c:	e781                	bnez	a5,6c84 <__v_printf+0x23a>
    6c7e:	03000793          	li	a5,48
    6c82:	cc3e                	sw	a5,24(sp)
    6c84:	47a6                	lw	a5,72(sp)
    6c86:	c83e                	sw	a5,16(sp)
    6c88:	b569                	j	6b12 <__v_printf+0xc8>
    6c8a:	401c                	lw	a5,0(s0)
    6c8c:	0411                	addi	s0,s0,4
    6c8e:	c63e                	sw	a5,12(sp)
    6c90:	b549                	j	6b12 <__v_printf+0xc8>
    6c92:	4542                	lw	a0,16(sp)
    6c94:	4629                	li	a2,10
    6c96:	00ac                	addi	a1,sp,72
    6c98:	ca3a                	sw	a4,20(sp)
    6c9a:	dcbfb0ef          	jal	ra,2a64 <strtol>
    6c9e:	c02a                	sw	a0,0(sp)
    6ca0:	4752                	lw	a4,20(sp)
    6ca2:	00055363          	bgez	a0,6ca8 <__v_printf+0x25e>
    6ca6:	c002                	sw	zero,0(sp)
    6ca8:	47a6                	lw	a5,72(sp)
    6caa:	c83e                	sw	a5,16(sp)
    6cac:	bdf9                	j	6b8a <__v_printf+0x140>
    6cae:	401c                	lw	a5,0(s0)
    6cb0:	0411                	addi	s0,s0,4
    6cb2:	04f103a3          	sb	a5,71(sp)
    6cb6:	b559                	j	6b3c <__v_printf+0xf2>
    6cb8:	5542                	lw	a0,48(sp)
    6cba:	b79fb0ef          	jal	ra,2832 <strerror>
    6cbe:	c4aa                	sw	a0,72(sp)
    6cc0:	c42a                	sw	a0,8(sp)
    6cc2:	b8bfb0ef          	jal	ra,284c <strlen>
    6cc6:	4722                	lw	a4,8(sp)
    6cc8:	40d4                	lw	a3,4(s1)
    6cca:	4090                	lw	a2,0(s1)
    6ccc:	85aa                	mv	a1,a0
    6cce:	c02a                	sw	a0,0(sp)
    6cd0:	853a                	mv	a0,a4
    6cd2:	9682                	jalr	a3
    6cd4:	4712                	lw	a4,4(sp)
    6cd6:	4782                	lw	a5,0(sp)
    6cd8:	97ba                	add	a5,a5,a4
    6cda:	bd8d                	j	6b4c <__v_printf+0x102>
    6cdc:	4018                	lw	a4,0(s0)
    6cde:	00440793          	addi	a5,s0,4
    6ce2:	c721                	beqz	a4,6d2a <__v_printf+0x2e0>
    6ce4:	c4ba                	sw	a4,72(sp)
    6ce6:	4526                	lw	a0,72(sp)
    6ce8:	cc3e                	sw	a5,24(sp)
    6cea:	b63fb0ef          	jal	ra,284c <strlen>
    6cee:	4752                	lw	a4,20(sp)
    6cf0:	832a                	mv	t1,a0
    6cf2:	47e2                	lw	a5,24(sp)
    6cf4:	cf1d                	beqz	a4,6d32 <__v_printf+0x2e8>
    6cf6:	4702                	lw	a4,0(sp)
    6cf8:	00a77363          	bgeu	a4,a0,6cfe <__v_printf+0x2b4>
    6cfc:	833a                	mv	t1,a4
    6cfe:	843e                	mv	s0,a5
    6d00:	c002                	sw	zero,0(sp)
    6d02:	ca02                	sw	zero,20(sp)
    6d04:	4281                	li	t0,0
    6d06:	02000793          	li	a5,32
    6d0a:	cc3e                	sw	a5,24(sp)
    6d0c:	47b2                	lw	a5,12(sp)
    6d0e:	4702                	lw	a4,0(sp)
    6d10:	46a6                	lw	a3,72(sp)
    6d12:	8fd9                	or	a5,a5,a4
    6d14:	e39d                	bnez	a5,6d3a <__v_printf+0x2f0>
    6d16:	40dc                	lw	a5,4(s1)
    6d18:	4090                	lw	a2,0(s1)
    6d1a:	859a                	mv	a1,t1
    6d1c:	8536                	mv	a0,a3
    6d1e:	c01a                	sw	t1,0(sp)
    6d20:	9782                	jalr	a5
    6d22:	4792                	lw	a5,4(sp)
    6d24:	4302                	lw	t1,0(sp)
    6d26:	979a                	add	a5,a5,t1
    6d28:	b515                	j	6b4c <__v_printf+0x102>
    6d2a:	6721                	lui	a4,0x8
    6d2c:	16870713          	addi	a4,a4,360 # 8168 <asc2_1608+0x64c>
    6d30:	bf55                	j	6ce4 <__v_printf+0x29a>
    6d32:	843e                	mv	s0,a5
    6d34:	4281                	li	t0,0
    6d36:	c002                	sw	zero,0(sp)
    6d38:	b7f9                	j	6d06 <__v_printf+0x2bc>
    6d3a:	44029163          	bnez	t0,717c <__v_printf+0x732>
    6d3e:	47a2                	lw	a5,8(sp)
    6d40:	3a078b63          	beqz	a5,70f6 <__v_printf+0x6ac>
    6d44:	47a2                	lw	a5,8(sp)
    6d46:	00f68733          	add	a4,a3,a5
    6d4a:	c4ba                	sw	a4,72(sp)
    6d4c:	4732                	lw	a4,12(sp)
    6d4e:	40f30333          	sub	t1,t1,a5
    6d52:	8f1d                	sub	a4,a4,a5
    6d54:	c63a                	sw	a4,12(sp)
    6d56:	5702                	lw	a4,32(sp)
    6d58:	3a070363          	beqz	a4,70fe <__v_printf+0x6b4>
    6d5c:	40d8                	lw	a4,4(s1)
    6d5e:	4090                	lw	a2,0(s1)
    6d60:	85be                	mv	a1,a5
    6d62:	8536                	mv	a0,a3
    6d64:	ca1a                	sw	t1,20(sp)
    6d66:	c43e                	sw	a5,8(sp)
    6d68:	9702                	jalr	a4
    6d6a:	4712                	lw	a4,4(sp)
    6d6c:	47a2                	lw	a5,8(sp)
    6d6e:	4352                	lw	t1,20(sp)
    6d70:	97ba                	add	a5,a5,a4
    6d72:	c23e                	sw	a5,4(sp)
    6d74:	4782                	lw	a5,0(sp)
    6d76:	03000613          	li	a2,48
    6d7a:	8526                	mv	a0,s1
    6d7c:	406785b3          	sub	a1,a5,t1
    6d80:	ca1a                	sw	t1,20(sp)
    6d82:	c69ff0ef          	jal	ra,69ea <write_pad>
    6d86:	4792                	lw	a5,4(sp)
    6d88:	4352                	lw	t1,20(sp)
    6d8a:	40d8                	lw	a4,4(s1)
    6d8c:	97aa                	add	a5,a5,a0
    6d8e:	4090                	lw	a2,0(s1)
    6d90:	4526                	lw	a0,72(sp)
    6d92:	859a                	mv	a1,t1
    6d94:	c43e                	sw	a5,8(sp)
    6d96:	c21a                	sw	t1,4(sp)
    6d98:	9702                	jalr	a4
    6d9a:	4312                	lw	t1,4(sp)
    6d9c:	47a2                	lw	a5,8(sp)
    6d9e:	4582                	lw	a1,0(sp)
    6da0:	979a                	add	a5,a5,t1
    6da2:	0065f363          	bgeu	a1,t1,6da8 <__v_printf+0x35e>
    6da6:	859a                	mv	a1,t1
    6da8:	c03e                	sw	a5,0(sp)
    6daa:	47b2                	lw	a5,12(sp)
    6dac:	02000613          	li	a2,32
    6db0:	8526                	mv	a0,s1
    6db2:	40b785b3          	sub	a1,a5,a1
    6db6:	c35ff0ef          	jal	ra,69ea <write_pad>
    6dba:	4782                	lw	a5,0(sp)
    6dbc:	97aa                	add	a5,a5,a0
    6dbe:	b379                	j	6b4c <__v_printf+0x102>
    6dc0:	c78d                	beqz	a5,6dea <__v_printf+0x3a0>
    6dc2:	4662                	lw	a2,24(sp)
    6dc4:	03000713          	li	a4,48
    6dc8:	02e61163          	bne	a2,a4,6dea <__v_printf+0x3a0>
    6dcc:	40d8                	lw	a4,4(s1)
    6dce:	4090                	lw	a2,0(s1)
    6dd0:	85be                	mv	a1,a5
    6dd2:	8536                	mv	a0,a3
    6dd4:	ca1a                	sw	t1,20(sp)
    6dd6:	c43e                	sw	a5,8(sp)
    6dd8:	c036                	sw	a3,0(sp)
    6dda:	9702                	jalr	a4
    6ddc:	4712                	lw	a4,4(sp)
    6dde:	47a2                	lw	a5,8(sp)
    6de0:	4352                	lw	t1,20(sp)
    6de2:	4682                	lw	a3,0(sp)
    6de4:	97ba                	add	a5,a5,a4
    6de6:	c23e                	sw	a5,4(sp)
    6de8:	4781                	li	a5,0
    6dea:	c43e                	sw	a5,8(sp)
    6dec:	47b2                	lw	a5,12(sp)
    6dee:	4662                	lw	a2,24(sp)
    6df0:	8526                	mv	a0,s1
    6df2:	406785b3          	sub	a1,a5,t1
    6df6:	c01a                	sw	t1,0(sp)
    6df8:	ca36                	sw	a3,20(sp)
    6dfa:	bf1ff0ef          	jal	ra,69ea <write_pad>
    6dfe:	4792                	lw	a5,4(sp)
    6e00:	4302                	lw	t1,0(sp)
    6e02:	00a78733          	add	a4,a5,a0
    6e06:	47a2                	lw	a5,8(sp)
    6e08:	34078e63          	beqz	a5,7164 <__v_printf+0x71a>
    6e0c:	46d2                	lw	a3,20(sp)
    6e0e:	0044a383          	lw	t2,4(s1)
    6e12:	4090                	lw	a2,0(s1)
    6e14:	85be                	mv	a1,a5
    6e16:	8536                	mv	a0,a3
    6e18:	c41a                	sw	t1,8(sp)
    6e1a:	c23a                	sw	a4,4(sp)
    6e1c:	c03e                	sw	a5,0(sp)
    6e1e:	9382                	jalr	t2
    6e20:	4782                	lw	a5,0(sp)
    6e22:	4712                	lw	a4,4(sp)
    6e24:	4322                	lw	t1,8(sp)
    6e26:	973e                	add	a4,a4,a5
    6e28:	ae35                	j	7164 <__v_printf+0x71a>
    6e2a:	07800793          	li	a5,120
    6e2e:	04f103a3          	sb	a5,71(sp)
    6e32:	4789                	li	a5,2
    6e34:	4705                	li	a4,1
    6e36:	c43e                	sw	a5,8(sp)
    6e38:	04714783          	lbu	a5,71(sp)
    6e3c:	fa878793          	addi	a5,a5,-88
    6e40:	0017b793          	seqz	a5,a5
    6e44:	46a2                	lw	a3,8(sp)
    6e46:	4301                	li	t1,0
    6e48:	ce81                	beqz	a3,6e60 <__v_printf+0x416>
    6e4a:	03000693          	li	a3,48
    6e4e:	04d106a3          	sb	a3,77(sp)
    6e52:	04714683          	lbu	a3,71(sp)
    6e56:	4309                	li	t1,2
    6e58:	04d10723          	sb	a3,78(sp)
    6e5c:	4689                	li	a3,2
    6e5e:	c436                	sw	a3,8(sp)
    6e60:	46b2                	lw	a3,12(sp)
    6e62:	4602                	lw	a2,0(sp)
    6e64:	00c6f363          	bgeu	a3,a2,6e6a <__v_printf+0x420>
    6e68:	c632                	sw	a2,12(sp)
    6e6a:	4541                	li	a0,16
    6e6c:	4281                	li	t0,0
    6e6e:	04d10693          	addi	a3,sp,77
    6e72:	c4b6                	sw	a3,72(sp)
    6e74:	0ae05a63          	blez	a4,6f28 <__v_printf+0x4de>
    6e78:	4685                	li	a3,1
    6e7a:	08d70c63          	beq	a4,a3,6f12 <__v_printf+0x4c8>
    6e7e:	00840393          	addi	t2,s0,8
    6e82:	4010                	lw	a2,0(s0)
    6e84:	4054                	lw	a3,4(s0)
    6e86:	4581                	li	a1,0
    6e88:	08028c63          	beqz	t0,6f20 <__v_printf+0x4d6>
    6e8c:	0006da63          	bgez	a3,6ea0 <__v_printf+0x456>
    6e90:	40c00633          	neg	a2,a2
    6e94:	00c03733          	snez	a4,a2
    6e98:	40d006b3          	neg	a3,a3
    6e9c:	8e99                	sub	a3,a3,a4
    6e9e:	4289                	li	t0,2
    6ea0:	872a                	mv	a4,a0
    6ea2:	04d10513          	addi	a0,sp,77
    6ea6:	951a                	add	a0,a0,t1
    6ea8:	07b00593          	li	a1,123
    6eac:	da1e                	sw	t2,52(sp)
    6eae:	d416                	sw	t0,40(sp)
    6eb0:	d21a                	sw	t1,36(sp)
    6eb2:	919ff0ef          	jal	ra,67ca <__lltostr>
    6eb6:	53d2                	lw	t2,52(sp)
    6eb8:	5312                	lw	t1,36(sp)
    6eba:	52a2                	lw	t0,40(sp)
    6ebc:	841e                	mv	s0,t2
    6ebe:	4752                	lw	a4,20(sp)
    6ec0:	47a6                	lw	a5,72(sp)
    6ec2:	cb5d                	beqz	a4,6f78 <__v_printf+0x52e>
    6ec4:	4705                	li	a4,1
    6ec6:	0ae51963          	bne	a0,a4,6f78 <__v_printf+0x52e>
    6eca:	00678733          	add	a4,a5,t1
    6ece:	00074683          	lbu	a3,0(a4)
    6ed2:	03000713          	li	a4,48
    6ed6:	0ae69163          	bne	a3,a4,6f78 <__v_printf+0x52e>
    6eda:	4702                	lw	a4,0(sp)
    6edc:	c345                	beqz	a4,6f7c <__v_printf+0x532>
    6ede:	4722                	lw	a4,8(sp)
    6ee0:	c319                	beqz	a4,6ee6 <__v_printf+0x49c>
    6ee2:	c402                	sw	zero,8(sp)
    6ee4:	4301                	li	t1,0
    6ee6:	4709                	li	a4,2
    6ee8:	08e29d63          	bne	t0,a4,6f82 <__v_printf+0x538>
    6eec:	fff78713          	addi	a4,a5,-1
    6ef0:	c4ba                	sw	a4,72(sp)
    6ef2:	02d00713          	li	a4,45
    6ef6:	fee78fa3          	sb	a4,-1(a5)
    6efa:	0305                	addi	t1,t1,1
    6efc:	bd01                	j	6d0c <__v_printf+0x2c2>
    6efe:	4781                	li	a5,0
    6f00:	b791                	j	6e44 <__v_printf+0x3fa>
    6f02:	4509                	li	a0,2
    6f04:	4781                	li	a5,0
    6f06:	4281                	li	t0,0
    6f08:	b9c9                	j	6bda <__v_printf+0x190>
    6f0a:	4781                	li	a5,0
    6f0c:	4281                	li	t0,0
    6f0e:	4521                	li	a0,8
    6f10:	b1e9                	j	6bda <__v_printf+0x190>
    6f12:	00440393          	addi	t2,s0,4
    6f16:	400c                	lw	a1,0(s0)
    6f18:	00029d63          	bnez	t0,6f32 <__v_printf+0x4e8>
    6f1c:	4601                	li	a2,0
    6f1e:	4681                	li	a3,0
    6f20:	4405                	li	s0,1
    6f22:	f6e44fe3          	blt	s0,a4,6ea0 <__v_printf+0x456>
    6f26:	a01d                	j	6f4c <__v_printf+0x502>
    6f28:	00440393          	addi	t2,s0,4
    6f2c:	400c                	lw	a1,0(s0)
    6f2e:	00028863          	beqz	t0,6f3e <__v_printf+0x4f4>
    6f32:	4285                	li	t0,1
    6f34:	0005d563          	bgez	a1,6f3e <__v_printf+0x4f4>
    6f38:	40b005b3          	neg	a1,a1
    6f3c:	4289                	li	t0,2
    6f3e:	fc075fe3          	bgez	a4,6f1c <__v_printf+0x4d2>
    6f42:	56fd                	li	a3,-1
    6f44:	02d70763          	beq	a4,a3,6f72 <__v_printf+0x528>
    6f48:	0ff5f593          	andi	a1,a1,255
    6f4c:	873e                	mv	a4,a5
    6f4e:	04d10793          	addi	a5,sp,77
    6f52:	86aa                	mv	a3,a0
    6f54:	862e                	mv	a2,a1
    6f56:	00678533          	add	a0,a5,t1
    6f5a:	07b00593          	li	a1,123
    6f5e:	da1e                	sw	t2,52(sp)
    6f60:	d416                	sw	t0,40(sp)
    6f62:	d21a                	sw	t1,36(sp)
    6f64:	9cdff0ef          	jal	ra,6930 <__ltostr>
    6f68:	53d2                	lw	t2,52(sp)
    6f6a:	52a2                	lw	t0,40(sp)
    6f6c:	5312                	lw	t1,36(sp)
    6f6e:	841e                	mv	s0,t2
    6f70:	b7b9                	j	6ebe <__v_printf+0x474>
    6f72:	05c2                	slli	a1,a1,0x10
    6f74:	81c1                	srli	a1,a1,0x10
    6f76:	bfd9                	j	6f4c <__v_printf+0x502>
    6f78:	932a                	add	t1,t1,a0
    6f7a:	b7b5                	j	6ee6 <__v_printf+0x49c>
    6f7c:	4301                	li	t1,0
    6f7e:	c402                	sw	zero,8(sp)
    6f80:	b79d                	j	6ee6 <__v_printf+0x49c>
    6f82:	d80285e3          	beqz	t0,6d0c <__v_printf+0x2c2>
    6f86:	4772                	lw	a4,28(sp)
    6f88:	ef19                	bnez	a4,6fa6 <__v_printf+0x55c>
    6f8a:	5732                	lw	a4,44(sp)
    6f8c:	4281                	li	t0,0
    6f8e:	d6070fe3          	beqz	a4,6d0c <__v_printf+0x2c2>
    6f92:	02000713          	li	a4,32
    6f96:	fff78693          	addi	a3,a5,-1
    6f9a:	c4b6                	sw	a3,72(sp)
    6f9c:	fee78fa3          	sb	a4,-1(a5)
    6fa0:	0305                	addi	t1,t1,1
    6fa2:	4285                	li	t0,1
    6fa4:	b3a5                	j	6d0c <__v_printf+0x2c2>
    6fa6:	02b00713          	li	a4,43
    6faa:	b7f5                	j	6f96 <__v_printf+0x54c>
    6fac:	00840793          	addi	a5,s0,8
    6fb0:	da3e                	sw	a5,52(sp)
    6fb2:	401c                	lw	a5,0(s0)
    6fb4:	d23e                	sw	a5,36(sp)
    6fb6:	405c                	lw	a5,4(s0)
    6fb8:	d43e                	sw	a5,40(sp)
    6fba:	04d10793          	addi	a5,sp,77
    6fbe:	c4be                	sw	a5,72(sp)
    6fc0:	47b2                	lw	a5,12(sp)
    6fc2:	e399                	bnez	a5,6fc8 <__v_printf+0x57e>
    6fc4:	4785                	li	a5,1
    6fc6:	c63e                	sw	a5,12(sp)
    6fc8:	47d2                	lw	a5,20(sp)
    6fca:	e399                	bnez	a5,6fd0 <__v_printf+0x586>
    6fcc:	4799                	li	a5,6
    6fce:	c03e                	sw	a5,0(sp)
    6fd0:	42f2                	lw	t0,28(sp)
    6fd2:	00029e63          	bnez	t0,6fee <__v_printf+0x5a4>
    6fd6:	5712                	lw	a4,36(sp)
    6fd8:	57a2                	lw	a5,40(sp)
    6fda:	4601                	li	a2,0
    6fdc:	4681                	li	a3,0
    6fde:	853a                	mv	a0,a4
    6fe0:	85be                	mv	a1,a5
    6fe2:	dc1a                	sw	t1,56(sp)
    6fe4:	d88fa0ef          	jal	ra,156c <__ledf2>
    6fe8:	5362                	lw	t1,56(sp)
    6fea:	01f55293          	srli	t0,a0,0x1f
    6fee:	5412                	lw	s0,36(sp)
    6ff0:	53a2                	lw	t2,40(sp)
    6ff2:	4782                	lw	a5,0(sp)
    6ff4:	4732                	lw	a4,12(sp)
    6ff6:	07f00693          	li	a3,127
    6ffa:	04d10613          	addi	a2,sp,77
    6ffe:	8522                	mv	a0,s0
    7000:	859e                	mv	a1,t2
    7002:	c096                	sw	t0,64(sp)
    7004:	dc1a                	sw	t1,56(sp)
    7006:	b98ff0ef          	jal	ra,639e <__dtostr>
    700a:	47d2                	lw	a5,20(sp)
    700c:	de2a                	sw	a0,60(sp)
    700e:	5362                	lw	t1,56(sp)
    7010:	4286                	lw	t0,64(sp)
    7012:	cb95                	beqz	a5,7046 <__v_printf+0x5fc>
    7014:	4426                	lw	s0,72(sp)
    7016:	02e00593          	li	a1,46
    701a:	dc16                	sw	t0,56(sp)
    701c:	8522                	mv	a0,s0
    701e:	ca1a                	sw	t1,20(sp)
    7020:	b3afb0ef          	jal	ra,235a <strchr>
    7024:	4352                	lw	t1,20(sp)
    7026:	52e2                	lw	t0,56(sp)
    7028:	57f2                	lw	a5,60(sp)
    702a:	cd49                	beqz	a0,70c4 <__v_printf+0x67a>
    702c:	4782                	lw	a5,0(sp)
    702e:	e399                	bnez	a5,7034 <__v_printf+0x5ea>
    7030:	47a2                	lw	a5,8(sp)
    7032:	cb81                	beqz	a5,7042 <__v_printf+0x5f8>
    7034:	0505                	addi	a0,a0,1
    7036:	4782                	lw	a5,0(sp)
    7038:	c789                	beqz	a5,7042 <__v_printf+0x5f8>
    703a:	0505                	addi	a0,a0,1
    703c:	00054783          	lbu	a5,0(a0)
    7040:	efb5                	bnez	a5,70bc <__v_printf+0x672>
    7042:	00050023          	sb	zero,0(a0)
    7046:	06700793          	li	a5,103
    704a:	04f31a63          	bne	t1,a5,709e <__v_printf+0x654>
    704e:	4526                	lw	a0,72(sp)
    7050:	02e00593          	li	a1,46
    7054:	c416                	sw	t0,8(sp)
    7056:	b04fb0ef          	jal	ra,235a <strchr>
    705a:	842a                	mv	s0,a0
    705c:	42a2                	lw	t0,8(sp)
    705e:	c121                	beqz	a0,709e <__v_printf+0x654>
    7060:	06500593          	li	a1,101
    7064:	af6fb0ef          	jal	ra,235a <strchr>
    7068:	42a2                	lw	t0,8(sp)
    706a:	85aa                	mv	a1,a0
    706c:	00044783          	lbu	a5,0(s0)
    7070:	e7b5                	bnez	a5,70dc <__v_printf+0x692>
    7072:	c191                	beqz	a1,7076 <__v_printf+0x62c>
    7074:	842e                	mv	s0,a1
    7076:	03000693          	li	a3,48
    707a:	fff44703          	lbu	a4,-1(s0)
    707e:	fff40513          	addi	a0,s0,-1
    7082:	04d70f63          	beq	a4,a3,70e0 <__v_printf+0x696>
    7086:	02e00693          	li	a3,46
    708a:	00d70363          	beq	a4,a3,7090 <__v_printf+0x646>
    708e:	8522                	mv	a0,s0
    7090:	00050023          	sb	zero,0(a0)
    7094:	c589                	beqz	a1,709e <__v_printf+0x654>
    7096:	c416                	sw	t0,8(sp)
    7098:	bb8fb0ef          	jal	ra,2450 <strcpy>
    709c:	42a2                	lw	t0,8(sp)
    709e:	47f2                	lw	a5,28(sp)
    70a0:	10079263          	bnez	a5,71a4 <__v_printf+0x75a>
    70a4:	57b2                	lw	a5,44(sp)
    70a6:	e3e5                	bnez	a5,7186 <__v_printf+0x73c>
    70a8:	4526                	lw	a0,72(sp)
    70aa:	ce16                	sw	t0,28(sp)
    70ac:	fa0fb0ef          	jal	ra,284c <strlen>
    70b0:	832a                	mv	t1,a0
    70b2:	5452                	lw	s0,52(sp)
    70b4:	ca02                	sw	zero,20(sp)
    70b6:	c402                	sw	zero,8(sp)
    70b8:	42f2                	lw	t0,28(sp)
    70ba:	b989                	j	6d0c <__v_printf+0x2c2>
    70bc:	4782                	lw	a5,0(sp)
    70be:	17fd                	addi	a5,a5,-1
    70c0:	c03e                	sw	a5,0(sp)
    70c2:	bf95                	j	7036 <__v_printf+0x5ec>
    70c4:	4722                	lw	a4,8(sp)
    70c6:	d341                	beqz	a4,7046 <__v_printf+0x5fc>
    70c8:	943e                	add	s0,s0,a5
    70ca:	02e00713          	li	a4,46
    70ce:	00e40023          	sb	a4,0(s0)
    70d2:	4526                	lw	a0,72(sp)
    70d4:	953e                	add	a0,a0,a5
    70d6:	000500a3          	sb	zero,1(a0)
    70da:	b7b5                	j	7046 <__v_printf+0x5fc>
    70dc:	0405                	addi	s0,s0,1
    70de:	b779                	j	706c <__v_printf+0x622>
    70e0:	842a                	mv	s0,a0
    70e2:	bf61                	j	707a <__v_printf+0x630>
    70e4:	57fd                	li	a5,-1
    70e6:	c23e                	sw	a5,4(sp)
    70e8:	40de                	lw	ra,212(sp)
    70ea:	444e                	lw	s0,208(sp)
    70ec:	4512                	lw	a0,4(sp)
    70ee:	44be                	lw	s1,204(sp)
    70f0:	0d810113          	addi	sp,sp,216
    70f4:	8082                	ret
    70f6:	5782                	lw	a5,32(sp)
    70f8:	c6079ee3          	bnez	a5,6d74 <__v_printf+0x32a>
    70fc:	4781                	li	a5,0
    70fe:	4752                	lw	a4,20(sp)
    7100:	cc0700e3          	beqz	a4,6dc0 <__v_printf+0x376>
    7104:	4582                	lw	a1,0(sp)
    7106:	0065f363          	bgeu	a1,t1,710c <__v_printf+0x6c2>
    710a:	859a                	mv	a1,t1
    710c:	ca3e                	sw	a5,20(sp)
    710e:	47b2                	lw	a5,12(sp)
    7110:	02000613          	li	a2,32
    7114:	8526                	mv	a0,s1
    7116:	40b785b3          	sub	a1,a5,a1
    711a:	c41a                	sw	t1,8(sp)
    711c:	cc36                	sw	a3,24(sp)
    711e:	8cdff0ef          	jal	ra,69ea <write_pad>
    7122:	4792                	lw	a5,4(sp)
    7124:	4322                	lw	t1,8(sp)
    7126:	00f50733          	add	a4,a0,a5
    712a:	47d2                	lw	a5,20(sp)
    712c:	cf99                	beqz	a5,714a <__v_printf+0x700>
    712e:	46e2                	lw	a3,24(sp)
    7130:	0044a383          	lw	t2,4(s1)
    7134:	4090                	lw	a2,0(s1)
    7136:	85be                	mv	a1,a5
    7138:	8536                	mv	a0,a3
    713a:	c61a                	sw	t1,12(sp)
    713c:	c43a                	sw	a4,8(sp)
    713e:	c23e                	sw	a5,4(sp)
    7140:	9382                	jalr	t2
    7142:	4792                	lw	a5,4(sp)
    7144:	4722                	lw	a4,8(sp)
    7146:	4332                	lw	t1,12(sp)
    7148:	973e                	add	a4,a4,a5
    714a:	4782                	lw	a5,0(sp)
    714c:	03000613          	li	a2,48
    7150:	8526                	mv	a0,s1
    7152:	406785b3          	sub	a1,a5,t1
    7156:	c23a                	sw	a4,4(sp)
    7158:	c01a                	sw	t1,0(sp)
    715a:	891ff0ef          	jal	ra,69ea <write_pad>
    715e:	4712                	lw	a4,4(sp)
    7160:	4302                	lw	t1,0(sp)
    7162:	972a                	add	a4,a4,a0
    7164:	40dc                	lw	a5,4(s1)
    7166:	4090                	lw	a2,0(s1)
    7168:	4526                	lw	a0,72(sp)
    716a:	859a                	mv	a1,t1
    716c:	c23a                	sw	a4,4(sp)
    716e:	c01a                	sw	t1,0(sp)
    7170:	9782                	jalr	a5
    7172:	4302                	lw	t1,0(sp)
    7174:	4712                	lw	a4,4(sp)
    7176:	006707b3          	add	a5,a4,t1
    717a:	bac9                	j	6b4c <__v_printf+0x102>
    717c:	47a2                	lw	a5,8(sp)
    717e:	bc0793e3          	bnez	a5,6d44 <__v_printf+0x2fa>
    7182:	4785                	li	a5,1
    7184:	b6c9                	j	6d46 <__v_printf+0x2fc>
    7186:	57a2                	lw	a5,40(sp)
    7188:	5712                	lw	a4,36(sp)
    718a:	4601                	li	a2,0
    718c:	85be                	mv	a1,a5
    718e:	4681                	li	a3,0
    7190:	853a                	mv	a0,a4
    7192:	c416                	sw	t0,8(sp)
    7194:	b22fa0ef          	jal	ra,14b6 <__gedf2>
    7198:	02000793          	li	a5,32
    719c:	42a2                	lw	t0,8(sp)
    719e:	02055163          	bgez	a0,71c0 <__v_printf+0x776>
    71a2:	b719                	j	70a8 <__v_printf+0x65e>
    71a4:	5712                	lw	a4,36(sp)
    71a6:	57a2                	lw	a5,40(sp)
    71a8:	4601                	li	a2,0
    71aa:	4681                	li	a3,0
    71ac:	853a                	mv	a0,a4
    71ae:	85be                	mv	a1,a5
    71b0:	c416                	sw	t0,8(sp)
    71b2:	b04fa0ef          	jal	ra,14b6 <__gedf2>
    71b6:	42a2                	lw	t0,8(sp)
    71b8:	ee0548e3          	bltz	a0,70a8 <__v_printf+0x65e>
    71bc:	02b00793          	li	a5,43
    71c0:	4726                	lw	a4,72(sp)
    71c2:	fff70693          	addi	a3,a4,-1
    71c6:	c4b6                	sw	a3,72(sp)
    71c8:	fef70fa3          	sb	a5,-1(a4)
    71cc:	bdf1                	j	70a8 <__v_printf+0x65e>
    71ce:	8a071fe3          	bnez	a4,6a8c <__v_printf+0x42>
    71d2:	47c2                	lw	a5,16(sp)
    71d4:	c83e                	sw	a5,16(sp)
    71d6:	b071                	j	6a62 <__v_printf+0x18>
	...
