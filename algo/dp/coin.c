typedef struct {
    int nCoin; //使用硬币数量
    //以下两个成员是为了便于构造出求解过程的展示
    int lastSum;//上一个状态
    int addCoin;//从上一个状态达到当前状态所用的硬币种类
} state;

int main(){
  int i=0,j=0;
  state *sum = malloc(sizeof(state)*(total+1));

  //init
  for(i=0;i<=total;i++) 
      sum[i].nCoin = INF;
  sum[0].nCoin = 0;
  sum[0].lastSum = 0;

  for(i=1;i<=total;i++)
      for(j=0;j<n;j++)
          if(i-coin[j]>=0 && sum[i-coin[j]].nCoin+1<sum[i].nCoin)
          {
              sum[i].nCoin = sum[i-coin[j]].nCoin+1;
              sum[i].lastSum = j;
              sum[i].addCoin = coin[j];
          }

      if(sum[total].nCoin == INF) 
      {
          printf("can't make change.\n");
          return 0;
      }
      else
          printf("nCoin: %d.\n", sum[total].nCoin);

}
