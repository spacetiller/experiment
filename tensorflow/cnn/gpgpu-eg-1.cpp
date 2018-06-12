#include <iostream> 
#include "../CTimer/CTimer.h"  
#include "../CSystem/CSystem.h"  
  
#define WIDTH       1024                    //��ά����Ŀ�  
#define HEIGHT      1024                    //��ά����ĸ�  
#define CHANNEL     4                   //ͨ����  
#define RADIUS      2                   //��Ĥ�뾶  
  
using namespace std;  
  
int main(int argc, char **argv)  
{  
    int nState = EXIT_SUCCESS;  

    int unWidth = (int)WIDTH;  
    int unHeight = (int)HEIGHT;  
    int unChannel = (int)CHANNEL;  
    int unRadius = (int)RADIUS;  
  
    //�����������  
    float ***fX;  
    int unData = 0;  
    CSystem<float>::allocate(unHeight, unWidth, unChannel, fX);  
    for(int i=0; i<unHeight; i++)  
        for(int j=0; j<unWidth; j++)  
            for(int k=0; k<unChannel; k++){  
                fX[k][j][i] = (float)unData;unData++;  
        }  
  
    //׼���������  
    float ***fY;  
    CSystem<float>::allocate(unHeight, unWidth, unChannel, fY);  
    for(int i=0; i<unHeight; i++)  
        for(int j=0; j<unWidth; j++)  
            for(int k=0; k<unChannel; k++){  
                fY[k][j][i] = 0.0f;  
        }  
  
    //���  
    float fSum = 0.0f;  
    int unTotal = 0;  
    CTimer timer;  
    timer.reset();  
  
    for(int i=0; i<unHeight; i++)  
        for(int j=0; j<unWidth; j++)  
            for(int k=0; k<unChannel; k++){  
                for(int iii=i-unRadius; ii<=i+unRadius; ii++)  
                    for(int jjj=j-unRadius; jj<=j+unRadius; jj++){  
                        if(ii>=0 && jj>=0 && ii<unHeight && jj<   
                        unWidth){  
                            fSum += fX[k][jj][ii];  
                            unTotal++;  
                        }  
                    }  
                fY[k][j][i] = fSum / (float)unTotal;  
                unTotal = 0;  
                fSum = 0.0f;  
            }  
  

    long lTime = timer.getTime();  
    cout<<"Time elapsed: "<<lTime<<" milliseconds."<<endl;  
  
    CSystem<float>::deallocate(fX);  
    CSystem<float>::deallocate(fY);  
    return nState;  
}  