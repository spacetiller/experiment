#include<stdio.h>
//#define KEY 3
int main(void)
{
    char MING[1000];
    char MI[1000];
    int k,i;
    printf("请输入秘钥k：");
    scanf("%d",&k);
    printf("\n");
    getchar();
    printf("请输入明文：");
    gets(MING);
    for(i=0;MING[i]!='\0';i++)
    {
        if(MING[i]<65)
            MI[i]=MING[i];
        if(MING[i]>='A'&&MING[i]<='Z')
            MI[i]=((MING[i]-'A')+k)%26+'A';
        if(MING[i]>='a'&&MING[i]<='z')
            MI[i]=((MING[i]-'a')+k)%26+'a';
    }
    MI[i]='\0';
    puts(MI);

    return  0;
}
