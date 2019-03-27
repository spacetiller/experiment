//д���򵥵�����ϰһ��,����ͨ��
//k-��ֵ�����㷨C���԰�

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>
#define TRUE             1
#define FALSE            0 
int N;//���ݸ���
int K;//���ϸ���
int * CenterIndex;//��ʼ���������������
double * Center;//���ļ���
double * CenterCopy;//���ļ��ϸ���
double * AllData;//���ݼ���
double ** Cluster;//�صļ���
int * Top;//������Ԫ�صĸ�����Ҳ������ջ����

//�������k����x(0<=x<=n-1)��Ϊ��ʼ�����ļ���
void CreateRandomArray(int n, int k,int * center)
{
     int i=0;
     int j=0;    
     srand( (unsigned)time( NULL ) );
     for( i=0;i<k;++i)//�������k����
     {
         int a=rand()%n;
         //����
         for(j=0;j<i;j++)
         {
             if(center[j]==a)//�ظ�
             {
                 break;
             }
         }
         if(j>=i)//������ظ�������
         {
             center[i]=a;
         }
         else
         {
             i--;
             //����ظ������������������
         }
     }    
}

//���ؾ�����С�����ĵ����
int GetIndex(double value,double * center)
{
     int i=0;
     int index=i;//��С���������
     double min=fabs(value-center[i]);//��������С����
     for(i=0;i<K;i++)
     {
         if(fabs(value-center[i])<min)//����ȵ�ǰ���뻹С��������С��������ź;���ֵ
         {
              index=i;
              min=fabs(value-center[i]);
         }
     }
     return index;
}

//�����������鵽����
void CopyCenter()
{
     int i=0;
     for(i=0;i<K;i++)
     {
         CenterCopy[i]=Center[i];
     }
}
//��ʼ�����ģ�������ɷ�
void InitCenter()
{
     int i=0;
     CreateRandomArray(N,K,CenterIndex);//���������K��<N�Ĳ�ͬ������
     for(i=0;i<K;i++)
     {
         Center[i]=AllData[CenterIndex[i]];//����Ӧ���ݸ�ֵ����������
     }
     CopyCenter();//���������ĸ���    
}
//����һ�����ݵ�һ��Cluster[index]����
void AddToCluster(int index,double value)
{
     Cluster[index][Top[index]++]=value;//����ͬ��ջ����
}

//���¼���ؼ���
void UpdateCluster()
{    
     int i=0;
     int tindex;
     //�����еļ�����գ�����TOP��0
     for(i=0;i<K;i++)
     {
         Top[i]=0;
     }
     for(i=0;i<N;i++)
     {
         tindex=GetIndex(AllData[i],Center);//�õ��뵱ǰ������С����������
         AddToCluster(tindex,AllData[i]);    //���뵽��Ӧ�ļ����� 
     }
}
//���¼������ļ��ϣ���ÿһ�ؼ����е�Ԫ�ؼ�����ƽ������
void UpdateCenter()
{
     int i=0;
     int j=0;
     double sum=0;
     for(i=0;i<K;i++)
     {
         sum=0;    
         //�����i��Ԫ�غ�
         for(j=0;j<Top[i];j++)
          {
              sum+=Cluster[i][j];
          }
         if(Top[i]>0)//����ô�Ԫ�ز�Ϊ��
         {
            Center[i]=sum/Top[i];//����ƽ��ֵ
         }
     }
}
//�ж�2����Ԫ���Ƿ����
int IsEqual(double * center1 ,double * center2)
{
     int i;
     for(i=0;i<K;i++)
     {
          if(fabs(center1[i]!=center2[i]))
          {
              return FALSE;
          }
     }
     return TRUE;
}
//��ӡ�ۺϽ��
void Print()
{
     int i,j;
     printf("-------------------------------------- ");
     for(i=0;i<K;i++)
     {
          printf("Group %d: core(%f) ",i,Center[i]);
           for(j=0;j<Top[i];j++)
           {
               printf("%f ",Cluster[i][j]);
           }          
     }    
}
//��ʼ������ĸ�������
void InitData()
{
     int i=0;
     int a;
     printf("Input data number: ");    
     scanf("%d",&N);
     printf("Input cluster number:");    
     scanf("%d",&K);    
     if(K>N)
     {
         exit(0);
     }
     Center=(double *)malloc(sizeof(double)*K);//Ϊ���ļ�������ռ�
     CenterIndex=(int *)malloc(sizeof(int)*K);//Ϊ���ļ�����������ռ�
     CenterCopy=(double *)malloc(sizeof(double)*K);//Ϊ���ļ��ϸ�������ռ�
     Top=(int *)malloc(sizeof(int)*K);
     AllData=(double *)malloc(sizeof(double)*N);//Ϊ���ݼ�������ռ�
     Cluster=(double **)malloc(sizeof(double *)*K);//Ϊ�ؼ�������ռ�
     //��ʼ��K���ؼ���
     for(i=0;i<K;i++)
     {
         Cluster[i]=(double *)malloc(sizeof(double)*N);
         Top[i]=0;
     }
     printf("Input %d data:",N);
     for(i=0;i<N;i++)
     {
         scanf("%d",&(a));
         AllData[i]=a;
     }
     InitCenter();//��ʼ�����ļ���      
     UpdateCluster();//��ʼ��K���ؼ���

}
/*
�㷨������
K��ֵ�㷨��
     ������ĸ���K����N������ֵ�K������ȥ��
     ʹ�����ڶ���֮�����������󣬶���֮�����������С��
*/
main()
{
     int Flag=1;//������־����Ϊfalse,���������
     int i=0;
     InitData();//��ʼ������      
     while(Flag)//��ʼ����
     {
          UpdateCluster();//���¸�������
          UpdateCenter(); //������������
          if(IsEqual(Center,CenterCopy))//������ε�����ǰ�ε����ľۺ���ȣ����������������˳�
          {
              Flag=0;
          }
          else//�������ĸ�����Ϊ���ε����õ��ĵ����ļ���
          {
              CopyCenter();//�����ĸ�����Ϊ���ε����õ��ĵ����ļ���
          }
     }
     Print();//������
     getchar();
     getchar();

}