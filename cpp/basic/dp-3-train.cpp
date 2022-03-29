#include<cstdio>  
#include<algorithm>  
#include<cstring>  
using namespace std;  
const int maxn=210000;  
int a[maxn];  
int n;  
int main(){ 
    scanf("%d",&n);  
    memset(a,0x3f,sizeof(a));  
    for (int i=1;i<=n;i++){  
        int x;  
        scanf("%d",&x);  
        *lower_bound(a+1,a+n+1,x)=x;  
    }  
    printf("%d",lower_bound(a+1,a+n+1,a[0])-a-1);  
    return 0;  
}
