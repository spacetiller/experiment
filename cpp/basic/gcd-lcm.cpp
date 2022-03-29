#include <iostream>

using namespace std;

int gcd(int a,int b)
{
	if(b==0) return a;
	else return gcd(b,a%b);
}
int lcm(int a,int b)
{
	return a*b/gcd(a,b);
}
int main()
{
	int a = 6,b = 9;
	//cin>>a>>b;
	cout << "GCD : " << gcd(a,b) << endl;
	cout << "LCM : " << lcm(a,b) << endl;
	return 0;
}
