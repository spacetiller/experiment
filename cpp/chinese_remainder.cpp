/*long long gcd(LL a,LL b)
{
    return b==0?a:gcd(b,a%b);
}*/
#include <cstdio>
#define ll long long
//扩展欧几里得算法 
void gcd(ll a,ll b,ll &d,ll &x,ll &y)
{
    if(b==0){
        d=a;
        x=1,y=0;
    }
    else{//else不能省略 
        gcd(b,a%b,d,y,x);
        y-=(a/b)*x;
    }
}
//中国剩余定理 
ll China(int n,ll *m,ll *a)
{
    ll M=1,d,y,x=0;
    for(int i=0;i<n;i++) M*=m[i];
    for(int i=0;i<n;i++){
        ll w=M/m[i];
        gcd(m[i],w,d,d,y);
        x=(x+y*w*a[i])%M;
    }
    return (x+M)%M;
}
ll m[15],a[15];
int main()
{
    int n;
    scanf("%d",&n);
    for(int i=0;i<n;i++)
        scanf("%lld%lld",&m[i],&a[i]);
    printf("%lld",China(n,m,a));
}
