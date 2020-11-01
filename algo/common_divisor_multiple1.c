/*
 *
 *
 */
int max(int a,int b)
{
	return a>b?a:b;
}
void common_div_mul(int a,int b)
{
	int cdiv,cmul;
	int m;
	
	if(a == b)
		cdiv = cmul = a;
	
	else{
		for(m=max(a,b);m>0;m--)
			if(a%m == 0 && b%m == 0){
				cdiv = m;
				break;
			}
			
		cmul = a*b/cdiv;
	}

	printf("for %d,%d\nthe largest common divisor is:  %d\nthe least common multiple is: %d\n",a,b,cdiv,cmul);
	return;
}
int main()
{
	int a,b;

	printf("Enter two numbers: (num1,num2)\n");
	scanf("%d,%d",&a,&b);
	common_div_mul(a,b);

	return 0;
}
