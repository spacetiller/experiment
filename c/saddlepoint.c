#include<stdio.h>


#define Max 100

void main( )

{

      int zf[Max][Max];


      int flag;


      int Ad,Ad_col;

     

      int m,n;


      int i,j,k;


      printf("��������Ҫ֧�����������������:");

      scanf("%d%d",&m,&n);


      printf("������֧������:\n");

      for(i=0;i<m;i++)

             for(j=0;j<n;j++)

                    scanf("%d",&zf[i][j]);


      for(i=0;i<m;i++)

      {

             Ad=zf[i][0];

             Ad_col=0;


             for(j=1;j<n;j++)

                    if(zf[i][j]>Ad)

                    {

                           Ad=zf[i][j];

                           Ad_col=j;

                    }

     

             flag=1;


             for(k=0;k<m;k++)

                    if(Ad>zf[k][Ad_col])

                    {

                           flag=0;

                           break;

                    }


             if(flag)

             {

                    printf("��֧�������а��� %d, λ�ڵ� %d �е� %d ��.\n",Ad,i+1,Ad_col+1);

                    break;

             }

      }


      if(!flag)

      {

                    printf("��֧������û�а���.\n");

      }

}