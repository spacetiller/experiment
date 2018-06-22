#include "boost/test/minimal.hpp"
#include "boost/format.hpp"
#include "iostream"

int test_main(int argc, char *argv[])           // 测试主函数，不需要在定义main()
{
    using namespace boost;
    format fmt("%d-%d");

    BOOST_CHECK(fmt.size() == 0);               // 验证fmt对象初始化，不通过继续执行
    
    fmt % 12 % 34;
    
    BOOST_REQUIRE(fmt.str() == "12-34");        // 验证结果，不通过则不予执行
    
    BOOST_ERROR("演示一条错误信息");                // 打印一条错误信息，继续执行

    fmt.clear();
    fmt % 12;
    try {
        std::cout << fmt;
    }
    catch (...) {
        BOOST_FAIL("致命错误，测试终止");            // 给出一个错误信息，终止执行
    }
    
    return 0;
}

