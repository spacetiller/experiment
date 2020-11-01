
void reverse_int32(int *i)
{
	bool *p,*q;

	p = (bool *)i;
	q = (bool *)i+1;

	while(p < q){
		if(*p == 1 && *q == 1){
			p ++;
			q --;
		}
		else{
			p ^= q;
			q ^= p;
			p ++;
			q --;
		}
	}
	printf("0x%x\n",*i);
	return;
}
int main()
{
	int i=1;
	
	reverse_int32(&i);

	return 0;
}
