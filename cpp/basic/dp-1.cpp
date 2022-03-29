#include <stdio>
#include <streamio>
using namespace std;
int T[10000]={0};  //T数组的范围是A[i]的总和suma
int main()
{
    int n,i,k;
 int A[210],B[210];
 while(cin>>n)
 {
  int suma=0,sumb=0;
  memset(T,0,sizeof(T));
  for(i=1;i<=n;i++)
  {
   cin>>A[i];
   suma+=A[i];
  }
  for(i=1;i<=n;i++)
  {
   cin>>B[i];
   sumb+=B[i];
  }
  for(k=1;k<=n;k++)
  {
   for(i=suma;i>=0;i--)
   {
    if(i>=A[k])
    {
     T[i]=T[i-A[k]]
    }
    else T[i]=T[i]+B[k];
   }
  }
  int min=INT_MAX;
  for(i=0;i<=suma;i++)
  {
   k=i>T[i]?i:T[i];
   if(k
    min=k;
  }
  printf("%d\n",min);
 }
 return 0;
}
