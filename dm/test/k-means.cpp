/*kmeans�㷨ʵ�֣��˴�ֻ����Ԫ��ֻ���������Ե������ 
*@File:k_means.cpp 
*@Author:Cai0538 
*@Create:2011-12-10 
*@Last Modified:2011-12-10 
*/  
#include <iostream>  
#include <fstream>  
#include <vector>  
#include <math.h>  
#include <stdlib.h>  
#define k 3  
using namespace std;  
//���Ԫ���������Ϣ  
struct Tuple{  
    float attr1;  
    float attr2;  
};  
//��������Ԫ����ŷ�������  
float getDistXY(Tuple t1, Tuple t2)   
{  
    return sqrt((t1.attr1 - t2.attr1) * (t1.attr1 - t2.attr1) + (t1.attr2 - t2.attr2) * (t1.attr2 - t2.attr2));  
}  
  
//�������ģ�������ǰԪ�������ĸ���  
int clusterOfTuple(Tuple means[],Tuple tuple){  
    float dist=getDistXY(means[0],tuple);  
    float tmp;  
    int label=0;//��ʾ������һ����  
    for(int i=1;i<k;i++){  
        tmp=getDistXY(means[i],tuple);  
        if(tmp<dist) {dist=tmp;label=i;}  
    }  
    return label;     
}  
//��ø����ؼ���ƽ�����  
float getVar(vector<Tuple> clusters[],Tuple means[]){  
    float var = 0;  
    for (int i = 0; i < k; i++)  
    {  
        vector<Tuple> t = clusters[i];  
        for (int j = 0; j< t.size(); j++)  
        {  
            var += getDistXY(t[j],means[i]);  
        }  
    }  
    //cout<<"sum:"<<sum<<endl;  
    return var;  
  
}  
//��õ�ǰ�صľ�ֵ�����ģ�  
Tuple getMeans(vector<Tuple> cluster){  
      
    int num = cluster.size();  
    double meansX = 0, meansY = 0;  
    Tuple t;  
    for (int i = 0; i < num; i++)  
    {  
        meansX += cluster[i].attr1;  
        meansY += cluster[i].attr2;  
    }  
    t.attr1 = meansX / num;  
    t.attr2 = meansY / num;  
    return t;  
    //cout<<"sum:"<<sum<<endl;  
      
  
}  
void KMeans(vector<Tuple> tuples){  
    vector<Tuple> clusters[k];  
    Tuple means[k];  
    int i=0;  
    //Ĭ��һ��ʼ��ǰK��Ԫ���ֵ��Ϊk���ص����ģ���ֵ��  
    for(i=0;i<k;i++){  
        means[i].attr1=tuples[i].attr1;  
        means[i].attr2=tuples[i].attr2;  
    }  
    int lable=0;  
    //����Ĭ�ϵ����ĸ��ظ�ֵ  
    for(i=0;i!=tuples.size();++i){  
        lable=clusterOfTuple(means,tuples[i]);  
        clusters[lable].push_back(tuples[i]);  
    }  
    //����տ�ʼ�Ĵ�  
    for(lable=0;lable<3;lable++){  
        cout<<"The "<<lable+1<<" cluster��"<<endl;  
        vector<Tuple> t = clusters[lable];  
        for (i = 0; i< t.size(); i++)  
        {  
            cout<<"("<<t[i].attr1<<","<<t[i].attr2<<")"<<"   ";  
        }     
        cout<<endl;  
    }  
    float oldVar=-1;  
    float newVar=getVar(clusters,means);  
    while(abs(newVar - oldVar) >= 1) //���¾ɺ���ֵ����1��׼����ֵ���������Ա仯ʱ���㷨��ֹ  
    {  
          
        for (i = 0; i < k; i++) //����ÿ���ص����ĵ�  
        {  
            means[i] = getMeans(clusters[i]);  
            //cout<<"means["<<i<<"]:"<<means[i].attr1<<"  "<<means[i].attr2<<endl;  
        }  
        oldVar = newVar;  
        newVar = getVar(clusters,means); //�����µ�׼����ֵ  
        for (i = 0; i < k; i++) //���ÿ����  
        {  
            clusters[i].clear();  
        }  
        //�����µ����Ļ���µĴ�  
        for(i=0;i!=tuples.size();++i){  
            lable=clusterOfTuple(means,tuples[i]);  
            clusters[lable].push_back(tuples[i]);  
        }  
        //�����ǰ�Ĵ�  
        for(lable=0;lable<3;lable++){  
            cout<<"The "<<lable+1<<" cluster: "<<endl;  
            vector<Tuple> t = clusters[lable];  
            for (i = 0; i< t.size(); i++)  
            {  
                cout<<"("<<t[i].attr1<<","<<t[i].attr2<<")"<<"   ";  
            }     
            cout<<endl;  
        }  
    }  
      
}  
int main(){  
  
    char fname[256];  
    cout<<"Input data file: ";  
    cin>>fname;  
    cout<<endl;  
    ifstream infile;  
    infile.open(fname,ios::in);  
    if(!infile){  
        cout<<"can't open file "<<fname<<endl;  
        return 0;  
    }  
    int count=0;  
    vector<Tuple> tuples;  
    Tuple tuple;  
    //���ļ����ж�������  
    while(!infile.eof()){  
        count++;  
        if(count%2==1) infile>>tuple.attr1;  
        else {  
            infile>>tuple.attr2;  
            tuples.push_back(tuple);  
        }  
    }  
    //int k;  
    //cout<<"�����������Ĵصĸ�����"  
    //cin>>k;  
    //cout<<endl;  
  
    //����ļ��е�Ԫ����Ϣ  
    for(vector<Tuple>::size_type ix=0;ix!=tuples.size();++ix)  
        cout<<"("<<tuples[ix].attr1<<","<<tuples[ix].attr2<<")"<<"    ";  
    cout<<endl;  
    KMeans(tuples);  
    return 0;  
}  