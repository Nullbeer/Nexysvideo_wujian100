#include "sys.h"
#include "usart.h"		
#include "delay.h"	
#include "led.h" 
#include "key.h" 
#include <string.h>
#include "aes.h"
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
//ALIENTEK Mini STM32开发板范例代码3
//串口实验   
//技术支持：www.openedv.com
//广州市星翼电子科技有限公司















void read_128(uint8_t* in){
    uint8_t tmp;
	  int i;
		while(!(USART_RX_STA&0x8000));
	  if(USART_RX_STA&0x8000){
    for(i=0;i<16;i++){
				in[i] = USART_RX_BUF[i];
			}
				USART_RX_STA=0;
		}

    /*scanf("%hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd",*/
           /*&in[ 0],&in[ 1],&in[ 2],&in[ 3],*/
           /*&in[ 4],&in[ 5],&in[ 6],&in[ 7],*/
           /*&in[ 8],&in[ 9],&in[10],&in[11],*/
           /*&in[12],&in[13],&in[14],&in[15]);*/
}

/*
 * @brief Function to write a byte array as 16 integers to the serial line
 */
void write_128(uint8_t* out){
//    printf("%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\r\n",
//           out[ 0],out[ 1],out[ 2],out[ 3],
//           out[ 4],out[ 5],out[ 6],out[ 7],
//           out[ 8],out[ 9],out[10],out[11],
//           out[12],out[13],out[14],out[15]);
	    printf("%x %x %x %x %x %x %x %x %x %x %x %x %x %x %x %x\r\n",
           out[ 0],out[ 1],out[ 2],out[ 3],
           out[ 4],out[ 5],out[ 6],out[ 7],
           out[ 8],out[ 9],out[10],out[11],
           out[12],out[13],out[14],out[15]);
}



///*
// * @brief Function to handle tiny_aes_128 attacks
// */
//void tiny_aes_128_mode(){
//    uint8_t control;
//    bool exit = false;
//    uint8_t key[16] = {0};
//    uint8_t in[16] = {0};
//    uint8_t out[16] = {0};
//    uint32_t num_repetitions = 1;
//		
//		
//		uint32_t i,j;
//		printf("Entering tiny_aes_128 mode\r\n");

//    while(!exit){
//    //    scanf("%c",&control);
//        switch(control){
//            case 'p':
//                read_128(in);
//                write_128(in); // dbg
//                break;
//            case 'k':
//                read_128(key);
//                write_128(key); // dbg
//                break;
//            case 'e':
//                AES128_ECB_encrypt(in,key,out);
//                break;
//            case 'n':           /* set number of repetitions */
//                scanf("%lu", &num_repetitions);
//                printf("Setting number of repetitions to %d\r\n", num_repetitions);
//                break;
//            case 'r':           /* repeated encryption */
//                for ( i = 0; i < num_repetitions; ++i) {
//                    for( j = 0; j < 0xff; j++);
//                    AES128_ECB_encrypt(in, key, out);
//                }
//                printf("Done\r\n");
//                break;
//            case 'o':
//                write_128(out);
//                break;
//            case 'q':
//                exit = true;
//                break;
//            default:
//                break;
//        }
//    }
//    printf("Exiting tiny_aes_128 mode\r\n");
//}




int main(void)
{			
		u8 t,i;
		u8 len;	
		char control;
		uint32_t loop_num=1;
		uint8_t key[16] = {0};
    uint8_t in[16] = {0};
    uint8_t out[16] = {0};
//	u16 times=0;  

	Stm32_Clock_Init(9); //系统时钟设置
	delay_init(72);	     //延时初始化 
	uart_init(72,9600);	 //串口初始化为9600
	LED_Init();		  	 //初始化与LED连接的硬件接口
	

	
		


		
	while(1)
	{	   
	while(!(USART_RX_STA&0x8000));
	if(USART_RX_STA&0x8000)
	{		
		control = USART_RX_BUF[0];
		USART_RX_STA=0;
	}
	
	switch(control){
		case 'p':
					read_128(in);
					write_128(in);
		break;
		case 'k':
					read_128(key);
					write_128(key);
		break;
		case 'n':
		   
			while(!(USART_RX_STA&0x8000));
			loop_num = 0;
			if(USART_RX_STA&0x8000)
			{			
				len=USART_RX_STA&0x3fff;//得到此次接收到的数据长度
				for(i=0;i<len;i++){
					if(USART_RX_BUF[i]-48>10){loop_num = 1;printf("input error\r\n");;break;}
					loop_num += (USART_RX_BUF[i]-48)*pow(10,len-1-i);

//					printf("%c\r\n",USART_RX_BUF[i]);
//					printf("%d\r\n",loop_num);
				}
				printf("aaa%d\r\n",loop_num);
				USART_RX_STA=0;
			}
		break;
		case	's':
			delay_ms(1000);
			for(i=0;i<loop_num;i++){
				for(i=0;i<16;i++)
				in[i] = rand()%256;
				printf("plaintext:");
				write_128(in);
				for(i=0;i<16;i++)
				key[i] = rand()%256;
				printf("key:");
				write_128(key);
				delay_ms(10);
				AES128_ECB_encrypt(in,key,out);
				printf("Crypt:");
				write_128(out);
			}
		break;
	

	}
//	while(control == 's'){
//		delay_ms(1000);
////		for(i=0;i<16;i++)
////		in[i] = rand()%256;
//		printf("plaintext:");
//		write_128(in);
////		for(i=0;i<16;i++)
////			key[i] = rand()%256;
//		printf("key:");
//		write_128(key);
//		AES128_ECB_encrypt(in,key,out);
//		printf("Crypt:");
//		write_128(out);
//		}


	}


	return 0;	
}




