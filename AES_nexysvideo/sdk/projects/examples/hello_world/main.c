#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "aes.h"



extern void mdelay(uint32_t ms);

void read_128(uint8_t* in){

//	    for(i=0;i<16;i++){
//				in[i] = USART_RX_BUF[i];
//			}
    scanf("%hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd %hhd",
           &in[ 0],&in[ 1],&in[ 2],&in[ 3],
           &in[ 4],&in[ 5],&in[ 6],&in[ 7],
           &in[ 8],&in[ 9],&in[10],&in[11],
           &in[12],&in[13],&in[14],&in[15]);
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


int main(void)
{
	
	uint32_t loop_num=1;
	uint8_t key[16] = {0};
    uint8_t in[16] = {0};
    uint8_t out[16] = {0};
	LED_Init();
	int i;
	while(1)
	{	   
			

			LED_ON();
			mdelay(1000);
			for(i=0;i<loop_num;i++){
				for(i=0;i<16;i++)
				in[i] = rand()%256;
				printf("plaintext:");
				write_128(in);
				for(i=0;i<16;i++)
				key[i] = rand()%256;
				printf("key:");
				write_128(key);
				AES128_ECB_encrypt(in,key,out);
				printf("Crypt:");
				write_128(out);
			}
			LED_OFF();
			mdelay(1000);
	

	}

    return 0;
}

