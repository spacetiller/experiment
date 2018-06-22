#ifndef POLYGON_HPP
#define POLYGON_HPP
class polygon {
protected:
    double side_length_;
public:
    polygon()
        : side_length_(0) {}
    virtual ~polygon() {}
    void set_side_length(double side_length) {
        side_length_ = side_length;
}
    virtual double area() const = 0;
};
// the types of the class factories
typedef polygon* create_t();                   //这里我喜欢定义成函数指针typedef polygon* (*create_t)(),这样后面就可以直接定义函数指针变量
typedef void destroy_t(polygon*); 
#endif　　　　//typedef void (*destroy_t)(polygon*) 同理
