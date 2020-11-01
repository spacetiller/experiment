/*
 *	select a subset from a set, show the possible situations
 *	permutation and combination
 */
#include <stdlib.h>
void cmr(int m,int r)
{
	static int n = 0;
	static int * tmp;
	int i;
	
	tmp = malloc(sizeof(int)*r);
	if(m<r || m<1 || r<1){
		printf("Subset more than the whole set.\n");
		return;
	}

	for(i=0;i<m;i++){
		if(n == r){
			 ;	
		}
		else{
			return cmr(m-1,r-1);
		}
	}
}

int main()
{
	int m[5] = {1,2,3,4,5};
	cmr(5,3);
}
