#include <stdio.h>
#include <string.h>
#define    N 6

//bool mark[N+5];  // error: unknown type name ‘bool’
int mark[N+5];
int prime[N+5];
int num;
int euler[N+5];
int Min(int a,int b){return a>b?a:b;}
void Euler()
{
    int i,j;
    num = 0;
    memset(euler,0,sizeof(euler));
    memset(prime,0,sizeof(prime));
    memset(mark,0,sizeof(mark));
    euler[1] = 1; // multiply function
    for(i=2;i<=N;i++)
    {
        if(!mark[i])
        {    
            prime[num++] = i;
            euler[i] = i-1;
        }
        for(j=0;j<num;j++)
        {
            if(i*prime[j]>N){break;}
            mark[i*prime[j]] = 1;
            if(i%prime[j]==0)
            {
                euler[i*prime[j]] = euler[i]*prime[j];
                break;
            }
            else
            {
                euler[i*prime[j]] = euler[prime[j]]*euler[i];
            }
        }
    }
}

int main()
{
    int i;
    int M1,M2;
    Euler();
    for(i=0;i<num;i++)printf("%d ",prime[i]);
    printf("\n");
    for(i=1;i<=N;i++)printf("%d ",euler[i]);
    printf("\n");
    M1 = 2;
    M2 = 3;
    int sum = 0;
    int min = Min(M1,M2);
    for(i=1;i<=min;i++)
    {
        sum += euler[i]*(M1/i)*(M2/i);
    }
    printf("%d\n",sum);
}

