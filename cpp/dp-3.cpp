#include<stdio.h>   
#include<stdlib.h>   
#include <memory.h>    
int task_schedule(int *a,int *b,int n){       
    int i,j,sum=0,min=100000;       
    for(i=0;i<n;++i){           
        sum += a[i];       
    }
    int **t=(int **)malloc(sizeof(int*)*(n+1));     //把t构造成int t[n+1][sum+1]       for(i=0;i<=n;++i){           t[i] = (int *)malloc(sizeof(int)*(sum+1));           memset(t[i],0,sizeof(int)*(sum+1));  //数组赋初值      }
    for(i=1;i<=n;++i){           
        for(j=0;j<=sum;++j){               
            if(j<a[i-1]){                   
                t[i][j] = t[i-1][j]+b[i-1];               
            }else if(t[i-1][j-a[i-1]]>=(t[i-1][j]+b[i-1])){                   
                t[i][j] = t[i-1][j]+b[i-1];               
            }else{                   
                t[i][j] = t[i-1][j-a[i-1]];               
            }           
        }
    }       
    for(i=0;i<=sum;++i){           
        j = t[n][i]>i ? t[n][i] : i;           
        if(min>j){               
            min = j;           
        }       
    }       
    return min;   
}  
int main(){       
    int n,i;       
    scanf("%d",&n);       
    int *a=new int[n];       
    int *b=new int[n];       
    for(i=0;i<n;++i){           scanf("%d",&a[i]);       }       
    for(i=0;i<n;++i){           scanf("%d",&b[i]);      }       
    printf("%d\n",task_schedule(a,b,n));       
    return 0; 
} 
