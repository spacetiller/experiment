#include <iostream>
#include "boost/signals2.hpp"
using namespace std;

void slot1(){
  cout << "solt1 call" << endl;
}

void slot2(){
    cout << "solt2 call" << endl;
}

int main(){
  boost::signals2::signal<void()> sig;  // 定义信号
  sig.connect(&slot1);  // 信号关联插槽
  sig.connect(&slot2);
  sig();  // 出发信号
  return 0;
}
