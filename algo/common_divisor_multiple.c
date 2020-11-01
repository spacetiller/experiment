/*
 *
 *
 */
void swap(int *a,int *b)
{
	int *tmp;
	tmp = a;
	a = b;
	b = tmp;

	return;
}
void common_div_mul(int a,int b)
{
	int cdiv,cmul;
	int tmp;
	
	cmul = a*b;
	
	if(a < b)
		swap(&a,&b);
	
	while(1){
		tmp = a%b;
		if(tmp == 0) break;
		a = b;
		b = tmp;
	}
	cdiv = b;
	cmul /= cdiv;

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
