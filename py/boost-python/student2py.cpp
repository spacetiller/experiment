#include <boost/python.hpp>  
#include "student.cpp"  
using namespace boost::python;  
BOOST_PYTHON_MODULE(example)  //python模块  
{  
class_<student>("student")  
.def("setname",&student::setname)  
.def("getname",&student::getname)  
.def("setage",&student::setage)  
.def("getage",&student::getage)  
.add_property("name",&student::getname,&student::setname)  
.add_property("age",&student::getage,&student::setage)  
;  
}  
