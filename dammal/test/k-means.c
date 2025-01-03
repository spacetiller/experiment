//写个简单的先练习一下,测试通过
//k-均值聚类算法C语言版

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>
#define TRUE             1
#define FALSE            0 
int N;//数据个数
int K;//集合个数
int * CenterIndex;//初始化质心数组的索引
double * Center;//质心集合
double * CenterCopy;//质心集合副本
double * AllData;//数据集合
double ** Cluster;//簇的集合
int * Top;//集合中元素的个数，也会用作栈处理

//随机生成k个数x(0<=x<=n-1)作为起始的质心集合
void CreateRandomArray(int n, int k,int * center)
{
     int i=0;
     int j=0;    
     srand( (unsigned)time( NULL ) );
     for( i=0;i<k;++i)//随机生成k个数
     {
         int a=rand()%n;
         //判重
         for(j=0;j<i;j++)
         {
             if(center[j]==a)//重复
             {
                 break;
             }
         }
         if(j>=i)//如果不重复，加入
         {
             center[i]=a;
         }
         else
         {
             i--;
             //如果重复，本次重新随机生成
         }
     }    
}

//返回距离最小的质心的序号
int GetIndex(double value,double * center)
{
     int i=0;
     int index=i;//最小的质心序号
     double min=fabs(value-center[i]);//距质心最小距离
     for(i=0;i<K;i++)
     {
         if(fabs(value-center[i])<min)//如果比当前距离还小，更新最小的质心序号和距离值
         {
              index=i;
              min=fabs(value-center[i]);
         }
     }
     return index;
}

//拷贝质心数组到副本
void CopyCenter()
{
     int i=0;
     for(i=0;i<K;i++)
     {
         CenterCopy[i]=Center[i];
     }
}
//初始化质心，随机生成法
void InitCenter()
{
     int i=0;
     CreateRandomArray(N,K,CenterIndex);//产生随机的K个<N的不同的序列
     for(i=0;i<K;i++)
     {
         Center[i]=AllData[CenterIndex[i]];//将对应数据赋值给质心数组
     }
     CopyCenter();//拷贝到质心副本    
}
//加入一个数据到一个Cluster[index]集合
void AddToCluster(int index,double value)
{
     Cluster[index][Top[index]++]=value;//这里同进栈操作
}

//重新计算簇集合
void UpdateCluster()
{    
     int i=0;
     int tindex;
     //将所有的集合清空，即将TOP置0
     for(i=0;i<K;i++)
     {
         Top[i]=0;
     }
     for(i=0;i<N;i++)
     {
         tindex=GetIndex(AllData[i],Center);//得到与当前数据最小的质心索引
         AddToCluster(tindex,AllData[i]);    //加入到相应的集合中 
     }
}
//重新计算质心集合，对每一簇集合中的元素加总求平均即可
void UpdateCenter()
{
     int i=0;
     int j=0;
     double sum=0;
     for(i=0;i<K;i++)
     {
         sum=0;    
         //计算簇i的元素和
         for(j=0;j<Top[i];j++)
          {
              sum+=Cluster[i][j];
          }
         if(Top[i]>0)//如果该簇元素不为空
         {
            Center[i]=sum/Top[i];//求其平均值
         }
     }
}
//判断2数组元素是否相等
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
//打印聚合结果
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
//初始化聚类的各种数据
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
     Center=(double *)malloc(sizeof(double)*K);//为质心集合申请空间
     CenterIndex=(int *)malloc(sizeof(int)*K);//为质心集合索引申请空间
     CenterCopy=(double *)malloc(sizeof(double)*K);//为质心集合副本申请空间
     Top=(int *)malloc(sizeof(int)*K);
     AllData=(double *)malloc(sizeof(double)*N);//为数据集合申请空间
     Cluster=(double **)malloc(sizeof(double *)*K);//为簇集合申请空间
     //初始化K个簇集合
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
     InitCenter();//初始化质心集合      
     UpdateCluster();//初始化K个簇集合

}
/*
算法描述：
K均值算法：
     给定类的个数K，将N个对象分到K个类中去，
     使得类内对象之间的相似性最大，而类之间的相似性最小。
*/
main()
{
     int Flag=1;//迭代标志，若为false,则迭代结束
     int i=0;
     InitData();//初始化数据      
     while(Flag)//开始迭代
     {
          UpdateCluster();//更新各个聚类
          UpdateCenter(); //更新质心数组
          if(IsEqual(Center,CenterCopy))//如果本次迭代与前次的质心聚合相等，即已收敛，结束退出
          {
              Flag=0;
          }
          else//否则将质心副本置为本次迭代得到的的质心集合
          {
              CopyCenter();//将质心副本置为本次迭代得到的的质心集合
          }
     }
     Print();//输出结果
     getchar();
     getchar();

}
