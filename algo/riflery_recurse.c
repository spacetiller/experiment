/*
 * A man does the target practice. 10 shots and 89 rings got,
 *
 * Give all the possibilities, with recursion algorithm.
 *
 * License: GPL
 **/
#define SUM 89
int sum = 0;
int count = 0;
int j = 0;	// layer, or times of shot
void gotsum(int i)
{

	while(i<=10){
		sum += i;
		if( sum + (10 * (10-i)) < SUM)	return;		 
		if(sum == SUM | i==10) count ++;
		gotsum(i);
		
		i++;
	}
}
int main()
{
	int i;
	for(i=0;i<=10;i++){
	
	}
}
