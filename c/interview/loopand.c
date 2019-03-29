#include <stdio.h>
#include <string.h>

int func(x) 
{ 

	int countx = 0; 
	
	while(x) 
	{ 
		printf("0x%x, 4x%x\n",x,x-1);
		countx ++; 
		x = x&(x-1); 
		printf("0x%x\n",x);
	} 
	return countx; 
} 

int main(){
	int i = 7;
	printf("%d result: %d\n",i,func(i));
	return 0;
}
