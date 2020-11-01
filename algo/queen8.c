/*
 * The famous 8-queen problem
 *
 */
#include <stdlib.h>

void queen(const int total)
{
	int * site;
	int i=0,j=0,flag = 0;

	site = malloc(sizeof(int)*total);
	for(i=0;i<total;i++)
		site[i] = 0;
	i = 0;

	
	while(site[0]<total){
		for(j=0;j<i;j++){
			if(site[i] == site[j]){
				flag = 1;
				break;
			}
		}
		if(flag == 0 && site[i] != i && site[i] != total-i){ // get one, condition, var
			if(i == total-1){ //get one at last column
				for(j=0;j<total;j++)
					printf("%d",site[j]);
				printf("\n");
				
				//site[i] ++; // for queen only
				i --; // for queen only
				//continue;
			}
			else 
				i ++;	
		}
		else{
			if(site[i] == total-1)
				i --;
			site[i] ++;
		}

		//if(
	}
}

int main()
{
	queen(8);

	return 0;
}
