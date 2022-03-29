#include <iostream>
#include <vector>
using std::vector;
using namespace std;

template <typename T>
int compare(const T &v1, const T &v2){
	//cout << (int *)(v1) << endl;
	if(v1 < v2) return -1;
	if(v2 < v1) return 1;
	return 0;
}

int main(){
	vector<int> v1{1,2,3}, v2{4,5,6};
	std::cout << compare(v1, v2) << endl;
}
