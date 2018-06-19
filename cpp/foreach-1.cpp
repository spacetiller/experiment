#include <iostream>
#include <vector>

void add (int& lhs){
	lhs = lhs + 1;
}

int intArr[] = {1,2,3,4,5};
vector<int> intVec(intArr, intArr + 5);

for(vector<int>::iterator iter=intVector.begin();iter!=intVector.end();iter++){
	add(*iter);
}

BOOST_FOREACH(int& a,intVector) {
	add(a);
}

for_each(intVector.begin(),intVector.end(),add);
for_each(intVector.begin(),intVector.end(),boost::bind(add,_1,100)); 

cout << "After: " << intVec[0] << endl;
