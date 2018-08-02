#include<stdio.h>
//#define KEY 3
int main(void)
{
    char MING[100];
    char MI[100];
    int k,i;
    printf("ÇëÊäÈëÃØÔ¿k£º");
    scanf("%d",&k);
    printf("\n");
    getchar();
    printf("ÇëÊäÈëÃÜÎÄ£º");
    gets(MI);
    for(i=0;MI[i]!='\0';i++)
    {
        if(MI[i]>='A'&&MI[i]<='Z')
            MING[i]=((MI[i]-'A'+26)-k)%26+'A';
        if(MI[i]>='a'&&MI[i]<='z')
            MING[i]=((MI[i]-'a'+26)-k)%26+'a';
    }
    MING[i]='\0';
    puts(MING);

    return  0;
}