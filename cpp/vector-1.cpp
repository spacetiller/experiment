#include <iostream>
#include <vector>

using namespace std;

int main(){
	vector<int> vec;

	vec.push_back(6);
	vec.push_back(9);
	vec.insert(vec.begin()+1,2);
	vec.insert(vec.begin()+2,3);
	vec.erase(vec.begin()+2);
	
	// vec.size()
	// vec.clear()
	
	//vector<int>::iterator it = vec.begin();  
	for(vector<int>::iterator iter=vec.begin();iter!=vec.end();iter++){
		cout << (*iter) ;	
	}
	cout <<endl;	
}
