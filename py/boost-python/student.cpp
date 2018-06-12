#include <iostream>  
#include <string>  
using namespace std;  
  
class student  
{  
public:  
    void setname(string str)  
    {  
        name_ = str;  
    }  
  
    string getname()  
    {  
        return name_;  
    }  
      
    void setage(int age)  
    {  
        age_ = age;  
    }  
      
    int getage()  
    {  
        return age_;  
    }  
      
private:  
    string name_;  
    int age_;  
  
};
